#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69490 "Incident Severity Levels"
{
    ApplicationArea = Basic;
    CardPageID = "Incident Severity Level";
    PageType = List;
    SourceTable = "Incident Severity Level";
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
                field("No. Of Reported Incidents"; Rec."No. Of Reported Incidents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Reported Incidents field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

