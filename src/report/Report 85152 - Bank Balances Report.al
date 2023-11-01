report 85152 "Bank Balances Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bank Balances Report.rdlc';

    dataset
    {
        dataitem("Bank Account Ledger Entry";"Bank Account Ledger Entry")
        {
            column(BankAccountNo_BankAccountLedgerEntry;"Bank Account Ledger Entry"."Bank Account No.")
            {
            }
            column(PostingDate_BankAccountLedgerEntry;"Bank Account Ledger Entry"."Posting Date")
            {
            }
            column(DocumentType_BankAccountLedgerEntry;"Bank Account Ledger Entry"."Document Type")
            {
            }
            column(DocumentNo_BankAccountLedgerEntry;"Bank Account Ledger Entry"."Document No.")
            {
            }
            column(Description_BankAccountLedgerEntry;"Bank Account Ledger Entry".Description)
            {
            }
            column(CurrencyCode_BankAccountLedgerEntry;"Bank Account Ledger Entry"."Currency Code")
            {
            }
            column(Amount_BankAccountLedgerEntry;"Bank Account Ledger Entry".Amount)
            {
            }
            dataitem("G/L Entry";"G/L Entry")
            {
                column(GLAccountNo_GLEntry;"G/L Entry"."G/L Account No.")
                {
                }
                column(PostingDate_GLEntry;"G/L Entry"."Posting Date")
                {
                }
                column(DocumentType_GLEntry;"G/L Entry"."Document Type")
                {
                }
                column(DocumentNo_GLEntry;"G/L Entry"."Document No.")
                {
                }
                column(Description_GLEntry;"G/L Entry".Description)
                {
                }
                column(BalAccountNo_GLEntry;"G/L Entry"."Bal. Account No.")
                {
                }
                column(Amount_GLEntry;"G/L Entry".Amount)
                {
                }
                column(SourceNo_GLEntry;"G/L Entry"."Source No.")
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

    var
        GLEntry: Record "G/L Entry";
        BankAmount: Decimal;
}

