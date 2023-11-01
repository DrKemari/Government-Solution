page 51279 "Syllabus Review Role Center"
{
    Caption = 'Syllabus Review Role Center', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control76; "Headline RC Accountant")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control99; "Finance Performance")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control1902304208; "Accountant Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control123; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control1907692008; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control103; "Trailing Sales Orders Chart")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control106; "My Job Queue")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control9; "Help And Chart Wrapper")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control100; "Cash Flow Forecast Chart")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control108; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
            // part(PowerBIEmbeddedReportPart; "Power BI Embedded Report Part")
            // {
            //     ApplicationArea = Basic, Suite;
            // }
            part(Control122; "Power BI Report Spinner Part")
            {
                ApplicationArea = Basic, Suite;
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced by PowerBIEmbeddedReportPart';
                Visible = false;
                ObsoleteTag = '21.0';
            }
            // part(Control1901377608; MyNotes)
            // {
            //     ApplicationArea = Basic, Suite;
            // }
        }
    }
    actions
    {
        area(reporting)
        {



        }

        area(sections)
        {
            //added by Morris//Funds Management
            group("Syllabus Review Role Center ")
            {
                Caption = 'Syllabus Review Role Center';
                ToolTip = 'Syllabus Review Role Center ';

                action("Syllabus Register")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Syllabus Register';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Syllabus Headers";
                }
                action("Syllabus Development Plans")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Syllabus Development Plans';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Syllabus Development Plans";
                }
                action("Syllabus Development Projects")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Syllabus Development Projects';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Syllabus Development Projects";
                }
                action("Syllabus Rules And Regulations")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Syllabus Rules And Regulations';
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sy Rules And Regulations";
                }
                action("Syllabus Review Sources")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Syllabus Review Sources';
                    Image = BankAccountStatement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Syllabus Review Sources";
                    ToolTip = '.';
                }
                action("Syllabus Review Tasks")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Syllabus Review Tasks';
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Syllabus Review Tasks";
                    ToolTip = 'Syllabus Review Tasks';
                }
                action("Syllabus Sections")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Syllabus Sections';
                    Image = DepositSlip;
                    RunObject = Page "Syllabus Sections";
                }
                action("Stakeholder Types")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Stakeholder Types';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Stakeholder Types";
                }
                action("New Syllabus Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'New Syllabus Applications';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "New Syllabus Applications";
                }
                action("Syllabus Review Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Syllabus Review Applications';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Syllabus Review Applications";
                }
                action("Resource Allocation Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Resource Allocation Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "TaskForce Allocation List";
                }
                action("Syllabus Review Views")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Syllabus Review Views';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Syllabus Review Views";
                }
                action("Consecutive Review Views")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Consecutive Review Views';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Consecutive Review Views";
                }
                action("Draft Syllabus List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Draft Syllabus List';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Draft Syllabus Headers";
                }
                action("Stakeholders Review Feedback")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Stakeholders Review Feedback';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Draft Syllabuses";
                }
                action("Commitee Appointment List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Commitee Appointment List';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Commitee Appointment List";
                }
                action("External Appointment List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'External Appointment List';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "External Appointment List";
                }
                action("Awaiting Technical Sub-Commitee")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Awaiting Technical Sub-Commitee';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Technical Sub-Commitee Apps";
                }
                action("Examination Technical SubCommitee Feedback")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination Technical SubCommitee Feedback';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "ETS Approval Feedbacks";
                }

                //...........................................................................................................

                action("Awaiting Technical Committee")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Awaiting Technical Committee';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Exam Com Approval Applications";
                }
                action("Examination Committee Feedback")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination Committee Feedback';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "EC Approval Feedbacks";
                }
                action("Board Committee Feedback")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board Committee Feedback';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Exam Comm Approval Feedbacks";
                }
                action("TaskForce Templates")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'TaskForce Templates';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "TaskForce Templates";
                }
                // action("Exam Marksheet Vouchers Awaiting Confirmation")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Exam Marksheet Vouchers Awaiting Confirmation';
                //     Image = BankAccountRec;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Exam Marksheet Vouchers-Cs";
                // }
                action("Completed Syllabus Reviews")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Completed Syllabus Reviews';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Completed Syllabus Reviews";
                }
                action("Completed Syllabu Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Completed Syllabu Applications';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Completed Syllabu Applications";
                }
                action("Curriculum Status Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Curriculum Status Report';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Report "Curriculum Status Report";
                }

            }
            //End Added By Morris//Funds Management

        }
    }
}
