report 57020 "Close Bank Ledger Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Close Bank Ledger Entries.rdlc';

    dataset
    {
        dataitem("Bank Account";"Bank Account")
        {
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            begin
                UptoDate:=20210930D;
                BankAccLedgEntry.Reset;
                BankAccLedgEntry.SetCurrentKey("Bank Account No.",Open);
                BankAccLedgEntry.SetRange("Bank Account No.","Bank Account"."No.");
                BankAccLedgEntry.SetRange(Open,true);
                //BankAccLedgEntry.SETRANGE(
                // "Statement Status",BankAccLedgEntry."Statement Status"::"Bank Acc. Entry Applied");
                BankAccLedgEntry.SetRange("Posting Date",0D,UptoDate);
                if BankAccLedgEntry.Find('-') then begin
                  repeat
                    AppliedAmount += BankAccLedgEntry."Remaining Amount";
                    BankAccLedgEntry."Remaining Amount" := 0;
                    BankAccLedgEntry.Open := false;
                    BankAccLedgEntry."Statement Status" := BankAccLedgEntry."Statement Status"::Closed;
                    BankAccLedgEntry."Statement No.":='1';
                    BankAccLedgEntry.Modify;
                  until BankAccLedgEntry.Next = 0;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Bank Entries Closed Successfully');
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
        BankAccLedgEntry: Record "Bank Account Ledger Entry";
        AppliedAmount: Decimal;
        UptoDate: Date;
}

