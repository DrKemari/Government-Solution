#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85462 "Examination Donors"
{

    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; Name; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Address; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Telephone; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. Series"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(9; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(10; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level.Code where(Course = field(Examination));
        }
        field(11; "Paper Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers.Code where(Course = field(Examination),
                                               Level = field(Level));

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
        field(12; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
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
        ExaminationSetup.TestField("Donor Nos");
        if "No." = '' then
            NoSeriesMgt.InitSeries(ExaminationSetup."Donor Nos", ExaminationSetup."Donor Nos", 0D, "No.", ExaminationSetup."Donor Nos");

        // "Created By":=USERID;
        // "Created On":=CURRENTDATETIME;
        // "Document Date":=TODAY;
    end;

    var
        ExamAuditLines: Record "Exam Audit Lines";
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Resource: Record Resource;
}
