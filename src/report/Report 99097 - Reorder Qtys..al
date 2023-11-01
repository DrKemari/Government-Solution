report 99097 "Reorder Qtys."
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reorder Qtys..rdlc';

    dataset
    {
        dataitem(Item;Item)
        {
            column(ReorderPoint_Item;Item."Reorder Point")
            {
            }
            column(Inventory_Item;Item.Inventory)
            {
            }
            column(No_Item;Item."No.")
            {
            }
            column(No2_Item;Item."No. 2")
            {
            }
            column(Description_Item;Item.Description)
            {
            }
            column(SearchDescription_Item;Item."Search Description")
            {
            }
            column(Description2_Item;Item."Description 2")
            {
            }
            column(AssemblyBOM_Item;Item."Assembly BOM")
            {
            }
            column(BaseUnitofMeasure_Item;Item."Base Unit of Measure")
            {
            }
            column(PriceUnitConversion_Item;Item."Price Unit Conversion")
            {
            }
            dataitem("Item Ledger Entry";"Item Ledger Entry")
            {
                DataItemLink = "Item No."=FIELD("No.");
                DataItemTableView = SORTING("Item No.") ORDER(Ascending);
                column(LocationCode_ItemLedgerEntry;"Item Ledger Entry"."Location Code")
                {
                }
                column(Quantity_ItemLedgerEntry;"Item Ledger Entry".Quantity)
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

    labels
    {
    }
}

