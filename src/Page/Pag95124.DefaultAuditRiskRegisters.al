#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95124 "Default Audit Risk Registers"
{
    CardPageID = "Default Audit Risk Register";
    PageType = List;
    SourceTable = "Default Audit Risk Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Risk ID"; Rec."Audit Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Risk ID field.';
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Title field.';
                }
                field("Audit Risk Type"; Rec."Audit Risk Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Risk Type field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

