#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57103 "Employee Handover Lines"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Serial No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"New Employee No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employee.Get("New Employee No") then begin
                  "New Employee Name":=Employee.FullName;
                  "New Employee Start Date":=Today;
                  "New Employee End Date":=CalcDate('1Y',Today);
                end;
            end;
        }
        field(7;"New Employee Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"New Employee Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"New Employee End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Handover/Return";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Changed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Line No")
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

