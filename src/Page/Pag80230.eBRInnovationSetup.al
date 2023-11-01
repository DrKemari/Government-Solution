#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80230 "e-BR & Innovation Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "e-BR & Innovation Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Employee Survey No. Series"; Rec."Employee Survey No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Survey No. Series field.';
                }
                field("Stakeholder Survey No. Series"; Rec."Stakeholder Survey No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stakeholder Survey No. Series field.';
                }
                field("Customer Survey No. Series"; Rec."Customer Survey No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Customer Survey No. Series field.';
                }
                field("Post-Project Survey No. Series"; Rec."Post-Project Survey No. Series")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Survey No. Series';
                    ToolTip = 'Specifies the value of the Project Survey No. Series field.';
                }
                field("Enable Email Alerts"; Rec."Enable Email Alerts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enable Email Alerts field.';
                }
                field("Notification Email"; Rec."Notification Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification Email field.';
                }
                field("BR Templates No. Series"; Rec."BR Templates No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BR Templates No. Series field.';
                }
                field("Surveys No. Series"; Rec."Surveys No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Surveys No. Series field.';
                }
                field("Survey Response No. Series"; Rec."Survey Response No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Response No. Series field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

