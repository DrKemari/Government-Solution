report 85116 "Exemption Posting Routine"
{
    // portal only
    DefaultLayout = RDLC;
    RDLCLayout = './Exemption Posting Routine.rdlc';

    Caption = 'Exemption Posting Routine';

    dataset
    {
        dataitem("MPESA Integration Table";"MPESA Integration Table")
        {
            DataItemTableView = WHERE(Fetch=FILTER(false));

            trigger OnAfterGetRecord()
            var
                PaymentsPost: Codeunit "Payments-Post";
                ReceiptsHeader1: Record "Receipts Header1";
            begin
                 StudentProcessingHeader.Reset;
                 StudentProcessingHeader.SetRange(StudentProcessingHeader."No.","MPESA Integration Table".ACCOUNT_NUMBER);
                 StudentProcessingHeader.SetRange("Document Type",StudentProcessingHeader."Document Type"::Exemption);
                 StudentProcessingHeader.SetRange(Posted,false);
                      if StudentProcessingHeader.FindFirst then begin
                        if StudentProcessingHeader."Exemption Invoice No."<>'' then begin
                             StudentProcessingHeader.CalcFields("Exemption Amount");
                                TransactionAmount:=StudentProcessingHeader."Exemption Amount";
                                    if  ("MPESA Integration Table".MPESA_AMOUNT<TransactionAmount)
                                      or ("MPESA Integration Table".MPESA_AMOUNT>TransactionAmount)
                                      then begin
                                             StudentProcessingHeader."Payment Reference No.":="MPESA Integration Table".MPESA_TXN_ID;
                                             StudentProcessingHeader.Modify(true);
                                         exit;
                                 end;

                                  StudentProcessingHeader."Payment Reference No.":="MPESA Integration Table".MPESA_TXN_ID;
                                   StudentProcessingHeader.Modify(true);
                                  Examination.MPESAApplyPaymentEntry(StudentProcessingHeader);
                                  "MPESA Integration Table"."Remaining Amount":="MPESA Integration Table".MPESA_AMOUNT-TransactionAmount;
                                  if "MPESA Integration Table".MPESA_AMOUNT=TransactionAmount then begin
                                     "MPESA Integration Table".Fetch:=true;

                                  end;
                                  //"MPESA Integration Table".MODIFY(TRUE);
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
}

