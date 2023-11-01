#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50049 "pageextension50049" extends "Bank Account Ledger Entries" 
{
    layout
    {
        addafter("Reversed by Entry No.")
        {
            field("Payment Reference No."; Rec."Payment Reference No.")
            {
                ApplicationArea = Basic;
            }
            field(PaymentRef; Rec.PaymentRef)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Entry No.")
        {
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

