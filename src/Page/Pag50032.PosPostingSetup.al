#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50032 "Pos Posting Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Pos Posting Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Receipt Category";Rec."Receipt Category")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Category Description";Rec."Receipt Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type";Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bal Account Type";Rec."Bal Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bal Account No.";Rec."Bal Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bal Account Name";Rec."Bal Account Name")
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

