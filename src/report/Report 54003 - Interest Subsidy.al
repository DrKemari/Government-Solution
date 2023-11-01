report 54003 "Interest Subsidy"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Interest Subsidy.rdlc';

    dataset
    {
        dataitem("Fixed Asset";"Investment Asset")
        {
            dataitem("G/L Entry";"G/L Entry")
            {
                DataItemLink = "Investment Code"=FIELD("No."),"Posting Date"=FIELD("Date Filter");
                DataItemTableView = SORTING("Investment Code","Posting Date","Document No.") WHERE("G/L Account No."=FILTER('3-660-01-001'..'3-660-01-002'|'1-950-01-003'),"Investment Transcation Type"=CONST(Contribution),Reversed=CONST(false));

                trigger OnAfterGetRecord()
                begin

                     InterestAmt:=0;
                     CapitalAmt:=0;
                     PaymentsMade:=0;
                     TaxBenefit:=0;
                     if "G/L Entry"."Investment Transcation Type"="G/L Entry"."Investment Transcation Type"::Contribution then
                     begin
                      if "G/L Entry".Amount>0 then
                      PaymentsMade:="G/L Entry".Amount
                      else
                      CapitalAmt:="G/L Entry".Amount;
                     end;
                    GLEntry.Reset;
                    GLEntry.SetCurrentKey(GLEntry."Document No.",GLEntry."Posting Date");
                    GLEntry.SetRange(GLEntry."Document No.","G/L Entry"."Document No.");
                    GLEntry.SetRange(GLEntry."Posting Date","G/L Entry"."Posting Date");
                    GLEntry.SetRange(GLEntry."Investment Code","Fixed Asset"."No.");
                    GLEntry.SetRange(GLEntry."Investment Transcation Type",GLEntry."Investment Transcation Type"::Interest);
                    GLEntry.SetRange(GLEntry.Reversed,false);
                    if GLEntry.Find('-') then
                    InterestAmt:=GLEntry.Amount;
                    if ((InvestSetup.Get) and (InterestAmt<>0)) then
                    begin
                     TaxBenefit:=Round((((InvestSetup."Government Mortgage Rate"/100)/12)*CapitalBalance1)+InterestAmt,1);

                     InterestSubsidy:=Round((((InvestSetup."Market Mortgage Interest Rate"/100)/12)*CapitalBalance1)+InterestAmt,1)
                    end;

                    CapitalBalance:=CapitalBalance+PaymentsMade+CapitalAmt;
                end;

                trigger OnPostDataItem()
                begin

                    if InterestSubsidy>0 then
                    begin
                    GenJnline.Init;
                    GenJnline."Journal Template Name":='GENERAL';
                    GenJnline."Journal Batch Name":='SUBSIDY';
                    GenJnline."Line No.":=GenJnline."Line No."+10000;
                    GenJnline."Posting Date":=InterestCalcDate;
                    GenJnline."Document No.":=StrSubstNo('JV-SUB-%1',InterestCalcDate);
                    GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                    GenJnline."Account No.":='2-600-01-012';
                    GenJnline.Description:=StrSubstNo('Interest Subsidy for %1',"Fixed Asset".Description);
                    GenJnline."Shortcut Dimension 1 Code":='GENERAL';
                    GenJnline."Shortcut Dimension 2 Code":='020';
                    GenJnline.Validate(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline.Validate(GenJnline."Shortcut Dimension 2 Code");
                    GenJnline.Amount:=InterestSubsidy;
                    GenJnline."Bal. Account Type":=GenJnline."Bal. Account Type"::"G/L Account";
                    GenJnline."Bal. Account No.":='3-781-01-001';
                    GenJnline."Investment Code":="Fixed Asset"."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."Investment Transcation Type"::Withdrawal;
                    GenJnline.Insert;

                    GenJnline.Init;
                    GenJnline."Journal Template Name":='GENERAL';
                    GenJnline."Journal Batch Name":='SUBSIDY';
                    GenJnline."Line No.":=GenJnline."Line No."+10000;
                    GenJnline."Posting Date":=InterestCalcDate;
                    GenJnline."Document No.":=StrSubstNo('JV-SUB-%1',InterestCalcDate);
                    GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                    GenJnline."Account No.":='3-781-01-001';
                    GenJnline.Description:=StrSubstNo('Interest Subsidy for %1',"Fixed Asset".Description);
                    GenJnline."Shortcut Dimension 1 Code":='DA';
                    GenJnline."Shortcut Dimension 2 Code":='020';
                    GenJnline.Validate(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline.Validate(GenJnline."Shortcut Dimension 2 Code");
                    GenJnline."Investment Code":="Fixed Asset"."No.";
                    GenJnline.Amount:=InterestSubsidy;
                    GenJnline."Bal. Account Type":=GenJnline."Bal. Account Type"::"G/L Account";
                    GenJnline."Bal. Account No.":='1-950-01-003';
                    GenJnline."Investment Transcation Type":=GenJnline."Investment Transcation Type"::Withdrawal;
                    GenJnline.Insert;
                    end;
                    Window.Update(1,"Fixed Asset".Description);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                 CapitalBalance:=0;
                 CapitalBalance1:=0;
                 InterestAmt:=0;
                 CapitalAmt:=0;
                 PaymentsMade:=0;
                 TaxBenefit:=0;
                 MortgageCopy.Copy("Fixed Asset");

                 MortgageCopy.SetRange(MortgageCopy."Date Filter",0D,FirstDateIntheMonth);
                 MortgageCopy.CalcFields(MortgageCopy."Principal Amount");
                 CapitalBalance1:=MortgageCopy."Principal Amount";
                 // MESSAGE('%1',CapitalBalance1);
            end;

            trigger OnPreDataItem()
            begin
                Window.Open('Calculating Interest Subsidy for ########################1',Name);
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
        PaymentsMade: Decimal;
        InterestAmt: Decimal;
        CapitalAmt: Decimal;
        InterestSubsidy: Decimal;
        GLEntry: Record "G/L Entry";
        CapitalBalance: Decimal;
        TaxBenefit: Decimal;
        InvestSetup: Record "Investment Setup";
        FirstDateIntheMonth: Date;
        InterestCalcDate: Date;
        MortgageCopy: Record "Investment Asset";
        CapitalBalance1: Decimal;
        GenJnline: Record "Gen. Journal Line";
        Window: Dialog;
        Name: Text[30];
}

