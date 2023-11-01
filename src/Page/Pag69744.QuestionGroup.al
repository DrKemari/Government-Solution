#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69744 "Question Group"
{
    PageType = List;
    SourceTable = "Hr Screening Qn Group";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Questions"; Rec."No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight"; Rec."Total Weight")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Template Line")
            {
                ApplicationArea = Basic;
                RunObject = Page "Application Submission Line";
                RunPageLink = "Line No."=field("Entry No.");
            }
        }
    }
}

#pragma implicitwith restore

