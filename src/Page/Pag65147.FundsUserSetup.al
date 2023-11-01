#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65147 "Funds User Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Funds User Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(UserID; Rec.UserID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserID field.';
                }
                field("Receipt Journal Template"; Rec."Receipt Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Journal Template field.';
                }
                field("Receipt Journal Batch"; Rec."Receipt Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Journal Batch field.';
                }
                field("Payment Journal Template"; Rec."Payment Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Journal Template field.';
                }
                field("Payment Journal Batch"; Rec."Payment Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Journal Batch field.';
                }
                field("Petty Cash Template"; Rec."Petty Cash Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Template field.';
                }
                field("Petty Cash Batch"; Rec."Petty Cash Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Batch field.';
                }
                field("FundsTransfer Template Name"; Rec."FundsTransfer Template Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FundsTransfer Template Name field.';
                }
                field("FundsTransfer Batch Name"; Rec."FundsTransfer Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FundsTransfer Batch Name field.';
                }
                field("Default Receipts Bank"; Rec."Default Receipts Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Receipts Bank field.';
                }
                field("Default Payment Bank"; Rec."Default Payment Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Payment Bank field.';
                }
                field("Default Petty Cash Bank"; Rec."Default Petty Cash Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Petty Cash Bank field.';
                }
                field("Max. Cash Collection"; Rec."Max. Cash Collection")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max. Cash Collection field.';
                }
                field("Max. Cheque Collection"; Rec."Max. Cheque Collection")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max. Cheque Collection field.';
                }
                field("Max. Deposit Slip Collection"; Rec."Max. Deposit Slip Collection")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max. Deposit Slip Collection field.';
                }
                field("Supervisor ID"; Rec."Supervisor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor ID field.';
                }
                field("Bank Pay In Journal Template"; Rec."Bank Pay In Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Pay In Journal Template field.';
                }
                field("Bank Pay In Journal Batch"; Rec."Bank Pay In Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Pay In Journal Batch field.';
                }
                field("Imprest Template"; Rec."Imprest Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Template field.';
                }
                field("Imprest  Batch"; Rec."Imprest  Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest  Batch field.';
                }
                field("Claim Template"; Rec."Claim Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim Template field.';
                }
                field("Claim  Batch"; Rec."Claim  Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim  Batch field.';
                }
                field("Advance Template"; Rec."Advance Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Template field.';
                }
                field("Advance  Batch"; Rec."Advance  Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance  Batch field.';
                }
                field("Advance Surr Template"; Rec."Advance Surr Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Surr Template field.';
                }
                field("Advance Surr Batch"; Rec."Advance Surr Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Surr Batch field.';
                }
                field("Dim Change Journal Template"; Rec."Dim Change Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dim Change Journal Template field.';
                }
                field("Dim Change Journal Batch"; Rec."Dim Change Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dim Change Journal Batch field.';
                }
                field("Journal Voucher Template"; Rec."Journal Voucher Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journal Voucher Template field.';
                }
                field("Journal Voucher Batch"; Rec."Journal Voucher Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journal Voucher Batch field.';
                }
                field("Interfund Journal Template"; Rec."Interfund Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interfund Journal Template field.';
                }
                field("Interfund Journal Batch"; Rec."Interfund Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interfund Journal Batch field.';
                }
                field("Post Payment Voucher"; Rec."Post Payment Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Payment Voucher field.';
                }
                field("Post Cash Voucher"; Rec."Post Cash Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Cash Voucher field.';
                }
                field("Post Money Voucher"; Rec."Post Money Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Money Voucher field.';
                }
                field("Post Petty Cash"; Rec."Post Petty Cash")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Petty Cash field.';
                }
                field("Post Receipt"; Rec."Post Receipt")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Receipt field.';
                }
                field("Post Funds Withdrawal"; Rec."Post Funds Withdrawal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Funds Withdrawal field.';
                }
                field("Post Funds Transfer"; Rec."Post Funds Transfer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Funds Transfer field.';
                }
                field("Post Imprest"; Rec."Post Imprest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Imprest field.';
                }
                field("Post Imprest Accounting"; Rec."Post Imprest Accounting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Imprest Accounting field.';
                }
                field("Post Claims"; Rec."Post Claims")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Claims field.';
                }
                field("Post Member Bills"; Rec."Post Member Bills")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Member Bills field.';
                }
                field("Post CPD Bills"; Rec."Post CPD Bills")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post CPD Bills field.';
                }
                field("Reverse Payment Voucher"; Rec."Reverse Payment Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Payment Voucher field.';
                }
                field("Reverse Cash Voucher"; Rec."Reverse Cash Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Cash Voucher field.';
                }
                field("Reverse Money Voucher"; Rec."Reverse Money Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Money Voucher field.';
                }
                field("Reverse Petty Cash"; Rec."Reverse Petty Cash")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Petty Cash field.';
                }
                field("Reverse Receipt"; Rec."Reverse Receipt")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Receipt field.';
                }
                field("Reverse Funds Withdrawal"; Rec."Reverse Funds Withdrawal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Funds Withdrawal field.';
                }
                field("Reverse Funds Transfer"; Rec."Reverse Funds Transfer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Funds Transfer field.';
                }
                field("Reverse Imprest"; Rec."Reverse Imprest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Imprest field.';
                }
                field("Reverse Imprest Accounting"; Rec."Reverse Imprest Accounting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Imprest Accounting field.';
                }
                field("Reverse Claims"; Rec."Reverse Claims")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Claims field.';
                }
                field("Reverse Member Bills"; Rec."Reverse Member Bills")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse Member Bills field.';
                }
                field("Reverse CPD Bills"; Rec."Reverse CPD Bills")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reverse CPD Bills field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

