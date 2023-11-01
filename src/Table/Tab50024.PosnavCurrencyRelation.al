#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50024 "Pos- nav Currency Relation"
{
    DrillDownPageID = "POS-NAV Currency Relation";
    LookupPageID = "POS-NAV Currency Relation";

    fields
    {
        field(1;"Pos Currency Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Related Nav Currency Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
    }

    keys
    {
        key(Key1;"Pos Currency Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

