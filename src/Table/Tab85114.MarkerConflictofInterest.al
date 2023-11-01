#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85114 "Marker Conflict of Interest"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Marker No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where("Exam Task Type" = const(Marker));

            trigger OnValidate()
            begin
                if Resource.Get("Marker No") then begin
                    "Marker Name" := Resource.Name;
                end;
            end;
        }
        field(3; "Marker Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Center Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres".Code;

            trigger OnValidate()
            begin
                if ExaminationCentres.Get("Center Code") then begin
                    "Center Name" := ExaminationCentres.Name;

                end;
            end;
        }
        field(5; "Center Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Date Declared"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "No Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Submitted';
            OptionMembers = Draft,Submitted;
        }
        field(11; "Sitting Cycle"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle"."Exam Sitting Cycle";

            trigger OnValidate()
            begin
                // ExamSittingCycle.RESET;
                // ExamSittingCycle.SETRANGE("Exam Sitting Cycle","Sitting Cycle");
                // IF ExamSittingCycle.FINDFIRST THEN BEGIN
                // "Examination Start Date":=ExamSittingCycle."Exam Start Date";
                // "Examination End Date":=ExamSittingCycle."Exam End Date";
                //  "Project No.":=ExamSittingCycle."Examination Project ID";
                //  VALIDATE("Project No.");
                // END
            end;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ExaminationSetup.Get;
        ExaminationSetup.TestField("Script Re-Allocation Vouch Nos");
        if "Document No." = '' then begin
            NoSeriesManagement.InitSeries(ExaminationSetup."Marker Conflict of Interest No", xRec."No Series", 0D, "Document No.", "No Series");


        end;
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
    end;

    var
        Resource: Record Resource;
        ExaminationCentres: Record "Examination Centres";
        ExaminationSetup: Record "Examination Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}
