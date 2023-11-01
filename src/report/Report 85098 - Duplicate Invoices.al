report 85098 "Duplicate Invoices"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Duplicate Invoices.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            column(ExternalDocumentNo_SalesInvoiceHeader;"Sales Invoice Header"."External Document No.")
            {
            }
            column(SelltoCustomerNo_SalesInvoiceHeader;"Sales Invoice Header"."Sell-to Customer No.")
            {
            }
            column(No_SalesInvoiceHeader;"Sales Invoice Header"."No.")
            {
            }
            column(BilltoCustomerNo_SalesInvoiceHeader;"Sales Invoice Header"."Bill-to Customer No.")
            {
            }
            column(BilltoName_SalesInvoiceHeader;"Sales Invoice Header"."Bill-to Name")
            {
            }
            column(InvoiceNo;InvoiceNo)
            {
            }
            column(DocumentNo;DocumentNo)
            {
            }
            column(Amount;Amount)
            {
            }
            column(ShowRecord;ShowRecord)
            {
            }
            column(UserID_SalesInvoiceHeader;"Sales Invoice Header"."User ID")
            {
            }
            column(CreditMemoNo;CreditMemoNo)
            {
            }

            trigger OnAfterGetRecord()
            var
                MemoHeader: Record "Sales Cr.Memo Header";
            begin
                ShowRecord:=false;
                Amount:=0.0;
                    DocumentNo:='';
                    InvoiceNo:='';
                    CreditMemoNo:='';
                SalesInvoiceHeader.Reset;
                SalesInvoiceHeader.SetRange("External Document No.","Sales Invoice Header"."External Document No.");
                SalesInvoiceHeader.SetFilter("No.",'<>%1',"Sales Invoice Header"."No.");
                if SalesInvoiceHeader.FindSet then begin
                  SalesInvoiceHeader.CalcFields("Amount Including VAT");
                  "Sales Invoice Header".CalcFields("Amount Including VAT");
                  if SalesInvoiceHeader."Amount Including VAT"="Sales Invoice Header"."Amount Including VAT" then begin

                    ShowRecord:=true;
                    Amount:="Sales Invoice Header"."Amount Including VAT";
                    DocumentNo:=SalesInvoiceHeader."External Document No.";
                    InvoiceNo:="Sales Invoice Header"."No.";
                    //CHECK IF credit memo exists
                    if ShowRecord=true then begin
                    MemoHeader.Reset;
                    MemoHeader.SetRange("Applies-to Doc. No.",InvoiceNo);
                    if MemoHeader.FindFirst then begin
                      CreditMemoNo:=MemoHeader."No.";
                    end
                     end
                  end
                  else begin
                    Amount:=0.0;
                    DocumentNo:='';
                    InvoiceNo:='';
                  ShowRecord:=false;
                    end;
                end
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
        SalesInvoiceHeader: Record "Sales Invoice Header";
        InvoiceNo: Code[30];
        DocumentNo: Code[30];
        Amount: Decimal;
        ShowRecord: Boolean;
        CreditMemoNo: Code[30];
}

