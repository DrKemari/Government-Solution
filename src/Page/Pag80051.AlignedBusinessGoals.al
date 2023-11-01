#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80051 "Aligned Business Goals"
{
    PageType = List;
    SourceTable = "PC Goal Hub";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Goal ID field.';
                }
                field("Goal Description"; Rec."Goal Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Goal Description field.';
                }
                field("Aligned-To Strategic Plan ID"; Rec."Aligned-To Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aligned-To Strategic Plan ID field.';
                }
                field("Aligned-To PC ID"; Rec."Aligned-To PC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aligned-To PC ID field.';
                }
                field("Aligned-To PC Goal ID"; Rec."Aligned-To PC Goal ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aligned-To PC Goal ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

