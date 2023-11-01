#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56075 "ICT Maintenance Inventory"
{

    fields
    {
        field(1;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"ICT Inventory";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Inventory".Code;

            trigger OnValidate()
            begin
                 ICTInventory.Reset;
                 ICTInventory.SetRange(Code,"ICT Inventory");
                 if ICTInventory.FindSet then
                  Description:=ICTInventory.Description;
                 "ICT Category":=ICTInventory."ICT Asset Category";
                 "ICT Sub Category":=ICTInventory."ICT Asset subcategory";
            end;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"ICT Category";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Asset Category".Code;
        }
        field(5;"ICT Sub Category";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Asset subcategory".Code where ("Asset Category"=field("ICT Category"));
        }
        field(6;"Mainatenance Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","ICT Inventory","Mainatenance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTInventory: Record "ICT Inventory";
}

