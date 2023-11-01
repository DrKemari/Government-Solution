#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69516 "Meetings Schedule"
{
    PageType = List;
    SourceTable = "Meetings Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting Date"; Rec."Meeting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Date field.';
                }
                field("Meeting Place"; Rec."Meeting Place")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Place field.';
                }
                field("Meeting Status"; Rec."Meeting Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Status field.';
                }
                field("Meeting Outcome(Brief)"; Rec."Meeting Outcome(Brief)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Outcome(Brief) field.';
                }
                field("User to Notify"; Rec."User to Notify")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User to Notify field.';
                }
                field("User Email"; Rec."User Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Email field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

