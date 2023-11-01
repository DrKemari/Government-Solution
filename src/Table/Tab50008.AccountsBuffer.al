#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50008 "Accounts Buffer"
{

    fields
    {
        field(1;"Id No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Reg No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Reg Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active';
            OptionMembers = Active;
        }
        field(5;"Student No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Id No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

