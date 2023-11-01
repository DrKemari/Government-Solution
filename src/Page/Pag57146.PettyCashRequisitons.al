#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57146 "Petty Cash Requisitons"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Petty Cash"),
                            Posted = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000021; "PCV Lines Req")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000020; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        /*
                        ApprovalEntries.Setfilters(DATABASE::Payments,7,"No.");
                        ApprovalEntries.RUN;
                        */

                        //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);

                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                                                        //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                        //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                                                        //ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action1000000043)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57003, true, true, Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit Payments;
                    begin
                      //  ReleasePurchDoc.PerformManualRelease(Rec)
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit Payments;
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        Rec.TestField("Funding Source");
                        Rec.TestField(Job);
                        Rec.TestField("Job Task No");
                        PaymentsPost.PostPettyCash(Rec);
                    end;
                }
            }
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
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        DMSManagement.UploadImprestDocuments(Rec."No.", 'Imprest Naration', Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //Live := TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Date := Today;
        //Live := TRUE;

        Rec."Payment Type" := Rec."payment type"::"Petty Cash";
        Rec."Account Type" := Rec."account type"::Employee;
        //"Transaction Type" := "Transaction Type"::"Staff Travel Advances";
        Rec."Document Type" := Rec."document type"::"Petty Cash";

        if USersetup.Get(UserId) then begin
            Rec."Account No." := USersetup."Employee No.";
            Rec."Account Name" := USersetup."Employee Name";
            Rec.Payee := Rec."Account Name";
        end;

        if Employees.Get(Rec."Account No.") then begin
            Rec."Shortcut Dimension 1 Code" := Employees."Global Dimension 1 Code";
            Rec."Shortcut Dimension 2 Code" := Employees."Global Dimension 2 Code";
        end;
    end;

    trigger OnOpenPage()
    begin
        //pcash.RESET;
        //pcash.SETFILTER(pcash."Customer Posting Group",'PCASH');

        SetControlAppearance;
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        Customers: Record Customer;
        Text006: label 'The customer No. %1 has not surrendered previous petty cash Amounting to Kshs. %2!';
        pcash: Record Customer;
        Text007: label 'The selected customer no. %1  is not a valid a petty cash customer!';
        USersetup: Record "User Setup";
        Employees: Record Employee;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        // OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
    end;
}

#pragma implicitwith restore

