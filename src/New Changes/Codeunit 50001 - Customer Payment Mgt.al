codeunit 50003 "Customer Payment Mgt"
{
    // //Create functions for
    // //1. Verify customer
    // //2. Create customer
    // //3. Sales Header
    // //4. Sales Line
    // //5. Post Invoice
    // //6. Apply payment using general journal


    trigger OnRun();
    var
        Posted_Invoice: Boolean;
    begin
        // MESSAGE(CreateCustomer('Alfred', 'P0151149239E', '', 'aalfred@gmail','test','44-koka','Busia','Effluent Discharge License'));
        // CreateInvoice('PTCCNT0015', 'WST_2114238323190951', TODAY, 1, 4000, '4321fds900','Busia', 'Payment for stuffs', 2000, 1500,500);
        // Posted_Invoice:= PostInvoice('WST_1100', 'test', 5000);
        // message('we have realized we ',Posted_Invoice);
        // GetGLCode('ODS_2344');
        MESSAGE(CreateCustomer(' GENERAL CONFERENCE CORPORATION OF SEVENTH-DAY ADVENTISTS', 'P0151149239E', '', 'ndegec@ecd.adventist.org', 'EDL_9485', 'P.O BOX PRIVATE BAG, MBAGATHI 00503', 'Kajiado', 'Effluent Discharge License'));
    end;

    var
        CustomerList: Record "Customer";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        GeneralJnlLine: Record "Gen. Journal Line";
        SalesPost: Codeunit "Sales-Post";
        CustomerNumber: Code[20];
        PostedSalesInvNo: Integer;
        GenJnlPost: Codeunit "Gen. Jnl.-Post Line";
        BillingAndCharges: Record "Billing Charge Table";
        Pos: Integer;
        Token: Text[10];
        GLEntry: Record "G/L Entry";
        CustomerList1: Record "Customer Ticked";
        PaymentTicked: Record "Customer Payments";

    procedure VerifyCustomer(KRAPin: Code[20]) CustomerNumber: Code[20];
    begin
        CustomerList.SETRANGE("PIN No", KRAPin);
        IF CustomerList.FINDFIRST THEN BEGIN
            CustomerNumber := CustomerList."No."
        END
        ELSE BEGIN
            CustomerNumber := ''
        END
    end;

    procedure CreateCustomer(CustomerName: Code[1000]; CustomerPIN: Code[100]; CustomerMobileNo: Code[100]; CustomerEmail: Code[100]; InvoiceNo: Code[100]; Address: Text[1000]; County: Text[100]; SvcType: Text[1000]) CustomerNumber: Code[20];
    begin
        IF VerifyCustomer(CustomerPIN) = '' THEN BEGIN
            CustomerList."No." := InvoiceNo;
            CustomerList.Name := CustomerName;
            CustomerList."PIN No" := CustomerPIN;
            CustomerList."Phone No." := CustomerMobileNo;
            CustomerList."E-Mail" := CustomerEmail;
            //CustomerList.Address:=Address;
            CustomerList."Address 2" := Address;
            CustomerList.City := County;
            CustomerList."Customer Posting Group" := 'BILLINGL&S';
            CustomerList."Gen. Bus. Posting Group" := 'LOCAL';
            CustomerList."Customer Type" := CustomerList."Customer Type"::Expert;
            CustomerList.CustomerTypeID := 0;
            CustomerList."Service Type" := SvcType;
            CustomerList.INSERT;
            CustomerNumber := CustomerList."No.";
        END
        ELSE BEGIN
            CustomerNumber := VerifyCustomer(CustomerPIN);
        END

    end;

    procedure CreateInvoice(CustomerNo: Code[20]; DocNo: Code[20]; PostingDate: Date; LineQuantity: Integer; LineAmountIncl: Integer; ExtDocNo: Code[20]; County: Text[100]; Description: Text[1000]; LicenseFee: Decimal; Penalty: Decimal; AppFee: Decimal) SalesHeaderPosted: Boolean;
    var
        NextLineNo: Integer;
    begin
        //Sales Header
        SalesHeader.INIT;
        CustomerList.INIT;
        CustomerList.GET(CustomerNo);

        SalesHeader."No." := DocNo;
        SalesHeader."Sell-to Customer No." := CustomerNo;

        SalesHeader.VALIDATE(SalesHeader."Sell-to Customer No.");
        SalesHeader."Bill-to Customer No." := CustomerNo;

        SalesHeader.VALIDATE(SalesHeader."Bill-to Customer No.");
        SalesHeader."Sell-to Customer Name" := CustomerList.Name;
        SalesHeader."Sell-to Contact" := CustomerList."Phone No.";

        SalesHeader."Bill-to City" := County;
        SalesHeader."Sell-to City" := County;
        SalesHeader."Posting Date" := PostingDate;
        SalesHeader."Document Date" := TODAY;
        SalesHeader."Due Date" := TODAY;
        SalesHeader."External Document No." := ExtDocNo;
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;

        IF SalesHeader.INSERT THEN
            IF (LicenseFee > 0) THEN
                CreateSalesLine(SalesHeader."No.", LicenseFee, 'License fee', SalesHeader."Document Type", DocNo, CustomerNo);
        IF (AppFee > 0) THEN
            CreateSalesLine(SalesHeader."No.", AppFee, 'Application Fee', SalesHeader."Document Type", DocNo, CustomerNo);
        IF (Penalty > 0) THEN
            CreateSalesLine(SalesHeader."No.", Penalty, 'Penalty', SalesHeader."Document Type", DocNo, CustomerNo);



        //IF CreateSalesLine(SalesHeader."No.", LineAmountIncl, Description, DocNo, CustomerNo) THEN
        SalesHeaderPosted := PostInvoice(DocNo, CustomerNo, LineAmountIncl);
    end;

    procedure PostInvoice(InvoiceNo: Code[20]; CustomerNumber: Code[20]; Amount: Decimal) Posted: Boolean;
    begin

        SalesHeader.INIT;
        IF SalesHeader.GET(SalesHeader."Document Type"::Invoice, InvoiceNo) THEN BEGIN
            SalesHeader.Status := SalesHeader.Status::Released;
            SalesHeader.MODIFY := TRUE;
            SalesPost.RUN(SalesHeader);

            GeneralJnlLine.INIT;
            GeneralJnlLine.SETRANGE("Journal Template Name", 'General');
            GeneralJnlLine.SETRANGE("Journal Batch Name", 'SPTBATCH');
            IF GeneralJnlLine.FIND('<>') THEN BEGIN
                GeneralJnlLine.DELETE(TRUE)
            END;
            GeneralJnlLine."Journal Template Name" := 'General';
            GeneralJnlLine."Journal Batch Name" := 'SPTBATCH';
            GeneralJnlLine."Line No." := 1000;
            GeneralJnlLine."Posting Date" := TODAY;
            GeneralJnlLine."Document No." := InvoiceNo;
            GeneralJnlLine."Document Type" := GeneralJnlLine."Document Type"::Payment;
            GeneralJnlLine."Account Type" := GeneralJnlLine."Account Type"::Customer;
            GeneralJnlLine."Account No." := CustomerNumber;
            GeneralJnlLine.VALIDATE(GeneralJnlLine."Account No.");
            GeneralJnlLine.Amount := -1 * Amount;
            GeneralJnlLine.VALIDATE(GeneralJnlLine.Amount);
            GeneralJnlLine.Description := 'ECitizen Payment';
            GeneralJnlLine."Bal. Account Type" := GeneralJnlLine."Bal. Account Type"::"Bank Account";
            GeneralJnlLine."Bal. Account No." := 'ECITIZEN';
            GeneralJnlLine."Applies-to Doc. Type" := GeneralJnlLine."Applies-to Doc. Type"::Invoice;
            GeneralJnlLine."Applies-to Doc. No." := InvoiceNo;
            GeneralJnlLine."System-Created Entry" := TRUE;
            IF GeneralJnlLine.INSERT THEN BEGIN
                GenJnlPost.RUN(GeneralJnlLine);
                GLEntry.RESET;
                GLEntry.SETRANGE("Document No.", InvoiceNo);
                GLEntry.SETRANGE("Posting Date", TODAY);
                GLEntry.SETRANGE("Journal Batch Name", 'SPTBATCH');
                IF GLEntry.FINDFIRST THEN BEGIN
                    Posted := TRUE;
                END
            END
        END
        ELSE BEGIN
            Posted := FALSE
        END
    end;

    local procedure GetGLCode(SvcCode: Code[20]) GLCode: Code[20];
    begin
        Pos := STRPOS(SvcCode, '_');
        IF Pos > 0 THEN BEGIN
            Token := COPYSTR(SvcCode, 1, Pos - 1);
            //message(Token);
        END;
        BillingAndCharges.SETRANGE(BillingAndCharges."Service Code", Token);
        IF BillingAndCharges.FINDFIRST THEN BEGIN
            GLCode := BillingAndCharges."Income G/L Account";
            //message('We have gotten '+GLCode);
        END ELSE BEGIN
            ERROR('Service code does not exist, please setup Income G/L Service code for ' + SvcCode)
        END;
    end;

    local procedure GetSvcType(SvcCode: Code[20]) SvcType: Text[200];
    begin
        Pos := STRPOS(SvcCode, '_');
        IF Pos > 0 THEN BEGIN
            Token := COPYSTR(SvcCode, 1, Pos - 1);
            //message(Token);
        END;
        BillingAndCharges.SETRANGE(BillingAndCharges."Service Code", Token);
        IF BillingAndCharges.FINDFIRST THEN BEGIN
            SvcType := BillingAndCharges."Service Type";
            //message('We have gotten '+GLCode);
        END ELSE BEGIN
            ERROR('Service type does not exist, please setup Income G/L Service code for ' + SvcCode)
        END;
    end;

    local procedure CreateSalesLine(SalesHeaderNo: Code[20]; LineAmountIncl: Decimal; Description: Text[100]; DocType: Option; DocNo: Code[20]; CustomerNo: Code[20]) SalesLinePost: Boolean;
    var
        NextLineNo: Integer;
    begin
        SalesLine.SETRANGE("Document Type", DocType);
        SalesLine.SETRANGE("Document No.", SalesHeaderNo);
        SalesLine."Line No." := NextLineNo;

        IF SalesLine.FIND('+') THEN
            NextLineNo := SalesLine."Line No." + 10000
        ELSE
            NextLineNo := 1000;

        //Sales Line
        SalesLine."Line No." := NextLineNo;
        SalesLine."No." := GetGLCode(DocNo);
        SalesLine.Type := SalesLine.Type::"G/L Account";
        SalesLine."Document No." := SalesHeaderNo;
        SalesLine.VALIDATE(SalesLine."Line No.");
        SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
        SalesLine."Sell-to Customer No." := CustomerNo;
        SalesLine.Description := Description;
        SalesLine.Quantity := 1;
        SalesLine."Qty. to Ship" := 1;
        SalesLine."Qty. to Invoice" := 1;
        SalesLine."Amount Including VAT" := LineAmountIncl;
        SalesLine.Amount := LineAmountIncl;
        SalesLine."Unit Price" := LineAmountIncl;
        SalesLine."Gen. Bus. Posting Group" := 'LOCAL';
        SalesLine."Gen. Prod. Posting Group" := 'SERVICES';
        SalesLine."VAT Prod. Posting Group" := 'NONVAT';
        SalesLine.INSERT;
    end;

    procedure SaveTickedCustomer(CustomerName: Code[150]; CustomerPIN: Code[100]; CustomerMobileNo: Code[100]; CustomerEmail: Code[100]; InvoiceNo: Code[100]; Address: Text[100]; County: Text[100]; SvcType: Text[1000]) CustomerNumber: Code[20];
    begin
        IF NOT CustomerList1.GET(InvoiceNo) THEN BEGIN
            CustomerList1.INIT;
            CustomerList1."No." := InvoiceNo;
            CustomerList1.Name := CustomerName;
            CustomerList1."PIN No." := CustomerPIN;
            CustomerList1."Phone No." := CustomerMobileNo;
            CustomerList1."E-Mail" := CustomerEmail;
            CustomerList1.Address := Address;
            CustomerList1."Address 2" := Address;
            CustomerList1.City := County;
            CustomerList1."Customer Posting Group" := 'BILLINGL&S';
            CustomerList1."Gen. Bus. Posting Group" := 'LOCAL';
            CustomerList1."Customer Type" := CustomerList1."Customer Type"::Expert;
            //CustomerList1.CustomerTypeID := 0;
            CustomerList1."Service Type" := SvcType;
            CustomerList1.INSERT;
            CustomerNumber := CustomerList1."No.";
        END
    end;

    procedure SaveTickedPayment(CustomerID: Code[20]; CustomerName: Text[50]; PaymentCode: Code[20]; PaymentCode2: Code[20]; BankName: Text[50]; PaymentDate: Date; PaidBy: Text[50]; PhoneNumber: Text[50]; Amount: Decimal; UserID: Text[80]);
    begin
        PaymentTicked.INIT;

        PaymentTicked."Customer ID" := CustomerID;
        PaymentTicked."Customer Name" := CustomerName;
        PaymentTicked."Payment Code" := PaymentCode;
        PaymentTicked."Payment Code 2" := PaymentCode2;
        PaymentTicked."Bank Name" := BankName;
        PaymentTicked."Payment Date" := PaymentDate;
        PaymentTicked."Paid By" := PaidBy;
        PaymentTicked."Phone Number" := PhoneNumber;
        PaymentTicked.Amount := Amount;
        PaymentTicked."User ID" := UserID;

        PaymentTicked.INSERT(TRUE);
    end;
}

