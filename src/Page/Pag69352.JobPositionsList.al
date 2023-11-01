#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69352 "Job Positions List"
{
    ApplicationArea = Basic;
    CardPageID = "Job Position";
    Editable = false;
    PageType = List;
    SourceTable = Positions;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Posts field.';
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Occupied Positions field.';
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacant Positions field.';
                }
                field(UserID; Rec.UserID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Position Reporting To"; Rec."Position Reporting To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position Reporting To field.';
                }
                field("Reporting To Title"; Rec."Reporting To Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting To Title field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Level Code"; Rec."Level Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level Code field.';
                }
                field("Level Description"; Rec."Level Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level Description field.';
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

