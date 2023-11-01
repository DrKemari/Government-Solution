#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65127 "Milestones Lines"
{
    PageType = List;
    SourceTable = "Milestones Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Task No"; Rec."Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task No field.';
                }
                field("Milestone Code"; Rec."Milestone Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Milestone Code field.';
                }
                field("Milestone Description"; Rec."Milestone Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Milestone Description field.';
                }
                field("Milestone Start Date"; Rec."Milestone Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Milestone Start Date field.';
                }
                field("Milestone End Date"; Rec."Milestone End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Milestone End Date field.';
                }
                field("Notification Period"; Rec."Notification Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification Period field.';
                }
                field("Notfification Date"; Rec."Notfification Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notfification Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

