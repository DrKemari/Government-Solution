#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72130 "Progress Employment"
{
    PageType = ListPart;
    SourceTable = "Progress Employment";

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
                field("Male Count"; Rec."Male Count")
                {
                    ApplicationArea = Basic;
                }
                field("Female Count"; Rec."Female Count")
                {
                    ApplicationArea = Basic;
                }
                field("Male Person Days"; Rec."Male Person Days")
                {
                    ApplicationArea = Basic;
                }
                field("Female Person Days"; Rec."Female Person Days")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Target Person Days"; Rec."Remaining Target Person Days")
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

