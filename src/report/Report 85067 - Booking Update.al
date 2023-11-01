report 85067 "Booking Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Booking Update.rdlc';

    dataset
    {
        dataitem("Examination Account";"Examination Account")
        {
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

            trigger OnAfterGetRecord()
            var
                StudentProcessingLines: Record "Student Processing Lines";
                ExamBookingEntries: Record "Exam Booking Entries";
                Examination: Codeunit Examination;
            begin
                // // StudentProcessingLines.RESET;
                // // StudentProcessingLines.SETRANGE("Booking Header No.","Student Processing Header"."No.");
                // // IF StudentProcessingLines.FINDSET THEN BEGIN
                // //  REPEAT
                // //    IF StudentProcessingLines.Paper<>'' THEN BEGIN
                // //      StudentProcessingLines."Transaction Type":=StudentProcessingLines."Transaction Type"::Booking;
                // //      StudentProcessingLines.MODIFY(TRUE);
                // //     END
                // //  UNTIL StudentProcessingLines.NEXT=0;
                // // END
                // //if booking posted and no entries post again
                // ExamBookingEntries.RESET;
                // ExamBookingEntries.SETRANGE(Code,"Student Processing Header"."No.");
                // IF NOT ExamBookingEntries.FINDSET THEN BEGIN
                //  Examination.PostExaminationVoucher("Student Processing Header");
                //  IF "Student Processing Header".Image.HASVALUE THEN BEGIN
                //  Examination.BookingSendReceipt("Student Processing Header");
                //  END
                //  END
                if "Examination Account"."Renewal Pending"=0 then begin
                  "Examination Account"."Renewal Amount":=0;
                  "Examination Account".Modify(true);
                  end
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
        ProcessingHeader: Record "Student Processing Header";
}

