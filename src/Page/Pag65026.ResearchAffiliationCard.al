#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65026 "Research Affiliation Card"
{
    PageType = Card;
    SourceTable = "Research Output Affiliations";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Research Output ID"; Rec."Research Output ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contact ID"; Rec."Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Affiliation Details"; Rec."Affiliation Details")
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

