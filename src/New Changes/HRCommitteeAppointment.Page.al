#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 50023 "HR Committee Appointment"
{
    Caption = 'Committee Appointment Voucher';
    PageType = Card;
    SourceTable = "Commitee Appointment Voucher";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Type ID"; Rec."Committee Type ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Committee Type';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tenure End Date"; Rec."Tenure End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                }
                field("Staff ID"; Rec."Staff ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field("Branch/Centre"; Rec."Branch/Centre")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control6; "Committe Appointment Lines")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
            }
            systempart(Control27; Notes)
            {
            }
            systempart(Control28; MyNotes)
            {
            }
            systempart(Control29; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Appoint)
            {
                ApplicationArea = Basic;
                Caption = 'Appoint & Notify';
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Appoint the selected members';
                begin
                    if Confirm(TXT001) = true then begin
                        Rec.TestField("Approval Status", Rec."approval status"::Released);
                        // Recruitment.FnAppointHRCommiteeeMembers(Rec);
                        //"Approval Status":="Approval Status"::Released;
                        Rec.Modify(true);
                    end
                end;
            }
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    //Message
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", "approval status"::Open);
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Message('Approved Successfully');
                    // IF ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(Rec) THEN
                    //  ApprovalsMgmt.OnSendLeaveAppForApproval(Rec);
                    // END
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    //
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    Rec."Approval Status" := "approval status"::Open;
                    Message('Cancelled Successfully');
                    //ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Appointment;
    end;

    var
        Recruitment: Codeunit Recruitment;
}

