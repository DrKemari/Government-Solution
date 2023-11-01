report 50025 "Pos Receipts"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Pos Receipts.rdlc';

    dataset
    {
        dataitem(CBRECEIPTS;CBRECEIPTS)
        {
            DataItemTableView = WHERE(MCancelled=CONST(0));
            RequestFilterFields = ReceiptNo,"Nav Payment Date",PaymentType2;
            column(ReceiptNo_CBRECEIPTS;CBRECEIPTS.ReceiptNo)
            {
            }
            column(ReceivedFrom_CBRECEIPTS;CBRECEIPTS.ReceivedFrom)
            {
            }
            column(TotalAmount_CBRECEIPTS;CBRECEIPTS."Nav Receipt Total")
            {
            }
            column(PaymentType2;CBRECEIPTS.PaymentType2)
            {
            }
            column(PaymentMode_CBRECEIPTS;CBRECEIPTS.PaymentMode)
            {
            }
            column(NavPaymentDate_CBRECEIPTS;CBRECEIPTS."Nav Payment Date")
            {
            }
            column(ReceiptCount;ReceiptCount)
            {
            }

            trigger OnAfterGetRecord()
            begin
                ReceiptCount:=0;
                ReceiptCount:=FnCountReceipts(CBRECEIPTS.ReceiptNo);
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
        ReceiptCount: Integer;

    procedure FnCountReceipts(ReceiptNumber: Code[30]) NumCounted: Integer
    var
        CBRECEIPTS: Record CBRECEIPTS;
        Counted: Integer;
    begin
        NumCounted:=0;
        CBRECEIPTS.Reset;
        CBRECEIPTS.SetRange(ReceiptNo,ReceiptNumber);
        if CBRECEIPTS.FindFirst then begin
           NumCounted:=CBRECEIPTS.Count;
        end;

        exit(NumCounted);
    end;
}

