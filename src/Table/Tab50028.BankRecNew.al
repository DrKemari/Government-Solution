#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50028 "Bank Rec New"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Payment Ref";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

