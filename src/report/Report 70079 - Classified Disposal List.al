report 70079 "Classified Disposal List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Classified Disposal List.rdlc';

    dataset
    {
        dataitem("Fixed Asset";"Fixed Asset")
        {
            column(image1;corec.Picture)
            {
            }

            trigger OnPreDataItem()
            begin
                corec.Get;
                corec.CalcFields(corec.Picture);
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
        corec: Record "Company Information";
}

