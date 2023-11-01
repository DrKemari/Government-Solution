#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51206 "Accreditation Verdict Setup"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[30])
        {
        }
        field(3; "Grace Period"; DateFormula)
        {
        }
        field(4; "Accreditation Type"; Text[30])
        {
            TableRelation = "Proposal Documen Topic";
        }
        field(30; Blocked; Boolean)
        {
            // TableRelation = "Proposal Documen Topic";
        }
    }

    keys
    {
        key(Key1; "Code", Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

