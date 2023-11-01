#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54029 "Money Market Purchase"
{
    PageType = Card;
    SourceTable = Payments1;

    layout
    {
        area(content)
        {
            group("Purchase Setup")
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Payement Type"; Rec."Payement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payement Type field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Broker; Rec.Broker)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Broker field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Intitution Name"; Rec."Intitution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Intitution Name field.';
                }
                field("Investment No"; Rec."Investment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment No field.';
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Custodian Code field.';
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Posted field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Code field.';
                }
                field("Withholding Tax Amount"; Rec."Withholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax Amount field.';
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
            }
            group("Purchase Details")
            {
                field("No. Of Units"; Rec."No. Of Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Units field.';
                }
                field("Gross Amount"; Rec."Gross Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross Amount field.';
                }
                field("Dirty Price"; Rec."Dirty Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dirty Price field.';
                }
                field("Clean Price"; Rec."Clean Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clean Price field.';
                }
                field("Cum-Interest Purchase"; Rec."Cum-Interest Purchase")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cum-Interest Purchase field.';
                }
                field("Broker Fees"; Rec."Broker Fees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Broker Fees field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax Code field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = post;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin

                    if Confirm('Are you sure you would like to POST this transaction?', false) = true then begin


                        if Rec.Posted = true then
                            Error('Transaction already posted!!');


                        TotalInvestment := 0;
                        FundsAvailable := 0;
                        InvestmentRec.Get(Rec."Investment No");
                        "RBA Class" := InvestmentRec."RBA Class";
                        Funds := InvestmentRec."Custodian Code";
                        //MESSAGE('%1%2',"RBA Class",Funds);


                        /*IF Dimensions.GET('FUND',Funds) THEN BEGIN
                         Dimensions.SETRANGE(Dimensions."Date Filter",0D,Date);

                         ////Dimensions.CALCFIELDS(Dimensions.Inflow1,Dimensions.Outflow1);
                        // FundsAvailable:=Dimensions.Inflow1-Dimensions.Outflow1;
                        // MESSAGE('Total Funds Available=%1',FundsAvailable);
                        END;*/


                        TotalPerClass := 0;
                        InvestRec.Reset;
                        InvestRec.SetRange(InvestRec."RBA Class", "RBA Class");
                        InvestRec.SetRange(InvestRec."Date Filter", 0D, Rec.Date);

                        InvestRec.SetRange(InvestRec."Custodian Code", Funds);
                        if InvestRec.Find('-') then
                            repeat
                                InvestRec.CalcFields(InvestRec."Acquisition Cost");
                                TotalPerClass := TotalPerClass + InvestRec."Acquisition Cost";
                            until InvestRec.Next = 0;
                        //MESSAGE('total class %1 =%2',"RBA Class",TotalPerClass);

                        TotalPerClass := TotalPerClass + Rec.Amount;
                        //MESSAGE('total class %1 =%2',"RBA Class",TotalPerClass);
                        //IF TotalInvestment<>0 THEN
                        //PerCentagePerClass:=(TotalPerClass/TotalInvestment)*100;


                        //kugun
                        if FundsAvailable <> 0 then
                            PerCentagePerClass := (TotalPerClass / FundsAvailable) * 100;
                        //MESSAGE(PerCentagePerClass);
                        //MESSAGE('Percentage %1 =%2',"RBA Class",PerCentagePerClass);

                        if RBA.Get("RBA Class") then begin
                            //MESSAGE('Percentage %1 =%2',"RBA Class",RBA."% Recommended");
                            RBARecomended := RBA."% Recommended";
                            if PerCentagePerClass > RBARecomended then
                                Error('You will exceed the RBA Limit for this Investment.Please check!!');
                        end;

                        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                        GenJnlLine.Reset;
                        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'PAYMENTS');
                        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'NONPRPAY');
                        GenJnlLine.DeleteAll;




                        LineNo := 0;




                        if Rec."Pay Mode" = 'CHEQUE' then begin
                            Rec.TestField("Paying Bank Account");
                        end;
                        Rec.TestField("Transaction Name");
                        Rec.TestField("Pay Mode");
                        //TESTFIELD(Payee);
                        Rec.TestField(Amount);
                        Rec.TestField("VAT Code");
                        Rec.TestField("Withholding Tax Code");
                        //TESTFIELD("Global Dimension 1 Code");
                        Rec.TestField("Fund Code");


                        //BANK
                        if Rec."Pay Mode" = 'CASH' then begin

                            //CashierLinks.RESET;
                            //CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
                            //IF CashierLinks.FIND('-') THEN BEGIN

                            //CASH
                            LineNo := LineNo + 1000;
                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'PAYMENTS';
                            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                            GenJnlLine."Journal Batch Name" := 'NONPRPAY';
                            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                            GenJnlLine."Line No." := LineNo;
                            GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                            GenJnlLine."Account No." := Rec."Paying Bank Account";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            GenJnlLine."Posting Date" := Rec.Date;
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine."Currency Code" := Rec.Currency;
                            GenJnlLine."External Document No." := Rec."Cheque No";
                            GenJnlLine.Amount := -(Rec.Amount);
                            //MESSAGE('CASH =%1',GenJnlLine.Amount);
                            GenJnlLine.Validate(GenJnlLine.Amount);
                            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                            GenJnlLine."Bal. Account No." := '';
                            GenJnlLine.Description := Rec."Transaction Name";
                            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                            /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                            GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                            GenJnlLine."Dimension Set ID" := 0;

                            GenJnlLine."Fund Code" := Rec."Fund Code";
                            GenJnlLine."Custodian Code" := Rec."Custodian Code";
                            GenJnlLine.Validate(GenJnlLine."Fund Code");
                            GenJnlLine.Validate(GenJnlLine."Custodian Code");

                            GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
                            GenJnlLine."Applies-to Doc. No." := Rec."Apply to";
                            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                            GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                            GenJnlLine."Investment Code" := Rec."Investment No";
                            GenJnlLine."Investment Transcation Type" := Rec."Investment Transcation Type";
                            GenJnlLine."No. Of Units" := Rec."No. Of Units";
                            GenJnlLine.Payee := Rec.Payee;
                            GenJnlLine."GL Code" := Rec."Control Ac";
                            if GenJnlLine.Amount <> 0 then
                                GenJnlLine.Insert;

                            //END
                            //ELSE BEGIN
                            //ERROR('Please link the user/cashier to a collection account before proceeding.');
                            //END;

                        end;

                        if Rec."Pay Mode" = 'EFT' then begin
                            //EFT
                            LineNo := LineNo + 1000;
                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'PAYMENTS';
                            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                            GenJnlLine."Journal Batch Name" := 'NONPRPAY';
                            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                            GenJnlLine."Line No." := LineNo;
                            GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                            GenJnlLine."Account No." := Rec."Paying Bank Account";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            //GenJnlLine."Bank Payment Type":=GenJnlLine."Bank Payment Type"::"Manual Check";
                            GenJnlLine."Posting Date" := Rec.Date;
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine."External Document No." := Rec."Cheque No";
                            GenJnlLine."Currency Code" := Rec.Currency;
                            GenJnlLine.Amount := -Rec.Amount;
                            //MESSAGE('EFT =%1',GenJnlLine.Amount);
                            GenJnlLine.Validate(GenJnlLine.Amount);
                            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                            GenJnlLine."Bal. Account No." := '';
                            GenJnlLine.Description := Rec."Transaction Name";
                            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                            /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                            GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                            GenJnlLine."Fund Code" := Rec."Fund Code";
                            GenJnlLine."Custodian Code" := Rec."Custodian Code";
                            GenJnlLine.Validate(GenJnlLine."Fund Code");
                            GenJnlLine.Validate(GenJnlLine."Custodian Code");

                            GenJnlLine."Investment Code" := Rec."Investment No";
                            GenJnlLine."Investment Transcation Type" := Rec."Investment Transcation Type";
                            GenJnlLine."No. Of Units" := Rec."No. Of Units";
                            GenJnlLine.Payee := Rec.Payee;
                            GenJnlLine."GL Code" := Rec."Control Ac";
                            if GenJnlLine.Amount <> 0 then
                                GenJnlLine.Insert;
                        end;


                        if Rec."Pay Mode" = 'CHEQUE' then begin
                            //CHEQUE
                            LineNo := LineNo + 1000;
                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'PAYMENTS';
                            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                            GenJnlLine."Journal Batch Name" := 'NONPRPAY';
                            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                            GenJnlLine."Line No." := LineNo;
                            GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                            GenJnlLine."Account No." := Rec."Paying Bank Account";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            GenJnlLine."Bank Payment Type" := GenJnlLine."bank payment type"::"Computer Check";
                            GenJnlLine."Posting Date" := Rec.Date;
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine."External Document No." := Rec."Cheque No";
                            GenJnlLine."Currency Code" := Rec.Currency;
                            GenJnlLine.Amount := -Rec.Amount;
                            //MESSAGE('CHEQUE =%1',GenJnlLine.Amount);
                            GenJnlLine.Validate(GenJnlLine.Amount);
                            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                            GenJnlLine."Bal. Account No." := '';
                            GenJnlLine.Description := Rec."Transaction Name";
                            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                            /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                            GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";*/

                            GenJnlLine."Fund Code" := Rec."Fund Code";
                            GenJnlLine."Custodian Code" := Rec."Custodian Code";
                            GenJnlLine.Validate(GenJnlLine."Fund Code");
                            GenJnlLine.Validate(GenJnlLine."Custodian Code");

                            GenJnlLine."Investment Code" := Rec."Investment No";
                            GenJnlLine."Investment Transcation Type" := Rec."Investment Transcation Type";
                            /*GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                            GenJnlLine."No. Of Units" := Rec."No. Of Units";
                            GenJnlLine."GL Code" := Rec."Control Ac";
                            GenJnlLine.Payee := Rec.Payee;
                            if GenJnlLine.Amount <> 0 then
                                GenJnlLine.Insert;
                        end;

                        TarriffCodes.Reset;
                        TarriffCodes.SetRange(TarriffCodes.Code, Rec."VAT Code");
                        if TarriffCodes.Find('-') then begin
                            TarriffCodes.TestField(TarriffCodes."G/L Account");
                            LineNo := LineNo + 1000;
                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'PAYMENTS';
                            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                            GenJnlLine."Journal Batch Name" := 'NONPRPAY';
                            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                            GenJnlLine."Line No." := LineNo;
                            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                            GenJnlLine."Account No." := TarriffCodes."G/L Account";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            GenJnlLine."Posting Date" := Rec.Date;
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine."Currency Code" := Rec.Currency;
                            GenJnlLine.Amount := -Rec."VAT Amount";
                            GenJnlLine.Validate(GenJnlLine.Amount);
                            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                            GenJnlLine."Bal. Account No." := '';
                            GenJnlLine.Description := 'VAT';
                            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                            /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                            GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";*/
                            GenJnlLine."Investment Code" := Rec."Investment No";
                            GenJnlLine."Investment Transcation Type" := Rec."Investment Transcation Type";
                            /*GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                            GenJnlLine."Fund Code" := Rec."Fund Code";
                            GenJnlLine."Custodian Code" := Rec."Custodian Code";
                            GenJnlLine.Validate(GenJnlLine."Fund Code");
                            GenJnlLine.Validate(GenJnlLine."Custodian Code");

                            GenJnlLine."No. Of Units" := Rec."No. Of Units";
                            GenJnlLine.Payee := Rec.Payee;
                            GenJnlLine."GL Code" := Rec."Control Ac";


                            if GenJnlLine.Amount <> 0 then
                                GenJnlLine.Insert;
                        end;

                        TarriffCodes.Reset;
                        TarriffCodes.SetRange(TarriffCodes.Code, Rec."Withholding Tax Code");
                        if TarriffCodes.Find('-') then begin
                            TarriffCodes.TestField(TarriffCodes."G/L Account");
                            LineNo := LineNo + 1000;
                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'PAYMENTS';
                            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                            GenJnlLine."Journal Batch Name" := 'NONPRPAY';
                            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                            GenJnlLine."Line No." := LineNo;
                            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                            GenJnlLine."Account No." := TarriffCodes."G/L Account";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            GenJnlLine."Posting Date" := Rec.Date;
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine."Currency Code" := Rec.Currency;
                            GenJnlLine.Amount := -Rec."Withholding Tax Amount";
                            GenJnlLine.Validate(GenJnlLine.Amount);
                            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                            GenJnlLine."Bal. Account No." := '';
                            GenJnlLine.Description := 'Withholding Tax';
                            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                            /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/
                            GenJnlLine."Fund Code" := Rec."Fund Code";
                            GenJnlLine."Custodian Code" := Rec."Custodian Code";
                            GenJnlLine.Validate(GenJnlLine."Fund Code");
                            GenJnlLine.Validate(GenJnlLine."Custodian Code");

                            GenJnlLine."Investment Code" := Rec."Investment No";
                            GenJnlLine."Investment Transcation Type" := Rec."Investment Transcation Type";
                            GenJnlLine."No. Of Units" := Rec."No. Of Units";
                            GenJnlLine."GL Code" := Rec."Control Ac";
                            GenJnlLine.Payee := Rec.Payee;
                            if GenJnlLine.Amount <> 0 then
                                GenJnlLine.Insert;
                        end;

                        if Rec.Multiple = false then begin
                            LineNo := LineNo + 1000;
                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'PAYMENTS';
                            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                            GenJnlLine."Journal Batch Name" := 'NONPRPAY';
                            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                            GenJnlLine."Line No." := LineNo;
                            GenJnlLine."Account Type" := Rec."Account Type";
                            GenJnlLine."Account No." := Rec."Account No.";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            GenJnlLine."Posting Date" := Rec.Date;
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine."External Document No." := Rec."Cheque No";
                            GenJnlLine."Currency Code" := Rec.Currency;

                            InvestRec.Get(Rec."Investment No");
                            if InvestRec."Investment Type" = '05' then
                                GenJnlLine.Amount := Rec.Amount;
                            if InvestRec."Investment Type" = '04' then
                                GenJnlLine.Amount := Rec.Amount;
                            if InvestRec."Investment Type" = '07' then
                                GenJnlLine.Amount := Rec.Amount;

                            //END ELSE BEGIN
                            // GenJnlLine.Amount:=Amount;
                            //END;
                            if InvestRec."Investment Type" = '06' then
                                GenJnlLine.Amount := Rec.Amount - Rec."Cum-Interest Purchase";


                            GenJnlLine.Validate(GenJnlLine.Amount);
                            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                            GenJnlLine."Bal. Account No." := '';
                            GenJnlLine.Description := Rec."Investment No" + ' ' + Rec."Transaction Name";
                            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                            /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                            GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                            GenJnlLine."Fund Code" := Rec."Fund Code";
                            GenJnlLine."Custodian Code" := Rec."Custodian Code";
                            GenJnlLine.Validate(GenJnlLine."Fund Code");
                            GenJnlLine.Validate(GenJnlLine."Custodian Code");

                            GenJnlLine."Investment Code" := Rec."Investment No";
                            GenJnlLine."Investment Transcation Type" := Rec."Investment Transcation Type";
                            GenJnlLine."No. Of Units" := Rec."No. Of Units";
                            GenJnlLine.Payee := Rec.Payee;

                            //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                            //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                            GenJnlLine."Applies-to Doc. No." := Rec."Apply to";
                            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                            GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                            //END;
                            if GenJnlLine.Amount <> 0 then
                                GenJnlLine.Insert;


                            //Interest Account
                            LineNo := LineNo + 1000;
                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'PAYMENTS';
                            GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                            GenJnlLine."Journal Batch Name" := 'NONPRPAY';
                            GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                            GenJnlLine."Line No." := LineNo;

                            GenJnlLine."Account Type" := Rec."Account Type";

                            if InvestmentRec.Get(Rec."Investment No") then
                                if InvestmentPG.Get(InvestmentRec."Investment Posting Group") then
                                    GenJnlLine."Account No." := InvestmentPG."Interest Receivable Account";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            GenJnlLine."Posting Date" := Rec.Date;
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine."External Document No." := Rec."Cheque No";
                            GenJnlLine."Currency Code" := Rec.Currency;
                            GenJnlLine.Amount := Rec."Cum-Interest Purchase";
                            GenJnlLine.Validate(GenJnlLine.Amount);
                            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                            GenJnlLine."Bal. Account No." := '';
                            GenJnlLine.Description := 'Cum-Interest Purchase';
                            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                            /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                            GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                            GenJnlLine."Fund Code" := Rec."Fund Code";
                            GenJnlLine."Custodian Code" := Rec."Custodian Code";
                            GenJnlLine.Validate(GenJnlLine."Fund Code");
                            GenJnlLine.Validate(GenJnlLine."Custodian Code");

                            GenJnlLine."Investment Code" := Rec."Investment No";
                            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Interest;
                            GenJnlLine."No. Of Units" := Rec."No. Of Units";
                            GenJnlLine.Payee := Rec.Payee;
                            //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                            GenJnlLine."Applies-to Doc. No." := Rec."Apply to";
                            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                            GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                            if GenJnlLine.Amount <> 0 then
                                GenJnlLine.Insert;


                        end;


                        if Rec.Multiple = true then begin
                            //Insert Multiple Lines
                            PaymentLines.Reset;
                            PaymentLines.SetRange(PaymentLines."PV No", Rec.No);
                            if PaymentLines.Find('-') then
                                repeat
                                    //MESSAGE('%1',PaymentLines.Description);
                                    LineNo := LineNo + 1000;
                                    GenJnlLine.Init;
                                    GenJnlLine."Journal Template Name" := 'PAYMENTS';
                                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                                    GenJnlLine."Journal Batch Name" := 'NONPRPAY';
                                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                                    GenJnlLine."Line No." := LineNo;
                                    GenJnlLine."Account Type" := PaymentLines."Account Type";
                                    GenJnlLine."Account No." := PaymentLines."Account No.";
                                    GenJnlLine.Validate(GenJnlLine."Account No.");
                                    GenJnlLine."Posting Date" := Rec.Date;
                                    GenJnlLine."Document No." := Rec.No;
                                    GenJnlLine."External Document No." := Rec."Cheque No";
                                    GenJnlLine."Currency Code" := Rec.Currency;
                                    GenJnlLine.Amount := PaymentLines.Amount;
                                    GenJnlLine.Validate(GenJnlLine.Amount);
                                    GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                                    GenJnlLine."Bal. Account No." := '';
                                    GenJnlLine.Description := PaymentLines.Description;
                                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                                    /*GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                                    GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                                    GenJnlLine."Fund Code" := Rec."Fund Code";
                                    GenJnlLine."Custodian Code" := Rec."Custodian Code";
                                    GenJnlLine.Validate(GenJnlLine."Fund Code");
                                    GenJnlLine.Validate(GenJnlLine."Custodian Code");

                                    GenJnlLine."Investment Code" := Rec."Investment No";
                                    GenJnlLine."Investment Transcation Type" := Rec."Investment Transcation Type";
                                    GenJnlLine."No. Of Units" := Rec."No. Of Units";

                                    //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                                    GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
                                    GenJnlLine."Applies-to Doc. No." := Rec."Apply to";
                                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                                    GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                                    //END;
                                    GenJnlLine.Payee := Rec.Payee;
                                    if GenJnlLine.Amount <> 0 then
                                        GenJnlLine.Insert;

                                until PaymentLines.Next = 0;

                        end;




                        LineNo := LineNo + 1000;
                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := 'PAYMENTS';
                        GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                        GenJnlLine."Journal Batch Name" := 'NONPRPAY';
                        GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Account Type" := Rec."Account Type";
                        GenJnlLine."Account No." := Rec."Account No.";
                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := Rec.Date;
                        GenJnlLine."Document No." := Rec.No;
                        GenJnlLine."Currency Code" := Rec.Currency;
                        GenJnlLine.Amount := Rec."VAT Amount";
                        GenJnlLine.Validate(GenJnlLine.Amount);
                        GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                        GenJnlLine."Bal. Account No." := '';
                        GenJnlLine.Description := 'VAT';
                        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");

                        /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                        GenJnlLine."Shortcut Dimension 2 Code":="Fund Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/
                        GenJnlLine."Fund Code" := Rec."Fund Code";
                        GenJnlLine."Custodian Code" := Rec."Custodian Code";
                        GenJnlLine.Validate(GenJnlLine."Fund Code");
                        GenJnlLine.Validate(GenJnlLine."Custodian Code");

                        //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN
                        GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
                        GenJnlLine."Applies-to Doc. No." := Rec."Apply to";
                        GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                        GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                        //END;
                        GenJnlLine."Investment Code" := Rec."Investment No";
                        GenJnlLine."Investment Transcation Type" := Rec."Investment Transcation Type";
                        GenJnlLine."No. Of Units" := Rec."No. Of Units";
                        GenJnlLine.Payee := Rec.Payee;

                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert;

                        LineNo := LineNo + 1000;
                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := 'PAYMENTS';
                        GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                        GenJnlLine."Journal Batch Name" := 'NONPRPAY';
                        GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Account Type" := Rec."Account Type";
                        GenJnlLine."Account No." := Rec."Account No.";
                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := Rec.Date;
                        GenJnlLine."Document No." := Rec.No;
                        GenJnlLine."Currency Code" := Rec.Currency;
                        GenJnlLine.Amount := Rec."Withholding Tax Amount";
                        GenJnlLine.Validate(GenJnlLine.Amount);
                        GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";
                        GenJnlLine."Bal. Account No." := '';
                        GenJnlLine.Description := 'Withholding Tax';
                        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                        /*GenJnlLine."Shortcut Dimension 1 Code":="Custodian Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");*/
                        //IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Vendor THEN BEGIN

                        GenJnlLine."Fund Code" := Rec."Fund Code";
                        GenJnlLine."Custodian Code" := Rec."Custodian Code";
                        GenJnlLine.Validate(GenJnlLine."Fund Code");
                        GenJnlLine.Validate(GenJnlLine."Custodian Code");

                        GenJnlLine."Applies-to Doc. Type" := GenJnlLine."applies-to doc. type"::Invoice;
                        GenJnlLine."Applies-to Doc. No." := Rec."Apply to";
                        GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                        GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                        //END;
                        GenJnlLine."Investment Code" := Rec."Investment No";
                        GenJnlLine."Investment Transcation Type" := Rec."Investment Transcation Type";
                        GenJnlLine."No. Of Units" := Rec."No. Of Units";
                        GenJnlLine.Payee := Rec.Payee;
                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert;

                        /*
                        IF "Payment Type"="Payment Type"::"Petty Cash" THEN BEGIN
                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);

                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                        IF GenJnlLine.FIND('-') THEN
                        EXIT;

                        END;
                        */



                        /*
                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);

                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'PAYMENTS');
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'NONPRPAY');
                        IF GenJnlLine.FIND('-') THEN
                        EXIT;
                        */

                        //MESSAGE('Documents sent to cheque printing successfully.');

                        //END;
                        //END;




                        GenJnlLine.Reset;
                        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'PAYMENTS');
                        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'NONPRPAY');
                        GenJnlLine.SetRange(GenJnlLine."Document No.", Rec.No);
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);


                        if InvestmentRec.Get(Rec."Investment No") then begin

                            InvestmentRec."Face Value" := Rec."Gross Amount";
                            InvestmentRec.Modify;
                        end;

                        Rec.Posted := true;
                        Rec."Date Posted" := Today;
                        Rec."Time Posted" := Time;
                        Rec."Posted By" := UserId;
                        Rec.Modify;




                        Rec.Status := Rec.Status::"Cheque Printing";
                        Rec.Modify;

                        CurrPage.Close;

                    end;

                end;
            }
        }
    }

    var
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tarriff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        LineNo: Integer;
        CustLedger: Record "Vendor Ledger Entry";
        CustLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        Payments: Record Payments1;
        InvestmentRec: Record "Investment Asset";
        InvestmentPG: Record "Investment Posting Group";
        PaymentLines: Record "Payments Line1";
        RBA: Record "RBA Compliance";
        "RBA Class": Code[10];
        Funds: Code[10];
        Dimensions: Record "Dimension Value";
        FundsAvailable: Decimal;
        InvestRec: Record "Investment Asset";
        TotalInvestment: Decimal;
        TotalPerClass: Decimal;
        PerCentagePerClass: Decimal;
        RBARecomended: Decimal;
        BankAcc: Record "Bank Account";
}

#pragma implicitwith restore

