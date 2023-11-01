#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85419 "Setters Evaluation Lines"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Setters Evaluation Header"."Document No.";
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Setter Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false),
                                                  "Exam Task Type" = const(Setter));

            trigger OnValidate()
            begin
                if Resource.Get("Setter Code") then begin
                    //Resource.TESTFIELD("E-mail Address");
                    ///"Moderator Ema:=Resource."E-mail Address";
                    "Name of Setter" := Resource.Name;
                    Signture := Resource.Signature;

                end;
            end;
        }
        field(4; "Name of Setter"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses.Code;
        }
        field(6; paper; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers.Code where(Course = field(Examination));

            trigger OnValidate()
            begin
                Paperss.Reset;
                Paperss.SetRange(Code, paper);
                if Paperss.FindFirst then
                    "Paper Name" := Paperss.Description;
            end;
        }
        field(7; "Syllabus Coverage"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Setters Evaluation Criteria".Code;
        }
        field(8; "Quality of questions"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Setters Evaluation Criteria".Code;
        }
        field(9; Originality; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Setters Evaluation Criteria".Code;
        }
        field(10; "Mix of theory and practical"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Setters Evaluation Criteria".Code;
        }
        field(11; "Quality of solutions"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Setters Evaluation Criteria".Code;
        }
        field(12; "Other comments eg timeliness"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Recommendation; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Signture; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Paper Name"; Text[255])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No", "Line No", "Setter Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
        Paperss: Record Papers;
}
