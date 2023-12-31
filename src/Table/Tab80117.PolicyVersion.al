#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80117 "Policy Version"
{

    fields
    {
        field(1;"Policy Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Version Id";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Revision Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Policy Revision Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy Id","Version Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

