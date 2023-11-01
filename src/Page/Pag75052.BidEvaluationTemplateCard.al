#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75052 "Bid Evaluation Template Card"
{
    PageType = Card;
    SourceTable = "Bid Scoring Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'Template ID';
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Template type"; Rec."Template type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default Procurement Type"; Rec."Default Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Procurement Type field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Total Preliminary Checks Score"; Rec."Total Preliminary Checks Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Preliminary Checks Score % field.';
                }
                field("Total Technical Evaluation %"; Rec."Total Technical Evaluation %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Technical Evaluation % field.';
                }
                field("Total Financial Evaluation"; Rec."Total Financial Evaluation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Financial Evaluation Score % field.';
                }
                field("Total Assigned Score/Weight %"; Rec."Total Assigned Score/Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Assigned Score/Weight % field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control16; "Bid Evaluation Requirement")
            {
                Caption = 'Evaluation Criteria';
                SubPageLink = "Template ID" = field(Code);
                ApplicationArea = Basic;
            }
            group("Option Text Setups")
            {
                Caption = 'Option Text Setups';
                field("Default YES Bid Rating Score %"; Rec."Default YES Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default YES Bid Rating Score % field.';
                }
                field("Default NO Bid Rating Score %"; Rec."Default NO Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default NO Bid Rating Score % field.';
                }
                field("YES Bid Rating Response Value"; Rec."YES Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default YES Bid Rating Response Value field.';
                }
                field("NO Bid Rating Response Value"; Rec."NO Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NO Bid Rating Response Value field.';
                }
                field("Max Bid Value Limit"; Rec."Max Bid Value Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Bid Value Limit field.';
                }
                field("1-POOR Option Text Bid Score %"; Rec."1-POOR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 1-POOR Option Text Bid Score % field.';
                }
                field("2-FAIR Option Text Bid Score %"; Rec."2-FAIR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 2-FAIR Option Text Bid Score % field.';
                }
                field("3-GOOD Option Text Bid Score %"; Rec."3-GOOD Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 3-GOOD Option Text Bid Score % field.';
                }
                field("4-VERY GOOD  Text Bid Score %"; Rec."4-VERY GOOD  Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 4-VERY GOOD Option Text Bid Score % field.';
                }
                field("5-EXCELLENT Text Bid Score %"; Rec."5-EXCELLENT Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 5-EXCELLENT Option Text Bid Score % field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control4; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control3; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control2; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."code" <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        //CurrPage.SAVERECORD;
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "No." = field(Code);
                    ToolTip = 'View or add comments for the record.';
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
                action("Criteria Groups")
                {
                    ApplicationArea = Basic;
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bid Score Criteria Group";
                    RunPageLink = "Template ID" = field(Code);
                    ToolTip = 'Executes the Criteria Groups action.';
                }
            }
        }
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
            group(ActionGroup42)
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
                        if Rec.Released = false then
                            Error('Document must be Released');
                        Rec.Released := false;
                        Rec.Modify;
                        Message('Supplier Rating Template %1 has been opened successfuly', Rec.Code);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                Visible = false;
                action("Suggest Score Guide Entries")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Score Guide Entries';
                    Ellipsis = true;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestBidScoreGuide(Rec);
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
                    Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';
                    Visible = false;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*//if //ApprovalsMgmt.CheckVendDebarmentApprovalPossible(Rec) THEN
                          //ApprovalsMgmt.OnSendVendDebarmentForApproval(Rec);*/


                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';
                    Visible = false;

                    trigger OnAction()
                    var
                        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        /*//ApprovalsMgmt.OnCancelVendDebarmentApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(RECORDID);*/

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
        Procurement: Codeunit "Procurement Processing";
}

#pragma implicitwith restore

