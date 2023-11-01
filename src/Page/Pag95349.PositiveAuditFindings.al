#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95349 "Positive Audit Findings"
{
    PageType = List;
    SourceTable = "Audit Execution Finding";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("CheckList Description"; Rec."CheckList Description")
                {
                    ApplicationArea = Basic;
                }
                field("Finding ID"; Rec."Finding ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Positive Finding Description"; Rec."Positive Finding Description")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Finding Description';
                    Visible = false;
                }
                field(Implication; Rec.Implication)
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Implication';
                    Visible = false;
                }
                field("Affects All Audit Locations"; Rec."Affects All Audit Locations")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Location Code"; Rec."Audit Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Recommendations"; Rec."No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Fieldwork Audit Papers"; Rec."No. of Fieldwork Audit Papers")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Objective ID"; Rec."Audit Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Fieldwork Audit Finding ID"; Rec."Fieldwork Audit Finding ID")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Related Audit Papers"; Rec."No. of Related Audit Papers")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Audit Execution Implications")
            {
                ApplicationArea = Basic;
                Image = ImplementPriceChange;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Audit Execution Implications";
                RunPageLink = "Document Type"=field("Document Type"),
                              "Document No."=field("Document No."),
                              "Engagement ID"=field("Engagement ID"),
                              "Checklist ID"=field("Checklist ID"),
                              "Finding ID"=field("Finding ID");
            }
        }
    }
}

#pragma implicitwith restore

