#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56065 "ICT Asset subcategory"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Name;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Asset Category";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Asset Category".Code;
        }
        field(4;"No. of ICT Inventory";Integer)
        {
            CalcFormula = count("ICT Inventory" where ("ICT Asset subcategory"=field(Code)));
            FieldClass = FlowField;
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

