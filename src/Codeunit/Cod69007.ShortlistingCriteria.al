#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 69007 "Shortlisting Criteria"
{

    trigger OnRun()
    begin
    end;

    var
        NoOfYears: Decimal;
        Age: Integer;
        ApplicantNoOfYears: Decimal;
        ApplicantBackground1: Record "Applicant Background";
        Tenure: Integer;
        TableId: Integer;
        ApplicationTable: Record "Job Application Table";
        EvaluateValue: Boolean;

    procedure BasedOnCriteria(VacancyRequisitionLines: Record "Vacancy Requisition Lines")
    var
        Application: Record "Job Application Table";
        ShortlistCriteria: Record "Shortlist Criteria";
        CriteriaSetup: Record "Criteria Setup";
        ApplicantBackground: Record "Applicant Background";
    begin
        Application.Reset;
        Application.SetRange("Vacancy Requisition No.",VacancyRequisitionLines."Requisition No.");
        if Application.FindSet then begin
          repeat
            Application.Shortlisted:=ShortList(Application);
            Application.Modify(true);

            until Application.Next=0;

          end
    end;

    local procedure ShortList(JobApplicationTable: Record "Job Application Table") Shortlisted: Boolean
    var
        ShortlistCriteria: Record "Shortlist Criteria";
        CriteriaSetup: Record "Criteria Setup";
        ApplicantBackground: Record "Applicant Background";
        Passed: Boolean;
    begin
        Shortlisted:=false;
        ShortlistCriteria.Reset;
        ShortlistCriteria.SetRange("Requisition No.",JobApplicationTable."Vacancy Requisition No.");
        Passed:=true;
        if ShortlistCriteria.FindSet then begin
          repeat

                   if (ShortlistCriteria.Type=ShortlistCriteria.Type::Education) and (Passed=true)then begin
                  //check
                  ApplicantBackground.Reset;
                  ApplicantBackground.SetRange("Application No",JobApplicationTable."Application No");
                  ApplicantBackground.SetRange(Attainment,ShortlistCriteria.Requirement);
                  if  ApplicantBackground.FindSet then begin
                   Passed:=true;
                   Shortlisted:=true;
                  end
                  else begin
                          Passed:=false;
                   end;
                   end else  if (ShortlistCriteria.Type=ShortlistCriteria.Type::"Professional Qualification") and (Passed=true)then begin
                      ApplicantBackground.Reset;
                      ApplicantBackground.SetRange("Application No",JobApplicationTable."Application No");
                      ApplicantBackground.SetRange(Attainment,ShortlistCriteria.Requirement);
                      if ApplicantBackground.FindSet then begin

                          Passed:=true;
                          Shortlisted:=true;

                      end
                      else begin
                          Passed:=false;
                        Shortlisted:=false;
                      end;
                    end//
                    else  if (ShortlistCriteria.Type=ShortlistCriteria.Type::"Professional Body") and (Passed=true)then begin
                      ApplicantBackground.Reset;
                      ApplicantBackground.SetRange("Application No",JobApplicationTable."Application No");
                      ApplicantBackground.SetRange(Institution,ShortlistCriteria.Requirement);
                      if ApplicantBackground.FindSet then begin

                          Passed:=true;
                          Shortlisted:=true;

                      end
                      else begin
                          Passed:=false;
                        Shortlisted:=false;
                      end
                    end
                    else  if (ShortlistCriteria.Type=ShortlistCriteria.Type::Employment) and (Passed=true)then begin
                      ApplicantBackground.Reset;
                      ApplicantBackground.SetRange("Application No",JobApplicationTable."Application No");
                      ApplicantBackground.SetRange(Type,ShortlistCriteria.Type::Employment);
                      if ApplicantBackground.FindSet then begin
                         //calculate the total no of years
                      NoOfYears:=TotalYears(ApplicantBackground);
                          if Format(NoOfYears)>ShortlistCriteria.Requirement then begin
                            Passed:=true;
                            Shortlisted:=true;
                          end;
                        end
                      else begin
                          Passed:=false;
                        Shortlisted:=false;
                      end
                    end
                    else  if (ShortlistCriteria.Type=ShortlistCriteria.Type::General) and (Passed=true) and (ShortlistCriteria."General Category"=Format(CriteriaSetup."general categories"::Convicted))then begin
                     ApplicationTable.Reset;
                     ApplicationTable.SetRange("Application No",JobApplicationTable."Application No");
                     Evaluate(EvaluateValue,ShortlistCriteria.Requirement);
                     ApplicationTable.SetRange(Convicted,EvaluateValue);
                     if ApplicationTable.FindSet then begin
                         Passed:=true;
                         Shortlisted:=true;
                        end
                      else begin
                          Passed:=false;
                        Shortlisted:=false;
                      end
                    end
                     else
                    Shortlisted:=false;
                 until ShortlistCriteria.Next = 0;
          end else begin
           Message('There is no criteria found');
            end;
        exit(Shortlisted);
    end;

    local procedure TotalYears(Employment: Record "Applicant Background") NumberOfYears: Decimal
    var
        EmploymentHistory: Record "Applicant Background";
        NoOfDays: Decimal;
        YearsCalculated: Decimal;
    begin
        EmploymentHistory.Reset;
        EmploymentHistory.SetRange("Application No",Employment."Application No");
        NumberOfYears:=0.0;
        if EmploymentHistory.FindSet then begin
          repeat
           NoOfDays:=EmploymentHistory."To Date" - EmploymentHistory."From Date";
           NumberOfYears:=NumberOfYears+NoOfDays/365;
           until EmploymentHistory.Next=0;
        end;
        exit(NumberOfYears);
    end;
}

