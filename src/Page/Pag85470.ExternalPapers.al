#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85470 "External  Papers"
{
    PageType = List;
    SourceTable = "External  Papers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Course;Rec.Course)
                {
                    ApplicationArea = Basic;
                }
                field(Level;Rec.Level)
                {
                    ApplicationArea = Basic;
                }
                field("Code";Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7;Outlook)
            {
            }
            systempart(Control8;Notes)
            {
            }
            systempart(Control9;MyNotes)
            {
            }
            systempart(Control10;Links)
            {
            }
        }
    }

    actions
    {
    }
}
