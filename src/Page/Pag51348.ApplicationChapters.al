#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51348 "Application Chapters"
{
    ApplicationArea = Basic;
    Caption = 'Chapters';
    PageType = List;
    SourceTable = "Application Chapter";
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
                    Caption = 'Chapter Code';
                    ToolTip = 'Specifies the value of the Chapter Code field.';
                }
                field("Component Description"; Rec."Component Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Component Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

