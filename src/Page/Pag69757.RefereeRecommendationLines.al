#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69757 "Referee Recommendation Lines"
{
    Caption = 'Referee Recommendation Lines';
    PageType = ListPart;
    SourceTable = "Referee Recommendation Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reference Category"; Rec."Reference Category")
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

