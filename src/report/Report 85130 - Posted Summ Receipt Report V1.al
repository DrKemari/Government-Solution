report 85130 "Posted Summ Receipt Report V1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Posted Summ Receipt Report V1.rdlc';

    dataset
    {
        dataitem("Receipts Header1";"Receipts Header1")
        {
            DataItemTableView = WHERE("Document Type"=FILTER(<>"Student Receipt"));
            RequestFilterFields = "Pay Mode","Bank Code","Posted Date";
            column(No_ReceiptsHeader1;"Receipts Header1"."No.")
            {
            }
            column(PayMode_ReceiptsHeader1;"Receipts Header1"."Pay Mode")
            {
            }
            column(ChequeNo_ReceiptsHeader1;"Receipts Header1"."Cheque No")
            {
            }
            column(Amount_ReceiptsHeader1;"Receipts Header1".Amount)
            {
            }
            column(BankCode_ReceiptsHeader1;"Receipts Header1"."Bank Code")
            {
            }
            column(BankName_ReceiptsHeader1;"Receipts Header1"."Bank Name")
            {
            }
            column(PostedDate_ReceiptsHeader1;"Receipts Header1"."Posted Date")
            {
            }
            column(ApplicationNo_ReceiptsHeader1;"Receipts Header1"."Application No.")
            {
            }
            column(PaymentReferenceNo_ReceiptsHeader1;"Receipts Header1"."Payment Reference No.")
            {
            }
            column(ReceivedFrom_ReceiptsHeader1;"Receipts Header1"."Received From")
            {
            }
            column(DocumentType_ReceiptsHeader1;"Receipts Header1"."Document Type")
            {
            }
            column(Showvalue;Showvalue)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Showvalue:=true;
                BankAccountLedgerEntry.Reset;
                BankAccountLedgerEntry.SetRange("Document No.","Receipts Header1"."No.");
                if not  BankAccountLedgerEntry.FindFirst then
                  Showvalue:=false;
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
        StartDate:="Receipts Header1".GetRangeMax("Receipts Header1"."Posted Date");
        EndDate:="Receipts Header1".GetRangeMin("Receipts Header1"."Posted Date");
    end;

    var
        StartDate: Date;
        EndDate: Date;
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        Showvalue: Boolean;
}

