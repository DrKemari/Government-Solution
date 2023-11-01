report 69011 "Earnings Mass Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Earnings Mass Update.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            column(No_Employee;Employee."No.")
            {
            }
            column(FirstName_Employee;Employee."First Name")
            {
            }
            column(MiddleName_Employee;Employee."Middle Name")
            {
            }
            column(LastName_Employee;Employee."Last Name")
            {
            }

            trigger OnAfterGetRecord()
            begin

                PayrollRun.DefaultAssignment(Employee);
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
        Direction: Option " ",Increase,Decrease;
        UpdateType: Option " ",Percentage,FlatAmount;
        FlatAmount: Decimal;
        Percentage: Decimal;
        ActionType: Option " ",Add,Modify;
        Assignmat: Record "Assignment Matrix-X";
        EarningRec: Record EarningsX;
        PayPeriod: Record "Payroll PeriodX";
        BeginDate: Date;
        PayrollRun: Report "Payroll Run";

    procedure GetEarnings(var EarnRec: Record EarningsX)
    begin
         EarningRec:=EarnRec;
    end;

    procedure GetPayPeriod()
    begin
         PayPeriod.SetRange(PayPeriod."Close Pay",false);
         if PayPeriod.Find('-') then
         begin
          //PayPeriodtext:=PayPeriod.Name;
          BeginDate:=PayPeriod."Starting Date";
         end;
    end;
}

