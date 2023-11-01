#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80087 "Goal Template Lines"
{
    PageType = List;
    SourceTable = "Goal Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Goal ID field.';
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Goal Template ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Goal Category"; Rec."Goal Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Goal Category field.';
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan ID field.';
                }
                field("Strategic Objective ID"; Rec."Strategic Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategic Objective ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

