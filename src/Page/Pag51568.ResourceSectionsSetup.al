#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51568 "Resource Sections Setup"
{
    PageType = List;
    SourceTable = "Audit Resource Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resource Category"; Rec."Resource Category")
                {
                    ApplicationArea = Basic;
                }
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Links)
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

