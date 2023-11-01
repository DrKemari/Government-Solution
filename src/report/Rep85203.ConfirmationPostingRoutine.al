#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85203 "Confirmation Posting Routine"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Confirmation Posting Routine.rdlc';
    Caption = 'Confirmation Posting Routine';

    dataset
    {
        dataitem("MPESA Integration Table";"MPESA Integration Table")
        {
            DataItemTableView = where(Fetch=filter(false));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            var
                PaymentsPost: Codeunit "Payments-Post";
                ReceiptsHeader1: Record "Receipts Header1";
                IntegrationTable: Record "MPESA Integration Table";
            begin

                 StudentProcessingHeader.Reset;
                 StudentProcessingHeader.SetRange(StudentProcessingHeader."No.","MPESA Integration Table".ACCOUNT_NUMBER);
                 StudentProcessingHeader.SetRange("Document Type",StudentProcessingHeader."document type"::Confirmation);
                 StudentProcessingHeader.SetRange(Posted,false);
                if StudentProcessingHeader.FindFirst then begin
                    StudentProcessingHeader.CalcFields("Activation Amount");
                    if StudentProcessingHeader."Activation Amount">0 then begin

                      TransactionAmount:=StudentProcessingHeader."Activation Amount";
                       if  ("MPESA Integration Table".MPESA_AMOUNT<TransactionAmount) then begin
                           StudentProcessingHeader."Payment Reference No.":="MPESA Integration Table".MPESA_TXN_ID;
                           StudentProcessingHeader.Modify(true);
                          exit;
                      end else begin
                        if StudentProcessingHeader."Student No."<>'' then begin
                          if StudentProcessingHeader."Activation Invoice No."='' then begin
                              Examination.ConfirmationCreateInvoice(StudentProcessingHeader);
                              StudentManagement.ConfirmationCReceipt(StudentProcessingHeader);
                              Header1.Reset;
                              Header1.SetRange("No.",StudentProcessingHeader."No.");
                              if Header1.FindFirst then begin
                                Header1."Payment Reference No.":="MPESA Integration Table".MPESA_TXN_ID;
                                Header1.Modify(true);

                              end;
                              IntegrationTable.Reset;
                              IntegrationTable.SetRange(MPESA_TXN_ID,"MPESA Integration Table".MPESA_TXN_ID);
                              if IntegrationTable.FindFirst then begin
                                IntegrationTable.Fetch:=true;
                                IntegrationTable."Remaining Amount":=0;
                                IntegrationTable."Applied Amount":="MPESA Integration Table".MPESA_AMOUNT;
                                IntegrationTable.Modify(true);
                              end;
                          end else begin
                             StudentManagement.ConfirmationCReceipt(StudentProcessingHeader);
                              Header1.Reset;
                              Header1.SetRange("No.",StudentProcessingHeader."No.");
                              if Header1.FindFirst then begin
                                Header1."Payment Reference No.":="MPESA Integration Table".MPESA_TXN_ID;
                                Header1.Modify(true);

                              end;
                              IntegrationTable.Reset;
                              IntegrationTable.SetRange(MPESA_TXN_ID,"MPESA Integration Table".MPESA_TXN_ID);
                              if IntegrationTable.FindFirst then begin
                                IntegrationTable.Fetch:=true;
                                IntegrationTable."Remaining Amount":=0;
                                IntegrationTable."Applied Amount":="MPESA Integration Table".MPESA_AMOUNT;
                                IntegrationTable.Modify(true);
                              end;

                          end
                        end
                      end

                  end
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
        ExaminationCentres: Record "Examination Centres";
        ExaminationSetup: Record "Examination Setup";
        Header: Record "Student Processing Header";
        Header1: Record "Student Processing Header";
}
