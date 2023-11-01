#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69617 "Hr Guiding Principle"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "HR Guiding Principle";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("HR Process"; Rec."HR Process")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Process field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

