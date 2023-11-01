report 85111 "Posted Receipt Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Posted Receipt Report.rdlc';

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

