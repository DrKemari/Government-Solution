#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95183 "Audit Template"
{
    DrillDownPageID = "Audit Templates";
    LookupPageID = "Audit Templates";

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Audit  WorkType";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Work Type".Code;
        }
        field(4;"Last Review Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

