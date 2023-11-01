#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85445 "Setters Evaluations"
{
    ApplicationArea = Basic;
    CardPageID = "Setters Evaluation Card";
    PageType = List;
    SourceTable = "Setters Evaluation Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Moderator No"; Rec."Moderator No")
                {
                    ApplicationArea = Basic;
                }
                field("Moderator Name"; Rec."Moderator Name")
                {
                    ApplicationArea = Basic;
                }
                field("Moderator Email"; Rec."Moderator Email")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension Dim 1 Code"; Rec."Global Dimension Dim 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension  Dim 2 Code"; Rec."Global Dimension  Dim 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Exam Sitting"; Rec."Exam Sitting")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
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

