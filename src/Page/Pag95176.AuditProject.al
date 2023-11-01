#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95176 "Audit Project"
{
    PageType = Card;
    SourceTable = "Audit Project";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
                field("Audit Plan Assignment No."; Rec."Audit Plan Assignment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Assignment No. field.';
                }
                field("Audit  Work Type"; Rec."Audit  Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit  Work Type field.';
                }
                field("Engagement Name"; Rec."Engagement Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Name field.';
                }
                field("Engagement Category"; Rec."Engagement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Category field.';
                }
                field("Parent Audit Project ID"; Rec."Parent Audit Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parent Audit Project ID field.';
                }
                field("Auditor Type"; Rec."Auditor Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditor Type field.';
                }
                field("Lead Auditor ID"; Rec."Lead Auditor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditor ID field.';
                }
                field("Lead Auditor Email"; Rec."Lead Auditor Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditor Email field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Audit Template ID"; Rec."Audit Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Template ID field.';
                }
                field("Chief Audit Executive ID"; Rec."Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chief Audit Executive ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part("Audit Program/Schedule"; "Audit Project Schedule Line")
            {
                SubPageLink = "Engagement ID" = field("Engagement ID");
                ApplicationArea = Basic;
            }
            group("Auditee Details")
            {
                field("Auditee Type"; Rec."Auditee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Type field.';
                }
                field("Primary Auditee ID"; Rec."Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Auditee ID field.';
                }
                field("Auditee Name"; Rec."Auditee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Name field.';
                }
                field("Lead Auditee Representative ID"; Rec."Lead Auditee Representative ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditee Representative ID field.';
                }
                field("Lead Auditee Email"; Rec."Lead Auditee Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditee Email field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Budget Cost (LCY)"; Rec."Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Cost (LCY) field.';
                }
                field("Budget Control Job No"; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Control Job No field.';
                }
                field("Budget Control Job Task No."; Rec."Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Control Job Task No. field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = AddWatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageView = where("Section Type" = filter(Overview));
                ToolTip = 'Executes the Overview action.';
            }
            action(Scope)
            {
                ApplicationArea = Basic;
                Image = BinContent;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageView = where("Section Type" = filter(Scope));
                ToolTip = 'Executes the Scope action.';
            }
            action("Scope Exclusions")
            {
                ApplicationArea = Basic;
                Image = CalculateBalanceAccount;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageView = where("Section Type" = filter("Scope Exclusion"));
                ToolTip = 'Executes the Scope Exclusions action.';
            }
            action("Audit Objectives")
            {
                ApplicationArea = Basic;
                Image = CalculateInventory;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Objectives";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Objectives action.';
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Procedures";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Procedures action.';
            }
            action("Audit Checklists")
            {
                ApplicationArea = Basic;
                Image = Zones;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Checklists";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Checklists action.';
            }
            action("Audit Locations/Sites")
            {
                ApplicationArea = Basic;
                Image = Location;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Locations";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Locations/Sites action.';
            }
            action("Audit Engagement Team")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Teams";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Engagement Team action.';
            }
            action("Required Documents")
            {
                ApplicationArea = Basic;
                Image = EditList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Proj Required Documents";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Required Documents action.';
            }
            action("Copy Audit Engagement")
            {
                ApplicationArea = Basic;
                Image = Copy;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Copy Audit Engagement action.';
                trigger OnAction()
                begin
                    RiskManagement.FnCopyAuditProject(Rec, AuditProjectSchedule, AuditProjectSection, AuditProjectObjective, AuditProjectProcedure, AuditProjectChecklist, AuditProjectLocation,
                    AuditProjectTeam, AuditProjRequiredDocument);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Engagement ID", Rec."Engagement ID");
                    Report.Run(95014, true, true, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Enabled = false;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Dimension Set Entries";
                Visible = false;
                ToolTip = 'Executes the Dimensions action.';
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Attach Documents action.';
                trigger OnAction()
                begin
                    //DMSManagement.FnUploadAuditProjectDocuments("Engagement ID",'Audit Project',RECORDID);
                end;
            }
            action("Default Risks")
            {
                ApplicationArea = Basic;
                Image = RefreshDiscount;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Plan Line Risk";
                RunPageLink = "Audit Plan ID" = field("Audit Plan ID");
                ToolTip = 'Executes the Default Risks action.';
            }
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
        AuditProjectSchedule: Record "Audit Project Schedule";
        AuditProjectSection: Record "Audit Project Section";
        AuditProjectObjective: Record "Audit Project Objective";
        AuditProjectProcedure: Record "Audit Project Procedure";
        AuditProjectChecklist: Record "Audit Project Checklist";
        AuditProjectLocation: Record "Audit ProjectLocation";
        AuditProjectTeam: Record "Audit Project Team";
        AuditProjRequiredDocument: Record "Audit Proj Required Document";
        DMSManagement: Codeunit "DMS Management";

    procedure FnUploadAuditProjectDocuments()
    begin
    end;
}

#pragma implicitwith restore

