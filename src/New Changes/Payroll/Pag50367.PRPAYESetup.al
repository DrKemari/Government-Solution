page 50208 "PR PAYE Setup"
{

    ApplicationArea = All;
    Caption = 'PR PAYE Setup';
    PageType = List;
    SourceTable = "PR PAYE";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Tier Code"; Rec."Tier Code")
                {
                    ApplicationArea = All;
                }
                field("PAYE Tier"; Rec."PAYE Tier")
                {
                    ApplicationArea = All;
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = All;
                }
                field("Tax Code"; Rec."Tax Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
