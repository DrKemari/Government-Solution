#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95026 "Risk Response Strategy"
{
    PageType = Card;
    SourceTable = "Risk Response Strategy";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Strategy ID"; Rec."Strategy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Type"; Rec."Risk Impact Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments"; Rec."Additional Comments")
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

