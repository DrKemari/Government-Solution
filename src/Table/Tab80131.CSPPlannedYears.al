#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80131 "CSP Planned Years"
{

    fields
    {
        field(1;"CSP Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Annual Year Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code;
        }
    }

    keys
    {
        key(Key1;"CSP Code","Annual Year Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

