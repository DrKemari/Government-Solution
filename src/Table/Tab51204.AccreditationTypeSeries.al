#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51204 "Accreditation Type Series"
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;"Accreditation Type";Option)
        {
            OptionMembers = "Program",Institution;
        }
        field(3;Description;Text[30])
        {
        }
        field(4;"No. Series";Code[30])
        {
            TableRelation = "No. Series".Code;
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

