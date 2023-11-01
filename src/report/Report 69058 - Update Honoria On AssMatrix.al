report 69058 "Update Honoria On AssMatrix"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Honoria On AssMatrix.rdlc';

    dataset
    {
        dataitem(EarningsX;EarningsX)
        {
            DataItemTableView = WHERE(Honoraria=CONST(true));

            trigger OnAfterGetRecord()
            begin
                AssignmentMatrix.Reset;
                AssignmentMatrix.SetRange(Code,EarningsX.Code);
                if AssignmentMatrix.Find('-') then begin
                  repeat
                    AssignmentMatrix.Honoraria:=true;
                    AssignmentMatrix.Modify;
                    until AssignmentMatrix.Next=0;
                  end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Completed');
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
        AssignmentMatrix: Record "Assignment Matrix-X";
}

