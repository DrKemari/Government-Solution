#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85404 "Paper Topic Setup"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Paper Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            begin
                Papers.Reset;
                Papers.SetRange(Code,"Paper Code");
                if Papers.FindFirst then begin
                  "Paper Name":=Papers.Description;
                end
            end;
        }
        field(3;"Paper Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Topic Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Area";

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                PaperTopicArea.Reset;
                PaperTopicArea.SetRange(Code,"Topic Code");
                if PaperTopicArea.FindFirst then begin
                  "Topic Name":=PaperTopicArea.Description;
                end
            end;
        }
        field(5;"Topic Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Blocked;Boolean)
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
        Papers: Record Papers;
}

