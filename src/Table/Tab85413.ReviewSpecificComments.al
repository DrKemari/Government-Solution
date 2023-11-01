#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85413 "Review Specific Comments"
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
        field(3; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Comment Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Reviewer Comment Setup";

            trigger OnValidate()
            var
                CommentSetup: Record "Reviewer Comment Setup";
            begin
                CommentSetup.Reset;
                CommentSetup.SetRange(Code, "Comment Code");
                if CommentSetup.FindFirst then begin
                    "Comment Description" := CommentSetup.Description
                end
            end;
        }
        field(5; "Comment Description"; Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; Response; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Action Taken"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
