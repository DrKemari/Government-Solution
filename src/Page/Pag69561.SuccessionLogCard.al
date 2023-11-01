#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69561 "Succession Log Card"
{
    PageType = Document;
    SourceTable = "Succession Log Header";

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General Details';
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Succession Program"; Rec."Succession Program")
                {
                    ApplicationArea = Basic;
                }
                field(Mentee; Rec.Mentee)
                {
                    ApplicationArea = Basic;
                }
                field("Mentee Name"; Rec."Mentee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Mentor; Rec.Mentor)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control11; "Succession  Log Lines")
            {
                SubPageLink = "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup18)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReleaseVendDebarment(Rec);
                        //Procurement.ReleaseSupplierRatingTemplate(Rec)
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify(true);
                        Message('Approved Successfully');
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReopenVendDebarment(Rec);
                        /*IF Released=FALSE THEN
                          ERROR('Document must be Released');
                        Released:=FALSE;
                        MODIFY;
                        MESSAGE('Supplier Rating Template %1 has been opened successfuly',Code);*/
                        Rec.TestField(Status, Rec.Status::Released);
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                        Message('Reopened Successfully');

                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Visible = false;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////if //ApprovalsMgmt.CheckBidTabulationApprovalPossible(Rec) THEN
                        // //ApprovalsMgmt.OnSendBidTabulationForApproval(Rec);
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify(true);
                        Message('Approved Successfully');
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        ////ApprovalsMgmt.OnCancelBidTabulationApprovalRequest(Rec);
                        //WorkflowWebhookMgt.FindAndCancel(RECORDID);


                        ////ApprovalsMgmt.OnCancelBidTabulationApprovalRequest(Rec);
                        //WorkflowWebhookMgt.FindAndCancel(RECORDID);
                        Rec.TestField(Status, Rec.Status::Released);
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                        Message('Reopened Successfully');
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    //RunObject = Report "Employee Clocking List";
                }
                action("Suggest Initiatives")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.TestField("Succession Program");
                        Rec.TestField(Mentee);
                        SuccessionLogLines.Reset;
                        SuccessionLogLines.SetRange("Document No", Rec."Document No");
                        if SuccessionLogLines.FindSet then
                            SuccessionLogLines.DeleteAll;

                        SuccessionPlanInitiatives.Reset;
                        SuccessionPlanInitiatives.SetRange("Document No", Rec."Succession Program");
                        SuccessionPlanInitiatives.SetRange("Employee No", Rec.Mentee);
                        SuccessionPlanInitiatives.SetFilter(Status, '<>%1', SuccessionPlanInitiatives.Status::Completed);
                        if SuccessionPlanInitiatives.FindSet then begin
                            repeat
                                SuccessionLogLines.Init;
                                SuccessionLogLines."Document No" := Rec."Document No";
                                SuccessionLogLines."Employee No" := Rec.Mentee;
                                SuccessionLogLines."Position ID" := Rec."Position ID";
                                SuccessionLogLines."Entry No" := SuccessionPlanInitiatives."Entry No";
                                SuccessionLogLines."Initiative Category" := SuccessionPlanInitiatives."Initiative Category";
                                SuccessionLogLines.Initiative := SuccessionPlanInitiatives.Initiative;
                                SuccessionLogLines.Status := SuccessionLogLines.Status::Completed;
                                SuccessionLogLines."Responsible Officer" := SuccessionPlanInitiatives."Responsible Officer";
                                SuccessionLogLines.Insert(true);
                            until SuccessionPlanInitiatives.Next = 0;
                        end;
                        Message('Initiatives Suggested Successfully');
                    end;
                }
                action(Submit)
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        SuccessionLogLines.Reset;
                        SuccessionLogLines.SetRange("Document No", Rec."Document No");
                        if SuccessionLogLines.FindSet then begin
                            repeat
                                SuccessionPlanInitiatives.Reset;
                                SuccessionPlanInitiatives.SetRange("Document No", Rec."Succession Program");
                                SuccessionPlanInitiatives.SetRange("Employee No", Rec.Mentee);
                                SuccessionPlanInitiatives.SetRange("Entry No", SuccessionLogLines."Entry No");
                                if SuccessionPlanInitiatives.FindSet then begin
                                    SuccessionPlanInitiatives.Status := SuccessionLogLines.Status;
                                    SuccessionPlanInitiatives."Actual End Date" := SuccessionLogLines."Actual End Date";
                                    SuccessionPlanInitiatives."Actual Start Date" := SuccessionLogLines."Actual Start Date";
                                    SuccessionPlanInitiatives.Remarks := SuccessionLogLines.Remarks;
                                    SuccessionPlanInitiatives.Modify(true);
                                end;
                            until SuccessionLogLines.Next = 0;
                        end;
                        Message('Submitted successfully');
                    end;
                }
            }
        }
    }

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        SuccessionLogLines: Record "Succession  Log Lines";
        SuccessionPlanInitiatives: Record "Succession Plan Initiatives";
        SuccessionPlanLines: Record "Succession Plan Lines";
}

#pragma implicitwith restore

