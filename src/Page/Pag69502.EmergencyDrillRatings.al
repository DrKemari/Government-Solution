#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69502 "Emergency Drill Ratings"
{
    CardPageID = "Emergency Drill Rating";
    PageType = List;
    SourceTable = "Emergency Drill Rating";

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
                field("Evaluation Criterion"; Rec."Evaluation Criterion")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Criterion field.';
                }
                field("General Rating"; Rec."General Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Rating field.';
                }
                field("Additional Comments/Notes"; Rec."Additional Comments/Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments/Notes field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

