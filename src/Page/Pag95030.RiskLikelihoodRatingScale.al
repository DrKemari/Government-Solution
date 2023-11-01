#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95030 "Risk Likelihood Rating Scale"
{
    PageType = Card;
    SourceTable = "Risk Rating Scale";
    SourceTableView = where("Risk Rating Scale Type" = filter("Likelihood Rating"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control9; "Risk Likeli Rating Scale Lines")
            {
                Caption = 'Likelihood Rating Codes';
                SubPageLink = "Risk Rating Scale Type" = field("Risk Rating Scale Type"),
                              "Rating Scale ID" = field("Rating Scale ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Rating Scale ID", Rec."Rating Scale ID");
                    Report.Run(95001, true, true, Rec);
                end;
            }
            action("Risk Management Plans")
            {
                ApplicationArea = Basic;
                Image = Planning;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "StrategicRisk Management Plans";
                RunPageLink = "Risk Likelihood Rate Scale ID" = field("Rating Scale ID"),
                              Blocked = filter(false);
            }
        }
    }
}

#pragma implicitwith restore

