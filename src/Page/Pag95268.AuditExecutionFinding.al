#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95268 "Audit Execution Finding"
{
    PageType = Card;
    SourceTable = "Audit Execution Finding";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field("Finding ID"; Rec."Finding ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finding ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Compliance Status"; Rec."Compliance Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Status field.';
                }
                field("Risk Rating Code"; Rec."Risk Rating Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Rating Code field.';
                }
                field(Implication; Rec.Implication)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Implication field.';
                }
                field("Affects All Audit Locations"; Rec."Affects All Audit Locations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Affects All Audit Locations field.';
                }
                field("No. of Audit Recommendations"; Rec."No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Recommendations field.';
                }
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Procedure ID field.';
                }
                field("No. of Fieldwork Audit Papers"; Rec."No. of Fieldwork Audit Papers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Fieldwork Audit Papers field.';
                }
                field("Audit Objective ID"; Rec."Audit Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Objective ID field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Fieldwork Audit Finding ID"; Rec."Fieldwork Audit Finding ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fieldwork Audit Finding ID field.';
                }
                field("No. of Related Audit Papers"; Rec."No. of Related Audit Papers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Related Audit Papers field.';
                }
                field("Management Comment Deadline"; Rec."Management Comment Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Comment Deadline field.';
                }
                field("Mgt Comment Received Date"; Rec."Mgt Comment Received Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mgt Comment Received Date field.';
                }
                field("Auditee Response Type"; Rec."Auditee Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Response Type field.';
                }
                field("No. of Management Comments"; Rec."No. of Management Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Management Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

