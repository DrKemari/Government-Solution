#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69296 "Need Requests"
{
    PageType = ListPart;
    SourceTable = "Training Needs Requests";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Source; Rec.Source)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

