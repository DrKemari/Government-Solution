#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85116 "Examination Qn Setup"
{
    DrillDownPageID = Subjects;
    LookupPageID = Subjects;

    fields
    {
        field(1;"Paper Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers.Code;

            trigger OnValidate()
            begin
                if Papers.Get("Paper Code") then begin
                  Course:=Papers.Course;
                  Section:=Papers.Section;
                  Level:=Papers.Level;
                  Description:=Papers.Description;


                end;
            end;
        }
        field(2;Course;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3;Section;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where (Course=field(Course));
        }
        field(4;Level;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level where (Course=field(Course));
        }
        field(5;Description;Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Question No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Questions";

            trigger OnValidate()
            begin
                if ExaminationQnSetup.Get("Question No") then begin

                  "Question Description":=ExaminationQnSetup.Description;
                end;
            end;
        }
        field(7;"Question Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Paper Code","Question No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Papers: Record Papers;
        ExaminationQnSetup: Record "Examination Questions";
}

