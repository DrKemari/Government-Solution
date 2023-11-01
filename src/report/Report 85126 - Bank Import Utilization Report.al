report 85126 "Bank Import Utilization Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bank Import Utilization Report.rdlc';

    dataset
    {
        dataitem("Bank Import Entries";"Bank Import Entries")
        {
            DataItemTableView = WHERE(Posted=CONST(true),"Reference No."=FILTER(<>''));
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
            column(Amount_BankImportEntries;"Bank Import Entries".Amount)
            {
            }
            dataitem("Cust. Ledger Entry";"Cust. Ledger Entry")
            {
                DataItemLink = "External Document No."=FIELD("Reference No.");
                DataItemTableView = WHERE(Reversed=FILTER(false));
                column(ExternalDocumentNo_CustLedgerEntry;"Cust. Ledger Entry"."External Document No.")
                {
                }
                column(CustomerNo_CustLedgerEntry;"Cust. Ledger Entry"."Customer No.")
                {
                }
                column(EntryNo_CustLedgerEntry;"Cust. Ledger Entry"."Entry No.")
                {
                }
                column(DocumentNo_CustLedgerEntry;"Cust. Ledger Entry"."Document No.")
                {
                }
                column(Amount_CustLedgerEntry;"Cust. Ledger Entry".Amount)
                {
                }
            }
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
}

