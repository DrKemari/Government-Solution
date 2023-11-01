Page 50179 "PR Employee Transactions Hist."
{
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions';
    SourceTable = "PR Employee Transactions";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field(EmployeeCode; "Employee Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TransactionCode; "Transaction Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        "Payroll Period" := SelectedPeriod;
                        "Period Month" := PeriodMonth;
                        "Period Year" := PeriodYear;

                        curTransAmount := 0;
                    end;
                }
                field(TransactionName; "Transaction Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PayrollPeriod; "Payroll Period")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Balance; Balance)
                {
                    ApplicationArea = Basic;
                }
                field(Installments; "Total Installments")
                {
                    ApplicationArea = all;
                }

                field("Loan Application Date"; "Loan Application Date")
                {
                    ApplicationArea = all;
                }
                field("Amount Borrowed"; "Amount Borrowed")
                {
                    ApplicationArea = all;
                }

                field(ReferenceNo; "Reference No")
                {
                    ApplicationArea = Basic;
                }

                field("Has Insurance Certificate"; "Has Insurance Certificate")
                {
                    ApplicationArea = Basic;
                }

                field(StartDate; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; "End Date")
                {
                    ApplicationArea = Basic;
                }

                field(StopforNextPeriod; "Stop for Next Period")
                {
                    ApplicationArea = Basic;
                }

                field("coop parameters"; "coop parameters")
                {
                    ApplicationArea = all;
                }
            }
        }
    }


    actions
    {
        area(processing)
        {

            action(AssignEarningDeductions)
            {
                ApplicationArea = Basic;
                Caption = 'Repayment Schedule List';
                Image = AssessFinanceCharges;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Loan Repayment Schedule";
                RunPageLink = "Employee No." = field("Employee Code"), "Loan No." = field("Transaction Code");
            }

            action(LoanSheduleREport)
            {
                ApplicationArea = Basic;
                Caption = 'Preview Loan Shedule';
                Image = AssessFinanceCharges;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    LoanRepaymentShcedule: Record "Loan Repayment Schedule";
                begin
                    LoanRepaymentShcedule.Reset();
                    LoanRepaymentShcedule.SetRange("Employee No.", "Employee Code");
                    LoanRepaymentShcedule.SetRange("Loan No.", "Transaction Code");
                    if LoanRepaymentShcedule.FindFirst() then begin
                        report.Run(report::"Loan Repayment Schedule", true, false);
                    end;
                end;
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
        // SetFilter("Payroll Period", Format(PRPayrollPeriods."Date Opened"));
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

