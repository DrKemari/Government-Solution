#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69353 "Job Position"
{
    PageType = Card;
    SourceTable = Positions;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control18; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Links)
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

