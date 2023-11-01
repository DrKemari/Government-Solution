Page 50198 "PR Employee Posting Group"
{
    PageType = List;
    SourceTable = "PR Employee Posting Groups";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(SalaryAccount; "Salary Account")
                {
                    ApplicationArea = Basic;
                }
                field(IncomeTaxAccount; "Income Tax Account")
                {
                    ApplicationArea = Basic;
                }
                field(SSFEmployerExpenseAccount; "SSF Employer Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'SSF Employer Expense Account';
                }
                field(SSFTotalPayableAccount; "SSF Employee Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'SSF Total Payable Account';
                }
                field(NetSalaryPayable; "Net Salary Payable")
                {
                    ApplicationArea = Basic;
                }
                field(PFEmployerExpenseAccount; "Pension Employer Acc")
                {
                    ApplicationArea = Basic;
                    Caption = 'PF Employer Expense Account';
                }
                field(PFTotalPayableAccount; "Pension Employee Acc")
                {
                    ApplicationArea = Basic;
                    Caption = 'PF Total Payable Account';
                }
                field(NHIFEmployeeAccount; "NHIF Employee Account")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

