Table 50514 "PR Bank Accounts"
{
    DrillDownPageID = "PR Bank Accounts";
    LookupPageID = "PR Bank Accounts";
    DataCaptionFields = "Bank Code", "Bank Name";

    fields
    {
        field(1; "Bank Code"; Code[20])
        {
        }
        field(2; "Bank Name"; Text[100])
        {
        }
        field(3; "Bank Type"; Option)
        {
            OptionMembers = Bank,Sacco;
        }
    }

    keys
    {
        key(Key1; "Bank Code")
        {
            Clustered = true;
        }
        key(Key2; "Bank Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Bank Code", "Bank Name")
        {
        }
    }
}

