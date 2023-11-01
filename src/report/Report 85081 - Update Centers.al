report 85081 "Update Centers"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Centers.rdlc';

    dataset
    {
        dataitem("Examination Centres";"Examination Centres")
        {
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
        VarInt: Integer;
}

