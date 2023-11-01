report 85095 "Results Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Results Update.rdlc';

    dataset
    {
        dataitem("Examination Results";"Examination Results")
        {
            RequestFilterFields = "Examination Sitting ID";
            column(StudentRegNo_ExaminationResults;"Examination Results"."Student Reg No.")
            {
            }
            column(Paper_ExaminationResults;"Examination Results".Paper)
            {
            }
            dataitem("Exam Booking Entries";"Exam Booking Entries")
            {
                DataItemLink = "Student Reg No."=FIELD("Student Reg No."),Examination=FIELD(Examination),Paper=FIELD(Paper);
                DataItemTableView = WHERE(Cancelled=CONST(false),Blocked=CONST(false),Status=FILTER(Open|Failed|Passed));
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
                    if "Examination Results".Passed=true then
                        begin

                          "Exam Booking Entries".Status:="Exam Booking Entries".Status::Passed;
                          "Exam Booking Entries".Modify(true);
                        end
                        else
                        begin
                          "Exam Booking Entries".Status:="Exam Booking Entries".Status::Failed;
                          "Exam Booking Entries".Modify(true);
                        end
                end;
            }

            trigger OnAfterGetRecord()
            begin
                // //modify the booking entries
                // BookingEntries.RESET;
                // BookingEntries.SETRANGE("Student Reg No.","Examination Results"."Student Reg No.");
                // BookingEntries.SETRANGE(Paper,"Examination Results".Paper);
                // BookingEntries.SETRANGE("Exam Sitting","Examination Results"."Examination Sitting ID");
                // BookingEntries.SETRANGE(Status,BookingEntries.Status::Open);
                // IF BookingEntries.FINDFIRST THEN BEGIN
                //  IF "Examination Results".Passed=TRUE THEN
                //    BEGIN
                //      BookingEntries.Status:=BookingEntries.Status::Passed;
                //      BookingEntries.MODIFY(TRUE);
                //    END
                //    ELSE
                //    BEGIN
                //      BookingEntries.Status:=BookingEntries.Status::Failed;
                //      BookingEntries.MODIFY(TRUE);
                //    END
                //
                // END;
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
        BookingEntries: Record "Exam Booking Entries";
}

