#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 58416 "Key Performance Indicators"
{
    PageType = List;
    SourceTable = "Key Performance Indicator";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(KPI; Rec.KPI)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KPI field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field(Achievement; Rec.Achievement)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achievement field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

