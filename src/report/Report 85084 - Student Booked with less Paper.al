report 85084 "Student Booked with less Paper"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Student Booked with less Paper.rdlc';

    dataset
    {
        dataitem("Examination Account";"Examination Account")
        {
            DataItemTableView = WHERE(Status=CONST(Active));
            column(NoOfPapers;NoOfPapers)
            {
            }
            column(NoOfExemption;NoOfExemption)
            {
            }
            column(NoOfFailedPapers;NoOfFailedPapers)
            {
            }
            column(Found;Found)
            {
            }
            column(NoofFailedPapers_ExaminationAccount;"Examination Account"."No of Failed Papers")
            {
            }
            column(NoOfBookedPapers_ExaminationAccount;"Examination Account"."No Of Booked Papers")
            {
            }
            column(NoOfExemptedPapers_ExaminationAccount;"Examination Account"."No Of Exempted Papers")
            {
            }
            column(RegistrationNo_ExaminationAccount;"Examination Account"."Registration No.")
            {
            }
            column(StudentCustNo_ExaminationAccount;"Examination Account"."Student Cust No.")
            {
            }
            column(CourseID_ExaminationAccount;"Examination Account"."Course ID")
            {
            }
            column(CourseDescription_ExaminationAccount;"Examination Account"."Course Description")
            {
            }
            column(CurrentExaminationSitting_ExaminationAccount;"Examination Account"."Current Examination Sitting")
            {
            }
            column(FirstName_ExaminationAccount;"Examination Account"."First Name")
            {
            }
            column(MiddleName_ExaminationAccount;"Examination Account"."Middle Name")
            {
            }
            column(Surname_ExaminationAccount;"Examination Account".Surname)
            {
            }
            column(IDNo_ExaminationAccount;"Examination Account"."ID No.")
            {
            }
            column(RegistrationDate_ExaminationAccount;"Examination Account"."Registration Date")
            {
            }
            column(CurrencyCode_ExaminationAccount;"Examination Account"."Currency Code")
            {
            }
            column(Address_ExaminationAccount;"Examination Account".Address)
            {
            }
            column(Address2_ExaminationAccount;"Examination Account"."Address 2")
            {
            }
            column(City_ExaminationAccount;"Examination Account".City)
            {
            }
            column(PhoneNo_ExaminationAccount;"Examination Account"."Phone No.")
            {
            }
            column(CountryRegionCode_ExaminationAccount;"Examination Account"."Country/Region Code")
            {
            }
            column(PostCode_ExaminationAccount;"Examination Account"."Post Code")
            {
            }
            column(County_ExaminationAccount;"Examination Account".County)
            {
            }
            column(Email_ExaminationAccount;"Examination Account".Email)
            {
            }
            column(BlockedStartDate_ExaminationAccount;"Examination Account"."Blocked Start Date")
            {
            }
            column(BlockedEndDate_ExaminationAccount;"Examination Account"."Blocked End Date")
            {
            }
            column(Blocked_ExaminationAccount;"Examination Account".Blocked)
            {
            }
            column(CollectionDate_ExaminationAccount;"Examination Account"."Collection Date")
            {
            }
            column(CollectedByName_ExaminationAccount;"Examination Account"."Collected By Name")
            {
            }
            column(CollectedByIDNo_ExaminationAccount;"Examination Account"."Collected By ID No.")
            {
            }
            column(CollectedByEmail_ExaminationAccount;"Examination Account"."Collected By Email")
            {
            }
            column(IssuedByOfficer_ExaminationAccount;"Examination Account"."Issued By Officer")
            {
            }
            column(IssuedByOfficerName_ExaminationAccount;"Examination Account"."Issued By Officer Name")
            {
            }
            column(CertificateNo_ExaminationAccount;"Examination Account"."Certificate No.")
            {
            }
            column(IssuedByUserID_ExaminationAccount;"Examination Account"."Issued By User ID")
            {
            }
            column(RenewalPending_ExaminationAccount;"Examination Account"."Renewal Pending")
            {
            }
            column(LastModifiedDateTime_ExaminationAccount;"Examination Account"."Last Modified Date Time")
            {
            }
            column(LastDateModified_ExaminationAccount;"Examination Account"."Last Date Modified")
            {
            }
            column(LastRenewalDate_ExaminationAccount;"Examination Account"."Last Renewal Date")
            {
            }
            column(Status_ExaminationAccount;"Examination Account".Status)
            {
            }
            column(RenewalAmount_ExaminationAccount;"Examination Account"."Renewal Amount")
            {
            }
            column(ReActivationAmount_ExaminationAccount;"Examination Account"."Re-Activation Amount")
            {
            }
            column(Name_ExaminationAccount;"Examination Account".Name)
            {
            }
            column(NextRenewalDate_ExaminationAccount;"Examination Account"."Next Renewal Date")
            {
            }
            column(RenewalDateL_ExaminationAccount;"Examination Account"."Renewal Date L")
            {
            }
            column(RenewalYear_ExaminationAccount;"Examination Account"."Renewal Year")
            {
            }
            column(Transfered_ExaminationAccount;"Examination Account".Transfered)
            {
            }
            column(TransferedBy_ExaminationAccount;"Examination Account"."Transfered By")
            {
            }
            column(TransferDate_ExaminationAccount;"Examination Account"."Transfer Date")
            {
            }
            column(StatusRemarks_ExaminationAccount;"Examination Account"."Status Remarks")
            {
            }
            column(Balance_ExaminationAccount;"Examination Account".Balance)
            {
            }
            column(BalanceLCY_ExaminationAccount;"Examination Account"."Balance (LCY)")
            {
            }

            trigger OnAfterGetRecord()
            begin
                NoOfPapers:=0;
                NoOfExemption:=0;
                NoOfFailedPapers:=0;
                /*ExamBookingEntries.RESET;
                ExamBookingEntries.SETRANGE(Status,ExamBookingEntries.Status::Open);
                ExamBookingEntries.SETRANGE("Student Reg No.","Examination Account"."Registration No.");
                IF NOT ExamBookingEntries.FINDFIRST THEN BEGIN
                  CurrReport.SKIP;
                  END;
                
                ExamBookingEntries.RESET;
                ExamBookingEntries.SETRANGE(Status,ExamBookingEntries.Status::Open);
                ExamBookingEntries.SETRANGE("Student Reg No.","Examination Account"."Registration No.");
                IF ExamBookingEntries.FINDSET THEN BEGIN
                  REPEAT
                    NoOfFailedPapers:=NoOfFailedPapers+1;
                  UNTIL ExamBookingEntries.NEXT=0;
                END;
                
                ExamBookingEntries.RESET;
                ExamBookingEntries.SETRANGE(Status,ExamBookingEntries.Status::Open);
                ExamBookingEntries.SETRANGE("Student Reg No.","Examination Account"."Registration No.");
                IF ExamBookingEntries.FINDSET THEN BEGIN
                  REPEAT
                  //IF ExamBookingEntries.COUNT > 3 THEN
                    //CurrReport.SKIP;
                  NoOfPapers:=NoOfPapers+1;//ExamBookingEntries.COUNT;
                  UNTIL ExamBookingEntries.NEXT=0;
                  ExemptionEntries.RESET;
                  ExemptionEntries.SETRANGE(Level,ExamBookingEntries.Part);
                  ExemptionEntries.SETRANGE(Deleted,FALSE);
                  IF ExemptionEntries.FINDSET THEN BEGIN
                    REPEAT
                      NoOfExemption:=NoOfExemption+1;
                      UNTIL ExemptionEntries.NEXT=0;
                    END;
                
                END;
                IF NoOfFailedPapers=NoOfPapers THEN
                  CurrReport.SKIP;
                IF (NoOfPapers+NoOfExemption)> 3 THEN
                  CurrReport.SKIP;*/
                
                "Examination Account".CalcFields("Examination Account"."No of Failed Papers","Examination Account"."No Of Exempted Papers","Examination Account"."No Of Booked Papers");
                if "Examination Account"."No Of Booked Papers"=0 then
                CurrReport.Skip;
                if ("Examination Account"."No Of Booked Papers")<"Examination Account"."No of Failed Papers" then
                Found:=true;
                if ("Examination Account"."No Of Booked Papers"+"Examination Account"."No Of Exempted Papers") < "Examination Account"."No of Failed Papers"  then
                Found:=true;
                if ("Examination Account"."No Of Booked Papers"+"Examination Account"."No Of Exempted Papers") <3 then
                Found:=true;

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

    var
        ExamBookingEntries: Record "Exam Booking Entries";
        ExemptionEntries: Record "Exemption Entries";
        NoOfPapers: Integer;
        NoOfExemption: Integer;
        NoOfFailedPapers: Integer;
        Found: Boolean;
}

