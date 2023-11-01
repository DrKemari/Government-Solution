#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72004 "Road Class"
{

    fields
    {
        field(1;"Class ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Purpose;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Agency Mandate";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Paved (Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"UnPaved (Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Total (Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Desired Road Reserve Width (M)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Min Road Reserve Width (M)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Class ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

