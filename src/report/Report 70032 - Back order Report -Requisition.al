report 70032 "Back order Report -Requisition"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Back order Report -Requisition.rdlc';

    dataset
    {
        dataitem("Imprest Voucher Lines";"Imprest Voucher Lines")
        {
            DataItemTableView = WHERE("Remaining Amount"=FILTER(<>0));
            column(EntryNo_StoreRequisitionNotes;"Imprest Voucher Lines".No)
            {
            }
            column(DocumentNo_StoreRequisitionNotes;"Imprest Voucher Lines"."Line No")
            {
            }
            column(QtyRequested_StoreRequisitionNotes;"Imprest Voucher Lines"."Account Type")
            {
            }
            column(QtyApproved_StoreRequisitionNotes;"Imprest Voucher Lines"."Account No.")
            {
            }
            column(QtyIssued_StoreRequisitionNotes;"Imprest Voucher Lines"."Account Name")
            {
            }
            column(EmployeeNo_StoreRequisitionNotes;"Imprest Voucher Lines".Description)
            {
            }
            column(EmployeeName_StoreRequisitionNotes;"Imprest Voucher Lines".Amount)
            {
            }
            column(Selected_StoreRequisitionNotes;"Imprest Voucher Lines"."Applies- to Doc. No.")
            {
            }
            column(ItemNo_StoreRequisitionNotes;"Imprest Voucher Lines"."Global Dimension 1 Code")
            {
            }
            column(Description_StoreRequisitionNotes;"Imprest Voucher Lines"."Global Dimension 2 Code")
            {
            }
            column(UnitMeasures_StoreRequisitionNotes;"Imprest Voucher Lines"."Actual Spent")
            {
            }
            column(RemainingQty_StoreRequisitionNotes;"Imprest Voucher Lines"."Remaining Amount")
            {
            }
            column(RequisitionDate_StoreRequisitionNotes;"Imprest Voucher Lines".Committed)
            {
            }
            column(RequstedBy_StoreRequisitionNotes;"Imprest Voucher Lines"."Advance Type")
            {
            }
            column(Dept_StoreRequisitionNotes;"Imprest Voucher Lines"."Currency Code")
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

