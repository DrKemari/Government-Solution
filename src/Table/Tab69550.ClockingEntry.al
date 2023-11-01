#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69550 "Clocking Entry"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where (Status=const(Active));

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Employee No");
                if Employee.FindSet then
                  "Employee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                Directorate:=Employee."Directorate Code";
                Department:=Employee."Department Code";
            end;
        }
        field(3;"Employee Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Time;Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'In,Out';
            OptionMembers = "In",Out;
        }
        field(7;Directorate;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Directorate));
        }
        field(8;Department;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter("Department/Center"));
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
}

