#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69410 "Evacuation Event D. Criterion"
{
    PageType = Card;
    SourceTable = "Evacuation Event Drill Criteri";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Event ID"; Rec."Event ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Event ID field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
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
