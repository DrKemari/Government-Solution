report 89041 "Employees Leaving Payroll"
{
    RDLCLayout = './Employees Leaving Payroll.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = WHERE(Status=CONST(Terminated));
            RequestFilterFields = "Termination Date","No.";
            column(No_Employee;Employee."No.")
            {
            }
            column(EmployeeName;Employee.FullName)
            {
            }
            column(DateOfJoin_Employee;Employee."Termination Date")
            {
            }
            column(TotalAllowances_Employee;Employee."Total Allowances")
            {
            }
            column(TotalDeductions_Employee;Employee."Total Deductions")
            {
            }
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
}

