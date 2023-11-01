#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Table Examination Results (ID 85067).
/// </summary>
Table 85067 "Examination Results"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Student Reg No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account";

            trigger OnValidate()
            begin
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.", "Student Reg No.");
                if ExaminationAccount.FindFirst then begin
                    "Student Name" := ExaminationAccount."First Name" + ' ' + ExaminationAccount."Middle Name" + ' ' + ExaminationAccount.Surname;
                    Address := ExaminationAccount.Address;
                    Email := ExaminationAccount.Email;
                    "National ID No." := ExaminationAccount."ID No.";
                    "Passport No." := ExaminationAccount."ID No.";
                    Examination := ExaminationAccount."Course ID";
                end
            end;
        }
        field(3; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(4; "Part"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Level.Reset;
                Level.SetRange(Code, Part);
                if Level.FindFirst then begin
                    Examination := Level.Course;

                end
            end;
        }
        field(5; Section; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Paper; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Papers.Reset;
                Papers.SetRange(Code, Paper);
                if Papers.FindFirst then begin
                    Examination := Papers.Course;
                    "Paper Name" := Papers.Description;
                    Section := Papers.Section;
                    Part := Papers.Level;
                end
            end;
        }
        field(7; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Type; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Student Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Address; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "National ID No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Passport No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Grade; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Section Grade"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Section Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Examination Sitting ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(18; "Financial Year"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Examination Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";
        }
        field(20; Mark; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // PapersGradingSystem.Reset;
                // PapersGradingSystem.SetRange(Blocked, false);
                // PapersGradingSystem.SetRange(Examination, Examination);
                // PapersGradingSystem.SetRange(Part, Part);
                // PapersGradingSystem.SetRange(Section, Section);
                // PapersGradingSystem.SetRange(Paper, Paper);
                // if PapersGradingSystem.FindSet then begin
                //     repeat
                //         if ((Mark > PapersGradingSystem."From Marks") or (Mark = PapersGradingSystem."From Marks")) and
                //              ((Mark < PapersGradingSystem."To Marks") or (Mark = PapersGradingSystem."To Marks")) then begin
                //             GradeCode := PapersGradingSystem."Grade Code";
                //             Passed := not (PapersGradingSystem.Failed);
                //         end;

                //     until PapersGradingSystem.Next = 0;
                // end;
                // Grade := GradeCode;
            end;
        }
        field(21; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22; Passed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Serial No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Sub C"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(25; Fc; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Issue Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        UserSetup.SetRange("Examination Results Admin", false);
        if UserSetup.FindSet then
            Error('You are not allowed to delete results. Contact System Administrator!');
    end;

    trigger OnModify()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        UserSetup.SetRange("Examination Results Admin", false);
        if UserSetup.FindSet then
            Error('You are not allowed to modify results. Contact System Administrator!');
    end;

    var
        ExaminationAccount: Record "Examination Account";
        Papers: Record Papers;
        GradeCode: Code[30];
        PapersGradingSystem: Record "Papers Grading System";
        Level: Record Level;
        UserSetup: Record "User Setup";
}
