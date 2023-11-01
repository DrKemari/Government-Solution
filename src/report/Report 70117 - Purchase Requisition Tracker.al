report 70117 "Purchase Requisition Tracker"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Purchase Requisition Tracker.rdlc';

    dataset
    {
        dataitem(REQ;"Purchase Header")
        {
            DataItemTableView = WHERE("Document Type"=CONST("Purchase Requisition"));
            column(Amount_REQ;REQ.Amount)
            {
            }
            column(AmountIncludingVAT_REQ;REQ."Amount Including VAT")
            {
            }
            column(BuyfromVendorName_REQ;REQ."Buy-from Vendor Name")
            {
            }
            column(Description_REQ;REQ.Description)
            {
            }
            column(DocumentType_REQ;REQ."Document Type")
            {
            }
            column(BuyfromVendorNo_REQ;REQ."Buy-from Vendor No.")
            {
            }
            column(No_REQ;REQ."No.")
            {
            }
            dataitem(PR;"Procurement Request")
            {
                DataItemLink = "Requisition No"=FIELD("No.");
                column(No_PR;PR.No)
                {
                }
                column(RequisitionNo_PR;PR."Requisition No")
                {
                }
                column(ProcurementPlanNo_PR;PR."Procurement Plan No")
                {
                }
                column(ProcurementMethod_PR;PR."Procurement Method")
                {
                }
                column(ProcessType_PR;PR."Process Type")
                {
                }
                column(ProcurementPlanItem_PR;PR."Procurement Plan Item")
                {
                }
                column(SupplierCategory_PR;PR."Supplier Category")
                {
                }
                column(POType_PR;PR."PO Type")
                {
                }
            }
            dataitem(PO;"Purchase Header")
            {
                DataItemLink = "Requisition No"=FIELD("No.");
                column(RequisitionNo_PO;PO."Requisition No")
                {
                }
                column(Amount_PO;PO.Amount)
                {
                }
                column(AmountIncludingVAT_PO;PO."Amount Including VAT")
                {
                }
                column(BuyfromVendorName_PO;PO."Buy-from Vendor Name")
                {
                }
                column(DocumentType_PO;PO."Document Type")
                {
                }
                column(BuyfromVendorNo_PO;PO."Buy-from Vendor No.")
                {
                }
                column(No_PO;PO."No.")
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
}

