report 54000 "Interest Calculations"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Interest Calculations.rdlc';

    dataset
    {
        dataitem(Mortgage;"Investment Asset")
        {

            trigger OnAfterGetRecord()
            begin

                 ExpectedInterest.Reset;
                 ExpectedInterest.SetCurrentKey(ExpectedInterest."Posting Date",ExpectedInterest."Document No.");
                 ExpectedInterest.SetRange(ExpectedInterest."Investment Code",Mortgage."No.");
                 if ExpectedInterest.Find('-') then
                 MorgageDate:=ExpectedInterest."Posting Date";
                 MortgageInterestDate:=CalcDate('1M',DMY2Date(1,Date2DMY(MorgageDate,2),Date2DMY(MorgageDate,3)));

                 if InterestCalcDate<=MortgageInterestDate then
                 CurrReport.Skip;

                //Find the last Date when the interest was calculated and posted; if no interest has been calculated make the date issued to be
                if Mortgage."Interest Calculation Based"=Mortgage."Interest Calculation Based"::Daily then
                begin

                ExpectedInterest.Reset;
                ExpectedInterest.SetRange(ExpectedInterest."Investment Code",Mortgage."No.");
                ExpectedInterest.SetRange(ExpectedInterest."Posting Date",FirstDateIntheMonth,InterestCalcDate);
                ExpectedInterest.SetRange(ExpectedInterest.Reversed,false);
                ExpectedInterest.SetFilter(ExpectedInterest.Amount,'<%1',0);
                if ExpectedInterest.Find('-') then
                begin
                LastInterestCalcDate:=FirstDateIntheMonth;
                repeat
                i:=i+1;
                InterestCalcDate:=ExpectedInterest."Posting Date";
                if i=1 then
                NoOfDays4Calc:=(InterestCalcDate-LastInterestCalcDate)+1
                else
                NoOfDays4Calc:=(InterestCalcDate-LastInterestCalcDate);

                //MESSAGE('No of days=%1',NoOfDays4Calc);
                Mortgage.SetRange(Mortgage."Date Filter",0D,InterestCalcDate-1);
                Mortgage.CalcFields(Mortgage."Principal Amount");
                if Mortgage."Rate %"<>0 then
                InterestAmount:=Round((NoOfDays4Calc/365)*(Mortgage."Rate %"/100)*(Mortgage."Principal Amount"+InterestCalcBal),1)
                else
                Error('PLEASE SPECIFY MORTGAGE RATE FOR %1',Mortgage."No.");
                LastInterestCalcDate:=ExpectedInterest."Posting Date";
                //MESSAGE('Interest date %1 Amt =%2',InterestCalcDate,InterestAmount);
                InterestCalcBal:=InterestCalcBal+InterestAmount;
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name":='GENERAL';
                GenJnlLine."Journal Batch Name":='INTEREST-J';
                GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No.":='1-950-01-003';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                LineNo:=LineNo+10000;

                GenJnlLine."Line No.":=LineNo;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date":=InterestCalcDate;
                GenJnlLine."Document No.":='JV'+Format(InterestCalcDate);
                //GenJnlLine."External Document No.":="Cheque No";
                GenJnlLine.Amount:=-InterestAmount;
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description:=StrSubstNo('Interest calculation as at %1',InterestCalcDate);
                GenJnlLine."Investment Code":=Mortgage."No.";
                GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Interest;
                //GenJnlLine."No. Of Units":="No. Of Units";
                //GenJnlLine."Expected Receipt date":="Schedule Date";
                GenJnlLine."Shortcut Dimension 1 Code":='DA';
                GenJnlLine."Shortcut Dimension 2 Code":='020';
                GenJnlLine.Validate("Shortcut Dimension 1 Code");
                GenJnlLine.Validate("Shortcut Dimension 2 Code");
                GenJnlLine.Validate(GenJnlLine.Amount);
                if GenJnlLine.Amount<>0 then
                GenJnlLine.Insert;






                GenJnlLine.Init;
                GenJnlLine."Journal Template Name":='GENERAL';
                GenJnlLine."Journal Batch Name":='INTEREST-J';
                GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No.":='3-660-01-001';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                LineNo:=LineNo+10000;
                GenJnlLine."Line No.":=LineNo;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date":=InterestCalcDate;
                GenJnlLine."Document No.":='JV'+Format(InterestCalcDate);
                //GenJnlLine."External Document No.":="Cheque No";
                GenJnlLine.Amount:=InterestAmount;
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description:=StrSubstNo('Interest calculation as at %1',InterestCalcDate);;
                GenJnlLine."Investment Code":=Mortgage."No.";
                GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Deposit;
                //GenJnlLine."No. Of Units":="No. Of Units";
                GenJnlLine."Shortcut Dimension 1 Code":='DA';
                GenJnlLine."Shortcut Dimension 2 Code":='020';
                GenJnlLine.Validate("Shortcut Dimension 1 Code");
                GenJnlLine.Validate("Shortcut Dimension 2 Code");
                GenJnlLine.Validate(GenJnlLine.Amount);
                //GenJnlLine."Expected Receipt date":="Schedule Date";
                if GenJnlLine.Amount<>0 then
                GenJnlLine.Insert;










                until ExpectedInterest.Next=0;
                end;
                if LastInterestCalcDate=0D then
                LastInterestCalcDate:=FirstDateIntheMonth;
                if LastInterestCalcDate<>FirstDateIntheMonth then
                NoOfDays4Calc:=(EndofMonth-LastInterestCalcDate)
                else
                NoOfDays4Calc:=(EndofMonth-LastInterestCalcDate)+1;

                //MESSAGE('Last inte date=%1 No Of days %2',LastInterestCalcDate,NoOfDays4Calc);
                Mortgage.SetRange(Mortgage."Date Filter",0D,EndofMonth-1);
                Mortgage.CalcFields(Mortgage."Principal Amount");
                if Mortgage."Rate %"<>0 then
                InterestAmount:=Round((NoOfDays4Calc/365)*(Mortgage."Rate %"/100)*(Mortgage."Principal Amount"++InterestCalcBal),1);
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name":='GENERAL';
                GenJnlLine."Journal Batch Name":='INTEREST-J';
                GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No.":='1-950-01-003';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                LineNo:=LineNo+10000;

                GenJnlLine."Line No.":=LineNo;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date":=EndofMonth;
                GenJnlLine."Document No.":='JV'+Format(EndofMonth);
                //GenJnlLine."External Document No.":="Cheque No";
                GenJnlLine.Amount:=-InterestAmount;
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description:=StrSubstNo('Interest calculation as at %1',EndofMonth);
                GenJnlLine."Investment Code":=Mortgage."No.";
                GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Interest;
                //GenJnlLine."No. Of Units":="No. Of Units";
                //GenJnlLine."Expected Receipt date":="Schedule Date";
                GenJnlLine."Shortcut Dimension 1 Code":='DA';
                GenJnlLine."Shortcut Dimension 2 Code":='020';
                GenJnlLine.Validate("Shortcut Dimension 1 Code");
                GenJnlLine.Validate("Shortcut Dimension 2 Code");
                GenJnlLine.Validate(GenJnlLine.Amount);
                if GenJnlLine.Amount<>0 then
                GenJnlLine.Insert;






                GenJnlLine.Init;
                GenJnlLine."Journal Template Name":='GENERAL';
                GenJnlLine."Journal Batch Name":='INTEREST-J';
                GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No.":='3-660-01-001';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                LineNo:=LineNo+10000;
                GenJnlLine."Line No.":=LineNo;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date":=EndofMonth;
                GenJnlLine."Document No.":='JV'+Format(EndofMonth);
                //GenJnlLine."External Document No.":="Cheque No";
                GenJnlLine.Amount:=InterestAmount;
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description:=StrSubstNo('Interest calculation as at %1',EndofMonth);
                GenJnlLine."Investment Code":=Mortgage."No.";
                GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Deposit;
                //GenJnlLine."No. Of Units":="No. Of Units";
                GenJnlLine."Shortcut Dimension 1 Code":='DA';
                GenJnlLine."Shortcut Dimension 2 Code":='020';
                GenJnlLine.Validate("Shortcut Dimension 1 Code");
                GenJnlLine.Validate("Shortcut Dimension 2 Code");
                GenJnlLine.Validate(GenJnlLine.Amount);
                //GenJnlLine."Expected Receipt date":="Schedule Date";
                if GenJnlLine.Amount<>0 then
                GenJnlLine.Insert;





                end;


                if Mortgage."Interest Calculation Based"=Mortgage."Interest Calculation Based"::Monthly then
                begin

                Mortgage.SetRange(Mortgage."Date Filter",0D,FirstDateIntheMonth);
                Mortgage.CalcFields(Mortgage."Principal Amount");
                if Mortgage."Rate %"<>0 then
                InterestAmount:=Round((1/12)*(Mortgage."Rate %"/100)*Mortgage."Principal Amount",1)
                else
                Error('PLEASE SPECIFY MORTGAGE RATE FOR %1',Mortgage."No.");
                //MESSAGE('Interest Amount=%1',InterestAmount);
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name":='GENERAL';
                GenJnlLine."Journal Batch Name":='INTEREST-J';
                GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No.":='1-950-01-003';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                LineNo:=LineNo+10000;

                GenJnlLine."Line No.":=LineNo;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date":=InterestCalcDate;
                GenJnlLine."Document No.":='JV'+Format(InterestCalcDate);
                //GenJnlLine."External Document No.":="Cheque No";
                GenJnlLine.Amount:=-InterestAmount;
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description:=StrSubstNo('Interest calculation as at %1',InterestCalcDate);
                GenJnlLine."Investment Code":=Mortgage."No.";
                GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Interest;
                //GenJnlLine."No. Of Units":="No. Of Units";
                //GenJnlLine."Expected Receipt date":="Schedule Date";
                GenJnlLine."Shortcut Dimension 1 Code":='DA';
                GenJnlLine."Shortcut Dimension 2 Code":='020';
                GenJnlLine.Validate("Shortcut Dimension 1 Code");
                GenJnlLine.Validate("Shortcut Dimension 2 Code");
                GenJnlLine.Validate(GenJnlLine.Amount);
                if GenJnlLine.Amount<>0 then
                GenJnlLine.Insert;






                GenJnlLine.Init;
                GenJnlLine."Journal Template Name":='GENERAL';
                GenJnlLine."Journal Batch Name":='INTEREST-J';
                GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No.":='3-660-01-001';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                LineNo:=LineNo+10000;
                GenJnlLine."Line No.":=LineNo;
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date":=InterestCalcDate;
                GenJnlLine."Document No.":='JV'+Format(InterestCalcDate);
                //GenJnlLine."External Document No.":="Cheque No";
                GenJnlLine.Amount:=InterestAmount;
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine.Description:=StrSubstNo('Interest calculation as at %1',InterestCalcDate);;
                GenJnlLine."Investment Code":=Mortgage."No.";
                GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Deposit;
                //GenJnlLine."No. Of Units":="No. Of Units";
                GenJnlLine."Shortcut Dimension 1 Code":='DA';
                GenJnlLine."Shortcut Dimension 2 Code":='020';
                GenJnlLine.Validate("Shortcut Dimension 1 Code");
                GenJnlLine.Validate("Shortcut Dimension 2 Code");
                GenJnlLine.Validate(GenJnlLine.Amount);
                //GenJnlLine."Expected Receipt date":="Schedule Date";
                if GenJnlLine.Amount<>0 then
                GenJnlLine.Insert;
                end;
                Window.Update(1,Mortgage.Description);
            end;

            trigger OnPostDataItem()
            begin

                GenJnlLine.Reset;
                GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'INTEREST-J');
                if GenJnlLine.Find('-') then
                repeat
                GenJnlLine.Validate("Shortcut Dimension 1 Code");
                GenJnlLine.Validate("Shortcut Dimension 2 Code");

                until GenJnlLine.Next=0;

                //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);
                Window.Close;
                Message('Journal batch INTEREST-J has been created');
            end;

            trigger OnPreDataItem()
            begin
                LineNo:=10000;
                GenJnlLine.Reset;
                GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'INTEREST-J');
                GenJnlLine.DeleteAll;
                Window.Open('Calculating Interest for ########################1',Name);
                GenSetup.Get;
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
        ExpectedInterest: Record "G/L Entry";
        InterestCalcDate: Date;
        LastInterestCalcDate: Date;
        NoOfDays4Calc: Integer;
        InterestAmount: Decimal;
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        Window: Dialog;
        Name: Text[130];
        GenSetup: Record "General Ledger Setup";
        FirstDateIntheMonth: Date;
        EndofMonth: Date;
        i: Integer;
        InterestCalcBal: Decimal;
        MorgageDate: Date;
        MortgageInterestDate: Date;
}

