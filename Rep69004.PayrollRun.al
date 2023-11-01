report 69004 "Payroll Run"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING("No.") WHERE(Status = CONST(Active));
            RequestFilterFields = "No.", "Posting Group";

            trigger OnAfterGetRecord()
            begin
                NETPAY3 := 0;
                CompRec.Get;
                CompRec.TestField(CompRec."Tax Relief Code");
                Employee.CalcFields(Employee.Branch, Employee.Paypoint, Employee."Staffing Group", Employee.Department, Insurance, "Employee Contribution", "Employer Contribution");
                //NSSF 1 Deduction
                /*
                 Deductions.RESET;
                 Deductions.SETRANGE(Deductions.Code,CompRec."NSSF Tier I Code");
                
                 IF Deductions.FIND('-') THEN BEGIN
                  Assignmatrix.RESET;
                  Assignmatrix.SETRANGE(Assignmatrix.Code,Deductions.Code);
                  Assignmatrix.SETRANGE(Assignmatrix.Type,Assignmatrix.Type::Deduction);
                  Assignmatrix.SETRANGE(Assignmatrix."Employee No",Employee."No.");
                  Assignmatrix.SETRANGE(Assignmatrix."Payroll Period",Month);
                
                IF Assignmatrix.FIND('-') THEN BEGIN
                REPEAT
                
                //IF Employee."Skip NHIF Update"=FALSE THEN BEGIN
                  Assignmatrix.VALIDATE(Assignmatrix.Code);
                  Assignmatrix.MODIFY;
                
                //END;
                UNTIL Assignmatrix.NEXT=0;
                
                END;
                  // end of deletion
                END;
                */
                //NSSF 2 Deduction
                Deductions.Reset;
                Deductions.SetRange(Deductions.Code, CompRec."NSSF Tier II Code");

                if Deductions.Find('-') then begin

                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix.Code, Deductions.Code);
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);

                    if Assignmatrix.Find('-') then begin
                        //MESSAGE('%1',Assignmatrix.Code);
                        repeat

                            //IF Employee."Skip NHIF Update"=FALSE THEN BEGIN
                            Assignmatrix.Validate(Assignmatrix.Code);
                            Assignmatrix.Modify;

                        //END;
                        until Assignmatrix.Next = 0;

                    end else begin

                        Assignmatrix.Init;
                        Assignmatrix."Employee No" := Employee."No.";
                        Assignmatrix.Type := Assignmatrix.Type::Deduction;
                        Assignmatrix.Code := Deductions.Code;
                        Assignmatrix.Validate(Code);
                        Assignmatrix."Payroll Period" := Month;
                        Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                        //Assignmatrix.Amount:=0;
                        //MESSAGE('Incometax=%1',IncomeTax);
                        //Assignmatrix.Paye:=TRUE;
                        //Assignmatrix."Taxable amount":=TaxableAmount;
                        //Assignmatrix."Less Pension Contribution":=RetireCont;
                        //Assignmatrix.Paye:=TRUE;
                        Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                        Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                        Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                        Assignmatrix.Branch := Employee.Branch;
                        Assignmatrix."Job No" := Employee."Job No";
                        Assignmatrix."Job Task No" := Employee."Job Task No";
                        Assignmatrix."Pay Point" := Employee.Paypoint;
                        Assignmatrix."Staffing Group" := Employee."Staffing Group";
                        Assignmatrix."Department Code" := Employee.Department;
                        Assignmatrix.Validate(Amount);
                        if Assignmatrix.Amount <> 0 then
                            Assignmatrix.Insert;


                    end;
                    // end of deletion
                end;

                if Assignmatrix2.Get(Employee."No.", Assignmatrix2.Type::Payment
                , CompRec."Tax Relief Code", Month) = true then begin
                    Assignmatrix2.Validate(Assignmatrix2.Code);
                    Assignmatrix2.Modify
                end else begin

                    Assignmatrix.Init;
                    Assignmatrix.SetRange(Assignmatrix.Status, Employee.Status::Active);
                    Assignmatrix."Employee No" := Employee."No.";
                    Assignmatrix.Validate("Employee No");
                    Assignmatrix."Payroll Period" := Month;
                    Assignmatrix.Validate("Payroll Period");
                    Assignmatrix.Type := Assignmatrix.Type::Payment;
                    Assignmatrix.Code := CompRec."Tax Relief Code";
                    Assignmatrix.Validate(Code);
                    //Assignmatrix.Amount:=-NETPAY3;
                    Assignmatrix.Validate(Amount);
                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                    Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                    Assignmatrix."Job No" := Employee."Job No";
                    Assignmatrix."Job Task No" := Employee."Job Task No";
                    Assignmatrix.Branch := Employee.Branch;
                    Assignmatrix."Pay Point" := Employee.Paypoint;
                    Assignmatrix."Staffing Group" := Employee."Staffing Group";
                    Assignmatrix."Department Code" := Employee."Department Name";
                    Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                    Assignmatrix.Insert;

                end;



                Deductions.Reset;
                Deductions.SetRange(Deductions."PAYE Code", true);
                if Deductions.Find('-') then begin
                    // Delete all Previous PAYE
                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix.Code, Deductions.Code);
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                    Assignmatrix.DeleteAll;
                    // end of deletion
                end;
                Deductions.Reset;
                Deductions.SetRange(Deductions."Applies to All", true);
                if Deductions.Find('-') then begin
                    Assignmatrix.Type := Assignmatrix.Type::Deduction;
                    Assignmatrix."Employee No" := Employee."No.";
                    Assignmatrix."Payroll Period" := Month;
                    Assignmatrix.code := Deductions.Code;
                    Assignmatrix.Validate(Code);
                    // if Assignmatrix.Insert() then;
                    // end of deletion
                end;
                // validate assigment matrix code incase basic salary change and update calculation based on basic salary
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                if Assignmatrix.Find('-') then begin
                    repeat
                        if Assignmatrix.Type = Assignmatrix.Type::Payment then begin
                            if Earnings.Get(Assignmatrix.Code) then begin
                                ///IF (Earnings."Calculation Method"=Earnings."Calculation Method"::"% of Basic pay") OR AULERIAH
                                if (Earnings."Calculation Method" = Earnings."Calculation Method"::"% of Basic after tax") or
                                   (Earnings."Calculation Method" = Earnings."Calculation Method"::"Based on Hourly Rate") then begin

                                    Assignmatrix.Validate(Code);
                                    Assignmatrix.Validate(Assignmatrix."Employee Voluntary");
                                    //Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);

                                    Assignmatrix.Modify;
                                end;
                            end;
                        end;
                        if Assignmatrix.Retirement = false then begin
                            if Assignmatrix.Type = Assignmatrix.Type::Deduction then begin
                                if Deductions.Get(Assignmatrix.Code) then begin
                                    if (Deductions."Calculation Method" = Deductions."Calculation Method"::"% of Basic Pay") or
                                       (Deductions."Calculation Method" = Deductions."Calculation Method"::"Based on Hourly Rate") or
                                       (Deductions."Calculation Method" = Deductions."Calculation Method"::"Based on Daily Rate ") then begin

                                        Assignmatrix.Validate(Code);
                                        Assignmatrix.Validate(Assignmatrix."Employee Voluntary");
                                        // Assignmatrix.Amount:=ROUND(Assignmatrix.Amount,1);

                                        Assignmatrix.Modify;
                                    end;
                                end;
                            end;
                        end;
                        if Assignmatrix.Type = Assignmatrix.Type::Deduction then begin
                            if Deductions.Get(Assignmatrix.Code) then begin
                                if (Deductions."Calculation Method" = Deductions."Calculation Method"::"Based on Table") then begin

                                    Assignmatrix.Validate(Code);
                                    Assignmatrix.Amount := Round(Assignmatrix.Amount, 1);

                                    Assignmatrix.Modify;
                                end;
                            end;
                        end;
                    until Assignmatrix.Next = 0;
                end;



                //Assign Insurance Relief Daudi
                if Employee.Insurance <> 0 then begin
                    Earnings.Reset;
                    Earnings.SetCurrentKey("Earning Type");
                    Earnings.SetRange("Earning Type", Earnings."Earning Type"::"Insurance Relief");
                    if Earnings.Find('-') then begin
                        InsuranceAmount := 0;
                        InsuranceAmount := Abs(Employee.Insurance * (Earnings.Percentage / 100));
                        if InsuranceAmount > 5000 then
                            InsuranceAmount := Earnings."Maximum Limit";
                        Assignmatrix.Init;
                        Assignmatrix."Employee No" := Employee."No.";
                        Assignmatrix.Type := Assignmatrix.Type::Payment;
                        Assignmatrix.Code := Earnings.Code;
                        Assignmatrix.Validate(Code);
                        Assignmatrix."Payroll Period" := Month;
                        Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                        Assignmatrix.Amount := InsuranceAmount;
                        Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                        Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                        Assignmatrix.Branch := Employee.Branch;
                        Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                        Assignmatrix."Pay Point" := Employee.Paypoint;
                        Assignmatrix."Staffing Group" := Employee."Staffing Group";
                        Assignmatrix."Department Code" := Employee.Department;
                        Assignmatrix."Job No" := Employee."Job No";
                        Assignmatrix."Job Task No" := Employee."Job Task No";
                        Assignmatrix.Validate(Amount);
                        if (Assignmatrix.Amount <> 0) and
                           (not Assignmatrix.Get(Assignmatrix."Employee No", Assignmatrix.Type,
                                Assignmatrix.Code, Assignmatrix."Payroll Period", Assignmatrix."Reference No")) then
                            Assignmatrix.Insert
                        else begin
                            InsuranceAmount := Abs(Employee.Insurance * (Earnings.Percentage / 100));
                            if InsuranceAmount > 5000 then
                                InsuranceAmount := Earnings."Maximum Limit";
                            Assignmatrix.Init;
                            Assignmatrix."Employee No" := Employee."No.";
                            Assignmatrix.Type := Assignmatrix.Type::Payment;
                            Assignmatrix.Code := Earnings.Code;
                            Assignmatrix.Validate(Code);
                            Assignmatrix."Payroll Period" := Month;
                            Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                            Assignmatrix.Amount := InsuranceAmount;
                            Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                            Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                            Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                            Assignmatrix.Branch := Employee.Branch;
                            Assignmatrix."Job No" := Employee."Job No";
                            Assignmatrix."Job Task No" := Employee."Job Task No";
                            Assignmatrix."Pay Point" := Employee.Paypoint;
                            Assignmatrix."Staffing Group" := Employee."Staffing Group";
                            Assignmatrix."Department Code" := Employee.Department;
                            Assignmatrix.Validate(Amount);
                            Assignmatrix.Modify;
                        end;
                    end;
                end else begin
                    Earnings.Reset;
                    Earnings.SetCurrentKey("Earning Type");
                    Earnings.SetRange("Earning Type", Earnings."Earning Type"::"Insurance Relief");
                    if Earnings.Find('-') then begin
                        Assignmatrix.Reset;
                        Assignmatrix.SetRange(Assignmatrix.Code, Earnings.Code);
                        Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Payment);
                        Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                        Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                        Assignmatrix.DeleteAll;
                    end;
                end;

                //

                //Delete Tax Relief for Secondary Employees
                if Employee."Employee Type" = Employee."Employee Type"::Secondary then begin
                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix.Code, 'MPR');
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Payment);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                    Assignmatrix.DeleteAll;

                end;
                //End Delete Tax Relief for Secondary Employees

                //Delete Tax Relief for Non Resident
                if Employee."Residential Status" = Employee."Residential Status"::"Non-Resident" then begin
                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix.Code, 'MPR');
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Payment);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                    Assignmatrix.DeleteAll;

                end;

                //End Delete Tax Relief for Non Resident


                //Compute Excess Pension
                ExcessP := 0;
                HRSetup.Get;
                ExcessP := Abs(Employee."Employee Contribution") + Abs(Employee."Employer Contribution") - HRSetup."Pension Limit Amount";
                if ExcessP > 0 then begin

                    Assignmatrix.Reset;
                    Assignmatrix.SetRange("Employee No", Employee."No.");
                    Assignmatrix.SetRange(Type, Assignmatrix.Type::Payment);
                    Assignmatrix.SetRange(Code, HRSetup."Excess Pension Code");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                    if Assignmatrix.Find('-') then begin
                        Assignmatrix.DeleteAll;
                    end;

                    Assignmatrix.Init;
                    Assignmatrix."Employee No" := Employee."No.";
                    Assignmatrix.Validate("Employee No");
                    Assignmatrix.Type := Assignmatrix.Type::Payment;
                    Assignmatrix.Code := HRSetup."Excess Pension Code";
                    Assignmatrix.Validate(Code);
                    Assignmatrix."Payroll Period" := Month;
                    Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                    Assignmatrix.Amount := ExcessP;
                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                    Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                    Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                    Assignmatrix.Branch := Employee.Branch;
                    Assignmatrix."Pay Point" := Employee.Paypoint;
                    Assignmatrix."Staffing Group" := Employee."Staffing Group";
                    Assignmatrix."Department Code" := Employee.Department;
                    Assignmatrix."Job No" := Employee."Job No";
                    Assignmatrix."Job Task No" := Employee."Job Task No";
                    Assignmatrix.Validate(Amount);
                    Assignmatrix.Insert(true);
                end;
                //End Compute Excess Pension


                Deductions.Reset;
                Deductions.SetRange(Deductions."PAYE Code", true);
                if Deductions.Find('-') then begin

                    if Employee."Employee Type" = Employee."Employee Type"::Primary then
                        GetPaye.CalculateTaxableAmount(Employee."No.", Month, IncomeTax, TaxableAmount, RetireCont)
                    else
                        //      GetPaye.CalculateTaxableAmountPro(Employee."No.", Month, IncomeTax, TaxableAmount, RetireCont);
                        // Create PAYE
                        Assignmatrix.Init;
                    Assignmatrix."Employee No" := Employee."No.";
                    Assignmatrix.Type := Assignmatrix.Type::Deduction;
                    Assignmatrix.Code := Deductions.Code;
                    Assignmatrix.Validate(Code);
                    Assignmatrix."Payroll Period" := Month;
                    Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                    if IncomeTax > 0 then
                        IncomeTax := -IncomeTax;
                    // Assignmatrix.Amount:=ROUND(IncomeTax,1,'<');
                    Assignmatrix.Amount := IncomeTax;
                    //MESSAGE('Incometax=%1',IncomeTax);
                    Assignmatrix.Paye := true;
                    //MESSAGE('TaxableAmount=%1',TaxableAmount);
                    Assignmatrix."Taxable amount" := TaxableAmount;
                    Assignmatrix."Less Pension Contribution" := RetireCont;
                    Assignmatrix.Paye := true;
                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                    Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                    Assignmatrix.Branch := Employee.Branch;
                    Assignmatrix."Job No" := Employee."Job No";
                    Assignmatrix."Job Task No" := Employee."Job Task No";
                    Assignmatrix."Pay Point" := Employee.Paypoint;
                    Assignmatrix."Staffing Group" := Employee."Staffing Group";
                    Assignmatrix."Department Code" := Employee.Department;
                    Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                    Assignmatrix.Validate(Amount);
                    if Assignmatrix.Amount <> 0 then
                        Assignmatrix.Insert;
                end else
                    Error('Must specify Paye Code under deductions');

                //Update Pay Mode
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                if Assignmatrix.Find('-') then
                    repeat
                        if Employee."Payroll Pay Mode" <> Assignmatrix."Pay Mode" then begin
                            Assignmatrix."Pay Mode" := Employee."Payroll Pay Mode";
                            Assignmatrix.Modify;
                        end;
                    until Assignmatrix.Next = 0;
                //

                //Update Pay Mode
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                Assignmatrix.SetRange("Basic Salary Code", true);
                if Assignmatrix.Find('-') then begin

                    Assignmatrix.Status := Employee.Status.AsInteger();
                    Assignmatrix.Modify;
                end;

                //

                if ((Employee."Terminal Dues" = true) and (Employee."Pays tax?" = true)) then begin
                    Employee.SetRange(Employee."Pay Period Filter", Month);
                    Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions");

                    //NHIF deduction
                    Deductions.Reset;
                    Deductions.SetRange(Deductions.Code, CompRec."NHIF Code");

                    if Deductions.Find('-') then begin

                        Assignmatrix.Reset;
                        Assignmatrix.SetRange(Assignmatrix.Code, Deductions.Code);
                        Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                        Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                        Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);

                        if Assignmatrix.Find('-') then begin
                            repeat
                                Assignmatrix.Validate(Assignmatrix.Code);
                                Assignmatrix.Modify;
                            until Assignmatrix.Next = 0;

                        end;
                        // end of deletion
                    end;

                    NETPAY3 := Employee."Total Allowances" + Employee."Total Deductions";

                    if NETPAY3 <> 0 then begin


                        Assignmatrix.Init;
                        Assignmatrix."Employee No" := Employee."No.";
                        Assignmatrix.Validate("Employee No");
                        Assignmatrix."Payroll Period" := Month;
                        Assignmatrix.Validate("Payroll Period");
                        Assignmatrix.Type := Assignmatrix.Type::Deduction;
                        Assignmatrix.Code := CompRec."Net Pay Advance Code";
                        Assignmatrix.Validate(Code);
                        Assignmatrix.Amount := -NETPAY3;
                        Assignmatrix.Validate(Amount);
                        Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                        Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                        Assignmatrix.Branch := Employee.Branch;
                        Assignmatrix."Pay Point" := Employee.Paypoint;
                        Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                        Assignmatrix."Staffing Group" := Employee."Staffing Group";
                        Assignmatrix."Department Code" := Employee.Department;
                        Assignmatrix."Job No" := Employee."Job No";
                        Assignmatrix."Job Task No" := Employee."Job Task No";

                        if Assignmatrix2.Get(Assignmatrix."Employee No", Assignmatrix.Type::Deduction
                        , Assignmatrix.Code, Assignmatrix."Payroll Period") = true then
                            Assignmatrix.Modify
                        else
                            Assignmatrix.Insert;
                    end;

                    //MESSAGE('%1',NETPAY3);
                    //CurrReport.SKIP;
                end;

                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix.Code, '869');
                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                Assignmatrix.DeleteAll;


                LoanBalance := 0;
                LoanApplication.Reset;
                LoanApplication.SetRange(LoanApplication."Employee No", Employee."No.");
                if LoanApplication.Find('-') then
                    repeat
                        if LoanType.Get(LoanApplication."Loan Product Type") then begin
                            LoanApplication.SetRange(LoanApplication."Date filter", 0D, LastMonth);
                            LoanApplication.CalcFields(LoanApplication."Total Repayment");
                            LoanBalance := LoanApplication."Approved Amount" + LoanApplication."Total Repayment";
                            //MESSAGE('%1 Balance =%2',LoanApplication."Loan No",LoanBalance);


                            if LoanBalance < LoanApplication.Repayment then begin
                                Assignmatrix.Reset;
                                Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Deduction Code");
                                Assignmatrix.SetRange("Reference No", LoanApplication."Loan No");
                                if Assignmatrix.Find('+') then begin
                                    if LoanBalance > 0 then
                                        Assignmatrix.Amount := -LoanBalance
                                    else begin
                                        Assignmatrix.Amount := 0;

                                    end;
                                    Assignmatrix."Next Period Entry" := false;

                                    Assignmatrix.Modify;
                                end;


                            end;


                            if LoanType."Calculate Interest" then begin

                                LoanApplication.SetRange(LoanApplication."Date filter", 0D, LastMonth);
                                LoanApplication.CalcFields(LoanApplication."Total Repayment");
                                LoanBalance := LoanApplication."Approved Amount" + LoanApplication."Total Repayment";
                                InterestAmt := (LoanType."Interest Rate" / 100) * LoanBalance;



                                if InterestAmt <> 0 then begin
                                    Assignmatrix.Init;
                                    Assignmatrix."Employee No" := Employee."No.";
                                    Assignmatrix.Type := Assignmatrix.Type::Deduction;
                                    Assignmatrix.Code := LoanType."Interest Deduction Code";
                                    Assignmatrix.Validate(Code);
                                    Assignmatrix."Payroll Period" := Month;
                                    Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                                    Assignmatrix.Amount := -InterestAmt;
                                    Assignmatrix."Job No" := Employee."Job No";
                                    Assignmatrix."Job Task No" := Employee."Job Task No";
                                    Assignmatrix."Reference No" := LoanApplication."Loan No";
                                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";

                                    if not Assignmatrix.Get(Assignmatrix."Employee No", Assignmatrix.Type, Assignmatrix.Code, Assignmatrix."Payroll Period",
                                    Assignmatrix."Reference No") then
                                        Assignmatrix.Insert
                                    else begin
                                        Assignmatrix.Reset;
                                        Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                        Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                        Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                        Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Interest Deduction Code");
                                        Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
                                        if Assignmatrix.Find('-') then begin
                                            Assignmatrix.Amount := -InterestAmt;
                                            Assignmatrix.Modify;
                                        end;
                                    end;


                                end;
                            end;

                            if LoanApplication."Stop Loan" then begin
                                Assignmatrix.Reset;
                                Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Deduction Code");
                                Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
                                Assignmatrix.DeleteAll;

                                Assignmatrix.Reset;
                                Assignmatrix.SetRange(Assignmatrix."Payroll Period", DateSpecified);
                                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                                Assignmatrix.SetRange(Assignmatrix.Code, LoanType."Interest Deduction Code");
                                Assignmatrix.SetRange(Assignmatrix."Reference No", LoanApplication."Loan No");
                                Assignmatrix.DeleteAll;


                            end;


                        end;



                    until LoanApplication.Next = 0;

                //calculate Gratuity for contract employees

                if Employee."Employement Terms" = Employee."Employement Terms"::Contract then begin

                    Assignmatrix.Reset;
                    Assignmatrix.SetRange(Assignmatrix."Basic Salary Code", true);
                    Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Payment);
                    Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                    Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);

                    if Assignmatrix.Find('-') then begin
                        //MESSAGE('%1',Assignmatrix.Code);
                        repeat

                            //IF Employee."Skip NHIF Update"=FALSE THEN BEGIN
                            CompRec.Get;
                            Assignmatrix."Gratuity Amount" := CompRec."Gratuity Percentage" / 100 * Assignmatrix.Amount;
                            //Assignmatrix.VALIDATE(Assignmatrix.Code);
                            Assignmatrix.Modify;

                        //END;
                        until Assignmatrix.Next = 0;

                    end;
                end;


                //Added by Morris to Validate Translated amounts and Computations depending on Basic
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                if Assignmatrix.Find('-') then begin
                    repeat
                        if Assignmatrix.Type = Assignmatrix.Type::Payment then begin
                            if Payments.Get(Assignmatrix.Code) then begin
                                if Payments."Calculation Method" = Payments."Calculation Method"::"% of Basic pay" then begin
                                    Assignmatrix.Code := Payments.Code;
                                    Assignmatrix.Validate(Assignmatrix.Code);
                                    Assignmatrix.Modify;
                                end;
                            end;
                        end;

                        if Assignmatrix.Type = Assignmatrix.Type::Deduction then begin
                            if Deductions.Get(Assignmatrix.Code) then begin
                                if Deductions."Calculation Method" = Deductions."Calculation Method"::"% of Basic Pay"
                                then begin
                                    Assignmatrix.Code := Deductions.Code;
                                    Assignmatrix.Validate(Assignmatrix.Code);
                                    Assignmatrix.Modify;
                                end;
                            end;
                        end;

                    until Assignmatrix.Next = 0;

                end;
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                if Assignmatrix.Find('-') then begin
                    repeat
                        //******* Update Job and Task Number******//
                        if Emp.Get(Employee."No.") then begin
                            //MESSAGE('Code %1',Code);
                            Assignmatrix."Posting Group Filter" := Emp."Posting Group";
                            Assignmatrix."Job No" := Emp."Job No";
                            Assignmatrix."Job Task No" := Emp."Job Task No";
                            Assignmatrix.Modify;
                        end;//****
                    until Assignmatrix.Next = 0;
                end;

                //Added By Morris to Compute Loan Interest
                FnProcessInterest(Month, Employee."No.");

                Window.Update(1, Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");

            end;

            trigger OnPostDataItem()
            begin
                Window.Close;
                FindNetPay(Employee, Month);
            end;

            trigger OnPreDataItem()
            begin
                Window.Open('Calculating Payroll To ##############################1', EmployeeName);
                PayrollPeriod.SetRange(Closed, false);
                if PayrollPeriod.Find('-') then
                    Month := PayrollPeriod."Starting Date";
                LastMonth := CalcDate('-1M', Month);
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

    trigger OnPostReport()
    begin
        //Report.RUN(69016);
    end;

    trigger OnPreReport()
    begin
        GetPayPeriod;
        FnDeactivateExpiredContracts;
        PayrollPeriodF := Employee.GetRangeMin(Employee."Pay Period Filter");
        FnDiactivateDisabilityExmpts;
        //PayPeriodtext:="Employee PayrollX".GETFILTER("Pay Period Filter");
        // IF PayPeriodtext='' THEN
        // ERROR('Pay period must be specified for this report');

        //DateSpecified:="Employee PayrollX".GETRANGEMIN("Employee PayrollX"."Pay Period Filter");
        DateSpecified := BeginDate;
        if PayPeriod.Get(DateSpecified) then
            PayPeriodtext := PayPeriod.Name;
        EndDate := CalcDate('1M', DateSpecified - 1);
        CompRec.Get;
        TaxCode := CompRec."Tax Table";
    end;

    var
        Assignmatrix: Record "Assignment Matrix-X";
        BeginDate: Date;
        DateSpecified: Date;
        BasicSalary: Decimal;
        TaxableAmount: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        TaxCode: Code[10];
        retirecontribution: Decimal;
        ExcessRetirement: Decimal;
        GrossPay: Decimal;
        TotalBenefits: Decimal;
        TaxablePay: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        IncomeTax: Decimal;
        relief: Decimal;
        EmpRec: Record Employee;
        NetPay: Decimal;
        NetPay1: Decimal;
        Index: Integer;
        Intex: Integer;
        AmountRemaining: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        DenomArray: array[1, 12] of Text[50];
        NoOfUnitsArray: array[1, 12] of Integer;
        AmountArray: array[1, 60] of Decimal;
        PayMode: Text[30];
        PayPeriodtext: Text[30];
        EndDate: Date;
        DaysinAmonth: Decimal;
        HoursInamonth: Decimal;
        Earnings: Record EarningsX;
        CfMpr: Decimal;
        Deductions: Record DeductionsX;
        NormalOvertimeHours: Decimal;
        WeekendOvertime: Decimal;
        PayrollPeriod: Record "Payroll PeriodX";
        Window: Dialog;
        EmployeeName: Text[230];
        NoOfDays: Integer;
        Month: Date;
        GetPaye: Codeunit Payroll3;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        // ScalePointer: Record "Salary Pointers2";
        // SalaryScale: Record "Salary Scales2";
        CurrentMonth: Integer;
        CurrentMonthtext: Text[30];
        //  HseAllow: Record "House Allowance Matrix2";
        Ded: Record DeductionsX;
        Assmatrix: Record "Assignment Matrix-X";
        LoanType: Record "Loan Product Type";
        LoanApplication: Record "Loan Application";
        LoanBalance: Decimal;
        InterestAmt: Decimal;
        RefNo: Code[20];
        LastMonth: Date;
        NextPointer: Code[10];
        UserRole: Record "Access Control";
        NETPAY3: Decimal;
        Assignmatrix2: Record "Assignment Matrix-X";
        InsuranceAmount: Decimal;
        Payments: Record EarningsX;
        HRSetup: Record "Human Resources Setup";
        EmployeeRec: Record Employee;
        ExcessP: Decimal;
        NetPayThird: Record Employee;
        PayrollPeriodF: Date;
        Emp: Record Employee;
        LoanOpeningBalance: Decimal;

    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        //AmountRemaining:=ROUND(AmountRemaining,0.01);
        EndTax := false;
        TaxTable.SetRange("Table Code", TaxCode);


        if TaxTable.Find('-') then begin
            repeat

                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    //IF ROUND((TaxableAmount),0.01)>TaxTable."Upper Limit" THEN
                    if TaxableAmount > TaxTable."Upper Limit" then
                        Tax := TaxTable."Taxable Amount" * TaxTable.Percentage / 100

                    else begin
                        Tax := AmountRemaining * TaxTable.Percentage / 100;
                        TotalTax := TotalTax + Tax;
                        EndTax := true;
                    end;
                    if not EndTax then begin
                        AmountRemaining := AmountRemaining - TaxTable."Taxable Amount";
                        TotalTax := TotalTax + Tax;
                    end;
                end;
            until (TaxTable.Next = 0) or EndTax = true;
        end;
        TotalTax := TotalTax;
        TotalTax := PayrollRounding(TotalTax);
        IncomeTax := -TotalTax;
        if not Employee."Pays tax?" then
            IncomeTax := 0;
    end;

    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
        end;
    end;

    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if HRsetup."Payroll Rounding Type" = HRsetup."Payroll Rounding Type"::Nearest then
            PayrollRounding := Round(Amount, HRsetup."Payroll Rounding Precision", '=');

        if HRsetup."Payroll Rounding Type" = HRsetup."Payroll Rounding Type"::Up then
            PayrollRounding := Round(Amount, HRsetup."Payroll Rounding Precision", '>');

        if HRsetup."Payroll Rounding Type" = HRsetup."Payroll Rounding Type"::Down then
            PayrollRounding := Round(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;

    procedure DefaultAssignment(EmployeeRec: Record Employee)
    var
        ScaleBenefits: Record "Scale Benefits";
    begin
        GetPayPeriod;
        if BeginDate <> 0D then begin
            Assmatrix.Init;
            Assmatrix."Employee No" := EmployeeRec."No.";
            Assmatrix.Type := Assmatrix.Type::Payment;
            Assmatrix."Payroll Period" := BeginDate;
            Assmatrix."Department Code" := EmployeeRec."Global Dimension 1 Code";
            Assmatrix."Posting Group Filter" := EmployeeRec."Posting Group";
            Assmatrix."Job No" := EmployeeRec."Job No";
            Assmatrix."Job Task No" := EmployeeRec."Job Task No";
            ScaleBenefits.Reset;
            ScaleBenefits.SetRange("Salary Scale", EmployeeRec."Salary Scale");
            ScaleBenefits.SetRange("Salary Pointer", EmployeeRec.Present);
            if ScaleBenefits.Find('-') then begin
                repeat
                    Assmatrix.Code := ScaleBenefits."ED Code";
                    Assmatrix.Validate(Code);
                    Assmatrix.Amount := ScaleBenefits.Amount;
                    Assmatrix.Validate(Amount);
                    if not Assmatrix.Get(Assmatrix."Employee No", Assmatrix.Type, Assmatrix.Code, Assmatrix."Payroll Period") then
                        Assmatrix.Insert
                    else begin
                        Assmatrix.Code := ScaleBenefits."ED Code";
                        Assmatrix.Validate(Code);
                        Assmatrix.Amount := ScaleBenefits.Amount;
                        Assmatrix.Validate(Amount);
                        Assmatrix.Modify;
                    end;
                until ScaleBenefits.Next = 0;
            end;


            // Insert Deductions assigned to every employee
            Ded.Reset;
            Ded.SetRange("Applies to All", true);
            if Ded.Find('-') then begin
                repeat
                    Assmatrix.Init;
                    Assmatrix."Employee No" := EmployeeRec."No.";
                    Assmatrix."Posting Group Filter" := EmployeeRec."Posting Group";
                    Assmatrix.Type := Assmatrix.Type::Deduction;
                    Assmatrix."Payroll Period" := BeginDate;
                    Assmatrix."Job No" := EmployeeRec."Job No";
                    Assmatrix."Job Task No" := EmployeeRec."Job Task No";
                    Assmatrix."Department Code" := EmployeeRec."Global Dimension 1 Code";
                    Assmatrix.Code := Ded.Code;
                    Assmatrix.Validate(Code);
                    if not Assmatrix.Get(Assmatrix."Employee No", Assmatrix.Type, Assmatrix.Code, Assmatrix."Payroll Period") then
                        Assmatrix.Insert
                    else begin
                        Assmatrix.Code := Ded.Code;
                        Assmatrix.Validate(Code);
                    end;
                until Ded.Next = 0;
            end;

        end;
    end;

    procedure FnDeactivateExpiredContracts()
    var
        Employee: Record Employee;
    begin

        Employee.Reset;
        //Employee.SETRANGE("Employement Terms",Employee."Employement Terms"::Contract);
        Employee.SetRange(Status, Employee.Status::Active);
        Employee.SetFilter("Termination Date", '<>%1', 0D);
        if Employee.FindFirst then begin
            repeat
                if (Employee."Termination Date" < Today) then begin
                    Employee.Status := Employee.Status::Inactive;
                    Employee.Modify;
                end;
            until Employee.Next = 0;
        end;
    end;

    procedure FindNetPay(EmployeeNumber: Record Employee; Month: Date)
    var
        Assignment13: Record "Assignment Matrix-X";
        NetPay: Decimal;
        TotalDed: Decimal;
        TotalEa: Decimal;
        BasicPay: Decimal;
        Text001: Label 'The following employee:    %1 has a net salary of %2, that  is  less than 1/3 of the basic which is: %3 .Kindly check';
    begin
        NetPay := 0;
        Assignment13.Reset;
        Assignment13.SetRange("Employee No", EmployeeNumber."No.");
        Assignment13.SetRange("Payroll Period", Month);
        if Assignment13.FindSet then begin
            repeat
                NetPay := Assignment13.Amount + NetPay;
            until Assignment13.Next = 0;
        end;
        Assignment13.Reset;
        Assignment13.SetRange("Employee No", EmployeeNumber."No.");
        Assignment13.SetRange("Payroll Period", Month);
        Assignment13.SetRange("Basic Salary Code", true);
        if Assignment13.FindSet then begin
            TotalEa := Assignment13.Amount;
        end;
        if NetPay < (1 / 3 * TotalEa) then
            Error(Text001, EmployeeNumber."First Name" + ' ' + EmployeeNumber."Middle Name" + ' ' + EmployeeNumber."Last Name", NetPay, TotalEa);
    end;

    procedure FnDiactivateDisabilityExmpts()
    var
        Employee: Record Employee;
    begin
        Employee.Reset;
        Employee.SetRange(Status, Employee.Status::Active);
        //   Employee.SetFilter("Disability Expiry Date", '<>%1', 0D);
        if Employee.FindFirst then begin
            repeat
                //    if (Employee."Disability Expiry Date" < PayrollPeriodF) then begin
                Employee."Pays tax?" := false;
                Employee.Modify;
                //end;
            until Employee.Next = 0;
        end;
    end;

    procedure FnProcessInterest(PayrollPeriod: Date; EmpNo: Code[30])
    var
        LoanProductType: Record "Loan Product Type";
    begin
        LoanProductType.Reset;
        LoanProductType.SetRange("Calculate Interest", true);
        if LoanProductType.Find('-') then begin
            repeat
                LoanOpeningBalance := 0;
                Assignmatrix.Reset;
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", PayrollPeriod);
                Assignmatrix.SetRange(Assignmatrix.Code, LoanProductType."Deduction Code");
                Assignmatrix.SetRange(Assignmatrix."Employee No", EmpNo);
                if Assignmatrix.Find('-') then begin
                    repeat
                        if Assignmatrix."Opening Balance" <> 0 then begin
                            //MESSAGE('%1',AssignMatrix."Opening Balance");
                            //Insert Interest Recovery
                            LoanOpeningBalance := Assignmatrix."Opening Balance";
                            Assignmatrix.Reset;
                            Assignmatrix.SetRange("Payroll Period", PayrollPeriod);
                            Assignmatrix.SetRange(Assignmatrix."Employee No", EmpNo);
                            Assignmatrix.SetRange(Code, LoanProductType."Interest Deduction Code");
                            if Assignmatrix.Find('-') then begin
                                Assignmatrix2.Code := LoanProductType."Interest Deduction Code";
                                Assignmatrix2."Employee No" := Assignmatrix."Employee No";
                                Assignmatrix2.Validate(Assignmatrix2."Employee No");
                                Assignmatrix2."Payroll Period" := PayrollPeriod;
                                Assignmatrix2."Pay Period" := Assignmatrix."Pay Period";
                                Assignmatrix2.Type := Assignmatrix2.Type::Deduction;
                                Assignmatrix2."Reference No" := LoanProductType."Deduction Code";

                                Assignmatrix2.Validate(Code);
                                Assignmatrix.Amount := LoanOpeningBalance * LoanProductType."Interest Rate" / 100 * -1;
                                Assignmatrix2.Validate(Amount);
                                Assignmatrix.Modify;
                            end else begin
                                Assignmatrix2.Init;
                                Assignmatrix2.Code := LoanProductType."Interest Deduction Code";
                                Assignmatrix2."Employee No" := Assignmatrix."Employee No";
                                Assignmatrix2.Validate(Assignmatrix2."Employee No");
                                Assignmatrix2."Payroll Period" := PayrollPeriod;
                                Assignmatrix2."Pay Period" := Assignmatrix."Pay Period";
                                Assignmatrix2.Type := Assignmatrix2.Type::Deduction;
                                Assignmatrix2."Reference No" := LoanProductType."Deduction Code";

                                Assignmatrix2.Validate(Code);

                                Assignmatrix2.Amount := Assignmatrix."Opening Balance" * LoanProductType."Interest Rate" / 100;
                                Assignmatrix2.Validate(Amount);

                                //MESSAGE('%1',AssignMatrix.Amount);
                                Assignmatrix2."Loan Repay" := true;
                                Assignmatrix2."Loan Product Type" := LoanProductType.Code;
                                //AssignMatrix2."Loan No":="Loan Repayment Schedule"."Loan No.";
                                Assignmatrix2.Interest := true;
                                if not Assignmatrix2.Get(Assignmatrix2."Employee No", Assignmatrix2.Type, Assignmatrix2.Code,
                                  Assignmatrix2."Payroll Period", Assignmatrix2."Reference No") then
                                    Assignmatrix2.Insert;
                            end;
                        end;
                    until Assignmatrix.Next = 0;
                end;
            until LoanProductType.Next = 0;
        end;
    end;
}

