#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80067 "Competency Note & Requirement"
{
    PageType = List;
    SourceTable = "Competency Note & Requirement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Competency ID"; Rec."Competency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency ID field.';
                }
                field("Competency Notes"; Rec."Competency Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Notes field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

