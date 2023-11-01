#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55006 "Agenda Supporting Documents"
{
    PageType = List;
    SourceTable = "Agenda Supporting Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Meeting code"; Rec."Meeting code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting code field.';
                }
                field("Agenda No"; Rec."Agenda No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda No field.';
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
                field("Link/Location"; Rec."Link/Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link/Location field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

