#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85045 "Disability Details"
{
    PageType = List;
    SourceTable = "Student Disability";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Disability Type"; Rec."Disability Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Type field.';
                }
                field("Disability Name"; Rec."Disability Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Name field.';
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
    }
}

#pragma implicitwith restore

