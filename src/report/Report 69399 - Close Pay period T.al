report 69399 "Close Pay period T"
{
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem("Assignment Matrix-X Temp-E";"Assignment Matrix-X Temp-E")
        {

            trigger OnPostDataItem()
            begin

                  if PayperiodStart<>StartingDate then
                    Error('Cannot Close this Pay period Without Closing the preceding ones')
                  else
                  begin
                  if PayPeriod.Get(StartingDate) then begin
                    PayPeriod."Close Pay":=true;
                    PayPeriod.Closed:=true;
                    PayPeriod.CreateLeaveEntitlment(PayPeriod);
                    PayPeriod.Modify;
                    Message('The period has been closed');
                  end;
                  end;

                // Go thru assignment matrix for loans and validate code
                NewPeriod:=CalcDate('1M',PayperiodStart);
                Loan.Reset;
                if Loan.Find('-') then
                 begin
                  repeat
                   AssMatrix.Reset;
                   AssMatrix.SetRange(AssMatrix."Payroll Period",NewPeriod);
                   AssMatrix.SetRange(Code,Loan.Code);
                   if AssMatrix.Find('-') then begin
                    repeat
                      if EmpRec.Get("Assignment Matrix-X Temp-E"."Employee No") then begin
                         if (EmpRec.Status=EmpRec.Status::Active) then
                           AssMatrix.Validate(Code);
                           AssMatrix.Modify
                      end;
                     until AssMatrix.Next=0;
                    end;
                   until Loan.Next=0;
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

    trigger OnPreReport()
    begin
           if not Confirm('Please backup up before closing current period! OK to Proceed?') then
           Error('The period has not been closed');

          // PayrollRun.RUN;....//commented by Morris

           DeducePayPeriod;
           ClosePeriodTrans;
           CreateNewEntries(PayperiodStart);
           UpdateSalaryPointers(PayperiodStart);
    end;

    var
        Proceed: Boolean;
        CurrentPeriodEnd: Date;
        DaysAdded: Code[10];
        PayPeriod: Record "Payroll PeriodXT";
        StartingDate: Date;
        PayperiodStart: Date;
        LoansUpdate: Boolean;
        PayHistory: Record "Employee Ledger EntryX";
        EmpRec: Record Employee;
        TaxableAmount: Decimal;
        RightBracket: Boolean;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        NetPay: Decimal;
        Loan: Record "Loans transactionsX";
        ReducedBal: Decimal;
        InterestAmt: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        relief: Decimal;
        Outstanding: Decimal;
        CreateRec: Boolean;
        benefits: Record "EarningsX Temp-E";
        deductions: Record "DeductionsX Temp-E";
        InterestDiff: Decimal;
        Rounding: Boolean;
        PD: Record "Assignment Matrix-X Temp-E";
        Pay: Record "EarningsX Temp-E";
        Ded: Record "DeductionsX Temp-E";
        TaxCode: Code[10];
        CfAmount: Decimal;
        TempAmount: Decimal;
        EmpRec1: Record "Temporary Employee";
        Emprec2: Record "Temporary Employee";
        NewPeriod: Date;
        AssMatrix: Record "Assignment Matrix-X Temp-E";
        PayrollRun: Report "Payroll Run Temp";
        Schedule: Record "Repayment Schedule";
        Window: Dialog;
        EmployeeName: Text[200];
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        LoanApplicationForm: Record "Loan Application";
        Discontinue: Boolean;

    procedure GetCurrentPeriod(var Payperiod: Record "Payroll PeriodXT")
    begin
          CurrentPeriodEnd:=Payperiod."Starting Date";
          StartingDate:=CurrentPeriodEnd;
          CurrentPeriodEnd:= CalcDate('1M',CurrentPeriodEnd-1);
    end;

    procedure DeducePayPeriod()
    var
        PayPeriodRec: Record "Payroll PeriodXT";
    begin
        PayPeriodRec.Reset;
        PayPeriodRec.SetRange(PayPeriodRec."Close Pay",false);
        if PayPeriodRec.Find('-') then
        PayperiodStart:=PayPeriodRec."Starting Date";
    end;

    procedure ClosePeriodTrans()
    var
        EarnDeduct: Record "Assignment Matrix-X Temp-E";
    begin
            EarnDeduct.Reset;
            EarnDeduct.SetRange(EarnDeduct."Payroll Period",PayperiodStart);
            if EarnDeduct.Find('-') then
               repeat
                   EarnDeduct.Closed:=true;
                   EarnDeduct."Payroll Period":=PayperiodStart;
                   EarnDeduct.Modify;
               until EarnDeduct.Next=0;
    end;

    procedure CreateNewEntries(var CurrPeriodStat: Date)
    var
        PaymentDed: Record "Assignment Matrix-X Temp-E";
        AssignMatrix: Record "Assignment Matrix-X Temp-E";
    begin
          /*This function creates new entries for the next Payroll period which are accessible and editable
          by the user of the Payroll. It should ideally create new entries if the EmpRec is ACTIVE*/
           NewPeriod:=CalcDate('1M',PayperiodStart);
         Window.Open('Creating Next period entries ##############################1',EmployeeName);
             PaymentDed.Reset;
             PaymentDed.SetRange(PaymentDed."Payroll Period",PayperiodStart);
             PaymentDed.SetRange(PaymentDed."Next Period Entry",true);
             //PaymentDed.SETFILTER(PaymentDed.Amount, '<>%1',0);
             if PaymentDed.Find('-') then  begin
               repeat
                  CreateRec:=true;
                  AssignMatrix.Init;
                  AssignMatrix."Employee No":=PaymentDed."Employee No";
                  AssignMatrix.Type:=PaymentDed.Type;
                  AssignMatrix.Code:=PaymentDed.Code;
                  AssignMatrix."Department Code":=PaymentDed."Department Code";
                  AssignMatrix."Reference No":=PaymentDed."Reference No";
                  AssignMatrix.Retirement:=PaymentDed.Retirement;
                  AssignMatrix."Payroll Period":=CalcDate('1M',PayperiodStart);
                  AssignMatrix.Amount:=PaymentDed.Amount;
                  AssignMatrix.Description:=PaymentDed.Description;
                  AssignMatrix."Salary Pointer":=EmpRec."Salary Scale";
                  AssignMatrix.Taxable:=PaymentDed.Taxable;
                  AssignMatrix."Tax Deductible":=PaymentDed."Tax Deductible";
                  AssignMatrix.Frequency:=PaymentDed.Frequency;
                  AssignMatrix."Pay Period":=PaymentDed."Pay Period";
                  AssignMatrix."Non-Cash Benefit":=PaymentDed."Non-Cash Benefit";
                  AssignMatrix.Quarters:=PaymentDed.Quarters;
                  AssignMatrix."No. of Units":=PaymentDed."No. of Units";
                  AssignMatrix.Section:=PaymentDed.Section;
                  AssignMatrix."Basic Pay":=PaymentDed."Basic Pay";
                  AssignMatrix."Salary Grade":=PaymentDed."Salary Grade";
                  AssignMatrix."Department Code":=PaymentDed."Department Code";
                  AssignMatrix."Employer Amount":=PaymentDed."Employer Amount";
                  AssignMatrix."Department Code":=PaymentDed."Department Code";
                  AssignMatrix."Next Period Entry":=PaymentDed."Next Period Entry";
                  AssignMatrix."Posting Group Filter":=PaymentDed."Posting Group Filter";
                  AssignMatrix."Loan Repay":=PaymentDed."Loan Repay";
                  AssignMatrix.DebitAcct:=PaymentDed.DebitAcct;
                  AssignMatrix.CreditAcct:=PaymentDed.CreditAcct;
                  AssignMatrix."Basic Salary Code":=PaymentDed."Basic Salary Code";
                  AssignMatrix."Normal Earnings":=PaymentDed."Normal Earnings";
        
                  AssignMatrix."Tax Relief":=PaymentDed."Tax Relief";
        
                 // IF PaymentDed."Department Code" ='' THEN
                 //  BEGIN
                   Emprec2.Reset;
                   if Emprec2.Get(PaymentDed."Employee No") then begin
                     Emprec2.CalcFields(Emprec2.Department,Emprec2.Branch,Emprec2.Paypoint,Emprec2."Staffing Group");
        
                    //AssignMatrix."Department Code":=Emprec2."Global Dimension 1 Code";
                    AssignMatrix."Department Code":=Emprec2.Department;
                    AssignMatrix."Profit Centre":=Emprec2."Global Dimension 2 Code";
                   AssignMatrix.Branch:=Emprec2.Branch;
                   AssignMatrix."Pay Point":=Emprec2.Paypoint;
                    AssignMatrix."Staffing Group":=Emprec2."Staffing Group";
                    AssignMatrix."Posting Group Filter":=Emprec2."Posting Group";
                   end;
         //carry forward
        
        if deductions.Get(PaymentDed.Code) then begin
        
        if PaymentDed."Closing Balance">0 then begin
        AssignMatrix."Opening Balance":=PaymentDed."Closing Balance";
        if deductions."Balance Type"=deductions."Balance Type"::Decreasing then begin
        if PaymentDed."Closing Balance"<=Abs(AssignMatrix.Amount) then
        AssignMatrix.Amount:=-PaymentDed."Closing Balance"
        else
        AssignMatrix."Closing Balance":=PaymentDed."Closing Balance"+AssignMatrix.Amount;
        end;
        
        if deductions."Balance Type"=deductions."Balance Type"::Increasing then
        AssignMatrix."Closing Balance":=PaymentDed."Closing Balance"-AssignMatrix.Amount;
        end;
        end;
        
                 //END EMM
               if EmpRec.Get(PaymentDed."Employee No") then begin
                  // AssignMatrix."Payroll Group":=EmpRec."Posting Group";
        
        
               Window.Update(1,EmpRec."First Name"+' '+EmpRec."Middle Name"+ ' '+EmpRec."Last Name");
        
                   if (EmpRec.Status=EmpRec.Status::Active) and (CreateRec=true) then
                      AssignMatrix.Insert;
                   end;
                until PaymentDed.Next=0;
             end;
        
        
        
        ///carry forward any Non-recurring deductions;;
        
             PaymentDed.Reset;
             PaymentDed.SetRange(PaymentDed."Payroll Period",PayperiodStart);
             PaymentDed.SetRange(PaymentDed."Next Period Entry",false);
             PaymentDed.SetFilter(PaymentDed."Closing Balance", '>%1',0);
             if PaymentDed.Find('-') then  begin
               repeat
                  CreateRec:=true;
                  AssignMatrix.Init;
                  AssignMatrix."Employee No":=PaymentDed."Employee No";
                  AssignMatrix.Type:=PaymentDed.Type;
                  AssignMatrix.Code:=PaymentDed.Code;
                  AssignMatrix."Department Code":=PaymentDed."Department Code";
                  AssignMatrix."Reference No":=PaymentDed."Reference No";
                  AssignMatrix.Retirement:=PaymentDed.Retirement;
                  AssignMatrix."Payroll Period":=CalcDate('1M',PayperiodStart);
                  AssignMatrix.Amount:=PaymentDed.Amount;
                  AssignMatrix.Description:=PaymentDed.Description;
                  AssignMatrix.Taxable:=PaymentDed.Taxable;
                  AssignMatrix."Tax Deductible":=PaymentDed."Tax Deductible";
                  AssignMatrix.Frequency:=PaymentDed.Frequency;
                  AssignMatrix."Pay Period":=PaymentDed."Pay Period";
                  AssignMatrix."Salary Pointer":=EmpRec."Salary Scale";
                  AssignMatrix."Non-Cash Benefit":=PaymentDed."Non-Cash Benefit";
                  AssignMatrix.Quarters:=PaymentDed.Quarters;
                  AssignMatrix."No. of Units":=PaymentDed."No. of Units";
                  AssignMatrix.Section:=PaymentDed.Section;
                  AssignMatrix."Basic Pay":=PaymentDed."Basic Pay";
                  AssignMatrix."Salary Grade":=PaymentDed."Salary Grade";
                  AssignMatrix."Department Code":=PaymentDed."Department Code";
                  AssignMatrix."Employer Amount":=PaymentDed."Employer Amount";
                  AssignMatrix."Department Code":=PaymentDed."Department Code";
                  AssignMatrix."Next Period Entry":=PaymentDed."Next Period Entry";
                  AssignMatrix."Posting Group Filter":=PaymentDed."Posting Group Filter";
                  AssignMatrix."Loan Repay":=PaymentDed."Loan Repay";
                  AssignMatrix.DebitAcct:=PaymentDed.DebitAcct;
                  AssignMatrix.CreditAcct:=PaymentDed.CreditAcct;
                  AssignMatrix."Basic Salary Code":=PaymentDed."Basic Salary Code";
                  AssignMatrix."Normal Earnings":=PaymentDed."Normal Earnings";
        
                  AssignMatrix."Tax Relief":=PaymentDed."Tax Relief";
        
                 // IF PaymentDed."Department Code" ='' THEN
                 //  BEGIN
                   Emprec2.Reset;
                   if Emprec2.Get(PaymentDed."Employee No") then begin
                     Emprec2.CalcFields(Emprec2.Department,Emprec2.Branch,Emprec2.Paypoint,Emprec2."Staffing Group");
        
                    //AssignMatrix."Department Code":=Emprec2."Global Dimension 1 Code";
                    AssignMatrix."Department Code":=Emprec2.Department;
                    AssignMatrix."Profit Centre":=Emprec2."Global Dimension 2 Code";
                    AssignMatrix.Branch:=Emprec2.Branch;
                   AssignMatrix."Pay Point":=Emprec2.Paypoint;
                   AssignMatrix."Staffing Group":=Emprec2."Staffing Group";
                    AssignMatrix."Posting Group Filter":=Emprec2."Posting Group";
                   end;
        
         //carry forward
        if deductions.Get(PaymentDed.Code) then begin
        
        if PaymentDed."Closing Balance">0 then begin
        AssignMatrix."Opening Balance":=PaymentDed."Closing Balance";
        if deductions."Balance Type"=deductions."Balance Type"::Decreasing then begin
        if PaymentDed."Closing Balance"<=Abs(AssignMatrix.Amount) then
        AssignMatrix.Amount:=-PaymentDed."Closing Balance"
        else
        AssignMatrix."Closing Balance":=PaymentDed."Closing Balance"+AssignMatrix.Amount;
        end;
        
        if deductions."Balance Type"=deductions."Balance Type"::Increasing then
        AssignMatrix."Closing Balance":=PaymentDed."Closing Balance"-AssignMatrix.Amount;
        end;
        end;
        
        
                 //END EMM
               if EmpRec.Get(PaymentDed."Employee No") then begin
                  // AssignMatrix."Payroll Group":=EmpRec."Posting Group";
        
        
               Window.Update(1,EmpRec."First Name"+' '+EmpRec."Middle Name"+ ' '+EmpRec."Last Name");
        
                   if (EmpRec.Status=EmpRec.Status::Active) and (CreateRec=true) then
                      AssignMatrix.Insert;
                   end;
                until PaymentDed.Next=0;
             end;
        
        
        
         //end carry forward any Non-recurring deductions;;
        
        
        
        
        //Manage loans
        
             PaymentDed.Reset;
             PaymentDed.SetRange(PaymentDed."Payroll Period",NewPeriod);
             PaymentDed.SetRange(Type,PaymentDed.Type::Deduction);
             if PaymentDed.Find('-') then  begin
              repeat
              if LoanApplicationForm.Get(PaymentDed."Reference No",PaymentDed.Code) then
              begin
              LoanApplicationForm.SetRange(LoanApplicationForm."Date filter",0D,PayperiodStart);
              LoanApplicationForm.CalcFields(LoanApplicationForm."Total Repayment");
              if (LoanApplicationForm."Approved Amount"+LoanApplicationForm."Total Repayment")=0 then
              begin
              Message('Loan %1 has expired',PaymentDed."Reference No");
              PaymentDed.Delete;
              end
              else
              begin
              if (LoanApplicationForm."Approved Amount"+LoanApplicationForm."Total Repayment")<LoanApplicationForm.Repayment then
              begin
        
              LoanApplicationForm.CalcFields(LoanApplicationForm."Total Repayment");
        
              PaymentDed.Amount:=-(LoanApplicationForm."Approved Amount"+LoanApplicationForm."Total Repayment");
              PaymentDed."Next Period Entry":=false;
              PaymentDed.Modify;
              end;
        
              end;
              end;
        
              until PaymentDed.Next=0;
             end;

    end;

    procedure Initialize()
    var
        InitEarnDeduct: Record "Assignment Matrix-X Temp-E";
    begin

         InitEarnDeduct.SetRange(InitEarnDeduct.Closed,false);

         repeat
           InitEarnDeduct."Payroll Period":=PayperiodStart;
           InitEarnDeduct.Modify;
         until InitEarnDeduct.Next=0;
    end;

    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
          AmountRemaining:=TaxableAmount;
          AmountRemaining:=AmountRemaining;
          AmountRemaining:=Round(AmountRemaining,0.01);
          EndTax:=false;

          TaxTable.SetRange("Table Code",TaxCode);

          if TaxTable.Find('-') then
          begin
            repeat
             if AmountRemaining<=0 then
                EndTax:=true
             else
              begin
               if Round((TaxableAmount),0.01)>TaxTable."Upper Limit" then
                Tax:=TaxTable."Taxable Amount"*TaxTable.Percentage/100
               else
               begin
                Tax:=AmountRemaining*TaxTable.Percentage/100;
                TotalTax:=TotalTax+Tax;
                EndTax:=true;
               end;
               if not EndTax then
               begin
               AmountRemaining:=AmountRemaining-TaxTable."Taxable Amount";
               TotalTax:=TotalTax+Tax;
               end;
              end;
            until (TaxTable.Next=0) or EndTax=true;
          end;
          TotalTax:=TotalTax;
          IncomeTax:=-TotalTax;
    end;

    procedure CreateLIBenefit(var Employee: Code[10];var BenefitCode: Code[10];var ReducedBalance: Decimal)
    var
        PaymentDeduction: Record "Assignment Matrix-X Temp-E";
        Payrollmonths: Record "Payroll PeriodXT";
        allowances: Record "EarningsX Temp-E";
    begin
        PaymentDeduction.Init;
        PaymentDeduction."Employee No":=Employee;
        PaymentDeduction.Code:=BenefitCode;
        PaymentDeduction.Type:=PaymentDeduction.Type::Payment;
        PaymentDeduction."Payroll Period":=CalcDate('1M',PayperiodStart);
        PaymentDeduction.Amount:=ReducedBalance*InterestDiff;
        PaymentDeduction."Non-Cash Benefit":=true;
        PaymentDeduction.Taxable:=true;
        //PaymentDeduction."Next Period Entry":=TRUE;
        if allowances.Get(BenefitCode) then
        PaymentDeduction.Description:=allowances.Description;
        PaymentDeduction.Insert;
    end;

    procedure CoinageAnalysis(var NetPay: Decimal) NetPay1: Decimal
    var
        Index: Integer;
        Intex: Integer;
        AmountArray: array [15] of Decimal;
        NoOfUnitsArray: array [15] of Integer;
        MinAmount: Decimal;
    begin
    end;

    procedure UpdateSalaryPointers(var PayrollPeriod: Date)
    var
        Emp: Record "Temporary Employee";
        RollingMonth: Integer;
    begin
        Emp.Reset;
        Emp.SetRange(Emp.Status,Emp.Status::Active);
        if Emp.Find('-') then
        begin
        repeat

        if Format(Date2DMY(NewPeriod,2))=Emp."Incremental Month" then
        begin

        if IncStr(Emp.Present)<Emp.Halt then
        begin
        //MESSAGE('%1 %2',INCSTR(Emp.Present),Emp.Halt);
        Emp.Previous:=Emp.Present;
        Emp.Present:=IncStr(Emp.Present);
        Emp.Modify;
        end;
        end;

        until Emp.Next=0;
        end;
    end;
}

