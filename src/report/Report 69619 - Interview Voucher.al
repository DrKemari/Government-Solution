report 69619 "Interview Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Interview Voucher.rdlc';

    dataset
    {
        dataitem("PreScreen Header";"PreScreen Header")
        {
            column(Description;Description)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(DocumentType_PreScreenHeader;"PreScreen Header"."Document Type")
            {
            }
            column(DocumentNo_PreScreenHeader;"PreScreen Header"."Document No.")
            {
            }
            column(DocumentDate_PreScreenHeader;"PreScreen Header"."Document Date")
            {
            }
            column(VacancyID_PreScreenHeader;"PreScreen Header"."Vacancy ID")
            {
            }
            column(LeadHROfficer_PreScreenHeader;"PreScreen Header"."Lead HR Officer")
            {
            }
            column(Description_PreScreenHeader;"PreScreen Header".Description)
            {
            }
            column(AbilityTestID_PreScreenHeader;"PreScreen Header"."Ability Test ID")
            {
            }
            column(MaximumTestDurationMin_PreScreenHeader;"PreScreen Header"."Maximum Test Duration(Min)")
            {
            }
            column(PhoneInterviewTemplateID_PreScreenHeader;"PreScreen Header"."Phone Interview Template ID")
            {
            }
            column(PositionID_PreScreenHeader;"PreScreen Header"."Position ID")
            {
            }
            column(JobTitleDesignation_PreScreenHeader;"PreScreen Header"."Job Title/Designation")
            {
            }
            column(NoofOpenings_PreScreenHeader;"PreScreen Header"."No. of Openings")
            {
            }
            column(Directorate_PreScreenHeader;"PreScreen Header".Directorate)
            {
            }
            column(Department_PreScreenHeader;"PreScreen Header".Department)
            {
            }
            column(RegionID_PreScreenHeader;"PreScreen Header"."Region ID")
            {
            }
            column(PlannedStartDate_PreScreenHeader;"PreScreen Header"."Planned Start Date")
            {
            }
            column(PlannedEndDate_PreScreenHeader;"PreScreen Header"."Planned End Date")
            {
            }
            column(DocumentStatus_PreScreenHeader;"PreScreen Header"."Document Status")
            {
            }
            column(CreatedBy_PreScreenHeader;"PreScreen Header"."Created By")
            {
            }
            column(CreatedOn_PreScreenHeader;"PreScreen Header"."Created On")
            {
            }
            column(Posted_PreScreenHeader;"PreScreen Header".Posted)
            {
            }
            column(NoSeries_PreScreenHeader;"PreScreen Header"."No. Series")
            {
            }
            dataitem("PreScreening Line";"PreScreening Line")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
                column(DocumentType_PreScreeningLine;"PreScreening Line"."Document Type")
                {
                }
                column(DocumentNo_PreScreeningLine;"PreScreening Line"."Document No.")
                {
                }
                column(VacancyID_PreScreeningLine;"PreScreening Line"."Vacancy ID")
                {
                }
                column(ApplicationNo_PreScreeningLine;"PreScreening Line"."Application No.")
                {
                }
                column(CandidateNo_PreScreeningLine;"PreScreening Line"."Candidate No.")
                {
                }
                column(FirstName_PreScreeningLine;"PreScreening Line"."First Name")
                {
                }
                column(MiddleName_PreScreeningLine;"PreScreening Line"."Middle Name")
                {
                }
                column(LastName_PreScreeningLine;"PreScreening Line"."Last Name")
                {
                }
                column(EmployeeNo_PreScreeningLine;"PreScreening Line"."Employee No.")
                {
                }
                column(PhoneNo_PreScreeningLine;"PreScreening Line"."Phone No.")
                {
                }
                column(MobilePhoneNo_PreScreeningLine;"PreScreening Line"."Mobile Phone No.")
                {
                }
                column(Email_PreScreeningLine;"PreScreening Line".Email)
                {
                }
                column(PlannedStartDate_PreScreeningLine;"PreScreening Line"."Planned Start Date")
                {
                }
                column(TestStartTime_PreScreeningLine;"PreScreening Line"."Test Start Time")
                {
                }
                column(TestEndTime_PreScreeningLine;"PreScreening Line"."Test End Time")
                {
                }
                column(AbilityTestResponseID_PreScreeningLine;"PreScreening Line"."Ability Test Response ID")
                {
                }
                column(AbilityTestPassScore_PreScreeningLine;"PreScreening Line"."Ability Test Pass Score %")
                {
                }
                column(PhoneInterviewOutcome_PreScreeningLine;"PreScreening Line"."Phone Interview Outcome")
                {
                }
                column(Notified_PreScreeningLine;"PreScreening Line".Notified)
                {
                }
                column(DateTimeNotified_PreScreeningLine;"PreScreening Line"."DateTime Notified")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                Description:=Format("PreScreen Header"."Document Type");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        Description: Text;
}

