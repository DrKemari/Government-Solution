#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85013 "Section"
{
    DrillDownPageID = Sections;
    LookupPageID = Sections;

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Course;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3;"Part";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level;
        }
        field(4;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Papers";Integer)
        {
            CalcFormula = count(Papers where (Section=field(Code)));
            FieldClass = FlowField;
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

