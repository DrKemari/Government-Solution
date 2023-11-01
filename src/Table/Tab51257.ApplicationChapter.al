#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51257 "Application Chapter"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Component Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Application,Asssessment;
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
        fieldgroup(DropDown;"Code","Component Description")
        {
        }
    }
}
