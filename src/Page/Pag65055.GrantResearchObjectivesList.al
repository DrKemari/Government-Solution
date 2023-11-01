#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65055 "Grant Research Objectives List"
{
    PageType = List;
    SourceTable = "Grant Research Objectives";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Research Objective"; Rec."Research Objective")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Objective field.';
                }
                field("Research Program"; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Program field.';
                }
                field("Project Area"; Rec."Project Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Area field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

