#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69405 "Evacuation Events"
{
    ApplicationArea = Basic;
    CardPageID = "Emergency Evacuation Event";
    Editable = false;
    PageType = List;
    SourceTable = "Evacuation Event";
    UsageCategory = Administration;

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Hazard Type"; Rec."Hazard Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard Type field.';
                }
                field("No. of Planned Emerge Drills"; Rec."No. of Planned Emerge Drills")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planned Emerge Drills field.';
                }
                field("No. of Conducted Emerge Drills"; Rec."No. of Conducted Emerge Drills")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Conducted Emerge Drills field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

