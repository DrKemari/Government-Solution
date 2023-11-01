#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85404 "Paper Topic Area Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Paper Topic Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Code field.';
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Name field.';
                }
                field("Topic Code"; Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Topic Code field.';
                }
                field("Topic Name"; Rec."Topic Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Topic Name field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

