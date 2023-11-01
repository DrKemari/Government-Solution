report 85129 "Summ. Bank Utilization Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Summ. Bank Utilization Report1.rdlc';

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
            column(TotalUtilized;TotalUtilized)
            {
            }
            column(CustNo;CustNo)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TotalUtilized:=0;
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("External Document No.","Bank Import Entries"."Reference No.");
                CustLedgerEntry.SetRange(Reversed,false);
                if CustLedgerEntry.FindSet then begin
                  repeat
                    CustNo:=CustLedgerEntry."Customer No.";
                  CustLedgerEntry.CalcFields(Amount);
                 TotalUtilized:=TotalUtilized+CustLedgerEntry.Amount;
                  until CustLedgerEntry.Next=0;
                end
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
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TotalUtilized: Decimal;
        CustNo: Code[30];
}

