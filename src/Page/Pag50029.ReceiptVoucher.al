#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50029 "Receipt Voucher"
{
    PageType = Card;
    SourceTable = "Receipt Voucher";
    SourceTableView = where(Type = const(Consolidated));

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
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
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
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
            part(Control6; "Receipt Voucher Lines")
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
                    Rec.TestField("Currency Code");
                    if Rec.Type = Rec.Type::Consolidated then begin

                        CBRECEIPTS.Reset;
                        CBRECEIPTS.SetRange(MCancelled, 0);
                        if CBRECEIPTS.FindFirst then begin
                            Cbrecdet.Reset;
                            Cbrecdet.SetRange(ReceiptNo, CBRECEIPTS.ReceiptNo);
                            if Cbrecdet.Find('-') then begin
                                Cbrecdet.CurrencyCode := CBRECEIPTS.CurrencyCode;
                                Cbrecdet.Modify;
                            end;
                        end;


                        PosReceiptCategories.Reset;
                        if PosReceiptCategories.FindFirst then begin
                            repeat

                                TotalAmount := 0;

                                Cbrecdet.Reset;
                                Cbrecdet.SetRange(Category, PosReceiptCategories.code);
                                Cbrecdet.SetRange("Nav Payment Date", Rec."Start Date", Rec."End Date");
                                Cbrecdet.SetRange(CurrencyCode, Rec."Currency Code");
                                Cbrecdet.CalcSums(Amount);
                                TotalAmount := Cbrecdet.Amount;

                                if TotalAmount <> 0 then begin
                                    ReceiptVoucherLines.Init;
                                    ReceiptVoucherLines."Reciept Voucher No" := Rec."No.";
                                    ReceiptVoucherLines.Category := PosReceiptCategories.code;
                                    ReceiptVoucherLines."Line Number" := ReceiptVoucherLines."Line Number" + 1;
                                    ReceiptVoucherLines.Amount := TotalAmount;
                                    if PosnavCurrencyRelation.Get(Rec."Currency Code") then
                                        ReceiptVoucherLines."Currency Code" := PosnavCurrencyRelation."Related Nav Currency Code";
                                    ReceiptVoucherLines.Insert;
                                end;
                            until PosReceiptCategories.Next = 0;
                        end else
                            Error('Please Setup Pos Receipt Category');
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
                    CMSetup.Get();
                    // Delete Lines Present on the General Journal Line
                    GenJnLine.Reset;
                    GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
                    GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
                    GenJnLine.DeleteAll;


                    Batch.Init;
                    if CMSetup.Get() then
                        Batch."Journal Template Name" := CMSetup."Receipt Template";
                    Batch.Name := CMSetup."Receipt Batch Name";
                    if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                        Batch.Insert;

                    ReceiptVoucherLines.Reset;
                    ReceiptVoucherLines.SetRange("Reciept Voucher No", Rec."No.");
                    if ReceiptVoucherLines.Find('-') then begin
                        repeat
                            PosPostingSetup.Reset;
                            PosPostingSetup.SetRange("Receipt Category", ReceiptVoucherLines.Category);
                            if PosPostingSetup.Find('-') then begin

                                LineNo := LineNo + 1000;
                                GenJnLine.Init;
                                if CMSetup.Get then
                                    GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                                GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                                GenJnLine."Line No." := LineNo;
                                GenJnLine."Account Type" := PosPostingSetup."Bal Account Type";
                                GenJnLine."Account No." := PosPostingSetup."Bal Account No.";
                                GenJnLine.Validate(GenJnLine."Account No.");
                                GenJnLine."Posting Date" := Rec."Document Date";
                                GenJnLine."Document No." := Rec."No.";
                                if PosReceiptCategories.Get(ReceiptVoucherLines.Category) then
                                    GenJnLine.Description := Rec.Description + '_' + PosReceiptCategories.description;
                                GenJnLine.Amount := ReceiptVoucherLines.Amount;
                                // GenJnLine."Currency Code":= ReceiptVoucherLines."Currency Code";
                                //GenJnLine.VALIDATE("Currency Code");
                                GenJnLine.Validate(GenJnLine.Amount);
                                GenJnLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                                GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                                GenJnLine."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
                                GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                                if GenJnLine.Amount <> 0 then
                                    GenJnLine.Insert;

                                LineNo := LineNo + 1000;
                                GenJnLine.Init;
                                if CMSetup.Get then
                                    GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                                GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                                GenJnLine."Line No." := LineNo;
                                GenJnLine."Account Type" := PosPostingSetup."Account Type";
                                GenJnLine."Account No." := PosPostingSetup."Account No.";
                                GenJnLine.Validate(GenJnLine."Account No.");
                                GenJnLine."Posting Date" := Rec."Document Date";
                                GenJnLine."Document No." := Rec."No.";
                                if PosReceiptCategories.Get(ReceiptVoucherLines.Category) then
                                    GenJnLine.Description := Rec.Description + '_' + PosReceiptCategories.description;

                                GenJnLine.Amount := ReceiptVoucherLines.Amount * -1;
                                // GenJnLine."Currency Code":= ReceiptVoucherLines."Currency Code";
                                // GenJnLine.VALIDATE("Currency Code");
                                GenJnLine.Validate(GenJnLine.Amount);
                                GenJnLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                                GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                                GenJnLine."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
                                GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                                if GenJnLine.Amount <> 0 then
                                    GenJnLine.Insert;

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
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Consolidated;
    end;

    trigger OnOpenPage()
    begin
        Rec.Type := Rec.Type::Consolidated;
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
}

