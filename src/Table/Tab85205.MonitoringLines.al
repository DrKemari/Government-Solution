#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85205 "Monitoring Lines"
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
            TableRelation = "Monitoring Areas";

            trigger OnValidate()
            begin
                if ApplicationTopics.Get("Component Code") then begin
                  "Component Description":=ApplicationTopics."Component Description";
                end
            end;
        }
        field(3;"Component Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Sub-Component Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = "Monitoring Sub-Areas" where ("Area Code"=field("Component Code"));

            trigger OnValidate()
            begin

                  if ApplicationSubTopics.Get("Sub-Component Code") then begin
                  "Sub-Component Description":=ApplicationSubTopics.Description;
                   "Maximum Score":=ApplicationSubTopics."Maximum Score";
                end
            end;
        }
        field(5;"Sub-Component Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Maximum Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Score;Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Score>"Maximum Score" then Error('Should not exceed the maximum score');
            end;
        }
        field(9;Strength;Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(10;Weakness;Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Recommendation;Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Evaluation Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Comment;Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Accreditation,Development';
            OptionMembers = Accreditation,Development;
        }
        field(15;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Closed';
            OptionMembers = Open,Closed;
        }
    }

    keys
    {
        key(Key1;"Code","Evaluation Header No.","Document Type","Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ApplicationSubTopics: Record "Monitoring Sub-Areas";
        ApplicationTopics: Record "Monitoring Areas";
}

