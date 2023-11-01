#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69085 "HR SO Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1904652008; "HR SO Activities")
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
                   // RunObject = Report "New Payslipx";
                    ToolTip = 'Executes the 1 Page Payslip action.';
                }
                action("2 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '2 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                   // RunObject = Report "New 2 page Payslip";
                    ToolTip = 'Executes the 2 Page Payslip action.';
                }
                action("3 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '3 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //RunObject = Report "New 3 page Payslipx";
                    ToolTip = 'Executes the 3 Page Payslip action.';
                }
            }
            separator(Action1000000041)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group(Statutory)
            {
                Caption = 'Statutory';
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
        }
        area(embedding)
        {
            group(Positions)
            {
                Caption = 'Positions';
                action(Action1000000019)
                {
                    ApplicationArea = Basic;
                    Caption = 'Positions';
                    Image = Employee;
                    RunObject = Page "App Welfare  Benefit";
                    ToolTip = 'Executes the Positions action.';
                }
                action("Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vacant Positions';
                    Image = Employee;
                    RunObject = Page "Requests Welfare Benefit";
                    ToolTip = 'Executes the Vacant Positions action.';
                }
                action("Over Staffed Positions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Over Staffed Positions';
                    Image = Employee;
                    RunObject = Page "Request Welfare  Benefit";
                    ToolTip = 'Executes the Over Staffed Positions action.';
                }
            }
            action("Employee List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee List';
                Image = Employee;
                RunObject = Page "Employee List-P";
                ToolTip = 'Executes the Employee List action.';
            }
            group(Leave)
            {
                Caption = 'Leave';
                action("Leave Balances")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Balances';
                    Image = Employee;
                    RunObject = Page "Leave Balances";
                    ToolTip = 'Executes the Leave Balances action.';
                }
                action("Leave Posting Journal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Posting Journal';
                    Image = Employee;
                    RunObject = Page "Leave Posting Journal";
                    ToolTip = 'Executes the Leave Posting Journal action.';
                }
                action("Posted Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Leave Days';
                    Image = Employee;
                    RunObject = Page "Posted Leave Days";
                    ToolTip = 'Executes the Posted Leave Days action.';
                }
            }
            group(Training)
            {
                Caption = 'Training';
                action("Training Needs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Needs';
                    Image = Employee;
                    RunObject = Page "Employee Training Feedback";
                    ToolTip = 'Executes the Training Needs action.';
                }
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Employee;
                RunObject = Page Dimensions;
                ToolTip = 'Executes the Dimensions action.';
            }
        }
        area(sections)
        {
            group("Employee Self Service")
            {
                Caption = 'Employee Self Service';
                Image = HumanResources;
                action("Internal Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Internal Requisitions';
                    Image = ServiceAgreement;
                    RunObject = Page "Internal Requisitions";
                    RunPageView = sorting("Document Type", "No.")
                                  order(ascending);
                    ToolTip = 'Executes the Internal Requisitions action.';
                }
                action("Approved Internal Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Internal Requisitions';
                    Image = ServiceAgreement;
                    RunObject = Page "Approved IR-Released";
                    RunPageView = sorting("Document Type", "No.")
                                  order(ascending);
                    ToolTip = 'Executes the Approved Internal Requisitions action.';
                }
                action("Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Applications';
                    Image = ServiceAgreement;
                    RunObject = Page "Leave Applications";
                    RunPageView = sorting("Document Type", "No.")
                                  order(ascending);
                    ToolTip = 'Executes the Leave Applications action.';
                }
                action("Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Leave Applications';
                    Image = ServiceAgreement;
                    ToolTip = 'Executes the Approved Leave Applications action.';
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
                    RunObject = Page "Approval Entries";
                    ToolTip = 'Executes the Approval Entries action.';
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                Image = Administration;
                action("Human Resources Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Human Resources Setup';
                    Image = AccountingPeriods;
                    RunObject = Page "HR Setup List";
                    ToolTip = 'Executes the Human Resources Setup action.';
                }
                action("Human Res. Units of Measure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Human Res. Units of Measure';
                    Image = AccountingPeriods;
                    RunObject = Page "Human Res. Units of Measure";
                    ToolTip = 'Executes the Human Res. Units of Measure action.';
                }
                action("Registration Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Registration Codes';
                    RunObject = Page "Causes of Absence";
                    ToolTip = 'Executes the Registration Codes action.';
                }
                action("Causes of Inactivity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Causes of Inactivity';
                    Image = Currency;
                    RunObject = Page "Causes of Inactivity";
                    ToolTip = 'Executes the Causes of Inactivity action.';
                }
                action("Grounds for Termination")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grounds for Termination';
                    Image = AccountingPeriods;
                    RunObject = Page "Grounds for Termination";
                    ToolTip = 'Executes the Grounds for Termination action.';
                }
                action(Unions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Unions';
                    RunObject = Page Unions;
                    ToolTip = 'Executes the Unions action.';
                }
                action("Employment Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment Contracts';
                    Image = Currency;
                    RunObject = Page "Employment Contracts";
                    ToolTip = 'Executes the Employment Contracts action.';
                }
                action(Relatives)
                {
                    ApplicationArea = Basic;
                    Caption = 'Relatives';
                    Image = Employee;
                    RunObject = Page Relatives;
                    ToolTip = 'Executes the Relatives action.';
                }
                action("Misc. Articles")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles';
                    RunObject = Page "Misc. Articles";
                    ToolTip = 'Executes the Misc. Articles action.';
                }
                action(Confidential)
                {
                    ApplicationArea = Basic;
                    Caption = 'Confidential';
                    RunObject = Page Confidential;
                    ToolTip = 'Executes the Confidential action.';
                }
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualifications';
                    Image = Currency;
                    RunObject = Page Qualifications;
                    ToolTip = 'Executes the Qualifications action.';
                }
                action("Employee Statistics Groups")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Statistics Groups';
                    Image = Employee;
                    RunObject = Page "Employee Statistics Groups";
                    ToolTip = 'Executes the Employee Statistics Groups action.';
                }
            }
        }
        area(processing)
        {
            group("Data Import")
            {
                Caption = 'Data Import';
                Image = Calculator;
                action("Import Employee Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Employee Details';
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                   // RunObject = XMLport UnknownXMLport69025;
                    ToolTip = 'Executes the Import Employee Details action.';
                }
                action("Import Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Posting Group';
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    //RunObject = XMLport UnknownXMLport69020;
                    ToolTip = 'Executes the Import Posting Group action.';
                }
                action("Import Import Emp Bank Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Import Emp Bank Details';
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    //RunObject = XMLport UnknownXMLport69031;
                    ToolTip = 'Executes the Import Import Emp Bank Details action.';
                }
            }
            group("Payroll Processing")
            {
                Caption = 'Payroll Processing';
                Image = Calculator;
                action("Accrue Annual Leave")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accrue Annual Leave';
                    Image = Calculate;
                    Promoted = true;
                    PromotedIsBig = true;
                   // RunObject = Report "Accrue Leave";
                    ToolTip = 'Executes the Accrue Annual Leave action.';
                }
            }
        }
    }
}

