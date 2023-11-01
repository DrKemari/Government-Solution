#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95020 "Risk Category Trigger"
{
    PageType = Card;
    SourceTable = "Risk Category Trigger";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Risk Category ID"; Rec."Risk Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Trigger ID"; Rec."Trigger ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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

