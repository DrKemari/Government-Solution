report 51003 "Update Recon"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Recon.rdlc';

    dataset
    {
        dataitem("Receipts Header1";"Receipts Header1")
        {
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
            dataitem("Bank Account Ledger Entry";"Bank Account Ledger Entry")
            {
                DataItemLink = "Document No."=FIELD("No.");
                column(BankAccountNo_BankAccountLedgerEntry;"Bank Account Ledger Entry"."Bank Account No.")
                {
                }
                column(DocumentNo_BankAccountLedgerEntry;"Bank Account Ledger Entry"."Document No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //MESSAGE('%1---%2',"Bank Account Ledger Entry"."External Document No.","Receipts Header1"."Payment Reference");
                    Header.Reset;
                    Header.SetRange("Payment Reference No.","Receipts Header1"."No.");
                    if Header.FindFirst then begin
                      //IF "Bank Account Ledger Entry"."External Document No."=("Bank Account Ledger Entry"."External Document No."+'  '+Header."Payment Reference No.") THEN BEGIN
                        "Bank Account Ledger Entry"."Payment Reference No.":="Receipts Header1"."Payment Reference No.";
                        "Bank Account Ledger Entry".Modify(true);
                       // END;
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
        Header: Record "Student Processing Header";
}

