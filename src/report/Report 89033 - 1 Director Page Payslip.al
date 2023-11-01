report 89033 "1 Director Page Payslip"
{
    // ArrEarnings[1,1]
    // ArrEarningsAmt[1,1]
    DefaultLayout = RDLC;
    RDLCLayout = './1 Director Page Payslip.rdlc';


    dataset
    {
        dataitem(Vendor;Vendor)
        {
            RequestFilterFields = "Pay Period Filter","No.","Global Dimension 1 Code";
            column(CoRec_Picture;CoRec.Picture)
            {
            }
            column(CoName;CoName)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___month_text___year4____;UpperCase(Format(DateSpecified,0,'<month text> <year4>')))
            {
            }
            column(Addr_1__1_;Addr[1][1])
            {
            }
            column(Addr_1__2_;Addr[1][2])
            {
            }
            column(DeptArr_1_1_;DeptArr[1,1])
            {
            }
            column(Message2_1_1_;Message2[1,1])
            {
            }
            column(Message1;Message1)
            {
            }
            column(STRSUBSTNO__Date__1__2__TODAY_TIME_;StrSubstNo('Date %1 %2',Today,Time))
            {
            }
            column(USERID;UserId)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            dataitem("Integer";"Integer")
            {
                DataItemTableView = SORTING(Number);
                column(ArrEarnings_1_Number_;ArrEarnings[1,Number])
                {
                }
                column(ArrEarningsAmt_1_Number_;ArrEarningsAmt[1,Number])
                {
                }
                column(BalanceArray_1_Number_;BalanceArray[1,Number])
                {
                }
                column(ArrHeadings;ArrHeadings[Number])
                {
                }

                trigger OnPreDataItem()
                begin
                    Integer.SetRange(Number,1,i-1);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                 Clear(Addr);
                 Clear(DeptArr);
                 Clear(BasicPay);
                 Clear(EmpArray);
                 Clear(ArrEarnings);
                 Clear(ArrEarningsAmt);
                 Clear(BalanceArray);
                 Clear(ArrHeadings);
                 GrossPay:=0;
                 TotalDeduction:=0;
                 Totalcoopshares:=0;
                 Totalnssf:=0;
                 NetPay:=0;
                 i:=1;
                 j:=1;

                 Addr[1][1]:=Vendor."No.";
                 Addr[1][2]:=Vendor.Name;
                 // get Department Name
                 DimVal.Reset;
                 DimVal.SetRange(DimVal.Code,Vendor."Global Dimension 1 Code");
                 DimVal.SetRange("Global Dimension No.",1);
                 if DimVal.Find('-') then
                 DeptArr[1,1]:=DimVal.Name;

                // Get Earnings
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type",Earn."Earning Type"::"Normal Earning");
                //Earn.SETRANGE(Earn."Non-Cash Benefit",FALSE);
                if Earn.Find('-') then begin
                 repeat
                  DirectorLedgerEntry.Reset;
                  DirectorLedgerEntry.SetRange("Payroll Period",DateSpecified);
                  DirectorLedgerEntry.SetRange(Type,DirectorLedgerEntry.Type::Payment);
                  DirectorLedgerEntry.SetRange("Director No",Vendor."No.");
                  DirectorLedgerEntry.SetRange(Code,Earn.Code);
                  if DirectorLedgerEntry.Find('-') then begin
                   repeat
                    ArrEarnings[1,i]:=Earn.Description;
                    Evaluate(ArrEarningsAmt[1,i],Format(DirectorLedgerEntry.Amount));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

                    GrossPay:=GrossPay+DirectorLedgerEntry.Amount;
                     i:=i+1;
                   until DirectorLedgerEntry.Next=0;
                  end;
                 until Earn.Next=0;
                 end;

                    ArrEarnings[1,i]:='GROSS PAY';
                    Evaluate(ArrEarningsAmt[1,i],Format(GrossPay));
                    ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                    j:=j+1;
                    ArrHeadings[i]:=j;
                    i:=i+1;

                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;


                    i:=i+1;
                   // Deductions
                    ArrEarnings[1,i]:='Deductions';
                    j:=j+1;
                    ArrHeadings[i]:=j;
                    //DONATION

                    i:=i+1;

                    DirectorLedgerEntry.Reset;
                    DirectorLedgerEntry.SetRange("Payroll Period",DateSpecified);
                    DirectorLedgerEntry.SetRange(Type,DirectorLedgerEntry.Type::Deduction);
                    DirectorLedgerEntry.SetRange("Director No",Vendor."No.");
                    DirectorLedgerEntry.SetRange(Paye,false);
                    if DirectorLedgerEntry.FindSet then begin
                        Ded.Reset;
                        Ded.SetRange(Code,DirectorLedgerEntry.Code);
                        if Ded.FindFirst then begin
                      ArrEarnings[1,i]:=Ded.Description;
                        end;
                      Evaluate(ArrEarningsAmt[1,i],Format(Abs(DirectorLedgerEntry.Amount)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

                      TotalDeduction:=TotalDeduction-Abs(DirectorLedgerEntry.Amount);
                      end;

                    i:=i+1;
                    //PAYE
                    DirectorLedgerEntry.Reset;
                    DirectorLedgerEntry.SetRange("Payroll Period",DateSpecified);
                    DirectorLedgerEntry.SetRange(Type,DirectorLedgerEntry.Type::Deduction);
                    DirectorLedgerEntry.SetRange("Director No",Vendor."No.");
                    DirectorLedgerEntry.SetRange(Paye,true);
                    if DirectorLedgerEntry.FindSet then begin
                        Ded.Reset;
                        Ded.SetRange(Code,DirectorLedgerEntry.Code);
                        if Ded.FindFirst then begin
                      ArrEarnings[1,i]:=Ded.Description;
                        end;
                      Evaluate(ArrEarningsAmt[1,i],Format(Abs(DirectorLedgerEntry.Amount)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

                      TotalDeduction:=TotalDeduction+Abs(DirectorLedgerEntry.Amount);
                      end;

                    i:=i+1;


                    ArrEarnings[1,i]:='TOTAL DEDUCTIONS';
                    Evaluate(ArrEarningsAmt[1,i],Format(TotalDeduction));
                    ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                    j:=j+1;
                    ArrHeadings[i]:=j;

                        i:=i+1;

                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;

                    i:=i+1;
                   // Net Pay
                    ArrEarnings[1,i]:='NET PAY';
                    NetPay:=GrossPay-TotalDeduction;
                    Evaluate(ArrEarningsAmt[1,i],Format(NetPay));
                    ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                    j:=j+1;
                    ArrHeadings[i]:=j;

                    i:=i+1;

                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;

                    i:=i+1;
                    // taxation
                    ArrEarnings[1,i]:='Taxations';
                    j:=j+1;
                    ArrHeadings[i]:=j;

                    i:=i+1;

                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;

                    i:=i+1;
                    // Non Cash Benefits
                   Earn.Reset;
                   Earn.SetRange(Earn."Earning Type",Earn."Earning Type"::"Normal Earning");
                   Earn.SetRange(Earn."Non-Cash Benefit",true);
                    if Earn.Find('-') then begin
                     repeat
                      DirectorLedgerEntry.Reset;
                      DirectorLedgerEntry.SetRange("Payroll Period",DateSpecified);
                      DirectorLedgerEntry.SetRange(Type,DirectorLedgerEntry.Type::Payment);
                      DirectorLedgerEntry.SetRange("Director No",Vendor."No.");
                      DirectorLedgerEntry.SetRange(Code,Earn.Code);
                      if DirectorLedgerEntry.Find('-') then begin
                       repeat
                        ArrEarnings[1,i]:=Earn.Description;
                        Evaluate(ArrEarningsAmt[1,i],Format(DirectorLedgerEntry.Amount));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

                        i:=i+1;
                       until DirectorLedgerEntry.Next=0;
                      end;
                     until Earn.Next=0;
                    end;

                    // end of non cash
                    DirectorLedgerEntry.Reset;
                    DirectorLedgerEntry.SetRange("Payroll Period",DateSpecified);
                    DirectorLedgerEntry.SetRange(Type,DirectorLedgerEntry.Type::Deduction);
                    DirectorLedgerEntry.SetRange("Director No",Vendor."No.");
                    DirectorLedgerEntry.SetRange(Paye,true);
                    if DirectorLedgerEntry.Find('-') then begin
                      ArrEarnings[1,i]:='Tax Exempt Amount';
                      Evaluate(ArrEarningsAmt[1,i],Format(Abs(DirectorLedgerEntry."Less Tax Exempt")));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

                     TaxableAmt:=0;
                     PayeAmount:=0;

                     TaxableAmt:=DirectorLedgerEntry."Taxable amount";
                     PayeAmount:=DirectorLedgerEntry.Amount;

                    end;

                    i:=i+1;

                  // Taxable amount
                      ArrEarnings[1,i]:='Taxable Amount';
                      Evaluate(ArrEarningsAmt[1,i],Format(Abs(TaxableAmt)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

                    i:=i+1;

                      ArrEarnings[1,i]:='Tax Charged';
                      Evaluate(ArrEarningsAmt[1,i],Format(Abs(PayeAmount)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

                    i:=i+1;

                // Relief
                    Earn.Reset;
                    Earn.SetFilter(Earn."Earning Type",'%1|%2|%3',Earn."Earning Type"::"Tax Relief",
                    Earn."Earning Type"::"Insurance Relief",Earn."Earning Type"::"Owner Occupier");
                    if Earn.Find('-') then begin
                     repeat
                      DirectorLedgerEntry.Reset;
                      DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Payroll Period",DateSpecified);
                      DirectorLedgerEntry.SetRange(Type,DirectorLedgerEntry.Type::Payment);
                      DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Director No",Vendor."No.");
                      DirectorLedgerEntry.SetRange(Code,Earn.Code);
                      if DirectorLedgerEntry.Find('-') then begin
                       repeat
                        ArrEarnings[1,i]:=Earn.Description;
                        Evaluate(ArrEarningsAmt[1,i],Format(Abs(DirectorLedgerEntry.Amount)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

                       i:=i+1;
                     until DirectorLedgerEntry.Next=0;
                     end;
                   until Earn.Next=0;
                  end;

                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;


                     i:=i+1;
                       //Information
                    ArrEarnings[1,i]:='Information';
                    j:=j+1;
                    ArrHeadings[i]:=j;

                    i:=i+1;

                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;

                 ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                    j:=j+1;
                    ArrHeadings[i]:=j;

                   i:=i+1;
                    ArrEarnings[1,i]:='PERSONAL DETAILS';
                       // Employee details
                     i:=i+1;

                    ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';

                     i:=i+1;
                    ArrEarnings[1,i]:='ID No.';
                      ArrEarningsAmt[1,i]:='';
                      i:=i+1;
                    ArrEarnings[1,i]:='P.I.N';
                    ArrEarningsAmt[1,i]:=Vendor."PIN Number";
                    i:=i+1;
                    ArrEarnings[1,i]:='NSSF No.';
                    ArrEarningsAmt[1,i]:=Vendor."NSSF No.";
                    i:=i+1;
                    ArrEarnings[1,i]:='NHIF No.';
                    ArrEarningsAmt[1,i]:=Vendor."NHIF No.";
                    j:=j+1;
                    ArrHeadings[i]:=j;

                    i:=i+1;
                    i:=i+1;
                     ArrEarnings[1,i]:='PAYMENT BY:BANK';
                     ArrEarnings[1,i]:=' ';
                    ArrEarningsAmt[1,i]:=' ';
                  Vendor.CalcFields("Bank Branch Name","Bank Name");
                    ArrEarnings[1,i]:='Bank';
                    ArrEarningsAmt[1,i]:=Vendor."Bank Name";
                    i:=i+1;
                    ArrEarnings[1,i]:='Branch Name';
                    ArrEarningsAmt[1,i]:=Vendor."Bank Branch Name";
                    i:=i+1;
                    ArrEarnings[1,i]:='Branch Code';
                    ArrEarningsAmt[1,i]:=Vendor."Bank Branch";
                    i:=i+1;
                    ArrEarnings[1,i]:='Account No';
                    ArrEarningsAmt[1,i]:=Vendor."Bank Account Number";

                     j:=j+1;
                    ArrHeadings[i]:=j;


                    i:=i+1;
                     ArrEarnings[1,i]:='COMMITEE MEETING DATES';
                      i:=i+1;
                      i:=i+1;
                    Earn.Reset;
                Earn.SetRange(Earn."Earning Type",Earn."Earning Type"::"Normal Earning");
                Earn.SetRange(Earn."Non-Cash Benefit",false);
                if Earn.Find('-') then begin
                 repeat
                  DirectorLedgerEntry.Reset;
                  DirectorLedgerEntry.SetRange("Payroll Period",DateSpecified);
                  DirectorLedgerEntry.SetRange(Type,DirectorLedgerEntry.Type::Payment);
                  DirectorLedgerEntry.SetRange("Director No",Vendor."No.");
                  DirectorLedgerEntry.SetRange(Code,Earn.Code);
                  DirectorLedgerEntry.SetRange(Taxable,true);
                  if DirectorLedgerEntry.Find('-') then begin
                   repeat
                    ArrEarnings[1,i]:=Earn.Description+' '+'on'+Format(DirectorLedgerEntry."Date of Meeting");
                      i:=i+1;
                   until DirectorLedgerEntry.Next=0;
                  end;
                 until Earn.Next=0;
                 end;
                 i:=i+1;
                 i:=i+1;

                    ArrEarnings[1,i]:='*******End of Payslip********';
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
        Payslip = 'Pay Slip';
        EmpNoCaption = 'Director No:';
        NameCaption = 'Name:';
        DeptCaption = 'Dept:';
        EarningsCaption = 'Earnings';
        AmountCaption = 'Amount';
        CopyCaption = 'Copy';
    }

    trigger OnPreReport()
    begin
          PayPeriodtext:=Vendor.GetFilter("Pay Period Filter");
          Evaluate(PayrollMonth,Format(PayPeriodtext));
          PayrollMonthText:=Format(PayrollMonth,1,4);

          CoRec.Get;
          CoName:=CoRec.Name;
          CoRec.CalcFields(Picture);
          Evaluate(DateSpecified,Format(PayPeriodtext));

          CompRec.Get;
          Message2[1,1]:=CompRec."General Payslip Message";
    end;

    var
        EMPLOYEE_NO_CaptionLbl: Label 'EMPLOYEE NO:';
        N_S_S_F_NO_CaptionLbl: Label 'N.S.S.F NO:';
        PAY_SLIPCaptionLbl: Label 'PAY SLIP';
        P_I_N_NO_CaptionLbl: Label 'P.I.N NO:';
        N_H_I_F_NO_CaptionLbl: Label 'N.H.I.F NO:';
        NAME_CaptionLbl: Label 'NAME:';
        I_D_NO_CaptionLbl: Label 'I.D NO:';
        EARNINGSCaptionLbl: Label 'EARNINGS';
        EmptyStringCaptionLbl: Label '*********************************************************';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        DEPARTMENT_CaptionLbl: Label 'DEPARTMENT:';
        BRANCH_CaptionLbl: Label 'BRANCH:';
        PAYPOINT_CaptionLbl: Label 'PAYPOINT:';
        Addr: array [10,100] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        i: Integer;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        DateSpecified: Date;
        EndDate: Date;
        EmpBank: Record "Employee Bank AccountX";
        BankName: Text[250];
        BasicSalary: Decimal;
        TaxableAmt: Decimal;
        RightBracket: Boolean;
        NetPay: Decimal;
        PayPeriodRec: Record "Payroll PeriodX";
        PayDeduct: Record "Director Ledger Entry";
        DirectorRec: Record Vendor;
        EmpNo: Code[10];
        TaxableAmount: Decimal;
        PAYE: Decimal;
        ArrEarnings: array [3,100] of Text[250];
        ArrDeductions: array [3,100] of Text[250];
        Index: Integer;
        Index1: Integer;
        j: Integer;
        ArrEarningsAmt: array [3,100] of Text[250];
        ArrDeductionsAmt: array [3,100] of Decimal;
        Year: Integer;
        EmpArray: array [10,15] of Decimal;
        HoldDate: Date;
        DenomArray: array [3,12] of Text[50];
        NoOfUnitsArray: array [3,12] of Integer;
        AmountArray: array [3,12] of Decimal;
        PayModeArray: array [3] of Text[30];
        HoursArray: array [3,60] of Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        CfMpr: Decimal;
        relief: Decimal;
        TaxCode: Code[10];
        HoursBal: Decimal;
        Pay: Record "Directors Earnings";
        Ded: Record "Director Deductions";
        HoursArrayD: array [3,60] of Decimal;
        BankBranch: Text[30];
        CoName: Text;
        retirecontribution: Decimal;
        EarngingCount: Integer;
        DeductionCount: Integer;
        EarnAmount: Decimal;
        GrossTaxCharged: Decimal;
        DimVal: Record "Dimension Value";
        Department: Text[60];
        LowInterestBenefits: Decimal;
        SpacePos: Integer;
        NetPayLength: Integer;
        AmountText: Text[30];
        DecimalText: Text[30];
        DecimalAMT: Decimal;
        InsuranceRelief: Decimal;
        InsuranceReliefText: Text[30];
        PayrollCodeunit: Codeunit "Director Payroll";
        IncometaxNew: Decimal;
        NewRelief: Decimal;
        TaxablePayNew: Decimal;
        InsuranceReliefNew: Decimal;
        TaxChargedNew: Decimal;
        finalTax: Decimal;
        TotalBenefits: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        "Director Payroll": Record Vendor;
        PayMode: Text[30];
        Intex: Integer;
        NetPay1: Decimal;
        Principal: Decimal;
        Interest: Decimal;
        Desc: Text[50];
        dedrec: Record "Director Deductions";
        RoundedNetPay: Decimal;
        diff: Decimal;
        CFWD: Decimal;
        Nssfcomptext: Text[30];
        Nssfcomp: Decimal;
        LoanDesc: Text[60];
        LoanDesc1: Text[60];
        Deduct: Record "Director Deductions";
        OriginalLoan: Decimal;
        LoanBalance: Decimal;
        Message1: Text[250];
        Message2: array [3,1] of Text[250];
        DeptArr: array [3,1] of Text[60];
        BasicPay: array [3,1] of Text[250];
        InsurEARN: Decimal;
        HasInsurance: Boolean;
        RoundedAmt: Decimal;
        TerminalDues: Decimal;
        Earn: Record "Directors Earnings";
        DirectorLedgerEntry: Record "Director Ledger Entry";
        RoundingDesc: Text[60];
        BasicChecker: Decimal;
        CoRec: Record "Company Information";
        GrossPay: Decimal;
        TotalDeduction: Decimal;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        GetPaye: Codeunit "Director Payroll";
        PayeeTest: Decimal;
        GetGroup: Codeunit "Director Payroll";
        GroupCode: Code[20];
        CUser: Code[20];
        Totalcoopshares: Decimal;
        LoanBal: Decimal;
        LoanBalances: Record "Loan Application";
        TotalRepayment: Decimal;
        Totalnssf: Decimal;
        Totalpension: Decimal;
        Totalprovid: Decimal;
        BalanceArray: array [3,100] of Decimal;
        PensionContribution: Decimal;
        ArrHeadings: array [100] of Integer;
        PayeAmount: Decimal;

    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
    end;

    procedure GetPayPeriod()
    begin
    end;

    procedure GetTaxBracket1(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
    end;

    procedure CoinageAnalysis(var NetPay: Decimal;var ColNo: Integer)
    var
        Index: Integer;
        Intex: Integer;
    begin
    end;

    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

            HRsetup.Get;
            if HRsetup."Payroll Rounding Precision"=0 then
               Error('You must specify the rounding precision under HR setup');

          if HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Nearest then
            PayrollRounding:=Round(Amount,HRsetup."Payroll Rounding Precision",'=');

          if HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Up then
            PayrollRounding:=Round(Amount,HRsetup."Payroll Rounding Precision",'>');

          if HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Down then
            PayrollRounding:=Round(Amount,HRsetup."Payroll Rounding Precision",'<');
    end;

    procedure ChckRound(var AmtText: Text[30]) ChckRound: Text[30]
    var
        LenthOfText: Integer;
        DecimalPos: Integer;
        AmtWithoutDec: Text[30];
        DecimalAmt: Text[30];
        Decimalstrlen: Integer;
    begin
        LenthOfText:=StrLen(AmtText);
        DecimalPos:=StrPos(AmtText,'.');
        if DecimalPos=0 then begin
         AmtWithoutDec:=AmtText;
         DecimalAmt:='.00';
        end else begin
         AmtWithoutDec:=CopyStr(AmtText,1,DecimalPos-1);
         DecimalAmt:=CopyStr(AmtText,DecimalPos+1,2);
         Decimalstrlen:=StrLen(DecimalAmt);
        if Decimalstrlen<2 then begin
          DecimalAmt:='.' +DecimalAmt+'0';
         end else
           DecimalAmt:='.' +DecimalAmt
        end;
        ChckRound:=AmtWithoutDec+DecimalAmt;
    end;
}

