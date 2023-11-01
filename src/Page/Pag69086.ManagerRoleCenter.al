#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69086 "Manager Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control21; "Finance Performance")
                {
                    ApplicationArea = Basic;
                }
                part(Control1000000008; "Manager Activities")
                {
                    ApplicationArea = Basic;
                }
                systempart(Control1901420308; Outlook)
                {
                    ApplicationArea = Basic;
                }
                // part(Control26)
                // {
                //     ApplicationArea = Basic;
                // }
            }
            group(Control1900724708)
            {
                part(Control24; "Cash Flow Forecast Chart")
                {
                    ApplicationArea = Basic;
                }
                part(Control25; "My Job Queue")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                part(Control1907692008; "My Customers")
                {
                    ApplicationArea = Basic;
                }
                part(Control1902476008; "My Vendors")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                part(Control1905989608; "My Items")
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
            action("Account Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Account Schedule';
                Image = ReceivablesPayables;
                RunObject = Report "Account Schedule";
                ToolTip = 'Executes the Account Schedule action.';
            }
            action("Recei&vables-Payables")
            {
                ApplicationArea = Basic;
                Caption = 'Recei&vables-Payables';
                Image = ReceivablesPayables;
                RunObject = Report "Receivables-Payables";
                ToolTip = 'Executes the Recei&vables-Payables action.';
            }
            action("&Trial Balance/Budget")
            {
                ApplicationArea = Basic;
                Caption = '&Trial Balance/Budget';
                Image = "Report";
                RunObject = Report "Trial Balance/Budget";
                ToolTip = 'Executes the &Trial Balance/Budget action.';
            }
            action("&Closing Trial Balance")
            {
                ApplicationArea = Basic;
                Caption = '&Closing Trial Balance';
                Image = "Report";
                RunObject = Report "Closing Trial Balance";
                ToolTip = 'Executes the &Closing Trial Balance action.';
            }
            action("&Fiscal Year Balance")
            {
                ApplicationArea = Basic;
                Caption = '&Fiscal Year Balance';
                Image = "Report";
                RunObject = Report "Fiscal Year Balance";
                ToolTip = 'Executes the &Fiscal Year Balance action.';
            }
            separator(Action6)
            {
            }
            action(Statement)
            {
                ApplicationArea = Basic;
                Caption = 'Statement';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report Statement;
                ToolTip = 'Executes the Statement action.';
            }
            action("Aged Accounts Receivable")
            {
                ApplicationArea = Basic;
                Caption = 'Aged Accounts Receivable';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Aged Accounts Receivable";
                ToolTip = 'Executes the Aged Accounts Receivable action.';
            }
            action("Customer - &Balance")
            {
                ApplicationArea = Basic;
                Caption = 'Customer - &Balance';
                Image = "Report";
                RunObject = Report "Customer - Balance to Date";
                ToolTip = 'Executes the Customer - &Balance action.';
            }
            action("Customer - T&op 10 List")
            {
                ApplicationArea = Basic;
                Caption = 'Customer - T&op 10 List';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                RunObject = Report "Customer - Top 10 List";
                ToolTip = 'Executes the Customer - T&op 10 List action.';
            }
            action("Customer - S&ales List")
            {
                ApplicationArea = Basic;
                Caption = 'Customer - S&ales List';
                Image = "Report";
                RunObject = Report "Customer - Sales List";
                ToolTip = 'Executes the Customer - S&ales List action.';
            }
            action("Sales &Statistics")
            {
                ApplicationArea = Basic;
                Caption = 'Sales &Statistics';
                Image = "Report";
                RunObject = Report "Sales Statistics";
                ToolTip = 'Executes the Sales &Statistics action.';
            }
            separator(Action11)
            {
            }
            action("Employee Time Sheet")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Time Sheet';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                //   RunObject = Report "Local Order";
                ToolTip = 'Executes the Employee Time Sheet action.';
            }
            action("Detailed Employee Time Sheet")
            {
                ApplicationArea = Basic;
                Caption = 'Detailed Employee Time Sheet';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                //RunObject = Report UnknownReport50091;
                ToolTip = 'Executes the Detailed Employee Time Sheet action.';
            }
            action("Employee Time Sheet-EMB")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Time Sheet-EMB';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                // RunObject = Report "Employee Payroll History";
                ToolTip = 'Executes the Employee Time Sheet-EMB action.';
            }
            action("Detailed Employee Time Sheet-EMB")
            {
                ApplicationArea = Basic;
                Caption = 'Detailed Employee Time Sheet-EMB';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                //  RunObject = Report "EFT Imprest";
                ToolTip = 'Executes the Detailed Employee Time Sheet-EMB action.';
            }
            action("Detailed Employee Time Sheet-CHC")
            {
                ApplicationArea = Basic;
                Caption = 'Detailed Employee Time Sheet-CHC';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                //  RunObject = Report "Training Plan Statistics";
                ToolTip = 'Executes the Detailed Employee Time Sheet-CHC action.';
            }
            separator(Action1000000027)
            {
            }
            action("Daily Job Book Summary")
            {
                ApplicationArea = Basic;
                Caption = 'Daily Job Book Summary';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                // RunObject = Report "Clean Student Booking Entries";
                ToolTip = 'Executes the Daily Job Book Summary action.';
            }
            separator(Action1000000025)
            {
            }
        }
        area(embedding)
        {
            action("Account Schedules")
            {
                ApplicationArea = Basic;
                Caption = 'Account Schedules';
                RunObject = Page "Account Schedule Names";
                ToolTip = 'Executes the Account Schedules action.';
            }
            action("Analysis by Dimensions")
            {
                ApplicationArea = Basic;
                Caption = 'Analysis by Dimensions';
                Image = AnalysisViewDimension;
                RunObject = Page "Analysis View List";
                ToolTip = 'Executes the Analysis by Dimensions action.';
            }
            action(Budgets)
            {
                ApplicationArea = Basic;
                Caption = 'Budgets';
                RunObject = Page "G/L Budget Names";
                ToolTip = 'Executes the Budgets action.';
            }
            action("Leave Balances")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Balances';
                Image = Employee;
                RunObject = Page "Leave Balances";
                ToolTip = 'Executes the Leave Balances action.';
            }
            action(Customers)
            {
                ApplicationArea = Basic;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'Executes the Customers action.';
            }
            action("Service Contracts")
            {
                ApplicationArea = Basic;
                Caption = 'Service Contracts';
                Image = ServiceAgreement;
                RunObject = Page "Service Contracts";
                ToolTip = 'Executes the Service Contracts action.';
            }
            action(Contacts)
            {
                ApplicationArea = Basic;
                Caption = 'Contacts';
                Image = CustomerContact;
                RunObject = Page "Contact List";
                ToolTip = 'Executes the Contacts action.';
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
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Sales Shipments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Sales Shipments";
                    ToolTip = 'Executes the Posted Sales Shipments action.';
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Executes the Posted Sales Invoices action.';
                }
                action("Posted Return Receipts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Return Receipts';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Posted Return Receipts";
                    ToolTip = 'Executes the Posted Return Receipts action.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Executes the Posted Sales Credit Memos action.';
                }
                action("Posted Service Shipments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Service Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Service Shipments";
                    ToolTip = 'Executes the Posted Service Shipments action.';
                }
                action("Posted Service Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Service Invoices';
                    Image = PostedServiceOrder;
                    RunObject = Page "Posted Service Invoices";
                    ToolTip = 'Executes the Posted Service Invoices action.';
                }
                action("Posted Service Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Service Credit Memos';
                    RunObject = Page "Posted Service Credit Memos";
                    ToolTip = 'Executes the Posted Service Credit Memos action.';
                }
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Executes the Posted Purchase Receipts action.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Executes the Posted Purchase Invoices action.';
                }
                action("Posted Return Shipments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Executes the Posted Return Shipments action.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Executes the Posted Purchase Credit Memos action.';
                }
                action("Issued Reminders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Issued Reminders';
                    Image = OrderReminder;
                    RunObject = Page "Issued Reminder List";
                    ToolTip = 'Executes the Issued Reminders action.';
                }
                action("Issued Fi. Charge Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Issued Fi. Charge Memos';
                    RunObject = Page "Issued Fin. Charge Memo List";
                    ToolTip = 'Executes the Issued Fi. Charge Memos action.';
                }
                action("G/L Registers")
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = Page "G/L Registers";
                    ToolTip = 'Executes the G/L Registers action.';
                }
            }
        }
    }
}

