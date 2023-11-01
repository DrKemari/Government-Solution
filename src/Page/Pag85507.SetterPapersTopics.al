#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85507 "Setter Papers Topics"
{
    PageType = ListPart;
    SourceTable = "Disclosure Paper Submitted";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Examination;Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationName;Rec."Examination Name")
                {
                    ApplicationArea = Basic;
                }
                field(Level;Rec.Level)
                {
                    ApplicationArea = Basic;
                }
                field(PaperCode;Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field(PaperName;Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(QuestionNo;Rec."Question No.")
                {
                    ApplicationArea = Basic;
                }
                field(TopicCode;Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                }
                field(TopicName;Rec."Topic Name")
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
