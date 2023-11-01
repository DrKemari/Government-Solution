#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50103 "MPESA Integration"
{

    trigger OnRun()
    begin
        //MESSAGE(PollPendingSMS());
        //MESSAGE(FnInsertTransaction('OKHDJK2345','INVO24567','Steve Mutinda Mbisu','2547758318',200,25677));
    end;

    var
        SMSMessages: Record "SMS Messages";
        ExDutyGLAcc: label '01-0-0316';
        iEntryNo: Integer;
        PaybillTrans: Record "MPESA Transactions PB";
        MpesaTransactions: Record "MPESA Integration Table";


    procedure PollPendingSMS() MessageDetails: Text[500]
    begin

        SMSMessages.Reset;
        SMSMessages.SetRange(SMSMessages."Sent To Server", SMSMessages."sent to server"::No);
        if SMSMessages.Find('-') then begin

            if (SMSMessages."Telephone No" = '') or (SMSMessages."Telephone No" = '+') or (SMSMessages."SMS Message" = '') then begin
                SMSMessages."Sent To Server" := SMSMessages."sent to server"::Failed;
                SMSMessages."Sent To Server Status" := 'FAILED';
                SMSMessages.Modify;
            end
            else begin
                MessageDetails := SMSMessages."Telephone No" + ':::' + SMSMessages."SMS Message" + SMSMessages."Additional Message" + ':::' + Format(SMSMessages."Entry No") + ':::' + SMSMessages."Entered By";
            end;
        end;
    end;


    procedure ConfirmSent(TelephoneNo: Text[20]; Status: Integer)
    begin

        begin
            SMSMessages.Reset;
            SMSMessages.SetRange(SMSMessages."Sent To Server", SMSMessages."sent to server"::No);
            SMSMessages.SetRange(SMSMessages."Entry No", Status);
            if SMSMessages.FindFirst then begin
                SMSMessages."Sent To Server" := SMSMessages."sent to server"::Yes;
                SMSMessages."Sent To Server Status" := 'SUCCESS';
                SMSMessages."Delivery Status" := 'Delivery Assumed';
                SMSMessages.Modify;

            end
        end;
    end;


    procedure UpdateDeliveryStatus(tranID: Decimal; TraceID: Text; Balance: Decimal; status: Decimal) result: Code[50]
    begin
        SMSMessages.Reset;
        SMSMessages.SetRange(SMSMessages."Entry No", tranID);
        if SMSMessages.Find('-') then begin
            SMSMessages."Delivery Status" := TraceID;
            SMSMessages."Bulk SMS Balance" := Balance;
            SMSMessages.Fetched := status;
            SMSMessages."Date Sent to Server" := CurrentDatetime;
            SMSMessages."Time Sent To Server" := Time;
            if SMSMessages.Modify = true then
                result := 'TRUE'
            else
                result := 'FALSE';
        end;
    end;


    procedure FnSendSMSMessage(documentNo: Text[30]; accountno: Text[30]; phone: Text[20]; message: Text[250])
    begin

        SMSMessages.Reset;
        if SMSMessages.Find('+') then begin
            iEntryNo := SMSMessages."Entry No";
            iEntryNo := iEntryNo + 1;
        end
        else begin
            iEntryNo := 1;
        end;
        SMSMessages.Init;
        SMSMessages."Entry No" := iEntryNo;
        SMSMessages."Batch No" := documentNo;
        SMSMessages."Document No" := documentNo;
        SMSMessages."Account No" := accountno;
        SMSMessages."Date Entered" := Today;
        SMSMessages."Time Entered" := Time;
        SMSMessages.Source := 'SYSTEM';
        SMSMessages."Entered By" := UserId;
        SMSMessages."Sent To Server" := SMSMessages."sent to server"::No;
        SMSMessages."SMS Message" := message;
        SMSMessages."Telephone No" := phone;
        if SMSMessages."Telephone No" <> '' then
            SMSMessages.Insert;
    end;

    procedure FnInsertTransaction(documentNo: Code[30]; accountNo: Code[30]; accountName: Text[100]; Telephone: Code[20]; Amount: Decimal; AccBal: Decimal) Result: Code[20]
    begin

        PaybillTrans.Reset;
        PaybillTrans.SetRange(PaybillTrans."Mpesa ReceiptNO", documentNo);
        if PaybillTrans.Find('-') then begin
            PaybillTrans."Mpesa ReceiptNO" := documentNo;
            PaybillTrans."Account No" := accountNo;
            PaybillTrans."Account Name" := accountName;
            PaybillTrans."Transaction Date" := Today;
            PaybillTrans."Paybill Acc Balance" := AccBal;
            PaybillTrans."Transaction Time" := Time;
            PaybillTrans.Description := 'PayBill Deposit';
            PaybillTrans."Telephone Number" := Telephone;
            PaybillTrans.Amount := Amount;
            PaybillTrans.Posted := false;
            if PaybillTrans.Modify(true) then begin
                Result := 'TRUE';
            end else begin
                Result := 'FALSE';
            end;
        end else begin
            PaybillTrans.Init;
            PaybillTrans."Mpesa ReceiptNO" := documentNo;
            PaybillTrans."Account No" := accountNo;
            PaybillTrans."Account Name" := accountName;
            PaybillTrans."Transaction Date" := Today;
            PaybillTrans."Paybill Acc Balance" := AccBal;
            PaybillTrans."Transaction Time" := Time;
            PaybillTrans.Description := 'PayBill Deposit';
            PaybillTrans."Telephone Number" := Telephone;
            PaybillTrans.Amount := Amount;
            PaybillTrans.Posted := false;
            if PaybillTrans.Insert(true) then begin
                Result := 'TRUE';
            end else begin
                Result := 'FALSE';
            end;
        end;
    end;

    procedure FnGetAccountDetails2(accountNo: Code[30]) Result: Code[20]
    begin
        PaybillTrans.Reset;
        PaybillTrans.SetRange(PaybillTrans."Mpesa ReceiptNO", accountNo);
        if PaybillTrans.Find('-') then begin
            Result := 'TRUE';
        end
        else begin
            Result := 'TRUE';
        end;

    end;

    procedure FnGetToken(username: Text; password: Text) Result: Boolean
    begin
        PaybillTrans.Reset;
        PaybillTrans.SetRange(PaybillTrans."Mpesa ReceiptNO", username);
        if PaybillTrans.Find('-') then begin
            Result := true;
        end
        else begin
            Result := false;
        end;

    end;

    procedure FnSaveToken(username: Text; password: Text; token: Text; dateexpiry: DateTime) Result: Code[20]
    begin
        PaybillTrans.Reset;
        PaybillTrans.SetRange(PaybillTrans."Mpesa ReceiptNO", username);
        if PaybillTrans.Find('-') then begin
            Result := 'TRUE';
        end
        else begin
            Result := '';
        end;

    end;

    procedure FnValidToken(value: Text) Result: Code[20]
    begin
        PaybillTrans.Reset;
        PaybillTrans.SetRange(PaybillTrans."Mpesa ReceiptNO", value);
        if PaybillTrans.Find('-') then begin
            Result := 'TRUE';
        end
        else begin
            Result := '';
        end;

    end;

    procedure FnValidatePaymentInfo(accountNo: Code[30]) Result: Code[20]
    begin
        PaybillTrans.Reset;
        PaybillTrans.SetRange(PaybillTrans."Mpesa ReceiptNO", accountNo);
        if PaybillTrans.Find('-') then begin
            Result := 'TRUE';
        end
        else begin
            Result := '';
        end;

    end;

    procedure FnInsertMpesaTransaction(transrefno: Code[30]; accountNo: Code[30]; accountName: Text[100]; Telephone: Code[20]; Amount: Decimal; AccBal: Decimal; paybillno: Code[20]) Result: Code[20]
    begin
        MpesaTransactions.Init;
        MpesaTransactions.MPESA_TXN_ID := transrefno;
        MpesaTransactions.ACCOUNT_NUMBER := accountNo;
        MpesaTransactions.Name := accountName;
        MpesaTransactions.MPESA_TXN_DATE := CurrentDatetime;
        MpesaTransactions.Account_Balance := AccBal;
        MpesaTransactions.MPESA_TXN_TIME := CurrentDatetime;
        MpesaTransactions.MSISDN_CUSTOMER := Telephone;
        MpesaTransactions.MPESA_AMOUNT := Amount;
        MpesaTransactions."ID Number" := FnGetIDNumber(accountNo);
        MpesaTransactions.Fetch := false;
        if MpesaTransactions.Insert(true) then begin
            Result := 'TRUE';
        end else begin
            Result := 'FALSE';
        end;

    end;

    procedure FnGetAccountDetails(accountNo: Code[30]) Result: Code[20]
    var
        StudentProcessingHeader: Record "Student Processing Header";
    begin

        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange("No.", accountNo);
        if StudentProcessingHeader.FindSet() then begin
            Result := 'success*' + StudentProcessingHeader."No.";
        end
        else begin
            Result := '';
        end;

    end;

    procedure FnGetIDNumber(accountNo: Code[30]) Result: Code[20]
    var
        StudentProcessingHeader: Record "Student Processing Header";
    begin

        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", accountNo);
        if StudentProcessingHeader.Find('-') then begin
            Result := StudentProcessingHeader."ID Number/Passport No.";
        end
        else begin
            Result := '';
        end;

    end;
}

