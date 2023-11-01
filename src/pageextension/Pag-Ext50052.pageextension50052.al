#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50052 "pageextension50052" extends "Apply Bank Acc. Ledger Entries" 
{
    layout
    {
        addafter(Amount)
        {
            // field("External Document No.";"External Document No.")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter("Global Dimension 2 Code")
        {
            field("Actual Trans Date"; Rec."Actual Trans Date")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("Payment Reference No."; Rec."Payment Reference No.")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
    }
}

#pragma implicitwith restore

