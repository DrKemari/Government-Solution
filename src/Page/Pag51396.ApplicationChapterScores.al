#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51396 "Application Chapter Scores"
{
    PageType = List;
    SourceTable = "Application Site Score";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Ápplication No."; Rec."Ápplication No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ápplication No. field.';
                }
                field("Chapter Code"; Rec."Chapter Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chapter Code field.';
                }
                field("Chapter Name"; Rec."Chapter Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chapter Name field.';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = Basic;
                    Caption = '(Very Good-4,Good-3,Fair-2,Unsatisfactory-1)';
                    ToolTip = 'Specifies the value of the (Very Good-4,Good-3,Fair-2,Unsatisfactory-1) field.';
                }
                field("Actual Score"; Rec."Actual Score")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual Score';
                    ToolTip = 'Specifies the value of the Actual Score field.';
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

