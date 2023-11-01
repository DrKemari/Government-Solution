report 69630 "Updating Employee Dates"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Updating Employee Dates.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {

            trigger OnAfterGetRecord()
            begin
                Employee.Validate("Birth Date");
                Employee.Modify;
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
}

