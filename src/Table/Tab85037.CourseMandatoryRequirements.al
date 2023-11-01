#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85037 "Course Mandatory Requirements"
{
    DrillDownPageID = "Examination Mandatory Req";
    LookupPageID = "Examination Mandatory Req";

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Course Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                if Courses.Get("Course Id") then
                  "Course Description":=Courses.Description;
            end;
        }
        field(3;"Course Description";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[30])
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

    var
        Courses: Record Courses;
}

