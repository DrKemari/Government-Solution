#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 56060 "ICT Inventory"
{

    schema
    {
        textelement(Root)
        {
            tableelement("ICT Inventory";"ICT Inventory")
            {
                XmlName = 'ICTInventory';
                fieldelement(Code;"ICT Inventory".Code)
                {
                }
                fieldelement(Description;"ICT Inventory".Description)
                {
                }
                fieldelement(Subtype;"ICT Inventory"."Sub-Type")
                {
                }
                fieldelement(SubtypeNo;"ICT Inventory"."Sub Type No.")
                {
                }
                fieldelement(Location;"ICT Inventory"."Location Code")
                {
                }
                fieldelement(AssetCategory;"ICT Inventory"."ICT Asset Category")
                {
                }
                fieldelement(SerialNo;"ICT Inventory"."Serial No.")
                {
                }
                fieldelement(WarrantDate;"ICT Inventory"."Warranty Date")
                {
                }
                fieldelement(Employee;"ICT Inventory"."Current Assigned Employee")
                {
                }
                fieldelement(Division;"ICT Inventory"."Current Assigned Division/Unit")
                {
                }
                fieldelement(ProductKey;"ICT Inventory"."Software Product key")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

