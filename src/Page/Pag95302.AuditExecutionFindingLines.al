#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95302 "Audit Execution Finding Lines"
{
    PageType = ListPart;
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
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                field("Risk Heat Zone"; Rec."Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Heat Zone field.';
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
                field("Fieldwork Audit Finding ID"; Rec."Fieldwork Audit Finding ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fieldwork Audit Finding ID field.';
                }
                field("Audit Finding Status"; Rec."Audit Finding Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Finding Status field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Audit Location Findings")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Finding Locations";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID");
                    ToolTip = 'Executes the Audit Location Findings action.';
                }
                action("Positive Audit Findings")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Positive Audit Findings";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID");
                    ToolTip = 'Executes the Positive Audit Findings action.';
                }
                action("Audit Management Actions")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = "Action";
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Audit Management Actions";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID"),
                                  "Checklist ID" = field("Checklist ID"),
                                  "Finding ID" = field("Finding ID");
                    ToolTip = 'Executes the Audit Management Actions action.';
                }
                action("Mgt Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Management Comments';
                    Ellipsis = true;
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Audit Management Comments";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID"),
                                  "Checklist ID" = field("Checklist ID"),
                                  "Finding ID" = field("Finding ID");
                    ToolTip = 'Executes the Management Comments action.';
                }
                action("Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    Image = Receipt;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Finding Recommendations";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID"),
                                  "Checklist ID" = field("Checklist ID"),
                                  "Finding ID" = field("Finding ID");
                    ToolTip = 'Executes the Audit Recommendations action.';
                }
                action("Filed Audit Working Papers")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Filed Audit Working Papers";
                    RunPageLink = "Engagement ID" = field("Engagement ID"),
                                  "Fieldwork Audit Finding ID" = field("Checklist ID");
                    ToolTip = 'Executes the Filed Audit Working Papers action.';
                }
                action("Risk Implications")
                {
                    ApplicationArea = Basic;
                    Image = ImplementCostChanges;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Execution Implications";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID"),
                                  "Checklist ID" = field("Checklist ID"),
                                  "Finding ID" = field("Finding ID");
                    ToolTip = 'Executes the Risk Implications action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Dimension Set Entries";
                    Visible = false;
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

