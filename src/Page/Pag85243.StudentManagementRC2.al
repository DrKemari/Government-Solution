#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Student Management RC2 (ID 85243).
/// </summary>
Page 85243 "Student Management RC2"
{
    Caption = 'Exam Processing', Comment='{Dependency=Match,"ProfileDescription_ARADMINISTRATOR"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1902899408;"Student Management Activities")
                {
                    ApplicationArea = Basic,Suite;
                }
            }
            group(Control1900724708)
            {
                part(Control1907692008;"Examination Accounts")
                {
                    ApplicationArea = Basic,Suite;
                }
                part(Control1;"My Job Queue")
                {
                    ApplicationArea = Basic,Suite;
                    Visible = false;
                }
                systempart(Control1901377608;MyNotes)
                {
                    ApplicationArea = Basic,Suite;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action(Action54)
            {
                ApplicationArea = Suite;
                Image = "Report";
               //unObject = Report "Ongoing Transactions Report";
                Visible = false;
            }
            action("No. of Exam Centers")
            {
                ApplicationArea = Basic;
               // RunObject = Report "No. of Exam Centers";
            }
            action("Booking Per Center Per Level")
            {
                ApplicationArea = Basic;
                Image = "Report";
                //RunObject = Report "Booking Per Center Per Level";
            }
            action("Summary Center Entries ")
            {
                ApplicationArea = Basic;
                Image = "Report";
            //    RunObject = Report "Summary Center Entries";
            }
            action("Booking Per Center Per Level1")
            {
                ApplicationArea = Basic;
                Caption = 'Booking Per Center Per Level';
                Image = "Report";
               // RunObject = Report "Booking Per Center Per Level";
            }
            action("Exam Booking Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
              //  RunObject = Report "Exam Booking Report";
            }
            action(Action55)
            {
                ApplicationArea = Suite;
                Image = "Report";
                //RunObject = Report "Transactions Report";
                Visible = false;
            }
            action("C&ustomer - List")
            {
                ApplicationArea = Suite;
                Caption = 'C&ustomer - List';
                Image = "Report";
                RunObject = Report "Customer - List";
                ToolTip = 'View various information for customers, such as customer posting group, discount group, finance charge and payment information, salesperson, the customer''s default currency and credit limit (in LCY), and the customer''s current balance (in LCY).';
                Visible = false;
            }
            action("Customer - &Balance to Date")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Customer - &Balance to Date';
                Image = "Report";
                RunObject = Report "Customer - Balance to Date";
                ToolTip = 'View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';
                Visible = false;
            }
            action("Aged &Accounts Receivable")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Aged &Accounts Receivable';
                Image = "Report";
                RunObject = Report "Aged Accounts Receivable";
                ToolTip = 'View an overview of when your receivables from customers are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
                Visible = false;
            }
            action("Customer - &Summary Aging Simp.")
            {
                ApplicationArea = Suite;
                Caption = 'Customer - &Summary Aging Simp.';
                Image = "Report";
                RunObject = Report "Customer - Summary Aging Simp.";
                ToolTip = 'View, print, or save a summary of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.';
                Visible = false;
            }
            action("Customer - Trial Balan&ce")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Customer - Trial Balan&ce';
                Image = "Report";
                RunObject = Report "Customer - Trial Balance";
                ToolTip = 'View the beginning and ending balance for customers with entries within a specified period. The report can be used to verify that the balance for a customer posting group is equal to the balance on the corresponding general ledger account on a certain date.';
                Visible = false;
            }
            action("Cus&tomer/Item Sales")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Cus&tomer/Item Sales';
                Image = "Report";
                RunObject = Report "Customer/Item Sales";
                ToolTip = 'View a list of item sales for each customer during a selected time period. The report contains information on quantity, sales amount, profit, and possible discounts. It can be used, for example, to analyze a company''s customer groups.';
                Visible = false;
            }
            separator(Action20)
            {
            }
            action("Customer &Document Nos.")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Customer &Document Nos.';
                Image = "Report";
                RunObject = Report "Customer Document Nos.";
                ToolTip = 'View a list of customer ledger entries, sorted by document type and number. The report includes the document type, document number, posting date and source code of the entry, the name and number of the customer, and so on. A warning appears when there is a gap in the number series or when the documents were not posted in document-number order.';
                Visible = false;
            }
            action("Sales &Invoice Nos.")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Sales &Invoice Nos.';
                Image = "Report";
                RunObject = Report "Sales Invoice Nos.";
                ToolTip = 'View or edit number series for sales invoices.';
                Visible = false;
            }
            action("Sa&les Credit Memo Nos.")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Sa&les Credit Memo Nos.';
                Image = "Report";
                RunObject = Report "Sales Credit Memo Nos.";
                ToolTip = 'View or edit number series for sales credit memos.';
                Visible = false;
            }
            action("Re&minder Nos.")
            {
                ApplicationArea = Suite;
                Caption = 'Re&minder Nos.';
                Image = "Report";
                RunObject = Report "Reminder Nos.";
                ToolTip = 'View or set up number series for reminders.';
                Visible = false;
            }
            action("Finance Cha&rge Memo Nos.")
            {
                ApplicationArea = Suite;
                Caption = 'Finance Cha&rge Memo Nos.';
                Image = "Report";
                RunObject = Report "Finance Charge Memo Nos.";
                ToolTip = 'View or edit number series for finance charge memos.';
                Visible = false;
            }
            separator(Action94)
            {
            }
            action("Ongoing Transactions Report")
            {
                ApplicationArea = Suite;
                Caption = 'Ongoing Transactions Report';
                Image = "Report";
               // RunObject = Report "Ongoing Transactions Report";
                Visible = false;
            }
            action("Processed Transactions Report")
            {
                ApplicationArea = Suite;
                Caption = 'Processed Transactions Report';
                Image = "Report";
               /// RunObject = Report "Transactions Report";
            }
            action("Exam Transactions Report")
            {
                ApplicationArea = Suite;
                Caption = 'Exam Transactions Report';
                Image = "Report";
                //RunObject = Report "Exam Transactions Report";
            }
            action("Exam Booking Reports")
            {
                ApplicationArea = Suite;
                Caption = 'Exam Booking Report';
                Image = "Report";
              //  RunObject = Report "Exam Booking Report";
            }
            action("Transactions Per User")
            {
                ApplicationArea = Suite;
                Caption = 'Transactions Per User';
                Image = "Report";
               // RunObject = Report "User Transactions Report";
            }
            action("Transactions Summary Report")
            {
                ApplicationArea = Suite;
                Caption = 'Transactions Summary Report';
                Image = "Report";
             //   RunObject = Report "Summary Transactions Report";
            }
            action("Summary Per Transaction Type")
            {
                ApplicationArea = Suite;
                Caption = 'Summary Per Transaction Type';
                Image = "Report";
                //RunObject = Report "Summary Transaction Type";
            }
            action("Payment Mode Summary")
            {
                ApplicationArea = Suite;
                Caption = 'Summary Per Payment Mode';
                Image = "Report";
               // RunObject = Report "Payment Mode Summary";
            }
            action("Timetable Planner")
            {
                ApplicationArea = Basic;
                Image = "Report";
              //  RunObject = Report "Timetable Planner";
            }
            action("Registration Entries")
            {
                ApplicationArea = Basic;
                Caption = 'Registration Entries';
                Image = "Report";
                //RunObject = Report "Registration Entries";
            }
            action("Center Candidature Per Paper")
            {
                ApplicationArea = Basic;
                Image = "Report";
              //  RunObject = Report "Exam Envelopes Report";
            }
            action("Exam Booking Per Center Per Level")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
              //  RunObject = Report "Booking Per Center Per Level";
            }
            action("Booking Per Center Per Level Per Paper")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
               // RunObject = Report "Per Stud Per Center Per Level";
            }
            action("Signature Register")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
              //  RunObject = Report "Signature Register";
            }
            action("Request to approve")
            {
                ApplicationArea = Basic;
                RunObject = Page "Requests to Approve";
            }
            action("Attendance Register")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
               // RunObject = Report "Signature RegisterV3";
            }
            action("Stationery Computation Packing")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
              //  RunObject = Report "Stationery Computation Packing";
            }
        }
        area(creation)
        {
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
        area(embedding)
        {
            action(Students)
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Students';
                Image = Customer;
                RunObject = Page Students;
                ToolTip = 'View or edit detailed information for the students that you trade with. From each Student card, you can open related information, such as Examination Accounts statistics and Balances, and you can define specific attirbutes of the students';
            }
            action("Examination Accounts")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Examination Accounts';
                Image = Balance;
                RunObject = Page "Examination Accounts";
                ToolTip = 'List of examination Accounts for the students';
            }
            action("Training Institutions")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Training Institutions';
                Image = Balance;
                RunObject = Page "Training Institutions";
                ToolTip = 'List of Training Institutions';
            }
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
                RunObject = Page "New Student Applications";
                ToolTip = 'Allows Processing of New student applications to the systems';
            }
            action(" Existing Student Applications")
            {
                ApplicationArea = Basic,Suite;
                Caption = ' Existing Student Applications';
                Image = Invoice;
                RunObject = Page "Existing Student Applications";
                ToolTip = 'Allow the Registration of Existing students for new examination';
            }
            action("Institution Applications")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Institution Applications';
                Image = ReturnOrder;
                RunObject = Page "Institution Applications";
                ToolTip = 'Allow the registration of institution student Applications';
            }
            action("Student Exemptions")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Student Exemptions';
                Image = BankAccount;
                RunObject = Page "Student Exemptions";
                ToolTip = 'Allow the student Exemptions bookings';
            }
            action("Student Examination Booking")
            {
                ApplicationArea = Suite;
                Caption = 'Student Examination Bookings';
                Image = Reminder;
                RunObject = Page "Student Examination Bookings";
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
            action("Student Withdrawal Applications")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Student Withdrawal Applications';
                Image = Item;
                RunObject = Page "Student Withdrawal Vouchers";
                ToolTip = 'Allows student to withdraw from an Active sittings';
            }
            action("Student Deferment")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Student Deferment Applications';
                RunObject = Page "Student Deferment Vouchers";
                ToolTip = 'Allows student to defer from an examination';
            }
            action("Renewal Applications")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Renewal Applications';
                Image = Journals;
                RunObject = Page "Renewal Applications";
                ToolTip = 'Allows Renewal of Applications';
            }
            action("Re-Activation Application")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Re-Activation Applications';
                Image = Journal;
                RunObject = Page "Re-Activation Applications";
                ToolTip = 'Re-Activation Applications';
            }
            action("Miscellaneous Applications")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Miscellaneous Applications';
                RunObject = Page "Miscellaneous Applications";
                ToolTip = 'Miscellaneous Applications';
            }
            action("Standard Receipts")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Standard Receipts';
                RunObject = Page "Receipts List";
            }
            action("Student Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Student Accounts';
                RunObject = Page "Student Accounts";
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Processed Student Applications")
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Processed Student Applications';
                    Image = PostedShipment;
                    RunObject = Page "Proessed Student Applications";
                    ToolTip = 'Proessed Student Applications';
                }
                action("Processed Institution Student Applications")
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Processed Institution Student Applications';
                    Image = PostedOrder;
                    RunObject = Page "PostBulk Student Applications";
                    ToolTip = 'Processed Institution Student Applications';
                }
                action("Processed Examination Bookings")
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Processed Examination Bookings';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Processed Exam Bookings";
                    ToolTip = 'Processed Examination Bookings';
                }
                action("Posted Institution Examination Bookings")
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Posted Institution Examination Bookings';
                    Image = PostedOrder;
                    RunObject = Page "Posted Bulk Exam Bookings";
                    ToolTip = 'Posted Institution Examination Bookings';
                }
                action("Posted Student Exemptions")
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Posted Student Exemptions';
                    RunObject = Page "Posted Student Exemptions";
                    ToolTip = 'Posted Student Exemptions';
                }
                action("Posted Deferment Vouchers")
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Posted Deferment Vouchers';
                    RunObject = Page "Posted Deferment Vouchers";
                    ToolTip = 'Posted Deferment Vouchers';
                }
                action("Posted Miscellaneous Receipts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Miscellaneous Receipts';
                    RunObject = Page "Posted Miscellaneous Receipts";
                }
                action("Student Receipts Details")
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Student Receipts Details';
                    RunObject = Page "Processed Student Details";
                    ToolTip = 'Student Receipts';
                }
                action("Posted Renewal Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Renewal Applications';
                    RunObject = Page "Posted Renewal Applications";
                }
            }
        }
        area(processing)
        {
            separator(Action64)
            {
                Caption = 'New';
                IsHeader = true;
            }
            action("New Student Application")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'New Student Application';
                Image = Customer;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "New Student Application";
                RunPageMode = Create;
                ToolTip = 'Create a new Student Application.';
            }
            action("Existing Student Application")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Existing Student Application';
                Image = Customer;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Existing Student Application";
                RunPageMode = Create;
                ToolTip = 'Create a new Existing Student Application.';
            }
            action(PaymentRegistration)
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Customer Receipts';
                Image = Payment;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page Receipt;
                ToolTip = 'Process your Customer Receipts';
            }
            group("&Transactions")
            {
                Caption = '&Transactions';
                Image = Sales;
                action(Action48)
                {
                    ApplicationArea = Suite;
                    Caption = 'Portal Student Registration Awaiting Approval';
                    Image = "Order";
                    RunObject = Page "Portal Student Applications";
                    ToolTip = 'Portal Student Registration Awaiting Approval';
                }
                action(Action47)
                {
                    ApplicationArea = Suite;
                    Caption = 'New Student Applications';
                    Image = "Order";
                    RunObject = Page "New Student Application";
                    ToolTip = 'Allows Processing of New student applications to the systems';
                }
                action("Student Examination Bookings")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Student Examination Bookings";
                }
                action("Institution Examination Bookin ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Institution Examination Booking';
                    RunObject = Page "Institution Examination Bookin";
                }
                action("Exam Marksheet Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Exam Marksheet Vouchers";
                }
                action("Student Remarking Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Student Remarking Vouchers";
                }
                action(Action46)
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
                action(Action45)
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Institution Applications';
                    Image = ReturnOrder;
                    RunObject = Page "Institution Application";
                    ToolTip = 'Allow the registration of institution student Applications';
                }
                action(Action44)
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Student Exemptions';
                    Image = BankAccount;
                    RunObject = Page "Student Exemption";
                    ToolTip = 'Allow the student Exemptions bookings';
                }
                action(Action43)
                {
                    ApplicationArea = Suite;
                    Caption = 'Student Examination Bookings';
                    Image = Reminder;
                    RunObject = Page "Student Booking Header";
                    ToolTip = 'Voucher Used for Student Examination Bookings';
                }
                action(Action42)
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
                    RunObject = Page "Center Re-Allocation Vouchers";
                }
                action("Timetable Planners")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Timetable Planners";
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
            group("&Import")
            {
                Caption = '&Import';
                Image = Import;
                action("Import Equity Imports")
                {
                    ApplicationArea = Service;
                    Caption = 'Import Equity Imports';
                    Image = Import;
                    RunObject = XMLport "EQUITY IMPORT";
                    ToolTip = 'Import Equity Imports';
                }
                action("Import NATIONAL BANK Statements")
                {
                    ApplicationArea = Service;
                    Caption = 'Import NATIONAL BANK Statements';
                    Image = Import;
                    RunObject = XMLport "NATIONAL BANK IMPORT";
                    ToolTip = 'Import NATIONAL BANK Statements';
                }
                action("Import  CO-OP BANK")
                {
                    ApplicationArea = Service;
                    Caption = 'Import  CO-OP BANK';
                    Image = Import;
                    RunObject = XMLport "CO-OP BANK IMPORT";
                    ToolTip = 'Import the International Repair Coding System to define resolution codes for service items.';
                }
                action("Import  KCB BANK ")
                {
                    ApplicationArea = Service;
                    Caption = 'Import  KCB BANK ';
                    Image = Import;
                    RunObject = XMLport "KCB BANK IMPORT";
                    ToolTip = 'Import the International Repair Coding System to define resolution codes for service items.';
                }
            }
        }
    }
}

