#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50059 "pageextension50059" extends "Sales & Receivables Setup" 
{
    layout
    {
        addfirst(General)
        {
            field("Car Loan Int. Due Acc."; Rec."Car Loan Int. Due Acc.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("ICT Helpdesk Nos."; Rec."ICT Helpdesk Nos.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Direct Debit Mandate Nos.")
        {
            field("Disposal No."; Rec."Disposal No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

