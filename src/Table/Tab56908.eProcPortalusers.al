#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 76908 "eProcPortalusers"
{

    fields
    {
        field(1; "customer No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Password; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Last Login"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; status; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; changedPassword; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; validated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; usertype; Integer)
        {
            DataClassification = ToBeClassified;
            Description = '0 for customers, 1 for directors';
        }
        field(8; isAdmin; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Email; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; ActivatedAsVendor; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; IDNoorRegNo; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "customer No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

