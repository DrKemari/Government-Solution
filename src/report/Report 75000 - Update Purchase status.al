report 75000 "Update Purchase status"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Purchase status.rdlc';

    dataset
    {
        dataitem("Purchase Header";"Purchase Header")
        {
            DataItemTableView = WHERE("Document Type"=CONST(Order),Status=FILTER(<>"Pending Approval"),"No."=FILTER(<>'P-ORD0001'|<>'P-ORD0016'|<>'P-ORD0084'|<>'P-ORD0055'|<>'P-ORD0066'|<>'P-ORD0072'|<>'P-ORD0075'|<>'P-ORD0083'|<>'P-ORD0025'));
            RequestFilterFields = "Document Type","No.";

            trigger OnAfterGetRecord()
            begin
                "Purchase Header".Status:="Purchase Header".Status::Released;
                "Purchase Header".Modify(true);
                //"Purchase Header".VALIDATE("Purchase Header"."Vendor Order No.");
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

