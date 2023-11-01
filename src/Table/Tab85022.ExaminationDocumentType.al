#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85022 "Examination Document Type"
{
    DrillDownPageID = "Examination Document Types";
    LookupPageID = "Examination Document Types";

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Track Expiry";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Special Group Requirement";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Issuing Agency";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Local Verification URL";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Blocked;Boolean)
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

