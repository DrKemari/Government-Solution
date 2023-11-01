#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57166 "Imprest Warrant Voucher"
{
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Warrant Voucher"));

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
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Quick-Pay No.';
                    ToolTip = 'Specifies the value of the Quick-Pay No. field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
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
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Travel Date field.';
                }
                field("Imprest Voucher Amount"; Rec."Imprest Voucher Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Voucher Amount field.';
                }
                field("Imprest Voucher Amount(LCY)"; Rec."Imprest Voucher Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Voucher Amount(LCY) field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control1000000017; "Imprest Warrant Lines")
            {
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; Links)
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
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
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

                        // IF Status<>Status::Released THEN
                        // ERROR(Txt0001);
                        // IF Status=Status::Released THEN BEGIN
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57014, true, true, Rec)
                    end;
                }
                action(EFT)
                {
                    ApplicationArea = Basic;
                    Image = ElectronicBanking;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the EFT action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Released);
                        ImprestVoucherLines.Reset;
                        ImprestVoucherLines.SetRange(No, Rec."No.");
                        if ImprestVoucherLines.FindSet then begin
                            Report.Run(69066, true, false, ImprestVoucherLines);
                        end
                    end;
                }
                action("Post Voucher")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Post Voucher action.';
                    trigger OnAction()
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Post Requisition" = false then
                            Error(Text003);
                        PaymentPost.PostWarrantVoucher(Rec);
                    end;
                }
                action(PreviewCheck)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'P&review Check';
                    Image = ViewCheck;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Preview the check before printing it.';

                    trigger OnAction()
                    begin
                        if Rec."Pay Mode" = 'CHEQUE' then begin
                            GenJnLine.DeleteAll;
                            LineNo := 252;
                            GenJnLine.Init;
                            if cmsetup.Get then
                                GenJnLine."Journal Template Name" := cmsetup."Imp Voucher Journal Template";
                            GenJnLine."Journal Batch Name" := cmsetup."Imp Voucher Journal Batch Name";
                            GenJnLine."Line No." := LineNo;
                            PVLines.SetRange(No, Rec."No.");
                            if PVLines.FindSet then begin
                                GenJnLine."Account Type" := PVLines."Account Type";
                                GenJnLine."Account No." := PVLines."Account No.";
                                GenJnLine.Validate(GenJnLine."Account No.");
                                GenJnLine."Posting Date" := Rec."Posting Date";
                                GenJnLine."Document No." := Rec."No.";
                                GenJnLine."External Document No." := Rec."Cheque No";
                                GenJnLine."Payment Method Code" := Rec."Pay Mode";
                                GenJnLine."Currency Code" := Rec."Currency Code";
                                GenJnLine.Validate("Currency Code");
                                GenJnLine.Amount := PVLines.Amount;
                                GenJnLine.Description := CopyStr((Rec."Payment Narration"), 50);
                                //Ruth
                                GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
                                GenJnLine."Bal. Account No." := Rec."Paying Bank Account";

                                GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
                                GenJnLine.Validate("Currency Code");
                                GenJnLine.Validate(GenJnLine.Amount);
                                GenJnLine.Validate("Bal. Account No.");

                            end;
                            GenJnLine.Insert(true);
                            Page.Run(404, GenJnLine, Rec."No.");
                        end
                    end;
                }
                action("Mpesa Payments Report")
                {
                    ApplicationArea = Basic;
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Mpesa Payments Report action.';
                    trigger OnAction()
                    begin

                        Payments.Reset;
                        Payments.SetRange("No.", Rec."No.");
                        if Payments.FindSet then
                            Report.Run(89044, true, true, Payments);
                    end;
                }
            }
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
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval

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
                separator(Action23)
                {
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
                        UserSetup.Get(UserId);
                        UserSetup.TestField(UserSetup."Reopen Document", UserSetup."Reopen Document" = true);
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
                        UserSetup.Get(UserId);
                        UserSetup.TestField(UserSetup."Reopen Document", UserSetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);
                    end;
                }
                separator(Action19)
                {
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
                        DMSManagement.FnUploadWarrantVoucherDocs(Rec."No.", 'Warrant Voucher', Rec.RecordId);
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

                        ApprovalEntries.Setfilters(Database::Payments, 30, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Warrant Voucher";
        Rec."Account Type" := Rec."account type"::Employee;
        Rec."Created By" := UserId;
    end;

    trigger OnOpenPage()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
        SetControlAppearance;
    end;

    var
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Txt0001: label 'You Can only Print Fully Approved Imprest Requisition';
        users: Record "User Setup";
        Text001: label 'Imprest Amount for document number %1 cannot be 0. Kindly check the lines. Attach memo.';
        UserSetup: Record "User Setup";
        Text0001: label 'You cannot Cancel document No. %1. Documents can only be cancelled by initiators ';
        cmsetup: Record "Cash Management Setup";
        Text002: label 'The imprest application has already expired based on the travel date %1,kindly follow up with your Department.';
        Text003: label 'You have insufficient rights to post this voucher,kindly follow up with the ICT';
        Noseries: Code[30];
        LineNo: Integer;
        SMTP: Codeunit "Email Message";
        Body: Text[1024];
        Email: Text[250];
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        ImprestOther: Decimal;
        ReopenPV: Codeunit Payments;
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        Payments: Record Payments;
        DMSManagement: Codeunit "DMS Management";
        GenJnLine: Record "Gen. Journal Line";
        PVLines: Record "Imprest Voucher Lines";

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;


    procedure CreateSurrender(Memo: Code[30])
    var
        Memoheaders: Record "Imprest Memo";
        OtherCost: Record "Other Costs";
        SafariMembers: Record "Project Members";
        CashMgt: Record "Cash Management Setup";
        Imprestheaders: Record Payments;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Imprestlines: Record "Imprest Lines";
        glName: Record "G/L Account";
        ProjectTeam: Record "Project Members";
    begin
        Memoheaders.Reset;
        Memoheaders.SetRange(Memoheaders."No.", Memo);
        if Memoheaders.Find('-') then begin

            SafariMembers.Reset;
            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
            if SafariMembers.Find('-') then
            //BEGIN
            //IF SafariMembers.Type = SafariMembers.Type::Person THEN
            begin
                repeat
                    //get the no. series
                    CashMgt.Reset;
                    if CashMgt.Find('-') then begin
                        Noseries := CashMgt."Imprest Surrender Nos";
                    end;

                    LineNo := 1000;
                    Imprestheaders.Init;
                    Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
                    Imprestheaders.Date := Today;
                    Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
                    Imprestheaders."Account No." := SafariMembers."No.";
                    Imprestheaders."Account Name" := SafariMembers.Name;
                    Imprestheaders."Payment Type" := Imprestheaders."payment type"::Surrender;
                    Imprestheaders.Payee := SafariMembers.Name;
                    Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                    Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                    Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                    Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                    //add the userid of the safari members
                    UserSetup.Reset;
                    UserSetup.SetRange("Resource No", Imprestheaders."Account No.");
                    if UserSetup.Find('-') then begin
                        UserSetup.CalcFields("E-Mail");
                        Message('%1', UserSetup."E-Mail");
                        Imprestheaders."Created By" := UserSetup."User ID";
                        Email := UserSetup."E-Mail";
                        EmailHOD := UserSetup.Approvermail;
                    end;

                    Imprestheaders."Travel Date" := Memoheaders."Start Date";
                    Imprestheaders."Payment Narration" := Memoheaders.Subject;
                    Imprestheaders.Validate(Imprestheaders."Travel Date");
                    Imprestheaders."Document Type" := Imprestheaders."document type"::Surrender;
                    Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                    Imprestheaders."On behalf of" := SafariMembers.Name;
                    Imprestheaders.Status := Imprestheaders.Status::Open;
                    Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 1 Code");
                    Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 2 Code");
                    Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
                    Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");
                    Imprestheaders.Insert;

                    //Start of Imprest lines
                    Imprestlines.Init;
                    Imprestlines."Line No" := LineNo;
                    Imprestlines.No := Imprestheaders."No.";
                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                    SafariMembers.CalcFields("G/L Account");
                    Imprestlines."Account No." := SafariMembers."G/L Account";
                    Imprestlines.Validate(Imprestlines."Account No.");
                    glName.Get(Imprestlines."Account No.");
                    Imprestlines."Account Name" := glName.Name;
                    Imprestlines.Purpose := SafariMembers."Work Type";
                    Imprestlines.Amount := SafariMembers.Entitlement;
                    Imprestlines.Insert;
                    LineNo := LineNo + 10;
                    if SafariMembers."Transport Costs" <> 0 then begin
                        Imprestlines.Init;
                        Imprestlines."Line No" := LineNo;
                        Imprestlines.No := Imprestheaders."No.";
                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                        SafariMembers.CalcFields("G/L Account");
                        Imprestlines."Account No." := SafariMembers."G/L Account";
                        Imprestlines.Validate(Imprestlines."Account No.");
                        glName.Get(Imprestlines."Account No.");
                        Imprestlines."Account Name" := glName.Name;
                        Imprestlines.Purpose := 'Transport Allowance';
                        Imprestlines.Amount := SafariMembers."Transport Costs";
                        Imprestlines.Insert;
                        LineNo := LineNo + 10;
                    end;

                    if SafariMembers."Project Lead" = true then begin
                        ProjectTeam.Reset;
                        ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Rec."No.");
                        ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
                        if ProjectTeam.Find('-') then
                        //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                        begin
                            repeat
                                Imprestlines.Init;
                                Imprestlines."Line No" := LineNo;
                                Imprestlines.No := Imprestheaders."No.";
                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                SafariMembers.CalcFields("G/L Account");
                                Imprestlines."Account No." := ProjectTeam."G/L Account";
                                Imprestlines.Validate(Imprestlines."Account No.");
                                glName.Get(Imprestlines."Account No.");
                                Imprestlines."Account Name" := glName.Name;
                                Imprestlines.Purpose := ProjectTeam."Work Type";
                                Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                                Imprestlines.Insert;
                                LineNo := LineNo + 10;

                            until ProjectTeam.Next = 0;
                        end;
                        OtherCost.Reset;
                        OtherCost.SetRange(OtherCost."Imprest Memo No.", Rec."No.");

                        if OtherCost.Find('-') then begin
                            repeat
                                Imprestlines.Init;
                                Imprestlines."Line No" := LineNo;
                                Imprestlines.No := Imprestheaders."No.";

                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                OtherCost.CalcFields("No.");
                                Imprestlines."Account No." := OtherCost."No.";
                                Imprestlines.Validate(Imprestlines."Account No.");
                                glName.Get(Imprestlines."Account No.");
                                Imprestlines."Account Name" := glName.Name;
                                Imprestlines.Purpose := OtherCost."Required For";
                                Imprestlines.Amount := OtherCost."Line Amount";
                                Imprestlines.Insert;
                                LineNo := LineNo + 10;

                            until OtherCost.Next = 0;
                        end;
                    end;

                    //send email to participants
                    CashMgt.Get;
                    if CashMgt."Send Email Notification" = true then begin
                        Body := 'Your surrender application no. has been generated ' + Imprestheaders."No." + ' has been created from memo no. ' + Memo;

                        //SMTP.Create('CUE Imprest Request', Email2,
                        // Email, 'Surrender ' + 'No: ' + Imprestheaders."No.",
                        // 'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
                        // 'Your imprest surrender no. <b>' + Imprestheaders."No." + '</b> has been generated from memo no. <b>' + "No." +
                        // '</b> Kindly on return from your trip to:' + Imprestheaders."Destination Name" + 'account for it using this document no' + Imprestheaders."No." + 'fill in the actual spent and send it for approval.<BR><BR>', true);
                        //SMTP.AddCC(EmailHOD);

                        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
                        //SMTP.Send();

                    end;

                until SafariMembers.Next = 0;
            end;

            Memoheaders."Imprest Created" := true;
            Memoheaders."Date converted" := Today;
            Memoheaders."Time converted" := Time;
            Memoheaders."Converted By" := UserId;
            Memoheaders.Posted := true;
            Memoheaders.Modify;

        end;
    end;
}

#pragma implicitwith restore

