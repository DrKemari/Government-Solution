#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51404 "Accreditation Courses"
{
    PageType = ListPart;
    SourceTable = "Accreditation Trainers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Code field.';
                }
                field("Course Section"; Rec."Course Section")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Section field.';
                }
                field("Min Lec Hrs Per Week Trainer"; Rec."Min Lec Hrs Per Week Trainer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Lec Hrs Per Week Trainer field.';
                }
                field("Max Lec Hrs Per Week Trainer"; Rec."Max Lec Hrs Per Week Trainer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Lec Hrs Per Week Trainer field.';
                }
                field("Min Course Hrs Per Week Sem"; Rec."Min Course Hrs Per Week Sem")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Course Hrs Per Week Sem field.';
                }
                field("Max Course Hrs Per Week Sem"; Rec."Max Course Hrs Per Week Sem")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Course Hrs Per Week Sem field.';
                }
                field("Max no of hrs per paper per wk"; Rec."Max no of hrs per paper per wk")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maximum per paper  x semester weeks)';
                    ToolTip = 'Specifies the value of the Maximum field.';
                }
                field("Min no of hrs per paper per wk"; Rec."Min no of hrs per paper per wk")
                {
                    ApplicationArea = Basic;
                    Caption = 'Minimum per paper  x semester weeks)';
                    ToolTip = 'Specifies the value of the Minimum field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

