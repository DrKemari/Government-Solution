report 85068 "Registration Posting Routine"
{
    // portal only
    DefaultLayout = RDLC;
    RDLCLayout = './Registration Posting Routine.rdlc';

    Caption = 'Registration Posting Routine';

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
                 StudentProcessingHeader.SetRange("Document Type",StudentProcessingHeader."Document Type"::Registration);
                 StudentProcessingHeader.SetRange(Posted,false);
                      if StudentProcessingHeader.FindFirst then begin
                                TransactionAmount:=StudentProcessingHeader."Application Amount";
                                    if  ("MPESA Integration Table".MPESA_AMOUNT<TransactionAmount) then begin
                           StudentProcessingHeader."Payment Reference No.":="MPESA Integration Table".MPESA_TXN_ID;
                           StudentProcessingHeader.Modify(true);
                          exit;
                           end;
                                if StudentProcessingHeader.Portal=true then begin
                                       if StudentProcessingHeader."Student No."='' then begin
                                         if StudentProcessingHeader."Type Code"<>'' then begin

                                           StudentManagement.ApplicationOnboardCustomer(StudentProcessingHeader);

                                           "MPESA Integration Table".Fetch:=true;
                                        "MPESA Integration Table".Modify(true);
                                        end;
                                        end else begin

                                      StudentManagement.ApplicationCreateInvoice(StudentProcessingHeader);
                                      ReceiptsHeader1.Reset;
                                      ReceiptsHeader1.SetRange("Payment Reference","MPESA Integration Table".MPESA_TXN_ID);
                                      ReceiptsHeader1.SetRange(Posted,true);
                                          if ReceiptsHeader1.FindFirst then begin
                                             "MPESA Integration Table"."Remaining Amount":=0;
                                             "MPESA Integration Table".Fetch:=true;
                                              "MPESA Integration Table".Modify(true);
                                          end;
                                    end

                          end

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

