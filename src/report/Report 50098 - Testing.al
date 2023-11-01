report 50098 Testing
{
    DefaultLayout = RDLC;
    RDLCLayout = './Testing.rdlc';

    dataset
    {
        dataitem("Assignment Matrix-X";"Assignment Matrix-X")
        {

            trigger OnAfterGetRecord()
            begin
                assignment.Reset;
                assignment.SetRange("Payroll Period","Payroll Period");
                if assignment.FindSet then begin

                assignment."Payroll Period" := 20190601D;
                assignment.Modify;
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
    }

    var
        assignment: Record "Assignment Matrix-X";
}

