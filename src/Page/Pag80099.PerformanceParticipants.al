#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80099 "Performance Participants"
{
    PageType = List;
    SourceTable = "Performance Participant";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Doc No."; Rec."Performance Doc No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Role; Rec.Role)
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

