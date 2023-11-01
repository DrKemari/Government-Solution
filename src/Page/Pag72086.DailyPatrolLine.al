#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72086 "Daily Patrol Line"
{
    PageType = ListPart;
    SourceTable = "Daily Patrol Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field(Chainage; Rec.Chainage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chainage field.';
                }
                field("Time Detected"; Rec."Time Detected")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Detected field.';
                }
                field("Time Removed"; Rec."Time Removed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Removed field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Photo No"; Rec."Photo No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Photo No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

