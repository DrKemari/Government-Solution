#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95136 "Incident Party Type"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Safety Workgroup ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Safety Workgroup"."Workgroup ID";
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

