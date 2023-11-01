#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69492 "Incident Party Types"
{
    ApplicationArea = Basic;
    CardPageID = "Incident Party Type";
    PageType = List;
    SourceTable = "Incident Party Type";
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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Safety Workgroup ID"; Rec."Safety Workgroup ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety Workgroup ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

