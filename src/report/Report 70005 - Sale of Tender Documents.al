report 70005 "Sale of Tender Documents"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Sale of Tender Documents.rdlc';

    dataset
    {
        dataitem(Bidders;Bidders)
        {
            column(RefNo_Bidders1;Bidders."Ref No.")
            {
            }
            column(Name_Bidders1;Bidders.Name)
            {
            }
            column(PostalAddress_Bidders1;Bidders."Postal Address")
            {
            }
            column(Email_Bidders1;Bidders."E-mail")
            {
            }
            column(TelephoneNo_Bidders1;Bidders."Telephone No")
            {
            }
            column(KBABankCode_Bidders1;Bidders."KBA Bank Code")
            {
            }
            column(KBABranchCode_Bidders1;Bidders."KBA Branch Code")
            {
            }
            column(BankaccountNo_Bidders1;Bidders."Bank account No")
            {
            }
            column(TenderAmount_Bidders1;Bidders."Tender Amount")
            {
            }
            column(BidSecurityAmount_Bidders1;Bidders."Bid Security Amount")
            {
            }
            column(BidExpiryDate_Bidders1;Bidders."Bid Expiry Date")
            {
            }
            column(ChequeNo_Bidders1;Bidders."Cheque No")
            {
            }
            column(TenderDocReceiptDate_Bidders1;Bidders."Tender Doc Receipt Date")
            {
            }
            column(ReceiptNo_Bidders1;Bidders."Receipt No.")
            {
            }
            column(Date;Date)
            {
            }
            column(Department;Department)
            {
            }
            column(Title;Title)
            {
            }

            trigger OnAfterGetRecord()
            begin
                  ReceiptHeader.Reset;
                  if ReceiptHeader.Get(Bidders."Receipt No.") then
                  begin

                   Date:=ReceiptHeader.Date;

                   DimensionValue.Reset;
                   if DimensionValue.Get('DEPARTMENT',ReceiptHeader."Global Dimension 2 Code") then
                    Department:=DimensionValue.Name;

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
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLines: Record "Receipt Lines1";
        Date: Date;
        Department: Text[100];
        DimensionValue: Record "Dimension Value";
        Title: Label 'Sale of Tender Documents';
}

