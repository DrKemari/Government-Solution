#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69179 "Rating Category Setup"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Feedback,Evaluation';
            OptionMembers = Feedback,Evaluation;
        }
        field(4;"Rating Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Supervisor,Self';
            OptionMembers = Supervisor,Self;
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
        fieldgroup(DropDown;Description)
        {
        }
    }
}

