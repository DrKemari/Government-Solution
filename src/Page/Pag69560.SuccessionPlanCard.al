#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69560 "Succession Plan Card"
{
    PageType = Document;
    SourceTable = "Succession Plan Header";

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General Details';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control10; "Succession Plan Lines")
            {
                SubPageLink = "Document No" = field(Code);
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
            group(ActionGroup13)
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
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify(true);
                        Message('Approved Successfully');
                        //ReleasePurchDoc.ReleaseVendDebarment(Rec);
                        //Procurement.ReleaseSupplierRatingTemplate(Rec)
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
                        Rec.TestField(Status, Rec.Status::Released);
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                        Message('Reopened Successfully');
                        //ReleasePurchDoc.ReopenVendDebarment(Rec);
                        /*IF Released=FALSE THEN
                          ERROR('Document must be Released');
                        Released:=FALSE;
                        MODIFY;
                        MESSAGE('Supplier Rating Template %1 has been opened successfuly',Code);*/

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

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(69552, true, true, Rec);
                    end;
                }
                action("Suggest Initiatives")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        SuccessionPlanInitiatives.Reset;
                        SuccessionPlanInitiatives.SetRange("Document No", Rec.Code);
                        if SuccessionPlanInitiatives.FindSet then
                            SuccessionPlanInitiatives.DeleteAll;
                        SuccessionPlanLines.Reset;
                        SuccessionPlanLines.SetRange("Document No", Rec.Code);
                        if SuccessionPlanLines.FindSet then begin
                            repeat
                                SuccessionPlanLines.TestField("Default Mentorship Template");
                                SuccessionTemplateLines.Reset;
                                SuccessionTemplateLines.SetRange("Document No", SuccessionPlanLines."Default Mentorship Template");
                                if SuccessionTemplateLines.FindSet then begin
                                    repeat
                                        SuccessionPlanInitiatives.Init;
                                        SuccessionPlanInitiatives."Document No" := Rec.Code;
                                        SuccessionPlanInitiatives."Employee No" := SuccessionPlanLines."Employee No";
                                        SuccessionPlanInitiatives."Entry No" := SuccessionPlanInitiatives."Entry No" + 100;
                                        SuccessionPlanInitiatives."Initiative Category" := SuccessionTemplateLines."Initiative Category";
                                        SuccessionPlanInitiatives.Initiative := SuccessionTemplateLines.Initiative;
                                        SuccessionPlanInitiatives."Planned End Date" := SuccessionPlanLines."Planned End Date";
                                        SuccessionPlanInitiatives."Planned Start Date" := SuccessionPlanLines."Planned Start Date";
                                        SuccessionPlanInitiatives."Responsible Officer" := SuccessionPlanLines.Mentor;
                                        SuccessionPlanInitiatives.Status := SuccessionPlanInitiatives.Status::Planned;
                                        SuccessionPlanInitiatives.Insert(true);
                                    until SuccessionTemplateLines.Next = 0;
                                end;

                            until SuccessionPlanLines.Next = 0;
                        end;

                        Message('Initiatives Suggested Successfully');
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
        SuccessionTemplateLines: Record "Succession Template Lines";
        SuccessionPlanInitiatives: Record "Succession Plan Initiatives";
        SuccessionPlanLines: Record "Succession Plan Lines";
}

#pragma implicitwith restore

