#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56149 "ICT Asset Subcategory"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "ICT Asset subcategory";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Asset Category"; Rec."Asset Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Category field.';
                }
                field("No. of ICT Inventory"; Rec."No. of ICT Inventory")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of ICT Inventory field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

