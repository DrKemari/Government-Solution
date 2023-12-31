#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70054 "EBoard Audit Trails"
{

    fields
    {
        field(1;entryId;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"LoggedIn ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Last Login Time";DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;entryId)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

