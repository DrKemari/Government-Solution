#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85453 "Audit Assurance Lines"
{

    fields
    {
        field(1;"Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Syllabus No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Syllabus Header";

            trigger OnValidate()
            var
                SyllabusHeader: Record "Syllabus Header";
            begin
                SyllabusHeader.Reset;
                SyllabusHeader.SetRange(Code,"Syllabus No.");
                if SyllabusHeader.FindFirst then begin
                  "Syllabus Name":=SyllabusHeader.Description;
                end
            end;
        }
        field(3;"Syllabus Name";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Situation Found";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Recommendation;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            var
                Courses: Record Courses;
            begin
                Courses.Reset;
                Courses.SetRange(Code,Examination);
                if Courses.FindFirst then begin
                  "Examination Name":=Courses.Description;
                end
            end;
        }
        field(8;"Examination Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Evidence and Analysis";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Causes;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Effect;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Header No.","Entry No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

