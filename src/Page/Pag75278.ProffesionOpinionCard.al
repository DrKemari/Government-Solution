#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75278 "Proffesion Opinion Card"
{
    PageType = Card;
    SourceTable = "Bid Tabulation Header";

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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Report ID"; Rec."Final Evaluation Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                group("Awarded Winner")
                {
                    Caption = 'Awarded Winner';
                    field("Awarded Bid No"; Rec."Awarded Bid No")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Awarded Bidder No."; Rec."Awarded Bidder No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Awarded Bidder Name"; Rec."Awarded Bidder Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Award Acceptance Deadline"; Rec."Award Acceptance Deadline")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Award Acceptance Response"; Rec."Award Acceptance Response")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Lead';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Lead Name';
                }
                field("Tender Committee Role"; Rec."Tender Committee Role")
                {
                    ApplicationArea = Basic;
                }
                field("Designation/Title"; Rec."Designation/Title")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                group("Key Statistics")
                {
                    Caption = 'Key Statistics';
                    field("No of submitted bids"; Rec."No of submitted bids")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Opened Bids(Tech)"; Rec."No of Opened Bids(Tech)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Opened Bids(Finance)"; Rec."No of Opened Bids(Finance)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Responsive(Tech)"; Rec."No of Responsive(Tech)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of non- Responsive(Tech)"; Rec."No of non- Responsive(Tech)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of Responsive(Finance)"; Rec."No of Responsive(Finance)")
                    {
                        ApplicationArea = Basic;
                    }
                    field("No of non- Responsive(Finance)"; Rec."No of non- Responsive(Finance)")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("General Procurement Remarks"; Rec."General Procurement Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Professional Opinion/Remarks';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control20; "Proffesion Opinion Lines")
            {
                SubPageLink = "Tabulation ID" = field(Code);
                ApplicationArea = Basic;
            }
            group("Procurement Plan Details")
            {
                Caption = 'Procurement Plan Details';
                field("Annual Procurement Plan ID"; Rec."Annual Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Date"; Rec."Procurement Plan Date")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Line No."; Rec."Procurement Plan Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Available Procurement Budget"; Rec."Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Narration"; Rec."Budget Narration")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Sourcing History")
            {
                Caption = 'Sourcing History';
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Completion Date"; Rec."Evaluation Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Comm"; Rec."Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Com"; Rec."Appointed Bid Evaluation Com")
                {
                    ApplicationArea = Basic;
                }
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
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70043, true, true, Rec);
                    end;
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
            group(ActionGroup30)
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
                        /*IF Released=FALSE THEN
                          ERROR('Document must be Released');
                        Released:=FALSE;
                        MODIFY;
                        MESSAGE('Supplier Rating Template %1 has been opened successfuly',Code);*/

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                Visible = false;
                action("Suggest Final Evaluation Reports")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Final Evaluation Reports';
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestProffesionOpinion(Rec);
                    end;
                }
                action("Proceed To Notice Of Award")
                {
                    ApplicationArea = Suite;
                    Caption = 'Proceed To Notice Of Award';
                    Ellipsis = true;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.PostProffesionOpinion(Rec);
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
                        //if //ApprovalsMgmt.CheckBidTabulationApprovalPossible(Rec) then
                        //ApprovalsMgmt.OnSendBidTabulationForApproval(Rec);

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
                        //ApprovalsMgmt.OnCancelBidTabulationApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Professional Opinion";
    end;

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

