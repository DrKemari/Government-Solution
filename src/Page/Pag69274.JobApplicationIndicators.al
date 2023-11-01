#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69274 "Job Application Indicators"
{
    PageType = List;
    SourceTable = "Applications Accomplishmentss";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job Indicator Code"; Rec."Job Indicator Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Indicator Code field.';
                }
                field("Indicator Description"; Rec."Indicator Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Indicator Description field.';
                }
                field(Number; Rec.Number)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number field.';
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

