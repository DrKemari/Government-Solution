#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80399 "BR Branch Response Questions"
{
    PageType = List;
    SourceTable = "BR Branch Response Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Question; Rec.Question)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question field.';
                }
                field("Parent Response"; Rec."Parent Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parent Response field.';
                }
                field("General Response Statement"; Rec."General Response Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Response Statement field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

