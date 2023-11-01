#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50025 "Pos-Nav Bank Relation"
{

    fields
    {
        field(1;"Pos Bank Code";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Nav Bank Code";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
    }

    keys
    {
        key(Key1;"Pos Bank Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

