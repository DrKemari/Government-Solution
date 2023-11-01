#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85382 "GL Bank Balances"
{
    PageType = Card;
    SourceTable = "G/L Account";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the cash account.';
                }
                group("Bank Details")
                {
                    field("Bank No"; BankCode)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the BankCode field.';
                    }
                    field("Bank Name"; BankName)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the BankName field.';
                    }
                    field(Balance; BalanceAmount)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the BalanceAmount field.';
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    var
        GLEntry: Record "G/L Entry";
    begin
    end;

    var
        BalanceAmount: Decimal;
        BankCode: Code[30];
        BankName: Text;

    local procedure GetBankAmount(GLAccount: Record "G/L Account"; StartDate: Date; EndDate: Date)
    var
        GLEntry: Record "G/L Entry";
        BankAccount: Record "Bank Account";
    begin
        GLEntry.Reset;
        GLEntry.SetRange("G/L Account No.", GLAccount."No.");
        GLEntry.SetRange(Reversed, false);
        if GLEntry.FindSet then begin
            GLEntry.CalcSums(Amount);
            BalanceAmount := GLEntry.Amount;
        end
    end;
}

#pragma implicitwith restore

