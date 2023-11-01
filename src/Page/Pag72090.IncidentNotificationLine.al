#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72090 "Incident Notification Line"
{
    PageType = ListPart;
    SourceTable = "Incident Notification";

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
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(Caller; Rec.Caller)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Caller field.';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date Of Incident"; Rec."Date Of Incident")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Incident field.';
                }
                field("Time of Incident"; Rec."Time of Incident")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time of Incident field.';
                }
                field("Road Chainage"; Rec."Road Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Chainage field.';
                }
                field("Road Location"; Rec."Road Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Location field.';
                }
                field("Information Resource"; Rec."Information Resource")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Information Resource field.';
                }
                field("Nature of Incident"; Rec."Nature of Incident")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Incident field.';
                }
                field("Location Of Incident"; Rec."Location Of Incident")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Of Incident field.';
                }
                field("Condition of Accident Vehicles"; Rec."Condition of Accident Vehicles")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Condition of Accident Vehicles field.';
                }
                field("No. Of Injured People"; Rec."No. Of Injured People")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Injured People field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

