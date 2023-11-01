#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65144 "Inter Project Transfer Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Inter_Project Transfer Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Description field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Main Funds Bank A/C"; Rec."Main Funds Bank A/C")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Funds Bank A/C field.';
                }
                field("Transfer-To Job No"; Rec."Transfer-To Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-To Job No field.';
                }
                field("Transfer-To Task No"; Rec."Transfer-To Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-To Task No field.';
                }
                field("Transfer-To Income G/L A/C"; Rec."Transfer-To Income G/L A/C")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-To Income G/L A/C field.';
                }
                field("Total Transfer Amount"; Rec."Total Transfer Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Transfer Amount field.';
                }
                field("Total Transfer Amount LCY"; Rec."Total Transfer Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Transfer Amount LCY field.';
                }
                field("Transfe-To Directorate"; Rec."Transfe-To Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfe-To Directorate field.';
                }
                field("Transfe-To Department/Center"; Rec."Transfe-To Department/Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfe-To Department/Center field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control20; "Inter-Project Transfer Lines")
            {
                SubPageLink = "Document No" = field(No);
                ApplicationArea = Basic;
            }
            group("Currency Details")
            {
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if Rec."Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
                        else
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = Action::OK then begin
                            Rec.Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
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
                                  "No." = field("No. Series");
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
                        Message('Testing');
                        /*ApprovalEntries.Setfilters(DATABASE::Payments,8,"No.");
                        ApprovalEntries.RUN;*/

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
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin

                        Message('Testing');

                        /*//if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                          //ApprovalsMgmt.OnSendPaymentsForApproval(Rec);*/

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin

                        Message('Testing Two');
                        /*//ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);*/

                    end;
                }
                separator(Action34)
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


                        Message('Testing Three');
                        /*usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        ReopenPV.PerformManualReopen(Rec);*/

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
                        Message('Testing Four');
                        /*usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        TESTFIELD("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);*/

                    end;
                }
                separator(Action28)
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
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to post this Interfund Document?', true) = false then
                            exit;

                        Rec.CalcFields("Total Transfer Amount", "Total Transfer Amount LCY");

                        Temp.Get(UserId);
                        JTemplate := Temp."Interfund Journal Template";
                        JBatch := Temp."Interfund Journal Batch";
                        if JTemplate = '' then begin
                            Error('Ensure the Interfund Journal Template is set up in Funds User Setup');
                        end;
                        if JBatch = '' then begin
                            Error('Ensure the Interfund Journal Batch is set up in the Funds User Setup')
                        end;

                        GenJournalLine.Reset;
                        GenJournalLine.SetRange("Journal Template Name", JTemplate);
                        GenJournalLine.SetRange("Journal Batch Name", JBatch);
                        GenJournalLine.DeleteAll;

                        CashMangement.Get();
                        CashMangement.TestField("Gen. Prod. Posting Group");
                        CashMangement.TestField("VAT. Prod. Posting Group");

                        //Post Transfer To Job
                        LineNumber := 0;
                        LineNumber := LineNumber + 1000;
                        FundsAccounting.FnPostInterfundCredit(JTemplate, JBatch, LineNumber, Rec."Document Date", Genline."document type"::" ", Rec.No, Rec."External Document No.", Genline."account type"::"G/L Account", Rec."Transfer-To Income G/L A/C",
                                                       Genline."gen. posting type"::Sale, CashMangement."VAT. Prod. Posting Group", CashMangement."Gen. Prod. Posting Group", Rec."Currency Code",
                                                       Rec."Transfer-To Job No", Rec."Transfer-To Task No", Genline."job line type"::" ", 1, Rec."Posting Description", Rec."Total Transfer Amount" * -1,
                                                       Rec."Total Transfer Amount LCY" * -1, 0, Rec."Shortcut Dimension 1 Code", Rec."Shortcut Dimension 2 Code");

                        ////Post Transfer From
                        InterfundLine.Reset;
                        InterfundLine.SetRange("Document No", Rec.No);
                        if InterfundLine.FindSet then begin
                            repeat
                                LineNumber := LineNumber + 1000;
                                FundsAccounting.FnPostInterfundDebit(JTemplate, JBatch, LineNumber, Rec."Document Date", Genline."document type"::" ", Rec.No, Rec."External Document No.", Genline."account type"::"G/L Account", InterfundLine."Transfer-From Expense G/L A/C",
                                                          Genline."gen. posting type"::Purchase, CashMangement."VAT. Prod. Posting Group", CashMangement."Gen. Prod. Posting Group", Rec."Currency Code",
                                                          InterfundLine."Transfer-From Job No", InterfundLine."Transfer-From Task No", Genline."job line type"::" ", 1, InterfundLine."Expensing Description", InterfundLine."Transfer Line Amount",
                                                          InterfundLine."Transfer Line Amount LCY", 0, InterfundLine."Shortcut Dimension 1 Code", InterfundLine."Shortcut Dimension 2 Code");
                            until InterfundLine.Next = 0;
                        end;


                        //Call Posting Codeunit
                        FundsAccounting.FnPostJournal(JTemplate, JBatch);

                        //update job ledger entry
                        //FundsAccounting.FnChangeEntryToPositive(No,"Transfer-To Job No","Transfer-To Task No","Total Transfer Amount","Total Transfer Amount LCY","Posting Date");

                        //Post Fund Movement Entries.
                        EntryN := FundsAccounting.FnGetlastentryNo();
                        if EntryN = 0 then
                            EntryN := 1
                        else
                            EntryN := FundsAccounting.FnGetlastentryNo() + 1;
                        FundsAccounting.FnPostFundMovementEntries(EntryN, Rec.No, Rec."Document Date", Rec."External Document No.", Rec."Posting Description", Rec."Main Funds Bank A/C", Rec."Currency Code", Rec."Transfer-To Job No", Rec."Total Transfer Amount", Rec."Total Transfer Amount LCY", 0, false);

                        InterfundLine.Reset;
                        InterfundLine.SetRange("Document No", Rec.No);
                        if InterfundLine.FindSet then begin
                            repeat
                                EntryN := FundsAccounting.FnGetlastentryNo() + 1;
                                FundsAccounting.FnPostFundMovementEntries(EntryN, Rec.No, Rec."Document Date", Rec."External Document No.", Rec."Posting Description", Rec."Main Funds Bank A/C", Rec."Currency Code", InterfundLine."Transfer-From Job No", InterfundLine."Transfer Line Amount" * -1,
                                               InterfundLine."Transfer Line Amount LCY" * -1, 0, false);

                            until InterfundLine.Next = 0;
                        end;

                        //Mark Document as posted
                        Rec.Posted := true;
                        Rec.Modify;
                    end;
                }
            }
        }
    }

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        FundsAccounting: Codeunit "Funds  Accounting";
        LineNumber: Integer;
        Temp: Record "Funds User Setup";
        JTemplate: Code[50];
        JBatch: Code[50];
        Genline: Record "Gen. Journal Line";
        Project: Record Job;
        CashMangement: Record "Cash Management Setup";
        GenJournalLine: Record "Gen. Journal Line";
        InterfundLine: Record "Inter-Project Transfer Line";
        EntryN: Integer;
}

#pragma implicitwith restore

