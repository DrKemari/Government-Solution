#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69795 "Phone Interview Questions"
{
    PageType = ListPart;
    SourceTable = "Hr Screening Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Category"; Rec."Question Category")
                {
                    ApplicationArea = Basic;
                }
                field("Question Id"; Rec."Question Id")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                }
                field("Closed-ended Question Sub-Type"; Rec."Closed-ended Question Sub-Type")
                {
                    ApplicationArea = Basic;
                }
                field(Weight; Rec.Weight)
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

