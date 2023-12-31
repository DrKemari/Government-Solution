#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69410 "Safety Workgroup"
{

    fields
    {
        field(1;"Workgroup ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[440])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Stakeholder Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Workgroup ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

