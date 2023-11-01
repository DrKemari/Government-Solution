report 85139 "Bank Daily Report-3"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bank Daily Report-3.rdlc';

    dataset
    {
        dataitem("Bank Account";"Bank Account")
        {
            RequestFilterFields = "No.";
            column(No_BankAccount;"Bank Account"."No.")
            {
            }
            column(Name_BankAccount;"Bank Account".Name)
            {
            }
            column(BankAccountNo_BankAccount;"Bank Account"."Bank Account No.")
            {
            }
            column(TotalBankImports;TotalBankImports)
            {
            }
            column(TotalBankImportsUnapplied;TotalBankImportsUnapplied)
            {
            }
            column(TotalMpesaImports;TotalMpesaImports)
            {
            }
            column(MinDate;MinDate)
            {
            }
            column(MaxDate;MaxDate)
            {
            }
            column(TotalMiscellaneous;TotalMiscellaneous)
            {
            }
            column(Misc;Misc)
            {
            }
            column(TotalBank;TotalBank)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TotalBankImports:=0;
                TotalMpesaImports:=0;

                //get total bank imports
                TotalBankImports:=GetTotalBankImport("Bank Account",MinDate,MaxDate);
                //get total mpesa
                TotalMpesaImports:=GetTotalMpesaImport("Bank Account",MinDate,MaxDate);

                //Total Misc
                TotalMiscellaneous:=GetTotalMiscellaneous("Bank Account",MinDate,MaxDate);

                //calculate miscellaneous
                Misc:=0;
                ReceiptsHeader1.Reset;
                ReceiptsHeader1.SetRange("Document Type",ReceiptsHeader1."Document Type"::"Student Receipt");
                ReceiptsHeader1.SetRange(Posted, true);
                ReceiptsHeader1.SetFilter("Posted Date",PeriodText);
                if ReceiptsHeader1.FindSet then begin
                  repeat
                      ReceiptsHeader1.CalcFields(ReceiptsHeader1.Amount);
                      Misc:=Misc+ReceiptsHeader1.Amount;
                  until ReceiptsHeader1.Next=0;
                end;
            end;
        }
        dataitem("Cust. Ledger Entry";"Cust. Ledger Entry")
        {
            column(DocumentNo_CustLedgerEntry;"Cust. Ledger Entry"."Document No.")
            {
            }
            column(Amount_CustLedgerEntry;TotalInvoiceAmt)
            {
            }
            dataitem("Student Processing Header";"Student Processing Header")
            {
                DataItemLink = "No."=FIELD("External Document No.");
                column(No_StudentProcessingHeader;"Student Processing Header"."No.")
                {
                }
                column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                //"Cust. Ledger Entry".SETFILTER("Cust. Ledger Entry"."Document No.",'=%1','R0');
                "Cust. Ledger Entry".SetRange("Cust. Ledger Entry".Reversed,false);
                "Cust. Ledger Entry".SetRange("Cust. Ledger Entry"."Payment Method Code",'PAYBILL');

                StRecordBuffer1.Reset;
                StRecordBuffer1.DeleteAll;

                StRecordBuffer.Reset;
                StRecordBuffer.SetRange("Document No.","Cust. Ledger Entry"."External Document No.");
                if not  StRecordBuffer.FindFirst then begin
                //GET THE ACCURATE INVOICE AMOUNT
                if "Cust. Ledger Entry"."Document Type"="Cust. Ledger Entry"."Document Type"::" " then begin
                TotalInvoiceAmt:=0.0;
                SalesInvoiceHeader.Reset;
                SalesInvoiceHeader.SetRange("External Document No.","Cust. Ledger Entry"."External Document No.");
                if SalesInvoiceHeader.FindFirst then begin
                  SalesInvoiceHeader.CalcFields(Amount);
                  TotalInvoiceAmt:=SalesInvoiceHeader.Amount*-1;
                end;
                if TotalInvoiceAmt<>"Cust. Ledger Entry".Amount then
                  TotalInvoiceAmt:=TotalInvoiceAmt;
                end;

                  StRecordBuffer."Entry No.":=TotalNo+1;
                  StRecordBuffer."Document No.":="Cust. Ledger Entry"."External Document No.";
                  StRecordBuffer.Insert(true);
                end;
            end;

            trigger OnPreDataItem()
            begin
                "Cust. Ledger Entry".SetFilter("Cust. Ledger Entry"."Posting Date",'%1..%2',MinDate,MaxDate);
            end;
        }
        dataitem("Receipts Header1";"Receipts Header1")
        {
            DataItemTableView = WHERE("Document Type"=FILTER("Student Receipt"));
            column(TotalMisce;TotalMisce)
            {
            }
            dataitem("Receipt Lines1";"Receipt Lines1")
            {
                DataItemLink = "Receipt No."=FIELD("No.");
                column(Description_ReceiptLines1;"Receipt Lines1".Description)
                {
                }
                column(Amount_ReceiptLines1;"Receipt Lines1".Amount)
                {
                }
                column(MiscDesc;MiscDesc)
                {
                }
                column(TransactionType_ReceiptLines1;"Receipt Lines1"."Transaction Type")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    MiscDesc:='';
                    MisType.Reset;
                    MisType.SetRange(Code,"Receipt Lines1"."Transaction Type");
                    if MisType.FindFirst then
                      MiscDesc:=MisType.Description;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                 TotalMisce:=false;
                MPESAIntegrationTable.Reset;
                MPESAIntegrationTable.SetRange(MPESA_TXN_ID,"Receipts Header1"."Payment Reference No.");
                if  MPESAIntegrationTable.FindFirst then begin
                 TotalMisce:=true;
                end;
            end;

            trigger OnPreDataItem()
            begin
                "Receipts Header1".SetFilter("Receipts Header1"."Posted Date",'%1..%2',MinDate,MaxDate);

                "Receipts Header1".SetRange("Receipts Header1".Posted,true);
                "Receipts Header1".SetRange("Receipts Header1"."Document Type","Receipts Header1"."Document Type"::"Student Receipt");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        PeriodText :="Bank Account".GetFilter("Date Filter");
        MinDate:= "Bank Account".GetRangeMin("Date Filter");
        MaxDate:= "Bank Account".GetRangeMax("Date Filter");
    end;

    var
        GLAccount: Record "G/L Account";
        TotalBankImports: Decimal;
        PeriodText: Text[30];
        TotalMpesaImports: Decimal;
        MpesaDate: Date;
        MinDate: Date;
        MaxDate: Date;
        StudentProcessingHeader: Record "Student Processing Header";
        TotalBankImportsUnapplied: Decimal;
        TotalMisc: Decimal;
        LedgerEntry: Record "Bank Account Ledger Entry";
        TotalMpesaImportsUnapplied: Decimal;
        Misc: Decimal;
        UnappliedReceipts: Decimal;
        TotalBank: Decimal;
        ReceiptsHeader1: Record "Receipts Header1";
        MiscDesc: Text;
        MisType: Record "Miscellaneous Transaction Type";
        TotalMiscellaneous: Decimal;
        TotalCreditAmount: Decimal;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        TotalInvoiceAmt: Decimal;
        StRecordBuffer: Record "St Record Buffer";
        StRecordBuffer1: Record "St Record Buffer";
        TotalNo: Integer;
        MPESAIntegrationTable: Record "MPESA Integration Table";
        TotalMisce: Boolean;
        HiddenMisc: Decimal;
        GLEntry: Record "G/L Entry";

    local procedure GetTotalBankImport(BankAccount: Record "Bank Account";PostedStartDate: Date;PostedEndDate: Date) TotalValue: Decimal
    var
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        BankImportEntries: Record "Bank Import Entries";
        TotalAmount: Decimal;
    begin
        TotalValue:=0.0;
        BankImportEntries.Reset;
        BankImportEntries.SetRange("Bank Code",BankAccount."No.");
        BankImportEntries.SetFilter("Transaction Date",'%1..%2',PostedStartDate,PostedEndDate);
        BankImportEntries.SetRange(Posted,true);
        if BankImportEntries.FindSet then begin
           repeat
                   if BankImportEntries."Reference No."<>' ' then begin
                      BankAccountLedgerEntry.Reset;
                      BankAccountLedgerEntry.SetRange("Bank Account No.",BankAccount."No.");
                      BankAccountLedgerEntry.SetRange("External Document No.",BankImportEntries."Reference No.");
                      BankAccountLedgerEntry.SetFilter("Posting Date",'%1..%2',PostedStartDate,PostedEndDate);
                      BankAccountLedgerEntry.SetRange(Reversed,false);
                      if BankAccountLedgerEntry.FindSet then begin

                            if BankAccountLedgerEntry."Currency Code"='USD' then
                              TotalBankImports:=TotalBankImports+BankAccountLedgerEntry."Amount (LCY)"
                            else
                              TotalBankImports:=TotalBankImports+BankAccountLedgerEntry.Amount;
                           // MESSAGE('%1--%2---%3--%4',BankAccountLedgerEntry."Bank Account No.",BankAccountLedgerEntry."External Document No.",BankAccountLedgerEntry."Amount (LCY)",TotalBankImports);

                      end;
                  end;
            until BankImportEntries.Next=0;
            TotalValue:=TotalBankImports;
        end;
          exit(TotalValue);
    end;

    local procedure GetTotalMpesaImport(BankAccount: Record "Bank Account";StartDate: Date;EndDate: Date) TotalMpesaAmount: Decimal
    var
        TotalMpesa: Decimal;
        MPESAIntegrationTable: Record "Receipts Header1";
        IntegrationTable: Record "MPESA Integration Table";
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
    begin
        //calculate the total  MPESA and Cheque receipts
        TotalMpesaAmount:=0.0;
        MPESAIntegrationTable.Reset;
        MPESAIntegrationTable.SetFilter("Posted Date",'%1..%2',StartDate,EndDate);
        MPESAIntegrationTable.SetRange("Bank Code",BankAccount."No.");
        if MPESAIntegrationTable.FindSet then begin
              repeat
                  BankAccountLedgerEntry.Reset;
                  BankAccountLedgerEntry.SetRange("Document No.",MPESAIntegrationTable."No.");
                  BankAccountLedgerEntry.SetFilter("Posting Date",'%1..%2',StartDate,EndDate);
                  BankAccountLedgerEntry.SetRange(Reversed,false);
                  if BankAccountLedgerEntry.FindSet then begin
                      TotalMpesaImports:=TotalMpesaImports+BankAccountLedgerEntry.Amount;
                  end;

                  TotalMpesaImports:=TotalMpesaImports;

              until MPESAIntegrationTable.Next=0;
                  GLEntry.Reset;
                  GLEntry.SetFilter("Posting Date",'%1..%2',StartDate,EndDate);
                  GLEntry.SetFilter("Document No.",'%1','MSCR*');
                  GLEntry.SetFilter(Amount,'>%1',0);
                  if GLEntry.FindSet then begin
                    repeat

                   HiddenMisc:=HiddenMisc+GLEntry.Amount;
                    until GLEntry.Next=0;
                  end;
              TotalMpesaAmount:=TotalMpesaImports+HiddenMisc;
        end;
        exit(TotalMpesaAmount);
    end;

    local procedure GetTotalMiscellaneous(BankAccount: Record "Bank Account";StartDate: Date;EndDate: Date) TotalValue: Decimal
    var
        ReceiptsHeader1: Record "Receipts Header1";
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        ReceiptLines1: Record "Receipt Lines1";
        TotalMiscValue: Decimal;
    begin
        TotalMiscValue:=0.0;
        TotalValue:=0.0;
        ReceiptsHeader1.Reset;
        ReceiptsHeader1.SetFilter("Posted Date",'%1..%2',StartDate,EndDate);
        ReceiptsHeader1.SetRange("Document Type",ReceiptsHeader1."Document Type"::"Student Receipt");
        ReceiptsHeader1.SetRange("Bank Code",BankAccount."No.");
        ReceiptsHeader1.SetRange(Posted,true);
        if ReceiptsHeader1.FindSet then begin
          repeat
            ReceiptLines1.Reset;
            ReceiptLines1.SetRange("Receipt No.",ReceiptsHeader1."No.");
            if ReceiptLines1.FindSet then
            begin
              repeat
                BankAccountLedgerEntry.Reset;
                BankAccountLedgerEntry.SetRange("Bank Account No.",BankAccount."No.");
                BankAccountLedgerEntry.SetRange("External Document No.",ReceiptsHeader1."No."+' '+Format(ReceiptLines1."Line No"));
                BankAccountLedgerEntry.SetRange(Reversed,false);
                if BankAccountLedgerEntry.FindFirst then begin
                  TotalMiscValue:=TotalMiscValue+BankAccountLedgerEntry."Amount (LCY)";
                end

              until ReceiptLines1.Next=0;
            end

          until  ReceiptsHeader1.Next=0;
          TotalValue:=TotalMiscValue;
        end;
        exit(TotalValue);
    end;

    local procedure GetTotalCreditMemoAmount(SalesInvoiceHeader: Record "Sales Invoice Header") TotalValue: Decimal
    var
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        InvoiceHeader: Record "Sales Invoice Header";
    begin
        TotalValue:=0.0;
        SalesCrMemoHeader.Reset;
        SalesCrMemoHeader.SetRange("External Document No.",SalesInvoiceHeader."External Document No.");
        if SalesCrMemoHeader.FindSet then begin
          //REPEAT
            TotalValue:=TotalValue+SalesCrMemoHeader.Amount;
          //UNTIL SalesCrMemoHeader.NEXT=0;
        end;
        exit(TotalValue);
    end;
}

