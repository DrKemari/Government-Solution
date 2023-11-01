#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54044 "Investment Posting Group"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Investment Posting Group";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Investment Cost Account"; Rec."Investment Cost Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Cost Account field.';
                }
                field("Investment Revaluation Account"; Rec."Investment Revaluation Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Revaluation Account field.';
                }
                field("Interest Receivable Account"; Rec."Interest Receivable Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Receivable Account field.';
                }
                field("Investment Income Account"; Rec."Investment Income Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Income Account field.';
                }
                field("Dividend Receivable AC"; Rec."Dividend Receivable AC")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dividend Receivable AC field.';
                }
                field("Dividend Income AC"; Rec."Dividend Income AC")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dividend Income AC field.';
                }
                field("Revaluation Gain/Loss"; Rec."Revaluation Gain/Loss")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revaluation Gain/Loss field.';
                }
                field("Gain/Loss on Disposal Account"; Rec."Gain/Loss on Disposal Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gain/Loss on Disposal Account field.';
                }
                field("Withholding Tax Account"; Rec."Withholding Tax Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax Account field.';
                }
                field("Capital Reserve Account"; Rec."Capital Reserve Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Capital Reserve Account field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

