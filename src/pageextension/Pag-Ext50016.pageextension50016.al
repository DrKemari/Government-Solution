#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50016 "pageextension50016" extends "General Journal" 
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Modification (Visible) on ""Account Type"(Control 8)".


        //Unsupported feature: Property Modification (Visible) on "Amount(Control 18)".


        //Unsupported feature: Property Modification (Visible) on ""Amount (LCY)"(Control 113)".


        //Unsupported feature: Property Modification (Visible) on ""Debit Amount"(Control 1000)".


        //Unsupported feature: Property Modification (Visible) on ""Credit Amount"(Control 1001)".


        //Unsupported feature: Property Modification (Visible) on ""Bal. Account Type"(Control 53)".


        //Unsupported feature: Property Modification (Visible) on ""Bal. Account No."(Control 55)".

        addfirst(Control1)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Document No.")
        {
            field("FA Posting Type"; Rec."FA Posting Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(AccountName)
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

