report 70081 "Terminations of proceedings"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Terminations of proceedings.rdlc';

    dataset
    {
        dataitem("Company Information";"Company Information")
        {
            column(image1;corec.Picture)
            {
            }
            column(name;corec.Name)
            {
            }
        }
        dataitem("Disposal Plan Lines";"Disposal Plan Lines")
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

    trigger OnInitReport()
    begin
        corec.Get;
        corec.CalcFields(Picture);
    end;

    trigger OnPreReport()
    begin
        corec.Get;
        corec.CalcFields(corec.Picture);
    end;

    var
        corec: Record "Company Information";
}

