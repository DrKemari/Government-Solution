report 50016 "Bank Account Ledger Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bank Account Ledger Update.rdlc';

    dataset
    {
        dataitem("Bank Account Ledger Entry";"Bank Account Ledger Entry")
        {

            trigger OnAfterGetRecord()
            begin
                BankLedgerEntry.Reset;
                BankLedgerEntry.SetRange("Document No.","Bank Account Ledger Entry"."Document No.");
                if BankLedgerEntry.FindSet then begin
                  if FnGetPostingDate("Bank Account Ledger Entry"."Payment Reference No.")<>0D then begin
                    BankLedgerEntry."Actual Trans Date":=FnGetPostingDate("Bank Account Ledger Entry"."Payment Reference No.");
                   // BankLedgerEntry.MODIFY;
                  end else begin
                   BankLedgerEntry."Actual Trans Date":="Bank Account Ledger Entry"."Posting Date";
                    end;
                   BankLedgerEntry.Modify;
                  end;
                
                /* IF "Bank Account Ledger Entry"."Payment Reference No."='' THEN BEGIN
                 "Bank Account Ledger Entry"."Payment Reference No.":="Bank Account Ledger Entry"."Document No.";
                 "Bank Account Ledger Entry".MODIFY;
                 RCPT.RESET;
                 RCPT.SETRANGE("Bank Code", "Bank Account Ledger Entry"."Bank Account No.");
                 RCPT.SETRANGE("No.","Bank Account Ledger Entry"."Document No.");
                 IF RCPT.FINDSET THEN BEGIN
                 "Bank Account Ledger Entry"."Payment Reference No.":="Bank Account Ledger Entry"."External Document No.";
                  //"Bank Account Ledger Entry"."Payment Reference No.":=RCPT."Cheque No";
                   "Bank Account Ledger Entry".MODIFY;
                END;
                END;*/

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
        BankLedgerEntry: Record "Bank Account Ledger Entry";
        RCPT: Record "Receipts Header1";

    local procedure FnGetPostingDate(DocNumber: Code[50]) PostingDate: Date
    var
        MPESAIntegrationTable: Record "MPESA Integration Table";
    begin
        MPESAIntegrationTable.Reset;
        MPESAIntegrationTable.SetRange(MPESA_TXN_ID,DocNumber);
        if MPESAIntegrationTable.FindSet then begin
          PostingDate:=DT2Date(MPESAIntegrationTable.MPESA_TXN_DATE);
        end;
        exit(PostingDate);
    end;
}

