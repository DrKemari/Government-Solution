#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85416 "Set Papers Bank"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                Courses.Reset;
                Courses.SetRange(Code, Examination);
                if Courses.FindFirst then begin
                    "Examination Name" := Courses.Description;
                end
            end;
        }
        field(4; "Examination Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level;
        }
        field(6; "Paper Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            begin
                Papers.Reset;
                Papers.SetRange(Code, "Paper Code");
                if Papers.FindFirst then begin
                    "Paper Name" := Papers.Description;
                    Examination := Papers.Course;
                    Validate(Examination);
                    Level := Papers.Level;
                end
            end;
        }
        field(7; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Question No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Topic Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Area";

            trigger OnValidate()
            begin
                PaperTopicArea.Reset;
                PaperTopicArea.SetRange(Code, "Topic Code");
                if PaperTopicArea.FindFirst then begin
                    "Topic Name" := PaperTopicArea.Description;
                end
            end;
        }
        field(10; "Topic Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Question Paper"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Suggested Solution"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Completeness Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Complete,Not Complete, ';
            OptionMembers = Complete,"Not Complete"," ";
        }
        field(14; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Setter Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Setter Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PaperTopicArea: Record "Paper Topic Area";
        Papers: Record Papers;
        Courses: Record Courses;
}
