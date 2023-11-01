#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85423 "Setter Task Allocation"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Resource No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Resource Role Allocation"."Resource No" where(Role = const(Setter));

            trigger OnValidate()
            begin
                if Resources.Get("Resource No") then begin
                    Name := Resources.Name;

                end;
            end;
        }
        field(3; Course; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(4; Section; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where(Course = field(Course));
        }
        field(5; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level where(Course = field(Course));
        }
        field(6; "Paper ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers.Code where(Course = field(Course),
                                               Level = field(Level));

            trigger OnValidate()
            begin
                MarkerTaskAllocation.Reset;
                MarkerTaskAllocation.SetRange("Resource No", "Resource No");
                MarkerTaskAllocation.SetFilter("Line No", '<>%1', "Line No");
                MarkerTaskAllocation.SetRange("Paper ID", "Paper ID");
                if MarkerTaskAllocation.FindSet then begin
                    Error('ERROR!!, This Paper has already been selected for this resource');
                end;
                if Paperss.Get("Paper ID") then begin

                    "Paper Name" := Paperss.Description;
                end;
            end;
        }
        field(7; "Paper Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Name; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Present; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Solution; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Present = false then
                    Error(TXT001);
            end;
        }
        field(11; "Dummy A"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Solution = false then
                    Error(TXT002);
            end;
        }
        field(12; "Dummy B"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Dummy A" = false then
                    Error(TXT003);
            end;
        }
        field(13; "Dummy C"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Dummy B" = false then
                    Error(TXT004);
            end;
        }
        field(14; Role; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Team Leader';
            OptionMembers = " ","Team Leader";
        }
        field(15; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(16; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Submitted Setter ToS"; Boolean)
        {
            Caption = 'Submitted Setter Table of Specification';
            DataClassification = ToBeClassified;
        }
        field(18; "Tos Submission Start Date"; Date)
        {
            Caption = 'Table of Specification Submission Start Date';
            DataClassification = ToBeClassified;
        }
        field(19; "Tos Submission End Date"; Date)
        {
            Caption = 'Table of Specification Submission End Date';
            DataClassification = ToBeClassified;
        }
        field(20; "Setter Table of Specification"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Tos Submitted At"; DateTime)
        {
            Caption = 'Table of Specification Submitted At';
            DataClassification = ToBeClassified;
        }
        field(22; Moderated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Moderated On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Moderated By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25; Reviewed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Reviewed On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Reviewed By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Chief Examined"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Chief Examined On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Chief Examined By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(31; CEO; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "CEO Examined On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Proof Read"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Proof Read On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Line No", "Examination Sitting")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Resource No", Name)
        {
        }
    }

    var
        Paperss: Record Papers;
        Resources: Record Resource;
        TXT001: label 'Kindly ensure the marker is marked as present';
        TXT002: label 'Kindly ensure the solution is submitted';
        TXT003: label 'Kindly ensure Dummy A is submitted';
        TXT004: label 'Kindly ensure Dummy B is submitted';
        MarkerTaskAllocation: Record "Marker Task Allocation";
}
