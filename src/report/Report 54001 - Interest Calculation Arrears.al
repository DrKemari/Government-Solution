report 54001 "Interest Calculation Arrears"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Interest Calculation Arrears.rdlc';

    dataset
    {
        dataitem(Mortgage;"Investment Asset")
        {

            trigger OnAfterGetRecord()
            begin
                
                //Find the last Date when the interest was calculated and posted; if no interest has been calculated make the date issued to be
                //last interest date
                ExpectedInterest.Reset;
                ExpectedInterest.SetRange(ExpectedInterest."G/L Account No.",'3-660-01-002');
                ExpectedInterest.SetRange(ExpectedInterest."Investment Code",Mortgage."No.");
                ExpectedInterest.SetRange(ExpectedInterest.Reversed,false);
                ExpectedInterest.SetFilter(ExpectedInterest.Amount,'<%1',0);
                if ExpectedInterest.Find('+') then
                LastInterestCalcDate:=ExpectedInterest."Posting Date";
                
                if LastInterestCalcDate=0D then
                LastInterestCalcDate:=Mortgage."Investment Date";
                
                Window.Update(1,Mortgage.Description);
                
                if Mortgage."Mortgage Type"=Mortgage."Mortgage Type"::Commercial then
                begin
                NoOfDays4Calc:=(InterestCalcDate-LastInterestCalcDate);
                Mortgage.SetRange(Mortgage."Date Filter",0D,FirstDateIntheMonth);
                Mortgage.CalcFields(Mortgage."Principal Amount",Mortgage."Arrears Principal Amount");
                InterestAmount:=Round((NoOfDays4Calc/365)*(Mortgage."Rate %"/100)*Mortgage."Arrears Principal Amount",0.1);
                /*ExpectedInterest.INIT;
                ExpectedInterest."Investment No":=Mortgage."No.";
                ExpectedInterest."Expected Interest Date":=InterestCalcDate;
                ExpectedInterest."Expected Interest Amount":=InterestAmount;
                ExpectedInterest.Type:=ExpectedInterest.Type::Interest;
                ExpectedInterest.Posted:=TRUE;
                ExpectedInterest."No. Of Days":=NoOfDays4Calc;
                IF NOT ExpectedInterest.GET(ExpectedInterest."Investment No",ExpectedInterest."Expected Interest Date") THEN
                ExpectedInterest.INSERT;*/
                
                
                
                end;
                
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name":='GENERAL';
                GenJnlLine."Journal Batch Name":='M-ARREARS';
                GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No.":='1-950-01-003';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Line No.":=20000;
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
                GenJnlLine."Shortcut Dimension 1 Code":="Fund Code";
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                
                GenJnlLine."Shortcut Dimension 2 Code":='020';
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                
                if GenJnlLine.Amount<>0 then
                GenJnlLine.Insert;
                
                GenJnlLine.Init;
                GenJnlLine."Journal Template Name":='GENERAL';
                GenJnlLine."Journal Batch Name":='M-ARREARS';
                GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No.":='3-660-01-002';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Line No.":=30000;
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
                //GenJnlLine."Expected Receipt date":="Schedule Date";
                GenJnlLine."Shortcut Dimension 1 Code":="Fund Code";
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code":='020';
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                
                if GenJnlLine.Amount<>0 then
                GenJnlLine.Insert;

            end;

            trigger OnPostDataItem()
            begin

                GenJnlLine.Reset;
                GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'M-ARREARS');
                if GenJnlLine.Find('-') then
                repeat

                GenJnlLine."Shortcut Dimension 1 Code":='DA';
                GenJnlLine."Shortcut Dimension 2 Code":='020';
                GenJnlLine.Validate("Shortcut Dimension 1 Code");
                GenJnlLine.Validate("Shortcut Dimension 2 Code");

                until GenJnlLine.Next=0;
                //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);
                Window.Close;
            end;

            trigger OnPreDataItem()
            begin
                GenJnlLine.Reset;
                GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'M-ARREARS');
                GenJnlLine.DeleteAll;
                 Window.Open('Calculating Interest for ########################1',Name);
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
        Window: Dialog;
        Name: Text[30];
        FirstDateIntheMonth: Date;
}

