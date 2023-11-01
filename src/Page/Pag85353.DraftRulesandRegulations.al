#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85353 "Draft Rules and Regulations"
{
    PageType = List;
    SourceTable = "Syllabus Rules and Regulations";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Rule Type"; Rec."Rule Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rule Type field.';
                }
                field("Rule Name"; Rec."Rule Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rule Name field.';
                }
                field(Details; Rec.Details)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Details field.';
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

