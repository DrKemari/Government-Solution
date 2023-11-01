report 69008 "Assign Default Earning/Deducti"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Assign Default EarningDeducti.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {

            trigger OnAfterGetRecord()
            begin
                //IF CONFIRM(Text000,FALSE) THEN
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
        PayrollRun: Report "Payroll Run";
}

