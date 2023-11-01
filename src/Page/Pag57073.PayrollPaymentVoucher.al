#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57073 "Payroll Payment Voucher"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(AIE),
                            Posted = const(false),
                            Status = filter(Open | "Pending Approval"),
                            "Regional Manager Name" = const('Yes'));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vote Item field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the On behalf of field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Surrender Due Date"; Rec."Surrender Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrender Due Date field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit  Name field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Job Task No field.';
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount LCY field.';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total VAT Amount field.';
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Witholding Tax Amount field.';
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                    Caption = 'VAT Wthheld Three %';
                    ToolTip = 'Specifies the value of the VAT Wthheld Three % field.';
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Retention Amount field.';
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advance Recovery field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount Paid field.';
                }
                field("PV Remaining Amount"; Rec."PV Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the PV Remaining Amount field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
            }
            part(Control1000000021; "PV Lines")
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
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
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
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        ApprovalEntries.Setfilters(Database::Payments, 8, Rec."No.");
                        ApprovalEntries.Run;
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
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        //TESTFIELD("Funding Source");
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                        //TESTFIELD(Job);
                        //TESTFIELD("Job Task No");
                        if (Rec."Advance Recovery" <> 0) and (Rec."Account No." = '') then begin
                            Error(text0001);
                        end;
                        Rec.TestField("Payment Narration");
                        Rec.TestField(Payee);
                        Rec.TestField(Date);
                        pvheader.Reset;
                        pvheader.SetRange(pvheader."No.", Rec."No.");
                        if pvheader.Find('-') then begin
                            pvLines.Reset;
                            pvLines.SetRange(pvLines.No, pvheader."No.");
                            if pvLines.Find('-') then begin
                                repeat
                                    pvLines.TestField(pvLines."Applies to Doc. No");
                                until pvLines.Next = 0;
                            end;

                        end;


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
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action9)
                {
                }
                action("Suggest Payments Per FundCode")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Suggest Payments Per FundCode action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Surrender Due Date");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        PayrollPeriodEndMonth := CalcDate('CM', Rec."Surrender Due Date");
                        HeaderNo := '';
                        HeaderNo := Rec."No.";

                        vend.Reset;
                        vend.SetRange(Paye, false);
                        vend.SetRange("Net Pay", false);
                        if vend.Find('-') then begin
                            repeat
                                VendorLedger.Reset;
                                VendorLedger.SetRange("Vendor No.", vend."No.");
                                VendorLedger.SetRange("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                                VendorLedger.SetRange("Posting Date", Rec."Surrender Due Date", PayrollPeriodEndMonth);
                                VendorLedger.SetRange(Open, true);
                                if VendorLedger.Find('-') then begin
                                    repeat
                                        RemainingAmount := 0;
                                        VendorLedger.CalcFields(Amount, "Amount (LCY)", "Remaining Amount", "Remaining Amt. (LCY)");
                                        RemainingAmount := VendorLedger."Remaining Amt. (LCY)" * -1;
                                        pvLinesNew.Init;
                                        pvLinesNew.No := HeaderNo;
                                        pvLinesNew."Line No" := FnGetLastLineNo + 1;
                                        pvLinesNew.Type := 'VENDOR D';
                                        pvLinesNew.Validate(Type);
                                        pvLinesNew."Account Type" := pvLinesNew."account type"::Vendor;
                                        pvLinesNew."Account No" := VendorLedger."Vendor No.";
                                        pvLinesNew.Validate("Account No");
                                        pvLinesNew."Applies to Doc. No" := VendorLedger."Document No.";
                                        //  pvLinesNew.VALIDATE("Applies to Doc. No");
                                        pvLinesNew.Validate(Amount, RemainingAmount);
                                        pvLinesNew.Insert;

                                    until VendorLedger.Next = 0;
                                end;
                            until vend.Next = 0;
                        end;

                        Message('Suggestions per FundCode generated Successfully');
                    end;
                }
                action("Suggest Payment Paye")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Suggest Payment Paye action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Surrender Due Date");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        PayrollPeriodEndMonth := CalcDate('CM', Rec."Surrender Due Date");
                        HeaderNo := '';
                        HeaderNo := Rec."No.";

                        vend.Reset;
                        vend.SetRange(Paye, true);
                        if vend.Find('-') then begin
                            repeat
                                VendorLedger.Reset;
                                VendorLedger.SetRange("Vendor No.", vend."No.");
                                VendorLedger.SetRange("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                                VendorLedger.SetRange("Posting Date", Rec."Surrender Due Date", PayrollPeriodEndMonth);
                                VendorLedger.SetRange(Open, true);
                                if VendorLedger.Find('-') then begin
                                    repeat
                                        RemainingAmount := 0;
                                        VendorLedger.CalcFields(Amount, "Amount (LCY)", "Remaining Amount", "Remaining Amt. (LCY)");
                                        RemainingAmount := VendorLedger."Remaining Amt. (LCY)" * -1;
                                        pvLinesNew.Init;
                                        pvLinesNew.No := HeaderNo;
                                        pvLinesNew."Line No" := FnGetLastLineNo + 1;
                                        pvLinesNew.Type := 'VENDOR D';
                                        pvLinesNew.Validate(Type);
                                        pvLinesNew."Account Type" := pvLinesNew."account type"::Vendor;
                                        pvLinesNew."Account No" := VendorLedger."Vendor No.";
                                        pvLinesNew.Validate("Account No");
                                        pvLinesNew."Applies to Doc. No" := VendorLedger."Document No.";
                                        //  pvLinesNew.VALIDATE("Applies to Doc. No");
                                        pvLinesNew.Validate(Amount, RemainingAmount);
                                        pvLinesNew.Insert;

                                    until VendorLedger.Next = 0;
                                end;
                            until vend.Next = 0;
                        end;

                        Message('Suggestions per FundCode generated Successfully');
                    end;
                }
                action("Suggest Payment Net Paye")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Suggest Payment Net Paye action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Surrender Due Date");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        PayrollPeriodEndMonth := CalcDate('CM', Rec."Surrender Due Date");
                        HeaderNo := '';
                        HeaderNo := Rec."No.";

                        vend.Reset;
                        vend.SetRange("Net Pay", true);
                        if vend.Find('-') then begin
                            repeat
                                VendorLedger.Reset;
                                VendorLedger.SetRange("Vendor No.", vend."No.");
                                VendorLedger.SetRange("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                                VendorLedger.SetRange("Posting Date", Rec."Surrender Due Date", PayrollPeriodEndMonth);
                                VendorLedger.SetRange(Open, true);
                                if VendorLedger.Find('-') then begin
                                    repeat
                                        RemainingAmount := 0;
                                        VendorLedger.CalcFields(Amount, "Amount (LCY)", "Remaining Amount", "Remaining Amt. (LCY)");
                                        RemainingAmount := VendorLedger."Remaining Amt. (LCY)" * -1;
                                        pvLinesNew.Init;
                                        pvLinesNew.No := HeaderNo;
                                        pvLinesNew."Line No" := FnGetLastLineNo + 1;
                                        pvLinesNew.Type := 'VENDOR D';
                                        pvLinesNew.Validate(Type);
                                        pvLinesNew."Account Type" := pvLinesNew."account type"::Vendor;
                                        pvLinesNew."Account No" := VendorLedger."Vendor No.";
                                        pvLinesNew.Validate("Account No");
                                        pvLinesNew."Applies to Doc. No" := VendorLedger."Document No.";
                                        //  pvLinesNew.VALIDATE("Applies to Doc. No");
                                        pvLinesNew.Validate(Amount, RemainingAmount);
                                        pvLinesNew.Insert;

                                    until VendorLedger.Next = 0;
                                end;
                            until vend.Next = 0;
                        end;

                        Message('Suggestions per FundCode generated Successfully');
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
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57018, true, true, Rec)
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
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        ReopenPV.PerformManualReopen(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);
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
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        PaymentsPost."Post Payment Voucher"(Rec);
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
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        /*IF USERID<>pvheader."Created By" THEN
          ERROR('%1',text0002);*///Machira

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::AIE;
       // "Regional Manager Name" := true;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        text0001: label 'The customer Account Number Must have a value. Cannot be empty If advance recovery is more than the user.';
        pvLines: Record "PV Lines";
        pvheader: Record Payments;
        ReopenPV: Codeunit Payments;
        usersetup: Record "User Setup";
        text0002: label 'This Payment Voucher can only be edited by the initiator';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        PayrollPeriodEndMonth: Date;
        VendorLedger: Record "Vendor Ledger Entry";
        HeaderNo: Code[50];
        pvLinesNew: Record "PV Lines";
        RemainingAmount: Decimal;
        vend: Record Vendor;

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        // OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
    end;


    procedure FnGetLastLineNo() LastNo: Integer
    var
        pvLinesN: Record "PV Lines";
    begin
        pvLinesN.Reset;
        pvLinesN.SetCurrentkey(pvLinesN."Line No");
        pvLinesN.SetFilter("Line No", '<>%1', 0);
        if pvLinesN.FindLast then begin
            LastNo := pvLinesN."Line No";
        end;
        exit(LastNo);
    end;
}

#pragma implicitwith restore

