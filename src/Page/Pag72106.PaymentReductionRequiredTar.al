#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72106 "Payment Reduction Required Tar"
{
    PageType = ListPart;
    SourceTable = "Payment Reduction Required Tar";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry no"; Rec."Entry no")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry no field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Elapse Of Month"; Rec."Elapse Of Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Elapse Of Month field.';
                }
                field("Road Usability"; Rec."Road Usability")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Usability field.';
                }
                field("Road User Comfort"; Rec."Road User Comfort")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road User Comfort field.';
                }
                field("Road Durability"; Rec."Road Durability")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Durability field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

