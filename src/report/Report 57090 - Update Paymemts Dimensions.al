report 57090 "Update Paymemts Dimensions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Paymemts Dimensions.rdlc';

    dataset
    {
        dataitem(Payments;Payments)
        {
            DataItemTableView = WHERE("Payment Type"=CONST(Imprest));

            trigger OnAfterGetRecord()
            begin
                Payments.Validate(Payments."Shortcut Dimension 1 Code");
                Payments.Validate(Payments."Shortcut Dimension 2 Code");
                Payments.Validate(Payments."Shortcut Dimension 3 Code");
                //,Payments."Shortcut Dimension 2 Code",Payments."Shortcut Dimension 3 Code");
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

