report 85119 "Det. Unutilized Amounts Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Det. Unutilized Amounts Report.rdlc';

    dataset
    {
        dataitem("MPESA Integration Table";"MPESA Integration Table")
        {
            DataItemTableView = WHERE(Fetch=FILTER(false));
            RequestFilterFields = MPESA_TXN_DATE;
            column(MPESATXNID_MPESAIntegrationTable;"MPESA Integration Table".MPESA_TXN_ID)
            {
            }
            column(MPESAAMOUNT_MPESAIntegrationTable;"MPESA Integration Table".MPESA_AMOUNT)
            {
            }
            column(ACCOUNTNUMBER_MPESAIntegrationTable;"MPESA Integration Table".ACCOUNT_NUMBER)
            {
            }
            column(AppliedAmount_MPESAIntegrationTable;"MPESA Integration Table"."Applied Amount")
            {
            }
            column(RemainingAmount_MPESAIntegrationTable;"MPESA Integration Table"."Remaining Amount")
            {
            }
            column(ShowDetail;ShowDetail)
            {
            }
            column(TotalAmount;TotalAmount)
            {
            }

            trigger OnAfterGetRecord()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
            begin
                "MPESA Integration Table".SetFilter("MPESA Integration Table"."Remaining Amount",'>%1',0);

                //Check if entry exists in the customer ledger
                if ShowDetail=true then begin
                ReceiptsHeader.Reset;
                ReceiptsHeader.SetRange("Payment Reference","MPESA Integration Table".MPESA_TXN_ID);
                if ReceiptsHeader.FindSet then begin
                  repeat
                  ReceiptsHeader.CalcFields(Amount);
                   TotalAmount:=TotalAmount+ReceiptsHeader.Amount;
                   until ReceiptsHeader.Next=0
                end;
                end;
                if "MPESA Integration Table".MPESA_AMOUNT=TotalAmount then
                  ShowDetail:=false;
            end;
        }
        dataitem("Bank Import Entries";"Bank Import Entries")
        {
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
            column(ShowDetail1;ShowDetail1)
            {
            }
            column(TotalAmount1;TotalAmount1)
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


                if ShowDetail1=true then begin
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("External Document No.","Bank Import Entries"."Reference No.");
                if CustLedgerEntry.FindSet then begin
                  repeat
                    CustLedgerEntry.CalcFields(Amount);
                    TotalAmount1:=TotalAmount1+Abs(CustLedgerEntry.Amount);
                  until CustLedgerEntry.Next=0
                end;
                end;
                if "Bank Import Entries".Amount=TotalAmount1 then
                  ShowDetail1:=false;
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
        ShowDetail1:=true;  ShowDetail:=true;
    end;

    var
        ReceiptsHeader: Record "Receipts Header1";
        TotalAmount: Decimal;
        ShowDetail: Boolean;
        TotalAmount1: Decimal;
        ShowDetail1: Boolean;
        CustLedgerEntry: Record "Cust. Ledger Entry";
}

