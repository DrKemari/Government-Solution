#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50101 "pageextension50101" extends "FA Ledger Entries" 
{
    layout
    {
        addafter("FA Posting Type")
        {
            field("FA Posting Group"; Rec."FA Posting Group")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

