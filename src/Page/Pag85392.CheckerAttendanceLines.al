#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85392 "Checker Attendance Lines"
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
                    Caption = 'Checker No';
                    ToolTip = 'Specifies the value of the Checker No field.';
                }
                field("Marker Name"; Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Checker Name';
                    ToolTip = 'Specifies the value of the Checker Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

