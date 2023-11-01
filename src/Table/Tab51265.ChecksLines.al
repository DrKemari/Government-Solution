#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51265 "Checks Lines"
{

    fields
    {
        field(1;"Code";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Component Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application Chapter";

            trigger OnValidate()
            begin
                if ApplicationTopics.Get("Component Code") then begin
                  "Component Description":=ApplicationTopics."Component Description";
                  end
            end;
        }
        field(3;"Component Description";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Complete,Incomplete';
            OptionMembers = Complete,Incomplete;
        }
        field(5;"Evaluation Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Document Type";Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Feedback,Evaluation';
            OptionMembers = Feedback,Evaluation;
        }
        field(7;Comment;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Evaluation Header No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ApplicationSubTopics: Record "Application SubTopics";
        ApplicationTopics: Record "Application Chapter";
}

