report 85113 "Bank Unutilized Amounts Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bank Unutilized Amounts Report.rdlc';

    dataset
    {
        dataitem("Bank Import Entries";"Bank Import Entries")
        {
            DataItemTableView = WHERE(Closed=FILTER(false));
            RequestFilterFields = "Bank Code","Transaction Date";
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
            column(AppliedAmount_BankImportEntries;"Bank Import Entries"."Applied Amount")
            {
            }
            column(RemainingAmount_BankImportEntries;"Bank Import Entries"."Remaining Amount")
            {
            }
            column(ShowDetail;ShowDetail)
            {
            }
            column(TotalAmount;TotalAmount)
            {
            }
            column(StudentIdentifier_BankImportEntries;"Bank Import Entries"."Student Identifier")
            {
            }
            column(StudentName_BankImportEntries;"Bank Import Entries"."Student Name")
            {
            }
            column(MPESACode_BankImportEntries;"Bank Import Entries"."M-PESA Code")
            {
            }
            column(MobileNo_BankImportEntries;"Bank Import Entries"."Mobile No")
            {
            }
            column(ExaminationCode_BankImportEntries;"Bank Import Entries"."Examination Code")
            {
            }
            column(RegistrationNo_BankImportEntries;"Bank Import Entries"."Registration No")
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Bank Import Entries".SetFilter("Bank Import Entries"."Remaining Amount",'>%1',0);
                ShowDetail:=true;
                TotalAmount:=0.0;
                if "Bank Import Entries"."Reference No."<>'' then begin
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("External Document No.","Bank Import Entries"."Reference No.");
                if CustLedgerEntry.FindSet then begin
                  repeat
                    CustLedgerEntry.CalcFields(Amount);
                    TotalAmount:=TotalAmount+Abs(CustLedgerEntry.Amount);
                  until CustLedgerEntry.Next=0
                end;
                end;
                if "Bank Import Entries".Amount=TotalAmount then
                  ShowDetail:=false;
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
        TotalAmount: Decimal;
        ShowDetail: Boolean;
}

