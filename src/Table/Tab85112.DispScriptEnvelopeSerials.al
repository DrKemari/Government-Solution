#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85112 "Disp Script Envelope Serials"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Paper Code"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
            end;
        }
        field(5; "Envelope Serial No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "No. of Scripts"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Marker Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Marker Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Allocated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(11; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(12; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Level; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Project No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Center Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Center Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Reallocated From Marker Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Reallocated From Marker Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Reallocated On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Re-Allocated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; Submitted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Checker Submitted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Entry No", "Line No.", "Envelope Serial No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Envelope Serial No.", "No. of Scripts")
        {
        }
    }
}
