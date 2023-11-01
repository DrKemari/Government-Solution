#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85108 "Scripts Sampling Lines"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3; "Paper Code"; Code[30])
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
        field(4; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(11; "Center Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                if ExamCenter.Get("Center Code") then begin
                    "Center Name" := ExamCenter.Name;

                end
            end;
        }
        field(12; "Center Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Marker No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Marker Task Allocation"."Resource No" where("Paper ID" = field("Paper Code"));

            trigger OnValidate()
            begin
                if Resources.Get("Marker No") then begin
                    "Marker Name" := Resources.Name;
                end;
            end;
        }
        field(14; "Marker Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Sample Script No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Marker Score"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Variance := ("Team Leader Score" - "Marker Score");
            end;
        }
        field(17; "Team Leader Score"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //Variance:=ABS("Team Leader Score"-"Marker Score");
                Variance := ("Team Leader Score" - "Marker Score");
            end;
        }
        field(18; Variance; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Cause of Variance"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(21; Solution; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF Present=FALSE THEN
                //  ERROR(TXT001);
            end;
        }
        field(22; "Dummy A"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Solution = false then
                    Error(TXT002);
            end;
        }
        field(23; "Dummy B"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Dummy A" = false then
                    Error(TXT003);
            end;
        }
        field(24; "Dummy C"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Dummy B" = false then
                    Error(TXT004);
            end;
        }
    }

    keys
    {
        key(Key1; "Document No.", Examination, "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        TXT001: label 'You are not allowed to delete a submitted entry';
    begin
    end;

    trigger OnInsert()
    begin
        if ScriptsDispatchHeader.Get("Document No.") then begin
            Examination := ScriptsDispatchHeader.Examination;
            "Paper Code" := ScriptsDispatchHeader."Paper Code";
            "Examination Sitting" := ScriptsDispatchHeader."Sitting Cycle";
            "Paper Name" := ScriptsDispatchHeader."Paper Name";

        end;
    end;

    var
        StationeryCategory: Record "Stationery Category";
        ExamCenter: Record "Examination Centres";
        ScriptsDispatchHeader: Record "Scripts Dispatch Header";
        ExamScriptsEntries: Record "Exam Scripts Entries";
        Resources: Record Resource;
        TXT002: label 'Kindly ensure the solution is submitted';
        TXT003: label 'Kindly ensure Dummy A is submitted';
        TXT004: label 'Kindly ensure Dummy B is submitted';
}
