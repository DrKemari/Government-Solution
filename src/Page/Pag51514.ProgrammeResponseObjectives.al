#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51514 "Programme Response Objectives"
{
    PageType = List;
    SourceTable = "Audit Programme Objectives";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control5; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control6; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; Links)
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

