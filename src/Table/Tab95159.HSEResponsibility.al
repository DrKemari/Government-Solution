#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95159 "HSE Responsibility"
{
    DrillDownPageID = "Risk Mgt. Responsibilities";
    LookupPageID = "Risk Mgt. Responsibilities";

    fields
    {
        field(1;"Role ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Responsibility ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Role ID","Responsibility ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

