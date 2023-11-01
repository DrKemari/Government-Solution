#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69102 "Staff Establishment Task Lines"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Job ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Positions;
        }
        field(3;"Job Title";Text[100])
        {
            CalcFormula = lookup(Positions."Job Description" where ("Job ID"=field("Job ID")));
            FieldClass = FlowField;
        }
        field(4;"Approved Qty";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Department Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(6;"Department Name";Text[50])
        {
            CalcFormula = lookup("Responsibility Center".Name where (Code=field("Department Code")));
            FieldClass = FlowField;
        }
        field(7;"Actual Active";Integer)
        {
            CalcFormula = count(Employee where ("Job ID"=field("Job ID"),
                                                Status=const(Active)));
            FieldClass = FlowField;
        }
        field(8;"Actual Terminated";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Actual Suspended";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Staff Establishment Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staff Establishment Header";
        }
        field(11;"Year Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes";
        }
    }

    keys
    {
        key(Key1;"Entry No.","Staff Establishment Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

