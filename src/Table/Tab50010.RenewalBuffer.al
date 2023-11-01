#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50010 "Renewal Buffer"
{

    fields
    {
        field(1;"Registration No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Renewal Pending";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Renewal Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Re-Activation Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Registration No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

