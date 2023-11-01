#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85431 "Chief Examiner Comments"
{
    ApplicationArea = Basic;
    CardPageID = "Chief Examiner Comment Card";
    Editable = false;
    PageType = List;
    SourceTable = "Examination Review Voucher";
    SourceTableView = where("Document Type" = const("Chief Examiner"));
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
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Sitting field.';
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Code field.';
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Name field.';
                }
                field("Moderator No."; Rec."Moderator No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Moderator No. field.';
                }
                field("Moderator Name"; Rec."Moderator Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Moderator Name field.';
                }
                field("No. of Topics Examined"; Rec."No. of Topics Examined")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Topics Examined field.';
                }
                field("No. of Topics in Syllabus"; Rec."No. of Topics in Syllabus")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Topics in Syllabus field.';
                }
                field("% of Syllabus Examined"; Rec."% of Syllabus Examined")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the % of Syllabus Examined field.';
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

