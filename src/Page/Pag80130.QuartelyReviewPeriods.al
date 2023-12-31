#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80130 "Quartely Review Periods"
{
    PageType = List;
    SourceTable = "Review Quarterly Periods";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Review Period Code"; Rec."Review Period Code")
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
                field("Reporting Start Date"; Rec."Reporting Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reporting End Date"; Rec."Reporting End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Current Year?"; Rec."Current Year?")
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

