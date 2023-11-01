#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85518 "Specific Comments"
{
    PageType = ListPart;
    SourceTable = "Examination Review Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(QuestionNo;Rec."Question No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TopicCode;Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TopicName;Rec."Topic Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Comments;Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ActionTaken;Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Action Taken';
                }
            }
        }
    }

    actions
    {
    }
}
