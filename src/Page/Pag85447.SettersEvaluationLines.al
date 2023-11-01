#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85447 "Setters Evaluation Lines"
{
    PageType = ListPart;
    SourceTable = "Setters Evaluation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Setter Code"; Rec."Setter Code")
                {
                    ApplicationArea = Basic;
                }
                field("Name of Setter"; Rec."Name of Setter")
                {
                    ApplicationArea = Basic;
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field(paper; Rec.paper)
                {
                    ApplicationArea = Basic;
                }
                field("Syllabus Coverage"; Rec."Syllabus Coverage")
                {
                    ApplicationArea = Basic;
                }
                field("Quality of questions"; Rec."Quality of questions")
                {
                    ApplicationArea = Basic;
                }
                field(Originality; Rec.Originality)
                {
                    ApplicationArea = Basic;
                }
                field("Mix of theory and practical"; Rec."Mix of theory and practical")
                {
                    ApplicationArea = Basic;
                }
                field("Quality of solutions"; Rec."Quality of solutions")
                {
                    ApplicationArea = Basic;
                }
                field("Other comments eg timeliness"; Rec."Other comments eg timeliness")
                {
                    ApplicationArea = Basic;
                }
                field(Recommendation; Rec.Recommendation)
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

