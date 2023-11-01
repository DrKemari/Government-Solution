report 85045 "Create Close Cycle"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Create Close Cycle.rdlc';

    dataset
    {
        dataitem("Exam Sitting Cycle";"Exam Sitting Cycle")
        {

            trigger OnAfterGetRecord()
            begin
                //create new year
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

