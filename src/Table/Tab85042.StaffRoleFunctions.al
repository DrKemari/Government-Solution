#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85042 "Staff Role Functions"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Staff Role Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staff Role Codes";
        }
        field(3;Description;Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

