#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50243 "Policy Thematic Area Rev"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Implementation Percentage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Comments;Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

