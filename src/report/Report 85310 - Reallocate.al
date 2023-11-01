report 85310 Reallocate
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reallocate.rdlc';

    dataset
    {
        dataitem("Center Booking Entries";"Center Booking Entries")
        {

            trigger OnAfterGetRecord()
            begin
                if "Center Booking Entries".Status<>"Center Booking Entries".Status::Cancelled then begin
                "Center Booking Entries".Status:="Center Booking Entries".Status::Allocated;
                "Center Booking Entries".Modify(true);
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

