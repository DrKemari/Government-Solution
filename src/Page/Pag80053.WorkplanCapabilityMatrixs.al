#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80053 "Workplan Capability Matrixs"
{
    PageType = List;
    SourceTable = "PC Capability Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Capability Category"; Rec."Capability Category")
                {
                    ApplicationArea = Basic;
                }
                field("Capability Description"; Rec."Capability Description")
                {
                    ApplicationArea = Basic;
                }
                field("Inventory Summary"; Rec."Inventory Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
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

