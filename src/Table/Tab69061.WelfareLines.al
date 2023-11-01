#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69061 "Welfare Lines"
{

    fields
    {
        field(1;"Welfare Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;LineNo;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Employee No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Employee No.");
                if Employee.FindSet then begin
                  "Employee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";

                end
            end;
        }
        field(4;"Employee Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Month;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Date;Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Month := Format(Date,0,'<Month Text>');
            end;
        }
        field(7;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Welfare Header No.",LineNo)
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

