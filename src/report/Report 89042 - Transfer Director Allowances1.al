report 89042 "Transfer Director Allowances1"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            DataItemTableView = WHERE("Vendor Type"=CONST(Director));
            RequestFilterFields = "No.","Pay Period Filter","Date Filter";

            trigger OnPostDataItem()
            begin
                TotalPayable:=0.0;
                HRSetup.Get;
                EarnRec.SetRange("Pay Period Filter",DateSpecified);
                //EarnRec.SETRANGE("Non-Cash Benefit",FALSE);
                 if EarnRec.Find('-') then begin
                   repeat
                    DirLedg1.Reset;
                    DirLedg1.SetRange(DirLedg1."Payroll Period",DateSpecified);
                    DirLedg1.SetRange(DirLedg1.Code,EarnRec.Code);
                    DirLedg1.SetRange(Closed,false);
                    //IF DirLedg1.FINDSET THEN BEGIN
                      DirLedg1.CalcSums(Amount);
                      //sEND;
                    EarnRec.CalcFields("Total Amount");
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name":=HRSetup."Directors Journal Template";
                    GenJnLine."Journal Batch Name":=HRSetup."Director Journal Batch";
                    GenJnLine."Line No.":=GenJnLine."Line No."+20000;
                    GenJnLine."Account Type":=EarnRec."Account Type";
                    GenJnLine."Account No.":=EarnRec."Account No.";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Invoice;
                    GenJnLine."Posting Date":=Today;
                    GenJnLine.Description:=EarnRec.Description+' '+Format(DateSpecified,0,'<month text> <year4>');
                    GenJnLine."Document No.":=Format(DirLedg."Date of Meeting",0,'<month text> <year4>');
                    GenJnLine."External Document No.":=Format(DirLedg."Date of Meeting",0,'<month text> <year4>');
                    GenJnLine."Shortcut Dimension 1 Code":=Vendor."Global Dimension 1 Code";

                    GenJnLine.Amount:=DirLedg1.Amount;
                    GenJnLine.Validate(Amount);

                    //dochieno to add usage on project
                    if GenJnLine."Account Type"=GenJnLine."Account Type"::"G/L Account" then
                      begin
                          GenJnLine.Validate(GenJnLine."Posting Date");
                          GenJnLine."Job No.":=HRSetup."Board Expense";
                          GenJnLine."Job Task No.":=EarnRec."Account No.";
                          GenJnLine."Job Quantity":=1;
                          GenJnLine.Validate(GenJnLine."Job Quantity");
                       end;
                       TotalPayable:=TotalPayable+DirLedg1.Amount;
                    //end of dochieno

                    if GenJnLine.Amount<>0 then
                      GenJnLine.Insert;
                until EarnRec.Next=0;
                end;


                DedRec.Reset;
                DedRec.SetRange("Pay Period Filter",DateSpecified);
                DedRec.SetRange(Block,false);
                 if DedRec.FindSet then begin
                  repeat
                    DedRec.CalcFields("Total Amount");
                    DirLedg1.Reset;
                    DirLedg1.SetRange(DirLedg1."Payroll Period",DateSpecified);
                    DirLedg1.SetRange(DirLedg1.Code,DedRec.Code);
                    DirLedg1.SetRange(Closed,false);
                    if DirLedg1.FindSet then begin
                      DirLedg1.CalcSums(Amount);
                      end;
                        GenJnLine.Init;
                        GenJnLine."Journal Template Name":=HRSetup."Directors Journal Template";
                    GenJnLine."Journal Batch Name":=HRSetup."Director Journal Batch";
                        GenJnLine."Line No.":=GenJnLine."Line No."+10000;
                        GenJnLine."Account Type":=DedRec."Account Type";
                        GenJnLine."Account No.":=DedRec."Account No.";
                        Payperiod.Reset;
                        GenJnLine."Posting Date":=Today;
                        GenJnLine.Description:=DedRec.Description+' '+Format(DateSpecified,0,'<month text> <year4>');
                        GenJnLine."Document No.":=Format(DirLedg."Date of Meeting",0,'<month text> <year4>');
                         GenJnLine."External Document No.":=Format(DirLedg."Date of Meeting",0,'<month text> <year4>');
                        GenJnLine."Shortcut Dimension 1 Code":=Vendor."Global Dimension 1 Code";
                        //GenJnLine.Amount:=DedRec."Total Amount";
                        GenJnLine.Amount:=DirLedg1.Amount;
                        GenJnLine.Validate(Amount);
                        if GenJnLine.Amount<>0 then
                        GenJnLine.Insert;
                        TotalPayable:=TotalPayable+DirLedg1.Amount;
                    until DedRec.Next=0;

                end;
                //insert a line for payable

                    GenJnLine.Init;
                    GenJnLine."Journal Template Name":=HRSetup."Directors Journal Template";
                    GenJnLine."Journal Batch Name":=HRSetup."Director Journal Batch";
                    GenJnLine."Line No.":=GenJnLine."Line No."+10000;
                    GenJnLine."Account Type":=GenJnLine."Account Type"::Vendor;
                    GenJnLine."Account No.":=HRSetup."Board Payable";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Invoice;
                    GenJnLine."Posting Date":=Today;
                    GenJnLine.Description:=DirLedg.Description+' '+Format(DateSpecified,0,'<month text> <year4>');
                    GenJnLine."Document No.":=Format(DirLedg."Date of Meeting",0,'<month text> <year4>');
                    GenJnLine."External Document No.":=Format(DirLedg."Date of Meeting",0,'<month text> <year4>');

                    GenJnLine."Shortcut Dimension 1 Code":=Vendor."Global Dimension 1 Code";
                    GenJnLine.Amount:=-TotalPayable;
                    GenJnLine.Validate(Amount);
                    if GenJnLine.Amount<>0 then
                    GenJnLine.Insert;

                DirLedg1.Reset;
                DirLedg1.SetRange("Payroll Period",DateSpecified);
                DirLedg1.SetRange(Closed,false);
                if DirLedg1.FindSet then
                  begin
                         repeat
                         DirLedg1.Closed:=false;
                          DirLedg1.Modify();
                      until DirLedg1.Next=0;
                      end
            end;

            trigger OnPreDataItem()
            begin
                
                DateSpecified:=Vendor.GetRangeMin("Pay Period Filter");
                /*IF Payperiod.GET(Vendor.GETRANGEMIN("Pay Period Filter")) THEN BEGIN
                 IF payperiod.Closed=TRUE THEN
                   ERROR('you can only transfer payroll for open payroll period');
                END;*/
                
                //Delete Journal Entries
                HRSetup.Get;
                HRSetup.TestField("Directors Journal Template");
                HRSetup.TestField("Director Journal Batch");
                if not JnlTemp.Get(HRSetup."Directors Journal Template",HRSetup."Director Journal Batch") then
                begin
                JnlTemp.Init;
                JnlTemp."Journal Template Name":=HRSetup."Directors Journal Template";
                JnlTemp.Name:=HRSetup."Director Journal Batch";
                JnlTemp.Insert;
                end;
                
                GenJnLine.Reset;
                GenJnLine.SetRange("Journal Template Name",HRSetup."Directors Journal Template");
                GenJnLine.SetRange("Journal Batch Name",HRSetup."Director Journal Batch");
                GenJnLine.DeleteAll;
                
                 if not PPSetup.Get then
                  Error(Text000);

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
        EarnRec: Record "Directors Earnings";
        HRSetup: Record "Human Resources Setup";
        JnlTemp: Record "Gen. Journal Batch";
        GenJnLine: Record "Gen. Journal Line";
        DateSpecified: Date;
        DedRec: Record "Director Deductions";
        PPSetup: Record "Purchases & Payables Setup";
        Text000: Label 'Purchases & Payables Setup doesn''t exist';
        DirLedg: Record "Director Ledger Entry";
        Payperiod: Record "Payroll PeriodX";
        Jobtask: Record "Job Task";
        job: Record Job;
        DirLedg1: Record "Director Ledger Entry";
        DirLedg2: Record "Director Ledger Entry";
        TotalPayable: Decimal;
}

