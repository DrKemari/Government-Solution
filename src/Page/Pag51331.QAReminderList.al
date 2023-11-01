#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51331 "QA Reminder List"
{
    Caption = 'Reminder List';
    PageType = List;
    SourceTable = "Audit Programme Grading";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Quality Response No."; Rec."Quality Response No.")
                {
                    ApplicationArea = Basic;
                }
                field("Grade Code"; Rec."Grade Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                ApplicationArea = Basic,Suite;
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                ApplicationArea = Basic,Suite;
                Visible = true;
            }
        }
    }

    actions
    {
    }

    var
        ReminderHeader: Record "Reminder Header";


    procedure GetSelectionFilter(): Text
    var
        ReminderHeader: Record "Reminder Header";
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(ReminderHeader);
        exit(SelectionFilterManagement.GetSelectionFilterForIssueReminder(ReminderHeader));
    end;
}

#pragma implicitwith restore

