#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65134 "Grant Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Grants Cue";

    layout
    {
        area(content)
        {
            cuegroup("Actual Amounts(LCY)")
            {
                Caption = 'Actual Amounts(LCY)';
                field("Anouncement Amount(LCY)"; Rec."Anouncement Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Announcements';
                    ToolTip = 'Specifies the value of the Funding Announcements field.';
                }
                field("Successfull Proposals(LCY)"; Rec."Successfull Proposals(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Successfull Proposals(LCY) field.';
                }
                field("UnSuccessful Proposals(LCY)"; Rec."UnSuccessful Proposals(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UnSuccessful Proposals(LCY) field.';
                }
            }
            cuegroup("Funding Announcements")
            {
                Caption = 'Funding Announcements';
                field("Funding Accouncement-Open"; Rec."Funding Accouncement-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Open Funding Announcements';
                    ToolTip = 'Specifies the value of the Open Funding Announcements field.';
                }
                field("Funding Accouncement-Closed"; Rec."Funding Accouncement-Closed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Funding Announcements';
                    ToolTip = 'Specifies the value of the Closed Funding Announcements field.';
                }
            }
            cuegroup("Grant Proposals")
            {
                Caption = 'Grant Proposals';
                field("Grant Proposal-Approved"; Rec."Grant Proposal-Approved")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Grant Proposals';
                    ToolTip = 'Specifies the value of the Approved Grant Proposals field.';
                }
                field("Grant Proposal-InProgress"; Rec."Grant Proposal-InProgress")
                {
                    ApplicationArea = Basic;
                    Caption = 'InProgress Grant Proposals';
                    ToolTip = 'Specifies the value of the InProgress Grant Proposals field.';
                }
                field("Grant Proposal-Succesful"; Rec."Grant Proposal-Succesful")
                {
                    ApplicationArea = Basic;
                    Caption = 'successful Grant Proposals';
                    ToolTip = 'Specifies the value of the successful Grant Proposals field.';
                }
                field("Grant Proposal-NotSuccesful"; Rec."Grant Proposal-NotSuccesful")
                {
                    ApplicationArea = Basic;
                    Caption = 'UnSuccessful Grant Proposals';
                    ToolTip = 'Specifies the value of the UnSuccessful Grant Proposals field.';
                }

                actions
                {
                    action("New Research Proposals")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Research Proposals';
                        Image = Document;
                        RunObject = Page "My Research Proposals";
                        RunPageMode = Create;
                        ToolTip = 'Executes the New Research Proposals action.';
                    }
                }
            }
            cuegroup(Projects)
            {
                Caption = 'Projects';
                field("Project-Ongoing"; Rec."Project-Ongoing")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ongoing Projects';
                    ToolTip = 'Specifies the value of the Ongoing Projects field.';
                }
                field("Project Closed"; Rec."Project Closed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Projects';
                    ToolTip = 'Specifies the value of the Closed Projects field.';
                }
            }
            cuegroup(Payments)
            {
                field("Banked Imprest requisition"; Rec."Banked Imprest requisition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Banked Imprest requisition field.';
                }
            }
            cuegroup(Approvals)
            {
                Caption = 'Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies the number of approval requests that require your approval.';
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

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        //SetRespCenterFilter;
        Rec.SetRange("Date Filter", 0D, WorkDate);
        Rec.SetFilter("User ID Filter", '=%1', UserId);
    end;

    var
        UserTaskManagement: Codeunit "User Task Management";
}

#pragma implicitwith restore

