#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85107 "Template Lines1"
{
    PageType = ListPart;
    SourceTable = "Staff Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Team Type"; Rec."Team Type")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field(Desciption; Rec.Desciption)
                {
                    ApplicationArea = Basic;
                }
                field("Min. No. of Recommended Staff"; Rec."Min. No. of Recommended Staff")
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
            group(Details)
            {
                action(Experience)
                {
                    ApplicationArea = Basic;
                    Image = Timeline;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Template Experience";
                    RunPageLink = "Staff Template ID"=field("Staff Template ID"),
                                  "Staff Role Code"=field("Staff Role Code");
                }
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Template Qualifications";
                    RunPageLink = "Staff Template ID"=field("Staff Template ID"),
                                  "Staff Role Code"=field("Staff Role Code");
                }
            }
        }
    }
}

#pragma implicitwith restore

