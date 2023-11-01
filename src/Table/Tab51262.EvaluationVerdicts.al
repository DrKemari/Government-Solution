#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51262 "Evaluation Verdicts"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Maximum %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Minimum %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Update Customer";Boolean)
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

