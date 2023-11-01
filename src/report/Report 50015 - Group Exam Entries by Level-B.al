report 50015 "Group Exam Entries by Level-B"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Group Exam Entries by Level-B.rdlc';

    dataset
    {
        dataitem("Exam Booking Entries-Buffer";"Exam Booking Entries-Buffer")
        {
            column(StudentRegNo_ExamBookingEntries;"Exam Booking Entries-Buffer"."Student Reg No.")
            {
            }
            column(StudentName_ExamBookingEntries;"Exam Booking Entries-Buffer"."Student Name")
            {
            }
            column(Examination_ExamBookingEntries;"Exam Booking Entries-Buffer".Examination)
            {
            }
            column(Part_ExamBookingEntries;"Exam Booking Entries-Buffer".Part)
            {
            }
            column(Paper_ExamBookingEntries;"Exam Booking Entries-Buffer".Paper)
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

