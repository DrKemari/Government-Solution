#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80037 "Strategic Analysis Implication"
{

    fields
    {
        field(1;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2;"Analysis Matrix No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Analysis Matrix"."Entry No";
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Strategic Implication";Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Analysis Matrix No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

