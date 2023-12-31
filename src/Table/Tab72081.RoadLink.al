#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72081 "Road Link"
{

    fields
    {
        field(1;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Link Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Road Class";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Start Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"End Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Link Length(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Surface type";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Administrative Boundary";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

