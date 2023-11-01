#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69553 "Succession Template Lines"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Position ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions"."Position ID";
        }
        field(3;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Initiative Category";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Succession Template Category".Code where (Blocked=const(false));
        }
        field(5;Initiative;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Position ID","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

