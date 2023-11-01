#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72131 "Progress Per Road Activity"
{
    PageType = ListPart;
    SourceTable = "Progress Per Road Activity";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header No"; Rec."Header No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Bill No"; Rec."Bill No")
                {
                    ApplicationArea = Basic;
                }
                field("Item Code"; Rec."Item Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Bid Rate(LCY)"; Rec."Bid Rate(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Amount(LCY)"; Rec."Bill Item Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Quantity"; Rec."Previous Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Percantage"; Rec."Previous Percantage")
                {
                    ApplicationArea = Basic;
                }
                field("This Quantity"; Rec."This Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("This Quantity Percentage"; Rec."This Quantity Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Done To Date Quantity"; Rec."Done To Date Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Done To Date Percentage"; Rec."Done To Date Percentage")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

