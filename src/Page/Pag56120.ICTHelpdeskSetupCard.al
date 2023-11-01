#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56120 "ICT Helpdesk Setup Card"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk Global Parameters";

    layout
    {
        area(content)
        {
            group("Global Parameters")
            {
                field("User Feedback Duration"; Rec."User Feedback Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Feedback Duration field.';
                }
                field("Assigned Issue Duration"; Rec."Assigned Issue Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Issue Duration field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

