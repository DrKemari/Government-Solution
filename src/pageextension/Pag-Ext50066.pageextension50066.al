#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50066 "pageextension50066" extends "Approval Entries" 
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""Last Modified By User ID"(Control 27)".

    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on "Record(Action 38)".

    }

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        MarkAllWhereUserisApproverOrSender;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        //MarkAllWhereUserisApproverOrSender;
        */
    //end;
}

