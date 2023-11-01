report 57022 "Rejected Purchase Invoices"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Rejected Purchase Invoices.rdlc';

    dataset
    {
        dataitem("Purchase Header";"Purchase Header")
        {
            DataItemTableView = WHERE(Status=FILTER(Open),"Document Type"=FILTER(Invoice));
            column(DocumentType_PurchaseHeader;"Purchase Header"."Document Type")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader;"Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(No_PurchaseHeader;"Purchase Header"."No.")
            {
            }
            column(PaytoVendorNo_PurchaseHeader;"Purchase Header"."Pay-to Vendor No.")
            {
            }
            column(PaytoName_PurchaseHeader;"Purchase Header"."Pay-to Name")
            {
            }
            column(PaytoName2_PurchaseHeader;"Purchase Header"."Pay-to Name 2")
            {
            }
            column(PaytoAddress_PurchaseHeader;"Purchase Header"."Pay-to Address")
            {
            }
            column(PaytoAddress2_PurchaseHeader;"Purchase Header"."Pay-to Address 2")
            {
            }
            column(VendorInvoiceNo_PurchaseHeader;"Purchase Header"."Vendor Invoice No.")
            {
            }
            column(Amount_PurchaseHeader;"Purchase Header".Amount)
            {
            }
            column(AmountIncludingVAT_PurchaseHeader;"Purchase Header"."Amount Including VAT")
            {
            }
            column(RejectedTrue;RejectedTrue)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(RejectionDate;RejectionDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //get status
                RejectedTrue:=false;
                ApprovalEntry.Reset;
                ApprovalEntry.SetRange("Document No.","Purchase Header"."No.");
                ApprovalEntry.SetRange(Status,ApprovalEntry.Status::Rejected);
                if ApprovalEntry.FindFirst then begin
                  RejectionDate:=DT2Date(ApprovalEntry."Last Date-Time Modified");
                  RejectedTrue:=true;
                end;
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        ApprovalEntry: Record "Approval Entry";
        RejectedTrue: Boolean;
        CI: Record "Company Information";
        RejectionDate: Date;
}

