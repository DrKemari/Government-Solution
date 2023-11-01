#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69256 "Medical Scheme Coverage"
{

    fields
    {
        field(1;"Scheme No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"In-Patient Limit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Out-Patient Limit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Remarks;Text[2000])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Scheme No","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

