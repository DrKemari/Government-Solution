report 85088 "Exam Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Exam Entries.rdlc';

    dataset
    {
        dataitem("Exam Booking Entries";"Exam Booking Entries")
        {

            trigger OnAfterGetRecord()
            begin
                if "Exam Booking Entries"."Exam Center"='191' then begin
                "Exam Booking Entries"."Exam Center":='190';
                "Exam Booking Entries".Modify(true);
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
}

