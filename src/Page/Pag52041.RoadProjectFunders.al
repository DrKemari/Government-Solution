#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 52041 "Road Project Funders"
{
    PageType = List;
    SourceTable = "Road Project Funders";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Project"; Rec."Road Project")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Name"; Rec."Funding Source Name")
                {
                    ApplicationArea = Basic;
                }
                field("Funded Amount(LCY)"; Rec."Funded Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Funded Percentage"; Rec."Funded Percentage")
                {
                    ApplicationArea = Basic;
                }
                field(Section; Rec.Section)
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

