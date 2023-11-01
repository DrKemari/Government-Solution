report 85031 "Det. Defered Entries Per Level"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Det. Defered Entries Per Level.rdlc';

    dataset
    {
        dataitem("Exam Booking Entries";"Exam Booking Entries")
        {
            DataItemTableView = WHERE(Status=FILTER(Defered));
            RequestFilterFields = "Exam Sitting";
            column(Logo;CI.Picture)
            {
            }
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
            column(Course_ExamBookingEntries;Courses.Description)
            {
            }
            column(Section_ExamBookingEntries;"Exam Booking Entries".Section)
            {
            }
            column(Part_ExamBookingEntries;"Exam Booking Entries".Part)
            {
            }
            column(Paper_ExamBookingEntries;"Exam Booking Entries".Paper)
            {
            }
            column(Description_ExamBookingEntries;"Exam Booking Entries".Description)
            {
            }
            column(CurrencyCode_ExamBookingEntries;"Exam Booking Entries"."Currency Code")
            {
            }
            column(FeeAmount_ExamBookingEntries;"Exam Booking Entries"."Fee Amount")
            {
            }
            column(FeeAmountLCY_ExamBookingEntries;"Exam Booking Entries"."Fee Amount LCY")
            {
            }
            column(ExamCenter_ExamBookingEntries;"Exam Booking Entries"."Exam Center")
            {
            }
            column(CenterName_ExamBookingEntries;"Exam Booking Entries"."Center Name")
            {
            }
            column(ExamSittingCycle_ExamBookingEntries;"Exam Booking Entries"."Exam Sitting")
            {
            }
            column(Year_ExamBookingEntries;"Exam Booking Entries".Year)
            {
            }
            column(Blocked_ExamBookingEntries;"Exam Booking Entries".Blocked)
            {
            }
            column(StudCustNo_ExamBookingEntries;"Exam Booking Entries"."Stud. Cust No.")
            {
            }
            column(ProjectCode_ExamBookingEntries;"Exam Booking Entries"."Project Code")
            {
            }
            column(Status_ExamBookingEntries;"Exam Booking Entries".Status)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Courses.Reset;
                Courses.SetRange(Code,"Exam Booking Entries".Examination);
                if Courses.FindFirst then begin
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        Courses: Record Courses;
}

