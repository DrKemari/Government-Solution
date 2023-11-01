report 54004 "Revaluation of Forex Bonds"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Revaluation of Forex Bonds.rdlc';

    dataset
    {
        dataitem("Fixed Asset";"Investment Asset")
        {

            trigger OnAfterGetRecord()
            begin

                  "Fixed Asset".SetRange("Fixed Asset"."Date Filter",0D,Revaldate);
                  "Fixed Asset".CalcFields("Fixed Asset"."Acquisition Cost","Fixed Asset"."Cost Forex");
                   GainLoss:="Fixed Asset"."Acquisition Cost"-("Fixed Asset"."Cost Forex"/ExchangeRATE.ExchangeRateAdjmt(Revaldate,Curr));
                   if InvestPg.Get("Fixed Asset"."Investment Posting Group") then
                   begin

                   GenJnline.Init;
                   GenJnline."Journal Template Name":='GENERAL';
                   GenJnline."Journal Batch Name":='FX-REVAL';
                   GenJnline."Line No.":=GenJnline."Line No."+10000;
                   GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                   GenJnline."Account No.":=InvestPg."Revaluation Gain/Loss";
                   GenJnline."Posting Date":=Revaldate;
                   GenJnline."Document No.":="Fixed Asset"."No."+Format(Revaldate);
                   GenJnline.Description:='Forex Revaluation';
                   GenJnline."Investment Transcation Type":=GenJnline."Investment Transcation Type"::Revaluation;
                   GenJnline.Amount:=GainLoss;
                   GenJnline."Shortcut Dimension 1 Code":="Fixed Asset"."Fund Code";
                   GenJnline."Shortcut Dimension 2 Code":="Fixed Asset"."Custodian Code";

                   if GenJnline.Amount<>0 then
                   GenJnline.Insert;

                   GenJnline.Init;
                   GenJnline."Journal Template Name":='GENERAL';
                   GenJnline."Journal Batch Name":='FX-REVAL';
                   GenJnline."Line No.":=GenJnline."Line No."+10000;
                   GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                   GenJnline."Account No.":=InvestPg."Investment Cost Account";
                   GenJnline."Posting Date":=Revaldate;
                   GenJnline."Document No.":="Fixed Asset"."No."+Format(Revaldate);
                   GenJnline.Description:='Forex Revaluation';
                    GenJnline."Investment Transcation Type":=GenJnline."Investment Transcation Type"::Revaluation;
                   GenJnline.Amount:=-GainLoss;
                   GenJnline."Shortcut Dimension 1 Code":="Fixed Asset"."Fund Code";
                   GenJnline."Shortcut Dimension 2 Code":="Fixed Asset"."Custodian Code";
                   if GenJnline.Amount<>0 then
                   GenJnline.Insert;
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
        Revaldate: Date;
        CurrencyRec: Record Currency;
        ExchangeRATE: Record "Currency Exchange Rate";
        Curr: Code[20];
        GainLoss: Decimal;
        GenJnline: Record "Gen. Journal Line";
        InvestPg: Record "Investment Posting Group";
}

