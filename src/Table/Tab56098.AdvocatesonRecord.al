#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56098 "Advocates on Record"
{
    DrillDownPageID = "Advocate on record list";
    LookupPageID = "Advocate on record list";

    fields
    {
        field(1;no;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"advocate name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"line no";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Plaintiff,Defendant';
            OptionMembers = ,Plaintiff,Defendant;
        }
        field(6;"Advocate Firm";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;no,"line no")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

