#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85011 "Center Examinations"
{
    Caption = 'Center Examinations';
    PageType = List;
    SourceTable = "Center Course Capacity";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course ID';
                    ToolTip = 'Specifies the value of the Course ID field.';
                }
                field(Examination; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

