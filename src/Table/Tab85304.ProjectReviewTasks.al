#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85304 "Project Review Tasks"
{
    DrillDownPageID = "Syllabus Review Tasks";
    LookupPageID = "Syllabus Review Tasks";

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Type of Syllabus";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New Syllabus,Minor Review,Major Review,Annual Review';
            OptionMembers = "New Syllabus","Minor Review","Major Review","Annual Review";
        }
        field(3;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Type of Syllabus")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

