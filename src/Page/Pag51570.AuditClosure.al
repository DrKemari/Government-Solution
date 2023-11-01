#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51570 "Audit Closure"
{
    Caption = 'Audit Closure';
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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No. field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name field.';
                }
                field("Institution Email"; Rec."Institution Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Email field.';
                }
                field("Institution Code"; Rec."Institution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Task Type"; Rec."Task Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Type field.';
                }
                field("Audit Plan Start Date"; Rec."Audit Plan Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Start Date field.';
                }
                field("Audit Plan End Date"; Rec."Audit Plan End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan End Date field.';
                }
                field("Insitution/Programme No."; Rec."Insitution/Programme No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insitution/Programme No. field.';
                }
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsible Officer Name';
                    ToolTip = 'Specifies the value of the Responsible Officer Name field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Board Verdict"; Rec."Board Verdict")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board Verdict field.';
                }
                field("Verdict Date"; Rec."Verdict Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Date field.';
                }
                field("Board Comments"; Rec."Board Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board Comments field.';
                }
                field("Ordinal Number"; Rec."Ordinal Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ordinal Number field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
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
            action("Close Audit Process")
            {
                ApplicationArea = Basic;
                Image = CalculateBalanceAccount;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Close Audit Process action.';
                trigger OnAction()
                var
                    TXT001: label 'Close audit process %1';
                    Job: Record Job;
                begin
                    if Confirm(TXT001, true, Rec."Project No.") = true then begin
                        Rec.TestField("Approval Status", Rec."approval status"::Released);
                        if Confirm('Are you sure you want to complete the accreditation process for this application?') = true then begin
                            Job.Reset;
                            Job.SetRange("No.", Rec."Project No.");
                            if Job.FindSet then begin
                                /*Job."Board Verdict":="Board Verdict";
                                Job."Board Verdict Date":="Verdict Date";
                                Job."Board Verdict Description":="Board Comments";*/
                                Job.Status := Job.Status::Completed;
                                Job."Ending Date" := Today;
                                Job.Validate("Ending Date");
                                Job.Modify;
                                Message('Audit process closed succesfully');

                            end;
                          //  QualityAudit.SendCloseAuditEmail(Rec);
                        end
                    end

                end;
            }
            action("Preview Audit Certificate")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Preview Audit Certificate action.';
                trigger OnAction()
                begin
                    Rec.TestField("Verdict Date");
                    if Rec."Task Type" = Rec."task type"::"Institution Quality Audit" then begin
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(51311, true, false, Rec);
                    end else begin
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(51310, true, false, Rec);
                    end
                end;
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
                    ToolTip = 'Executes the Send Approval Request action.';
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
                    ToolTip = 'Executes the Approvals action.';
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
                    ToolTip = 'Executes the Approved Request Entries action.';
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Request action.';
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
        Rec."Document Type" := Rec."document type"::"Audit Closure";
    end;

    var
        AuditRequisitionHeader: Record "Audit Requisition Header";
        QualityAudit: Codeunit "Accreditation-Quality Audit";
}

#pragma implicitwith restore

