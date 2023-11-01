#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54055 "Investment rates"
{
    PageType = List;
    SourceTable = "Investment Rates";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Per value"; Rec."Per value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Per value field.';
                }
                field("Current Market Value"; Rec."Current Market Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Market Value field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

