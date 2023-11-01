#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59128 "Fuel Milleage"
{
    PageType = ListPart;
    SourceTable = "Fuel Milleage Req";

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
                field(Month; Rec.Month)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Month field.';
                }
                field("Fuel Drawn"; Rec."Fuel Drawn")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Drawn field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

