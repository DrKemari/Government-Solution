#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
/// <summary>
/// Page Training Evaluation Lines (ID 69226).
/// </summary>
Page 69226 "Training Evaluation Lines"
{
    PageType = ListPart;
    SourceTable = "Training Evaluation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluation Area"; Rec."Evaluation Area")
                {
                    ApplicationArea = Basic;
                }
                field(Rating; Rec.Rating)
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

