#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85428 "Setting & Moderation Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Setting Moderation Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group("No. Series")
            {
                field("Setter Specification Nos."; Rec."Setter Specification Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Setter Claim Nos."; Rec."Setter Claim Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Setter Disclosure Nos."; Rec."Setter Disclosure Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Moderator Specification Nos."; Rec."Moderator Specification Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Chief Examiner Comment Nos."; Rec."Chief Examiner Comment Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("CEO Comment Nos."; Rec."CEO Comment Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Reviewer Comment Nos."; Rec."Reviewer Comment Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Setters Evaluation Nos"; Rec."Setters Evaluation Nos")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

