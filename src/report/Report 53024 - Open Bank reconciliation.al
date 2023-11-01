report 53024 "Open Bank reconciliation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Open Bank reconciliation.rdlc';

    dataset
    {
        dataitem("Bank Account Statement";"Bank Account Statement")
        {

            trigger OnAfterGetRecord()
            begin
                
                
                /*IF "Bank Account Statement"."Bank Account No."='' THEN
                  ERROR('Bank Account No Must be specified');
                IF "Bank Account Statement"."Statement No."='' THEN
                  ERROR('Bank Statement no must be specified ');*/
                
                /*
                BankACcntStatement.RESET;
                BankACcntStatement.SETRANGE("Bank Account No.", "Bank Account Statement"."Bank Account No.");
                BankACcntStatement.SETRANGE("Statement No.","Bank Account Statement"."Statement No.");
                IF BankACcntStatement.FINDLAST THEN BEGIN
                  BankAcnt.RESET;
                  BankAcnt.SETRANGE("No.","Bank Account Statement"."Bank Account No.");
                  IF BankAcnt.FINDSET THEN BEGIN
                  BankAcnt."Balance Last Statement":=BankACcntStatement."Balance Last Statement";
                  BankAcnt.MODIFY;
                  END;
                  BankAccountStatementLine.RESET;
                  BankAccountStatementLine.SETRANGE("Statement No.",BankACcntStatement."Statement No.");
                  BankAccountStatementLine.SETRANGE("Bank Account No.","Bank Account Statement"."Bank Account No.");
                  BankAccountStatementLine.DELETEALL;*/
                
                  BankAccountLedgerEntry.Reset;
                  BankAccountLedgerEntry.SetRange("Bank Account No.","Bank Account Statement"."Bank Account No.");
                  BankAccountLedgerEntry.SetRange("Statement No.","Bank Account Statement"."Statement No.");
                  if BankAccountLedgerEntry.FindSet then begin
                    repeat
                    BankAccountLedgerEntry.Open:=true;
                    BankAccountLedgerEntry."Remaining Amount":=BankAccountLedgerEntry.Amount;
                    BankAccountLedgerEntry."Statement Status":=BankAccountLedgerEntry."Statement Status"::Open;
                    BankAccountLedgerEntry."Statement No.":='';
                    BankAccountLedgerEntry."Statement Line No.":=0;
                    BankAccountLedgerEntry."Statement Date":=0D;
                    BankAccountLedgerEntry.Modify;
                    until BankAccountLedgerEntry.Next=0;
                
                
                 end;
                
                /*BankACcntStatement.DELETE;
                
                END;*/
                //END;

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
        BankACcntStatement: Record "Bank Account Statement";
        BankAcnt: Record "Bank Account";
        BankAccountStatementLine: Record "Bank Account Statement Line";
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
}

