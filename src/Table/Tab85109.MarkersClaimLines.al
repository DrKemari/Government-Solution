#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85109 "Markers Claim Lines"
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
        field(15; "No of Scripts Marked"; Integer)
        {

            trigger OnValidate()
            var
                ExaminationSetup: Record "Examination Setup";
            begin
                ExaminationSetup.Get;
                Amount := "No of Scripts Marked" * ExaminationSetup."Default Script Amount";
            end;
        }
        field(16; Level; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(18; "Envelope No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "No. of Expected Marked Scripts"; Integer)
        {
            CalcFormula = sum("Scripts Dispatch Lines"."No. of Scripts Returned" where("Document No." = field("Document No."),
                                                                                        "Paper Code" = field("Paper Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", Examination, "Entry No")
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
        // IF ScriptsDispatchHeader.GET("Document No.") THEN BEGIN
        //  Examination:=ScriptsDispatchHeader.Examination;
        //  "Paper Code":=ScriptsDispatchHeader."Paper Code";
        //  "Examination Sitting":=ScriptsDispatchHeader."Sitting Cycle";
        //  "Paper Name":=ScriptsDispatchHeader."Paper Name";
        //
        // END;
    end;

    var
        StationeryCategory: Record "Stationery Category";
        ExamCenter: Record "Examination Centres";
        ScriptsDispatchHeader: Record "Scripts Dispatch Header";
        ExamScriptsEntries: Record "Exam Scripts Entries";
        Resources: Record Resource;
}
