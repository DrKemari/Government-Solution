#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57301 "Budget Reallocation Header"
{
    PageType = Card;
    SourceTable = "Budget Reallocation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
            }
            part(Control11; "Budget Reallocation Lines")
            {
                SubPageLink = "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Approved);
                    Rec.TestField(Posted, false);

                    if not Confirm('Do you want to Post?') then
                        exit;

                    KasnebFunctions.PostBudgetReallocations(Rec);
                end;
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
                    Rec.TestField("Approval Status", Rec."approval status"::New);
                    if Rec."Entry Type" = Rec."entry type"::"Re-Allocation" then begin
                        Rec.CalcFields("Net Amount");
                        if Rec."Net Amount" <> 0 then
                            Error('Reallocation Entry is Not Balanced!');
                    end;
                    /*TESTFIELD("Global Dimension 1 Code");
                    TESTFIELD("Global Dimension 2 Code");*/
                    if not Confirm('Are you sure you want to send it for approval?') then
                        exit;


                    //if //ApprovalsMgmt.IsBudgetReallocationApprovalsWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnSendBudgetReallocationForApproval(Rec);
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
                    Rec.TestField("Approval Status", Rec."approval status"::"Approval Pending");
                    if not Confirm('Are you sure you want to cancel approval request?') then
                        exit;

                    //if //ApprovalsMgmt.CheckBudgetReallocationWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnCancelBudgetReallocationApprovalRequest(Rec);
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
        KasnebFunctions: Codeunit KasnebFunctions;
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

#pragma implicitwith restore

