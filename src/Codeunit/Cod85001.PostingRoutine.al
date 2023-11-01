#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 85001 "Posting Routine"
{

    trigger OnRun()
    begin
        //PostingRoutine.RUN();
    end;

    var
        //  PostingRoutine: Report "Defferment Posting Routine";
        StudentProcessingHeader: Record "Student Processing Header";
        StudentManagement: Codeunit "Student management";
        Examination: Codeunit Examination;
        TransactionAmount: Decimal;
        "MPESA Integration Table": Record "MPESA Integration Table";

    procedure FnPostingRoutine() result: Code[100]
    begin
        //result:='TRUE';
        //PostingRoutine.RUN();
        //result:='TRUE';
        "MPESA Integration Table".Reset;
        "MPESA Integration Table".SetRange("MPESA Integration Table".Fetch, false);
        if "MPESA Integration Table".Find('-') then begin
            StudentProcessingHeader.Reset;
            StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", "MPESA Integration Table".ACCOUNT_NUMBER);
            StudentProcessingHeader.SetRange("Document Type", StudentProcessingHeader."document type"::Registration);
            if StudentProcessingHeader.FindFirst then begin
                TransactionAmount := StudentProcessingHeader."Application Amount";
                if "MPESA Integration Table".MPESA_AMOUNT < TransactionAmount then
                    exit;
                if StudentProcessingHeader.Portal = true then begin
                    if StudentProcessingHeader."Student No." = '' then begin

                        StudentManagement.ApplicationOnboardCustomer(StudentProcessingHeader);

                        "MPESA Integration Table".Fetch := true;
                        "MPESA Integration Table".Modify(true);
                    end else begin

                        StudentManagement.ApplicationCreateInvoice(StudentProcessingHeader);

                        "MPESA Integration Table".Fetch := true;
                        "MPESA Integration Table".Modify(true);
                    end;
                end
                else begin
                    if StudentProcessingHeader."Application Invoice" <> '' then begin
                        Examination.ApplicationCReceipt(StudentProcessingHeader);

                        "MPESA Integration Table".Fetch := true;
                        "MPESA Integration Table".Modify(true);
                    end else begin
                        Examination.ApplicationCreateInvoice(StudentProcessingHeader);
                        Examination.ApplicationCReceipt(StudentProcessingHeader);
                        "MPESA Integration Table".Fetch := true;
                        "MPESA Integration Table".Modify(true);
                    end
                end

            end;
            StudentProcessingHeader.Reset;
            StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", "MPESA Integration Table".ACCOUNT_NUMBER);
            StudentProcessingHeader.SetRange("Document Type", StudentProcessingHeader."document type"::Exemption);
            if StudentProcessingHeader.FindFirst then begin
                StudentProcessingHeader.CalcFields("Exemption Amount");
                TransactionAmount := StudentProcessingHeader."Exemption Amount";
                if "MPESA Integration Table".MPESA_AMOUNT < TransactionAmount then
                    exit;
                Examination.ExemptionCreatReceipt(StudentProcessingHeader);
                "MPESA Integration Table".Fetch := true;
                "MPESA Integration Table".Modify(true);
            end;
            StudentProcessingHeader.Reset;
            StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", "MPESA Integration Table".ACCOUNT_NUMBER);
            StudentProcessingHeader.SetRange("Document Type", StudentProcessingHeader."document type"::Booking);
            if StudentProcessingHeader.FindFirst then begin
                StudentProcessingHeader.CalcFields("Booking Amount");
                TransactionAmount := StudentProcessingHeader."Booking Amount";
                if "MPESA Integration Table".MPESA_AMOUNT < TransactionAmount then
                    exit;
                StudentManagement.BookingCreateInvoice(StudentProcessingHeader);

                Examination.PostCenterBookingAllocation(StudentProcessingHeader);
                Examination.PostExaminationVoucher(StudentProcessingHeader);
                "MPESA Integration Table".Fetch := true;
                "MPESA Integration Table".Modify(true);
            end;
            StudentProcessingHeader.Reset;
            StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", "MPESA Integration Table".ACCOUNT_NUMBER);
            StudentProcessingHeader.SetRange("Document Type", StudentProcessingHeader."document type"::Renewal);
            if StudentProcessingHeader.FindFirst then begin
                StudentProcessingHeader.CalcFields("Renewal Amount");
                TransactionAmount := StudentProcessingHeader."Renewal Amount";
                if "MPESA Integration Table".MPESA_AMOUNT < TransactionAmount then
                    exit;
                Examination.RenewalCreateInvoice(StudentProcessingHeader);
                Commit;

                Examination.RenewalCReceipt(StudentProcessingHeader);
                "MPESA Integration Table".Fetch := true;
                "MPESA Integration Table".Modify(true);
            end;

        end;
    end;
}

