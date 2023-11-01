#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85080 "Certificate Entry"
{
    DrillDownPageID = "Certificate Entry";
    LookupPageID = "Certificate Entry";

    fields
    {
        field(1; "Entry No."; Integer)
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
                end
            end;
        }
        field(3; "Student Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(5; "Part"; Code[30])
        {
            Caption = 'Level';
            DataClassification = ToBeClassified;
            TableRelation = Level.Code where(Course = field(Examination));
        }
        field(6; "Exam Sitting ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(7; "Exam Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";
        }
        field(8; "Date Printed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Printed By"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(10; "Collection Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Collected By ID Number"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Collected By Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Collected By Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Issued  By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Issued Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Issued Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original,Defaced,Corrected';
            OptionMembers = Original,Defaced,Corrected;
        }
        field(18; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Certificate No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(21; Collected; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Storage Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Not Printed,Printed,Printed with Errors';
            OptionMembers = "Not Printed",Printed,"Printed with Errors";
        }
        field(24; "Security Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Year Completed"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Calendar Year Code".Code;
        }
        field(26; "Effe Storage Fee Calc Date"; Date)
        {
            Caption = 'Effective Storage Fee Calculation Date';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Student Reg No.", "Certificate No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ExaminationAccount: Record "Examination Account";
}
