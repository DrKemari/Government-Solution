#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95146 "Audit Template"
{
    PageType = Card;
    SourceTable = "Audit Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Audit  WorkType"; Rec."Audit  WorkType")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit  WorkType field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part("Default Checlist"; "Audit Template Checklist Lines")
            {
                Caption = 'Default Checlist';
                SubPageLink = "Template ID" = field("Template ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Scope)
            {
                ApplicationArea = Basic;
                Image = AddToHome;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Sections";
                RunPageLink = "Template ID" = field("Template ID");
                RunPageView = where("Section Type" = filter(Scope));
                ToolTip = 'Executes the Scope action.';
            }
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = AdjustVATExemption;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Sections";
                RunPageLink = "Template ID" = field("Template ID");
                RunPageView = where("Section Type" = filter(Overview));
                ToolTip = 'Executes the Overview action.';
            }
            action("Scope Exclusions")
            {
                ApplicationArea = Basic;
                Image = AddWatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Sections";
                RunPageLink = "Template ID" = field("Template ID");
                RunPageView = where("Section Type" = filter("Scope Exclusion"));
                ToolTip = 'Executes the Scope Exclusions action.';
            }
            action(Comments)
            {
                ApplicationArea = Basic;
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Sections";
                RunPageLink = "Template ID" = field("Template ID");
                RunPageView = where("Section Type" = filter(Comment));
                ToolTip = 'Executes the Comments action.';
            }
            action(Objectives)
            {
                ApplicationArea = Basic;
                Image = "Order";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Objectives";
                RunPageLink = "Template ID" = field("Template ID");
                ToolTip = 'Executes the Objectives action.';
            }
            action("Default Risks")
            {
                ApplicationArea = Basic;
                Image = AdjustItemCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Default Risks";
                RunPageLink = "Template ID" = field("Template ID");
                ToolTip = 'Executes the Default Risks action.';
            }
            action("Default Controls")
            {
                ApplicationArea = Basic;
                Image = BreakRulesList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Defaul Controls";
                RunPageLink = "Template ID" = field("Template ID");
                Visible = false;
                ToolTip = 'Executes the Default Controls action.';
            }
            action(Procedures)
            {
                ApplicationArea = Basic;
                Image = AddToHome;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Procedures";
                RunPageLink = "Template ID" = field("Template ID");
                ToolTip = 'Executes the Procedures action.';
            }
            action("Procedure Tests")
            {
                ApplicationArea = Basic;
                Image = TestReport;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Procedure Tests";
                RunPageLink = "Template ID" = field("Template ID");
                ToolTip = 'Executes the Procedure Tests action.';
            }
            action("Procedure Comments")
            {
                ApplicationArea = Basic;
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Temp Procedure Comments";
                RunPageLink = "Template ID" = field("Template ID");
                Visible = false;
                ToolTip = 'Executes the Procedure Comments action.';
            }
            action("Procedure Controls")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Temp Procedure Controls";
                RunPageLink = "Template ID" = field("Template ID");
                ToolTip = 'Executes the Procedure Controls action.';
            }
        }
    }
}

#pragma implicitwith restore

