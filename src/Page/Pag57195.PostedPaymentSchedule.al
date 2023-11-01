#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57195 "Posted Payment Schedule"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Payments;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Group Code"; Rec."Posting Group Code")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Resources Posting Group";
                    Editable = false;
                    LookupPageID = "Resources Posting Group";
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paying Bank No."; Rec."Paying Bank No.")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Resources"; Rec."No. of Resources")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Resources Total Amount"; Rec."Resources Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount';
                    Editable = false;
                }
                field("Resources Total WTax"; Rec."Resources Total WTax")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total WTax';
                    Editable = false;
                }
                field("Resources Total Net"; Rec."Resources Total Net")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Net Amount';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000021; "Payment Entries")
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

                    trigger OnAction()
                    begin
                        Rec.TestField("Posting Group Code");
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval

                        Rec.TestField("Payment Narration");

                        Rec.TestField(Date);
                        pvheaders.Reset;
                        pvheaders.SetRange(pvheaders."No.", Rec."No.");
                        if pvheaders.Find('-') then begin
                            pvLines.Reset;
                            pvLines.SetRange(pvLines.No, pvheaders."No.");
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
                        Report.Run(57041, true, true, Rec)
                    end;
                }
                action(EFT)
                {
                    ApplicationArea = Basic;
                    Image = ExportElectronicDocument;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        PaymentEntries.Reset;
                        PaymentEntries.SetRange(No, Rec."No.");
                        if PaymentEntries.FindSet then
                            Report.Run(89039, true, true, PaymentEntries);
                    end;
                }
                action("Import Resources")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Resources';
                    Ellipsis = true;
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        ImportResources.GetRec(Rec);
                        ImportResources.Run;
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
                action("Process Payments")
                {
                    ApplicationArea = Basic;
                    Image = Payment;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Released);
                        Rec.TestField(Posted, true);
                        Rec.TestField("Payment processed", false);
                        Rec.CalcFields("Resources Total Net", "Resources Total Amount", "Resources Total WTax");
                        if Confirm(text0003, false, Rec."No.") then begin
                            //get the no. series
                            CashMgt.Reset;
                            if CashMgt.Find('-') then begin
                                Noseries := Rec."Paying Bank No.";
                            end;

                            pvheaders.Init;
                            pvheaders."No." := NoSeriesMgt.GetNextNo(Noseries, pvheaders.Date, true);
                            pvheaders.Date := Today;
                            pvheaders."Created By" := UserId;
                            pvheaders."Payment Narration" := Rec."Payment Narration";
                            pvheaders."Created By" := UserId;
                            pvheaders.Job := Rec.Job;
                            pvheaders.Budgeted := true;
                            pvheaders."Currency Code" := Rec."Currency Code";
                            pvheaders."Currency Factor" := Rec."Currency Factor";
                            pvheaders."Job Task No" := Rec."Job Task No";
                            pvheaders.Insert;
                            //Machira attachments start

                            pvheaders1.Reset;
                            pvheaders1.SetRange("No.", Rec."No.");
                            if pvheaders1.FindFirst then begin
                                IDEntry := pvheaders1.RecordId;
                                RecordLink.Reset;
                                RecordLink.SetRange("Record ID", IDEntry);
                                if RecordLink.FindSet then begin
                                    repeat
                                        PVHeader.Reset;
                                        PVHeader.SetRange("No.", pvheaders."No.");
                                        if PVHeader.FindFirst then begin
                                            RecordLink1.Reset;
                                            if RecordLink1.FindLast then begin
                                                "EntryNo." := RecordLink1."Link ID";
                                            end;
                                            RecordLink1.Init;
                                            RecordLink1."Link ID" := "EntryNo." + 1;
                                            RecordLink1."Record ID" := PVHeader.RecordId;
                                            RecordLink1.URL1 := RecordLink.URL1;
                                            RecordLink1.Description := RecordLink.URL1;
                                            RecordLink1.Company := RecordLink.Company;
                                            RecordLink1.Type := RecordLink.Type;
                                            RecordLink1.Created := RecordLink.Created;
                                            RecordLink1."User ID" := RecordLink."User ID";
                                            RecordLink1.Insert;
                                        end;
                                    until RecordLink.Next = 0;

                                end;
                            end;
                            //end Machira attachments
                            EmployeePostingGroupX.Reset;
                            EmployeePostingGroupX.SetRange(Code, Rec."Posting Group Code");
                            if EmployeePostingGroupX.FindSet then begin
                                pvLines.Init;
                                pvLines.No := pvheaders."No.";
                                pvLines."Line No" := PaymentEntries."Line No";
                                pvLines.Type := 'VENDOR D';
                                pvLines."Account Type" := EmployeePostingGroupX."Account Type";
                                pvLines."Account No" := EmployeePostingGroupX."Account No.";
                                pvLines.Validate("Account No");
                                pvLines."Currency Code" := Rec."Currency Code";
                                pvLines."W/Tax Code" := 'W5%';
                                //pvLines."W/Tax Rate":=5;
                                pvLines."Applies to Doc. No" := Rec."No.";
                                pvLines.Amount := Rec."Resources Total Amount";
                                pvLines.Validate(Amount);
                                pvLines."W/Tax Amount" := Rec."Resources Total WTax";
                                pvLines."Net Amount" := Rec."Resources Total Net";
                                pvLines.Insert;

                            end;
                            Rec."Payment processed" := true;
                            Rec.Modify(true);
                            Message('Payment voucher for the document %1 has been processed, Kindly send it for approval', Rec."No.");
                        end

                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        PaymentsPost.PostPaymentSchedule(Rec);
                    end;
                }
                action("Absa Payments Report")
                {
                    ApplicationArea = Basic;
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        Payments.Reset;
                        Payments.SetRange("No.", Rec."No.");
                        if Payments.FindSet then
                            Report.Run(89043, true, true, Payments);
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Payment Schedule"
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
        pvheaders: Record Payments;
        ReopenPV: Codeunit Payments;
        usersetup: Record "User Setup";
        text0002: label 'This Payment Voucher can only be edited by the initiator';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CashMgt: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ImportResources: XmlPort "Import Resources";
        text0003: label 'Are you sure you want to raise a payment voucher';
        text0004: label 'A payment voucher %1  has already been raised';
        PaymentEntries: Record "Payment Entries";
        Noseries: Code[30];
        EmployeePostingGroupX: Record "Employee Posting GroupX";
        EFTResources: XmlPort "EFT Resources";
        Payments: Record Payments;
        PVHeader: Record Payments;
        RecordLink: Record "Record Link";
        RecordLink1: Record "Record Link";
        IDEntry: RecordID;
        "EntryNo.": Integer;
        pvheaders1: Record Payments;

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        // OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
    end;

    procedure AssistEdit(OldVend: Record Payments): Boolean
    var
        Vend: Record Payments;
    begin
    end;
}

#pragma implicitwith restore

