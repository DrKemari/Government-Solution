report 85079 "Booked less Than 3 Papers"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Booked less Than 3 Papers.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            DataItemTableView = WHERE("Document Type"=FILTER(Booking),Posted=CONST(true));
            RequestFilterFields = "Examination Sitting","Examination ID";
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(StudentNo_StudentProcessingHeader;"Student Processing Header"."Student No.")
            {
            }
            column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
            {
            }
            column(IDNumberPassportNo_StudentProcessingHeader;"Student Processing Header"."ID Number/Passport No.")
            {
            }
            column(ExaminationID_StudentProcessingHeader;"Student Processing Header"."Examination ID")
            {
            }
            column(ExaminationDescription_StudentProcessingHeader;"Student Processing Header"."Examination Description")
            {
            }
            column(StudentRegNo_StudentProcessingHeader;"Student Processing Header"."Student Reg. No.")
            {
            }
            column(ShowValue;ShowValue)
            {
            }
            column(PhoneNo_StudentProcessingHeader;"Student Processing Header"."Phone No.")
            {
            }
            column(PostCode_StudentProcessingHeader;"Student Processing Header"."Post Code")
            {
            }
            column(County_StudentProcessingHeader;"Student Processing Header".County)
            {
            }
            column(Email_StudentProcessingHeader;"Student Processing Header".Email)
            {
            }
            column(TotalPapers1;TotalPapers1)
            {
            }
            column(TotalPapers;TotalPapers)
            {
            }

            trigger OnAfterGetRecord()
            begin
                ShowValue:=false;
                TotalPapers:=0;
                TotalPapers1:=0;
                ExamBookingEntries.Reset;
                ExamBookingEntries.SetRange("Student Reg No.","Student Processing Header"."Student Reg. No.");
                ExamBookingEntries.SetRange(Status,ExamBookingEntries.Status::Open);
                ExamBookingEntries.SetRange("Exam Sitting","Student Processing Header"."Examination Sitting");
                if ExamBookingEntries.FindSet then begin
                   TotalPapers:=ExamBookingEntries.Count;
                end;

                 //get papers failed and not booked
                 if TotalPapers>0 then begin
                ExamBookingEntries1.Reset;
                ExamBookingEntries1.SetRange("Student Reg No.","Student Processing Header"."Student Reg. No.");
                ExamBookingEntries1.SetRange(Status,ExamBookingEntries1.Status::Failed);
                ExamBookingEntries1.SetRange(Blocked,false);
                if ExamBookingEntries1.FindSet then begin
                   TotalPapers1:=ExamBookingEntries1.Count;
                end;
                 end;

                if TotalPapers1>TotalPapers then begin
                if ( (TotalPapers1<>0) and (TotalPapers<3) ) then
                 ShowValue:=true;
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
        ShowValue: Boolean;
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalPapers: Integer;
        Examination: Codeunit Examination;
        ExamBookingEntries1: Record "Exam Booking Entries";
        TotalPapers1: Integer;
        ExamBookingEntries2: Record "Exam Booking Entries";
}

