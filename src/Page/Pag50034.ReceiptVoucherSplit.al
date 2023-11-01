#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Receipt Voucher-Split (ID 50034).
/// </summary>
Page 50034 "Receipt Voucher-Split"
{
    PageType = Card;
    SourceTable = "Receipt Voucher";
    SourceTableView = where(Type = const(Split),
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
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posting Date';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Modes"; Rec."Payment Modes")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control6; "Receipt Voucher Lines-Split")
            {
                SubPageLink = "Reciept Voucher No" = field("No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Populate Lines")
            {
                ApplicationArea = Basic;
                Image = PickLines;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.TestField("Start Date");
                    Rec.TestField("End Date");
                    if Rec.Type = Rec.Type::Split then begin

                        CBRECEIPTS.Reset;
                        CBRECEIPTS.SetRange(CurrencyCode, Rec."Currency Code");
                        CBRECEIPTS.SetRange(PaymentType2, Rec."Payment Modes");
                        CBRECEIPTS.SetRange("Nav Payment Date", Rec."Start Date", Rec."End Date");
                        CBRECEIPTS.SetRange(MCancelled, 0);
                        if CBRECEIPTS.Find('-') then begin
                            repeat
                                CBRECEIPTS.CalcFields("Nav Receipt Total");
                                if CBRECEIPTS."Nav Receipt Total" <> 0 then begin
                                    ReceiptVoucherLines.Init;
                                    ReceiptVoucherLines."Reciept Voucher No" := Rec."No.";
                                    ReceiptVoucherLines.ReceiptNo := CBRECEIPTS.ReceiptNo;
                                    ReceiptVoucherLines."Line Number" := ReceiptVoucherLines."Line Number" + 1;
                                    ReceiptVoucherLines.Amount := CBRECEIPTS."Nav Receipt Total";
                                    if PosnavCurrencyRelation.Get(Rec."Currency Code") then
                                        ReceiptVoucherLines."Currency Code" := PosnavCurrencyRelation."Related Nav Currency Code";
                                    /* IF PosNavBankRelation.GET("Bank Code") THEN
                                        ReceiptVoucherLines."Bank Code":=PosNavBankRelation."Nav Bank Code";*/
                                    ReceiptVoucherLines."Bank Code" := Rec."Bank Code";
                                    ReceiptVoucherLines.Insert;
                                end;
                            until CBRECEIPTS.Next = 0;
                        end;
                    end;

                end;
            }
            action("Generate Journals")
            {
                ApplicationArea = Basic;
                Image = Journal;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //Delete Lines Present on the General Journal Line
                    GenJnLine.Reset;
                    GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
                    GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
                    GenJnLine.DeleteAll;

                    /*
                      Batch.INIT;
                      IF CMSetup.GET() THEN
                      Batch."Journal Template Name":=CMSetup."Receipt Template";
                      Batch.Name:=CMSetup."Receipt Batch Name";
                      IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
                      Batch.INSERT; */

                    GenJnLine.Reset;
                    GenJnLine.SetRange("Journal Template Name", CMSetup."Receipt Template");
                    GenJnLine.SetRange("Journal Batch Name", CMSetup."Receipt Batch Name");
                    if GenJnLine.FindSet then
                        GenJnLine.DeleteAll;

                    ReceiptVoucherLines.Reset;
                    ReceiptVoucherLines.SetRange("Reciept Voucher No", Rec."No.");
                    if ReceiptVoucherLines.Find('-') then begin
                        repeat
                            LineNo := LineNo + 1000;
                            GenJnLine.Init;
                            if CMSetup.Get then
                                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                            GenJnLine."Line No." := LineNo;
                            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
                            GenJnLine."Account No." := ReceiptVoucherLines."Bank Code";
                            GenJnLine.Validate(GenJnLine."Account No.");
                            GenJnLine."Posting Date" := Rec."Document Date";
                            GenJnLine."Document No." := ReceiptVoucherLines.ReceiptNo;
                            GenJnLine.Description := ReceiptVoucherLines.ReceiptNo + '_' + Rec.Description;
                            GenJnLine.Amount := ReceiptVoucherLines.Amount;
                            GenJnLine."External Document No." := ReceiptVoucherLines.ReceiptNo;
                            GenJnLine."Currency Code" := Rec.Currency;
                            GenJnLine.Validate("Currency Code");
                            GenJnLine.Validate(GenJnLine.Amount);
                            GenJnLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                            GenJnLine."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
                            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                            if GenJnLine.Amount <> 0 then
                                GenJnLine.Insert;

                            Cbrecdet.Reset;
                            Cbrecdet.SetRange(ReceiptNo, ReceiptVoucherLines.ReceiptNo);
                            if Cbrecdet.FindFirst then begin
                                repeat
                                    LineNo := LineNo + 1000;
                                    GenJnLine.Init;
                                    if CMSetup.Get then
                                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                                    GenJnLine."Line No." := LineNo;
                                    PosPostingSetup.Reset;
                                    PosPostingSetup.SetRange("Receipt Category", Cbrecdet.Category);
                                    if PosPostingSetup.Find('-') then begin
                                        GenJnLine."Account Type" := PosPostingSetup."Account Type";
                                        GenJnLine."Account No." := PosPostingSetup."Account No.";
                                    end;
                                    GenJnLine.Validate(GenJnLine."Account No.");
                                    GenJnLine."Posting Date" := Rec."Document Date";
                                    GenJnLine."Document No." := Cbrecdet.ReceiptNo;
                                    ;
                                    GenJnLine."External Document No." := Cbrecdet.ReceiptNo;
                                    GenJnLine.Description := ReceiptVoucherLines.ReceiptNo + '_' + Cbrecdet.TransactionDesc;
                                    GenJnLine.Amount := Cbrecdet.Amount * -1;

                                    // GenJnLine."Currency Code":= ReceiptVoucherLines."Currency Code";
                                    // GenJnLine.VALIDATE("Currency Code");
                                    GenJnLine."Currency Code" := Rec.Currency;
                                    GenJnLine.Validate("Currency Code");
                                    GenJnLine.Validate(GenJnLine.Amount);
                                    GenJnLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                                    GenJnLine."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
                                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                                    if GenJnLine.Amount <> 0 then
                                        GenJnLine.Insert;

                                until Cbrecdet.Next = 0;
                            end;


                        until ReceiptVoucherLines.Next = 0;
                    end;
                    Message('Jounals Created successfully');

                end;
            }
            action("Mark As Posted")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    Rec.TestField("Start Date");
                    Rec.TestField("End Date");
                    if Rec.Type = Rec.Type::Split then begin
                        CBRECEIPTS.Reset;
                        CBRECEIPTS.SetRange(CurrencyCode, Rec."Currency Code");
                        CBRECEIPTS.SetRange(BankFrom1, Rec."Bank Code");
                        CBRECEIPTS.SetRange(PaymentType2, Rec."Payment Modes");
                        CBRECEIPTS.SetRange("Nav Payment Date", Rec."Start Date", Rec."End Date");
                        if CBRECEIPTS.Find('-') then begin
                            repeat
                                CBRECEIPTS.CalcFields("Nav Receipt Total");

                                if CBRECEIPTS."Nav Receipt Total" <> 0 then begin
                                    CBRECEIPTS."Nav Posted" := true;
                                    CBRECEIPTS."Nav Posted By" := UserId;
                                    CBRECEIPTS."Nav Posted Date" := Today;
                                    CBRECEIPTS.Modify;
                                end;
                            until CBRECEIPTS.Next = 0;
                        end;
                    end;

                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Time Posted" := Time;
                    Rec."Date Posted" := Today;
                    Rec.Modify;

                    Message('Voucher Posted and Closed Successfully');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Split;
    end;

    trigger OnOpenPage()
    begin
        Rec.Type := Rec.Type::Split;
    end;

    var
        Cbrecdet: Record CBRECDET;
        PosReceiptCategories: Record "Pos Receipt Categories";
        TotalAmount: Decimal;
        ReceiptVoucherLines: Record "Receipt Voucher Lines";
        PosnavCurrencyRelation: Record "Pos- nav Currency Relation";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        Batch: Record "Gen. Journal Batch";
        Tariffs: Record "Tariff Codes1";
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        NumberText: array[2] of Text[80];
        CurrencyCodeText: Code[10];
        Acct: Record "G/L Account";
        Imprest1: Record Payments;
        PosPostingSetup: Record "Pos Posting Setup";
        CBRECEIPTS: Record CBRECEIPTS;
        PosNavBankRelation: Record "Pos-Nav Bank Relation";
}

