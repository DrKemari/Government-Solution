report 85138 "Bank Daily Report-2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bank Daily Report-2.rdlc';

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
            column(CustAmount;CustAmount)
            {
            }
            column(Amount_SalesInvoiceHeader;SalesInvoiceAmount)
            {
            }
            column(TotalCreditAmount;TotalCreditAmount)
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
                
                
                BankAccountLedgerEntry.Reset;
                BankAccountLedgerEntry.SetRange("Bank Account No.","Bank Account"."No.");
                BankAccountLedgerEntry.SetRange("Posting Date",MinDate,MaxDate);
                BankAccountLedgerEntry.SetFilter("Document No.",'=%1','R*');
                if BankAccountLedgerEntry.FindSet then begin
                   repeat
                CustAmount:=0;
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Document No.",BankAccountLedgerEntry."Document No.");
                CustLedgerEntry.SetRange("Date Filter",MinDate,MaxDate);
                if CustLedgerEntry.FindSet then begin
                    CustAmount:=CustLedgerEntry.Amount;
                    repeat
                      SalesInvoiceAmount:=0;
                      SalesInvoiceHeader.Reset;
                      SalesInvoiceHeader.SetRange("External Document No.",CustLedgerEntry."External Document No.");
                      if SalesInvoiceHeader.FindSet then begin
                         SalesInvoiceHeader.CalcFields(Amount);
                         SalesInvoiceAmount:=SalesInvoiceHeader.Amount;
                         SinVNo:=SalesInvoiceHeader."External Document No.";
                          /*StudentProcessingHeader.RESET;
                          StudentProcessingHeader.SETRANGE("No.",SalesInvoiceHeader."External Document No.");
                          IF StudentProcessingHeader.FINDSET THEN BEGIN
                            REPEAT
                            DocType:=StudentProcessingHeader."Document Type";
                            UNTIL StudentProcessingHeader.NEXT=0;
                            END;*/
                        end;
                
                      until CustLedgerEntry.Next=0;
                  end;
                
                     until BankAccountLedgerEntry.Next=0;
                  end;

            end;
        }
        dataitem("Student Processing Header";"Student Processing Header")
        {
            column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Student Processing Header".SetRange("Student Processing Header"."No.",SinVNo);
            end;
        }
        dataitem("Receipts Header1";"Receipts Header1")
        {
            DataItemTableView = WHERE("Document Type"=FILTER("Student Receipt"));
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
        CustLedgerEntry: Record "Cust. Ledger Entry";
        CustAmount: Decimal;
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceAmount: Decimal;
        StdProcHead: Decimal;
        DocType: Option Registration,Booking,Exemption,Withdrawal,Defferment,Disciplinary,Reinstatement,Collection,Remarking,Renewal,"Re-Activation",Confirmation;
        SinVNo: Code[30];

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
              until MPESAIntegrationTable.Next=0;
              TotalMpesaAmount:=TotalMpesaImports;
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

