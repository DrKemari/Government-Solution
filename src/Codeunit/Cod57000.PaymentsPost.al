#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 57000 "Payments-Post"
{

    trigger OnRun()
    begin
    end;

    var
        Batch: Record "Gen. Journal Batch";
        CMSetup: Record "Cash Management Setup";
        Text000: label 'There is a remaining amount of %1 are you sure you want to create a receipt for this amount?';
        Text001: label '&Post and Create &Receipt,&Post';
        Text002: label 'Are you sure you want to post Imprest No %1 ?';
        Text102: label 'Are you sure you want to Send Imprest No %1?';
        Text003: label 'The Imprest No %1  has not been fully approved';
        Text004: label 'The Imprest Lines are empty';
        Text005: label 'Amount cannot be zero';
        Text006: label 'Imprest %1 has been posted';
        Text007: label 'Are u sure u want to post Imprest Surrender No. %1 ?';
        Text008: label 'The Imprest Surrender No. %1 has not been fully approved';
        Text009: label 'The Imprest Surrender Lines are empty';
        Text010: label 'Imprest %1 has been surrendered';
        Text011: label 'Are you sure tou want to post Imprest Memo %1 ?';
        Text012: label 'The Imprest Memo amount is zero';
        Text013: label 'The Imprest Memo has already been posted';
        Tariffs: Record "Tariff Codes1";
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        NumberText: array[2] of Text[80];
        CurrencyCodeText: Code[10];
        Text014: label 'Are you sure you want to post petty cash surrender No %1 ?';
        Text015: label 'Petty Cash %1 has been surrendered';
        Text016: label 'Actual amount spent cannot be zero';
        Text017: label 'Are you sure you want to post receipt no. %1 ?';
        Text018: label 'The receipt is already posted';
        WText001: label 'Last Check No. must be filled in.';
        WText002: label 'Filters on %1 and %2 are not allowed.';
        WText003: label 'XXXXXXXXXXXXXXXX';
        WText004: label 'must be entered.';
        WText005: label 'The Bank Account and the General Journal Line must have the same currency.';
        WText006: label 'Salesperson';
        WText007: label 'Purchaser';
        WText008: label 'Both Bank Accounts must have the same currency.';
        WText009: label 'Our Contact';
        WText010: label 'XXXXXXXXXX';
        WText011: label 'XXXX';
        WText012: label 'XX.XXXXXXXXXX.XXXX';
        WText013: label '%1 already exists.';
        WText014: label 'Check for %1 %2';
        WText015: label 'Payment';
        WText016: label 'In the Check report, One Check per Vendor and Document No.\';
        WText017: label 'must not be activated when Applies-to ID is specified in the journal lines.';
        WText018: label 'XXX';
        WText019: label 'Total';
        WText020: label 'The total amount of check %1 is %2. The amount must be positive.';
        WText021: label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
        WText022: label 'NON-NEGOTIABLE';
        WText023: label 'Test print';
        WText024: label 'XXXX.XX';
        WText025: label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        WText026: label 'ZERO';
        WText027: label 'HUNDRED';
        WText028: label 'AND';
        WText029: label '%1 results in a written number that is too long.';
        WText030: label ' is already applied to %1 %2 for customer %3.';
        WText031: label ' is already applied to %1 %2 for vendor %3.';
        WText032: label 'ONE';
        WText033: label 'TWO';
        WText034: label 'THREE';
        WText035: label 'FOUR';
        WText036: label 'FIVE';
        WText037: label 'SIX';
        WText038: label 'SEVEN';
        WText039: label 'EIGHT';
        WText040: label 'NINE';
        WText041: label 'TEN';
        WText042: label 'ELEVEN';
        WText043: label 'TWELVE';
        WText044: label 'THIRTEEN';
        WText045: label 'FOURTEEN';
        WText046: label 'FIFTEEN';
        WText047: label 'SIXTEEN';
        WText048: label 'SEVENTEEN';
        WText049: label 'EIGHTEEN';
        WText050: label 'NINETEEN';
        WText051: label 'TWENTY';
        WText052: label 'THIRTY';
        WText053: label 'FORTY';
        WText054: label 'FIFTY';
        WText055: label 'SIXTY';
        WText056: label 'SEVENTY';
        WText057: label 'EIGHTY';
        WText058: label 'NINETY';
        WText059: label 'THOUSAND';
        WText060: label 'MILLION';
        WText061: label 'BILLION';
        Acct: Record "G/L Account";
        Imprest1: Record Payments;
        Text019: label 'Are you sure tou want to post Imprest Memo Surrender %1 ?';
        Text020: label 'The Imprest Memo has already been surrendered';
        Text021: label 'Are you sure you want to post Staff Claim %1?';
        text022: label 'Staff claim amount cannot be 0. Please confirm the amount and try again.';
        Text023: label 'Staff claim must be fully approved before posting';
        text024: label 'Are you sure you want to post staff claim No. %1?';
        text025: label 'Are you sure you want to post salary Advance No. %1?';
        Text026: label 'Salary Advance  must be fully approved before posting';
        text027: label 'Approved Salary Advance amount cannot be 0. Please confirm the amount and try again.';
        text028: label 'Are you sure you want to post Standing Imprest Surrender No. %1?';
        GenJnlLine: Record "Gen. Journal Line";
        DocPrint: Codeunit "Document-Print";
        BALedgerEntry: Record "Bank Account Ledger Entry";
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        NoSeries: Code[20];
        CashManagementSetup: Record "Cash Management Setup";
        EmployeeLedgerEntry: Record "Employee Ledger Entry";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        GenJournalLine: Record "Gen. Journal Line";
        SafariMembers1: Record "Project Members";
        EMp: Record Employee;
        Casual: Record Casuals;
        Window: Dialog;
        EmpName: Text;
        Warrant: Record Payments;
        ApplicationDocNumber: Code[20];
        Employee: Record Employee;


    procedure "Post Payment Voucher"(PV: Record Payments)
    var
        PVLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        PVLines1: Record "PV Lines";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        CarLoan: Record Payments;
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        InterestAmount: Decimal;
    begin
        if Dialog.Confirm('Are you sure you want to post the Payment Voucher No. ' + PV."No." + ' ?', true) then begin
            if PV.Status <> PV.Status::Released then
                Error('The Payment Voucher No %1 has not been fully approved', PV."No.");
            // IF PV.Posted THEN
            // ERROR('Payment Voucher %1 has been posted',PV."No.");
            PV.TestField(Date);
            PV.TestField("Paying Bank Account");
            PV.TestField(PV.Payee);
            PV.TestField(PV."Pay Mode");
            PV.TestField(PV."Posting Date");
            IF PV."Pay Mode" = 'CHEQUE' THEN BEGIN
                PV.TESTFIELD(PV."Cheque No");
                PV.TestField(PV."Cheque Date");

            END;

            PV.CalcFields(PV."Total Retention Amount");
            //Check Lines
            PV.CalcFields("Total Amount LCY");
            if PV."Total Amount LCY" = 0 then
                Error('Amount is cannot be zero');
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            if not PVLines.FindLast then
                Error('Payment voucher Lines cannot be empty');
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            GenJnLine.DeleteAll;
            PVLines.Reset;

            LineNo := LineNo + 10000;
            PV.CalcFields(PV."Total Amount LCY");
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            PVLines.Validate(PVLines.Amount);
            PVLines.CalcSums(PVLines.Amount);
            PVLines.CalcSums(PVLines."W/Tax Amount");
            PVLines.CalcSums(PVLines."VAT Amount");
            PVLines.CalcSums(PVLines."Retention  Amount");
            PVLines.CalcSums(PVLines."Net Amount");
            PVLines.CalcSums(PVLines."Amount Paid");
            if PVLines."Amount Paid" = PVLines."Net Amount" then
                Message('', PVLines."Amount Paid");
            //Insert Inerest Balancing Line for Car Loan
            if CarLoan.Get(PVLines."Car Loan Doc. No") then begin
                SalesReceivablesSetup.Get;
                InterestAmount := 0;
                InterestAmount := CarLoan."Interest Amount";
                GenJnLine.Init;
                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
                GenJnLine."Account No." := SalesReceivablesSetup."Car Loan Int. Due Acc.";
                GenJnLine.Validate(Amount, -1 * CarLoan."Interest Amount");
                GenJnLine.Validate("Posting Date", PV."Posting Date");
                GenJnLine."Document No." := PV."No.";
                GenJnLine.Description := 'Car Loan Interest ' + CarLoan."No.";
                GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::Employee;
                GenJnLine.Validate("Bal. Account No.", CarLoan."Account No.");
                GenJnLine."Shortcut Dimension 1 Code" := PV."Shortcut Dimension 1 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                GenJnLine."Shortcut Dimension 2 Code" := PV."Shortcut Dimension 2 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                GenJnLine.Validate(GenJnLine."Dimension Set ID");
                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;
            end;
            //PVLines.VALIDATE(PVLines.Amount);
            //PVLines.VALIDATE(PVLines."Retention  Amount");
            LineNo := LineNo + 10000;
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
            GenJnLine."Shortcut Dimension 1 Code" := PV."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PV."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

            GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //PVLines.VALIDATE(PVLines.Amount);
            //PVLines.VALIDATE(PVLines."Retention  Amount");
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            if PVLines.FindFirst then begin
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := PVLines."Account Type";
                GenJnLine.Validate("Account Type");
                GenJnLine."Account No." := PVLines."Account No";
                GenJnLine.Validate(GenJnLine."Account No.");
                if PV."Posting Date" = 0D then
                    Error('You must specify the PV date');
                GenJnLine."Posting Date" := PV."Posting Date";
                GenJnLine."Document No." := PV."No.";
                GenJnLine."External Document No." := PV."No.";
                GenJnLine."Payment Method Code" := PV."Pay Mode";
                //Ruth
                GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
                GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                if PV."Pay Mode" = 'CHEQUE' then
                    GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
                //GenJnLine.VALIDATE("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                GenJnLine.Validate("Bal. Account No.");
                //GenJnLine.Description:=PV."Payment Narration";
                GenJnLine.Description := Format((PV.Payee), 100);
                GenJnLine.Amount := PV."Total Net Amount" - InterestAmount;
                if PV."Pay Mode" = 'CHEQUE' then
                    //GenJnLine."Pay Mode":=PV."Pay Mode";
                    GenJnLine."Currency Code" := PV."Currency Code";
                GenJnLine.Validate("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                //add jobs if g/l account and income statement account
                if GenJnLine."Account Type" = GenJnLine."account type"::"G/L Account" then begin
                    if Acct.Get(GenJnLine."Account No.") then begin
                        if Acct."Income/Balance" = Acct."income/balance"::"Income Statement" then begin
                            GenJnLine."Job No." := PVLines.Project;
                            GenJnLine."Job Task No." := PVLines."Job Task No.";
                            GenJnLine."Job Quantity" := 1;

                            GenJnLine.Validate(GenJnLine."Job No.");
                            GenJnLine.Validate(GenJnLine."Job Task No.");
                            GenJnLine.Validate(GenJnLine."Job Quantity");
                        end;
                    end;
                end;
            end;
            //end jobs
            //PV Lines Entries
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            if PVLines.FindSet then begin
                repeat
                    /*PVLines.CALCSUMS(PVLines.Amount);
                    PVLines.CALCSUMS(PVLines."W/Tax Amount");
                    PVLines.CALCSUMS(PVLines."VAT Amount");
                    PVLines.CALCSUMS(PVLines."Retention  Amount");
                    PVLines.CALCSUMS(PVLines."Net Amount");
                    PVLines.CALCSUMS(PVLines."Amount Paid");*/
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //NOT ALL DOCUMENTS ARE INVOICES
                    if PVLines."Applies-to Doc. Type" = PVLines."applies-to doc. type"::Invoice then
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                    if PVLines."Account Type" <> PVLines."account type"::Employee then
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                    //Add Applies To Document Type
                    VendorLedgerEntry.Reset;
                    VendorLedgerEntry.SetRange("Document No.", PVLines."Applies to Doc. No");
                    if VendorLedgerEntry.FindFirst then begin
                        GenJnLine."Applies-to Doc. Type" := VendorLedgerEntry."Document Type";
                    end;
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    // VAT withheld

                    if PVLines."VAT Withheld Amount" > 0 then
                        Tariffs.Get(PVLines."VAT Withheld Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := Format((PV.Payee + '-WVAT'), 50);
                    GenJnLine.Amount := -PVLines."VAT Withheld Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then GenJnLine.Insert;

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'VAT WITHHELD:';
                    GenJnLine.Amount := PVLines."VAT Withheld Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then GenJnLine.Insert;


                    //Posting of Advance Recovery David & Spencer

                    if PV."Advance Recovery" <> 0 then
                        LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PV."Account Type";
                    GenJnLine."Account No." := PV."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV posting date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := Format((PV.Payee + '-AdA'), 50);
                    GenJnLine.Amount := -PV."Advance Recovery";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then GenJnLine.Insert;

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the Posting PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'Advance Recovery Amount:';
                    GenJnLine.Amount := PV."Advance Recovery";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //end of Posting of Advance Recovery David & Spencer




                    //Withholding Tax

                    if PVLines."W/Tax Amount" > 0 then begin
                        Tariffs.Get(PVLines."W/Tax Code");
                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := Format((PV.Payee + '-WTax'), 50);
                        //GenJnLine."Description 2":=PV."On behalf of";
                        GenJnLine.Amount := -PVLines."W/Tax Amount";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV."Currency Code";
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        if GenJnLine.Amount <> 0 then GenJnLine.Insert;


                        LineNo := LineNo + 10000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV."Posting Date" = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV."Posting Date";
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine."Payment Method Code" := PV."Pay Mode";
                        GenJnLine.Description := 'WITHHOLDING TAX:';
                        GenJnLine.Amount := PVLines."W/Tax Amount";
                        if PV."Pay Mode" = 'CHEQUE' then
                            //GenJnLine."Pay Mode":=PV."Pay Mode";
                            GenJnLine."Currency Code" := PV."Currency Code";
                        GenJnLine.Validate("Currency Code");
                        GenJnLine.Validate(GenJnLine.Amount);

                        GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                        GenJnLine.Validate(GenJnLine."Dimension Set ID");
                        if GenJnLine.Amount <> 0 then GenJnLine.Insert;

                    end;
                    //Retention

                    if PVLines."Retention  Amount" > 0 then
                        Tariffs.Get(PVLines."Retention Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."No.";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := Format((PV.Payee + '-ResoucePAYE'), 50);
                    GenJnLine.Amount := -PVLines."Retention  Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."No.";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'AMOUNT RETAINED:';
                    GenJnLine.Amount := PVLines."Retention  Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;


                until PVLines.Next = 0;
                //loop to print check
                Commit();
                GenJnLine.Reset;
                GenJnLine.SetRange("Journal Template Name", CMSetup."PV Journal Template");
                GenJnLine.SetRange("Journal Batch Name", CMSetup."PV Journal Batch Name");
                GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
                GenJnLine.SetRange("Check Printed", false);
                if GenJnLine.FindSet then begin
                    repeat
                        CMSetup.Get;
                        PrintCheck(GenJnLine, CMSetup."PV Journal Template", CMSetup."PV Journal Batch Name");
                        PVLines1.SetRange(No, PVLines.No);
                        if PVLines1.FindSet then begin
                            PVLines1."Check No" := GenJnLine."Document No.";
                            PVLines1."Check Printed" := true;
                            PVLines1.Modify();
                        end;
                    until GenJnLine.Next = 0;
                end;
            end;
            //update applies to for positive values
            //Machira 08/06/2021
            // GenJnLine.RESET;
            // GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."PV Journal Template");
            // GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",CMSetup."PV Journal Batch Name");
            // GenJnLine.SETFILTER("Document No.",PV."No.");
            // GenJnLine.SETFILTER(Amount,'>%1',0);
            // IF GenJnLine.FINDSET THEN BEGIN
            // REPEAT
            // PVLines.RESET;
            // PVLines.SETRANGE(No,PV."No.");
            // IF PVLines.FINDFIRST THEN  BEGIN
            //    IF PVLines."Applies-to Doc. Type"=PVLines."Applies-to Doc. Type"::Invoice THEN
            //      GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
            //    IF PVLines."Account Type"<>PVLines."Account Type"::Employee THEN
            //      GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
            //    //Add Applies To Document Type
            //    VendorLedgerEntry.RESET;
            //    VendorLedgerEntry.SETRANGE("Document No.",PVLines."Applies to Doc. No");
            //    IF VendorLedgerEntry.FINDFIRST THEN BEGIN
            //      GenJnLine."Applies-to Doc. Type":=VendorLedgerEntry."Document Type";
            //    END;
            //    GenJnLine.MODIFY(TRUE);
            // END;
            // UNTIL GenJnLine.NEXT=0;
            // END;
            //today
            if CMSetup.Get then
                GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            if GenJnlLine.FindSet then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            end;


            //IF (PV."Pay Mode"='CHEQUE') THEN BEGIN
            VendorLedgerEntry.Reset;
            VendorLedgerEntry.SetRange("External Document No.", PV."No.");
            VendorLedgerEntry.SetRange(Reversed, false);
            if VendorLedgerEntry.FindFirst then begin
                PV."Cheque No" := VendorLedgerEntry."Document No.";
                PV.Posted := true;
                PV."Posted By" := UserId;
                PV."Posted Date" := Today;
                PV."Time Posted" := Time;
                PV.Modify;
                PVLines."No. Posted" := PVLines."No. Posted" + 1;
            end;
            //END ELSE

            //check entries on the ledger
            BALedgerEntry.Reset;
            BALedgerEntry.SetRange("External Document No.", PV."No.");
            BALedgerEntry.SetRange(Reversed, false);
            if BALedgerEntry.FindFirst then begin
                PV.Posted := true;
                PV."Posted By" := UserId;
                PV."Posted Date" := Today;
                PV."Time Posted" := Time;
                PV.Modify;
                PVLines."No. Posted" := PVLines."No. Posted" + 1;
            end

        end;
        OnAfterPostPymentVoucher(PV);

    end;


    procedure "Post Imprest"(var Imprest: Record Payments)
    var
        ImprestLines: Record Payments;
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImpLine: Record "Imprest Lines";
    begin

        if Confirm(Text002, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");

            CMSetup.Get;

            Imprest.TestField("Account No.");
            Imprest.TestField("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Pay Mode");
            Imprest.TestField("Shortcut Dimension 1 Code");
            Imprest.TestField("Shortcut Dimension 2 Code");
            //Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            Imprest.TestField("Posting Date");


            if Imprest."Pay Mode" = 'CHEQUE' then begin
                Imprest.TestField("Cheque No");
                Imprest.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.SetRange(ImprestLines."No.", Imprest."No.");
            if not ImprestLines.FindLast then
                Error(Text004);

            Imprest.CalcFields("Imprest Amount");
            if Imprest."Imprest Amount" = 0 then
                Error(Text005);

            if Imprest.Posted then
                Error(Text006, Imprest."No.");

            CMSetup.Get();
            CMSetup.TestField("Imprest Due Date");
            CMSetup.TestField("IMPREST Journal Batch Name");
            CMSetup.TestField("Imprest Journal Template");

            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."IMPREST Journal Batch Name");
            GenJnLine.DeleteAll;

            /*
              // Delete Lines Present on the General Journal Line
              GenJnLine.RESET;
              GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."Imprest Template");
              GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",Imprest."No.");
              GenJnLine.DELETEALL;
            d
              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Imprest Template";
              Batch.Name:=Imprest."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
              */
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."IMPREST Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := Imprest."Paying Bank Account";
            GenJnLine."Posting Date" := Imprest."Posting Date";
            GenJnLine."Document No." := Imprest."No.";
            GenJnLine."External Document No." := Imprest."Cheque No";
            GenJnLine.Description := Format('Imprest issued to ' + Imprest.Payee, 50);
            // GenJnLine."Currency Code":=Imprest.Currency;
            // GenJnLine.VALIDATE("Currency Code");
            GenJnLine.Amount := -Imprest."Imprest Amount";
            GenJnLine."Posting Group" := CMSetup."Imprest Posting Group";
            GenJnLine.Validate(Amount);

            GenJnLine."Shortcut Dimension 1 Code" := Imprest."Shortcut Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Imprest."Shortcut Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");
            //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::Employee;
            GenJnLine."Bal. Account No." := Imprest."Account No.";
            GenJnLine.Validate("Bal. Account No.");

            GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", Imprest."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            //GLEntry.SETRANGE("Posting Date",Imprest."Posting Date");
            if GLEntry.FindFirst then begin

                Imprest.Posted := true;
                Imprest."Posted By" := UserId;
                Imprest."Posted Date" := Today;
                Imprest."Time Posted" := Time;
                /// Imprest.Status:=Imprest.Status::Open;
                //Imprest."Payment Type":=Imprest."Payment Type"::"Imprest Surrender";
                //Update the Imprest Deadline
                //Imprest."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",TODAY);
                Imprest.Modify;
            end;
            //pending

        end;

        /*
         IF Imprest1.GET(ImprestLines."No.") THEN BEGIN
         Imprest1."Payment Type":=Imprest1."Payment Type"::"Imprest Surrender";
         Imprest1."Document Type":=Imprest1."Document Type"::"Imprest Surrender";
         Imprest1.Status:=Imprest1.Status::Open;
         Imprest1."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",GenJnLine."Posting Date");
         Imprest1.MODIFY;
         END;
         */

    end;


    procedure "Post ImprestSurrenderBCK"(var ImprestSurrender: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        LineNo: Integer;
        GenJnLine: Record "Gen. Journal Line";
        Committment: Codeunit Committment;
        GLEntry: Record "G/L Entry";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLSetup: Record "General Ledger Setup";
        Window: Dialog;
        Selection: Integer;
    begin

        if Confirm(Text007, false, ImprestSurrender."No.") = true then begin

            ImprestSurrender.TestField("Surrender Date");
            //Check if amount surrendered is less than amount advanced
            ImprestSurrender.CalcFields("Remaining Amount");
            if ImprestSurrender."Remaining Amount" > 0 then
                Selection := StrMenu(Text001, 1);
            if ImprestSurrender.Status <> ImprestSurrender.Status::Released then
                Error(Text008, ImprestSurrender."No.");

            ImprestSurrender.TestField("Account No.");
            ImprestSurrender.TestField("Paying Bank Account");
            ImprestSurrender.TestField(Date);
            ImprestSurrender.TestField(Payee);
            ImprestSurrender.TestField("Pay Mode");
            if ImprestSurrender."Pay Mode" = 'CHEQUE' then begin
                ImprestSurrender.TestField("Cheque No");
                ImprestSurrender.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            if not ImprestLines.FindLast then
                Error(Text009);

            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            ImprestLines.CalcSums("Actual Spent");
            /*IF ImprestLines."Actual Spent"=0 THEN
             ERROR('Actual Spent Amount cannot be zero');*/

            if ImprestSurrender.Surrendered then
                Error(Text010, ImprestSurrender."No.");
            //MESSAGE('Tuko hapa!');
            GLSetup.Get;

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Surrender Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", ImprestSurrender."No.");
            GenJnLine.DeleteAll;

            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Imprest Surrender Template";
            Batch.Name := ImprestSurrender."No.";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            //Staff entries
            LineNo := 10000;
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            ImprestLines.CalcSums("Actual Spent");
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
            GenJnLine."Journal Batch Name" := ImprestSurrender."No.";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Customer;
            GenJnLine."Account No." := ImprestSurrender."Account No.";
            GenJnLine."Posting Date" := ImprestSurrender."Surrender Date";
            GenJnLine."Document No." := ImprestSurrender."No.";
            GenJnLine."External Document No." := ImprestSurrender."Cheque No";
            GenJnLine.Description := ImprestSurrender.Payee;
            GenJnLine.Amount := -ImprestLines."Actual Spent";
            //GenJnLine.VALIDATE(Amount);
            GenJnLine."Applies-to Doc. No." := ImprestSurrender."No.";
            GenJnLine.Validate("Applies-to Doc. No.");
            GenJnLine."Shortcut Dimension 1 Code" := ImprestSurrender."Shortcut Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ImprestSurrender."Shortcut Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            //Create Receipt IF Chosen
            if Selection = 1 then begin
                //Insert Header
                ImprestSurrender.CalcFields("Remaining Amount");
                if ImprestSurrender."Remaining Amount" > 0 then begin
                    if ImprestSurrender."Receipt Created" = false then begin
                        /*
                        ReceiptHeader.INIT;
                        ReceiptHeader."No.":=NoSeriesMgt.GetNextNo(GLSetup."Receipt Nos",TODAY,TRUE);
                        ReceiptHeader.Date:=ImprestSurrender."Imprest Surrender Date";
                        ReceiptHeader."Received From":=ImprestSurrender.Payee;
                        ReceiptHeader."On Behalf Of":=ImprestSurrender."On behalf of";
                        ReceiptHeader."Global Dimension 1 Code":=ImprestSurrender."Global Dimension 1 Code";
                        ReceiptHeader."Global Dimension 2 Code":=ImprestSurrender."Global Dimension 2 Code";
                        IF NOT ReceiptHeader.GET(ReceiptHeader."No.") THEN
                        ReceiptHeader.INSERT;
                        */
                    end;
                end;
            end;

            //Expenses
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
                    GenJnLine."Journal Batch Name" := ImprestSurrender."No.";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := ImprestLines."Account Type";
                    if GenJnLine."Account Type" = ImprestLines."account type"::"Fixed Asset" then
                        GenJnLine."FA Posting Type" := GenJnLine."fa posting type"::"Acquisition Cost";
                    GenJnLine."Account No." := ImprestLines."Account No.";
                    GenJnLine.Validate("Account No.");
                    GenJnLine."Posting Date" := ImprestSurrender."Surrender Date";
                    GenJnLine."Document No." := ImprestSurrender."No.";
                    GenJnLine.Description := ImprestLines.Description;
                    GenJnLine.Amount := ImprestLines."Actual Spent";
                    GenJnLine.Validate(Amount);
                    //Set these fields to blanks
                    GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                    GenJnLine.Validate("Gen. Posting Type");
                    GenJnLine."Gen. Bus. Posting Group" := '';
                    GenJnLine.Validate("Gen. Bus. Posting Group");
                    GenJnLine."Gen. Prod. Posting Group" := '';
                    GenJnLine.Validate("Gen. Prod. Posting Group");
                    GenJnLine."VAT Bus. Posting Group" := '';
                    GenJnLine.Validate("VAT Bus. Posting Group");
                    GenJnLine."VAT Prod. Posting Group" := '';
                    GenJnLine.Validate("VAT Prod. Posting Group");
                    //
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                    GenJnLine.Validate("Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestLines."Global Dimension 2 Code";
                    GenJnLine.Validate("Shortcut Dimension 2 Code");
                    //Ushindi...Insert Job Nos
                    GenJnLine."Job No." := ImprestLines."Job No.";
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine."Job Task No." := ImprestLines."Job Task No.";
                    //MESSAGE('Tuko hapa!');
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine."Job Quantity" := ImprestLines."Job Quantity";
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //End Of Ushindi changes
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //Insert Receipt Lines
                    if Selection = 1 then begin
                        if ImprestLines."Remaining Amount" > 0 then begin
                            if ImprestSurrender."Receipt Created" = false then begin
                                /*
                                ReceiptLine.INIT;
                                ReceiptLine."Line No":=LineNo;
                                ReceiptLine."Receipt No.":=ReceiptHeader."No.";
                                ReceiptLine."Account Type":=ImprestSurrender."Account Type";
                                ReceiptLine."Account No.":=ImprestSurrender."Account No.";
                                ReceiptLine."Account Name":=ImprestSurrender."Account Name";
                                ReceiptLine.Description:=ImprestLines.Description;
                                ReceiptLine.Amount:=ImprestLines."Remaining Amount";
                                ReceiptLine."Global Dimension 1 Code":=ImprestLines."Global Dimension 1 Code";
                                ReceiptLine."Global Dimension 2 Code":=ImprestLines."Global Dimension 2 Code";
                                IF NOT ReceiptLine.GET(ReceiptLine."Line No",ReceiptLine."Receipt No.") THEN
                                 ReceiptLine.INSERT;
                                */
                            end;
                        end;
                    end;
                until ImprestLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /* GLEntry.RESET;
             GLEntry.SETRANGE(GLEntry."Document No.",ImprestSurrender."No.");
             GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
             GLEntry.SETRANGE("Posting Date",ImprestSurrender."Surrender Date");
             IF GLEntry.FINDFIRST THEN BEGIN*/
            ImprestSurrender.Surrendered := true;
            if Selection = 1 then
                ImprestSurrender."Receipt Created" := true;
            ImprestSurrender.Modify;
            //Uncommit Entries made to the varoius expenses accounts
            Committment.UncommitImprest(ImprestSurrender);
            //END;
        end;

    end;


    procedure PostImprestMemo(var ImprestMemo: Record "Imprest Memo")
    var
        JobPlanningLines: Record "Job Planning Line";
        LineNo: Integer;
        ProjectMembers: Record "Project Members";
        WorkType: Record "Work Type";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
    begin
        if not Confirm(Text011, false, ImprestMemo."No.") then
            exit;

        with ImprestMemo do begin
            //Check if Posted
            if Posted then
                Error(Text013);

            //
            //Check totals
            ImprestMemo.CalcFields("Total Subsistence Allowance");
            //  IF ImprestMemo."Total Subsistence Allowance"=0 THEN
            //    ERROR(Text012);
            // {
            //  //Post Entries into the Job Task Lines
            //   JobPlanningLines.RESET;
            //   JobPlanningLines.SETRANGE("Job No.",Project);
            //   JobPlanningLines.SETRANGE("Job Task No.","Project Task");
            //    IF JobPlanningLines.FINDLAST THEN
            //     LineNo:=JobPlanningLines."Line No."+1
            //    ELSE
            //     LineNo:=1000;
            // }
            //Loop through Project Members
            ProjectMembers.Reset;
            ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
            ProjectMembers.SetRange(Posted, false);
            if ProjectMembers.Find('-') then
                repeat
                    /*
                     LineNo:=LineNo+1000;
                     JobPlanningLines.INIT;
                     JobPlanningLines."Job No.":=ImprestMemo.Project;
                     JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                     JobPlanningLines."Line No.":=LineNo;
                     JobPlanningLines.Type:=JobPlanningLines.Type::Resource;
                     JobPlanningLines."No.":=ProjectMembers."No.";
                     JobPlanningLines.VALIDATE("No.");
                     JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                     JobPlanningLines."Planning Date":=Date;
                     JobPlanningLines."Planned Delivery Date":=CALCDATE(FORMAT(ProjectMembers.Delivery)+'D',Date);
                     JobPlanningLines.Description:=ProjectMembers."Tasks to Carry Out";
                     JobPlanningLines."Work Type Code":=ProjectMembers."Work Type";
                     JobPlanningLines.VALIDATE("Work Type Code");
                     JobPlanningLines.Quantity:=ProjectMembers."Time Period";
                     IF ProjectMembers.Entitlement<>0 THEN //Cases of Personell
                     BEGIN
                       IF ProjectMembers."Time Period"<>0 THEN BEGIN
                       JobPlanningLines."Unit Cost":=ProjectMembers.Entitlement/ProjectMembers."Time Period";
                       JobPlanningLines."Unit Cost (LCY)":=ProjectMembers.Entitlement/ProjectMembers."Time Period";
                       END
                       ELSE BEGIN
                         IF WorkType.GET(ProjectMembers."Work Type") THEN;
                       JobPlanningLines."Unit Cost":=WorkType.Rate;
                       JobPlanningLines."Unit Cost (LCY)":=WorkType.Rate;
                       END;
                       JobPlanningLines."Line Amount":=ProjectMembers.Entitlement;
                       JobPlanningLines."Line Amount (LCY)":=ProjectMembers.Entitlement;
                    END ELSE
                    BEGIN//Cases of Machinery
                       IF ProjectMembers."Time Period"<>0 THEN BEGIN
                       JobPlanningLines."Unit Cost":=ProjectMembers."Expected Maintenance Cost"/ProjectMembers."Time Period";
                       JobPlanningLines."Unit Cost (LCY)":=ProjectMembers."Expected Maintenance Cost"/ProjectMembers."Time Period";
                       END
                       ELSE BEGIN
                         IF WorkType.GET(ProjectMembers."Work Type") THEN;
                       JobPlanningLines."Unit Cost":=WorkType.Rate;
                       JobPlanningLines."Unit Cost (LCY)":=WorkType.Rate;
                       END;
                       JobPlanningLines."Line Amount":=ProjectMembers."Expected Maintenance Cost";
                        JobPlanningLines."Line Amount (LCY)":=ProjectMembers."Expected Maintenance Cost";
                    END;
                    IF JobPlanningLines."Line Amount"<>0 THEN
                      BEGIN
                       JobPlanningLines.INSERT(TRUE);
                       */
                    ProjectMembers.Posted := true;
                    ProjectMembers.Modify;
                //END;
                until ProjectMembers.Next = 0;
            //

            //Loop Through the casuals
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", "No.");
            Casuals.SetRange(Posted, false);
            if Casuals.Find('-') then
                repeat
                    Casuals.TestField("Resource No.");
                    /*
                    LineNo:=LineNo+1000;
                    JobPlanningLines.INIT;
                    JobPlanningLines."Job No.":=ImprestMemo.Project;
                    JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                    JobPlanningLines."Line No.":=LineNo;
                    JobPlanningLines.Type:=JobPlanningLines.Type::Resource;
                    JobPlanningLines."No.":=Casuals."Resource No.";
                    JobPlanningLines.VALIDATE("No.");
                    JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                    JobPlanningLines."Planning Date":=Date;
                    JobPlanningLines."Planned Delivery Date":=CALCDATE(FORMAT(Casuals."No. of Days")+'D',Date);
                    JobPlanningLines.Description:=Casuals.Activity;
                    JobPlanningLines."Work Type Code":=Casuals."Work Type";
                    JobPlanningLines.VALIDATE("Work Type Code");
                    JobPlanningLines.Quantity:=Casuals."No. of Days"*Casuals."No. Required";
                    JobPlanningLines."Unit Cost":=Casuals.Rate;
                    JobPlanningLines."Unit Cost (LCY)":=Casuals.Rate;
                    JobPlanningLines."Line Amount":=Casuals.Amount;
                    JobPlanningLines."Line Amount (LCY)":=Casuals.Amount;
                    IF JobPlanningLines."Line Amount"<>0 THEN
                     BEGIN
                      JobPlanningLines.INSERT(TRUE);
                      */
                    Casuals.Posted := true;
                    Casuals.Modify;

                //END;
                until Casuals.Next = 0;
            //

            //Loop Through the Miscelleneous Costs

            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", "No.");
            OtherCosts.SetRange(Posted, false);
            if OtherCosts.Find('-') then
                repeat
                    OtherCosts.TestField("No.");
                    /*
                    LineNo:=LineNo+1000;
                    JobPlanningLines.INIT;
                    JobPlanningLines."Job No.":=ImprestMemo.Project;
                    JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                    JobPlanningLines."Line No.":=LineNo;
                    JobPlanningLines.Type:=JobPlanningLines.Type::"G/L Account";
                    JobPlanningLines."No.":=OtherCosts."No.";
                    JobPlanningLines.VALIDATE("No.");
                    JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                    JobPlanningLines."Planning Date":=Date;
                    JobPlanningLines."Planned Delivery Date":=Date;
                    JobPlanningLines.Description:=OtherCosts.Description;
                    JobPlanningLines."Work Type Code":=OtherCosts."Work Type";
                    //JobPlanningLines.VALIDATE("Work Type Code");
                    JobPlanningLines.Quantity:=OtherCosts."Quantity Required";
                    JobPlanningLines."Unit Cost":=OtherCosts."Unit Cost";
                    JobPlanningLines."Unit Cost (LCY)":=OtherCosts."Unit Cost";
                    JobPlanningLines."Line Amount":=OtherCosts."Line Amount";
                    JobPlanningLines."Line Amount (LCY)":=OtherCosts."Line Amount";
                    IF JobPlanningLines."Line Amount"<>0 THEN
                     BEGIN
                      JobPlanningLines.INSERT(TRUE);
                      */
                    OtherCosts.Posted := true;
                    OtherCosts.Modify;
                //END;
                until OtherCosts.Next = 0;
            //

            Posted := true;
            "Posted By" := UserId;
            Modify;
            //

            //
        end;

    end;


    procedure PostPettyCash(PCASH: Record Payments)
    var
        PCASHLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        PCLines: Record "Petty Cash Lines";
    begin
        if Confirm('Are you sure you want to post the Special Imprest Voucher No. ' + PCASH."No." + ' ?') = true then begin
            // if PCASH.Status <> PCASH.Status::Released then
            //     Error('The Petty Cash Voucher No %1 has not been fully approved', PCASH."No.");
            if PCASH.Posted then
                Error('Petty Cash Voucher %1 has been posted', PCASH."No.");
            PCASH.TestField(Date);
            PCASH.TestField("Paying Bank Account");
            PCASH.TestField(PCASH.Payee);
            PCASH.TestField(PCASH."Pay Mode");
            PCASH.TestField(PCASH."Posting Date");
            if PCASH."Pay Mode" = 'CHEQUE' then begin
                PCASH.TestField(PCASH."Cheque No");
                PCASH.TestField(PCASH."Cheque Date");
            end;

            //Check Lines
            PCASH.CalcFields("Total Amount LCY");
            if PCASH."Total Amount LCY" = 0 then
                Error('Amount is cannot be zero');
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if not PCASHLines.FindLast then
                Error('Petty Cash voucher Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PCASH Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PCASH Journal Batch Name");
            GenJnLine.DeleteAll;


            //Bank Entries
            LineNo := LineNo + 10000;
            PCASH.CalcFields(PCASH."Total Amount LCY");
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            PCASHLines.Validate(PCASHLines.Amount);

            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PCASH Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            if PCASH.Date = 0D then
                Error('You must specify the PCASH date');
            GenJnLine."Posting Date" := PCASH."Posting Date";
            GenJnLine."Document No." := PCASH."No.";
            GenJnLine."External Document No." := PCASH."Cheque No";
            GenJnLine."Payment Method Code" := PCASH."Pay Mode";
            GenJnLine.Description := 'Pay To:' + PCASH.Payee;
            GenJnLine."Account Type" := PCASH."Account Type";
            GenJnLine."Account No." := PCASH."Account No.";
            GenJnLine.Validate("Account No.");
            GenJnLine.Amount := PCASH."Total Amount LCY";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Bal. Account No." := PCASH."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Bal. Account No.");


            if PCASH."Pay Mode" = 'CHEQUE' then
                GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
            GenJnLine."Shortcut Dimension 1 Code" := PCASH."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PCASH."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

            GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            Commit();
            CMSetup.Get;
            GenJnLine.Reset;
            GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
            GenJnLine.SetRange("Check Printed", false);
            if GenJnLine.FindSet then begin
                PrintCheck(GenJnLine, CMSetup."PCASH Journal Template", CMSetup."PCASH Journal Batch Name");
            end;

            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PCASH Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PCASH Journal Batch Name");
            if GenJnlLine.FindSet then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            end;

            BankAccountLedgerEntry.Reset;
            BankAccountLedgerEntry.SetRange("Document No.", PCASH."No.");
            if BankAccountLedgerEntry.FindFirst then begin
                PCASH.Posted := true;
                PCASH."Posted By" := UserId;
                PCASH."Posted Date" := Today;
                PCASH."Time Posted" := Time;
                PCASH.Status := PCASH.Status::Released;
                PCASH."Payment Type" := PCASH."Payment Type"::"Petty Cash Surrender";
                PCASH.Modify;

                //generate Petty cash Surrender Document
                //CreateSpecialImprestSurrender(PCASH);
                ;
            end;
            //Update Petty Cash Lines
            UpdatePCLines(PCASH);


        end;
    end;


    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '****';

        if No < 1 then
            AddToNoText(NoText, NoTextIndex, PrintExponent, WText026)
        else begin
            for Exponent := 4 downto 1 do begin
                PrintExponent := false;
                Ones := No DIV Power(1000, Exponent - 1);
                Hundreds := Ones DIV 100;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, WText027);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent and (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;
        end;

        AddToNoText(NoText, NoTextIndex, PrintExponent, WText028);
        AddToNoText(NoText, NoTextIndex, PrintExponent, Format(No * 100) + '/100');

        if CurrencyCode <> '' then
            AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyCode);
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
            NoTextIndex := NoTextIndex + 1;
            if NoTextIndex > ArrayLen(NoText) then
                Error(WText029, AddText);
        end;

        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;


    procedure InitTextVariable()
    begin
        OnesText[1] := WText032;
        OnesText[2] := WText033;
        OnesText[3] := WText034;
        OnesText[4] := WText035;
        OnesText[5] := WText036;
        OnesText[6] := WText037;
        OnesText[7] := WText038;
        OnesText[8] := WText039;
        OnesText[9] := WText040;
        OnesText[10] := WText041;
        OnesText[11] := WText042;
        OnesText[12] := WText043;
        OnesText[13] := WText044;
        OnesText[14] := WText045;
        OnesText[15] := WText046;
        OnesText[16] := WText047;
        OnesText[17] := WText048;
        OnesText[18] := WText049;
        OnesText[19] := WText050;

        TensText[1] := '';
        TensText[2] := WText051;
        TensText[3] := WText052;
        TensText[4] := WText053;
        TensText[5] := WText054;
        TensText[6] := WText055;
        TensText[7] := WText056;
        TensText[8] := WText057;
        TensText[9] := WText058;

        ExponentText[1] := '';
        ExponentText[2] := WText059;
        ExponentText[3] := WText060;
        ExponentText[4] := WText061;
    end;


    procedure "Post ImprestSurrender"(var Imprest: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImprestHeader: Record Payments;
    begin

        if Confirm(Text002, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");


            Imprest.TestField("Account No.");
            //Imprest.TESTFIELD("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Shortcut Dimension 1 Code");
            Imprest.TestField("Shortcut Dimension 2 Code");
            // Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            Imprest.TestField("Posting Date");

            /*
              //Check if the imprest Lines have been populated
              ImprestLines.SETRANGE(ImprestLines."No.",Imprest."No.");
              IF NOT ImprestLines.FINDLAST  THEN
               ERROR(Text004);

            */


            Imprest.CalcFields("Imprest Amount", "Actual Amount Spent", "Actual Amount Spent LCY", "Imprest Amount LCY");
            //post if surrender was for all amount
            if Imprest."Cash Receipt Amount" = Imprest."Imprest Amount" then begin
                Imprest.Posted := true;
                Imprest."Posted By" := UserId;
                Imprest."Posted Date" := Today;
                Imprest."Time Posted" := Time;
                if ImprestHeader.Get(Imprest."Imprest Issue Doc. No") then begin
                    ImprestHeader.Surrendered := true;
                    ImprestHeader.Modify(true);
                end;
                exit;
            end;

            if Imprest."Imprest Amount" = 0 then
                Error(Text005);
            if Imprest."Actual Amount Spent" = 0 then
                Error(Text005);
            /*IF Imprest."Imprest Amount"=0 THEN
            ERROR(Text005);*/
            if Imprest."Actual Amount Spent LCY" = 0 then
                Error(Text005);

            if Imprest.Posted then
                Error(Text006, Imprest."No.");


            CMSetup.Get();
            CMSetup.TestField("Imprest Due Date");
            CMSetup.TestField(CMSetup."IMPREST SUR Journal Batch Name");
            CMSetup.TestField(CMSetup."Imprest Surrender Template");

            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Surrender Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."IMPREST SUR Journal Batch Name");
            GenJnLine.DeleteAll;

            //get the Application Warrant DOcument no for application on employee ledgers\
            Warrant.Reset;
            Warrant.SetRange("No.", Imprest."Reference No.");
            if Warrant.FindSet then begin
                ApplicationDocNumber := Warrant."Cheque No";

            end;

            /*
              // Delete Lines Present on the General Journal Line
              GenJnLine.RESET;
              GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."Imprest Template");
              GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",Imprest."No.");
              GenJnLine.DELETEALL;

              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Imprest Template";
              Batch.Name:=Imprest."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
              */
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
            GenJnLine."Journal Batch Name" := CMSetup."IMPREST SUR Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := Imprest."Account Type";
            GenJnLine."Account No." := Imprest."Account No.";
            GenJnLine.Validate("Account No.");
            GenJnLine."Posting Date" := Imprest."Posting Date";
            GenJnLine."Document No." := Imprest."No.";
            GenJnLine."External Document No." := Imprest."Imprest Issue Doc. No";
            GenJnLine.Description := Format('Surrendered by: ' + Imprest.Payee, 100);
            // GenJnLine.Amount:=-Imprest."Actual Amount Spent LCY";
            GenJnLine."Currency Code" := Imprest."Currency Code";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Amount := -Imprest."Actual Amount Spent";
            GenJnLine.Validate(Amount);

            /*
            GenJnLine."Shortcut Dimension 1 Code":=Imprest."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=Imprest."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 2 Code");

          *///
            //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

            //GenJnLine."Bal. Account Type":=GenJnLine."Bal. Account Type"::Customer;
            //// GenJnLine."Bal. Account No.":=Imprest."Account No.";
            // GenJnLine.VALIDATE("Bal. Account No.");

            GenJnLine."Applies-to Doc. No." := ApplicationDocNumber;
            GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");

            GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //IMP surrender Lines Entries
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, Imprest."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    //ImprestLines.TESTFIELD(ImprestLines."Job Task No.");
                    ImprestLines.Validate(ImprestLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    //IF CMSetup.GET THEN
                    GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
                    GenJnLine."Journal Batch Name" := CMSetup."IMPREST SUR Journal Batch Name";
                    //GenJnLine."Journal Template Name":=CMSetup."PCASH Journal Template";
                    //GenJnLine."Journal Batch Name":=CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := ImprestLines."Account Type";
                    GenJnLine."Account No." := ImprestLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Imprest."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := Imprest."Posting Date";
                    GenJnLine."Document No." := Imprest."No.";
                    GenJnLine."External Document No." := Imprest."Reference No.";
                    GenJnLine.Description := Format(ImprestLines.Purpose, 100);
                    //GenJnLine.Amount:=ImprestLines."Actual Spent LCY";
                    GenJnLine.Amount := ImprestLines."Actual Spent";
                    //IF PCASH."Pay Mode"='CHEQUE' THEN
                    //GenJnLine."Pay Mode":=PCASH."Pay Mode";
                    GenJnLine."Currency Code" := Imprest."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);


                    //add jobs
                    /*GenJnLine."Job No.":=Imprest.Project;
                    GenJnLine."Job Task No.":=ImprestLines."Job Task No.";
                    GenJnLine."Job Quantity":=1;
                    GenJnLine.VALIDATE(GenJnLine."Job No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Quantity");*/ //Commented by Morris
                                                                    //end jobs

                    //add jobs Morris
                    GenJnLine."Job No." := Imprest.Job;
                    GenJnLine."Job Task No." := Imprest."Job Task No";
                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity"); //Added by Morris
                                                                  //end jobs
                                                                  //GenJnLine."Shortcut Dimension 1 Code":=PCASHLines."Shortcut Dimension 1 Code";
                                                                  //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                                                                  //GenJnLine."Shortcut Dimension 2 Code":=PCASHLines."Shortcut Dimension 2 Code";
                                                                  //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PCASHLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until ImprestLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /*GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",Imprest."No.");
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            GLEntry.SETRANGE("Posting Date",Imprest."Posting Date");
            IF GLEntry.FINDFIRST THEN BEGIN*/
            Imprest.Posted := true;
            Imprest."Posted By" := UserId;
            Imprest."Posted Date" := Today;
            Imprest."Time Posted" := Time;
            /// Imprest.Status:=Imprest.Status::Open;
            //Imprest."Payment Type":=Imprest."Payment Type"::"Imprest Surrender";
            //Update the Imprest Deadline
            //Imprest."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",TODAY);
            //tImprest.MODIFY;

            if ImprestHeader.Get(Imprest."Imprest Issue Doc. No") then begin
                ImprestHeader.Surrendered := true;
                //ImprestHeader.MODIFY;
            end;

            // END;

        end;

    end;


    procedure PostBankTransfer(PCASH: Record Payments)
    var
        PCASHLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetups: Record "Cash Management Setup";
        DocPrint: Codeunit "Document-Print";
        PettyCashEntries: Record "Petty Cash Entries";
        PettyCash: Record Payments;
    begin
        if Confirm('Are u sure u want to post this InterBank Transfer' + PCASH."No." + ' ?') = true then begin
            if PCASH.Status <> PCASH.Status::Released then
                Error('The InterBank Transfer No %1 has not been fully approved', PCASH."No.");
            if PCASH.Posted then
                Error('InterBank Transfer %1 has been posted', PCASH."No.");
            PCASH.TestField(Date);
            PCASH.TestField("Paying Bank Account");
            //PCASH.TESTFIELD(PCASH.Payee);
            PCASH.TestField(PCASH."Pay Mode");
            PCASH.TestField(PCASH."Posting Date");
            if PCASH."Pay Mode" = 'CHEQUE' then begin
                PCASH.TestField(PCASH."Cheque Date");
            end;

            //Check Lines
            PCASH.CalcFields("Total Amount LCY");
            if PCASH."Total Amount LCY" = 0 then
                Error('Amount is cannot be zero');
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if not PCASHLines.FindLast then
                Error('InterBank Transfer Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Bank TR Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Bank TR Journal Batch Name");
            GenJnLine.DeleteAll;

            //Bank Entries
            LineNo := LineNo + 1000;
            PCASH.CalcFields(PCASH."Total Amount LCY");
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            PCASHLines.Validate(PCASHLines.Amount);
            PCASHLines.CalcSums(PCASHLines.Amount);


            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Bank TR Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Bank TR Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := PCASHLines."Account No";
            GenJnLine.Validate(GenJnLine."Account No.");
            if PCASH.Date = 0D then
                Error('You must specify the Transfer date');
            //Ruth

            if PCASH."Pay Mode" = 'CHEQUE' then
                GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
            GenJnLine.Validate("Currency Code");
            GenJnLine."Posting Date" := PCASH."Posting Date";
            GenJnLine."Document No." := PCASH."No.";
            GenJnLine."External Document No." := PCASH."No.";
            GenJnLine."Payment Method Code" := PCASH."Pay Mode";
            //use paye field
            /*
            PCASH.CALCFIELDS("Bank Name");*/
            GenJnLine.Description := PCASH.Payee;
            GenJnLine.Amount := PCASHLines.Amount;
            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Bal. Account No." := PCASH."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Bal. Account No.");
            GenJnLine.Validate(GenJnLine.Amount);//

            GenJnLine."Shortcut Dimension 1 Code" := PCASH."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PCASH."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

            GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            Commit();


            //loop to print check
            GenJnLine.Reset;
            GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
            GenJnLine.SetRange("Check Printed", false);
            if GenJnLine.FindSet then begin
                repeat
                    CMSetup.Get;

                    PrintCheck(GenJnLine, CMSetup."Bank TR Journal Template", CMSetup."Bank TR Journal Batch Name");

                    PCASHLines.SetRange(No, PCASHLines.No);
                    if PCASHLines.FindSet then begin
                        PCASHLines."Check No" := GenJnLine."Document No.";
                        PCASHLines."Check Printed" := true;
                        PCASHLines.Modify();
                    end;
                until GenJnLine.Next = 0;
            end;

            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Bank TR Journal Template");
            GenJnlLine.SetRange("Journal Batch Name", CMSetup."Bank TR Journal Batch Name");
            if GenJnLine.FindSet then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            end;
            if PCASH."Pay Mode" = 'CHEQUE' then begin
                BALedgerEntry.Reset;
                BALedgerEntry.SetRange("External Document No.", PCASH."No.");
                if BALedgerEntry.FindSet then begin
                    PCASH."Cheque No" := BALedgerEntry."Document No.";
                    PCASH.Posted := true;
                    PCASH."Posted By" := UserId;
                    PCASH."Posted Date" := Today;
                    PCASH."Time Posted" := Time;
                    PCASH.Modify;

                end;
            end else

                //check entries on the ledger
                BALedgerEntry.Reset;
            BALedgerEntry.SetRange("Document No.", PCASH."No.");
            if BALedgerEntry.FindFirst then begin
                PCASH.Posted := true;
                PCASH."Posted By" := UserId;
                PCASH."Posted Date" := Today;
                PCASH."Time Posted" := Time;
                PCASH.Modify;
            end;



            //Create Imprest Surrender in the event the document originated from an imprest.
            /*
            IF PV."Original Document"=PV."Original Document"::Imprest THEN BEGIN
               PV."Payment Type":=PV."Payment Type"::"10";
               PV.Status:=PV.Status::Open;
               PV.MODIFY;
            END;
            */
            //END;

            PettyCashEntries.RESET;
            PettyCashEntries.SETRANGE(No, PCASH."No.");
            IF PettyCashEntries.FINDSET THEN BEGIN
                REPEAT
                    PettyCash.RESET;
                    PettyCash.SETRANGE("No.", PettyCashEntries."Payment Document No.");
                    IF PettyCash.FINDFIRST THEN BEGIN
                        PettyCash.Recouped := TRUE;
                        PettyCash.MODIFY;
                    END;
                UNTIL PettyCashEntries.NEXT = 0
            END;

        end;



        //staff claims posting



        //end of staff claims posting

    end;


    procedure PostPettyCashSurrender(var PCash: Record Payments)
    var
        PCLines: Record "Petty Cash Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
    begin

        if Confirm(Text014, false, PCash."No.") = true then begin
            if PCash.Status <> PCash.Status::Released then
                Error(Text003, PCash."No.");

            PCash.TestField("Surrender Date");


            PCash.CalcFields("Petty Cash Amount", PCash."Actual Petty Cash Amount Spent");
            if PCash."Petty Cash Amount" = 0 then
                Error(Text005);
            if PCash."Actual Petty Cash Amount Spent" = 0 then
                Error(Text016);


            if PCash.Surrendered then
                Error(Text015, PCash."No.");


            CMSetup.Get();
            CMSetup.TestField("Petty Cash Surrender Template");
            CMSetup.TestField("PCASH Journal Batch Name");

            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Petty Cash Surrender Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."PCASH Journal Batch Name");
            GenJnLine.DeleteAll;

            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
            Batch.Name := CMSetup."PCASH Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
            GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := PCash."Account Type";
            GenJnLine."Account No." := PCash."Account No.";
            if PCash."Posting Date" = 0D then
                Error('You must specify the posting date');
            GenJnLine."Posting Date" := PCash."Posting Date";
            GenJnLine."Document No." := PCash."No.";
            GenJnLine.Description := 'Petty Cash Surrendered by: ' + PCash.Payee;
            GenJnLine.Amount := -PCash."Actual Petty Cash Amount Spent";
            GenJnLine.Validate(Amount);
            /*
            GenJnLine."Shortcut Dimension 1 Code":=Imprest."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=Imprest."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 2 Code");

          *///
            //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

            //GenJnLine."Bal. Account Type":=GenJnLine."Bal. Account Type"::Customer;
            //// GenJnLine."Bal. Account No.":=Imprest."Account No.";
            // GenJnLine.VALIDATE("Bal. Account No.");

            GenJnLine."Dimension Set ID" := PCash."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Petty Cash surrender Lines Entries
            PCLines.Reset;
            PCLines.SetRange(PCLines.No, PCash."No.");
            if PCLines.FindFirst then begin
                repeat
                    PCLines.Validate(PCLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PCLines."Account Type";
                    GenJnLine."Account No." := PCLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PCash."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := PCash."Posting Date";
                    GenJnLine."Document No." := PCash."No.";
                    //PCLines.TESTFIELD(Description);
                    GenJnLine.Description := 'Petty Cash to  ' + PCash."Account Name";
                    GenJnLine.Amount := PCLines."Actual Spent";
                    GenJnLine."Currency Code" := PCash."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Set these fields to blanks
                    GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                    GenJnLine.Validate("Gen. Posting Type");
                    GenJnLine."Gen. Bus. Posting Group" := '';
                    GenJnLine.Validate("Gen. Bus. Posting Group");
                    GenJnLine."Gen. Prod. Posting Group" := '';
                    GenJnLine.Validate("Gen. Prod. Posting Group");
                    GenJnLine."VAT Bus. Posting Group" := '';
                    GenJnLine.Validate("VAT Bus. Posting Group");
                    GenJnLine."VAT Prod. Posting Group" := '';
                    GenJnLine.Validate("VAT Prod. Posting Group");

                    //add jobs
                    GenJnLine."Job No." := PCash.Job;
                    GenJnLine."Job Task No." := PCash."Job Task No";
                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //end jobs

                    GenJnLine."Dimension Set ID" := PCash."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until PCLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /*GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",PCash."No.");
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            GLEntry.SETRANGE("Posting Date",PCash."Posting Date");
            IF GLEntry.FINDFIRST THEN BEGIN*/
            PCash.Surrendered := true;
            PCash."Surrendered By" := UserId;
            PCash."Date Surrendered" := Today;
            PCash.Modify;
            //END;

        end;

    end;

    local procedure UpdatePCLines(PCash: Record Payments)
    var
        PCLines: Record "Petty Cash Lines";
        PVLines: Record "PV Lines";
    begin
        PVLines.Reset;
        PVLines.SetRange(No, PCash."No.");
        if PVLines.Find('-') then
            repeat
                PCLines.Init;
                PCLines.No := PVLines.No;
                PCLines."Line No" := PVLines."Line No";
                PCLines."Account Type" := PVLines."Account Type";
                PCLines."Account No" := PVLines."Account No";
                PCLines."Account Name" := PVLines."Account Name";
                PCLines.Description := PVLines.Description;
                PCLines.Amount := PVLines.Amount;
                PCLines.Validate(Amount);
                if not PCLines.Get(PCLines.No, PCLines."Line No") then
                    PCLines.Insert;
            until
           PVLines.Next = 0;
    end;


    procedure PostReceipt(ReceiptRec: Record "Receipts Header1")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Confirm(Text017, false, ReceiptRec."No.") = true then begin

            /*IF ReceiptRec.Posted=TRUE THEN
            ERROR(Text018,ReceiptRec."No.");*/
            ReceiptRec.TestField(Date);
            ReceiptRec.TestField("Bank Code");
            ReceiptRec.TestField("Received From");
            ReceiptRec.TestField("Pay Mode");

            if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
                ReceiptRec.TestField("Cheque No");
                ReceiptRec.TestField("Cheque Date");
            end;

            ReceiptRec.CalcFields(Amount);
            //Check Lines
            if ReceiptRec.Amount = 0 then
                Error('Amount cannot be zero');
            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            if not RcptLines.FindLast then
                Error('Receipt Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
            GenJnLine.DeleteAll;


            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Receipt Template";
            Batch.Name := CMSetup."Receipt Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            //Bank Entries
            LineNo := LineNo + 10000;

            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            RcptLines.Validate(Amount);
            RcptLines.CalcSums(Amount);



            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := ReceiptRec."Bank Code";
            GenJnLine.Validate(GenJnLine."Account No.");
            if ReceiptRec.Date = 0D then
                Error('You must specify the Receipt date');
            GenJnLine."Posting Date" := ReceiptRec."Posted Date";
            GenJnLine."Document No." := ReceiptRec."No.";
            GenJnLine."External Document No." := ReceiptRec."Cheque No";
            GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
            GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
            GenJnLine.Amount := ReceiptRec.Amount;
            GenJnLine."Currency Code" := ReceiptRec."Currency Code";
            GenJnLine.Validate("Currency Code");
            GenJnLine."Currency Factor" := ReceiptRec."Currency Factor";
            GenJnLine.Validate("Currency Factor");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //Receipt Lines Entries
            RcptLines.Reset;
            RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
            if RcptLines.FindFirst then begin
                repeat
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := ReceiptRec."Posted Date";
                    GenJnLine."Document No." := ReceiptRec."No.";
                    GenJnLine."External Document No." := ReceiptRec."Cheque No";
                    GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                    GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                    GenJnLine.Amount := -RcptLines.Amount;
                    GenJnLine."Currency Code" := ReceiptRec."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine."Currency Factor" := ReceiptRec."Currency Factor";
                    GenJnLine.Validate("Currency Factor");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                    //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                    //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until RcptLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                ReceiptRec.Posted := true;
                ReceiptRec."Posted By" := UserId;
                ReceiptRec."Posted Date" := ReceiptRec."Posted Date";
                ReceiptRec."Posted Time" := Time;
                ReceiptRec.Modify;

            end;

        end;

    end;


    procedure PostImprestMemoSurr(var ImprestMemo: Record "Imprest Memo")
    var
        JobPlanningLines: Record "Job Planning Line";
        LineNo: Integer;
        ProjectMembers: Record "Project Members";
        WorkType: Record "Work Type";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
    begin
        if not Confirm(Text019, false, ImprestMemo."No.") then
            exit;

        with ImprestMemo do begin
            //Check if Posted
            if Posted and Surrendered then
                Error(Text020);

            //
            //Check totals
            /*
            ImprestMemo.CALCFIELDS("Actual Subsistence Allowance");
            IF ImprestMemo."Actual Subsistence Allowance"=0 THEN
              ERROR(Text012);
              */

            //Loop through Project Members
            ProjectMembers.Reset;
            ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
            ProjectMembers.SetRange(Posted, false);
            if ProjectMembers.Find('-') then
                repeat
                    ProjectMembers.Posted := true;
                    ProjectMembers.Modify;
                //END;
                until ProjectMembers.Next = 0;
            //

            //Loop Through the casuals
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", "No.");
            Casuals.SetRange(Posted, false);
            if Casuals.Find('-') then
                repeat
                    Casuals.TestField("Resource No.");

                    Casuals.Posted := true;
                    Casuals.Modify;

                //END;
                until Casuals.Next = 0;
            //

            //Loop Through the Miscelleneous Costs

            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", "No.");
            OtherCosts.SetRange(Posted, false);
            if OtherCosts.Find('-') then
                repeat
                    OtherCosts.TestField("No.");

                    OtherCosts.Posted := true;
                    OtherCosts.Modify;
                //END;
                until OtherCosts.Next = 0;
            //

            Posted := true;
            "Posted By" := UserId;
            Surrendered := true;
            Modify;
            //

            //
        end;

        //post of staff claims

    end;


    procedure PostStaffClaims(Sclaims: Record Payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
        EmployeeLedgerEntry: Record "Employee Ledger Entry";
    begin
        if Confirm(text024, false, Sclaims."No.") = true then begin
            if Sclaims.Status <> Sclaims.Status::Released then
                Error(Text023, Sclaims."No.");
            Sclaims.TestField(Sclaims.Date);
            Sclaims.CalcFields(Sclaims."Total Amount LCY");
            if Sclaims."Total Amount LCY" = 0 then
                Error(text022);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Staff Claim Journal Template");
            CMSetup.TestField(CMSetup."Staff Claim Journal Batch Name");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Staff Claim Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Staff Claim Journal Batch Name");
            GenJnLine.DeleteAll;
            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Staff Claim Journal Template";
            Batch.Name := CMSetup."Staff Claim Journal Batch Name";

            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Staff Claim Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Staff Claim Journal Batch Name";
            GenJnLine."Line No." := LineNo + 1000;
            GenJnLine."Account Type" := Sclaims."Account Type";
            GenJnLine."Account No." := Sclaims."Account No.";
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Staff Claim From:  ' + Sclaims."Account Name";
            GenJnLine.Amount := -Sclaims."Total Amount LCY";
            GenJnLine.Validate(Amount);

            //Added for Jobs
            /*GenJnLine."Job No.":=Sclaims.Job;
            GenJnLine."Job Task No.":=Sclaims."Job Task No";*/

            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Staff Claim Lines
            sclaimlines.Reset;
            sclaimlines.SetRange(sclaimlines.No, Sclaims."No.");
            if sclaimlines.FindFirst then begin
                repeat
                    sclaimlines.Validate(sclaimlines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Staff Claim Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Staff Claim Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := sclaimlines."Account Type";
                    GenJnLine."Account No." := sclaimlines."Account No";
                    GenJnLine."External Document No." := Sclaims."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Sclaims."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := Sclaims."Posting Date";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
                    GenJnLine."Document No." := Sclaims."No.";
                    GenJnLine."External Document No." := Sclaims."Account No.";
                    sclaimlines.TestField(Description);
                    GenJnLine.Description := sclaimlines.Description;
                    GenJnLine.Amount := sclaimlines.Amount;
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Job ledger entries

                    //Added for Jobs
                    GenJnLine."Job No." := Sclaims.Job;
                    GenJnLine."Job Task No." := Sclaims."Job Task No";

                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //end jobs

                    GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until sclaimlines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            Sclaims.Posted := true;
            Sclaims."Posted By" := UserId;
            Sclaims."Posted Date" := Today;
            Sclaims.Modify;

        end;

        //end of staff claim post


        //end of staff claim post

    end;


    procedure SendforPosting(var Imprest: Record Payments)
    var
        ImprestLines: Record Payments;
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImpLine: Record "Imprest Lines";
    begin

        if Confirm(Text102, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");


            Imprest.TestField("Account No.");
            Imprest.TestField("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Pay Mode");
            Imprest.TestField("Shortcut Dimension 1 Code");
            Imprest.TestField("Shortcut Dimension 2 Code");
            //Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            // Imprest.TESTFIELD("Posting Date");


            if Imprest."Pay Mode" = 'CHEQUE' then begin
                Imprest.TestField("Cheque No");
                Imprest.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.SetRange(ImprestLines."No.", Imprest."No.");
            if not ImprestLines.FindLast then
                Error(Text004);

            Imprest.CalcFields("Imprest Amount");
            if Imprest."Imprest Amount" = 0 then
                Error(Text005);

            if Imprest.Posted then
                Error(Text006, Imprest."No.");

            Imprest."Send for Posting" := true;
            Imprest.Modify;
            Message('Imprest %1 has been sent for posting successfully', Imprest."No.");

        end;
    end;


    procedure PostSalaryAdvance(Sclaims: Record Payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
        Employee: Record Employee;
        HumanResourceSetup: Record "Human Resources Setup";
    begin
        if Confirm(text025, false, Sclaims."No.") = true then begin
            if Sclaims.Status <> Sclaims.Status::Released then
                Error(Text026, Sclaims."No.");
            Sclaims.TestField(Sclaims.Date);
            Sclaims.TestField(Sclaims.Purpose);
            Sclaims.TestField("Paying Bank Account");
            Sclaims.TestField("Effective from Month");
            Sclaims.TestField("Posting Date");
            if Sclaims."Amount Approved" = 0 then
                Error(text027);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Salary Adv Journal Batch Name");
            CMSetup.TestField(CMSetup."Salary Adv Journal Template");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Salary Adv Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Salary Adv Journal Batch Name");
            GenJnLine.DeleteAll;
            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Salary Adv Journal Template";
            Batch.Name := CMSetup."Salary Adv Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Salary Adv Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Salary Adv Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Employee;
            GenJnLine."Account No." := Sclaims."Account No.";
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
            HumanResourceSetup.Get;

            // Employee.RESET;
            // Employee.SETRANGE("No.",Sclaims."Account No.");
            // IF Employee.FIND('-') THEN BEGIN
            // //   Employee.TESTFIELD("Salary Advance Posting Group");
            GenJnLine."Posting Group" := HumanResourceSetup."Salary Advance Posting Group";
            // END;
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Salary Advance From:  ' + Sclaims."Account Name";
            GenJnLine.Amount := Sclaims."Amount Approved";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
            GenJnLine."Bal. Account No." := Sclaims."Paying Bank Account";

            GenJnLine.Validate(Amount);
            //GenJnLine."Posting Group":=CMSetup."SClaims Posting Group";
            //GenJnLine.VALIDATE(GenJnLine."Posting Group");
            //GenJnLine."Transaction Type":=Sclaims."Transaction Type";

            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            Sclaims.Posted := true;
            Sclaims."Posted By" := UserId;
            Sclaims."Posted Date" := Today;
            Sclaims.Modify;

        end;

        //end of salary advance
    end;


    procedure FnPostSalaryAdvance(Sclaims: Record Payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
    begin
        if Confirm(text025, false, Sclaims."No.") = true then begin
            if Sclaims.Status <> Sclaims.Status::Released then
                Error(Text026, Sclaims."No.");
            Sclaims.TestField(Sclaims.Date);
            Sclaims.TestField(Sclaims.Purpose);
            if Sclaims."Amount Approved" = 0 then
                Error(text027);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Salary Adv Journal Batch Name");
            CMSetup.TestField(CMSetup."Salary Adv Journal Template");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Salary Adv Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Salary Adv Journal Batch Name");
            GenJnLine.DeleteAll;
            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Salary Adv Journal Template";
            Batch.Name := CMSetup."Salary Adv Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Salary Adv Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Salary Adv Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := Sclaims."Account Type";
            GenJnLine."Account No." := Sclaims."Account No.";
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Salary Advance From:  ' + Sclaims."Account Name";
            GenJnLine.Amount := Sclaims."Amount Approved";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
            GenJnLine."Bal. Account No." := Sclaims."Paying Bank Account";

            GenJnLine.Validate(Amount);
            //GenJnLine."Posting Group":=CMSetup."SClaims Posting Group";
            //GenJnLine.VALIDATE(GenJnLine."Posting Group");
            //GenJnLine."Transaction Type":=Sclaims."Transaction Type";

            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            /*
            //Staff Claim Lines
            sclaimlines.RESET;
            sclaimlines.SETRANGE(sclaimlines.No,Sclaims."No.");
            IF sclaimlines.FINDFIRST THEN BEGIN
            REPEAT
            sclaimlines.VALIDATE(sclaimlines.Amount);
            LineNo:=LineNo+10000;
            GenJnLine.INIT;
            GenJnLine."Journal Template Name":=CMSetup."Staff Claim Journal Template";
            GenJnLine."Journal Batch Name":=CMSetup."Staff Claim Journal Batch Name";
            GenJnLine."Line No.":=LineNo;
            GenJnLine."Account Type":=sclaimlines."Account Type";
            GenJnLine."Account No.":=sclaimlines."Account No";
            GenJnLine."External Document No.":=Sclaims."Account No.";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
             IF Sclaims."Posting Date"=0D THEN
              ERROR('You must specify the posting date');
            GenJnLine."Posting Date":=Sclaims."Posting Date";
            //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
            GenJnLine."Document No.":=Sclaims."No.";
            GenJnLine."External Document No.":=Sclaims."Account No.";
            sclaimlines.TESTFIELD(Description);
            GenJnLine.Description:=sclaimlines.Description;
            GenJnLine.Amount:=sclaimlines.Amount;
            GenJnLine.VALIDATE(GenJnLine.Amount);

            //Job ledger entries
            {
            GenJnLine."Job No.":=sclaimlines."Shortcut Dimension 2 Code";
            GenJnLine."Job Task No.":=sclaimlines."Job Task No.";
            GenJnLine."Job Quantity":=1;
            GenJnLine.VALIDATE(GenJnLine."Job No.");
            GenJnLine.VALIDATE(GenJnLine."Job Task No.");
            GenJnLine.VALIDATE(GenJnLine."Job Quantity");
            }
            //end jobs

            GenJnLine."Dimension Set ID":=Sclaims."Dimension Set ID";
            GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

             IF GenJnLine.Amount<>0 THEN
             GenJnLine.INSERT;

            UNTIL sclaimlines.NEXT=0;
            END;
            */
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            Sclaims.Posted := true;
            Sclaims."Posted By" := UserId;
            Sclaims."Posted Date" := Today;
            Sclaims.Modify;

        end;
        OnAfterPostSalaryAdvance(Sclaims);
        //end of staff claim post

    end;


    procedure PostStandingImprestSurrenders(StandingImprest: Record Payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        StandingImprestlines: Record "PV Lines";
        LineNo: Integer;
    begin
        if Confirm(text028, false, StandingImprest."No.") = true then begin
            if StandingImprest.Status <> StandingImprest.Status::Released then
                Error(Text023, StandingImprest."No.");
            StandingImprest.TestField(StandingImprest.Date);
            StandingImprest.CalcFields(StandingImprest."Total Amount LCY");
            if StandingImprest."Total Amount LCY" = 0 then
                Error(text022);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Standing Imp Journal Template");
            CMSetup.TestField(CMSetup."StandingImp Journal Batch Name");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Standing Imp Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."StandingImp Journal Batch Name");
            GenJnLine.DeleteAll;

            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Standing Imp Journal Template";
            Batch.Name := CMSetup."StandingImp Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;




            //Staff Claim Lines
            StandingImprestlines.Reset;
            StandingImprestlines.SetRange(StandingImprestlines.No, StandingImprest."No.");
            if StandingImprestlines.FindFirst then begin
                repeat
                    StandingImprestlines.TestField("Reference No");
                    StandingImprestlines.TestField(Description);
                    StandingImprestlines.Validate(StandingImprestlines.Amount);



                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Standing Imp Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."StandingImp Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
                    GenJnLine."Account No." := StandingImprest."Paying Bank Account";
                    GenJnLine."Posting Date" := StandingImprest.Date;
                    // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
                    GenJnLine."Document No." := StandingImprest."No.";
                    GenJnLine."External Document No." := StandingImprestlines."Reference No";
                    GenJnLine.Description := StandingImprestlines.Description;
                    GenJnLine.Amount := -StandingImprestlines.Amount;
                    GenJnLine.Validate(Amount);

                    //Added for Jobs
                    /*GenJnLine."Job No.":=StandingImprest.Job;
                    GenJnLine."Job Task No.":=StandingImprest."Job Task No";*/

                    GenJnLine."Dimension Set ID" := StandingImprest."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");


                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;





                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Standing Imp Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."StandingImp Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := StandingImprestlines."Account Type";
                    GenJnLine."Account No." := StandingImprestlines."Account No";
                    GenJnLine."External Document No." := StandingImprest."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if StandingImprest.Date = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := StandingImprest.Date;
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
                    GenJnLine."Document No." := StandingImprest."No.";
                    GenJnLine."External Document No." := StandingImprest."Account No.";
                    //StandingImprestlines.TESTFIELD(Description);
                    GenJnLine.Description := StandingImprestlines."Account Name";
                    GenJnLine.Amount := StandingImprestlines.Amount;
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Job ledger entries

                    //Added for Jobs
                    GenJnLine."Job No." := StandingImprest.Job;
                    GenJnLine."Job Task No." := StandingImprest."Job Task No";

                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //end jobs

                    GenJnLine."Dimension Set ID" := StandingImprest."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;


                until StandingImprestlines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            StandingImprest.Posted := true;
            StandingImprest."Posted By" := UserId;
            StandingImprest."Posted Date" := Today;
            StandingImprest.Modify;

        end;

        //end of standing imprest surrender

    end;


    procedure PostDIV(ReceiptRec: Record "Receipts Header1")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Confirm(Text017, false, ReceiptRec."No.") = true then begin

            if ReceiptRec.Posted = true then
                Error(Text018, ReceiptRec."No.");
            ReceiptRec.TestField(Date);
            ReceiptRec.TestField("Bank Code");
            ReceiptRec.TestField("Received From");
            ReceiptRec.TestField("Pay Mode");

            if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
                ReceiptRec.TestField("Cheque No");
                ReceiptRec.TestField("Cheque Date");
            end;

            ReceiptRec.CalcFields(Amount);
            //Check Lines
            if ReceiptRec.Amount = 0 then
                Error('Amount cannot be zero');
            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            if not RcptLines.FindLast then
                Error('Receipt Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
            GenJnLine.DeleteAll;


            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Receipt Template";
            Batch.Name := CMSetup."Receipt Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            //Bank Entries
            LineNo := LineNo + 10000;

            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            RcptLines.Validate(Amount);
            RcptLines.CalcSums(Amount);



            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := ReceiptRec."Bank Code";
            GenJnLine.Validate(GenJnLine."Account No.");
            if ReceiptRec.Date = 0D then
                Error('You must specify the Receipt date');
            GenJnLine."Posting Date" := ReceiptRec."Posted Date";
            GenJnLine."Document No." := ReceiptRec."No.";
            GenJnLine."External Document No." := ReceiptRec."Cheque No";
            GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
            GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
            GenJnLine.Amount := ReceiptRec.Amount;
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //Receipt Lines Entries
            RcptLines.Reset;
            RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
            if RcptLines.FindFirst then begin
                repeat
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := ReceiptRec."Posted Date";
                    GenJnLine."Document No." := ReceiptRec."No.";
                    GenJnLine."External Document No." := ReceiptRec."Cheque No";
                    GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                    GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                    GenJnLine.Amount := -RcptLines.Amount;
                    //GenJnLine."Currency Code":=ReceiptRec.Currency;
                    //GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                    //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                    //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until RcptLines.Next = 0;
            end;

            //DIV
            LineNo := LineNo + 10000;
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
            GenJnLine."Account No." := ReceiptRec."Expense Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if ReceiptRec.Date = 0D then
                Error('You must specify the Receipt date');
            GenJnLine."Posting Date" := ReceiptRec."Posted Date";
            GenJnLine."Document No." := ReceiptRec."No.";
            GenJnLine."External Document No." := ReceiptRec."Cheque No";
            GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
            GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
            GenJnLine.Amount := -ReceiptRec.Amount;
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //Receipt Lines Entries
            RcptLines.Reset;
            RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
            if RcptLines.FindFirst then begin
                repeat
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := ReceiptRec."Posted Date";
                    GenJnLine."Document No." := ReceiptRec."No.";
                    GenJnLine."External Document No." := ReceiptRec."Cheque No";
                    GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                    GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                    GenJnLine.Amount := RcptLines.Amount;
                    //GenJnLine."Currency Code":=ReceiptRec.Currency;
                    //GenJnLine.VALIDATE("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                    //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                    //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until RcptLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                ReceiptRec.Posted := true;
                ReceiptRec."Posted By" := UserId;
                ReceiptRec."Posted Date" := ReceiptRec."Posted Date";
                ReceiptRec."Posted Time" := Time;
                ReceiptRec.Modify;

            end;

        end;
    end;


    procedure PrintCheck(LineValue: Record "Gen. Journal Line"; TemplateName: Text; BatchName: Text)
    begin
        CMSetup.Get;
        /*
        GenJnlLine."Journal Template Name":=TemplateName;
        GenJnlLine."Journal Batch Name":=BatchName;
        GenJnlLine.COPY(LineValue);*/
        DocPrint.PrintCheck(LineValue);
        Codeunit.Run(Codeunit::"Adjust Gen. Journal Balance", LineValue);

    end;


    procedure "Post Prepayment Voucher"(PrepaymentHeader: Record "Prepayment Header")
    var
        PVLines: Record "Prepayment Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        PVLines1: Record "Prepayment Lines";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        if Dialog.Confirm('Are you sure you want to post the Prepayment Voucher No. ' + PrepaymentHeader."No." + ' ?', true) then begin
            if PrepaymentHeader.Status <> PrepaymentHeader.Status::Released then
                Error('The Pre-Payment Voucher No %1 has not been fully approved', PrepaymentHeader."No.");
            if PrepaymentHeader.Posted then
                Error('Pre-Payment Voucher %1 has been posted', PrepaymentHeader."No.");
            PrepaymentHeader.TestField(Date);
            PrepaymentHeader.TestField("Paying Bank Account");
            PrepaymentHeader.TestField(PrepaymentHeader."Pay Mode");
            PrepaymentHeader.TestField(PrepaymentHeader."Posting Date");
            PrepaymentHeader.CalcFields("Total Amount");
            if PrepaymentHeader."Total Amount" = 0 then
                Error('Amount is cannot be zero');
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PrepaymentHeader."No.");
            if not PVLines.FindLast then
                Error('Payment voucher Lines cannot be empty');
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            GenJnLine.DeleteAll;

            //PrepaymentHeader Lines Entries
            LineNo := LineNo + 10000;
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
            GenJnLine.Validate("Account Type");
            GenJnLine."Account No." := CMSetup."Prepayment Account";
            GenJnLine.Validate("Account No.");

            if PrepaymentHeader."Posting Date" = 0D then
                Error('You must specify the PrepaymentHeader date');
            GenJnLine."Posting Date" := PrepaymentHeader."Posting Date";
            GenJnLine."Document No." := PrepaymentHeader."No.";
            GenJnLine."External Document No." := PrepaymentHeader."No.";
            GenJnLine."Payment Method Code" := PrepaymentHeader."Pay Mode";
            //Ruth
            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Bal. Account No." := PrepaymentHeader."Paying Bank Account";
            if PrepaymentHeader."Pay Mode" = 'CHEQUE' then
                GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine.Validate("Bal. Account No.");

            GenJnLine.Description := Format((PrepaymentHeader."Payment Narration"), 50);
            GenJnLine.Amount := PrepaymentHeader."Total Amount";
            if PrepaymentHeader."Pay Mode" = 'CHEQUE' then
                //GenJnLine."Pay Mode":=PrepaymentHeader."Pay Mode";
                GenJnLine."Currency Code" := PrepaymentHeader.Currency;
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            if GenJnLine.Amount <> 0 then GenJnLine.Insert;
            Commit();
            //loop to print check
            GenJnLine.Reset;
            GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
            GenJnLine.SetRange("Check Printed", false);
            if GenJnLine.FindSet then begin
                repeat
                    CMSetup.Get;
                    PrintCheck(GenJnLine, CMSetup."PV Journal Template", CMSetup."PV Journal Batch Name");

                until GenJnLine.Next = 0;
            end;


            //today
            if CMSetup.Get then
                GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

            PrepaymentHeader.Posted := true;
            PrepaymentHeader."Posted By" := UserId;
            PrepaymentHeader."Posted Date" := Today;
            PrepaymentHeader."Time Posted" := Time;
            PrepaymentHeader.Modify;


        end;
    end;


    procedure PostWarrantVoucher(Warrant: Record Payments)
    var
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        Employee: Record Employee;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin

        if Dialog.Confirm('Are you sure you want to post the Warrant Voucher No. ' + Warrant."No." + ' ?', true) then begin

            if Warrant.Status <> Warrant.Status::Released then
                Error('The Warrant Voucher No %1 has not been fully approved', Warrant."No.");
            if Warrant.Posted then
                Error('Warrant Voucher %1 has been posted', Warrant."No.");
            Warrant.TestField("Paying Bank Account");
            Warrant.TestField(Warrant."Pay Mode");
            Warrant.TestField("Cheque No");
            Warrant.TestField(Warrant."Posting Date");
            Warrant.TestField(Warrant."Cheque Date");

            Warrant.CalcFields("Imprest Voucher Amount");
            Warrant.CalcFields("Imprest Voucher Amount(LCY)");
            if Warrant."Imprest Voucher Amount" = 0 then
                Error('Amount is cannot be zero');
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            if not ImprestVoucherLines.FindLast then
                Error('Warrant voucher Lines cannot be empty');
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            BankAccountLedgerEntry.Reset;
            BankAccountLedgerEntry.SetRange("External Document No.", Warrant."No.");
            BankAccountLedgerEntry.SetRange(Reversed, false);
            if BankAccountLedgerEntry.FindFirst then
                Error('There are entries in the bank associated with this warrant.Kindly consult the system administrator');
            GenJnLine.Reset;
            GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";

            GenJnLine.SetRange("Journal Template Name", CMSetup."Imp Voucher Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Imp Voucher Journal Batch Name");
            GenJnLine.DeleteAll;


            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
            GenJnLine."Shortcut Dimension 1 Code" := Warrant."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Warrant."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
            GenJnLine."Posting Date" := Warrant."Posting Date";
            GenJnLine."Document No." := Warrant."Cheque No";
            GenJnLine."External Document No." := Warrant."No.";
            GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
            GenJnLine."Account No." := CMSetup."Warrant Voucher Default Payabl";
            GenJnLine.Description := Warrant.Payee;
            GenJnLine."Currency Code" := Warrant."Currency Code";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Amount := Warrant."Imprest Voucher Amount";

            if Warrant."Pay Mode" = 'CHEQUE' then
                GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Bal. Account No." := Warrant."Paying Bank Account";
            GenJnLine.Validate(Amount);
            GenJnLine.Insert;
            //PV Lines Entries
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            if ImprestVoucherLines.FindSet then begin
                repeat
                    LineNo := LineNo + 1000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
                    GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
                    GenJnLine."Account Type" := ImprestVoucherLines."Account Type";
                    GenJnLine."Account No." := ImprestVoucherLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Warrant."Posting Date" = 0D then
                        Error('You must specify the Imprest Voucher posting date');
                    GenJnLine."Posting Date" := Warrant."Posting Date";
                    GenJnLine."Document No." := Warrant."Cheque No";
                    GenJnLine."External Document No." := Warrant."No.";
                    //Ruth
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine.Description := Format((Warrant."Payment Narration") + '- ' + Warrant."Cheque No", 50);
                    GenJnLine.Amount := ImprestVoucherLines.Amount;
                    GenJnLine."Currency Code" := Warrant."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestVoucherLines."Global Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestVoucherLines."Global Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
                    GenJnLine."Bal. Account No." := CMSetup."Warrant Voucher Default Payabl";
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                until ImprestVoucherLines.Next = 0;
            end;
            Commit();
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imp Voucher Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Imp Voucher Journal Batch Name");
            GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
            GenJnLine.SetRange("Check Printed", false);
            if GenJnLine.FindSet then begin
                PrintCheck(GenJnLine, CMSetup."Imp Voucher Journal Template", CMSetup."Imp Voucher Journal Batch Name");
            end;
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imp Voucher Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Imp Voucher Journal Batch Name");
            if GenJnlLine.FindSet then
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

            /*  Payments.RESET;
              Payments.SETRANGE("Account No.",Warrant."Account No.");
              Payments.SETRANGE("Cheque No",Warrant."Cheque No");
              //do not create a new surrender
              IF Payments.FINDSET THEN BEGIN
                 Warrant.Posted:=TRUE;
                 Warrant."Posted By":=USERID;
                 Warrant."Posted Date":=TODAY;
                 Warrant."Time Posted":=TIME;
                 Warrant.MODIFY;
                 MESSAGE('The voucher has been successfully posted!');
              END ELSE BEGIN
                //create a new surrender
                CreateSurrender(Warrant."Imprest Memo No");
                 Warrant.Posted:=TRUE;
                 Warrant."Posted By":=USERID;
                 Warrant."Posted Date":=TODAY;
                 Warrant."Time Posted":=TIME;
                 Warrant.MODIFY;
                 MESSAGE('The voucher has been successfully posted!');
              END;
              */
            BankAccountLedgerEntry.Reset;
            BankAccountLedgerEntry.SetRange("External Document No.", Warrant."No.");
            if BankAccountLedgerEntry.FindFirst then begin
                Warrant.Posted := true;
                Warrant."Posted By" := UserId;
                Warrant."Posted Date" := Today;
                Warrant."Time Posted" := Time;
                Warrant.Modify;
                Commit;
                CreateSurrender(Warrant."Imprest Memo No", Warrant."Cheque No", Warrant."No.");
                Message('The voucher has been successfully posted!');
            end;

        end

    end;


    procedure CreateSurrender(Memo: Code[30]; QpayNo: Code[30]; VoucherNo: Code[30])
    var
        Memoheaders: Record "Imprest Memo";
        OtherCost: Record "Other Costs";
        SafariMembers: Record "Project Members";
        CashMgt: Record "Cash Management Setup";
        Imprestheaders: Record Payments;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Imprestlines: Record "Imprest Lines";
        glName: Record "G/L Account";
        ProjectTeam: Record "Project Members";
        LineNo: Integer;
        UserSetup: Record "User Setup";
        Email: Text;
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        ImprestOther: Decimal;
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        SurrenderNo: Code[30];
        ImprestVoucherLines1: Record "Imprest Voucher Lines";
        Imprestheaders1: Record Payments;
        RecordLink: Record "Record Link";
        RecordLink1: Record "Record Link";
        "EntryNo.": Integer;
    begin
        //LOOP Voucher lines
        Memoheaders.Reset;
        Memoheaders.SetRange("No.", Memo);
        if Memoheaders.FindFirst then begin
            Imprestheaders."Imprest Memo No" := ImprestVoucherLines."Imprest Memo No.";
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(No, VoucherNo);
            if ImprestVoucherLines.FindSet then begin
                repeat
                    //check existing surrender
                    Imprestheaders1.Reset;
                    Imprestheaders1.SetRange("Reference No.", ImprestVoucherLines.No);
                    Imprestheaders1.SetRange("Account Type", Imprestheaders1."account type"::Employee);
                    Imprestheaders1.SetRange("Account No.", ImprestVoucherLines."Account No.");
                    if not Imprestheaders1.FindFirst then begin
                        //window to show progress

                        //Window.OPEN('Creating Imprest Surrender for Employee:#######1',EmpName);
                        //Window.UPDATE(1,ImprestVoucherLines."Account Name");
                        SafariMembers.Reset;
                        SafariMembers.SetRange("No.", ImprestVoucherLines."Account No.");
                        SafariMembers.SetRange("Imprest Memo No.", ImprestVoucherLines."Imprest Memo No.");
                        SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                        if SafariMembers.Find('-') then begin

                            CashMgt.Get;
                            NoSeries := CashMgt."Imprest Surrender Nos";
                            Email2 := CashMgt."Imprest Email";

                            //header
                            //create header
                            LineNo := 1000;
                            Imprestheaders.Init;
                            Imprestheaders."No." := NoSeriesMgt.GetNextNo(NoSeries, Imprestheaders.Date, true);
                            Imprestheaders.Date := Today;
                            //change
                            Imprestheaders."Account Type" := ImprestVoucherLines."Account Type";
                            //Imprestheaders."Account Type" := Imprestheaders."Account Type"::Employee;
                            Imprestheaders."Account No." := SafariMembers."No.";
                            Imprestheaders.Validate("Account No.");
                            Imprestheaders."Account Name" := SafariMembers.Name;
                            //Check HOD
                            Employee.Reset;
                            Employee.SetRange("No.", SafariMembers."No.");
                            if Employee.FindSet then begin
                                Imprestheaders.HOD := Employee.HOD;
                            end;

                            Imprestheaders."Payment Type" := Imprestheaders."payment type"::Surrender;
                            Imprestheaders.Payee := SafariMembers.Name;
                            Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                            Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                            Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                            Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                            Imprestheaders.Job := Memoheaders.Job;
                            Imprestheaders.Status := Imprestheaders.Status::Open;
                            Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                            Imprestheaders."Job Task No." := Memoheaders."Job  Task";
                            Imprestheaders."Currency Code" := SafariMembers."Currency Code";
                            Imprestheaders."Created By" := EMp."User ID";



                            //Imprestheaders."Reference No.":="No.";



                            EMp.Reset;
                            EMp.SetRange("No.", Imprestheaders."Account No.");
                            //sendder
                            CMSetup.Get;
                            Email2 := CMSetup."Imprest Email";
                            Email := EMp."Company E-Mail";
                            Imprestheaders."Travel Date" := Memoheaders."Start Date";
                            Imprestheaders."Payment Narration" := Memoheaders.Subject;
                            Imprestheaders.Validate(Imprestheaders."Travel Date");
                            Imprestheaders."Document Type" := Imprestheaders."document type"::Surrender;
                            Imprestheaders."Imprest Memo No" := ImprestVoucherLines."Imprest Memo No.";
                            Imprestheaders."Reference No." := VoucherNo;
                            Imprestheaders."Imprest Deadline" := Memoheaders."Due Date";
                            Imprestheaders."On behalf of" := SafariMembers.Name;
                            Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
                            Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");
                            Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 3 Code");
                            Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                            Imprestheaders."Dimension Set ID" := Memoheaders."Dimension Set ID";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 4 Code");
                            Imprestheaders.Insert;
                            //get the attached documents Machira
                            RecordLink.Reset;
                            RecordLink.SetRange("Record ID", Memoheaders.RecordId);
                            if RecordLink.FindSet then begin
                                repeat
                                    //copy to the record link table with record id
                                    RecordLink1.Reset;
                                    if RecordLink1.FindLast then begin
                                        "EntryNo." := RecordLink1."Link ID";
                                    end;
                                    RecordLink1.Init;
                                    RecordLink1."Link ID" := "EntryNo." + 1;
                                    RecordLink1."Record ID" := Imprestheaders.RecordId;
                                    RecordLink1.URL1 := RecordLink.URL1;
                                    RecordLink1.Description := RecordLink.URL1;
                                    RecordLink1.Company := RecordLink.Company;
                                    RecordLink1.Type := RecordLink.Type;
                                    RecordLink1.Created := RecordLink.Created;
                                    RecordLink1."User ID" := RecordLink."User ID";
                                    RecordLink1.Insert;

                                until RecordLink.Next = 0;

                            end;

                            //end documents attached


                            //Start of Imprest lines
                            //get multiple lines for one member
                            SafariMembers1.Reset;
                            SafariMembers1.SetRange("Imprest Memo No.", SafariMembers."Imprest Memo No.");
                            SafariMembers1.SetRange("No.", SafariMembers."No.");
                            if SafariMembers1.FindSet then begin
                                repeat
                                    Imprestlines.Init;
                                    Imprestlines."Line No" := LineNo;
                                    Imprestlines.No := Imprestheaders."No.";
                                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                    SafariMembers1.CalcFields("G/L Account");
                                    Imprestlines."Account No." := Memoheaders."Job  Task";
                                    Imprestlines.Validate(Imprestlines."Account No.");
                                    Imprestlines."Account Name" := SafariMembers1."Work Type";
                                    Imprestlines.Purpose := SafariMembers1."Work Type";
                                    Imprestlines."Daily Rate" := SafariMembers1."Direct Unit Cost";
                                    Imprestlines."Applies- to Doc. No." := SafariMembers1."Imprest Memo No.";
                                    Imprestlines."No. of Days" := SafariMembers1."Time Period";
                                    Imprestlines.Amount := SafariMembers1.Entitlement;
                                    Imprestlines."Currency Code" := SafariMembers1."Currency Code";
                                    Imprestlines."Employee No." := SafariMembers1."No.";
                                    Imprestlines.Insert;
                                    LineNo := LineNo + 10;
                                    //Transort
                                    if SafariMembers."Transport Costs" <> 0 then begin
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";
                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        SafariMembers.CalcFields("G/L Account");
                                        Imprestlines."Account No." := Memoheaders."Job  Task";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := 'Transport Allowance';
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := SafariMembers."Transport Costs";
                                        Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Employee No." := SafariMembers."No.";


                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;
                                    end;
                                until SafariMembers1.Next = 0;
                            end;


                            if ImprestVoucherLines."Imprest Other Costs" > 0 then begin

                                //Casual
                                Casual.Reset;
                                Casual.SetRange(Casual."Imprest Memo No.", ImprestVoucherLines."Imprest Memo No.");
                                if Casual.Find('-') then begin
                                    repeat
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";

                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        Imprestlines."Account No." := Memoheaders."Job  Task";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := Casual.Activity;
                                        Imprestlines."Daily Rate" := Casual.Rate;
                                        Imprestlines."No. of Days" := Casual."No. of Days";
                                        Imprestlines.Amount := Casual.Amount;
                                        Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Employee No." := SafariMembers."No.";
                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;

                                    until Casual.Next = 0;
                                end;

                                //Other Costs
                                OtherCost.Reset;
                                OtherCost.SetRange(OtherCost."Imprest Memo No.", ImprestVoucherLines."Imprest Memo No.");
                                if OtherCost.FindSet then begin
                                    repeat
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";

                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        OtherCost.CalcFields("No.");
                                        Imprestlines."Account No." := Memoheaders."Job  Task";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := OtherCost."Required For";
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := OtherCost."Line Amount";
                                        Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Employee No." := SafariMembers."No.";
                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;

                                    until OtherCost.Next = 0;
                                end;
                                //Project team

                                ProjectTeam.Reset;
                                ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", ImprestVoucherLines."Imprest Memo No.");
                                ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
                                if ProjectTeam.Find('-') then
                                    //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                                    begin
                                    repeat
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";
                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        SafariMembers.CalcFields("G/L Account");
                                        Imprestlines."Account No." := Memoheaders."Job  Task";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := ProjectTeam."Work Type";
                                        Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Employee No." := SafariMembers."No.";

                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;

                                    until ProjectTeam.Next = 0;
                                end;





                            end;


                            //send email to participants

                            CashMgt.Get;
                            if CashMgt."Send Email Notification" = true then begin
                                Body := 'Your surrender application no. has been generated ' + Imprestheaders."No." + ' has been created from memo no. ' + ImprestVoucherLines."Imprest Memo No.";
                                //SMTP.Create('KASNEB Imprest Request', Email2,
                                //     Email, 'Surrender ' + 'No: ' + Imprestheaders."No.",
                                //    'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
                                //    'Your imprest surrender no. <b>' + Imprestheaders."No." + '</b> has been generated from memo no. <b>' + ImprestVoucherLines."Imprest Memo No." +
                                //    '</b><BR/> Kindly on return from your trip to:<b>' + Imprestheaders."Payment Narration" + ' </b>' + 'account for it using this document no' + ' ' + Imprestheaders."No." + ' ' + '<BR/>fill in the actual spent and send it for approval.<BR><BR>', true);
                                //SMTP.AddCC(Email2);
                                //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
                                //  //SMTP.Send();
                            end;
                            // UNTIL SafariMembers.NEXT=0;
                        end;
                    end;
                until ImprestVoucherLines.Next = 0;
            end;

            ImprestVoucherLines1.Reset;
            ImprestVoucherLines1.SetRange(No, VoucherNo);
            if ImprestVoucherLines1.FindSet then begin
                repeat
                    //modify the voucher lines
                    Memoheaders.Reset;
                    Memoheaders.SetRange("No.", ImprestVoucherLines1."Imprest Memo No.");
                    Memoheaders.SetRange(Posted, false);
                    if Memoheaders.FindSet then begin
                        Memoheaders."Imprest Created" := true;
                        Memoheaders."Date converted" := Today;
                        Memoheaders."Time converted" := Time;
                        Memoheaders."Converted By" := UserId;
                        Memoheaders.Posted := true;
                        Memoheaders.Modify;
                    end;
                until ImprestVoucherLines1.Next = 0;
            end;
            //Window.CLOSE;
            Message('Successfully');


        end;
    end;


    procedure ReverseWarrantVoucher(Warrant: Record Payments)
    var
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        Employee: Record Employee;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        ImprestMemo: Record "Imprest Memo";
        Surrenders: Record Payments;
        ReversalAmt: Decimal;
    begin
        if Dialog.Confirm('Are you sure you want to reverse the Warrant Voucher No. ' + Warrant."No." + ' ?', true) then begin
            if Warrant.Posted <> true then
                Error('The Warrant Voucher %1,has not been posted!', Warrant."No.");
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
            GenJnLine.DeleteAll;

            //PV Lines Entries
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            ImprestVoucherLines.SetRange(Reverse, true);
            if ImprestVoucherLines.FindSet then begin
                repeat
                    ReversalAmt := ImprestVoucherLines.Amount + ReversalAmt;
                    LineNo := LineNo + 1000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
                    GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
                    GenJnLine."Account Type" := GenJnLine."account type"::Employee;
                    GenJnLine."Account No." := ImprestVoucherLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Warrant."Posting Date" = 0D then
                        Error('You must specify the Imprest Voucher posting date');
                    GenJnLine."Posting Date" := Warrant."Posting Date";
                    GenJnLine."Document No." := Warrant."Imprest Memo No";
                    GenJnLine."External Document No." := Warrant."No.";
                    //Ruth
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine.Description := Format('Reversal- ' + Warrant."Cheque No", 50);
                    GenJnLine.Amount := -ImprestVoucherLines.Amount;
                    GenJnLine."Reversing Entry" := true;
                    GenJnLine."Currency Code" := Warrant."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestVoucherLines."Global Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestVoucherLines."Global Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                    //mark the reversed voucher surrenders reversed
                    Surrenders.Reset;
                    Surrenders.SetRange("Reference No.", Warrant."No.");
                    Surrenders.SetRange(Status, Surrenders.Status::Open);
                    Surrenders.SetRange("Payment Type", Surrenders."payment type"::Surrender);
                    Surrenders.SetRange("Account No.", ImprestVoucherLines."Account No.");
                    if Surrenders.FindFirst then begin
                        Surrenders.Reversed := true;
                        Surrenders.Status := Surrenders.Status::Released;
                        Surrenders.Posted := true;
                        Surrenders."Reversed By" := UserId;
                        Surrenders."Reversal Date" := Today;
                        Surrenders.Modify(true);

                    end;
                until ImprestVoucherLines.Next = 0;
            end;
            //header

            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
            GenJnLine."Shortcut Dimension 1 Code" := Warrant."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Warrant."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
            GenJnLine."Posting Date" := Warrant."Posting Date";
            GenJnLine."Document No." := Warrant."Imprest Memo No";
            GenJnLine."External Document No." := Warrant."No.";
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := Warrant."Paying Bank Account";
            GenJnLine.Description := Format('Reversal-' + Format(Warrant."Cheque No"), 50);
            GenJnLine.Amount := ReversalAmt;
            GenJnLine."Reversing Entry" := true;
            GenJnLine.Validate(Amount);
            GenJnLine.Insert;


            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            //       ImprestMemo.RESET;
            //       ImprestMemo.SETRANGE("No.",Warrant."Imprest Memo No");
            //       IF ImprestMemo.FINDSET THEN BEGIN
            //         ImprestMemo.Posted:=FALSE;
            //         ImprestMemo.MODIFY;
            //         MESSAGE('Dear %1,Navigate to approved Imprest Memos and create a new voucher from'+Warrant."Imprest Memo No",USERID);
            //      END;


            //       Warrant.Reversed:=TRUE;
            //       Warrant."Reversed By":=USERID;
            //       Warrant."Reversal Date":=TODAY;
            //       Warrant.MODIFY(TRUE);
            Message('The entries have been successfully reversed!');

        end
    end;


    procedure PostAIE(AIE: Record Payments)
    var
        AIEHeader: Record Payments;
        AIELines: Record "PV Lines";
        Sclaimlines: Record "PV Lines";
        CashMgt: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        //get the no. series
        CashMgt.Reset;
        if CashMgt.Find('-') then begin
            NoSeries := CashMgt."Staff Claim Nos.";
        end;

        AIEHeader.Init;
        AIEHeader."No." := NoSeriesMgt.GetNextNo(NoSeries, AIEHeader.Date, true);
        AIEHeader.Project := AIE.Project;
        AIEHeader."Project Description" := AIE."Project Description";
        AIEHeader.Date := Today;
        AIEHeader."Created By" := UserId;
        AIEHeader.Payee := AIE.Payee;
        AIEHeader."Account Type" := AIE."account type"::Employee;
        AIEHeader."Account No." := AIE."Account No.";
        AIEHeader.Validate("Account No.");
        AIEHeader."Payment Type" := AIEHeader."payment type"::"Staff Claim";
        AIEHeader."On behalf of" := AIE."Account Name";
        AIEHeader."Payment Narration" := AIE."Payment Narration";
        AIEHeader."Shortcut Dimension 1 Code" := AIE."Shortcut Dimension 1 Code";
        AIEHeader."Shortcut Dimension 2 Code" := AIE."Shortcut Dimension 2 Code";
        AIEHeader."Shortcut Dimension 3 Code" := AIE."Shortcut Dimension 3 Code";
        AIEHeader."Created By" := UserId;
        AIEHeader.Insert;

        Sclaimlines.Reset;
        Sclaimlines.SetRange(Sclaimlines.No, AIE."No.");
        if Sclaimlines.FindSet then begin
            repeat
                AIELines.Init;
                AIELines.No := AIEHeader."No.";
                AIELines."Line No" := Sclaimlines."Line No";
                AIELines.Type := Sclaimlines.Type;
                AIELines."Vote Item" := Sclaimlines.Type;
                //AIELines.VALIDATE("Vote Item");
                AIELines.Description := AIE."Payment Narration";
                AIELines."Account Type" := Sclaimlines."Account Type";
                AIELines."Account No" := Sclaimlines."Account No";
                AIELines."Account Name" := Sclaimlines."Account Name";
                AIELines."Applies to Doc. No" := Sclaimlines.No;
                AIELines.Amount := Sclaimlines.Amount;
                AIELines."Net Amount" := Sclaimlines.Amount;
                AIELines.Insert;
            until Sclaimlines.Next = 0;
        end;
        AIE."Payment processed" := true;

        AIE.Modify;

        Message('Staff Claim for  %1 has been created, Kindly send it for approval', AIE."No.");
    end;


    procedure PostPaymentSchedule(Schedule: Record Payments)
    var
        Payments: Record Payments;
        PVLines: Record "PV Lines";
        Resource: Record Resource;
        EmployeePostingGroupX: Record "Employee Posting GroupX";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        if Dialog.Confirm('Are you sure you want to post the Payment Schedule No. ' + Schedule."No." + ' ?', true) then begin
            if Schedule.Status <> Schedule.Status::Released then
                Error('The Payment Schedule No %1 has not been fully approved', Schedule."No.");
            if Schedule.Posted then
                Error('Payment Schedule %1 has been posted', Schedule."No.");
            CMSetup.Get();
            CMSetup.TestField("PS Journal Template");
            CMSetup.TestField("PS Journal Batch Name");
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PS Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PS Journal Batch Name");
            GenJnLine.DeleteAll;

            LineNo := LineNo + 10000;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PS Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PS Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Vendor;
            GenJnLine.Validate("Account Type");
            if EmployeePostingGroupX.Get(Schedule."Posting Group Code") then
                GenJnLine."Account No." := EmployeePostingGroupX."Account No.";
            GenJnLine.Validate(GenJnLine."Account No.");
            GenJnLine."Currency Code" := Schedule."Currency Code";
            GenJnLine.Validate(GenJnLine."Currency Code");
            if Schedule."Posting Date" = 0D then
                Error('You must specify the PS date');
            GenJnLine."Posting Date" := Schedule."Posting Date";
            GenJnLine."Document No." := Schedule."No.";
            GenJnLine."External Document No." := Schedule."No.";
            //Ruth
            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"G/L Account";
            GenJnLine."Bal. Account No." := EmployeePostingGroupX."Expense Account";
            GenJnLine.Validate("Bal. Account No.");
            //GenJnLine.Description:=PV."Payment Narration";
            GenJnLine.Description := Format(Schedule."Payment Narration", 50);
            Schedule.CalcFields("Resources Total Amount");
            GenJnLine.Amount := -Schedule."Resources Total Amount";
            GenJnLine."Amount (LCY)" := -Schedule."Resources Total Amount";
            if GenJnLine.Amount <> 0 then GenJnLine.Insert;
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            VendorLedgerEntry.Reset;
            VendorLedgerEntry.SetRange("Document No.", Schedule."No.");
            if VendorLedgerEntry.FindSet then begin
                Schedule.Posted := true;
                Schedule."Posted By" := UserId;
                Schedule."Posted Date" := Today;
                Schedule."Time Posted" := Time;
                Schedule.Modify;
                Message('The payment schedule %1,has been posted succesfully', Schedule."No.");
            end;

        end;


    end;


    procedure PostCarloan(Sclaims: Record Payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
        TXT001: label 'The car loan has to be fully approved';
        TXT002: label 'Are you sure you want to post the loan request';
        TXT003: label 'The approved car loan amount cannot be zero';
        EmployeePGroups: Record "Employee PGroups";
        TXT004: label 'Complete the setup for the deduction on Employee PGroups';
        TXT005: label 'The car loan %1 was succesfully posted and Payment Voucher created';
        AssignmentMatrixX: Record "Assignment Matrix-X";
    begin
        if Confirm(TXT002, false, Sclaims."No.") = true then begin
            Sclaims.TestField("Posting Date");
            if Sclaims.Status <> Sclaims.Status::Released then
                Error(TXT001, Sclaims."No.");
            Sclaims.TestField(Sclaims.Date);
            Sclaims.TestField(Sclaims.Purpose);
            if Sclaims."Total Loan Amount" = 0 then
                Error(TXT003);

            CMSetup.Get();
            CMSetup.TestField(CMSetup."Car Loan Journal Template");
            CMSetup.TestField(CMSetup."Car Loan Journal Batch Name");
            CMSetup.TestField("Car Loan Temp Acc");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Car Loan Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Car Loan Journal Batch Name");
            GenJnLine.DeleteAll;

            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Car Loan Journal Template";
            Batch.Name := CMSetup."Car Loan Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            LineNo := 1000;

            //create 2 lines
            GenJnlLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Car Loan Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Car Loan Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."Account Type" := GenJnlLine."account type"::Vendor;
            EmployeePGroups.Reset;
            EmployeePGroups.SetRange(Code, Sclaims."Payroll Deduction Code");
            if EmployeePGroups.FindFirst then begin
                GenJnLine."Account No." := EmployeePGroups."G/L Account";
                GenJnLine.Validate("Account No.");
            end else
                Error(TXT004);

            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Car Loan:  ' + Sclaims."Account Name";
            GenJnLine.Amount := Sclaims."Salary Advance";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
            GenJnLine."Bal. Account No." := CMSetup."Car Loan Temp Acc";
            GenJnLine.Validate(Amount);
            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //balancing line
            LineNo := LineNo + 1000;

            //create 2 lines
            GenJnlLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Car Loan Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Car Loan Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."Account Type" := GenJnlLine."account type"::Vendor;
            GenJnLine."Account No." := Sclaims."Loan Vendor";
            GenJnLine.Validate("Account No.");
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Car Loan:  ' + Sclaims."Account Name";
            GenJnLine.Amount := -Sclaims."Salary Advance";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
            GenJnLine."Bal. Account No." := CMSetup."Car Loan Temp Acc";
            GenJnLine.Validate(Amount);
            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            Sclaims.Posted := true;
            Sclaims."Posted By" := UserId;
            Sclaims."Posted Date" := Today;
            Sclaims.Modify;
            //create a deduction for the employee

            AssignmentMatrixX.Init;
            AssignmentMatrixX."Employee No" := Sclaims."Account No.";
            AssignmentMatrixX.Type := AssignmentMatrixX.Type::Deduction;
            AssignmentMatrixX.Code := Sclaims."Payroll Deduction Code";
            AssignmentMatrixX."Payroll Period" := Sclaims."Recovery Month";
            AssignmentMatrixX.Amount := -Sclaims."Monthly Installment";
            AssignmentMatrixX."Opening Balance" := Sclaims."Total Loan Amount";
            AssignmentMatrixX."Closing Balance" := Sclaims."Total Loan Amount" - Sclaims."Monthly Installment";
            AssignmentMatrixX.Validate(Code);
            AssignmentMatrixX.Insert(true);
            CreateCarLoanPaymentVoucher(Sclaims);
            Message(TXT005, Sclaims."No.");
        end;

        //end of staff claim post
    end;

    local procedure CreateCarLoanPaymentVoucher(AdvanceNo: Record Payments)
    var
        Payments: Record Payments;
        PVLines: Record "PV Lines";
        TEXT001: label 'The payment document for the loan request is already created,the No. is :- %1';
        PVNo: Code[30];
        CashMgt: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        Payments.Reset;
        Payments.SetRange("Applies- To Doc No.", AdvanceNo."No.");
        if not Payments.FindSet then begin
            Payments.Init;
            Payments."No." := '';
            PVNo := '';
            // FileNo:='';
            CashMgt.Get();
            CashMgt.TestField("PV Nos");
            if Payments."No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."PV Nos", Payments."No. Series", 0D, PVNo, Payments."No. Series");
            Payments."No." := PVNo;
            Payments."Payment Type" := Payments."payment type"::"Payment Voucher";
            Payments."Document Type" := Payments."document type"::"Payment Voucher";
            Payments."Payment Narration" := AdvanceNo.Purpose;
            Payments."Shortcut Dimension 1 Code" := AdvanceNo."Shortcut Dimension 1 Code";
            Payments."Shortcut Dimension 2 Code" := AdvanceNo."Shortcut Dimension 2 Code";
            Payments."Shortcut Dimension 3 Code" := AdvanceNo."Shortcut Dimension 3 Code";
            Payments."Applies- To Doc No." := AdvanceNo."No.";
            Payments.Date := AdvanceNo.Date;
            Payments.Insert;

            PVLines.Init;
            PVLines.No := Payments."No.";
            PVLines."Account Type" := PVLines."account type"::Vendor;
            PVLines."Account No" := AdvanceNo."Loan Vendor";
            PVLines.Validate("Account No");
            PVLines.Amount := AdvanceNo."Salary Advance";
            PVLines.Insert;
            Page.Run(57001, AdvanceNo, Payments."No.");
        end else
            Error(TEXT001, Payments."No.");
    end;

    [IntegrationEvent(false, false)]

    procedure OnAfterPostSalaryAdvance(Payments: Record Payments)
    begin
    end;

    [IntegrationEvent(false, false)]

    procedure OnAfterPostPymentVoucher(Payments: Record Payments)
    begin
    end;


    procedure CreateStaffClaim(Surrender: Record Payments)
    var
        CashMgt: Record "Cash Management Setup";
        Imprestheaders: Record Payments;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Imprestlines: Record "PV Lines";
        LineNo: Integer;
        UserSetup: Record "User Setup";
        Email: Text;
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        SurrenderNo: Code[30];
        Imprestlines1: Record "Imprest Lines";
    begin
        //window to show progress
        Window.Open('Creating staff claim for Employee:#######1', Surrender."Account Name");
        Window.Update(1, Surrender."Account Name");
        CashMgt.Get;
        //get imprest surrender

        NoSeries := CashMgt."Staff Claim Nos.";
        Email2 := CashMgt."Imprest Email";

        //header
        //create header
        LineNo := 1000;
        Imprestheaders.Init;
        Imprestheaders."No." := NoSeriesMgt.GetNextNo(NoSeries, Imprestheaders.Date, true);
        Imprestheaders.Date := Today;
        Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
        Imprestheaders."Account No." := Surrender."Account No.";
        Imprestheaders.Validate("Account No.");
        Imprestheaders."Account Name" := Surrender."Account Name";
        Imprestheaders."Payment Type" := Imprestheaders."payment type"::"Staff Claim";
        Imprestheaders.Payee := Surrender.Payee;
        Imprestheaders.Job := Surrender.Job;
        Imprestheaders."Job Task No" := Surrender."Job Task No";
        Imprestheaders."Job Task No." := Surrender."Job Task No.";
        Imprestheaders."Currency Code" := Surrender."Currency Code";
        Imprestheaders."Currency Factor" := Surrender."Currency Factor";
        Imprestheaders."Created By" := Surrender."Created By";
        //Imprestheaders."Reference No.":="No.";
        EMp.Reset;
        EMp.SetRange("No.", Imprestheaders."Account No.");
        //sendder
        CMSetup.Get;
        Email2 := CMSetup."Imprest Email";
        Email := EMp."Company E-Mail";
        Imprestheaders.Status := Imprestheaders.Status::Released;
        Imprestheaders."Travel Date" := Surrender."Travel Date";
        Imprestheaders."Payment Narration" := Surrender."Payment Narration";
        Imprestheaders.Validate(Imprestheaders."Travel Date");
        Imprestheaders."Reference No." := Surrender."Reference No.";
        Imprestheaders."On behalf of" := Surrender."On behalf of";
        Imprestheaders."Shortcut Dimension 1 Code" := Surrender."Shortcut Dimension 1 Code";
        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
        Imprestheaders."Shortcut Dimension 2 Code" := Surrender."Shortcut Dimension 2 Code";
        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");
        Imprestheaders."Shortcut Dimension 3 Code" := Surrender."Shortcut Dimension 3 Code";
        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 3 Code");
        Imprestheaders."Shortcut Dimension 4 Code" := Surrender."Shortcut Dimension 4 Code";
        Imprestheaders."Dimension Set ID" := Surrender."Dimension Set ID";
        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 4 Code");
        Imprestheaders.Insert;
        //get surrender lines greater than 0
        Imprestlines1.Reset;
        Imprestlines1.SetRange(No, Surrender."No.");
        if Imprestlines1.FindSet then begin
            repeat
                if Imprestlines1."Remaining Amount" < 0 then begin
                    Imprestlines."Line No" := Imprestlines1."Line No";
                    Imprestlines.No := Imprestheaders."No.";
                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                    Imprestlines."Account No" := Imprestlines1."Account No.";
                    Imprestlines.Validate(Imprestlines."Account No");
                    Imprestlines.Description := Imprestlines1."Account Name";
                    Imprestlines.Amount := Imprestlines1."Remaining Amount" * -1;
                    Imprestlines.Validate(Amount);

                    Imprestlines."Currency Code" := Imprestlines1."Currency Code";

                    Imprestlines.Insert;
                end;
                Imprestlines1."Remaining Amount" := 0;
                Imprestlines1."Remaining Amount LCY" := 0;
                Imprestlines1.Modify(true);
            until Imprestlines1.Next = 0;

        end;
        //send email to participants
        Imprestheaders.CalcFields("Total Amount LCY");
        CashMgt.Get;
        if CashMgt."Send Email Notification" = true then begin
            //SMTP.Create(COMPANYNAME + 'Staff Claim Processing', Email2,
            // Email, 'Staff Claim ' + 'No: ' + Imprestheaders."No.",
            // 'Dear ' + Surrender.Payee + ',<BR><BR>' +
            // 'Your imprest surrender no. <b>' + ' ' + Surrender."No." + '</b> has a staff claim undergoing processing no:<b>' + ' ' + Imprestheaders."No." +
            // '</b><BR><BR>Total refund amount is <b>' + Format(Imprestheaders."Total Amount LCY") + '</b>.' +
            // '</b><BR> Kindly incase of any queries,reach out to the Finance department for correction.<BR><BR>', true);
            //SMTP.AddCC(Email2);
            //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
            //SMTP.Send();
        end;
        Page.Run(57109, Imprestheaders);
        Window.Close;



    end;


    procedure CreateSpecialImprestSurrender(Payments: Record Payments)
    var
        Memoheaders: Record "Imprest Memo";
        OtherCost: Record "Other Costs";
        SafariMembers: Record "Project Members";
        CashMgt: Record "Cash Management Setup";
        Imprestheaders: Record Payments;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Imprestlines: Record "Imprest Lines";
        glName: Record "G/L Account";
        ProjectTeam: Record "Project Members";
        LineNo: Integer;
        UserSetup: Record "User Setup";
        Email: Text;
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        ImprestOther: Decimal;
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        SurrenderNo: Code[30];
        ImprestVoucherLines1: Record "Imprest Voucher Lines";
        PCash: Record Payments;
        PVLines: Record "PV Lines";
        PVlines1: Record "PV Lines";
    begin
        Payments.Reset;
        Payments.SetRange("No.", Payments."No.");
        if Payments.FindSet then begin
            PCash.Init;
            PCash.TransferFields(Payments);
            PCash.Status := PCash.Status::Open;
            PCash."Payment Type" := PCash."payment type"::"Petty Cash Surrender";
            if PCash.Insert(true) then begin
                PVLines.Reset;
                PVLines.SetRange(No, Payments."No.");
                if PVLines.FindSet then begin
                    repeat
                        PVlines1.Init;
                        PVlines1.TransferFields(PVLines);
                        PVlines1.No := PCash."No.";
                        PVlines1.Insert;
                    until PVLines.Next = 0;
                end;
            end;


        end;
    end;


    procedure SuggestReconcilingItems(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    var
        ReconciliationItems: Record "Reconciliation Items";
        BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
        BankAccReconciliationLine1: Record "Bank Acc. Reconciliation Line";
        LineNo: Integer;
        TXT001: label 'Entries populated succesfully';
        BankAccReconciliationLine2: Record "Bank Acc. Reconciliation Line";
    begin
        BankAccReconciliationLine1.Reset;
        BankAccReconciliationLine1.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
        if BankAccReconciliationLine1.FindLast then begin
            LineNo := BankAccReconciliationLine1."Statement Line No.";
        end;
        ReconciliationItems.Reset;
        ReconciliationItems.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
        ReconciliationItems.SetRange(Reconciled, false);
        if ReconciliationItems.FindSet then begin
            repeat
                //ensure suggestion twice cannot happen
                BankAccReconciliationLine2.Reset;
                BankAccReconciliationLine2.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
                BankAccReconciliationLine2.SetRange("Statement No.", BankAccReconciliation."Statement No.");
                BankAccReconciliationLine2.SetRange("Reconciliation ID", ReconciliationItems."Entry No.");
                if not BankAccReconciliationLine2.FindFirst then begin
                    //get statement no.
                    BankAccReconciliationLine."Statement No." := BankAccReconciliation."Statement No.";
                    BankAccReconciliationLine."Bank Account No." := BankAccReconciliation."Bank Account No.";
                    BankAccReconciliationLine."Statement Type" := BankAccReconciliationLine."statement type"::"Bank Reconciliation";
                    BankAccReconciliationLine."Statement Line No." := LineNo + 1;
                    BankAccReconciliationLine."Statement Amount" := ReconciliationItems."Statement Amount";
                    BankAccReconciliationLine."Document No." := ReconciliationItems."Document No.";
                    BankAccReconciliationLine.Description := ReconciliationItems.Description;
                    BankAccReconciliationLine."Transaction Date" := ReconciliationItems."Transaction Date";
                    BankAccReconciliationLine."Reconciliation ID" := ReconciliationItems."Entry No.";
                    BankAccReconciliationLine.Insert(true);
                    LineNo += 1;
                end;
            until ReconciliationItems.Next = 0;
            Message(TXT001);
        end
    end;


    procedure CloseReconcilingItems(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    var
        ReconciliationItems: Record "Reconciliation Items";
        BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
        ReconciliationItems1: Record "Reconciliation Items";
        LineNo: Integer;
        TXT001: label 'Entries populated succesfully';
        BankAccReconciliationLine1: Record "Bank Acc. Reconciliation Line";
        ReconciliationItemsEntry: Record "Reconciliation Items Entry";
    begin
        BankAccReconciliationLine.Reset;
        BankAccReconciliationLine.SetRange("Statement No.", BankAccReconciliation."Statement No.");
        BankAccReconciliationLine.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
        if BankAccReconciliationLine.FindSet then begin
            if ((BankAccReconciliationLine."Reconciliation ID" <> 0) and (BankAccReconciliationLine."Applied Amount" <> 0)) then begin
                repeat

                    ReconciliationItems1.Reset;
                    ReconciliationItems1.SetRange("Entry No.", BankAccReconciliationLine."Reconciliation ID");
                    if ReconciliationItems1.FindFirst then begin
                        ReconciliationItems1.Reconciled := true;
                        ReconciliationItems1."Reconciled By" := UserId;
                        ReconciliationItems1."Reconciled On" := CurrentDatetime;
                        ReconciliationItems1.Modify(true);
                    end;
                    //close ledger too

                    ReconciliationItemsEntry.Reset;
                    ReconciliationItemsEntry.SetRange("initial Entry No.", BankAccReconciliationLine."Reconciliation ID");
                    ReconciliationItemsEntry.SetRange("Statement Date", BankAccReconciliation."Statement Date");
                    if ReconciliationItemsEntry.FindFirst then begin
                        ReconciliationItemsEntry.Reconciled := true;
                        ReconciliationItemsEntry."Reconciled By" := UserId;
                        ReconciliationItemsEntry."Reconciled On" := CurrentDatetime;
                        ReconciliationItemsEntry.Modify(true);
                    end;

                until BankAccReconciliationLine.Next = 0;
            end
        end;


    end;


    procedure PopulateReconcilingItems(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    var
        ReconciliationItems: Record "Reconciliation Items";
        BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
        ReconciliationItems1: Record "Reconciliation Items";
        LineNo: Integer;
        TXT001: label 'Entries populated succesfully';
        BankAccReconciliationLine1: Record "Bank Acc. Reconciliation Line";
        ReconciliationItems2: Record "Reconciliation Items";
        ReconciliationItemsEntry: Record "Reconciliation Items Entry";
        ReconciliationEntry2: Record "Reconciliation Items Entry";
        LineNo1: Integer;
    begin
        ReconciliationItems1.Reset;
        ReconciliationItems1.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
        if ReconciliationItems1.FindLast then begin
            LineNo := ReconciliationItems1."Entry No.";
        end;

        ReconciliationEntry2.Reset;
        ReconciliationEntry2.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
        if ReconciliationEntry2.FindLast then begin
            LineNo1 := ReconciliationEntry2."Entry No.";
        end;

        BankAccReconciliationLine.Reset;
        BankAccReconciliationLine.SetRange("Statement No.", BankAccReconciliation."Statement No.");
        BankAccReconciliationLine.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
        if BankAccReconciliationLine.FindSet then begin
            repeat
                if ((BankAccReconciliationLine."Reconciliation ID" <> 0) and (BankAccReconciliationLine."Applied Amount" = 0)) then begin
                    //introduce checker if the entry no. already exists.
                    ReconciliationItems2.Reset;
                    ReconciliationItems2.SetRange("Entry No.", BankAccReconciliationLine."Reconciliation ID");
                    if ReconciliationItems2.FindFirst then begin
                        //insert in entry table if exists
                        ReconciliationItemsEntry."Entry No." := LineNo1 + 1;
                        ReconciliationItemsEntry."Bank Account No." := BankAccReconciliation."Bank Account No.";
                        ReconciliationItemsEntry."Document No." := BankAccReconciliationLine."Document No.";
                        ReconciliationItemsEntry."Transaction Date" := BankAccReconciliationLine."Transaction Date";
                        ReconciliationItemsEntry.Description := BankAccReconciliationLine.Description;
                        ReconciliationItemsEntry."Statement Amount" := BankAccReconciliationLine."Statement Amount";
                        ReconciliationItemsEntry.Reconciled := false;
                        ReconciliationItemsEntry."Created By" := UserId;
                        ReconciliationItemsEntry."Created On" := CurrentDatetime;
                        ReconciliationItemsEntry."initial Entry No." := BankAccReconciliationLine."Reconciliation ID";
                        ReconciliationItemsEntry."Statement Date" := BankAccReconciliation."Statement Date";
                        ReconciliationItemsEntry.Insert(true);
                        LineNo1 += 1;
                        BankAccReconciliationLine1.Reset;
                        BankAccReconciliationLine1.SetRange("Statement No.", BankAccReconciliationLine."Statement No.");
                        BankAccReconciliationLine1.SetRange("Bank Account No.", BankAccReconciliationLine."Bank Account No.");
                        BankAccReconciliationLine1.SetRange("Statement Line No.", BankAccReconciliationLine."Statement Line No.");
                        if BankAccReconciliationLine1.FindFirst then begin
                            BankAccReconciliationLine1.Delete;

                        end;
                    end;

                    if ((BankAccReconciliationLine."Reconciliation ID" = 0) and (BankAccReconciliationLine."Applied Amount" = 0)) then begin
                        ReconciliationItems."Entry No." := LineNo + 1;
                        ReconciliationItems."Bank Account No." := BankAccReconciliation."Bank Account No.";
                        ReconciliationItems."Document No." := BankAccReconciliationLine."Document No.";
                        ReconciliationItems."Transaction Date" := BankAccReconciliationLine."Transaction Date";
                        ReconciliationItems.Description := BankAccReconciliationLine.Description;
                        ReconciliationItems."Statement Amount" := BankAccReconciliationLine."Statement Amount";
                        ReconciliationItems.Reconciled := false;
                        ReconciliationItems."Created By" := UserId;
                        ReconciliationItems."Created On" := CurrentDatetime;
                        ReconciliationItems.Insert(true);
                        LineNo += 1;
                        BankAccReconciliationLine1.Reset;
                        BankAccReconciliationLine1.SetRange("Statement No.", BankAccReconciliationLine."Statement No.");
                        BankAccReconciliationLine1.SetRange("Bank Account No.", BankAccReconciliationLine."Bank Account No.");
                        BankAccReconciliationLine1.SetRange("Statement Line No.", BankAccReconciliationLine."Statement Line No.");
                        if BankAccReconciliationLine1.FindFirst then begin
                            BankAccReconciliationLine1.Delete;

                        end;
                    end;
                end;

            until BankAccReconciliationLine.Next = 0;
            Message(TXT001);
        end;


    end;
}

