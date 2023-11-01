#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70048 "Commitee Members"
{
    PageType = ListPart;
    SourceTable = "Commitee Members";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Chair; Rec.Chair)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chair field.';
                }
                field(Secretary; Rec.Secretary)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Secretary field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

