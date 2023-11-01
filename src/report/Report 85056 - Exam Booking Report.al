report 85056 "Exam Booking Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Exam Booking Report.rdlc';

    dataset
    {
        dataitem("Exam Booking Entries"; "Exam Booking Entries")
        {
            DataItemTableView = WHERE(Part = FILTER(<> ''), Status = FILTER(Open | Failed | Passed));
            RequestFilterFields = "Exam Sitting";
            column(Code_ExamBookingEntries; "Exam Booking Entries".Code)
            {
            }
            column(EntryNo_ExamBookingEntries; "Exam Booking Entries"."Entry No.")
            {
            }
            column(StudentRegNo_ExamBookingEntries; "Exam Booking Entries"."Student Reg No.")
            {
            }
            column(StudentName_ExamBookingEntries; "Exam Booking Entries"."Student Name")
            {
            }
            column(Examination_ExamBookingEntries; "Exam Booking Entries".Examination)
            {
            }
            column(Section_ExamBookingEntries; "Exam Booking Entries".Section)
            {
            }
            column(Part_ExamBookingEntries; "Exam Booking Entries".Part)
            {
            }
            column(Paper_ExamBookingEntries; "Exam Booking Entries".Paper)
            {
            }
            column(Description_ExamBookingEntries; "Exam Booking Entries".Description)
            {
            }
            column(LevelNo; LevelNo)
            {
            }
            column(ExamCenter_ExamBookingEntries; "Exam Booking Entries"."Exam Center")
            {
            }
            column(CenterName_ExamBookingEntries; "Exam Booking Entries"."Center Name")
            {
            }
            column(ExamSitting_ExamBookingEntries; "Exam Booking Entries"."Exam Sitting")
            {
            }

            trigger OnAfterGetRecord()
            begin
                //get level no
                LevelNo := 0;
                Level.Reset;
                Level.SetRange(Course, "Exam Booking Entries".Examination);
                Level.SetRange(Code, "Exam Booking Entries".Part);
                if Level.FindFirst then begin
                    LevelNo := Level.Level;
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
        Level: Record Level;
        LevelNo: Integer;
}

