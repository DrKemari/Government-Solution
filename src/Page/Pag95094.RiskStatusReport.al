#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95094 "Risk Status Report"
{
    PageType = Card;
    SourceTable = "Risk M&E Header";

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
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Risk Register Type"; Rec."Risk Register Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Report Start Date"; Rec."Report Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Report End Date"; Rec."Report End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control20; "Risk Status Report Lines")
            {
                Caption = 'Open Risk Status';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
            part(Control14; "RMP Line Response Actions")
            {
                Caption = 'Risk Response Action Status';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                Visible = false;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Open Risks")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    RiskManagement.FnSuggestOpenRisks(RiskStatusReportLine, Rec);
                    RiskManagement.FnSuggestOpenRSRRiskResponseActionStatus(RiskStatusReportLine, Rec, RiskStatusRptRespAction);
                    Message('Suggested successfully');
                end;
            }
            action("Log New Risk Incidents")
            {
                ApplicationArea = Basic;
                Image = Log;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

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

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField("Risk Management Plan ID");
                    //TESTFIELD(Status,Status::Released);
                    RiskManagement.FnUpdateRMPFromRSR(Rec);
                    RiskManagement.FnUpdateRiskOwnership(Rec);
                    RiskManagement.FnUpdateRiskResponseActionsRSR(Rec);
                    //RiskManagement.FnUpdateRiskRILedgerEntry(Rec,NewRiskVoucherLine,RiskStatusReportLine,NewRiskLineResponseAction,RiskStatusRptRespAction,RiskStatusRptIncident);
                    //MESSAGE('Document %1 posted successfully',"Document No");
                    Message('RMP %1 updated successfully', Rec."Risk Management Plan ID");

                    Rec.Posted := true;
                    Rec."Posting Date" := Today;
                    Rec.Modify;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");
                    Report.Run(95007, true, true, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Risk Incident Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Risk Status Report";
    end;

    var
        RiskManagement: Codeunit "Risk Management";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskStatusReportLine: Record "Risk Status Report Line";
        NewRiskLineOwnership: Record "New Risk Line Ownership";
        NewRiskLineResponseAction: Record "New Risk Line Resp. Action";
        NewRiskLineJobTask: Record "New Risk Line Job Task";
        RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action";
        RiskStatusRptIncident: Record "Risk Status Rpt Incident";
}

#pragma implicitwith restore

