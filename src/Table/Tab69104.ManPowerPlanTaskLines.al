#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69104 "ManPower Plan Task Lines"
{

    fields
    {
        field(1;"Task No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Manpower Plan Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Manpower Plan Header";
        }
        field(3;"Job Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Positions;
        }
        field(4;"Job Title";Text[100])
        {
            CalcFormula = lookup(Positions."Job Description" where ("Job ID"=field("Job Id")));
            FieldClass = FlowField;
        }
        field(5;"Actual Active";Integer)
        {
            CalcFormula = count(Employee where ("Job ID"=field("Job Id")));
            FieldClass = FlowField;
        }
        field(6;"Target No.";Integer)
        {
            CalcFormula = sum("ManPower Planning Lines"."Target No." where ("Job Id"=field("Job Id"),
                                                                            "Manpower Plan Code"=field("Manpower Plan Code")));
            FieldClass = FlowField;
        }
        field(7;"Actual Recruited";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Approved Establishment";Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Deficit:="Approved Establishment"-"Actual Active";
            end;
        }
        field(9;Deficit;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Quarter 3 Target";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Quarter 4 Target";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Manpower Plan Code","Job Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

