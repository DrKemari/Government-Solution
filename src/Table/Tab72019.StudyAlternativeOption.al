#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72019 "Study Alternative Option"
{

    fields
    {
        field(1;"Study ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Option ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Cost Value";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Benefit Value";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Recommended Option";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Study ID","Option ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

