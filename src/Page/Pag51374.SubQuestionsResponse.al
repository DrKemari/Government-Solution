#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51374 "SubQuestions Response"
{
    PageType = List;
    SourceTable = "Application Sub-Ques Response";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Subquestion Code"; Rec."Subquestion Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Accreditation Answers"; Rec."Accreditation Answers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Answers';
                }
                field(Response; Rec.Response)
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

