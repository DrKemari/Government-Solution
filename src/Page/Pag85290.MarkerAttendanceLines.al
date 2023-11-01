#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85290 "Marker Attendance Lines"
{
    PageType = ListPart;
    SourceTable = "Checkers Ticket Lines";

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
                field("Marker No"; Rec."Marker No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker No field.';
                }
                field("Marker Name"; Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

