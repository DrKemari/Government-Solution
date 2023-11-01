report 85122 "Double Entry Unapplied"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Double Entry Unapplied.rdlc';

    dataset
    {
        dataitem(Customer;Customer)
        {
            column(No_Customer;Customer."No.")
            {
            }
            column(Name_Customer;Customer.Name)
            {
            }
            column(VisibleAllowed;VisibleAllowed)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TotalEntry:=0;
                VisibleAllowed:=false;
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Document No.",'UNAPPLIED');
                CustLedgerEntry.SetRange("Customer No.",Customer."No.");
                if CustLedgerEntry.FindSet then begin
                  TotalEntry:=CustLedgerEntry.Count;
                end;
                if TotalEntry>1 then
                  VisibleAllowed:=true;
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
        CustLedgerEntry: Record "Cust. Ledger Entry";
        VisibleAllowed: Boolean;
        TotalEntry: Integer;
}

