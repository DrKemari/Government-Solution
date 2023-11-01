report 85149 "Update Booking Entries1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Booking Entries1.rdlc';

    dataset
    {
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
            column(Visible;Visible)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Visible:=false;
                Header.Reset;
                Header.SetRange("No.","Exam Booking Entries".Code);
                Header.SetRange("Student Reg. No.","Exam Booking Entries"."Student Reg No.");
                if Header.FindFirst then begin
                  if Header."Examination Center Code"<>"Exam Booking Entries"."Exam Center" then
                    begin
                        Visible:=true;
                      "Exam Booking Entries"."Exam Center":=Header."Examination Center Code";
                      "Exam Booking Entries".Modify(true);
                    end;

                end;
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
        Visible: Boolean;
}

