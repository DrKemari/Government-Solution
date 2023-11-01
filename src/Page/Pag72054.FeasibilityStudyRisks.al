#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72054 "Feasibility Study Risks"
{
    PageType = List;
    SourceTable = "Feasibility Study Risk";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Feasibility Study No"; Rec."Feasibility Study No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Feasibility Study No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

