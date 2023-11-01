#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85230 "Student Management Activities"
{
    Caption = 'Student Management Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Finance Cue";

    layout
    {
        area(content)
        {
            cuegroup(Registrations)
            {
                Caption = 'Registrations';
                field("Registration Pending Approval"; Rec."Registration Pending Approval")
                {
                    ApplicationArea = Basic;
                }
                field("Rejected Registrations"; Rec."Rejected Registrations")
                {
                    ApplicationArea = Basic;
                }
                field("Processed Registrations"; Rec."Processed Registrations")
                {
                    ApplicationArea = Basic;
                }

                actions
                {
                    action("Edit Cash Receipt Journal")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Edit Cash Receipt Journal';
                        RunObject = Page "Cash Receipt Journal";
                        ToolTip = 'Register received payments in a cash receipt journal that may already contain journal lines.';
                    }
                    action("New Sales Credit Memo")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Sales Credit Memo';
                        RunObject = Page "Sales Credit Memo";
                        RunPageMode = Create;
                        ToolTip = 'Process a return or refund by creating a new sales credit memo.';
                    }
                }
            }
            cuegroup(Exemptions)
            {
                Caption = 'Exemptions';
                field("Exemption Pending Approval"; Rec."Exemption Pending Approval")
                {
                    ApplicationArea = Basic;
                }
                field("Rejected Exemptions"; Rec."Rejected Exemptions")
                {
                    ApplicationArea = Basic;
                }
                field("Processed Exemptions"; Rec."Processed Exemptions")
                {
                    ApplicationArea = Basic;
                }
            }
            cuegroup("My User Tasks")
            {
                Caption = 'My User Tasks';
                field("UserTaskManagement.GetMyPendingUserTasksCount"; UserTaskManagement.GetMyPendingUserTasksCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pending User Tasks';
                    Image = Checklist;
                    ToolTip = 'Specifies the number of pending tasks that are assigned to you or to a group that you are a member of.';

                    trigger OnDrillDown()
                    var
                        UserTaskList: Page "User Task List";
                    begin
                        UserTaskList.SetPageToShowMyPendingUserTasks;
                        UserTaskList.Run;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    // trigger OnOpenPage()
    // begin
    //     Reset;
    //     if not Get then begin
    //       Init;
    //       Insert;
    //     end;

    //     SetFilter("Overdue Date Filter",'<%1',WorkDate);
    //     SetFilter("User ID Filter",UserId);
    // end;

    var
        UserTaskManagement: Codeunit "User Task Management";
}

#pragma implicitwith restore

