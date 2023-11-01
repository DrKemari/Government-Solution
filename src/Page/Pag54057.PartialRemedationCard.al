#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54057 "Partial Remedation Card"
{
    PageType = Card;
    SourceTable = Receipts;

    layout
    {
        area(content)
        {
            group("Money Market Redemption")
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Receipt Type"; Rec."Receipt Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Type field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Intitution Name"; Rec."Intitution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Intitution Name field.';
                }
                field("Investment No"; Rec."Investment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment No field.';
                }
                field(Broker; Rec.Broker)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Broker field.';
                }
                field("Receipt No"; Rec."Receipt No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt No field.';
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Custodian Code field.';
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Investment Transcation Type"; Rec."Investment Transcation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Transcation Type field.';
                }
                field("Interest Amount"; Rec."Interest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Amount field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
            }
            group("Sales Details")
            {
                field("Face Value"; Rec."Face Value")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Face Value field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field("Whtax Amount"; Rec."Whtax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Whtax Amount field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Post Partial Redemption")
            {
                ApplicationArea = Basic;
                Image = post;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post Partial Redemption action.';
                trigger OnAction()
                begin
                    InvestPost.FnPostPartialSale(Rec);
                end;
            }
        }
    }

    var
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        RecPayTypes: Record "Receipts and Payment Types";
        ExpectedInterest: Record "Expected Interest1";
        InvestmentRec: Record "Investment Asset";
        InvestmentPostingGroup: Record "Investment Posting Group";
        GenSetup: Record "General Ledger Setup";
        BankAcc: Record "Bank Account";
        InvestPost: Codeunit "Investment Management";
}

#pragma implicitwith restore

