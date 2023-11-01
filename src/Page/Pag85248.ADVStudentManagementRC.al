#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page ADV Student Management RC (ID 85248).
/// </summary>
Page 85248 "ADV Student Management RC"
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
        area(navigation)
        {
            group("Booking Summary")
            {
                Caption = 'Booking Summary';
                action("Booking Per Center Per Level")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    // RunObject = Report "Booking Per Center Per Level";
                    ToolTip = 'Executes the Booking Per Center Per Level action.';
                }
                action("Summary Center Entries ")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    // RunObject = Report "Summary Center Entries";
                    ToolTip = 'Executes the Summary Center Entries  action.';
                }
                action("<Exam Booking Report>")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    // RunObject = Report "Exam Booking Report";
                    ToolTip = 'Executes the <Exam Booking Report> action.';
                }
                action("Exam Booking Report")
                {
                    ApplicationArea = Suite;
                    Caption = 'Exam Booking Report';
                    Image = "Report";
                    //RunObject = Report "Exam Booking Report";
                    ToolTip = 'Executes the Exam Booking Report action.';
                }
            }
            group("Transactions Summary")
            {
                Caption = 'Transactions Summary';
                Visible = false;
                action(Action54)
                {
                    ApplicationArea = Suite;
                    Image = "Report";
                    //RunObject = Report "Ongoing Transactions Report";
                    Visible = false;
                    ToolTip = 'Executes the Action54 action.';
                }
                action(Action55)
                {
                    ApplicationArea = Suite;
                    Image = "Report";
                    //  RunObject = Report "Transactions Report";
                    Visible = false;
                    ToolTip = 'Executes the Action55 action.';
                }
                action("Ongoing Transactions Report")
                {
                    ApplicationArea = Suite;
                    Caption = 'Ongoing Transactions Report';
                    Image = "Report";
                    //  RunObject = Report "Ongoing Transactions Report";
                    Visible = false;
                    ToolTip = 'Executes the Ongoing Transactions Report action.';
                }
                action("Processed Transactions Report")
                {
                    ApplicationArea = Suite;
                    Caption = 'Processed Transactions Report';
                    Image = "Report";
                    //RunObject = Report "Transactions Report";
                    ToolTip = 'Executes the Processed Transactions Report action.';
                }
                action("Exam Transactions Report")
                {
                    ApplicationArea = Suite;
                    Caption = 'Exam Transactions Report';
                    Image = "Report";
                    // RunObject = Report "Exam Transactions Report";
                    ToolTip = 'Executes the Exam Transactions Report action.';
                }
                action("Summary Per Transaction Type")
                {
                    ApplicationArea = Suite;
                    Caption = 'Summary Per Transaction Type';
                    Image = "Report";
                    // RunObject = Report "Summary Transaction Type";
                    ToolTip = 'Executes the Summary Per Transaction Type action.';
                }
                action("Payment Mode Summary")
                {
                    ApplicationArea = Suite;
                    Caption = 'Summary Per Payment Mode';
                    Image = "Report";
                    // RunObject = Report "Payment Mode Summary";
                    ToolTip = 'Executes the Summary Per Payment Mode action.';
                }
                action("Timetable Planner")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    ///  RunObject = Report "Timetable Planner";
                    ToolTip = 'Executes the Timetable Planner action.';
                }
                action("Registration Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Registration Entries';
                    Image = "Report";
                    ///RunObject = Report "Registration Entries";
                    ToolTip = 'Executes the Registration Entries action.';
                }
            }
        }
        area(reporting)
        {
            group("Administration Report")
            {
                Caption = 'Administration Report';
                action("Signature Register")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //  RunObject = Report "Signature RegisterV1";
                    ToolTip = 'Executes the Signature Register action.';
                }
                action("Attendance Register")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //  RunObject = Report "Attendance RegisterV1";
                    ToolTip = 'Executes the Attendance Register action.';
                }
                action("Diploma Signature Register")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //  RunObject = Report "Diploma Signature Register";
                    ToolTip = 'Executes the Diploma Signature Register action.';
                }
                action("Diploma Attendance Register")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //  RunObject = Report "Diploma Attendance Register";
                    ToolTip = 'Executes the Diploma Attendance Register action.';
                }
                action("Center Daily Summary")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Center Daily Summary";
                    ToolTip = 'Executes the Center Daily Summary action.';
                }
                action("Exam Envelopes Report")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //  RunObject = Report "Exam Envelopes Report";
                    ToolTip = 'Executes the Exam Envelopes Report action.';
                }
                action("Exam Booking Per Center Per Level")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Booking Per Center Per Level";
                    ToolTip = 'Executes the Exam Booking Per Center Per Level action.';
                }
                action("Summary Candidature Per Paper Per Level")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Candidature Per Paper";
                    ToolTip = 'Executes the Summary Candidature Per Paper Per Level action.';
                }
                action("Summary Candidature Per Paper")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //  RunObject = Report "Total Candidature";
                    ToolTip = 'Executes the Summary Candidature Per Paper action.';
                }
                action("Candidature Per Examination For All Centers")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //   RunObject = Report "Summary Center Entries";
                    ToolTip = 'Executes the Candidature Per Examination For All Centers action.';
                }
                action("Stationery Computation Packing")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //  RunObject = Report "Stationery Computation Packing";
                    ToolTip = 'Executes the Stationery Computation Packing action.';
                }
            }
            group("Other Administration Report ")
            {
                Caption = 'Other Administration Report ';
                action("Booked less Than 3 Papers")
                {
                    ApplicationArea = Suite;
                    Caption = 'Booked less Than 3 Papers';
                    Image = "Report";
                    //RunObject = Report "Booked less Than 3 Papers";
                    ToolTip = 'Executes the Booked less Than 3 Papers action.';
                }
                action("Examination Entry Summary Per Paper")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //  RunObject = Report "Summary Center Entries Per Sub";
                    ToolTip = 'Executes the Examination Entry Summary Per Paper action.';
                }
                action("Exam Analysis Summary Per Level")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Exam Analysis Form";
                    ToolTip = 'Executes the Exam Analysis Summary Per Level action.';
                }
                action("No. of Exam Centers")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //  RunObject = Report "No. of Exam Centers";
                    ToolTip = 'Executes the No. of Exam Centers action.';
                }
                action("Exam Entry Analysis Form")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //  RunObject = Report "Exam Entry Analysis Form";
                    ToolTip = 'Executes the Exam Entry Analysis Form action.';
                }
                action("Delivery and Receipt of Question Papers")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    // RunObject = Report "Delivery Receipt Papers";
                    ToolTip = 'Executes the Delivery and Receipt of Question Papers action.';
                }
                action("Total Booking Entries Per Level")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Booking Entries Per Level';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //RunObject = Report "Det. Booking Entries Per Level";
                    ToolTip = 'Executes the Total Booking Entries Per Level action.';
                }
                action("Unaplied Mpesa Amount Report")
                {
                    ApplicationArea = Basic;
                    // RunObject = Report "Unaplied Amount Report";
                    Visible = false;
                    ToolTip = 'Executes the Unaplied Mpesa Amount Report action.';
                }
                action("Results Register")
                {
                    ApplicationArea = Basic;
                    //RunObject = Report "Results Register";
                    Visible = false;
                    ToolTip = 'Executes the Results Register action.';
                }
                action("Script Analysis Form")
                {
                    ApplicationArea = Basic;
                    Caption = 'Script Analysis Form';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    // RunObject = Report "Abse Exam Entry Analysis";
                    ToolTip = 'Executes the Script Analysis Form action.';
                }
                action("Transactions Report")
                {
                    ApplicationArea = Basic;
                    // RunObject = Report "Transactions Report";
                    ToolTip = 'Executes the Transactions Report action.';
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
            action("Mpesa entries")
            {
                ApplicationArea = Basic;
                RunObject = Page "MPESA Entries";
                ToolTip = 'Executes the Mpesa entries action.';
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
                ApplicationArea = Basic, Suite;
                Caption = ' Existing Student Applications';
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
            // action("Re-Activation Applications")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Re-Activation Applications';
            //     Image = Journal;
            //     RunObject = Page "Re-Activation Applications";
            //     ToolTip = 'Re-Activation Applications';
            // }
            action("Miscellaneous Applications")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Miscellaneous Applications';
                RunObject = Page "Miscellaneous Applications";
                ToolTip = 'Miscellaneous Applications';
            }
            action("Standard Receipts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Standard Receipts';
                RunObject = Page "Receipts List";
                ToolTip = 'Executes the Standard Receipts action.';
            }
            action("Student Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Portal Student Accounts';
                RunObject = Page "Student Accounts";
                ToolTip = 'Executes the Portal Student Accounts action.';
            }
            action("Sales List")
            {
                ApplicationArea = Basic;
                Caption = 'Sales List';
                RunObject = Page "Sales List";
                ToolTip = 'Executes the Sales List action.';
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
            action("Center Re-allocation")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Center Re-allocation';
                Image = Journal;
                RunObject = Page "Center Re-Allocation Vouchers";
                ToolTip = 'Center Re-allocation';
            }
            action("Requests to Approve")
            {
                ApplicationArea = Basic;
                Caption = 'Requests to Approve';
                RunObject = Page "Requests to Approve";
                ToolTip = 'Executes the Requests to Approve action.';
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
                    ToolTip = 'Executes the Rejected Student Applications action.';
                }
                action("Rejected Exemptions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rejected Exemptions';
                    RunObject = Page "Rejected Exemptions";
                    ToolTip = 'Executes the Rejected Exemptions action.';
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
                action(" Exemption Entries")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = ' Exemption Entries';
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
                    ToolTip = 'Executes the General Journal action.';
                }
            }
            //Test Development
            group("Test Developoment")
            {
                Caption = 'Test Development'; 
                Image = FiledPosted;
                action("Examiners List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examiners List';
                    Image = PostedShipment;
                    RunObject = Page "Examiners Se- List";
                    ToolTip = 'Examiners List';
                }
                action("Examination  Setters")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination  Setters';
                    Image = PostedOrder;
                    RunObject = Page "Examination  Setters";
                    ToolTip = 'Examination  Setters';
                }
                action("Examination  Moderators")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination  Moderators';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Examination  Moderators";
                    ToolTip = 'Examination  Moderators ';
                }
                action("Setters Evaluations")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Setters Evaluations';
                    Image = PostedOrder;
                    RunObject = Page "Setters Evaluations";
                    ToolTip = 'Setters Evaluations';
                }
                action("Examination  Reviewers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination  Reviewers';
                    RunObject = Page "Examination  Reviewers";
                    ToolTip = 'Examination  Reviewers';
                }
                action("Examination Chief Examiners")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Examination Chief Examiners';
                    RunObject = Page "Examination Chief Examiners";
                    ToolTip = 'Examination Chief Examiners';
                }
                action("Setter Table of Specifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Setter Table of Specifications';
                    RunObject = Page "Setter Table of Specifications";
                    
                    ToolTip = 'Executes the Posted Miscellaneous Receipts action.';
                }
                action("Setter Disclosure Forms")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Setter Disclosure Forms';
                    RunObject = Page "Setter Disclosure Forms";
                    ToolTip = 'Setter Disclosure Forms';
                }
                action("Setter Claim Forms")
                {
                    ApplicationArea = Basic;
                    Caption = 'Setter Claim Forms';
                    RunObject = Page "Setter Claim Forms";
                    ToolTip = 'Setter Claim Forms.';
                }
                action("Moderator Specifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Moderator Specifications';
                    RunObject = Page "Moderator Specifications";
                    ToolTip = 'Moderator Specifications.';
                }
                action("Chief Examiner Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Chief Examiner Comments';
                    RunObject = Page "Chief Examiner Comments";
                    ToolTip = 'Chief Examiner Comments';
                }
                action("CEO Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'CEO Comments';
                    RunObject = Page "CEO Comments";
                    ToolTip = 'CEO Comments.';
                }
                action("Questions Bank ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Questions Bank ';
                    RunObject = Page "Questions Bank";
                    ToolTip = 'Questions Bank';
                }
                action("Examiner Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examiner Setup';
                    RunObject = Page "Examiner Setup";
                    ToolTip = 'Examiner Setup';
                }
                action("Paper Topic Areas")
                {
                    ApplicationArea = Basic;
                    Caption = 'Paper Topic Areas';
                    RunObject = Page "Paper Topic Areas";
                    ToolTip = 'Paper Topic Areas';
                }
                action("Paper Subject Area")
                {
                    ApplicationArea = Basic;
                    Caption = 'Paper Subject Area';
                    RunObject = Page "Paper Subject Area";
                    ToolTip = 'Paper Subject Area';
                }

                action("Review Comment Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Review Comment Setup';
                    RunObject = Page "Review Comment Setup";
                    ToolTip = 'Review Comment Setup';
                }
                action("Setting & Moderation Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Setting & Moderation Setup';
                    RunObject = Page "Setting & Moderation Setup";
                    ToolTip = 'Setting & Moderation Setup';
                }
                action("Paper Topic Area Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Paper Topic Area Setup';
                    RunObject = Page "Paper Topic Area Setup";
                    ToolTip = 'Paper Topic Area Setup';
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
                    ToolTip = 'Executes the Posted Miscellaneous Receipts action.';
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
                    ToolTip = 'Executes the Posted Renewal Applications action.';
                }
                action("Posted Receipts List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Receipts List';
                    RunObject = Page "Posted Receipts List";
                    ToolTip = 'Executes the Posted Receipts List action.';
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Executes the Posted Sales Invoices action.';
                }
            }
        }
        area(processing)
        {
            action(Action78)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'General Journal';
                Image = PaymentJournal;
                RunObject = Page "General Journal Batches";
                RunPageView = where(Name = const('SUSPENSE'));
                ToolTip = 'Executes the General Journal action.';
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
                action(Action46)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = ' Existing Student Applications';
                    Image = Invoice;
                    RunObject = Page "Existing Student Application";
                    ToolTip = 'Allow the Registration of Existing students for new examination';
                }
                action(Action56)
                {
                    ApplicationArea = Basic;
                    Caption = 'Rejected Student Applications';
                    RunObject = Page "Rejected Student Applications";
                    ToolTip = 'Executes the Rejected Student Applications action.';
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
                // action("Re-Activation Applications")
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Re-Activation Applications';
                //     Image = FinChargeMemo;
                //     Promoted = false;
                //     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedCategory = Process;
                //     RunObject = Page "Re-Activation Applications";
                //     RunPageMode = Create;
                //     ToolTip = 'Re-Activation Applications';
                // }
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
                action("Import MPESA TRANSACTION")
                {
                    ApplicationArea = Service;
                    Caption = 'Import MPESA TRANSACTION';
                    Image = Import;
                    RunObject = XMLport "MPESA TRANSACTION IMPORT";
                    ToolTip = 'Import the International Repair Coding System to define resolution codes for service items.';
                }
            }
            group("Data Imports")
            {
                Caption = 'Data Imports';
                action("Student Accounts Import")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Student Accounts Import";
                    ToolTip = 'Executes the Student Accounts Import action.';
                }
                action("Examination Accounts Import")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Examination Accounts Import";
                    ToolTip = 'Executes the Examination Accounts Import action.';
                }
                action("Student Renewals Import")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Student Renewals Import";
                    ToolTip = 'Executes the Student Renewals Import action.';
                }
                action("Exam Booking Entries Dataport")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Exam Booking Entries Dataport";
                    ToolTip = 'Executes the Exam Booking Entries Dataport action.';
                }
                action("Exmptions Accounts Export")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Exmptions Accounts Export";
                    ToolTip = 'Executes the Exmptions Accounts Export action.';
                }
                action("Examination History Dataport")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Examination History Dataport";
                    ToolTip = 'Executes the Examination History Dataport action.';
                }
                action("Examination Results DataPort")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Examination Results DataPort";
                    ToolTip = 'Executes the Examination Results DataPort action.';
                }
                action("Examination Results Remarks")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Examination Results Remarks";
                    ToolTip = 'Executes the Examination Results Remarks action.';
                }
                action("Student Remarks DataPort")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Student Remarks DataPort";
                    ToolTip = 'Executes the Student Remarks DataPort action.';
                }
            }
        }
    }
}

