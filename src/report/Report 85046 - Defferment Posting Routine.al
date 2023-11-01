report 85046 "Defferment Posting Routine"
{
    // //start from 26/10/2021
    DefaultLayout = RDLC;
    RDLCLayout = './Defferment Posting Routine.rdlc';

    Caption = 'Defferment Posting Routine';

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
                 StudentProcessingHeader.SetRange("Document Type",StudentProcessingHeader."Document Type"::Defferment);
                 StudentProcessingHeader.SetRange(Posted,false);
                 if StudentProcessingHeader.FindFirst then begin
                   if StudentProcessingHeader."Application Invoice"<>'' then begin
                        TransactionAmount:=StudentProcessingHeader."Administrative Fees";
                        if StudentProcessingHeader."Payment Reference No."='' then begin
                                 if  ("MPESA Integration Table".MPESA_AMOUNT<>0)then begin
                                     StudentProcessingHeader."Payment Reference No.":="MPESA Integration Table".MPESA_TXN_ID;
                                     StudentProcessingHeader.Modify(true);
                                     exit;
                                  end ;
                          end
                          else begin

                                Examination.MPESAApplyPaymentEntry(StudentProcessingHeader);
                                "MPESA Integration Table".Fetch:=true;
                                "MPESA Integration Table".Modify(true);
                          end;

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
        StudentProcessingHeader: Record "Student Processing Header";
        StudentManagement: Codeunit "Student management";
        Examination: Codeunit Examination;
        TransactionAmount: Decimal;
        ProcessingHeader: Record "Student Processing Header";
        CustLedgerEntry: Record "Sales Header";
}

