#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80070 "Competency Profile Line"
{
    PageType = ListPart;
    SourceTable = "Competency Profile Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Competency Profile ID"; Rec."Competency Profile ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Profile ID field.';
                }
                field("Competency Priority"; Rec."Competency Priority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Priority field.';
                }
                field("Competency ID"; Rec."Competency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Competency Rating Scale"; Rec."Competency Rating Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Rating Scale field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

