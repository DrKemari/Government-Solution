report 50013 "Group Exam Entries by Level"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Group Exam Entries by Level.rdlc';

    dataset
    {
        dataitem("Exam Booking Entries";"Exam Booking Entries")
        {
            DataItemTableView = WHERE(Examination=CONST('CCP'));
            column(StudentRegNo_ExamBookingEntries;"Exam Booking Entries"."Student Reg No.")
            {
            }
            column(StudentName_ExamBookingEntries;"Exam Booking Entries"."Student Name")
            {
            }
            column(Examination_ExamBookingEntries;"Exam Booking Entries".Examination)
            {
            }
            column(Part_ExamBookingEntries;"Exam Booking Entries".Part)
            {
            }
            column(Paper_ExamBookingEntries;"Exam Booking Entries".Paper)
            {
            }
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
        StudentDetailsBuffer: Record "Works Progress Header";
        TotalCount: Integer;
        ExaminationResults: Record "Examination Results";
        AccountsBuffer: Record "Accounts Buffer";
}

