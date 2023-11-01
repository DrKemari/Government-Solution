#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69799 "Test Responses"
{
    PageType = ListPart;
    SourceTable = "Test Response Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                }
                field(Question; Rec.Question)
                {
                    ApplicationArea = Basic;
                }
                field("Selected Answer"; Rec."Selected Answer")
                {
                    ApplicationArea = Basic;
                }
                field("Pass/Fail"; Rec."Pass/Fail")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

