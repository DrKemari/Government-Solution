report 69041 "Validate Assignment Matrix"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Validate Assignment Matrix.rdlc';

    dataset
    {
        dataitem("Assignment Matrix-X";"Assignment Matrix-X")
        {

            trigger OnAfterGetRecord()
            begin
                 Employee.Reset;
                 Employee.SetRange(Employee."No.","Assignment Matrix-X"."Employee No");
                 if Employee.FindSet then repeat
                 "Assignment Matrix-X".Init;
                 "Assignment Matrix-X".Code:='PENC';
                 "Assignment Matrix-X".Type:="Assignment Matrix-X".Type::Deduction;
                 "Assignment Matrix-X".Amount:=0;
                 "Assignment Matrix-X"."Reference No":='';
                 if not "Assignment Matrix-X".Get("Assignment Matrix-X"."Employee No","Assignment Matrix-X".Type,"Assignment Matrix-X".Code,"Assignment Matrix-X"."Payroll Period","Assignment Matrix-X"."Reference No") then
                 "Assignment Matrix-X".Insert
                 else
                  "Assignment Matrix-X".Modify;
                 until Employee.Next =0;

                if "Assignment Matrix-X".Code  = 'PENC' then begin
                  "Assignment Matrix-X".Validate(Code);
                "Assignment Matrix-X".Modify;
                end else
                "Assignment Matrix-X".Insert;
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
        objCode: Code[30];
        Employee: Record Employee;
}

