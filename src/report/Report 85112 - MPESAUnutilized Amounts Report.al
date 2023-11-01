report 85112 "MPESAUnutilized Amounts Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './MPESAUnutilized Amounts Report.rdlc';

    dataset
    {
        dataitem("MPESA Integration Table";"MPESA Integration Table")
        {
            DataItemTableView = WHERE(Fetch=FILTER(false));
            RequestFilterFields = MPESA_TXN_D;
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
                  ShowDetail:=true;

                //Check if entry exists in the customer ledger
                ReceiptsHeader.Reset;
                ReceiptsHeader.SetRange("Payment Reference","MPESA Integration Table".MPESA_TXN_ID);
                if ReceiptsHeader.FindSet then begin
                 ShowDetail:=false;
                end;


                if  ShowDetail=true then begin
                ReceiptsHeader.Reset;
                ReceiptsHeader.SetRange("Cheque No","MPESA Integration Table".MPESA_TXN_ID);
                if ReceiptsHeader.FindSet then begin
                   ShowDetail:=false;
                end;
                end;
            end;

            trigger OnPreDataItem()
            begin

                "MPESA Integration Table".SetFilter("MPESA Integration Table".Fetch,'<>%1',true);
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
        ReceiptsHeader: Record "Receipts Header1";
        TotalAmount: Decimal;
        ShowDetail: Boolean;
        StartDate: Date;
        EndDate: Date;
}

