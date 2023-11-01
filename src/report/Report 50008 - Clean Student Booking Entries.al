report 50008 "Clean Student Booking Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Clean Student Booking Entries.rdlc';

    dataset
    {
        dataitem("Student Course Level Buffer";"Student Course Level Buffer")
        {

            trigger OnAfterGetRecord()
            begin
                // ExamBookingEntries.RESET;
                // ExamBookingEntries.SETRANGE("Student Reg No.",'NAC/99999');
                // ExamBookingEntries.SETRANGE(Examination,'CPA');
                // ExamBookingEntries.SETRANGE(Part,'LEVEL 1');
                // IF  ExamBookingEntries.FINDSET THEN BEGIN
                //  MESSAGE('');
                // END;
                  /*TCount+=1;
                  IF TCount=100 THEN
                    EXIT;*/
                
                 ExamBookingEntries.Reset;
                 ExamBookingEntries.SetRange("Student Reg No.","Student Course Level Buffer"."Student Reg No");
                 ExamBookingEntries.SetFilter(Part,'<>%1',"Student Course Level Buffer".Level);
                 ExamBookingEntries.SetRange(Status,ExamBookingEntries.Status::Failed);
                 ExamBookingEntries.SetRange(Examination,"Student Course Level Buffer"."Couse Id");
                 if  ExamBookingEntries.FindSet then begin
                
                  ExamBookingEntries.DeleteAll;
                
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

    trigger OnPreReport()
    begin
        TCount:=0;
    end;

    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TCount: Integer;
}

