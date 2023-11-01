report 85128 "Update MPESA Amounts"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update MPESA Amounts.rdlc';

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
            column(ACCOUNTNUMBER_MPESAIntegrationTable;"MPESA Integration Table".ACCOUNT_NUMBER)
            {
            }

            trigger OnAfterGetRecord()
            begin
                StudentProcessingHeader.Reset;
                StudentProcessingHeader.SetRange("Payment Reference No.","MPESA Integration Table".MPESA_TXN_ID);
                StudentProcessingHeader.SetRange(Posted,false);
                if StudentProcessingHeader.FindFirst then begin
                  if StudentProcessingHeader."Booking Invoice No."='' then
                  begin
                    "MPESA Integration Table".Fetch:=false;
                    "MPESA Integration Table"."Remaining Amount":="MPESA Integration Table".MPESA_AMOUNT;
                    "MPESA Integration Table".Modify(true);
                  end
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
        StudentProcessingHeader: Record "Student Processing Header";
        ReceiptsHeader1: Record "Receipts Header1";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        ExaminationAccount: Record "Examination Account";
}

