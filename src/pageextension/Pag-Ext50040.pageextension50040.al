#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50040 "pageextension50040" extends "Posted Sales Credit Memos" 
{
    layout
    {
        addafter(Amount)
        {
            field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Applies-to Doc. Type")
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

