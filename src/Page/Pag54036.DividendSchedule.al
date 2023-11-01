#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54036 "Dividend Schedule"
{
    PageType = ListPart;
    SourceTable = "Institutional Actions";
    SourceTableView = where(Type = const(Dividend));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Institution Code"; Rec."Institution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Books Closure Date"; Rec."Books Closure Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Books Closure Date field.';
                }
                field("Payment Date"; Rec."Payment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Date field.';
                }
                field("Amount Per Share"; Rec."Amount Per Share")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Per Share field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Payment posted"; Rec."Payment posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment posted field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Dividend
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Dividend
    end;

    var
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        LineNo: Integer;
        DivSchedule: Record "Dividend Payment";
        BankAcc: Record "Bank Account";
        Custodian: Record "Custodian Code";
        InvestPost: Codeunit "Investment Management";
}

#pragma implicitwith restore

