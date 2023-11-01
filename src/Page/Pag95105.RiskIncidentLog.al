#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95105 "Risk Incident Log"
{
    PageType = Card;
    SourceTable = "Risk Incident Log";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Incident ID"; Rec."Incident ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Register Type"; Rec."Risk Register Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Description"; Rec."Risk Description")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Incident Category"; Rec."Risk Incident Category")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = Basic;
                }
                field("Severity Level"; Rec."Severity Level")
                {
                    ApplicationArea = Basic;
                }
                field("Occurrence Type"; Rec."Occurrence Type")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Date"; Rec."Incident Date")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Start Time"; Rec."Incident Start Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Incident End Time"; Rec."Incident End Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Incident Time"; Rec."Incident Time")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Location Details"; Rec."Incident Location Details")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Trigger ID"; Rec."Primary Trigger ID")
                {
                    ApplicationArea = Basic;
                }
                field("Root Cause Summary"; Rec."Root Cause Summary")
                {
                    ApplicationArea = Basic;
                    Visible = EscalateDetails;
                }
                field("Category of Person Reporting"; Rec."Category of Person Reporting")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Reported By (Name)"; Rec."Reported By (Name)")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'CEO''s Office ID';
                    Visible = false;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division ID';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time"; Rec."Created Date Time")
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
            part(Control28; "Incident Impact Summary")
            {
                SubPageLink = "Incident No" = field("Incident ID");
                Visible = EscalateDetails;
                ApplicationArea = Basic;
            }
            group("Additional Incident Information")
            {
                Caption = 'Additional Incident Information';
                Visible = false;
                field("Incident Class"; Rec."Incident Class")
                {
                    ApplicationArea = Basic;
                }
                field("HSE Management Plan ID"; Rec."HSE Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Hazard ID"; Rec."Hazard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Police Report Reference No."; Rec."Police Report Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Police Report Date"; Rec."Police Report Date")
                {
                    ApplicationArea = Basic;
                }
                field("Police Station"; Rec."Police Station")
                {
                    ApplicationArea = Basic;
                }
                field("Reporting Officer"; Rec."Reporting Officer")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Escalation Details")
            {
                Caption = 'Escalation Details';
                Visible = true;
                field("Escalate to Officer No"; Rec."Escalate to Officer No")
                {
                    ApplicationArea = Basic;
                }
                field("Ecalate to Officer Name"; Rec."Ecalate to Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Response; Rec.Response)
                {
                    ApplicationArea = Basic;
                    DrillDown = true;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Parties Involved")
            {
                ApplicationArea = Basic;
                Caption = 'Parties Involved';
                Image = PickLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Risk Incident Log Parties";
                RunPageLink = "Incident ID" = field("Incident ID");

                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
            }
            action("Correct_Preventive Action Plan")
            {
                ApplicationArea = Basic;
                Image = Continue;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Risk Incident Log Actions";
                RunPageLink = "Incident ID" = field("Incident ID");

                trigger OnAction()
                begin
                    // MESSAGE('Done');
                end;
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
                    // MESSAGE('Done');
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
                    // MESSAGE('Done');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.Status := Rec.Status::Released;
                    Message('Released Successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReopenDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.Status := Rec.Status::Open;
                    Message('Reopened Successfully');
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
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField("Risk Management Plan ID");
                    RiskManagement.FnPostRiskIncidentLogs(Rec, RiskIncidentLedgerEntry, RiskIncidentLogImpactR);
                    Rec.Posted := true;
                    Rec."Document Status" := Rec."document status"::Closed;
                    Rec.Modify(true);

                    Message('Risk Incident Logs %1 Posted successfully', Rec."Incident ID");
                    CurrPage.Close();
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
                    // MESSAGE('Done');
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
                    // MESSAGE('Done');
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
                    // MESSAGE('Done');
                end;
            }
            action(Escalate)
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //cc
                    Rec.TestField("Escalated?", false);
                    Rec.TestField("Escalate to Officer No");
                    Rec.TestField(Email);
                    if Confirm('Are you sure you want to escalate ?', true) then begin
                        Rec."Escalated?" := true;
                        Rec."Document Status" := Rec."document status"::Escalated;
                        RiskManagement.FNnotifyEscalator(Rec);
                        Rec.Modify(true);
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        EscalateDetails := false;
        if Rec."Escalated?" = true then begin
            EscalateDetails := true;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Risk Incident Report";
    end;

    trigger OnOpenPage()
    begin
        EscalateDetails := false;
        if Rec."Escalated?" = true then begin
            EscalateDetails := true;
        end;
    end;

    var
        RiskManagement: Codeunit "Risk Management";
        RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry";
        RiskIncidentLogImpactR: Record "Risk Incident Log Impact R";
        EscalateDetails: Boolean;
}

#pragma implicitwith restore

