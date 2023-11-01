#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69305 "Training Goal Setup"
{
    PageType = List;
    SourceTable = "Training Goals Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Plan ID"; Rec."Training Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of training objectives"; Rec."No. of training objectives")
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

