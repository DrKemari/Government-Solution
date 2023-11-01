#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69043 "Payroll Admin Role Center"
{
    Caption = 'Payroll Administrator';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1000000004; "Payroll Activities")
                {
                    ApplicationArea = Basic;
                }
                systempart(Control1901420308; Outlook)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control1900724708)
            {
                part(Control21; "My Job Queue")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                systempart(Control1901377608; MyNotes)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            separator(Action1000000008)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group("Approval  Details")
            {
                action("Rejected  Invoice Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rejected  Invoices Report';
                    Image = "Report";
                    RunObject = Report "Rejected Purchase Invoices";
                    ToolTip = 'Executes the Rejected  Invoices Report action.';
                }
            }
            group(Payslip)
            {
                Caption = 'Payslip';
                action("1 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '1 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //  RunObject = Report "1 Page Payslip";
                    ToolTip = 'Executes the 1 Page Payslip action.';
                }
                action("2 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '2 Page Payslip';
                    Image = "Report";
                    // RunObject = Report "New Payslip";
                    ToolTip = 'Executes the 2 Page Payslip action.';
                }
                action("Send DIR PDF Payslips")
                {
                    ApplicationArea = Basic;
                    Image = Email;
                    //  RunObject = Report "Send DIR PDF Payslips";
                    ToolTip = 'Executes the Send DIR PDF Payslips action.';
                }
                action("Directors Master Roll")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    RunObject = Report "Dir-Master Roll Report";
                    ToolTip = 'Executes the Directors Master Roll action.';
                }
                action("Transfer Director Allowances1 ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer Director Allowances';
                    Image = "Report";
                    RunObject = Report "Transfer Director Allowances1";
                    ToolTip = 'Executes the Transfer Director Allowances action.';
                }
            }
            separator(Action1000000041)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group("Management Reports")
            {
                Caption = 'Management Reports';
                action("Master Roll Excel Export")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll Excel Export';
                    Image = Excel;
                    //RunObject = Report "Master Roll Excel Export";
                    ToolTip = 'Executes the Master Roll Excel Export action.';
                }
                action("Employee Master Roll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Master Roll';
                    Image = "Report";
                    // RunObject = Report "Employee Master Roll";
                    ToolTip = 'Executes the Employee Master Roll action.';
                }
                action("Detailed E/D Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Detailed E/D Report';
                    Image = "Report";
                    //RunObject = Report "Master reporterx";
                    ToolTip = 'Executes the Detailed E/D Report action.';
                }
                action("Loans Detailed Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loans Detailed Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Loans Detailed Report1";
                    ToolTip = 'Executes the Loans Detailed Report action.';
                }
                action("Loan Balances")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loan Balances';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Loan Balances";
                    ToolTip = 'Executes the Loan Balances action.';
                }
                action("Employee Payroll Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Payroll Analysis';
                    Image = "Report";
                    RunObject = Report "Payroll Cost Analysis";
                    ToolTip = 'Executes the Employee Payroll Analysis action.';
                }
                action("Employee Pay Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Pay Details';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Employee Pay Details";
                    ToolTip = 'Executes the Employee Pay Details action.';
                }
            }
            group(Statutory)
            {
                Caption = 'Statutory';
                group("NHIF,NSSF,P9")
                {
                    Image = LotInfo;
                    action(NHIF)
                    {
                        ApplicationArea = Basic;
                        Caption = 'NHIF';
                        Image = "Report";
                        Promoted = false;
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = false;
                        // RunObject = Report NHIF;
                        ToolTip = 'Executes the NHIF action.';
                    }
                    action(NSSF)
                    {
                        ApplicationArea = Basic;
                        Caption = 'NSSF';
                        Image = "Report";
                        Promoted = false;
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = false;
                        // RunObject = Report "NSSF Reporting";
                        ToolTip = 'Executes the NSSF action.';
                    }
                    action(P9A)
                    {
                        ApplicationArea = Basic;
                        Caption = 'P9A';
                        Image = "Report";
                        Promoted = false;
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = false;
                        // RunObject = Report "P9A Report";
                        ToolTip = 'Executes the P9A action.';
                    }
                }
                group("I-TAX Reports")
                {
                    Image = Administration;
                    action("Monthly PAYE Export")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Monthly PAYE Export';
                        Image = "Report";
                        Promoted = false;
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = false;
                        // RunObject = Report "Monthly PAYE Export";
                        ToolTip = 'Executes the Monthly PAYE Export action.';
                    }
                    action("Board Online Itax Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Board Online Itax Report';
                        Image = "Report";
                        RunObject = Report "Board Online Itax Report";
                        ToolTip = 'Executes the Board Online Itax Report action.';
                    }
                    action("Report PWD Online Itax Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'PWD Online Itax Report';
                        Image = "Report";
                        RunObject = Report "PWD Online Itax Report1";
                        ToolTip = 'Executes the PWD Online Itax Report action.';
                    }
                    action("Employee Online Itax Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Employee Online Itax Report';
                        Image = "Report";
                        RunObject = Report "Employee Online Itax Report";
                        ToolTip = 'Executes the Employee Online Itax Report action.';
                    }
                }
            }
            group("Payroll Reconcilliation")
            {
                Caption = 'Payroll Reconcilliation';
                action("Zero Earnings Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Earnings Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Earnings Report";
                    ToolTip = 'Executes the Zero Earnings Report action.';
                }
                action("Zero Deductions Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Deductions Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Deductions Report";
                    ToolTip = 'Executes the Zero Deductions Report action.';
                }
                action("New Employees")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Employees';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "New Employees";
                    ToolTip = 'Executes the New Employees action.';
                }
                action("Employees Removed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees Removed';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employees Removed";
                    ToolTip = 'Executes the Employees Removed action.';
                }
                action("Deductions Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Deductions Analysis';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Employee Master Deductions";
                    ToolTip = 'Executes the Deductions Analysis action.';
                }
                action("Earnings Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Earnings Analysis';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //  RunObject = Report "Employee Master Earnings";
                    ToolTip = 'Executes the Earnings Analysis action.';
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //  RunObject = Report "Employee Master Roll";
                    ToolTip = 'Executes the Master Roll action.';
                }
                action("Payroll Reconciliation Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Summary';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Summary";
                    ToolTip = 'Executes the Payroll Reconciliation Summary action.';
                }
                action("Payroll Reconciliation Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Details';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Earnin";
                    ToolTip = 'Executes the Payroll Reconciliation Details action.';
                }
            }
            group(" Examinations Management")
            {
                Caption = ' Examinations Management';
                action("Transactions Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transactions Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Transactions Report";
                    ToolTip = 'Executes the Transactions Report action.';
                }
                action("Ongoing Transactions Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ongoing Transactions Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Ongoing Transactions Report";
                    ToolTip = 'Executes the Ongoing Transactions Report action.';
                }
                action("Summary Center Entries1 ")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    RunObject = Report "Summary Center Entries";
                    ToolTip = 'Executes the Summary Center Entries1  action.';
                }
                action("Exam Booking Report1")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    RunObject = Report "Exam Booking Report";
                    ToolTip = 'Executes the Exam Booking Report1 action.';
                }
                action("<Report Exam Transac Report1")
                {
                    ApplicationArea = Suite;
                    Caption = 'Exam Transactions Report';
                    Image = "Report";
                    RunObject = Report "Exam Transactions Report";
                    ToolTip = 'Executes the Exam Transactions Report action.';
                }
                action("<Report Exam Booking Rep1>")
                {
                    ApplicationArea = Suite;
                    Caption = 'Exam Booking Report';
                    Image = "Report";
                    RunObject = Report "Exam Booking Report";
                    ToolTip = 'Executes the Exam Booking Report action.';
                }
                action("Timetable Planner1")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    RunObject = Report "Timetable Planner";
                    ToolTip = 'Executes the Timetable Planner1 action.';
                }
                action("<Report Registration Entries1>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Registration Entries';
                    Image = "Report";
                    RunObject = Report "Registration Entries";
                    ToolTip = 'Executes the Registration Entries action.';
                }
                action("Center Candidature Per Paper1")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    RunObject = Report "Exam Envelopes Report";
                    ToolTip = 'Executes the Center Candidature Per Paper1 action.';
                }
                action("Exam Booking Pnter Per Level1")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Report "Booking Per Center Per Level";
                    ToolTip = 'Executes the Exam Booking Pnter Per Level1 action.';
                }
                action("Signature Register1")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Report "Signature Register";
                    ToolTip = 'Executes the Signature Register1 action.';
                }
                action("Request to approve")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Requests to Approve";
                    ToolTip = 'Executes the Request to approve action.';
                }
                action("Attendance Register1")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Report "Signature RegisterV3";
                    ToolTip = 'Executes the Attendance Register1 action.';
                }
                action("Stationery Computation Packing")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Report "Stationery Computation Packing";
                    ToolTip = 'Executes the Stationery Computation Packing action.';
                }
            }
            group("EXAMINATION REPORTS")
            {
                Caption = 'EXAMINATION REPORTS';
                group("TRANSACTION REPORTS")
                {
                    Image = Reconcile;
                    action("Statistical Summary Per User")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Statistics Per User Report";
                        ToolTip = 'Executes the Statistical Summary Per User action.';
                    }
                    action("Processed Transactions Report")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Processed Transactions Report';
                        Image = "Report";
                        RunObject = Report "Transactions Report";
                        ToolTip = 'Executes the Processed Transactions Report action.';
                    }
                    action("Exam Transactions Report")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Exam Transactions Report';
                        Image = "Report";
                        RunObject = Report "Exam Transactions Report";
                        ToolTip = 'Executes the Exam Transactions Report action.';
                    }
                    action("Transactions Summary Report")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Transactions Summary Report';
                        Image = "Report";
                        RunObject = Report "Summary Transactions Report";
                        ToolTip = 'Executes the Transactions Summary Report action.';
                    }
                    action("Summary Per Transaction Type")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Summary Per Transaction Type';
                        Image = "Report";
                        RunObject = Report "Summary Transaction Type";
                        ToolTip = 'Executes the Summary Per Transaction Type action.';
                    }
                    action("Transactions Per User")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Transactions Per User';
                        Image = "Report";
                        RunObject = Report "User Transactions Report";
                        ToolTip = 'Executes the Transactions Per User action.';
                    }
                }
                group("ENTRIES REPORTS")
                {
                    Image = ExecuteBatch;
                    action("Exam Booking Report")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Exam Booking Report';
                        Image = "Report";
                        RunObject = Report "Exam Booking Report";
                        ToolTip = 'Executes the Exam Booking Report action.';
                    }
                    action("Registration Entries")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Registration Entries';
                        Image = "Report";
                        RunObject = Report "Registration Entries";
                        ToolTip = 'Executes the Registration Entries action.';
                    }
                    action("Payment Mode Summary")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Summary Per Payment Mode';
                        Image = "Report";
                        RunObject = Report "Payment Mode Summary";
                        ToolTip = 'Executes the Summary Per Payment Mode action.';
                    }
                    action("Booking Per Center Per Level")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Booking Per Center Per Level";
                        ToolTip = 'Executes the Booking Per Center Per Level action.';
                    }
                    action("Summary Center Entries ")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Summary Center Entries";
                        ToolTip = 'Executes the Summary Center Entries  action.';
                    }
                    action("Booking Per Center Per Level1")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Booking Per Center Per Level';
                        Image = "Report";
                        RunObject = Report "Booking Per Center Per Level";
                        ToolTip = 'Executes the Booking Per Center Per Level action.';
                    }
                    // action("Exam Booking Report")
                    // {
                    //     ApplicationArea = Basic;
                    //     Image = "Report";
                    //     RunObject = Report "Exam Booking Report";
                    //     ToolTip = 'Executes the Exam Booking Report action.';
                    // }
                }
                group("FINANCIAL REPORTS")
                {
                    Image = Ledger;
                    action("Booking Revenue Per Examination")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Booking Revenue Per Examination';
                        Image = "Report";
                        RunObject = Report "Booking Revenue Per Exam";
                        ToolTip = 'Executes the Booking Revenue Per Examination action.';
                    }
                    action("Processed Revenue Summary")
                    {
                        ApplicationArea = Basic;
                        RunObject = Report "Processed Revenue Summary";
                        ToolTip = 'Executes the Processed Revenue Summary action.';
                    }
                    action("Posted Receipts Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posted Receipts Report';
                        Image = "Report";
                        RunObject = Report "Posted Receipt Report";
                        ToolTip = 'Executes the Posted Receipts Report action.';
                    }
                    action("Miscellaneous Transaction Summ")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Miscellaneous Transaction Summary';
                        RunObject = Report "Miscellaneous Transaction Summ";
                        ToolTip = 'Executes the Miscellaneous Transaction Summary action.';
                    }
                    action("Unaplied MPESA Amounts Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Unaplied MPESA Amount Report';
                        Image = "Report";
                        RunObject = Report "MPESAUnutilized Amounts Report";
                        ToolTip = 'Executes the Unaplied MPESA Amount Report action.';
                    }
                    action("Unaplied Bank Amounts Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Unaplied Bank Amounts Report';
                        Image = "Report";
                        RunObject = Report "Bank Unutilized Amounts Report";
                        ToolTip = 'Executes the Unaplied Bank Amounts Report action.';
                    }
                }
            }
        }
        area(embedding)
        {
            action("Employee List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee List';
                Image = Employee;
                RunObject = Page "Employee List-P";
                ToolTip = 'Executes the Employee List action.';
            }
            action("Pay Periods")
            {
                ApplicationArea = Basic;
                Caption = 'Pay Periods';
                Image = Employee;
                RunObject = Page "Pay Periods";
                ToolTip = 'Executes the Pay Periods action.';
            }
            action(Earnings)
            {
                ApplicationArea = Basic;
                Caption = 'Earnings';
                Image = Employee;
                RunObject = Page Earnings;
                ToolTip = 'Executes the Earnings action.';
            }
            action(Deductions)
            {
                ApplicationArea = Basic;
                Caption = 'Deductions';
                Image = Employee;
                RunObject = Page Deductions;
                ToolTip = 'Executes the Deductions action.';
            }
            action("Salary Processing")
            {
                ApplicationArea = Basic;
                Caption = 'Salary Processing';
                Image = Loaners;
                RunObject = Page "Payroll Processing List";
                ToolTip = 'Executes the Salary Processing action.';
            }
            action("Approved Salary Vouchers")
            {
                ApplicationArea = Basic;
                RunObject = Page "Approved Salary Vouchers";
                ToolTip = 'Executes the Approved Salary Vouchers action.';
            }
            action("Brackets Table")
            {
                ApplicationArea = Basic;
                Caption = 'Brackets Table';
                Image = Employee;
                RunObject = Page "Brackets Table";
                ToolTip = 'Executes the Brackets Table action.';
            }
            action(Loans)
            {
                ApplicationArea = Basic;
                Caption = 'Loans';
                Image = Loaners;
                RunObject = Page Loans;
                ToolTip = 'Executes the Loans action.';
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Employee;
                RunObject = Page Dimensions;
                ToolTip = 'Executes the Dimensions action.';
            }
            action("Employee Posting Group")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Posting Group';
                Image = Employee;
                RunObject = Page "Employee Posting Group";
                ToolTip = 'Executes the Employee Posting Group action.';
            }
            action("Employee PGroups")
            {
                ApplicationArea = Basic;
                Caption = 'Employee PGroups';
                RunObject = Page "Employee PGroups";
                ToolTip = 'Executes the Employee PGroups action.';
            }
            action("Employee Bank List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Bank List';
                Image = Employee;
                RunObject = Page "Employee Bank List";
                ToolTip = 'Executes the Employee Bank List action.';
            }
            action("Loans Products")
            {
                ApplicationArea = Basic;
                Caption = 'Loans Products';
                Image = Loaners;
                RunObject = Page "Loan Products";
                ToolTip = 'Executes the Loans Products action.';
            }
            action(GeneralJournals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'General Journals';
                Image = Journal;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(General),
                                    Recurring = const(false));
                ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
            }
        }
        area(sections)
        {
            group("Salary Advance")
            {
                action("Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Salary Advance List";
                    ToolTip = 'Executes the Salary Advance List action.';
                }
                action("Approved Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Salary Advance List";
                    ToolTip = 'Executes the Approved Salary Advance List action.';
                }
                action("Posted  Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted  Salary Advance List";
                    ToolTip = 'Executes the Posted  Salary Advance List action.';
                }
            }
            group("Car Loan")
            {
                action("Car Loan List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Car Loan List";
                    ToolTip = 'Executes the Car Loan List action.';
                }
                action("Approved Car Loans")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Car Loans";
                    ToolTip = 'Executes the Approved Car Loans action.';
                }
                action("Posted Car Loans")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Car Loans";
                    ToolTip = 'Executes the Posted Car Loans action.';
                }
            }
            group("Management Approvals")
            {
                Caption = 'Management Approvals';
                Image = Confirm;
                action("Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    Image = ServiceAgreement;
                    RunObject = Page "Requests to Approve";
                    ToolTip = 'Executes the Approval Entries action.';
                }
            }
            group("Payroll Setups")
            {
                Caption = 'Payroll Setups';
            }
        }
        area(processing)
        {
            group("Data Import")
            {
                Caption = 'Data Import';
                Image = Calculator;
                action("Earnings Import")
                {
                    ApplicationArea = Basic;
                    Caption = 'Earnings Import';
                    Image = Import;
                    RunObject = XMLport "Earnings Import";
                    ToolTip = 'Executes the Earnings Import action.';
                }
                action("Deductions Import")
                {
                    ApplicationArea = Basic;
                    Caption = 'Deductions Import';
                    Image = Import;
                    RunObject = XMLport "Ded Import";
                    ToolTip = 'Executes the Deductions Import action.';
                }
                action("Bank Import Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Import Entries';
                    Image = AdjustVATExemption;
                    RunObject = Page "Bank Import Entries";
                    RunPageMode = View;
                    ToolTip = 'Executes the Bank Import Entries action.';
                }
            }
            group("Payroll Processing")
            {
                Caption = 'Payroll Processing';
                Image = Calculator;
                action("Current Earnings/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Earnings/Deductions';
                    Image = CashReceiptJournal;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Current Earnings/Deductions";
                    ToolTip = 'Executes the Current Earnings/Deductions action.';
                }
                action("Run Payroll Run")
                {
                    ApplicationArea = Basic;
                    Caption = 'Run Payroll Run';
                    Image = Calculate;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Payroll Run";
                    ToolTip = 'Executes the Run Payroll Run action.';
                }
                action("Process Loan Interest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process Loan Interest';
                    Image = Suggest;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Process Loan Interest";
                    ToolTip = 'Executes the Process Loan Interest action.';
                }
                action("Assign Default Earnings/Ded")
                {
                    ApplicationArea = Basic;
                    Image = Allocate;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Assign Default Earning/Deducti";
                    ToolTip = 'Executes the Assign Default Earnings/Ded action.';
                }
                action("Closed Earnings/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Earnings/Deductions';
                    Image = CashReceiptJournal;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Closed Earnings/Deductions";
                    ToolTip = 'Executes the Closed Earnings/Deductions action.';
                }
            }
            group("Data Export")
            {
                Caption = 'Data Export';
                Image = Calculator;
                action(EFT)
                {
                    ApplicationArea = Basic;
                    Caption = 'EFT';
                    Image = Export;
                    //RunObject = Report "EFT/SFI-Admin";
                    ToolTip = 'Executes the EFT action.';
                }
                action("Send PDF Payslips")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send PDF Payslips';
                    Image = Export;
                    //RunObject = Report "Send PDF Payslips";
                    ToolTip = 'Executes the Send PDF Payslips action.';
                }
                action("Approval Entry Report")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Approval Entry Report";
                    ToolTip = 'Executes the Approval Entry Report action.';
                }
                action("Vendor Statement")
                {
                    ApplicationArea = Basic;
                    // RunObject = Report "Vendor Statement";
                    ToolTip = 'Executes the Vendor Statement action.';
                }
            }
            group(Examination)
            {
                Caption = 'Examination';
                action("Portal Student Registration Awaiting Approval")
                {
                    ApplicationArea = Suite;
                    Caption = 'Portal Student Registration Awaiting Approval';
                    Image = "Order";
                    RunObject = Page "Portal Student Applications";
                    ToolTip = 'Portal Student Registration Awaiting Approval';
                }
                action("New Student Applications")
                {
                    ApplicationArea = Suite;
                    Caption = 'New Student Applications';
                    Image = "Order";
                    RunObject = Page "New Student Application";
                    ToolTip = 'Allows Processing of New student applications to the systems';
                }
                action(" Existing Student Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = ' Existing Student Applications';
                    Image = Invoice;
                    RunObject = Page "Existing Student Application";
                    ToolTip = 'Allow the Registration of Existing students for new examination';
                }
                action("Rejected Student Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rejected Student Applications';
                    RunObject = Page "Rejected Student Applications";
                    ToolTip = 'Executes the Rejected Student Applications action.';
                }
                action("Student Exemptions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Student Exemptions';
                    Image = BankAccount;
                    RunObject = Page "Student Exemption";
                    ToolTip = 'Allow the student Exemptions bookings';
                }
                action("Student Examination Bookings")
                {
                    ApplicationArea = Suite;
                    Caption = 'Student Examination Bookings';
                    Image = Reminder;
                    RunObject = Page "Student Booking Header";
                    ToolTip = 'Voucher Used for Student Examination Bookings';
                }
                action("Institution Examination Booking")
                {
                    ApplicationArea = Suite;
                    Caption = 'Institution Examination Booking';
                    Image = FinChargeMemo;
                    RunObject = Page "Institution Examination Bookin";
                    ToolTip = 'Allow booking of Examination for institutions';
                }
                action("Student Withdrawal Voucher")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Student Withdrawal Voucher';
                    Image = Document;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Student Withdrawal Voucher";
                    RunPageMode = Create;
                    ToolTip = 'Student Withdrawal Voucher';
                }
                action("Student Deferment Voucher")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Student Deferment Voucher';
                    Image = NewSalesInvoice;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Student Deferment Voucher";
                    RunPageMode = Create;
                    ToolTip = 'Student Deferment Voucher';
                }
                action("Student Renewal Header")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Student Renewal Header';
                    Image = CreditMemo;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Student Renewal Header";
                    RunPageMode = Create;
                    ToolTip = 'Student Renewal Header';
                }
                action("Exam centers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Examination Centres";
                    ToolTip = 'Executes the Exam centers action.';
                }
                action("Examination sitting cycle")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Examination Sitting Cycle";
                    ToolTip = 'Executes the Examination sitting cycle action.';
                }
                action("Center Re-Allocation Vouchers")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Center Re-Allocation Vouchers";
                    ToolTip = 'Executes the Center Re-Allocation Vouchers action.';
                }
                action("Timetable Planners")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Timetable Planners";
                    ToolTip = 'Executes the Timetable Planners action.';
                }
                action("Re-Activation Applications")
                {
                    ApplicationArea = Suite;
                    Caption = 'Re-Activation Applications';
                    Image = FinChargeMemo;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Re-Activation Applications";
                    RunPageMode = Create;
                    ToolTip = 'Re-Activation Applications';
                }
                action("DIR P9 Report")
                {
                    ApplicationArea = Basic;
                    //   RunObject = Report "DIR P9 Report";
                    ToolTip = 'Executes the DIR P9 Report action.';
                }
                group("Director PayRoll")
                {
                    Caption = 'Director PayRoll';
                    group("Director Pay Roll Reports")
                    {
                        Caption = 'Director Pay Roll Reports';
                        action("EFT/SFI-DIR")
                        {
                            ApplicationArea = Basic;
                            //  RunObject = Report "EFT/SFI-DIR";
                            ToolTip = 'Executes the EFT/SFI-DIR action.';
                        }
                        action("Dir-Master Roll Report")
                        {
                            ApplicationArea = Basic;
                            RunObject = Report "Dir-Master Roll Report";
                            ToolTip = 'Executes the Dir-Master Roll Report action.';
                        }
                    }
                }
            }
        }
    }
}

