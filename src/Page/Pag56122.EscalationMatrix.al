#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56122 "Escalation Matrix"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "ICT Helpdesk Escalation Matrix";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officer Name field.';
                }
                field("Reports To Officer Name"; Rec."Reports To Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reports To Officer Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

