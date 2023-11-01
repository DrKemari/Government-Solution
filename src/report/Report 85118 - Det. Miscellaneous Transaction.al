report 85118 "Det. Miscellaneous Transaction"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Det. Miscellaneous Transaction.rdlc';

    dataset
    {
        dataitem("Receipts Header1";"Receipts Header1")
        {
            DataItemTableView = WHERE(Posted=FILTER(true),"Document Type"=FILTER("Student Receipt"));
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
            column(ChequeDate_ReceiptsHeader1;"Receipts Header1"."Cheque Date")
            {
            }
            column(Amount_ReceiptsHeader1;"Receipts Header1".Amount)
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
                column(Amount_ReceiptLines1;"Receipt Lines1".Amount)
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
}

