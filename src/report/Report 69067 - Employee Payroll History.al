report 69067 "Employee Payroll History"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Employee Payroll History.rdlc';

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

