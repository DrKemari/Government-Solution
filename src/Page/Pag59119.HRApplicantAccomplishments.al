#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59119 "HR Applicant Accomplishments"
{
    PageType = List;
    SourceTable = "HR Applications Accomplishment";

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
                field("Job Application No"; Rec."Job Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Application No field.';
                }
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
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Id Number"; Rec."Id Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Id Number field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

