report 85062 "Booking Posting Routine"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Booking Posting Routine.rdlc';
    Caption = 'Booking Posting Routine';

    dataset
    {
        dataitem("MPESA Integration Table"; "MPESA Integration Table")
        {
            DataItemTableView = WHERE(Fetch = FILTER(false));

            trigger OnAfterGetRecord()
            var
                PaymentsPost: Codeunit "Payments-Post";
                ReceiptsHeader1: Record "Receipts Header1";
                IntegrationTable: Record "MPESA Integration Table";
            begin


                //get the active sitting cycle
                ExaminationSetup.Get;
                SittingCycle := ExaminationSetup."Default Examination Sitting";

                StudentProcessingHeader.Reset;
                StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", "MPESA Integration Table".ACCOUNT_NUMBER);
                StudentProcessingHeader.SetRange("Document Type", StudentProcessingHeader."Document Type"::Booking);
                StudentProcessingHeader.SetRange(Posted, false);
                StudentProcessingHeader.SetRange("Examination Sitting", SittingCycle);//only check the current active sitting cycle
                if StudentProcessingHeader.FindFirst then begin
                    StudentProcessingHeader.CalcFields("Booking Amount");
                    if StudentProcessingHeader."Booking Amount" > 0 then begin

                        TransactionAmount := StudentProcessingHeader."Booking Amount";
                        if ("MPESA Integration Table".MPESA_AMOUNT < TransactionAmount) then begin
                            StudentProcessingHeader."Payment Reference No." := "MPESA Integration Table".MPESA_TXN_ID;
                            StudentProcessingHeader.Modify(true);
                            exit;
                        end;

                        //check is student has an image
                        if StudentProcessingHeader.Image.HasValue then begin
                            if StudentProcessingHeader."Examination Center Code" <> '' then begin
                                //            //check if center is blocked
                                ExaminationCentres.Reset;
                                ExaminationCentres.SetRange(Code, StudentProcessingHeader."Examination Center Code");
                                if ExaminationCentres.FindFirst then begin
                                    if ExaminationCentres.Blocked = true then
                                        exit;
                                end;
                                if StudentProcessingHeader."Student No." <> '' then begin
                                    if StudentProcessingHeader."Booking Invoice No." = '' then begin
                                        //when no invoice exists

                                        StudentManagement.BookingCreateInvoice(StudentProcessingHeader);
                                        Header1.Reset;
                                        Header1.SetRange("No.", StudentProcessingHeader."No.");
                                        if Header1.FindFirst then begin
                                            Header1."Payment Reference No." := "MPESA Integration Table".MPESA_TXN_ID;
                                            Header1.Modify(true);

                                        end;
                                        IntegrationTable.Reset;
                                        IntegrationTable.SetRange(MPESA_TXN_ID, "MPESA Integration Table".MPESA_TXN_ID);
                                        if IntegrationTable.FindFirst then begin
                                            IntegrationTable.Fetch := true;
                                            IntegrationTable."Remaining Amount" := 0;
                                            IntegrationTable."Applied Amount" := "MPESA Integration Table".MPESA_AMOUNT;
                                            IntegrationTable.Modify(true);
                                        end;
                                        // Header.Reset;
                                        // Header.SetRange("No.",StudentProcessingHeader."No.");
                                        // if Header.FindFirst then begin
                                        //   Examination.PostExaminationVoucher(Header);
                                        // end;
                                    end
                                    else begin
                                        //when invoice exists
                                        StudentManagement.BookingCReceipt(StudentProcessingHeader);
                                        Commit;
                                        Header1.Reset;
                                        Header1.SetRange("No.", StudentProcessingHeader."No.");
                                        if Header1.FindFirst then begin
                                            Header1."Payment Reference No." := "MPESA Integration Table".MPESA_TXN_ID;
                                            Header1.Modify(true);
                                        end;
                                        Commit;
                                        IntegrationTable.Reset;
                                        IntegrationTable.SetRange(MPESA_TXN_ID, "MPESA Integration Table".MPESA_TXN_ID);
                                        if IntegrationTable.FindFirst then begin
                                            IntegrationTable.Fetch := true;
                                            IntegrationTable."Remaining Amount" := 0;
                                            IntegrationTable."Applied Amount" := "MPESA Integration Table".MPESA_AMOUNT;
                                            IntegrationTable.Modify(true);
                                        end;
                                        // Header.Reset;
                                        // Header.SetRange("No.",StudentProcessingHeader."No.");
                                        // if Header.FindFirst then begin
                                        //   Examination.PostExaminationVoucher(Header);
                                        // end;

                                    end
                                end
                            end;


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
        ExamSittingCycle: Record "Exam Sitting Cycle";
        SittingCycle: Code[30];
        ExaminationCentres: Record "Examination Centres";
        ExaminationSetup: Record "Examination Setup";
        Header: Record "Student Processing Header";
        Header1: Record "Student Processing Header";
}

