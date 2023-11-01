#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85528 "Question Bank Analysis"
{
    PageType = ListPart;
    SourceTable = "Setter Marks Per Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(SetterCode;Rec."Setter Code")
                {
                    ApplicationArea = Basic;
                }
                field(SetterName;Rec."Setter Name")
                {
                    ApplicationArea = Basic;
                }
                field(QuestionNo;Rec."Question No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PaperCode;Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field(PaperName;Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(MarksAwarded;Rec."Marks Awarded")
                {
                    ApplicationArea = Basic;
                }
                field(Contributed;Rec.Contributed)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(References;Rec.References)
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
                field(ApplicationandAnalysis;Rec."Application and Analysis")
                {
                    ApplicationArea = Basic;
                }
                field(KnowledgeandComprehension;Rec."Knowledge and Comprehension")
                {
                    ApplicationArea = Basic;
                }
                field(EvaluationandCreativity;Rec."Evaluation and Creativity")
                {
                    ApplicationArea = Basic;
                }
                field(Topic2Code;Rec."Topic 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Topic2Name;Rec."Topic 2 Name")
                {
                    ApplicationArea = Basic;
                }
                field(Topic2References;Rec."Topic 2 References")
                {
                    ApplicationArea = Basic;
                }
                field(Topic3Code;Rec."Topic 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Topic3Name;Rec."Topic 3 Name")
                {
                    ApplicationArea = Basic;
                }
                field(Topic3References;Rec."Topic 3 References")
                {
                    ApplicationArea = Basic;
                }
                field(Topic4Code;Rec."Topic 4 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Topic4Name;Rec."Topic 4 Name")
                {
                    ApplicationArea = Basic;
                }
                field(Topic4References;Rec."Topic 4 References")
                {
                    ApplicationArea = Basic;
                }
                field(Topic5Code;Rec."Topic 5 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Topic5Name;Rec."Topic 5 Name")
                {
                    ApplicationArea = Basic;
                }
                field(Topic5References;Rec."Topic 5 References")
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
