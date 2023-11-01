#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50131 "pageextension50131" extends "Purchase Order List" 
{

    //Unsupported feature: Property Modification (SourceTableView) on ""Purchase Order List"(Page 9307)".


    //Unsupported feature: Property Insertion (InsertAllowed) on ""Purchase Order List"(Page 9307)".


    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Purchase Order List"(Page 9307)".


    //Unsupported feature: Property Insertion (ModifyAllowed) on ""Purchase Order List"(Page 9307)".

    layout
    {
        addafter("Posting Description")
        {
            field("Requisition No"; Rec."Requisition No")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on "Print(Action 55)".

    }


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF GETFILTER(Receive) <> '' THEN
          FilterPartialReceived;
        IF GETFILTER(Invoice) <> '' THEN
          FilterPartialInvoiced;

        SetSecurityFilterOnRespCenter;

        JobQueueActive := PurchasesPayablesSetup.JobQueueActive;

        CopyBuyFromVendorFilter;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        //SetSecurityFilterOnRespCenter;
        #7..10
        */
    //end;
}

#pragma implicitwith restore

