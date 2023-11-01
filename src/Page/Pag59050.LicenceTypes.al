#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59050 "Licence Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Licence Types";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Licence Type Code"; Rec."Licence Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Type Code field.';
                }
                field("Licence Type Description"; Rec."Licence Type Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Type Description field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
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

