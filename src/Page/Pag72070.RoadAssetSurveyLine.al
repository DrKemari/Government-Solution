#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72070 "Road Asset Survey Line"
{
    PageType = ListPart;
    SourceTable = "Road Asset Survey Sheet Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Item; Rec.Item)
                {
                    ApplicationArea = Basic;
                }
                field(Unit; Rec.Unit)
                {
                    ApplicationArea = Basic;
                }
                field("Simple Quantity"; Rec."Simple Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Quantity"; Rec."Actual Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension & Condition"; Rec."Dimension & Condition")
                {
                    ApplicationArea = Basic;
                }
                field(Remark; Rec.Remark)
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

