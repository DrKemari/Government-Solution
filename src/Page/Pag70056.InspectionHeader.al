#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70056 "Inspection Header"
{
    PageType = Card;
    SourceTable = "Inspection Header1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection No field.';
                }
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Order No field.';
                }
                field("Delivery Note No."; Rec."Delivery Note No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delivery Note No. field.';
                }
                field("Commitee Appointment No"; Rec."Commitee Appointment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commitee Appointment No field.';
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Date field.';
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Name field.';
                }
                field("Tender/Quotation No."; Rec."Tender/Quotation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender/Quotation No. field.';
                }
            }
            part(Control1000000012; "Inspection Lines")
            {
                SubPageLink = "Inspection No" = field("Inspection No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("View Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'View Order';
                    RunObject = Page "Purchase Order";
                    RunPageLink = "No." = field("Order No");
                    ToolTip = 'Executes the View Order action.';
                }
                action("View Inspection Certificate")
                {
                    ApplicationArea = Basic;
                    Caption = 'View Inspection Certificate';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the View Inspection Certificate action.';
                    trigger OnAction()
                    begin
                        InspectionHeader1.Reset;
                        InspectionHeader1.SetRange("Inspection No", Rec."Inspection No");
                        if InspectionHeader1.FindFirst then begin
                            //MESSAGE('sd');
                            Report.Run(70006, true, true, InspectionHeader1);
                        end;
                    end;
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Attach Documents action.';
                    trigger OnAction()
                    begin
                        DMSManagement.UploadStandardinspectionDocuments(Rec."Inspection No", 'Inpsection Details', Rec.RecordId);
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

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
            }
            group(Approvals)
            {
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
                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.TestField("Delivery Note No.");

                    if not Confirm('Are you sure you want to send it for approval?') then
                        exit;


                    //if //ApprovalsMgmt.IsInspectionApprovalsWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnSendInspectionForApproval(Rec);
                    CurrPage.Close();
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
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    if not Confirm('Are you sure you want to cancel approval request?') then
                        exit;

                    //if //ApprovalsMgmt.CheckInspectionWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnCancelInspectionApprovalRequest(Rec);
                    CurrPage.Close();
                end;
            }
            action(Approve)
            {
                ApplicationArea = All;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Approve the requested changes.';

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    if not Confirm('Are you sure you want to Approve the document?') then
                        exit;
                    //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    CurrPage.Close();
                end;
            }
            action(Reject)
            {
                ApplicationArea = All;
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Reject the approval request.';

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    if not Confirm('Are you sure you want to Reject the document?') then
                        exit;
                    //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    CurrPage.Close;
                end;
            }
            action(Comment)
            {
                ApplicationArea = All;
                Caption = 'Comments';
                Image = ViewComments;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'View or add comments for the record.';

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //ApprovalsMgmt.GetApprovalComment(Rec);
                end;
            }
        }
    }

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        InspectionHeader1: Record "Inspection Header1";
        InspectionLines1: Record "Inspection Lines1";
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

