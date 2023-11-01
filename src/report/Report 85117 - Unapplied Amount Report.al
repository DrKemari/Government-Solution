report 85117 "Unapplied Amount Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Unapplied Amount Report.rdlc';

    dataset
    {
        dataitem("MPESA Integration Table";"MPESA Integration Table")
        {
            column(MPESATXNID_MPESAIntegrationTable;"MPESA Integration Table".MPESA_TXN_ID)
            {
            }
            column(MPESAAMOUNT_MPESAIntegrationTable;"MPESA Integration Table".MPESA_AMOUNT)
            {
            }
            column(Fetch_MPESAIntegrationTable;"MPESA Integration Table".Fetch)
            {
            }
            column(RemainingAmount_MPESAIntegrationTable;"MPESA Integration Table"."Remaining Amount")
            {
            }

            trigger OnAfterGetRecord()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
                ReceiptsHeader: Record "Receipts Header1";
            begin
                VisibleDetail:=false;
                ReceiptsHeader.Reset;
                ReceiptsHeader.SetRange("Cheque No","MPESA Integration Table".MPESA_TXN_ID);

                if ReceiptsHeader.FindSet then begin
                  repeat
                    ReceiptsHeader.CalcFields(Amount);
                    TotalAmount:=TotalAmount+ReceiptsHeader.Amount;
                  until ReceiptsHeader.Next=0;
                end;

                if "MPESA Integration Table".MPESA_AMOUNT=TotalAmount then
                  VisibleDetail:=false
                 else
                  VisibleDetail:=true;
            end;
        }
        dataitem("Bank Import Entries";"Bank Import Entries")
        {
            column(EntryNo_BankImportEntries;"Bank Import Entries"."Entry No")
            {
            }
            column(BankCode_BankImportEntries;"Bank Import Entries"."Bank Code")
            {
            }
            column(TransactionDate_BankImportEntries;"Bank Import Entries"."Transaction Date")
            {
            }
            column(ReferenceNo_BankImportEntries;"Bank Import Entries"."Reference No.")
            {
            }
            column(StudentIdentifier_BankImportEntries;"Bank Import Entries"."Student Identifier")
            {
            }
            column(Amount_BankImportEntries;"Bank Import Entries".Amount)
            {
            }
            column(RemainingAmount_BankImportEntries;"Bank Import Entries"."Remaining Amount")
            {
            }

            trigger OnAfterGetRecord()
            begin
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("External Document No.","Bank Import Entries"."Reference No.");
                if CustLedgerEntry.FindSet then begin
                  repeat
                    CustLedgerEntry.CalcFields(Amount);
                    TotalAmount:=TotalAmount+CustLedgerEntry.Amount;
                  until CustLedgerEntry.Next=0;
                end;


                if TotalAmount="Bank Import Entries".Amount then
                  VisibleDetail:=false
                else
                VisibleDetail:=true;
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

    var
        TotalAmount: Decimal;
        VisibleDetail: Boolean;
        CustLedgerEntry: Record "Cust. Ledger Entry";
}

