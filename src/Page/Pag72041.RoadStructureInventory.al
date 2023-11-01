#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72041 "Road Structure Inventory"
{
    ApplicationArea = Basic;
    Caption = 'Road Structure Inventory';
    PageType = List;
    SourceTable = "Road Facility Inventory";
    SourceTableView = where("Road Facility Catgegory" = const(Structure));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Facility ID"; Rec."Facility ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility Catgegory"; Rec."Road Facility Catgegory")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility Type"; Rec."Road Facility Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Facility Label"; Rec."Facility Label")
                {
                    ApplicationArea = Basic;
                }
                field("Facility Location"; Rec."Facility Location")
                {
                    ApplicationArea = Basic;
                }
                field("Facility Material Type"; Rec."Facility Material Type")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Vendor No."; Rec."Construction Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Vendor Name"; Rec."Construction Vendor Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Road Facility Catgegory" := Rec."road facility catgegory"::Structure;
    end;
}

#pragma implicitwith restore

