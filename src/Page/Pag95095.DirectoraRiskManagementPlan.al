#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95095 "Directora Risk Management Plan"
{
    Caption = 'CEOs Office Risk Management Plan';
    PageType = Card;
    SourceTable = "Risk Management Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'CEO''s Office';
                    ToolTip = 'Specifies the value of the CEO''s Office field.';
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan ID field.';
                }
                field("Consolidated Risk Mgt Plan No"; Rec."Consolidated Risk Mgt Plan No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consolidated Risk Mgt Plan No field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Detailed Introduction"; Rec."Detailed Introduction")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Detailed Introduction field.';
                }
                field("Primary Mission"; Rec."Primary Mission")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Primary Mission field.';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer No. field.';
                }
                field("Responsible Officer Name"; Rec."Responsible Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsible Officer Name field.';
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planning Start Date field.';
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planning End Date field.';
                }
                field("Risk Likelihood Rate Scale ID"; Rec."Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Risk Likelihood Rate Scale ID field.';
                }
                field("Risk Impact Rating Scale ID"; Rec."Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Risk Impact Rating Scale ID field.';
                }
                field("Overall Risk Rating Scale ID"; Rec."Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Overall Risk Rating Scale ID field.';
                }
                field("Risk Appetite Rating Scale ID"; Rec."Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Risk Appetite Rating Scale ID field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date Time field.';
                }
            }
            part(Control41; "Risk Management Plan Lines")
            {
                Caption = 'Operational Risk Register(Directorate)';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control44; "RMP Statistics")
            {
                Caption = 'Risk Statistics';
                SubPageLink = "Document No" = field("Document No"),
                              "Document Type" = field("Document Type");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Purpose(Goals & Objectives)")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "RMP Objectives";
                ToolTip = 'Executes the Purpose(Goals & Objectives) action.';
            }
            action("Risk & Compliance Roles")
            {
                ApplicationArea = Basic;
                Image = Restore;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "RMP Roles";
                ToolTip = 'Executes the Risk & Compliance Roles action.';
            }
            action("Risk Register Summary")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Risk Register Summary action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document Type", Rec."Document Type");
                    Rec.SetRange("Document No", Rec."Document No");
                    if Rec.FindSet then
                        Report.Run(95002, true, false, Rec);
                end;
            }
            action("Copy Document")
            {
                ApplicationArea = Basic;
                Image = CopyDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Copy Document action.';
                trigger OnAction()
                begin
                    ObjRiskMgt.FnCopyRiskManagementPlanDocument(Rec, RMPLine, Rec."Document Type", '');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reopen action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                end;
            }
            action("New Risk Vouchers")
            {
                ApplicationArea = Basic;
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "New Risk Vouchers";
                RunPageView = where("Document Type" = filter("New Risk Voucher"));
                ToolTip = 'Executes the New Risk Vouchers action.';
            }
            action("Risk Status Reports")
            {
                ApplicationArea = Basic;
                Image = Status;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Periodic Risk Status Reports";
                ToolTip = 'Executes the Risk Status Reports action.';
            }
            action("Risk Incident Logs")
            {
                ApplicationArea = Basic;
                Image = Log;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Periodic Risk Status Reports";
                ToolTip = 'Executes the Risk Incident Logs action.';
            }
            action("Risk Incident Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "New Risk Voucher Lines";
                ToolTip = 'Executes the Risk Incident Ledger Entries action.';
            }
            action("Risk Ownership")
            {
                ApplicationArea = Basic;
                Image = "Order";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "RMP Line Risk Ownerships";
                RunPageLink = "Document No" = field("Document No"),
                              "Document Type" = field("Document Type");
                ToolTip = 'Executes the Risk Ownership action.';
            }
            action("Risk Response Actions")
            {
                ApplicationArea = Basic;
                Image = Restore;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "RMP Line Response Actions";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ToolTip = 'Executes the Risk Response Actions action.';
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Default Dimensions";
                RunPageLink = "No." = field("Document No");
                ToolTip = 'Executes the Dimensions action.';
            }
            action("Directorate RMPs")
            {
                ApplicationArea = Basic;
                Image = DataEntry;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Directorate Risk Mgt. Plans";
                RunPageLink = "Document Type" = filter("Functional (Directorate)");
                ToolTip = 'Executes the Directorate RMPs action.';
            }
            action("Departmental RMps")
            {
                ApplicationArea = Basic;
                Image = DataEntry;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Departmental Risk Mgt. Plans";
                RunPageLink = "Document Type" = filter("Functional (Department)");
                ToolTip = 'Executes the Departmental RMps action.';
            }
            action("Regional RMPs")
            {
                ApplicationArea = Basic;
                Image = DataEntry;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Regional Risk Mgt. Plans";
                RunPageLink = "Document Type" = filter("Functional (Region)");
                ToolTip = 'Executes the Regional RMPs action.';
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Consolidate';
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Consolidate action.';
                trigger OnAction()
                begin
                    RMPLine.Reset;
                    //RMPLine.SETRANGE(RMPLine."Document Type","Document Type");
                    RMPLine.SetRange(RMPLine."Document No", Rec."Document No");
                    if RMPLine.FindSet then begin
                        repeat
                            RiskManagementPlanLine.Init;
                            RiskManagementPlanLine.TransferFields(RMPLine);
                            RiskManagementPlanLine."Document Type" := RiskManagementPlanLine."document type"::Corporate;
                            RiskManagementPlanLine."Document No" := Rec."Consolidated Risk Mgt Plan No";
                            if not RiskManagementPlanLine.Insert(true) then
                                RiskManagementPlanLine.Modify(true);
                        until RMPLine.Next = 0;
                    end;
                    //Notify The Responsible Employee
                    //RiskManagement.FNnotifyImplementationLead(RMPLineResponseAction,Rec);
                    Message('Posted and responsible person notified successfully');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Functional (Directorate)";
    end;

    var
        ObjRiskMgt: Codeunit "Risk Management";
        RMPLine: Record "Risk Management Plan Line";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
}

#pragma implicitwith restore

