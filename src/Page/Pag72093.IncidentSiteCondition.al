#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72093 "Incident Site Condition"
{
    PageType = ListPart;
    SourceTable = "Incident Site Condition";

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
                field(Assets; Rec.Assets)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assets field.';
                }
                field("Damage Condition"; Rec."Damage Condition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Damage Condition field.';
                }
                field("Photo no"; Rec."Photo no")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Photo no field.';
                }
                field("Incident No"; Rec."Incident No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

