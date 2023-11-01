report 70003 "Cost Comparison Sheet"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Cost Comparison Sheet.rdlc';

    dataset
    {
        dataitem("Tender Bids";"Tender Bids")
        {
            column(Request_No;"Tender Bids"."Requisition No")
            {
            }
            column(Bidder_Name;"Tender Bids"."Bidder Name")
            {
            }
            column(Item_No;"Tender Bids".No)
            {
            }
            column(Description;"Tender Bids".Description)
            {
            }
            column(Quantity;"Tender Bids".Quantity)
            {
            }
            column(Unit_of_Measure;"Tender Bids"."Unit of Measure")
            {
            }
            column(Unit_Price;"Tender Bids"."Unit Price")
            {
            }
            column(Amount;"Tender Bids".Amount)
            {
            }
            column(Amount_LCY;"Tender Bids"."Amount LCY")
            {
            }
            column(Discount;"Tender Bids".Discount)
            {
            }
            column(Remarks;"Tender Bids".Remarks)
            {
            }
            column(Title;Title)
            {
            }
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
        Title: Label 'Cost Comparison Sheet';
}

