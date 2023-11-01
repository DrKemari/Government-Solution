Page 50399 "PR Employee Allowance Part"
{
    PageType = ListPart;
    PromotedActionCategories = 'New,Process,Reports,Functions';
    SourceTable = "PR Employee Transactions";
    Editable = false;
    SourceTableView = where("Transaction Type" = filter(Income));
    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {


                field(TransactionName; "Transaction Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

            }
        }
    }





    trigger OnInit()
    begin
        PRPayrollPeriods.Reset;
        PRPayrollPeriods.SetRange(PRPayrollPeriods.Closed, false);
        if PRPayrollPeriods.FindFirst() then begin
            SelectedPeriod := PRPayrollPeriods."Date Opened";
            PeriodName := PRPayrollPeriods."Period Name";
            PeriodMonth := PRPayrollPeriods."Period Month";
            PeriodYear := PRPayrollPeriods."Period Year";
            //objEmpTrans.RESET;
            //objEmpTrans.SETRANGE("Payroll Period",SelectedPeriod);
        end;

        //Filter per period  - Dennis
        SetFilter("Payroll Period", Format(PRPayrollPeriods."Date Opened"));
        //PRPayrollPeriods.SETFILTER(PRPayrollPeriods.Closed,'FALSE');
    end;

    trigger OnOpenPage()
    begin
        SetFilter("Payroll Period", Format(PRPayrollPeriods."Date Opened"));
    end;

    var
        PRTransactionCodes: Record "PR Transaction Codes";
        SelectedPeriod: Date;
        PRPayrollPeriods: Record "PR Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
        curTransAmount: Decimal;
        empCode: Text[30];
        PREmployeeTrans: Record "PR Employee Transactions";
        i: Integer;
        HREmp: Record "Employee";
        currAmount: Decimal;

}

