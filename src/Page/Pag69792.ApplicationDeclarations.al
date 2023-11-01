#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69792 "Application Declarations"
{
    PageType = List;
    SourceTable = "Application Declaration";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Declaration Statement"; Rec."Declaration Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Declaration Statement field.';
                }
                field("Candidate Accepted"; Rec."Candidate Accepted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Accepted field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Links)
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

