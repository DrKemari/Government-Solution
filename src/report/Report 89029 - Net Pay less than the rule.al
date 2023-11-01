report 89029 "Net Pay less than the rule"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Net Pay less than the rule.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "Pay Period Filter";
            column(No_Employee;Employee."No.")
            {
            }
            column(Employee_Name;"First Name" + ' '+"Middle Name"+' '+"Last Name")
            {
            }
            column(DateSpecified;DateSpecified)
            {
            }
            column(Dept;Employee."Global Dimension 1 Code")
            {
            }
            column(counter;counter)
            {
            }
            dataitem("Integer";"Integer")
            {
                DataItemTableView = SORTING(Number);
                column(Allowances_Number_;Allowances[Number])
                {
                }
                column(EarnDesc_Number_;EarnDesc[Number])
                {
                }

                trigger OnPreDataItem()
                begin
                     Integer.SetRange(Number,1,i);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                Employee.CalcFields(Employee."Total Allowances",Employee."Total Deductions","Total Statutory");
                if (Employee."Total Allowances"+Employee."Total Deductions")=0 then
                CurrReport.Skip;
                counter:=counter+1;
                NetPay:=Employee."Total Allowances"+Employee."Total Deductions";

                if Assignmat.Get(Employee."No.",Assignmat.Type::Deduction,HRSetup."Net Pay Advance Code",DateSpecified) then
                 NetPayAdvance:=Assignmat.Amount
                else
                 NetPayAdvance:=0;


                if (((Employee."Total Allowances"+Employee."Total Deductions")=0) and (NetPayAdvance=0))  then
                CurrReport.Skip;



                if (Employee."Total Allowances"+Employee."Total Deductions")>1/3*(Employee."Total Allowances"+Employee."Total Statutory") then
                CurrReport.Skip;

                Clear(Allowances);
                Clear(Deductions);

                OtherEarn:=0;
                OtherDeduct:=0;
                Totallowances:=0;
                OtherDeduct:=0;
                TotalDeductions:=0;

                for i:=1 to NoOfEarnings do
                begin
                Assignmat.Reset;
                Assignmat.SetRange(Assignmat."Employee No",Employee."No.");
                Assignmat.SetRange(Assignmat.Type,Assignmat.Type::Payment);
                Assignmat.SetRange(Assignmat.Code,Earncode[i]);
                Assignmat.SetRange(Assignmat."Payroll Period",DateSpecified);
                if Assignmat.Find('-') then begin
                Assignmat.CalcSums(Amount);
                Allowances[i]:=Assignmat.Amount;
                Totallowances:=Totallowances+Allowances[i];
                end else begin
                   if Earncode[i]='OTHER EARNINGS' then begin
                    Allowances[i]:=Employee."Total Allowances"-Totallowances;
                    end
                   else if Earncode[i]='GROSS PAY' then
                    Allowances[i]:=Employee."Total Allowances";
                  end;
                end;


                for i:=NoOfEarnings+1 to NoOfEarnings+NoOfDeductions do
                begin
                Assignmat.Reset;
                Assignmat.SetRange(Assignmat."Employee No",Employee."No.");
                Assignmat.SetRange(Assignmat.Type,Assignmat.Type::Deduction);
                Assignmat.SetRange(Assignmat.Code,Earncode[i]);
                Assignmat.SetRange(Assignmat."Payroll Period",DateSpecified);
                if Assignmat.Find('-') then begin
                Assignmat.CalcSums(Amount);
                Allowances[i]:=Assignmat.Amount;
                TotalDeductions:=TotalDeductions+Allowances[i];
                end else begin
                   case true of
                   Earncode[i]='OTHER DEDUCTIONS':
                    Allowances[i]:=-Abs(Employee."Total Deductions"-TotalDeductions);
                   Earncode[i]='NET PAY':
                    Allowances[i]:=Employee."Total Allowances"+Employee."Total Deductions";
                   Earncode[i]='1/3 NET PAY':
                    Allowances[i]:=1/3*(Employee."Total Allowances"+Employee."Total Statutory");
                   Earncode[i]='DIFFERENCE':
                    Allowances[i]:=(Employee."Total Deductions"+"Total Allowances")-1/3*(Employee."Total Allowances"+Employee."Total Statutory");
                  //
                  end;
                end;
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
        MasterRoll = 'NET PAY LESS THAN A THIRD';
    }

    trigger OnPreReport()
    begin

         DateSpecified:=Employee.GetRangeMin(Employee."Pay Period Filter");

         EarnRec.Reset;
         EarnRec.SetRange("Show on Master Roll",true);
         EarnRec.SetRange("Non-Cash Benefit",false);
         EarnRec.SetRange("Pay Period Filter",DateSpecified);
         if EarnRec.Find('-') then
         repeat
         EarnRec.CalcFields("Total Amount");
         if EarnRec."Total Amount"<>0 then
         begin
         i:=i+1;
         Earncode[i]:=EarnRec.Code;
         EarnDesc[i]:=EarnRec.Description;
         NoOfEarnings:=NoOfEarnings+1;
         end;
         until EarnRec.Next=0;

        //Add other earnings
         NoOfEarnings:=NoOfEarnings+1;
         i:=i+1;
         Earncode[i]:='OTHER EARNINGS';
         EarnDesc[i]:='OTHER EARNINGS';
         NoOfEarnings:=NoOfEarnings+1;
         i:=i+1;
         Earncode[i]:='GROSS PAY';
         EarnDesc[i]:='GROSS PAY';

         //
         DedRec.Reset;
         DedRec.SetRange(DedRec."Show on Master Roll",true);
         DedRec.SetRange("Pay Period Filter",DateSpecified);
         if DedRec.Find('-') then
         repeat
         DedRec.CalcFields("Total Amount");
         if DedRec."Total Amount"<>0 then
         begin
         i:=i+1;
         Earncode[i]:=DedRec.Code;
         EarnDesc[i]:=DedRec.Description;
         NoOfDeductions:=NoOfDeductions+1;
         end;
         until DedRec.Next=0;

        //Add other deductions and Net Pay
         NoOfDeductions:=NoOfDeductions+1;
         i:=i+1;
         Earncode[i]:='OTHER DEDUCTIONS';
         EarnDesc[i]:='OTHER DEDUCTIONS';

         NoOfDeductions:=NoOfDeductions+1;
         i:=i+1;
         Earncode[i]:='NET PAY';
         EarnDesc[i]:='NET PAY';
         //

        //1/3 Net Pay and the Difference
         NoOfDeductions:=NoOfDeductions+1;
         i:=i+1;
         Earncode[i]:='1/3 NET PAY';
         EarnDesc[i]:='1/3 Net Pay';

         NoOfDeductions:=NoOfDeductions+1;
         i:=i+1;
         Earncode[i]:='DIFFERENCE';
         EarnDesc[i]:='Difference';
         //


        HRSetup.Get;
        HRSetup.TestField("Net Pay Advance Code");
    end;

    var
        Allowances: array [100] of Decimal;
        Deductions: array [100] of Decimal;
        EarnRec: Record EarningsX;
        DedRec: Record DeductionsX;
        Earncode: array [100] of Code[20];
        deductcode: array [100] of Code[20];
        EarnDesc: array [100] of Text[150];
        DedDesc: array [100] of Text[150];
        i: Integer;
        j: Integer;
        Assignmat: Record "Assignment Matrix-X";
        DateSpecified: Date;
        Totallowances: Decimal;
        TotalDeductions: Decimal;
        OtherEarn: Decimal;
        OtherDeduct: Decimal;
        counter: Integer;
        HRSetup: Record "Human Resources Setup";
        NetPay: Decimal;
        Payroll: Codeunit Payroll3;
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        NoOfEarnings: Integer;
        NoOfDeductions: Integer;
        PG: Code[20];
        Dpt: Code[20];
        Emp: Code[20];
        NetPayAdvance: Decimal;
}

