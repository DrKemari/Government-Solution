#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72087 "Road Material"
{

    fields
    {
        field(1;"Material Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Material Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Unit Of Measure";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(4;Remarks;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Material Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

