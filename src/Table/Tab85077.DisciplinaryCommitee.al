#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85077 "Disciplinary Commitee"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No. of Members";Integer)
        {
            CalcFormula = count("Commiitee Members" where ("Document No."=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Expiry Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

