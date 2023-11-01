#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69721 "Interview Invitations"
{
    ApplicationArea = Basic;
    CardPageID = "Interview invitation Card";
    Editable = false;
    PageType = List;
    SourceTable = "Candidate Selection Header";
    SourceTableView = where("Document Type" = filter("Interview Invitation"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control38; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control39; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control40; Links)
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

