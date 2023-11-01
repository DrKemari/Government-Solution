#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56005 "CRM Vacancy Requirement"
{

    fields
    {
        field(1;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Requirement ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Qualification Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity";
        }
        field(4;Description;Text[430])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Added Advantage';
            OptionMembers = Mandatory,"Added Advantage";
        }
        field(6;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Qualification;
        }
    }

    keys
    {
        key(Key1;"Vacancy ID","Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

