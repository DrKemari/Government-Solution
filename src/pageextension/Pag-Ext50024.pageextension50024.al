#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50024 "pageextension50024" extends "Purch. Invoice Subform" 
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Job No."(Control 38)".


        //Unsupported feature: Property Modification (Visible) on ""Job Task No."(Control 90)".

        modify("Job Unit Price")
        {
            Visible = false;
        }
        modify("Job Total Price")
        {
            Visible = false;
        }
        modify("Job Unit Price (LCY)")
        {
            Visible = false;
        }
        modify("Job Total Price (LCY)")
        {
            Visible = false;
        }
        addafter("IC Partner Reference")
        {
            // field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter("Line Amount")
        {
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

