#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85309 "Syllabus Papers"
{
    Caption = 'Syllabus Papers';
    DrillDownPageID = "Syllabus Papers";
    LookupPageID = "Syllabus Papers";

    fields
    {
        field(1;"Paper Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type"=filter(Syllabus)) Papers.Code where (Course=field(Course));
        }
        field(2;Course;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type"=filter(Syllabus)) Courses;
        }
        field(3;Section;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type"=filter(Syllabus)) Section where (Course=field(Course));
        }
        field(4;"Part";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type"=filter(Syllabus)) Level where (Course=field(Course));
        }
        field(5;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Syllabus No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Syllabus Header";
        }
        field(7;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Syllabus,Draft,Version';
            OptionMembers = Syllabus,Draft,Version;
        }
        field(8;"Version No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Paper Code","Syllabus No.",Course,"Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

