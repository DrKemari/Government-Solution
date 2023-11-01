#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85104 "Renewal Details Update"
{

    fields
    {
        field(1;"Registration No.";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Renewal Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Renwal Pending";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Updated;Boolean)
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

