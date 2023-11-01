#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80069 "Competency"
{
    DrillDownPageID = Competencies;
    LookupPageID = Competencies;

    fields
    {
        field(1;"No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Competency Summary";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Competency Category";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Competency Category";
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

