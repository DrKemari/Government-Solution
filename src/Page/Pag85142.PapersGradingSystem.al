#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85142 "Papers Grading System"
{
    PageType = List;
    SourceTable = "Papers Grading System";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part field.';
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section field.';
                }
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Grade Code"; Rec."Grade Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade Code field.';
                }
                field("Grade Description"; Rec."Grade Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade Description field.';
                }
                field("From Marks"; Rec."From Marks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Marks field.';
                }
                field("To Marks"; Rec."To Marks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Marks field.';
                }
                field(Range; Rec.Range)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Range field.';
                }
                field(Failed; Rec.Failed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Failed field.';
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
            systempart(Control16; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; Links)
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

