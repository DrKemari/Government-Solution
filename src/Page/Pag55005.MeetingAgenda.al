#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55005 "Meeting Agenda"
{
    PageType = List;
    SourceTable = "Meeting Agenda";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agenda code"; Rec."Agenda code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda code field.';
                }
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Person responsiblee"; Rec."Person responsiblee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Person Responsible';
                    ToolTip = 'Specifies the value of the Person Responsible field.';
                }
                field("Director name"; Rec."Director name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Director name field.';
                }
                field("Scheduled time"; Rec."Scheduled time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheduled time field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

