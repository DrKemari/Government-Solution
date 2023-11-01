#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85229 "Student Management RC"
{
    Caption = 'Exam Admin', Comment = '{Dependency=Match,"ProfileDescription_ARADMINISTRATOR"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1902899408; "Student Management Activities")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group(Control1900724708)
            {
                part(Control1907692008; "Examination Accounts")
                {
                    ApplicationArea = Basic, Suite;
                }
                part(Control1; "My Job Queue")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                systempart(Control1901377608; MyNotes)
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            group("BOOKING REPORTS")
            {
                // action("Booking Per Center Per Level")
                // {
                //     ApplicationArea = Basic;
                //     Image = "Report";
                //     RunObject = Report "Booking Per Center Per Level";
                // }
                // action("Summary Center Entries ")
                // {
                //     ApplicationArea = Basic;
                //     Image = "Report";
                //     RunObject = Report "Summary Center Entries";
                // }
                // action("Booking Per Center Per Level1")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Booking Per Center Per Level';
                //     Image = "Report";
                //     RunObject = Report "Booking Per Center Per Level";
                // }
                // action("Exam Booking Report")
                // {
                //     ApplicationArea = Basic;
                //     Image = "Report";
                //     RunObject = Report "Exam Booking Report";
                // }
                // action(Action55)
                // {
                //     ApplicationArea = Suite;
                //     Image = "Report";
                //     RunObject = Report "Transactions Report";
                //     Visible = false;
                // }
                action("Customer - Summary Aging")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Customer - Summary Aging";
                }
                // action("Duplicate Invoices")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Report "Duplicate Invoices";
                // }
            }
            group("RECEIVABLE REPORTS")
            {
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
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer - &Balance to Date';
                    Image = "Report";
                    RunObject = Report "Customer - Balance to Date";
                    ToolTip = 'View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';
                    Visible = false;
                }
                action("Aged &Accounts Receivable")
                {
                    ApplicationArea = Basic, Suite;
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
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer - Trial Balan&ce';
                    Image = "Report";
                    RunObject = Report "Customer - Trial Balance";
                    ToolTip = 'View the beginning and ending balance for customers with entries within a specified period. The report can be used to verify that the balance for a customer posting group is equal to the balance on the corresponding general ledger account on a certain date.';
                    Visible = false;
                }
                action("Cus&tomer/Item Sales")
                {
                    ApplicationArea = Basic, Suite;
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
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer &Document Nos.';
                    Image = "Report";
                    RunObject = Report "Customer Document Nos.";
                    ToolTip = 'View a list of customer ledger entries, sorted by document type and number. The report includes the document type, document number, posting date and source code of the entry, the name and number of the customer, and so on. A warning appears when there is a gap in the number series or when the documents were not posted in document-number order.';
                    Visible = false;
                }
                action("Sales &Invoice Nos.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales &Invoice Nos.';
                    Image = "Report";
                    RunObject = Report "Sales Invoice Nos.";
                    ToolTip = 'View or edit number series for sales invoices.';
                    Visible = false;
                }
                action("Sa&les Credit Memo Nos.")
                {
                    ApplicationArea = Basic, Suite;
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
                separator(Action61)
                {
                }
            }
            group("TRANSACTION REPORTS")
            {
                // action("Ongoing Transactions Report")
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Ongoing Transactions Report';
                //     Image = "Report";
                //     RunObject = Report "Ongoing Transactions Report";
                //     Visible = false;
                // }
                // action("Processed Transactions Report")
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Processed Transactions Report';
                //     Image = "Report";
                //     RunObject = Report "Transactions Report";
                // }
                // action("Exam Transactions Report")
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Exam Transactions Report';
                //     Image = "Report";
                //     RunObject = Report "Exam Transactions Report";
                // }
                // action("Transactions Per User")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Transactions Per User';
                //     Image = "Report";
                //     RunObject = Report "User Transactions Report";
                // }
                // action("Transactions Summary Report")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Transactions Summary Report';
                //     Image = "Report";
                //     RunObject = Report "Summary Transactions Report";
                // }
                // action("Unutilized Mpesa Amounts Report")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Report "MPESAUnutilized Amounts Report";
                // }
                // action("Summary Per Transaction Type")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Summary Per Transaction Type';
                //     Image = "Report";
                //     RunObject = Report "Summary Transaction Type";
                // }
            }
            group("OTHER REPORTS")
            {
            }
            // action("Payment Mode Summary")
            // {
            //     ApplicationArea = Suite;
            //     Caption = 'Summary Per Payment Mode';
            //     Image = "Report";
            //     RunObject = Report "Payment Mode Summary";
            // }
            // action("Center Booking Summary")
            // {
            //     ApplicationArea = Suite;
            //     Caption = 'Center Booking Summary';
            //     Image = "Report";
            //     RunObject = Report "Summary Center Entries";
            // }
            // action("Timetable Planner")
            // {
            //     ApplicationArea = Basic;
            //     Image = "Report";
            //     RunObject = Report "Timetable Planner";
            // }
            // action("Registration Entries")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Registration Entries';
            //     Image = "Report";
            //     RunObject = Report "Registration Entries";
            // }
            // action("Center Candidature Per Paper")
            // {
            //     ApplicationArea = Basic;
            //     Image = "Report";
            //     RunObject = Report "Exam Envelopes Report";
            // }
            // action("Exam Booking Per Center Per Level")
            // {
            //     ApplicationArea = Basic;
            //     Image = "Report";
            //     Promoted = true;
            //     PromotedCategory = "Report";
            //     PromotedIsBig = true;
            //     RunObject = Report "Booking Per Center Per Level";
            // }
            // action("Booking Per Center Per Level Per Paper")
            // {
            //     ApplicationArea = Basic;
            //     Image = "Report";
            //     Promoted = true;
            //     PromotedCategory = "Report";
            //     PromotedIsBig = true;
            //     RunObject = Report "Per Stud Per Center Per Level";
            // }
            // action("Total Booking Entries Per Level")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Total Booking Entries Per Level';
            //     Image = "Report";
            //     Promoted = true;
            //     PromotedCategory = "Report";
            //     PromotedIsBig = true;
            //     RunObject = Report "Det. Booking Entries Per Level";
            // }
            // action("Signature Register")
            // {
            //     ApplicationArea = Basic;
            //     Image = "Report";
            //     Promoted = true;
            //     PromotedCategory = "Report";
            //     PromotedIsBig = true;
            //     RunObject = Report "Signature Register";
            // }
            action("Request to approve")
            {
                ApplicationArea = Basic;
                RunObject = Page "Requests to Approve";
            }
            // action("Attendance Register")
            // {
            //     ApplicationArea = Basic;
            //     Image = "Report";
            //     Promoted = true;
            //     PromotedCategory = "Report";
            //     PromotedIsBig = true;
            //     RunObject = Report "Signature RegisterV3";
            // }
            // action("Stationery Computation Packing")
            // {
            //     ApplicationArea = Basic;
            //     Image = "Report";
            //     Promoted = true;
            //     PromotedCategory = "Report";
            //     PromotedIsBig = true;
            //     RunObject = Report "Stationery Computation Packing";
            // }
            // action("Transactions Report")
            // {
            //     ApplicationArea = Basic;
            //     RunObject = Report "Transactions Report";
            // }
            action("Exam Entry Analysis Form")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                //RunObject = Report "Exam Entry Analysis Form";
            }
            action("Delivery and Receipt of Question Papers")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                //RunObject = Report "Delivery Receipt Papers";
            }
            action("No. of Exam Centers")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                // RunObject = Report "No. of Exam Centers";
            }
            action("Exam Analysis Summary Per Level")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                //RunObject = Report "Exam Analysis Form";
            }
            action("Examination Entry Summary Per Paper")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                // RunObject = Report "Summary Center Entries Per Sub";
            }
            action("Booked less Than 3 Papers")
            {
                ApplicationArea = Suite;
                Caption = 'Booked less Than 3 Papers';
                Image = "Report";
                //RunObject = Report "Booked less Than 3 Papers";
            }
            action("Candidature Per Examination For All Centers")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                //  RunObject = Report "Summary Center Entries";
            }
            action("Summary Candidature Per Paper")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                // RunObject = Report "Total Candidature";
            }
            action("Summary Candidature Per Paper Per Level")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                //RunObject = Report "Candidature Per Paper";
            }
            action("Exam Envelopes Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                // RunObject = Report "Exam Envelopes Report";
            }
            action("Center Daily Summary")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                // RunObject = Report "Center Daily Summary";
            }
            action("Diploma Attendance Register")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                //RunObject = Report "Diploma Attendance Register";
            }
            action("Diploma Signature Register")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                // RunObject = Report "Diploma Signature Register";
            }
            group("INSTITUTION REPORTS")
            {
                action("Institution Statement")
                {
                    ApplicationArea = Basic;
                    //  RunObject = Report "Institution Statement";
                }
                action("Posted Receipts Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Receipts Report';
                    Image = "Report";
                    //  RunObject = Report "Posted Receipt Report";
                }
                action("Processed Revenue Summary")
                {
                    ApplicationArea = Basic;
                    //  RunObject = Report "Processed Revenue Summary";
                }
            }
        }
        area(creation)
        {
            action("Import Bank Details")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Import Bank Details';
                Image = ImportExcel;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Import Worksheet";
                RunPageMode = Edit;
                ToolTip = 'Importation of Bank Details';
            }
            action("Bank Import Entries")
            {
                ApplicationArea = Basic;
                Caption = 'Bank Import Entries';
                Image = AdjustVATExemption;
                RunObject = Page "Bank Import Entries";
                RunPageMode = View;
            }
            action("Examination Setup")
            {
                ApplicationArea = Basic;
                RunObject = Page "Examination Setup";
            }
        }
        area(embedding)
        {
            action(Students)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Students';
                Image = Customer;
                RunObject = Page Students;
                ToolTip = 'View or edit detailed information for the students that you trade with. From each Student card, you can open related information, such as Examination Accounts statistics and Balances, and you can define specific attirbutes of the students';
            }
            action("Examination Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Examination Accounts';
                Image = Balance;
                RunObject = Page "Examination Accounts";
                ToolTip = 'List of examination Accounts for the students';
            }
            action("Training Institutions")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Training Institutions';
                Image = Balance;
                RunObject = Page "Training Institutions";
                ToolTip = 'List of Training Institutions';
            }
            action("Draft Portal Applications")
            {
                ApplicationArea = Suite;
                Caption = 'Draft Portal Registration Applications';
                Image = "Order";
                RunObject = Page "Draft Portal Applications";
                ToolTip = 'Draft Portal Applications';
            }
            action("Applications Awaiting Payment")
            {
                ApplicationArea = Suite;
                Caption = 'Portal Student Registration Awaiting Payment';
                RunObject = Page "Application Awaiting Payment";

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
            action("Existing Student Applications")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Existing Student Applications';
                Image = Invoice;
                RunObject = Page "Existing Student Applications";
                ToolTip = 'Allow the Registration of Existing students for new examination';
            }
            action("Institution Applications")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Institution Applications';
                Image = ReturnOrder;
                RunObject = Page "Institution Applications";
                ToolTip = 'Allow the registration of institution student Applications';
            }
            action("Student Exemptions")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Student Exemptions';
                Image = BankAccount;
                RunObject = Page "Student Exemptions";
                ToolTip = 'Allow the student Exemptions bookings';
            }
            action("Portal Exemptions")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Portal Exemptions';
                Image = BankAccount;
                RunObject = Page "Exemption Awaiting Approval";
                ToolTip = 'Exemptions Awaiting Approval';
            }
            action("Rejected Exemptions")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Rejected Exemptions';
                Image = BankAccount;
                RunObject = Page "Rejected Exemptions";
                ToolTip = 'Rejected Exemptions';
            }
            action("Student Examination Bookings")
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
                ApplicationArea = Basic, Suite;
                Caption = 'Student Withdrawal Applications';
                Image = Item;
                RunObject = Page "Student Withdrawal Vouchers";
                ToolTip = 'Allows student to withdraw from an Active sittings';
            }
            action("Student Deferment")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Student Deferment Applications';
                RunObject = Page "Student Deferment Vouchers";
                ToolTip = 'Allows student to defer from an examination';
            }
            action("Renewal Applications")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Renewal Applications';
                Image = Journals;
                RunObject = Page "Renewal Applications";
                ToolTip = 'Allows Renewal of Applications';
            }
            action("Re-Activation Appl")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Re-Activation Applications';
                Image = Journal;
                RunObject = Page "Re-Activation Applications";
                ToolTip = 'Re-Activation Applications';
            }
            action("Miscellaneous Applications")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Miscellaneous Applications';
                RunObject = Page "Miscellaneous Applications";
                ToolTip = 'Miscellaneous Applications';
            }
            action("Center Re-Allocation Vouchers")
            {
                ApplicationArea = Basic;
                Caption = 'Center Re-Allocation Vouchers';
                RunObject = Page "Center Re-Allocation Vouchers";
            }
            action("Standard Receipts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Standard Receipts';
                RunObject = Page "Receipts List";
            }
            action("Student Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Portal Student Accounts';
                RunObject = Page "Student Accounts";
            }
            action("Sales List")
            {
                ApplicationArea = Basic;
                Caption = 'Sales List';
                RunObject = Page "Sales List";
            }
            action("Manual New Student Applications")
            {
                ApplicationArea = Suite;
                Caption = 'Manual New Student Applications';
                Image = "Order";
                RunObject = Page "Manual Student Applications";
                ToolTip = 'Allows Processing of New student applications to the systems';
            }
            action("Manual Student Exemptions")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Manual Student Exemptions';
                Image = BankAccount;
                RunObject = Page "Manual Student Exemptions";
                ToolTip = 'Allow the student Exemptions bookings';
            }
            action("Manual Student Examination Bookings")
            {
                ApplicationArea = Suite;
                Caption = 'Manual Student Examination Bookings';
                Image = Reminder;
                RunObject = Page "Manual Student Exam Bookings";
                ToolTip = 'Voucher Used for Student Examination Bookings';
            }
        }
        area(sections)
        {
            group("Rejected Requests")
            {
                action("Rejected Student Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rejected Student Applications';
                    RunObject = Page "Rejected Student Applications";
                }
                action(Action99)
                {
                    ApplicationArea = Basic;
                    Caption = 'Rejected Exemptions';
                    RunObject = Page "Rejected Exemptions";
                }
            }
            group(Ammendments)
            {
                Caption = 'Ammendments';
                Image = FiledPosted;
                action("Students Edit")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Students Edit';
                    Image = Customer;
                    RunObject = Page Students;
                    ToolTip = 'View or edit detailed information for the students that you trade with. From each Student card, you can open related information, such as Examination Accounts statistics and Balances, and you can define specific attirbutes of the students';
                }
                action("Exam Booking Entries")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Exam Booking Entries';
                    Image = PostedOrder;
                    RunObject = Page "Exam Booking Entries";
                    ToolTip = 'Exam Booking Entries';
                }
                action("Exemption Entries")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Exemption Entries';
                    Image = PostedOrder;
                    RunObject = Page "Exemption Entries";
                    ToolTip = 'Posted Institution Examination Bookings';
                }
                action("General Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Journal';
                    Image = PaymentJournal;
                    RunObject = Page "General Journal Batches";
                    RunPageView = where(Name = const('SUSPENSE'));
                }
            }
            group("Data Imports")
            {
                Caption = 'Data Imports';
                Image = FiledPosted;
                action("Exam Booking Entries Dataport")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Exam Booking Entries Dataport';
                    Image = PaymentJournal;
                    RunObject = xmlport "Exam Booking Entries Dataport";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Examination Results DataPort")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination Results DataPort';
                    Image = PaymentJournal;
                    RunObject = xmlport "Examination Results DataPort";
                    //  RunPageView = where(Name = const('SUSPENSE'));
                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Processed Student Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Processed Student Applications';
                    Image = PostedShipment;
                    RunObject = Page "Proessed Student Applications";
                    ToolTip = 'Proessed Student Applications';
                }
                action("Processed Institution Student Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Processed Institution Student Applications';
                    Image = PostedOrder;
                    RunObject = Page "PostBulk Student Applications";
                    ToolTip = 'Processed Institution Student Applications';
                }
                action("Processed Examination Bookings")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Processed Examination Bookings';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Processed Exam Bookings";
                    ToolTip = 'Processed Examination Bookings';
                }
                action("Posted Institution Examination Bookings")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Institution Examination Bookings';
                    Image = PostedOrder;
                    RunObject = Page "Posted Bulk Exam Bookings";
                    ToolTip = 'Posted Institution Examination Bookings';
                }
                action("Posted Student Exemptions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Student Exemptions';
                    RunObject = Page "Posted Student Exemptions";
                    ToolTip = 'Posted Student Exemptions';
                }
                action("Posted Deferment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
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
                    ApplicationArea = Basic, Suite;
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
                action("Posted Receipts List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Receipts List';
                    RunObject = Page "Posted Receipts List";
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                }
            }
            group("Student Management Reports & Analysis")
            {
                Caption = 'Student Management Reports & Analysis';
                Image = Report;
                action("Transactions Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Transactions Report';
                    Image = Report;
                    RunObject = Report "Transactions Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Ongoing Transactions Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Transactions Report';
                    Image = Report;
                    RunObject = Report "Ongoing Transactions Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Exam Booking Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Exam Booking Report';
                    Image = Report;
                    RunObject = Report "Exam Booking Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Daily Summary Transactions Report Per User")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Daily Summary Transactions Report Per User';
                    Image = Report;
                    RunObject = Report "Summary Transactions Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Statistical Summary Per User")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Statistical Summary Per User';
                    Image = Report;
                    RunObject = Report "Statistics Per User Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Student Registration By Gender")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Student Registration By Gender';
                    Image = Report;
                    RunObject = Report "Student Registration By Gender";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Rejected Transactions Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Rejected Transactions Report';
                    Image = Report;
                    RunObject = Report "Rejected Transactions Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Results Register")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Results Register';
                    Image = Report;
                    RunObject = Report "Results Register";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Booked less Than 3 Paper")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Booked less Than 3 Papers';
                    Image = Report;
                    RunObject = Report "Booked less Than 3 Papers";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Detailed Ongoing Transactions Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Detailed Ongoing Transactions Report';
                    Image = Report;
                    RunObject = Report "Detailed Transactions Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Quarterly Registration Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Quarterly Registration Report';
                    Image = Report;
                    RunObject = Report "Quarterly Registration Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Registration Information Sources Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Registration Information Sources Report';
                    Image = Report;
                    RunObject = Report "Quarterly Registration Sources";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Posted Receipt Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Receipt Report';
                    Image = Report;
                    RunObject = Report "Posted Receipt Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("MPESAUnutilized Amounts Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'MPESAUnutilized Amounts Report';
                    Image = Report;
                    RunObject = Report "MPESAUnutilized Amounts Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Bank Unutilized Amounts Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Unutilized Amounts Report';
                    Image = Report;
                    RunObject = Report "Bank Unutilized Amounts Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }


            }
            group("Examination Administration Reports & Analysis")
            {
                Caption = 'Examination Administration Reports & Analysis';
                Image = Report;
                action("Centre Allocation Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Centre Allocation Report';
                    Image = Report;
                    RunObject = Report "Center Booking Entries";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Centre Re-allocation Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Centre Re-allocation Report';
                    Image = Report;
                    RunObject = Report "Center Re-allocation Entries";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Examination Booking Per Center Per Level")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination Booking Per Center Per Level';
                    Image = Report;
                    RunObject = Report "Booking Per Center Per Level";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Examination Center Daily Summary")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination Center Daily Summary';
                    Image = Report;
                    RunObject = Report "Center Daily Summary";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Attendance Register")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Attendance Register';
                    Image = Report;
                    RunObject = Report "Signature RegisterV3";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Signature Register")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Signature Register';
                    Image = Report;
                    RunObject = Report "Signature Register";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Envelope Report For All Centers Per Paper")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Envelope Report For All Centers Per Paper';
                    Image = Report;
                    RunObject = Report "Exam Envelopes Report";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Summary Candidature Per Level Per Paper")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Summary Candidature Per Level Per Paper';
                    Image = Report;
                    RunObject = Report "Candidature Per Paper";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Summary Candidature Per Paper Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Summary Candidature Per Paper';
                    Image = Report;
                    RunObject = Report "Total Candidature";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Summary Candidature Per Examination For All Centers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Summary Candidature Per Examination For All Centers';
                    Image = Report;
                    RunObject = Report "Summary Center Entries";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Examination Entry Summary Per Paper Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination Entry Summary Per Paper';
                    Image = Report;
                    RunObject = Report "Summary Center Entries Per Sub";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Exam Analysis Summary Per Level Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Exam Analysis Summary Per Level';
                    Image = Report;
                    RunObject = Report "Exam Analysis Form";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Total Booking Entries Per Level")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Total Booking Entries Per Level ';
                    Image = Report;
                    RunObject = Report "Det. Booking Entries Per Level";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Number of Exam Centres")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Number of Exam Centres';
                    Image = Report;
                    RunObject = Report "No. of Exam Centers";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }
                action("Exam Entry Analysis Form Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Exam Entry Analysis Form';
                    Image = Report;
                    RunObject = Report "Exam Entry Analysis Form";
                    //RunPageView = where(Name = const('SUSPENSE'));
                }


            }
        }
        area(processing)
        {
            action("General Journal Batches")
            {
                ApplicationArea = Basic;
                RunObject = Page "General Journal Batches";
                Visible = false;
            }
            action(Action78)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'General Journal';
                Image = PaymentJournal;
                RunObject = Page "General Journal Batches";
                RunPageView = where(Name = const('SUSPENSE'));
                Visible = false;
            }
            separator(Action64)
            {
                Caption = 'New';
                IsHeader = true;
            }
            action("New Student Application")
            {
                ApplicationArea = Basic, Suite;
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
                ApplicationArea = Basic, Suite;
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
                ApplicationArea = Basic, Suite;
                Caption = 'Customer Receipts';
                Image = Payment;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page Receipt;
                ToolTip = 'Process your Customer Receipts';
            }
            action("Exemptions Setup")
            {
                ApplicationArea = Basic;
                RunObject = Page "Exemptions Setup";
            }
            action("Document Templates")
            {
                ApplicationArea = Basic;
                RunObject = Page "Document Templates";
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
                action(" Existing Student Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = ' Existing Student Applications';
                    Image = Invoice;
                    RunObject = Page "Existing Student Application";
                    ToolTip = 'Allow the Registration of Existing students for new examination';
                }
                action(Action44)
                {
                    ApplicationArea = Basic, Suite;
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
                }
                action("Student Qualifications")
                {
                    ApplicationArea = Basic;
                    RunObject = Page 85505;
                }
                action("Examination sitting cycle")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Examination Sitting Cycle";
                }
                action("Exemption Awaiting Approval")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Exemption Awaiting Approval";
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
                action("MPESA TRANSACTION IMPORT")
                {
                    ApplicationArea = Service;
                    Caption = 'MPESA TRANSACTION IMPORT';
                    Image = Import;
                    RunObject = XMLport "MPESA TRANSACTION IMPORT";
                }
                action(ReverseReceipts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reverse Receipts';
                    // RunObject = Report ReverseReceipts;
                }
                action("MPESA Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'MPESA Entries';
                    RunObject = Page "MPESA Entries";
                }
                action("Unaplied Mpesa Amount Report")
                {
                    ApplicationArea = Basic;
                    //RunObject = Report "Unaplied Amount Report";
                }
            }
        }
    }
}

