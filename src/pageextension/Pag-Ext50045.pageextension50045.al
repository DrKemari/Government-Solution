#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50045 "pageextension50045" extends "Payment Journal" 
{
    layout
    {
        addafter("VAT Prod. Posting Group")
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

