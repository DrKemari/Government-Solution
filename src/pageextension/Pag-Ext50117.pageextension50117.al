#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50117 "pageextension50117" extends "Accounting Manager Role Center" 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "Currencies(Action 38)".

        addafter("CA P/L Statement with Budget")
        {
            action("Pending Imprests Surrender")
            {
                ApplicationArea = Basic;
             //   RunObject = Report "Pending Imprests Surrender";
            }
        }
        addafter("Cost Accounting Analysis")
        {
            group("EXAMINATION REPORTS")
            {
                Caption = 'EXAMINATION REPORTS';
                group("TRANSACTION REPORTS")
                {
                    Image = Reconcile;
                    action("Processed Transactions Report")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Processed Transactions Report';
                        Image = "Report";
                        //RunObject = Report "Transactions Report";
                    }
                    action("Exam Transactions Report")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Exam Transactions Report';
                        Image = "Report";
                      //  RunObject = Report "Exam Transactions Report";
                    }
                    action("Transactions Summary Report")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Transactions Summary Report';
                        Image = "Report";
                       // RunObject = Report "Summary Transactions Report";
                    }
                    action("Page Import Worksheet")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Import Bank Details';
                        RunObject = Page "Import Worksheet";
                    }
                    action("XMLPort MPESA TRANSACTION IMPORT")
                    {
                        ApplicationArea = Basic;
                        Caption = 'MPESA TRANSACTION IMPORT';
                        Promoted = false;
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = false;
                        RunObject = XMLport "MPESA TRANSACTION IMPORT";
                    }
                    action("Summary Per Transaction Type")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Summary Per Transaction Type';
                        Image = "Report";
                       // RunObject = Report "Summary Transaction Type";
                    }
                    action("Transactions Per User")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Transactions Per User';
                        Image = "Report";
                       // RunObject = Report "User Transactions Report";
                    }
                }
                group("ENTRIES REPORTS")
                {
                    Image = ExecuteBatch;
                    // action("Exam Booking Report")
                    // {
                    //     ApplicationArea = Suite;
                    //     Caption = 'Exam Booking Report';
                    //     Image = "Report";
                    //     RunObject = Report "Exam Booking Report";
                    // }
                    action("Registration Entries")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Registration Entries';
                        Image = "Report";
                        //RunObject = Report "Registration Entries";
                    }
                    action("Payment Mode Summary")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Summary Per Payment Mode';
                        Image = "Report";
                      //  RunObject = Report "Payment Mode Summary";
                    }
                    action("Booking Per Center Per Level")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                       // RunObject = Report "Booking Per Center Per Level";
                    }
                    action("Summary Center Entries ")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        //RunObject = Report "Summary Center Entries";
                    }
                    action("Booking Per Center Per Level1")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Booking Per Center Per Level';
                        Image = "Report";
                       // RunObject = Report "Booking Per Center Per Level";
                    }
                    action("Registration Reconciliation")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "Registration Reconciliation";
                    }
                    // action("Exam Booking Report")
                    // {
                    //     ApplicationArea = Basic;
                    //     Image = "Report";
                    //     RunObject = Report "Exam Booking Report";
                    // }
                    action("Import Bank Details")
                    {
                        ApplicationArea = Basic,Suite;
                        Caption = 'Import Bank Details';
                        Image = ImportExcel;
                        Promoted = false;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Import Worksheet";
                        RunPageMode = Edit;
                        ToolTip = 'Importation of Bank Details';
                    }
                }
                group("FINANCIAL REPORTS")
                {
                    Image = Ledger;
                    action("Bank receipts Vs Revenue Summary")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "Bank Daily Report";
                        Visible = true;
                    }
                    action("MPESA Vs Revenue Summary")
                    {
                        ApplicationArea = Basic;
                      //  RunObject = Report "Bank Daily Report-3";
                    }
                    action("Processed Revenue Summary")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "Processed Revenue Summary";
                        Visible = false;
                    }
                    action("New Revenue Summary")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "Summary Transaction Types";
                    }
                    action("Posted Summ Receipt Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posted Summ Receipt Report';
                       // RunObject = Report "Posted Summ Receipt Report";
                    }
                    action("Posted Receipts Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posted Receipts Report';
                        Image = "Report";
                      //  RunObject = Report "Posted Receipt Report";
                    }
                    action("Miscellaneous Transaction Summ")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Miscellaneous Transaction Summary';
                        //RunObject = Report "Miscellaneous Transaction Summ";
                    }
                    action("Bank Import Utilization Report")
                    {
                        ApplicationArea = Basic;
                        Image = Certificate;
                        //RunObject = Report "Bank Import Utilization Report";
                    }
                    action("Bank Import")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "Summ. Bank Utilization Report";
                    }
                    action("Unaplied MPESA Amounts Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Unaplied MPESA Amount Report';
                        Image = "Report";
                        //RunObject = Report "MPESAUnutilized Amounts Report";
                        Visible = false;
                    }
                    action("Unaplied Bank Amounts Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Unaplied Bank Amounts Report';
                        Image = "Report";
                       // RunObject = Report "Bank Unutilized Amounts Report";
                    }
                    action("Duplicate Invoices")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "Duplicate Invoices";
                    }
                    action("Duplicate Receipts")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "Duplicate Receipts";
                    }
                    action("Unaplied Mpesa Amount Report")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "Unaplied Amount Report";
                    }
                    action("Unutilized Mpesa Amounts")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "MPESAUnutilized Amounts Report";
                    }
                    action("Customer - Summary Aging")
                    {
                        ApplicationArea = Basic;
                        RunObject = Report "Customer - Summary Aging";
                    }
                }
            }
        }
        addafter(VendorsBalance)
        {
            action("Vendors List")
            {
                ApplicationArea = Basic;
                RunObject = Page "Vendor List";
            }
            action("Bank Reconciliations")
            {
                ApplicationArea = Basic;
                Caption = 'Bank Reconciliations';
                RunObject = Page "Bank Acc. Reconciliation List";
            }
        }
        addafter(CustomersBalance)
        {
            action(Employees)
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Employees';
                Image = Customer;
                RunObject = Page "Employee List";
            }
        }
        addafter(Reminders)
        {
            // action(Currencies)
            // {
            //     ApplicationArea = Basic,Suite;
            //     Caption = 'Currencies';
            //     RunObject = Page Currencies;
            // }
            action("Posted Staff Claims")
            {
                ApplicationArea = Suite;
                Caption = 'Posted Staff Claims';
                Image = FinChargeMemo;
                RunObject = Page "Posted Staff Claims";
            }
            action("Processed Staff Claims")
            {
                ApplicationArea = Suite;
                Caption = 'Processed Staff Claims';
                Image = FinChargeMemo;
                RunObject = Page "Processed Staff Claims";
            }
        }
        addafter("Incoming Documents")
        {
            action(Jobs)
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Jobs';
                Image = "Order";
                RunObject = Page "Job List";
            }
            action("Bank Import Entries")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Bank Import Entries';
                Image = "Order";
                RunObject = Page "Bank Import Entries";
            }
        }
        addafter(Journals)
        {
            group("Salary Advance")
            {
                action("Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Salary Advance List";
                }
                action("Approved Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Salary Advance List";
                }
                action("Posted  Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted  Salary Advance List";
                }
            }
            group("Car Loan")
            {
                action("Car Loan List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Car Loan List";
                }
                action("Approved Car Loans")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Car Loans";
                }
                action("Posted Car Loans")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Car Loans";
                }
            }
        }
        addafter("Bank Account Posting Groups")
        {
            action(" Receipts and Payment Types")
            {
                ApplicationArea = Basic,Suite;
                Caption = ' Receipts and Payment Types';
                RunObject = Page "Receipts and Payment Types";
                ToolTip = 'Set up posting groups, so that payments in and out of each bank account are posted to the specified general ledger account.';
            }
        }
        addfirst(Creation)
        {
            action("MPESA TRANSACTION IMPORT")
            {
                ApplicationArea = Service;
                Caption = 'MPESA TRANSACTION IMPORT';
                Image = Import;
                RunObject = XMLport "MPESA TRANSACTION IMPORT";
            }
        }
        addafter("Calculate Deprec&iation")
        {
            action("Posted Bank Transfer")
            {
                ApplicationArea = Basic;
                RunObject = Page "Posted Bank Transfers";
            }
        }
        addafter("Navi&gate")
        {
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
                action("Draft Portal Student Registrations")
                {
                    ApplicationArea = Suite;
                    Caption = 'Draft Portal Student Registrations';
                    Image = "Order";
                    RunObject = Page "Draft Portal Applications";
                    ToolTip = 'Draft Portal Student Registrations';
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
                    ApplicationArea = Basic,Suite;
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
                }
                action("Student Exemptions")
                {
                    ApplicationArea = Basic,Suite;
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
                    ApplicationArea = Basic,Suite;
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
                    ApplicationArea = Basic,Suite;
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
                    ApplicationArea = Basic,Suite;
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
                }
                action("Examination sitting cycle")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Examination Sitting Cycle";
                }
                action("Center Re-Allocation Vouchers")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Center Re-Allocation Vouchers";
                }
                action("Timetable Planners")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Timetable Planners";
                }
                action("Mpesa Entries")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "MPESA Entries";
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
            }
        }
    }
}

