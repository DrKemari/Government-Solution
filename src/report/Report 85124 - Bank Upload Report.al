report 85124 "Bank Upload Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bank Upload Report.rdlc';

    dataset
    {
        dataitem("Bank Account Ledger Entry";"Bank Account Ledger Entry")
        {
            RequestFilterFields = "Posting Date";
            column(BankAccountNo_BankAccountLedgerEntry;"Bank Account Ledger Entry"."Bank Account No.")
            {
            }
            column(Amount_BankAccountLedgerEntry;"Bank Account Ledger Entry".Amount)
            {
            }
            dataitem("Bank Import Entries";"Bank Import Entries")
            {
                DataItemLink = "Reference No."=FIELD("External Document No.");
                DataItemTableView = WHERE(Posted=FILTER(true));
                RequestFilterFields = "Bank Code","Transaction Date";
                column(Amount_BankImportEntries;"Bank Import Entries".Amount)
                {
                }
                column(BankCode_BankImportEntries;"Bank Import Entries"."Bank Code")
                {
                }
                column(VisibleAllowed;VisibleAllowed)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    VisibleAllowed:=true;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                VisibleAllowed:=false;
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
        StartDate: Date;
        EndDate: Date;
        VisibleAllowed: Boolean;
}

