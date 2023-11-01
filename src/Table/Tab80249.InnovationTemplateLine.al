#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80249 "Innovation Template Line"
{

    fields
    {
        field(1;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Category;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Weighted Score %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

