#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56004 "Other Training Requirements"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

