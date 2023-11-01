report 89040 "Employees Joining Payroll"
{
    RDLCLayout = './Employees Joining Payroll.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "Date Of Join","No.";
            column(No_Employee;Employee."No.")
            {
            }
            column(EmployeeName;Employee.FullName)
            {
            }
            column(DateOfJoin_Employee;Employee."Date Of Join")
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

