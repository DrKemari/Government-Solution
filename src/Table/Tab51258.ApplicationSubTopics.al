#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51258 "Application SubTopics"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Component Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application Topic";
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Maximum Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Evaluation,Site Visit';
            OptionMembers = Evaluation,"Site Visit";
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
