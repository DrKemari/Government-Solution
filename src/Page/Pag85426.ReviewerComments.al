#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85426 "Reviewer Comments"
{
    ApplicationArea = Basic;
    CardPageID = "Reviewer Comment Card";
    Editable = false;
    PageType = List;
    SourceTable = "Examination Review Voucher";
    SourceTableView = where("Document Type" = const(Reviewer));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field("Moderator No."; Rec."Moderator No.")
                {
                    ApplicationArea = Basic;
                }
                field("Moderator Name"; Rec."Moderator Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Topics Examined"; Rec."No. of Topics Examined")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Topics in Syllabus"; Rec."No. of Topics in Syllabus")
                {
                    ApplicationArea = Basic;
                }
                field("% of Syllabus Examined"; Rec."% of Syllabus Examined")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; Links)
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

