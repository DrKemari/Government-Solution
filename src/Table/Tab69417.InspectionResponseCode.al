#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69417 "Inspection Response Code"
{

    fields
    {
        field(1;"Response Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inspection Response Type".Code;
        }
        field(2;"Response Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Score %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Response Type","Response Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

