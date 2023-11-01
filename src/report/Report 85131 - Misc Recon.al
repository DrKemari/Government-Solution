report 85131 "Misc Recon"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Misc Recon.rdlc';

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
            column(MPESATXNDATE_MPESAIntegrationTable;"MPESA Integration Table".MPESA_TXN_DATE)
            {
            }
            column(MPESATXNTIME_MPESAIntegrationTable;"MPESA Integration Table".MPESA_TXN_TIME)
            {
            }
            dataitem("Receipts Header1";"Receipts Header1")
            {
                DataItemLink = "Payment Reference No."=FIELD(MPESA_TXN_ID);
                column(PaymentReferenceNo_ReceiptsHeader1;"Receipts Header1"."Payment Reference No.")
                {
                }
                column(No_ReceiptsHeader1;"Receipts Header1"."No.")
                {
                }
                column(Date_ReceiptsHeader1;"Receipts Header1".Date)
                {
                }
                column(PayMode_ReceiptsHeader1;"Receipts Header1"."Pay Mode")
                {
                }
                column(PaymentReference_ReceiptsHeader1;"Receipts Header1"."Payment Reference")
                {
                }
                column(Amount_ReceiptsHeader1;"Receipts Header1".Amount)
                {
                }
                column(AmountLCY_ReceiptsHeader1;"Receipts Header1"."Amount(LCY)")
                {
                }
                column(PostedDate_ReceiptsHeader1;"Receipts Header1"."Posted Date")
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

