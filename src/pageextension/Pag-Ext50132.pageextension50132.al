#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50132 "pageextension50132" extends "Purchase Invoices" 
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on "Amount(Control 16)".

    }

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetSecurityFilterOnRespCenter;

        JobQueueActive := PurchasesPayablesSetup.JobQueueActive;

        CopyBuyFromVendorFilter;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        //SETRANGE("Assigned User ID",USERID);

        #1..5
        */
    //end;
}

