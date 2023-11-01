report 85064 "Exemption Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Exemption Update.rdlc';

    dataset
    {
        dataitem("Exemptions Setup";"Exemptions Setup")
        {

            trigger OnAfterGetRecord()
            begin
                //
                "Exemptions Setup".Validate("Exemptions Setup"."Exemption Subject Code");
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

