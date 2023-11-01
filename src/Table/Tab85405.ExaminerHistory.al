#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85405 "Examiner History"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Examiner Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(3;"Examiner Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examiner Setup";
        }
        field(5;"Category Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Examiner Domain";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Subject Area";
        }
        field(7;"Examiner Domain Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"End Date";Date)
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

