page 51278 "Exam Processing Role Center"
{
    Caption = 'Exam Processing Role Center', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
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
            group("Examination Processing ")
            {
                Caption = 'Examination Processing ';
                ToolTip = 'Examination Processing  ';

                action("Marking Center Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Marking Center Vouchers';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Marking Center Vouchers";
                }
                action("Examiners List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examiners List';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Examiners List";
                }
                // action("Examination  Markers")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Examination  Markers';
                //     Image = BankAccount;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Examination  Markers";
                // }
                // action("Examination  Team Leaders")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Receipts';
                //     Image = BankAccount;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Examination  Team Leaders";
                // }
                // action("Examination  Checkers")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Receipts';
                //     Image = BankAccount;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Examination  Checkers";
                // }
                action("Examination Prize Donors")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination Prize Donors';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Examination Donors";
                }
                action("Marking Centres")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Marking Centres';
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Marking Centres";
                }
                action("Script Receipt Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Script Receipt Vouchers';
                    Image = BankAccountStatement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Script Receipt Vouchers";
                    ToolTip = '.';
                }
                action("Scripts Dispatch List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Scripts Dispatch List';
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Scripts Dispatch List";
                    ToolTip = 'Scripts Dispatch List';
                }
                action("Marker Conflict of Interest")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Marker Conflict of Interest';
                    Image = DepositSlip;
                    RunObject = Page "Marker Conflict of Interest";
                }
                // action("Markers Dummy Score Sheets")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Markers Dummy Score Sheets';
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Dummy Score Sheets List";
                // }
                action("Script Sampling Vouchers List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Script Sampling Vouchers List';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Script Sampling Vouchers List";
                }
                // action("Staff Attendance List")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Staff Attendance List';
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Staff Attendance List";
                // }
                action("Marker Attendance List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Marker Attendance List ';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Marker Attendance List";
                }
                action("Script Re-Allocation Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Script Re-Allocation Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Script Re-Allocation Vouchers";
                }
                action("Checker Attendance Register")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Checker Attendance Register';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Checker Attendance List";
                }
                action("Checkers Work Ticket List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Checkers Work Ticket List';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Checkers Work Ticket List";
                }
                action("Checkers Comparing Work Ticket")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Checkers Comparing Work Ticket';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Checkers Work Ticket List";
                }
                action("Checker Evaluation Form")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Checker Evaluation Form';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Checker Evaluation Form";
                }
                action("Checkers Claim Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Checkers Claim Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Checkers Claim Vouchers";
                }
                action("Marking Progress Forms")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Marking Progress Forms';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Marking Progress Forms";
                }
                action("Daily Marking Tally Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Daily Marking Tally Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Daily Marking Tally Vouchers";
                }
                action("Internal Appointment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Internal Appointment Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Int Exam Appointment Vouchers";
                }
                action("Markers Claim Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Markers Claim Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Markers Claim Vouchers";
                }

                //...........................................................................................................

                action("Student Disciplinary Cases")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Student Disciplinary Cases';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Student Disciplinary Cases1";
                }
                action("Approved Markers Claim Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Markers Claim Vouchers ';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Approved Marker Claim Vouchers";
                }
                action("External Appointment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'External Appointment Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Exam Appointment Vouchers";
                }
                action("Exam Marksheet Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Exam Marksheet Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Exam Marksheet Vouchers";
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
                action("Exam Results Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Exam Results Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Exam Results Vouchers";
                }
                action("Student Confirmation Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Student Confirmation Applications';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Confirmation Applications";
                }
                action("Institution Confirmation Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Institution Confirmation Applications';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Inst Confirmation Applications";
                }
                action("Exam Prize Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Exam Prize Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Exam Prize Vouchers";
                }
                action("Student Remarking Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Student Remarking Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Student Remarking Vouchers";
                }
                action("Certificate Collection Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Certificate Collection Vouchers';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Certificate Collect Vouchers";
                }
                // action("Collected Examination Certificates")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Collected Examination Certificates';
                //     Image = BankAccountRec;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Examination Certificate Collec";
                // }

                // action("Examination Certificates Not yet Collected")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Examination Certificates Not yet Collected';
                //     Image = BankAccountRec;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     RunObject = Page "Examination Certificate NtColl";
                // }
                action("Approved Scripts Dispatch List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Scripts Dispatch List';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Approved Scripts Dispatch List";
                }
                action("Certificate Entry")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Certificate Entry';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Certificate Entry";
                }
                action("Team Leader Reports")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Team Leader Reports';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Team Leader Reports";
                }
            }
            //End Added By Morris//Funds Management

        }
    }
}
