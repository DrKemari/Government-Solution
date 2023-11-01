#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85417 "Setter Papers"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Marker No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            begin
                if Resources.Get("Marker No") then begin
                    "Marker Name" := Resources.Name;
                end;
            end;
        }
        field(3; "Marker Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(5; "Paper Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
                Papers.Reset;
                Papers.SetRange(Code, "Paper Code");
                if Papers.FindFirst then begin
                    "Paper Name" := Papers.Description;
                end
            end;
        }
        field(6; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Marker No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resources: Record Resource;
}
