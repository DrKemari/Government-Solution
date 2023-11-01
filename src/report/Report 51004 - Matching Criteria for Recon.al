report 51004 "Matching Criteria for Recon"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Matching Criteria for Recon.rdlc';

    dataset
    {
        dataitem("Bank Acc. Reconciliation Line";"Bank Acc. Reconciliation Line")
        {
            column(BankAccountNo_BankAccReconciliationLine;"Bank Acc. Reconciliation Line"."Bank Account No.")
            {
            }
            column(StatementNo_BankAccReconciliationLine;"Bank Acc. Reconciliation Line"."Statement No.")
            {
            }
            column(StatementLineNo_BankAccReconciliationLine;"Bank Acc. Reconciliation Line"."Statement Line No.")
            {
            }
            column(DocumentNo_BankAccReconciliationLine;"Bank Acc. Reconciliation Line"."Document No.")
            {
            }
            column(TransactionDate_BankAccReconciliationLine;"Bank Acc. Reconciliation Line"."Transaction Date")
            {
            }
            column(Description_BankAccReconciliationLine;"Bank Acc. Reconciliation Line".Description)
            {
            }
            column(StatementAmount_BankAccReconciliationLine;"Bank Acc. Reconciliation Line"."Statement Amount")
            {
            }
            column(Difference_BankAccReconciliationLine;"Bank Acc. Reconciliation Line".Difference)
            {
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
}

