#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69688 "Salary Scales"
{
    PageType = Card;
    SourceTable = "Salary Scales";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Scale; Rec.Scale)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Authority"; Rec."Appointment Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Valid Positions"; Rec."Valid Positions")
                {
                    ApplicationArea = Basic;
                }
                field("Active Employees"; Rec."Active Employees")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control16; "Job Grade Pointers")
            {
                SubPageLink = "Salary Scale" = field(Scale);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Default Benefits Plan")
            {
                ApplicationArea = Basic;
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Benefit Plan Line";
                RunPageLink = "Plan ID" = field(Scale);
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;

                trigger OnAction()
                begin
                    Rec.SetRange(Scale, Rec.Scale);
                    Report.Run(69615, true, false, Rec);
                end;
            }
        }
    }
}

#pragma implicitwith restore

