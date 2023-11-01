#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80001 "Core Mandates"
{
    DrillDownPageID = "Core Mandates";
    LookupPageID = "Core Mandates";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Core Mandates";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(3;No;Code[10])
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
        fieldgroup(DropDown;"Code","Core Mandates")
        {
        }
        fieldgroup(Brick;"Code","Core Mandates")
        {
        }
    }
}

