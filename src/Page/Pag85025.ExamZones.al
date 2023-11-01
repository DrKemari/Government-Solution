#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85025 "Exam Zones"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Exam Zones";
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
                field("Zone Name"; Rec."Zone Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Zone Name field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("No. of Exam Centers"; Rec."No. of Exam Centers")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Exam Centers field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

