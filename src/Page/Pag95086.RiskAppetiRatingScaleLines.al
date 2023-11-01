#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95086 "Risk Appeti Rating Scale Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Rating Scale Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Rating Scale Type"; Rec."Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Rating Score"; Rec."Rating Score")
                {
                    ApplicationArea = Basic;
                }
                field(Tolerance; Rec.Tolerance)
                {
                    ApplicationArea = Basic;
                }
                field(Choice; Rec.Choice)
                {
                    ApplicationArea = Basic;
                }
                field("Trade-Off"; Rec."Trade-Off")
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
            group(Line)
            {
                Caption = '&Line';
                action("Probability Criteria")
                {
                    ApplicationArea = Basic;
                    Image = ProjectExpense;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Risk Rating Criteria";
                    RunPageLink = "Risk Rating Scale Type"=filter("Likelihood Rating"),
                                  "Rating Scale ID"=field("Rating Scale ID"),
                                  Code=field(Code);
                    Visible = false;
                }
            }
        }
    }
}

#pragma implicitwith restore

