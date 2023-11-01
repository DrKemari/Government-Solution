#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51551 "PSAR Completeness Check"
{
    Caption = 'Programme SAR Completeness Check';
    PageType = Card;
    SourceTable = "Audit Requisition Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Resource Feedback Type"; Rec."Resource Feedback Type")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field("Resource Name"; Rec."Resource Name")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Email"; Rec."Institution Email")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Code"; Rec."Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Task Type"; Rec."Task Type")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan Start Date"; Rec."Audit Plan Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan End Date"; Rec."Audit Plan End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Insitution/Programme No."; Rec."Insitution/Programme No.")
                {
                    ApplicationArea = Basic;
                }
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsible Officer Name';
                }
                field("SAR Completeness Status"; Rec."SAR Completeness Status")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control18; "Completeness Check Lines")
            {
                SubPageLink = Code = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control44; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control45; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control46; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control47; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Preview Voucher")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.RunModal(51304, true, false, Rec);
                end;
            }
            action("Request Resubmission")
            {
                ApplicationArea = Basic;
                Image = Recalculate;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to request a re-submission from the institution?';
                begin
                    if Confirm(TXT001) = true then begin
                        AuditRequisitionHeader.Reset;
                        AuditRequisitionHeader.SetRange("Response No.", Rec."Response No.");
                        if AuditRequisitionHeader.FindSet then begin
                        //    QualityAudit.RequestSARResubmission(Rec);
                        end;

                    end;
                end;
            }
            action("Close Completeness Checks")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to complete the completeness checks for this application?';
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    if Confirm(TXT001) = true then begin
                        AuditRequisitionHeader.Reset;
                        AuditRequisitionHeader.SetRange("Response No.", Rec."Response No.");
                        if AuditRequisitionHeader.FindSet then begin

                            AuditRequisitionHeader."Document Status" := AuditRequisitionHeader."document status"::"Awaiting Site Inspection";
                            AuditRequisitionHeader.Modify(true);
                        end;
                    end;
                end;
            }
            action("Notify Institution")
            {
                ApplicationArea = Basic;
                Caption = 'Send Feedback Voucher';
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
            }
            group(APPROVAL)
            {
                Caption = 'APPROVAL';
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Enabled = true;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        Text001: label 'This request is already pending approval';
                    begin
                        if Rec."Approval Status" <> Rec."approval status"::Open then begin
                            Error(Text001);
                        end
                    end;
                }
                action("Approval Request Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        //ApprovalEntries.Setfilters(DATABASE::"Programme Evaluation Header", entries."Document Type"::"Prog. Evaluation",Code);
                        ApprovalEntries.Run;
                    end;
                }
                action("Approved Request Entries")
                {
                    ApplicationArea = Basic;
                    Image = approval;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Entries";
                    RunPageLink = "Document No." = field("No. Series");
                    Visible = false;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must not be open.

                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"SAR Feedback Voucher";
    end;

    var
        AuditRequisitionHeader: Record "Audit Requisition Header";
        QualityAudit: Codeunit "Accreditation-Quality Audit";
}

#pragma implicitwith restore

