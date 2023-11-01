report 85066 "Renewal Posting Routine"
{
    // //start from 26/10/2021
    DefaultLayout = RDLC;
    RDLCLayout = './Renewal Posting Routine.rdlc';

    Caption = 'Renewal Posting Routine';

    dataset
    {
        dataitem("MPESA Integration Table";"MPESA Integration Table")
        {
            DataItemTableView = WHERE(Fetch=FILTER(false));

            trigger OnAfterGetRecord()
            var
                PaymentsPost: Codeunit "Payments-Post";
                ReceiptsHeader1: Record "Receipts Header1";
                SalesInv: Record "Sales Header";
            begin
                 StudentProcessingHeader.Reset;
                 StudentProcessingHeader.SetRange(StudentProcessingHeader."No.","MPESA Integration Table".ACCOUNT_NUMBER);
                 StudentProcessingHeader.SetRange("Document Type",StudentProcessingHeader."Document Type"::Renewal);
                 StudentProcessingHeader.SetRange(Posted,false);
                 //StudentProcessingHeader.SETRANGE(Date,TODAY);
                      if StudentProcessingHeader.FindFirst then begin
                         StudentProcessingHeader.CalcFields("Renewal Amount");
                        TransactionAmount:=StudentProcessingHeader."Renewal Amount";
                         if  ("MPESA Integration Table".MPESA_AMOUNT<TransactionAmount) or ("MPESA Integration Table".MPESA_AMOUNT>TransactionAmount)
                          then begin
                           StudentProcessingHeader."Payment Reference No.":="MPESA Integration Table".MPESA_TXN_ID;
                           StudentProcessingHeader.Modify(true);
                          exit;
                           end;

                         CustLedgerEntry.Reset;
                         CustLedgerEntry.SetRange("Bill-to Customer No.",StudentProcessingHeader."Student No.");
                         CustLedgerEntry.SetRange("External Document No.",StudentProcessingHeader."No.");
                         CustLedgerEntry.SetRange("Document Type",CustLedgerEntry."Document Type"::Invoice);
                         if not CustLedgerEntry.FindFirst then begin
                           Examination.RenewalCreateInvoice(StudentProcessingHeader);
                            Commit;
                         end;
                         ProcessingHeader.Reset;
                         ProcessingHeader.SetRange("No.",StudentProcessingHeader."No.");
                         if ProcessingHeader.FindFirst then begin
                         Examination.RenewalCReceipt(ProcessingHeader);

                          // Examination.RenewalSendReceipt(ProcessingHeader);//Job queue log
                         end;
                        "MPESA Integration Table".Fetch:=true;
                        "MPESA Integration Table".Modify(true);
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

    var
        StudentProcessingHeader: Record "Student Processing Header";
        StudentManagement: Codeunit "Student management";
        Examination: Codeunit Examination;
        TransactionAmount: Decimal;
        ProcessingHeader: Record "Student Processing Header";
        CustLedgerEntry: Record "Sales Header";
}

