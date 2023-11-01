#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69044 "Payroll Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";

    layout
    {
        area(content)
        {
            cuegroup(Employees)
            {
                Caption = 'Employees';
                field("Active Employees"; Rec."Active Employees")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Employee List-HR";
                    ToolTip = 'Specifies the value of the Active Employees field.';
                }
                field("Inactive Employees"; Rec."Inactive Employees")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Employee List-HR";
                    ToolTip = 'Specifies the value of the Inactive Employees field.';
                }
                field("Suspended Employees"; Rec."Suspended Employees")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Suspended Employees field.';
                }
                field("Seconded Employees"; Rec."Seconded Employees")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Seconded Employees field.';
                }
                field("Terminated Employees"; Rec."Terminated Employees")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Employee List-HR";
                    ToolTip = 'Specifies the value of the Terminated Employees field.';
                }
                field("Retired Employees"; Rec."Retired Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retired Employees field.';
                }
                field("Disciplinary Employees"; Rec."Disciplinary Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Employees field.';
                }

                actions
                {
                    action("New Employee")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Employee';
                        RunObject = Page "Closed Welfare Benefits";
                        RunPageMode = Create;
                        ToolTip = 'Executes the New Employee action.';
                    }
                }
            }
            cuegroup("Documents Approvals")
            {
                Caption = 'Documents Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies the value of the Requests to Approve-Overdue field.';
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approval Entries";
                    ToolTip = 'Specifies the value of the Requests Sent for Approval field.';
                }
                field("Unprocessed Staff Claims"; Rec."Unprocessed Staff Claims")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approved Staff Claims";
                    ToolTip = 'Specifies the value of the Unprocessed Staff Claims field.';
                }
                field("Posted Approved Leave"; Rec."Posted Approved Leave")
                {
                    ApplicationArea = Basic;
                    //    DrillDownPageID = "Posted Leave Applications";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted Approved Leave field.';
                }
            }
            cuegroup("Approved Document")
            {
                field("Imprest Memo-Approved"; Rec."Imprest Memo-Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Memo-Approved field.';
                }
                field("Imprest Surender-Approved"; Rec."Imprest Surender-Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surender-Approved field.';
                }
                field("Approved Leave"; Rec."Approved Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Leave field.';
                }
                field("Leave Application-Approved"; Rec."Leave Application-Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Application-Approved field.';
                }
                field("Approved Warrant Vouchers"; Rec."Approved Warrant Vouchers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Warrant Vouchers field.';
                }
                field("Approved Payment Vouchers"; Rec."Approved Payment Vouchers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Payment Vouchers field.';
                }
                field("Approved Staff Claims"; Rec."Approved Staff Claims")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approved Staff Claims";
                    ToolTip = 'Specifies the value of the Approved Staff Claims field.';
                }
            }
            cuegroup("Salary Vouchers Processing")
            {
                Caption = 'Salary Vouchers Processing';
                field("Salary Vouchers"; Rec."Salary Vouchers")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Payroll Processing List";
                    ToolTip = 'Specifies the value of the Salary Vouchers field.';
                }
                field("Approved Salary Vouchers"; Rec."Approved Salary Vouchers")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Payroll Processing List";
                    ToolTip = 'Specifies the value of the Approved Salary Vouchers field.';
                }
                field(Visitors; Rec.Visitors)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Visitor Pass List";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Visitors field.';
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

        Rec.SetFilter("Date Filter", '>=%1', WorkDate);
        Rec.SetFilter("User ID Filter", '=%1', UserId);
    end;
}

#pragma implicitwith restore

