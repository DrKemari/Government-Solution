#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85212 "External Papers Levels"
{
    DrillDownPageID = "External Papers Courses";
    LookupPageID = "External Papers Courses";

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Course;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "External Papers Courses";
        }
        field(3;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. of Sections";Integer)
        {
            CalcFormula = count(Section where (Part=field(Code)));
            FieldClass = FlowField;
        }
        field(5;"No. of Papers";Integer)
        {
            CalcFormula = count(Papers where (Level=field(Code),
                                              Course=field(Course)));
            FieldClass = FlowField;
        }
        field(6;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(7;Level;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Knowledge and Comprehension";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Application and Analysis";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Evaluation and Creativity";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code",Course)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
