report 85148 "Update Booking Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Booking Entries.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(Date_StudentProcessingHeader;"Student Processing Header".Date)
            {
            }
            column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
            {
            }
            column(StudentNo_StudentProcessingHeader;"Student Processing Header"."Student No.")
            {
            }
            column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
            {
            }
            dataitem("Exam Booking Entries";"Exam Booking Entries")
            {
                column(Code_ExamBookingEntries;"Exam Booking Entries".Code)
                {
                }
                column(EntryNo_ExamBookingEntries;"Exam Booking Entries"."Entry No.")
                {
                }
                column(StudentRegNo_ExamBookingEntries;"Exam Booking Entries"."Student Reg No.")
                {
                }
                column(StudentName_ExamBookingEntries;"Exam Booking Entries"."Student Name")
                {
                }
                column(Examination_ExamBookingEntries;"Exam Booking Entries".Examination)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Header.Reset;
                    Header.SetRange("No.","Exam Booking Entries".Code);
                    Header.SetRange("Student Reg. No.","Exam Booking Entries"."Student Reg No.");
                    if Header.FindFirst then begin
                      if Header."Examination Center Code"<>"Exam Booking Entries"."Exam Center" then
                        Message("Exam Booking Entries".Code);
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ExamBookingEntries.Reset;
                ExamBookingEntries.SetRange(Code,"Student Processing Header"."No.");
                ExamBookingEntries.SetRange("Student Reg No.","Student Processing Header"."Student Reg. No.");
                if ExamBookingEntries.FindSet then begin
                  repeat
                    if ExamBookingEntries."Exam Center"<>"Student Processing Header"."Examination Center Code" then begin
                      Message(ExamBookingEntries.Code);
                    end
                  until ExamBookingEntries.Next=0
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
        ExamBookingEntries: Record "Exam Booking Entries";
        ExamBookingEntries1: Record "Exam Booking Entries";
        Header: Record "Student Processing Header";
}

