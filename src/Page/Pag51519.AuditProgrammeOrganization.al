#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51519 "Audit Programme Organization"
{
    PageType = List;
    SourceTable = "Quality Response Programme Org";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Year of Study"; Rec."Year of Study")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year of Study field.';
                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Semester field.';
                }
                field("Course Unit"; Rec."Course Unit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Unit field.';
                }
                field("Course Unit Type"; Rec."Course Unit Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Unit Type field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Subject Area Contact Hours")
            {
                ApplicationArea = Basic;
                Image = DueDate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Accreditation Lines";
                RunPageLink = "Component Code" = field("Quality Response No."),
                              "Sub-Component Code" = field("Course Unit");
                ToolTip = 'Executes the Subject Area Contact Hours action.';
            }
        }
    }
}

#pragma implicitwith restore

