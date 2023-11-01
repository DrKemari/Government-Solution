report 85087 "Booking Entries Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Booking Entries Update.rdlc';

    dataset
    {
        dataitem("Center Booking Entries";"Center Booking Entries")
        {
            dataitem("Examination Account";"Examination Account")
            {
                DataItemLink = "Registration No."=FIELD("Student Reg No.");
                dataitem("Exam Booking Entries";"Exam Booking Entries")
                {
                    DataItemTableView = WHERE(Status=FILTER(Open),"Exam Center"=FILTER(''),"Exam Sitting"=FILTER('DECEMBER 2021'));
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
                    column(PostedBy;PostedBy)
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        ProcessingHeader: Record "Student Processing Header";
                    begin
                        // // //student pro
                        // ProcessingHeader.RESET;
                        // ProcessingHeader.SETRANGE("Student Reg. No.","Exam Booking Entries"."Student Reg No.");
                        // ProcessingHeader.SETRANGE("No.","Exam Booking Entries".Code);
                        // IF ProcessingHeader.FINDFIRST THEN BEGIN
                        // PostedBy:=ProcessingHeader."Posted By";
                        // //  "Exam Booking Entries"."Exam Center":=ProcessingHeader."Examination Center Code";
                        // //  "Exam Booking Entries".VALIDATE("Exam Booking Entries"."Exam Center");
                        // //  "Exam Booking Entries".MODIFY(TRUE);
                        // END
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    //modify the booking entry
                    CenterEntries.Reset;
                    CenterEntries.SetRange("Student Reg No.","Examination Account"."Registration No.");
                    CenterEntries.SetRange(Status,CenterEntries.Status::Allocated);
                    if CenterEntries.FindFirst then begin

                          ExamBookingEntries.Reset;
                          ExamBookingEntries.SetRange("Student Reg No.","Center Booking Entries"."Student Reg No.");
                          ExamBookingEntries.SetRange(Status,ExamBookingEntries.Status::Open);
                          if ExamBookingEntries.FindSet then begin
                          repeat
                          ExamBookingEntries."Exam Center":=CenterEntries."Exam Center Code";
                          ExamBookingEntries.Validate("Exam Center");
                          ExamBookingEntries.Modify(true);
                          until ExamBookingEntries.Next=0;
                          end

                    end
                end;
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
        PostedBy: Text;
        ExamBookingEntries: Record "Exam Booking Entries";
        CenterEntries: Record "Center Booking Entries";
}

