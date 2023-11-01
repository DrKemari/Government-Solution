#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59014 "Limit Types"
{

    fields
    {
        field(1;"Upper Limit";Decimal)
        {
        }
        field(2;"Lower Limit";Decimal)
        {
        }
        field(3;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Request Duration";DateFormula)
        {
            DataClassification = ToBeClassified;
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

