#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95315 "Audit Plan Line Risk"
{
    PageType = List;
    SourceTable = "Audit Plan Line Risk";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line Risk ID"; Rec."Line Risk ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line Risk ID field.';
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Title field.';
                }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Category field.';
                }
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Source ID field.';
                }
                field("Risk Likelihood Code"; Rec."Risk Likelihood Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Likelihood Code field.';
                }
                field("Risk Impact Code"; Rec."Risk Impact Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Code field.';
                }
                field("Risk Impact Type"; Rec."Risk Impact Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Type field.';
                }
                field("Risk Register Type"; Rec."Risk Register Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Register Type field.';
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk Management Plan ID field.';
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk ID field.';
                }
                field("Gen. Risk Response Strategy"; Rec."Gen. Risk Response Strategy")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Risk Response Strategy field.';
                }
                field("No. of Controls"; Rec."No. of Controls")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Controls field.';
                }
                field("No. of Audit Procedures"; Rec."No. of Audit Procedures")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Audit Procedures field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

