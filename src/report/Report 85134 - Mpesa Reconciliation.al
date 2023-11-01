report 85134 "Mpesa Reconciliation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Mpesa Reconciliation.rdlc';

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
            column(Amount_BankAccountLedgerEntry;"Bank Account Ledger Entry".Amount)
            {
            }
            dataitem("Sales Invoice Header";"Sales Invoice Header")
            {
                DataItemLink = "External Document No."=FIELD("External Document No.");
                column(PostingDate_SalesInvoiceHeader;"Sales Invoice Header"."Posting Date")
                {
                }
                column(No_SalesInvoiceHeader;"Sales Invoice Header"."No.")
                {
                }
                column(ExternalDocumentNo_SalesInvoiceHeader;"Sales Invoice Header"."External Document No.")
                {
                }
                dataitem("Sales Invoice Line";"Sales Invoice Line")
                {
                    DataItemLink = "Document No."=FIELD("No.");
                    column(No_SalesInvoiceLine;"Sales Invoice Line"."No.")
                    {
                    }
                    column(Description_SalesInvoiceLine;"Sales Invoice Line".Description)
                    {
                    }
                    column(Amount_SalesInvoiceLine;"Sales Invoice Line".Amount)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    "Sales Invoice Header".SetRange("Sales Invoice Header"."Posting Date","Bank Account Ledger Entry"."Posting Date");
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
        Resource: Record Resource;
        GeneralPostingSetup: Record "General Posting Setup";
        GLAccount: Record "G/L Account";
        GLName: Text;
}

