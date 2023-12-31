#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95000 "Stakeholder"
{
    DrillDownPageID = StakeHolders;
    LookupPageID = StakeHolders;

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Stakeholder Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Default Form ID";Code[50])
        {
            DataClassification = ToBeClassified;
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

