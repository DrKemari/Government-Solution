#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85078 "Commiitee Members"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Member Role";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Chairperson,Member,Secretary';
            OptionMembers = Chairperson,Member,Secretary;
        }
        field(4;"Member Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

