report 85094 "Miscellaneous Transaction Summ"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Miscellaneous Transaction Summ.rdlc';

    dataset
    {
        dataitem("Receipts Header1";"Receipts Header1")
        {
            DataItemTableView = WHERE(Posted=FILTER(true),"Document Type"=FILTER("Student Receipt"));
            RequestFilterFields = "Posted Date","Currency Code";
            column(No_ReceiptsHeader1;"Receipts Header1"."No.")
            {
            }
            column(Date_ReceiptsHeader1;"Receipts Header1".Date)
            {
            }
            column(PayMode_ReceiptsHeader1;"Receipts Header1"."Pay Mode")
            {
            }
            column(ChequeNo_ReceiptsHeader1;"Receipts Header1"."Cheque No")
            {
            }
            column(CurrencyCode_ReceiptsHeader1;"Receipts Header1"."Currency Code")
            {
            }
            column(ChequeDate_ReceiptsHeader1;"Receipts Header1"."Cheque Date")
            {
            }
            column(Amount_ReceiptsHeader1;MiscAmount)
            {
            }
            column(AmountLCY_ReceiptsHeader1;"Receipts Header1"."Amount(LCY)")
            {
            }
            column(BankCode_ReceiptsHeader1;"Receipts Header1"."Bank Code")
            {
            }
            column(PostedDate_ReceiptsHeader1;"Receipts Header1"."Posted Date")
            {
            }
            dataitem("Receipt Lines1";"Receipt Lines1")
            {
                DataItemLink = "Receipt No."=FIELD("No.");
                DataItemTableView = WHERE(Amount=FILTER(>0));
                column(LineNo_ReceiptLines1;"Receipt Lines1"."Line No")
                {
                }
                column(ReceiptNo_ReceiptLines1;"Receipt Lines1"."Receipt No.")
                {
                }
                column(AccountType_ReceiptLines1;"Receipt Lines1"."Account Type")
                {
                }
                column(AccountNo_ReceiptLines1;"Receipt Lines1"."Account No.")
                {
                }
                column(Amount_ReceiptLines1;"Receipt Lines1"."Amount (LCY)")
                {
                }
                column(TransactionType_ReceiptLines1;"Receipt Lines1"."Transaction Type")
                {
                }
                column(RegistrationNo_ReceiptLines1;"Receipt Lines1"."Registration No.")
                {
                }
                column(Description_MiscellaneousTransactionType;Description_MiscellaneousTransactionType)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Description_MiscellaneousTransactionType:='';
                    MiscellaneousType.Reset;
                    MiscellaneousType.SetRange(Code,"Receipt Lines1"."Transaction Type");
                    if MiscellaneousType.FindFirst then begin
                      Description_MiscellaneousTransactionType:=MiscellaneousType.Description;
                    end
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ReceiptsHeader1.Reset;
                ReceiptsHeader1.SetRange("No.",ReceiptsHeader1."No.");
                if ReceiptsHeader1.FindSet then begin
                  if ReceiptsHeader1."Currency Code"<>'' then
                    MiscAmount:=ReceiptsHeader1.Amount*1/ReceiptsHeader1."Currency Factor"
                  else
                    MiscAmount:=ReceiptsHeader1.Amount;
                    end;
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
        MiscellaneousType: Record "Miscellaneous Transaction Type";
        Description_MiscellaneousTransactionType: Text;
        ReceiptsHeader1: Record "Receipts Header1";
        MiscAmount: Decimal;
}

