report 85120 "Posted Summ Receipt Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Posted Summ Receipt Report.rdlc';

    dataset
    {
        dataitem("Receipts Header1";"Receipts Header1")
        {
            DataItemTableView = WHERE(Posted=FILTER(true),"Document Type"=FILTER(<>"Student Receipt"));
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
}

