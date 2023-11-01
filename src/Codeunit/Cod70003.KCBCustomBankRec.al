#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70003 "KCB Custom Bank Rec"
{

    trigger OnRun()
    begin
    end;


    procedure FnUpdateFutureStatements(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    var
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
    begin
        BankAccReconciliationLine.Reset;
        BankAccReconciliationLine.SetRange("Bank Account No.",BankAccReconciliation."Bank Account No.");
        BankAccReconciliationLine.SetRange("Statement No.",BankAccReconciliation."Statement No.");
        if BankAccReconciliationLine.FindSet then begin
           repeat
               BankAccReconciliationLine."Receipt Date":=0D;
               BankAccReconciliationLine."Future Receipt Date":=false;
              if ((BankAccReconciliationLine.Difference<>0) and (BankAccReconciliationLine."Applied Amount"=0)) then begin
                    BankAccountLedgerEntry.Reset;
                    BankAccountLedgerEntry.SetRange("Bank Account No.",BankAccReconciliationLine."Bank Account No.");
                    BankAccountLedgerEntry.SetRange("Payment Reference No.",BankAccReconciliationLine."Document No.");
                    BankAccountLedgerEntry.SetFilter("Actual Trans Date",'>%1',BankAccReconciliation."Statement Date");
                    if BankAccountLedgerEntry.FindSet then begin
                        repeat
                            if (BankAccReconciliationLine."Transaction Date"<>BankAccountLedgerEntry."Posting Date") then begin
                               BankAccReconciliationLine."Receipt Date":=BankAccountLedgerEntry."Posting Date";
                               BankAccReconciliationLine."Future Receipt Date":=true;
                            end;
                        until BankAccountLedgerEntry.Next=0;
                       end;
                 end;
                   BankAccReconciliationLine.Modify;
           until BankAccReconciliationLine.Next=0;
        end;

        Message('Updated Completely');
    end;


    procedure FnReturnPaymentRefferenceNo(BankAccountLedgerEntry: Record "Bank Account Ledger Entry") PaymentRef: Code[30]
    var
        PaymentRefference: Code[30];
        NewString: Code[30];
    begin

        //     {BankAccountLedgerEntry.RESET;
        //      BankAccountLedgerEntry.SETRANGE("Document No.",'R17423');
        //      PaymentRefference:=BankAccountLedgerEntry."External Document No.";
        //      NewString:=COPYSTR(PaymentRefference,12,20);
        //      MESSAGE( NewString);
        //      IF (NewString<>BankAccountLedgerEntry."Payment Reference No.") THEN BEGIN
        //         BankAccountLedgerEntry."Payment Reference No.":=NewString;
        //      END;}
    end;


    procedure FnGenerateFutureStatementLines(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    var
        BankAccReconLine: Record "Bank Acc. Reconciliation Line";
        BankAccReconLineOriginal: Record "Bank Acc. Reconciliation Line";
    begin
        BankAccReconLineOriginal.Reset;
        BankAccReconLineOriginal.SetRange("Bank Account No.",BankAccReconciliation."Bank Account No.");
        BankAccReconLineOriginal.SetRange("Future Receipt Date",true);
        BankAccReconLineOriginal.SetFilter("Receipt Date",'%1..%2',CalcDate('-CM',BankAccReconciliation."Statement Date"),BankAccReconciliation."Statement Date");
        if BankAccReconLineOriginal.FindSet then begin
          repeat
            BankAccReconLine.Init;
            BankAccReconLine."Statement Type":=BankAccReconLine."statement type"::"Bank Reconciliation";
            BankAccReconLine."Bank Account No.":=BankAccReconLineOriginal."Bank Account No.";
            BankAccReconLine."Statement No.":=BankAccReconciliation."Statement No.";
            BankAccReconLine."Statement Line No." :=FnGetLastNo()+1000;
            BankAccReconLine."Transaction Date" := BankAccReconLineOriginal."Receipt Date";
            BankAccReconLine.Description := BankAccReconLineOriginal.Description;
            BankAccReconLine."Document No." := BankAccReconLineOriginal."Document No.";
            BankAccReconLine."Statement Amount" := BankAccReconLineOriginal."Statement Amount";
            BankAccReconLine.Type := BankAccReconLineOriginal.Type;
            BankAccReconLine."Original Statement No":=BankAccReconLineOriginal."Statement No.";
            BankAccReconLine."Moved From Previous Bank Rec":=true;
            BankAccReconLine."Move Date":=Today;
            BankAccReconLine."Move Time":=Time;
            BankAccReconLine.Insert;
          until BankAccReconLineOriginal.Next=0;
        end;

        Message('Updated Completely');
    end;


    procedure FnGetLastNo() StatementNo: Integer
    var
        BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
    begin
        BankAccReconciliationLine.Reset;
        BankAccReconciliationLine.SetCurrentkey("Statement Line No.");
        BankAccReconciliationLine.FindLast;

        StatementNo:=BankAccReconciliationLine."Statement Line No.";

        exit(StatementNo);
    end;


    procedure FnUpdateBankledgerActualDate(BankAccountLedgerEntry: Record "Bank Account Ledger Entry")
    var
        BankLedgerEntry: Record "Bank Account Ledger Entry";
    begin
        BankLedgerEntry.Reset;
        BankLedgerEntry.SetRange("Document No.",BankAccountLedgerEntry."Document No.");
        if BankLedgerEntry.FindSet then begin
          if FnGetPostingDate(BankAccountLedgerEntry."Payment Reference No.")<>0D then begin
            BankLedgerEntry."Actual Trans Date":=FnGetPostingDate(BankAccountLedgerEntry."Payment Reference No.");

          end else
            if FnGetPostingDateBankImports(BankAccountLedgerEntry."Payment Reference No.")<>0D then begin
            BankLedgerEntry."Actual Trans Date":=FnGetPostingDate(BankAccountLedgerEntry."Payment Reference No.");
           // BankLedgerEntry.MODIFY;
          end else begin
           BankLedgerEntry."Actual Trans Date":=BankAccountLedgerEntry."Posting Date";
            end;
           BankLedgerEntry.Modify;
         end;
    end;


    procedure FnGetPostingDate(DocNumber: Code[50]) PostingDate: Date
    var
        MPESAIntegrationTable: Record "MPESA Integration Table";
    begin
        MPESAIntegrationTable.Reset;
        MPESAIntegrationTable.SetRange(MPESA_TXN_ID,DocNumber);
        if MPESAIntegrationTable.FindSet then begin
          PostingDate:=Dt2Date(MPESAIntegrationTable.MPESA_TXN_DATE);
        end;
        exit(PostingDate);
    end;


    procedure FnGetPostingDateBankImports(DocNumber: Code[50]) PostingDate: Date
    var
        BankImportEntries: Record "Bank Import Entries";
    begin
        BankImportEntries.Reset;
        BankImportEntries.SetRange("Reference No.",DocNumber);
        if BankImportEntries.FindSet then begin
          PostingDate:=BankImportEntries."Transaction Date";
        end;
        exit(PostingDate);
    end;
}

