report 69017 "Update Loan Opening Bal"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Loan Opening Bal.rdlc';

    dataset
    {
        dataitem("Assignment Matrix-X";"Assignment Matrix-X")
        {
            DataItemTableView = SORTING("Employee No",Type,Code,"Payroll Period","Reference No") ORDER(Ascending) WHERE(Type=CONST(Deduction),Closed=CONST(false));
            RequestFilterFields = "Code","Payroll Period","Employee No";

            trigger OnAfterGetRecord()
            begin
                if Ded.Get("Assignment Matrix-X".Code) then begin
                  if Ded."Balance Type"=Ded."Balance Type"::Decreasing then
                    "Assignment Matrix-X"."Opening Balance":="Assignment Matrix-X"."Closing Balance"-"Assignment Matrix-X".Amount;
                   if Ded."Balance Type"=Ded."Balance Type"::Increasing then
                    "Assignment Matrix-X"."Opening Balance":="Assignment Matrix-X"."Closing Balance"+"Assignment Matrix-X".Amount;
                  end;
                  "Assignment Matrix-X".Modify;
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
        Ded: Record DeductionsX;
}

