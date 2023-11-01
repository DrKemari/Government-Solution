report 75001 "Modify PurchaseLine"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Modify PurchaseLine.rdlc';

    dataset
    {
        dataitem("Purchase Line";"Purchase Line")
        {
            DataItemTableView = WHERE("Document Type"=CONST(Order),Quantity=FILTER(>0));

            trigger OnAfterGetRecord()
            begin

                "Purchase Line"."Pay-to Vendor No.":="Purchase Line"."Buy-from Vendor No.";
                "Purchase Line".Validate("Purchase Line".Quantity,"Purchase Line".Quantity);
                "Purchase Line"."VAT Prod. Posting Group":='VAT0';
                "Purchase Line".Validate("Purchase Line"."VAT Identifier",'VAT0');
                "Purchase Line".Validate("Purchase Line"."VAT Base Amount",0);
                "Purchase Line".Validate("Purchase Line"."VAT %",0);
                "Purchase Line".Validate("Purchase Line"."Direct Unit Cost");


                "Purchase Line".Modify;
            end;

            trigger OnPostDataItem()
            begin
                Message('Modified Successfully');
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

