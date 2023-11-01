#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51527 "Audit Programme Grading"
{
    PageType = List;
    SourceTable = "Audit Programme Grading";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Grade Code"; Rec."Grade Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade Code field.';
                }
                field("Score Range"; Rec."Score Range")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score Range field.';
                }
                field("GPA Points"; Rec."GPA Points")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GPA Points field.';
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

