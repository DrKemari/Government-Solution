#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85456 "Quality Assurance Findings"
{
    PageType = ListPart;
    SourceTable = "Audit Report Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Situation Found"; Rec."Situation Found")
                {
                    ApplicationArea = Basic;
                }
                field("Evidence and Analysis"; Rec."Evidence and Analysis")
                {
                    ApplicationArea = Basic;
                }
                field(Causes; Rec.Causes)
                {
                    ApplicationArea = Basic;
                }
                field(Effect; Rec.Effect)
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
        area(processing)
        {
            action("Detailed Findings")
            {
                ApplicationArea = Basic;
                RunObject = Page "Det Quality Assurance Findings";
                RunPageLink = "Header No."=field("Header No."),
                              "Line No."=field("Entry No.");
            }
        }
    }
}

#pragma implicitwith restore

