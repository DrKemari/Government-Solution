#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57126 "Auditor Role Center"
{
    // CurrPage."Help And Setup List".ShowFeatured;

    Caption = 'Risk & Audit Role Center', Comment = '{Dependency=Match,"ProfileDescription_SMALLBUSINESS"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control139; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control16; "O365 Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            part(Control55; "Help And Chart Wrapper")
            {
               // AccessByPermission = TableData "Assisted Setup" = I;
                ApplicationArea = Basic, Suite;
                Caption = '';
                ToolTip = 'Specifies the view of your business assistance';
            }
            part(Control7; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Favorite Accounts';
            }
            part(Control9; "Trial Balance")
            {
                AccessByPermission = TableData "G/L Entry" = R;
                ApplicationArea = Basic, Suite;
            }
            part(Control98; "Power BI Report Spinner Part")
            {
                AccessByPermission = TableData "Power BI User Configuration" = I;
                ApplicationArea = Basic, Suite;
            }
            part(Control46; "Team Member Activities No Msgs")
            {
                ApplicationArea = Suite;
            }
            part(Control113; "O365 Link to Financials")
            {
                ApplicationArea = Invoicing;
                Caption = ' ';
            }
            part(Control96; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Sales Quote")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Quote';
                Image = NewSalesQuote;
                RunObject = Page "Sales Quote";
                RunPageMode = Create;
                ToolTip = 'Offer items or services to a customer.';
            }
            action("Sales Order")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Order';
                Image = NewOrder;
                RunObject = Page "Sales Order";
                RunPageMode = Create;
                ToolTip = 'Create a new sales order for items or services.';
            }
            action("Sales Invoice")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoice';
                Image = NewSalesInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
                ToolTip = 'Create a new invoice for the sales of items or services. Invoice quantities cannot be posted partially.';
            }
            action("Purchase Quote")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Suite;
                Caption = 'Purchase Quote';
                Image = NewSalesQuote;
                RunObject = Page "Purchase Quote";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase quote.';
            }
            action("<Page Purchase Order>")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Suite;
                Caption = 'Purchase Order';
                Image = NewOrder;
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase order.';
            }
            action("Purchase Invoice")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoice';
                Image = NewPurchaseInvoice;
                RunObject = Page "Purchase Invoice";
                RunPageMode = Create;
                ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
        }
        area(processing)
        {
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Enabled = true;
                Image = HumanResources;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action("Vendors List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = HumanResources;
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            group("SALES REPORT")
            {
                Caption = 'SALES REPORTS';
                group("SALES Reports")
                {
                    Caption = 'SALES';
                    Image = Sales;
                    action(" Customer - Top 10 List")
                    {
                        ApplicationArea = Basic;
                        Caption = ' Customer - Top 10 List';
                        Image = "Report";
                        Promoted = false;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = true;
                        RunObject = Report "Customer - Top 10 List";
                        ToolTip = 'Executes the  Customer - Top 10 List action.';
                    }
                    action("Posted Sales Invoice")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Page "Posted Sales Invoices";
                        ToolTip = 'Executes the Posted Sales Invoices action.';
                    }
                    action("Customer - Order Summary")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Customer - Order Summary";
                        ToolTip = 'Executes the Customer - Order Summary action.';
                    }
                    action("Customer - Trial Balance")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Customer - Trial Balance";
                        ToolTip = 'Executes the Customer - Trial Balance action.';
                    }
                    action("Inventory - Top 10 List")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Inventory - Top 10 List";
                        ToolTip = 'Executes the Inventory - Top 10 List action.';
                    }
                    action("Customer - Summary Aging")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Customer - Summary Aging";
                        ToolTip = 'Executes the Customer - Summary Aging action.';
                    }
                    action("Aged Accounts Receivable")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Aged Accounts Receivable";
                        ToolTip = 'Executes the Aged Accounts Receivable action.';
                    }
                }
            }
            group("VENDORS REPORTS")
            {
                Caption = 'VENDORS REPORTS';
                Image = ReferenceData;
                group(VENDORS)
                {
                    Caption = 'VENDORS';
                    Image = Receivables;
                    action("Vendor - Order Summary")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Vendor - Order Summary';
                        Image = "Report";
                        Promoted = false;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = false;
                        RunObject = Report "Vendor - Order Summary";
                        ToolTip = 'Executes the Vendor - Order Summary action.';
                    }
                    action("Vendor - Summary Aging")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Vendor _ Summary Aging';
                        Image = "Report";
                        Promoted = false;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = false;
                        RunObject = Report "Vendor - Summary Aging";
                        ToolTip = 'Executes the Vendor _ Summary Aging action.';
                    }
                    action("Aged Accounts Payable")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Aging Analysis of Pending bills';
                        Image = "Report";
                        RunObject = Report "Aged Accounts Payable";
                        ToolTip = 'Executes the Aging Analysis of Pending bills action.';
                    }
                    action("Vendor - Trial Balance")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Bills Report';
                        Image = "Report";
                      //  RunObject = Report "Bid Security Status Report";
                        ToolTip = 'Executes the Pending Bills Report action.';
                    }
                    action("Vendor - Top 10 List")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Vendor - Top 10 List";
                        ToolTip = 'Executes the Vendor - Top 10 List action.';
                    }
                }
            }
            group(New)
            {
                Caption = 'New';
                Image = New;
            }
            group(Payment)
            {
                Caption = 'Payments';
                action("Payment Reconciliation Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Reconcile Imported Payments';
                    Image = ApplyEntries;
                    RunObject = Codeunit "Pmt. Rec. Journals Launcher";
                    ToolTip = 'Reconcile your bank account by importing transactions and applying them, automatically or manually, to open customer ledger entries, open vendor ledger entries, or open bank account ledger entries.';
                }
                action("Import Bank Transactions")
                {
                    AccessByPermission = TableData "Bank Export/Import Setup" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Import Bank Transactions...';
                    Image = Import;
                    RunObject = Codeunit "Pmt. Rec. Jnl. Import Trans.";
                    ToolTip = 'To start the process of reconciling new payments, import a bank feed or electronic file containing the related bank transactions.';
                }
                action("Register Customer Payments")
                {
                    AccessByPermission = TableData "Payment Registration Setup" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Register Customer Payments';
                    Image = Payment;
                    RunObject = Page "Payment Registration";
                    ToolTip = 'Process your customer payments by matching amounts received on your bank account with the related unpaid sales invoices, and then post the payments.';
                }
                action("Create Vendor Payments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Create Vendor Payments';
                    Image = SuggestVendorPayments;
                    RunObject = Page "Vendor Ledger Entries";
                    RunPageView = where("Document Type" = filter(Payment),
                                        "Remaining Amount" = filter(< 0),
                                        "Applies-to ID" = filter(''));
                    ToolTip = 'Opens vendor ledger entries for all vendors with invoices that have not been paid yet.';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
            }
            group(Setup)
            {
                Caption = 'Setup';
                Image = Setup;
                action("Company Settings")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Company Settings';
                    Image = CompanyInformation;
                    RunObject = Page "Company Information";
                    ToolTip = 'Enter the company name, address, and bank information that will be inserted on your business documents.';
                }
                action("Assisted Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Assisted Setup';
                    Image = QuestionaireSetup;
                    RunObject = Page "Assisted Setup";
                    ToolTip = 'Set up core functionality such as sales tax, sending documents as email, and approval workflow by running through a few pages that guide you through the information.';
                }
                group("Services & Extensions")
                {
                    Caption = 'Services & Extensions';
                    Image = ServiceSetup;
                    action(Extensions)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Extensions';
                        Image = NonStockItemSetup;
                        RunObject = Page "Extension Management";
                        ToolTip = 'Install Extensions for greater functionality of the system.';
                    }
                    action("Service Connections")
                    {
                        ApplicationArea = Service;
                        Caption = 'Service Connections';
                        Image = ServiceTasks;
                        RunObject = Page "Service Connections";
                        ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
                    }
                }
            }
            group(ActionGroup117)
            {
            }
            group("Other rwtgReports")
            {
                Caption = 'OTHER REPOreRTS';
                Image = LotInfo;
                action("Bank Account regReconciliation")
                {
                    ApplicationArea = Basic;
                    Caption = '<Baernk Account regReconciliation>';
                    Image = "Report";
                   // RunObject = Report "Bank Account Reconciliation";
                    ToolTip = 'Executes the <Baernk Account regReconciliation> action.';
                }
            }
        }
        area(reporting)
        {
            group("FINANCE ")
            {
                group("Financial Reports")
                {
                    Image = LotInfo;
                    action("Balance Sheet")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Balance Sheet';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Balance Sheet";
                        ToolTip = 'View your company''s assets, liabilities, and equity.';
                    }
                    action("Income Statement")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Income Statement';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Income Statement";
                        ToolTip = 'View your company''s income and expenses.';
                    }
                    action("Statement of Cash Flows")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Cash Flows';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Statement of Cashflows";
                        ToolTip = 'View a financial statement that shows how changes in balance sheet accounts and income affect the company''s cash holdings, displayed for operating, investing, and financing activities respectively.';
                    }
                    action("Statement of Retained Earnings")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Retained Earnings';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        RunObject = Report "Retained Earnings Statement";
                        ToolTip = 'View a report that shows your company''s changes in retained earnings for a specified period by reconciling the beginning and ending retained earnings for the period, using information such as net income from the other financial statements.';
                    }
                }
                group("Other Reports")
                {
                    Caption = 'OTHER REPORTS';
                    Image = LotInfo;
                    action("Bank Account Reconciliation")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                     //   RunObject = Report "Bank Account Reconciliation";
                        ToolTip = 'Executes the Bank Account Reconciliation action.';
                    }
                    action("Fixed Asset Register")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Fixed Asset Register";
                        ToolTip = 'Executes the Fixed Asset Register action.';
                    }
                    action("Fixed Asset - List")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Fixed Asset - List";
                        ToolTip = 'Executes the Fixed Asset - List action.';
                    }
                    action("Fixed Assets List")
                    {
                        ApplicationArea = Basic;
                        Image = ListPage;
                        RunObject = Page "Fixed Asset List";
                        ToolTip = 'Executes the Fixed Assets action.';
                    }
                }
            }
            group(PROCUREMENT)
            {
                group("GENERAL PROCUREMENT")
                {
                    Image = HumanResources;
                    action("Tender Register")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Tender Register';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                       // RunObject = Report "Tender list";
                        ToolTip = 'Executes the Tender Register action.';
                    }
                    action("Annual Procurement Plan")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Annual Procurement Plan';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                       // RunObject = Report "Annual Procurement Plan";
                        ToolTip = 'Executes the Annual Procurement Plan action.';
                    }
                    action("Inventory Valuation")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Report "Inventory Valuation";
                        ToolTip = 'Executes the Inventory Valuation action.';
                    }
                    action("Committee Appointment")
                    {
                        ApplicationArea = Basic;
                        Image = Process;
                        Promoted = true;
                        //RunObject = Report "Tender Committee appointment";
                        ToolTip = 'Executes the Committee Appointment action.';
                    }
                    action("Supplier Confirmation Pending")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                     //   RunObject = Report "Vendor Profile Summary";
                        ToolTip = 'Executes the Supplier Confirmation Pending action.';
                    }
                    action("Disposal to Staff")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Classified Disposal';
                        Image = "report";
                        ///RunObject = Report "Classified Disposal List";
                        ToolTip = 'Executes the Classified Disposal action.';
                    }
                    action("Monthly Procurement Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Monthly Procurement Report';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //RunObject = Report UnknownReport5975;
                        Visible = false;
                        ToolTip = 'Executes the Monthly Procurement Report action.';
                    }
                }
                group(PPOA)
                {
                    Image = LotInfo;
                    action("Contracts Awarded")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Contracts Awarded';
                        Image = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = true;
                       // RunObject = Report "Contracts Awarded";
                        ToolTip = 'Executes the Contracts Awarded action.';
                    }
                    action("Contracts Ammendments")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Contracts Ammendments';
                        Image = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = true;
                       // RunObject = Report "Contracts Ammendments";
                        ToolTip = 'Executes the Contracts Ammendments action.';
                    }
                    action("Contract Variation Report")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        //RunObject = Report "Contracts Ammendments";
                        ToolTip = 'Executes the Contract Variation Report action.';
                    }
                    action("40% Resident Suppliers")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        //RunObject = Report "40% of Supplies from citizen";
                        ToolTip = 'Executes the 40% Resident Suppliers action.';
                    }
                    action("Agpo Tenders")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Agpo Tenders';
                        Image = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = true;
                       // RunObject = Report "Bid Response";
                        ToolTip = 'Executes the Agpo Tenders action.';
                    }
                }
                group("Preference & Reference")
                {
                    Image = RegisteredDocs;
                    action("Preference & Reservation Contracts")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Preference & Reservation Contracts';
                        Image = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = true;
                     //   RunObject = Report "Preference & Reservation Contr";
                        ToolTip = 'Executes the Preference & Reservation Contracts action.';
                    }
                    action("Preference & Reservation(Women)")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Preference & Reservation(Women)';
                        Image = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = true;
                     //   RunObject = Report "Preference & Reservation (Wome";
                        ToolTip = 'Executes the Preference & Reservation(Women) action.';
                    }
                    action("Preference & Reservation (Youth)")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Preference & Reservation (Youth)';
                        Image = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = true;
                    //    RunObject = Report "Preference & Reservation (Yout";
                        ToolTip = 'Executes the Preference & Reservation (Youth) action.';
                    }
                    action("Procurement IAC Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Procurement IAC Report';
                        Image = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = true;
                     ///   RunObject = Report "Procurement IAC Report";
                        ToolTip = 'Executes the Procurement IAC Report action.';
                    }
                }
            }
            group("HUMAN RESOURCE ")
            {
                group(Management)
                {
                    Caption = 'Payroll';
                    Image = ResourcePlanning;
                    action("Monthly PAYE ")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Monthly PAYE ';
                        Image = "Report";
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = "Report";
                        //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedIsBig = true;
                      //  RunObject = Report "Monthly PAYE Export";
                        ToolTip = 'Executes the Monthly PAYE  action.';
                    }
                    action(NHIF)
                    {
                        ApplicationArea = Basic;
                        Caption = 'NHIF';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //RunObject = Report NHIF;
                        ToolTip = 'Executes the NHIF action.';
                    }
                    action("Master Roll Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Master Roll Report';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                       // RunObject = Report "Master Roll Report";
                        ToolTip = 'Executes the Master Roll Report action.';
                    }
                    action("Exited Employee - List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Exited Employees';
                       // RunObject = Report UnknownReport69292;
                        ToolTip = 'Executes the Exited Employees action.';
                    }
                    action("Employee - Trial Balance ")
                    {
                        ApplicationArea = Basic;
                     //   RunObject = Report "Update Imprest";
                        ToolTip = 'Executes the Employee - Trial Balance  action.';
                    }
                }
                group(Reconciliation)
                {
                    Caption = 'Reconciliation';
                    Image = Reconcile;
                    action("Employees Removed from Payroll")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Employees Removed from Payroll';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                   //     RunObject = Report "Employees Removed";
                        ToolTip = 'Executes the Employees Removed from Payroll action.';
                    }
                    action("New Employees")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Employees';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //RunObject = Report "New Employees";
                        ToolTip = 'Executes the New Employees action.';
                    }
                    action("Payroll Reconciliation Summary")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Payroll Reconciliation Summary';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        //RunObject = Report "Payroll Reconciliation Summary";
                        ToolTip = 'Executes the Payroll Reconciliation Summary action.';
                    }
                    action("Payroll Reconciliation Details")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Payroll Reconciliation Details';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                       // RunObject = Report "Payroll Reconciliation Earnin";
                        ToolTip = 'Executes the Payroll Reconciliation Details action.';
                    }
                }
                group("Leave Management")
                {
                    Image = LotInfo;
                    action("HR Leave Applications List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Leave Applications List';
                        Image = "Report";
                     //   RunObject = Report "HR Leave Applications List";
                        ToolTip = 'Executes the HR Leave Applications List action.';
                    }
                    action("Leave Statistics")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Leave Statistics';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                       // RunObject = Report "HR Leave Statistics";
                        ToolTip = 'Executes the Leave Statistics action.';
                    }
                    action("Leave Applications")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Leave Applications';
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                       // RunObject = Report "HR Leave Applications List";
                        ToolTip = 'Executes the Leave Applications action.';
                    }
                    action("HR Leave Reimbursements")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "HR Leave Reimbursements";
                        ToolTip = 'Executes the HR Leave Reimbursements action.';
                    }
                }
            }
            group("Self Service Reports")
            {
                Caption = 'PAYMENTS';
                group(PAYMENTS)
                {
                    Caption = 'Imprest Reports';
                    Image = ReferenceData;
                    action("Unsurrenderred Imprests")
                    {
                        ApplicationArea = Basic;
                        Image = "report";
                     //   RunObject = Report "Update Imprest";
                        ToolTip = 'Executes the Unsurrenderred Imprests action.';
                    }
                    action("Aging Analysis Employee Imprest")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                     //   RunObject = Report "Posting-Application Report";
                        ToolTip = 'Executes the Aging Analysis Employee Imprest action.';
                    }
                    action("Imprest Memo")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Memo';
                        Image = "Report";
                        //RunObject = Report "Imprest Memo";
                        ToolTip = 'Executes the Imprest Memo action.';
                    }
                    action("Imprest Requisition")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Requisition';
                        Image = "Report";
                        //RunObject = Report "Imprest Requisition";
                        ToolTip = 'Executes the Imprest Requisition action.';
                    }
                    action("Imprest Surrender")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Surrender';
                        Image = "Report";
                        //RunObject = Report "Imprest Surrender";
                        ToolTip = 'Executes the Imprest Surrender action.';
                    }
                }
                group("Payment Documents")
                {
                    Caption = 'Payment Documents';
                    Image = ReferenceData;
                    action("Approved Staff Claims")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Staff Claims';
                        Image = "Report";
                        RunObject = Page "Approved Staff Claims";
                        ToolTip = 'Executes the Approved Staff Claims action.';
                    }
                    action("Approved Imprest Requisitions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Imprest Requisitions';
                        Image = "Report";
                        RunObject = Page "Approved Imprest Requisitions";
                        ToolTip = 'Executes the Approved Imprest Requisitions action.';
                    }
                    action("Approved Petty Cash Vouchers")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Petty Cash Vouchers';
                        Image = "Report";
                        RunObject = Page "Approved Petty Cash Vouchers";
                        ToolTip = 'Executes the Approved Petty Cash Vouchers action.';
                    }
                    action("Petty Cash Surrenders")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Petty Cash Surrenders';
                        Image = "Report";
                        RunObject = Page "Petty Cash Surrenders";
                        ToolTip = 'Executes the Petty Cash Surrenders action.';
                    }
                    action("Approved Payment Vouchers")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Page "Approved Payment Vouchers";
                        ToolTip = 'Executes the Approved Payment Vouchers action.';
                    }
                    action("Posted Imprest Requisitions")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        RunObject = Page "Posted Imprest Requisitions";
                        ToolTip = 'Executes the Posted Imprest Requisitions action.';
                    }
                }
            }
            group("M&E")
            {
                Caption = 'PERFORMANCE';
                group(Performance)
                {
                    Caption = 'Performance Management';
                    Image = ReferenceData;
                    action("Corporate Strategic Plan")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Corporate Strategic Plan';
                        Image = "Report";
                        RunObject = Page "Approved CSP Card";
                        ToolTip = 'Executes the Approved Corporate Strategic Plan action.';
                    }
                    action("Approved Annual Workplan")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Annual Workplan';
                        Image = "Report";
                        RunObject = Page "Approved Annual Workplan Card";
                        ToolTip = 'Executes the Approved Annual Workplan action.';
                    }
                    action("Board/Executive PC")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Board/Executive PC';
                        Image = "Report";
                     //   RunObject = Page "Board/Executive PC";
                        ToolTip = 'Executes the Board/Executive PC action.';
                    }
                }
            }
            group("Grants Management")
            {
                group("Grants Management.")
                {
                    action("Research Center List ")
                    {
                        ApplicationArea = Basic;
                    //    RunObject = Report "Research Center List";
                        ToolTip = 'Executes the Research Center List  action.';
                    }
                    action("Research Center Profile ")
                    {
                        ApplicationArea = Basic;
                      //  RunObject = Report "Research Center Profile";
                        ToolTip = 'Executes the Research Center Profile  action.';
                    }
                    action("Research Center Grants")
                    {
                        ApplicationArea = Basic;
                      //  RunObject = Report "Research Center Grants";
                        ToolTip = 'Executes the Research Center Grants action.';
                    }
                    action("Research Center Projects")
                    {
                        ApplicationArea = Basic;
                       // RunObject = Report "Research Center Projects";
                        ToolTip = 'Executes the Research Center Projects action.';
                    }
                    action("Research Center Assets ")
                    {
                        ApplicationArea = Basic;
                      //  RunObject = Report "Research Center Assets";
                        ToolTip = 'Executes the Research Center Assets  action.';
                    }
                    action("Project Financial Statement.")
                    {
                        ApplicationArea = Basic;
                    //    RunObject = Report UnknownReport65024;
                        ToolTip = 'Executes the Project Financial Statement. action.';
                    }
                    action("Project Financial Statement ")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Detailed Project Financial Statement';
                        ToolTip = 'Executes the Detailed Project Financial Statement action.';
                    }
                }
            }
            group("System Security")
            {
                Image = Administration;
                group("System Security1")
                {
                    Caption = 'System Security';
                    Image = Administration;
                    action("Change Log Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = Report "Change Log Entries";
                        ToolTip = 'Executes the Change Log Report action.';
                    }
                }
            }
            group("Risk Management")
            {
                Image = FiledPosted;
                group("Risk Management1")
                {
                    Caption = 'Risk Management';
                    Image = FiledPosted;
                    action("Risk Status")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Risk Monitoring Report';
                        Image = "Report";
                       // RunObject = Report "Risk Incident Logs";
                        ToolTip = 'Executes the Risk Monitoring Report action.';
                    }
                }
            }
        }
        area(navigation)
        {
            group(ActionGroup121)
            {
            }
        }
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
            action(Action14)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Action6)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Items';
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            }
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
            }
            action("User Setup")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'User Setup';
                Image = UserSetup;
                RunObject = Page "User Setup";
                ToolTip = 'Set up users and define their permissions.';
            }
            action("Approval User Setup")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Approval User Setup';
                RunObject = Page "Approval User Setup";
                ToolTip = 'View or edit information about workflow users who are involved in approval processes, such as approval amount limits for specific types of requests and substitute approvers to whom approval requests are delegated when the original approver is absent.';
            }
            action("Workflow User Groups")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Workflow User Groups';
                Image = Users;
                RunObject = Page "Workflow User Groups";
                ToolTip = 'View or edit the list of users that take part in workflows and which workflow user groups they belong to.';
            }
            action(Workflows)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Workflows';
                Image = ApprovalSetup;
                RunObject = Page Workflows;
                ToolTip = 'Set up or enable workflows that connect business-process tasks performed by different users. System tasks, such as automatic posting, can be included as steps in workflows, preceded or followed by user tasks. Requesting and granting approval to create new records are typical workflow steps.';
            }
        }
        area(sections)
        {
            group(ActionGroup39)
            {
                Caption = 'Finance';
                Image = Journals;
                ToolTip = 'Collect and make payments, prepare statements, and reconcile bank accounts.';
                action(GeneralJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Journals';
                    Image = Journal;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(General),
                                        Recurring = const(false));
                    ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
                }
                action(Action3)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Accounts';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Chart of Accounts";
                    ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
                }
                action("G/L Account Categories")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Account Categories';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "G/L Account Categories";
                    ToolTip = 'Personalize the structure of your financial statements by mapping general ledger accounts to account categories. You can create category groups by indenting subcategories under them. Each grouping shows a total balance. When you choose the Generate Account Schedules action, the account schedules for the underlying financial reports are updated. The next time you run one of these reports, such as the balance statement, new totals and subentries are added, based on your changes.';
                }
                action("G/L Budgets")
                {
                    ApplicationArea = Suite;
                    Caption = 'G/L Budgets';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "G/L Budget Names";
                    ToolTip = 'View summary information about the amount budgeted for each general ledger account in different time periods.';
                }
                action("Fixed Assets")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Assets';
                    RunObject = Page "Fixed Asset List";
                    ToolTip = 'Manage periodic depreciation of your machinery or machines, keep track of your maintenance costs, manage insurance policies related to fixed assets, and monitor fixed asset statistics.';
                }
                action("Account Schedules")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Account Schedules';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Account Schedule Names";
                    ToolTip = 'Get insight into the financial data stored in your chart of accounts. Account schedules analyze figures in G/L accounts, and compare general ledger entries with general ledger budget entries. For example, you can view the general ledger entries as percentages of the budget entries. Account schedules provide the data for core financial statements and views, such as the Cash Flow chart.';
                }
                action("Intrastat Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Intrastat Journals';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Intrastat Jnl. Batches";
                    ToolTip = 'Summarize the value of your purchases and sales with business partners in the EU for statistical purposes and prepare to send it to the relevant authority.';
                }
                action("Sales Budgets")
                {
                    ApplicationArea = SalesBudget;
                    Caption = 'Sales Budgets';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Budget Names Sales";
                    ToolTip = 'Enter item sales values of type amount, quantity, or cost for expected item sales in different time periods. You can create sales budgets by items, customers, customer groups, or other dimensions in your business. The resulting sales budgets can be reviewed here or they can be used in comparisons with actual sales data in sales analysis reports.';
                }
                action("Purchase Budgets")
                {
                    ApplicationArea = PurchaseBudget;
                    Caption = 'Purchase Budgets';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Budget Names Purchase";
                    ToolTip = 'Enter item purchases values of type amount, quantity, or cost for expected item purchases in different time periods. You can create purchase budgets by items, vendors, vendor groups, or other dimensions in your business. The resulting purchase budgets can be reviewed here or they can be used in comparisons with actual purchases data in purchase analysis reports.';
                }
                action("Sales Analysis Reports")
                {
                    ApplicationArea = SalesAnalysis;
                    Caption = 'Sales Analysis Reports';
                    RunObject = Page "Analysis Report Sale";
                    ToolTip = 'Analyze the dynamics of your sales according to key sales performance indicators that you select, for example, sales turnover in both amounts and quantities, contribution margin, or progress of actual sales against the budget. You can also use the report to analyze your average sales prices and evaluate the sales performance of your sales force.';
                }
                action("Purchase Analysis Reports")
                {
                    ApplicationArea = PurchaseAnalysis;
                    Caption = 'Purchase Analysis Reports';
                    RunObject = Page "Analysis Report Purchase";
                    ToolTip = 'Analyze the dynamics of your purchase volumes. You can also use the report to analyze your vendors'' performance and purchase prices.';
                }
                action("Inventory Analysis Reports")
                {
                    ApplicationArea = InventoryAnalysis;
                    Caption = 'Inventory Analysis Reports';
                    RunObject = Page "Analysis Report Inventory";
                    ToolTip = 'Analyze the dynamics of your inventory according to key performance indicators that you select, for example inventory turnover. You can also use the report to analyze your inventory costs, in terms of direct and indirect costs, as well as the value and quantities of your different types of inventory.';
                }
                action("VAT Reports")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'VAT Reports';
                    RunObject = Page "VAT Report List";
                    ToolTip = 'View VAT Reports.';
                }
                action(Currencies)
                {
                    ApplicationArea = Suite;
                    Caption = 'Currencies';
                    Image = Currency;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page Currencies;
                    ToolTip = 'View the different currencies that you trade in or update the exchange rates by getting the latest rates from an external service provider.';
                }
                action(Employees)
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Employee List";
                    ToolTip = 'View or modify employees'' details and related information, such as qualifications and pictures, or register and analyze employee absence. Keeping up-to-date records about your employees simplifies personnel tasks. For example, if an employee''s address changes, you register this on the employee card.';
                }
                action("VAT Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'VAT Statements';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "VAT Statement Names";
                    ToolTip = 'View a statement of posted VAT amounts, calculate your VAT settlement amount for a certain period, such as a quarter, and prepare to send the settlement to the tax authorities.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Suite;
                    Caption = 'Dimensions';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page Dimensions;
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
            }
            group("Cash Management")
            {
                Caption = 'Cash Management';
                ToolTip = 'Process incoming and outgoing payments. Set up bank accounts and service connections for electronic banking.';
                action("Cash Flow Forecasts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Forecasts';
                    RunObject = Page "Cash Flow Forecast List";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Chart of Cash Flow Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Cash Flow Accounts';
                    RunObject = Page "Chart of Cash Flow Accounts";
                    ToolTip = 'View a chart contain a graphical representation of one or more cash flow accounts and one or more cash flow setups for the included general ledger, purchase, sales, services, or fixed assets accounts.';
                }
                action("Cash Flow Manual Revenues")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Manual Revenues';
                    RunObject = Page "Cash Flow Manual Revenues";
                    ToolTip = 'Record manual revenues, such as rental income, interest from financial assets, or new private capital to be used in cash flow forecasting.';
                }
                action("Cash Flow Manual Expenses")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Manual Expenses';
                    RunObject = Page "Cash Flow Manual Expenses";
                    ToolTip = 'Record manual expenses, such as salaries, interest on credit, or planned investments to be used in cash flow forecasting.';
                }
                action(CashReceiptJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Receipt Journals';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const("Cash Receipts"),
                                        Recurring = const(false));
                    ToolTip = 'Register received payments by manually applying them to the related customer, vendor, or bank ledger entries. Then, post the payments to G/L accounts and thereby close the related ledger entries.';
                }
                action(PaymentJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Journals';
                    Image = Journals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(Payments),
                                        Recurring = const(false));
                    ToolTip = 'Register payments to vendors. A payment journal is a type of general journal that is used to post outgoing payment transactions to G/L, bank, customer, vendor, employee, and fixed assets accounts. The Suggest Vendor Payments functions automatically fills the journal with payments that are due. When payments are posted, you can export the payments to a bank file for upload to your bank if your system is set up for electronic banking. You can also issue computer checks from the payment journal.';
                }
                action(Action23)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Account List";
                    ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
                }
                action("Bank Acc. Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Acc. Statements';
                    Image = BankAccountStatement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Bank Account Statement List";
                    ToolTip = 'View statements for selected bank accounts. For each bank transaction, the report shows a description, an applied amount, a statement amount, and other information.';
                }
                action("Payment Recon. Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Recon. Journals';
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Pmt. Reconciliation Journals";
                    ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing a bank statement feed or file. In the payment reconciliation journal, incoming or outgoing payments on your bank are automatically, or semi-automatically, applied to their related open customer or vendor ledger entries. Any open bank account ledger entries related to the applied customer or vendor ledger entries will be closed when you choose the Post Payments and Reconcile Bank Account action. This means that the bank account is automatically reconciled for payments that you post with the journal.';
                }
                action("Direct Debit Collections")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Direct Debit Collections';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Direct Debit Collections";
                    ToolTip = 'Instruct your bank to withdraw payment amounts from your customer''s bank account and transfer them to your company''s account. A direct debit collection holds information about the customer''s bank account, the affected sales invoices, and the customer''s agreement, the so-called direct-debit mandate. From the resulting direct-debit collection entry, you can then export an XML file that you send or upload to your bank for processing.';
                }
                action("Payment Terms")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Terms';
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Payment Terms";
                    ToolTip = 'Set up the payment terms that you select from on customer cards to define when the customer must pay, such as within 14 days.';
                }
            }
            group(ActionGroup40)
            {
                Caption = 'Sales';
                Image = Sales;
                ToolTip = 'Make quotes, orders, and credit memos to customers. Manage customers and view transaction history.';
                action(Sales_CustomerList)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customers';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Customer List";
                    ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
                }
                action(Action129)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Items';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Item List";
                    ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit.';
                }
                action("Item Charges")
                {
                    ApplicationArea = Suite;
                    Caption = 'Item Charges';
                    RunObject = Page "Item Charges";
                    ToolTip = 'View or edit the codes for item charges that you can assign to purchase and sales transactions to include any added costs, such as freight, physical handling, and insurance that you incur when purchasing or selling items. This is important to ensure correct inventory valuation. For purchases, the landed cost of a purchased item consists of the vendor''s purchase price and all additional direct item charges that can be assigned to individual receipts or return shipments. For sales, knowing the cost of shipping sold items can be as vital to your company as knowing the landed cost of purchased items.';
                }
                action("Sales Quotes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Quotes';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Quotes";
                    ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
                }
                action("Sales Orders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Orders';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Order List";
                    ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
                }
                action("Blanket Sales Orders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Blanket Sales Orders';
                    Image = Reminder;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Blanket Sales Orders";
                    ToolTip = 'Use blanket sales orders as a framework for a long-term agreement between you and your customers to sell large quantities that are to be delivered in several smaller shipments over a certain period of time. Blanket orders often cover only one item with predetermined delivery dates. The main reason for using a blanket order rather than a sales order is that quantities entered on a blanket order do not affect item availability and thus can be used as a worksheet for monitoring, forecasting, and planning purposes..';
                }
                action("Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Invoices';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Invoice List";
                    ToolTip = 'Register your sales to customers and invite them to pay according to the delivery and payment terms by sending them a sales invoice document. Posting a sales invoice registers shipment and records an open receivable entry on the customer''s account, which will be closed when payment is received. To manage the shipment process, use sales orders, in which sales invoicing is integrated.';
                }
                action("Sales Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Credit Memos';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Credit Memos";
                    ToolTip = 'Revert the financial transactions involved when your customers want to cancel a purchase or return incorrect or damaged items that you sent to them and received payment for. To include the correct information, you can create the sales credit memo from the related posted sales invoice or you can create a new sales credit memo with copied invoice information. If you need more control of the sales return process, such as warehouse documents for the physical handling, use sales return orders, in which sales credit memos are integrated. Note: If an erroneous sale has not been paid yet, you can simply cancel the posted sales invoice to automatically revert the financial transaction.';
                }
                action("Sales Return Orders")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Sales Return Orders';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Return Order List";
                    ToolTip = 'Compensate your customers for incorrect or damaged items that you sent to them and received payment for. Sales return orders support warehouse documents for the item handling, the ability to return items from multiple sales documents with one return, and automatic creation of related sales credit memos or other return-related documents, such as a replacement sales order.';
                }
                action(Reminders)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reminders';
                    Image = Reminder;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Reminder List";
                    ToolTip = 'Remind customers about overdue amounts based on reminder terms and the related reminder levels. Each reminder level includes rules about when the reminder will be issued in relation to the invoice due date or the date of the previous reminder and whether interests are added. Reminders are integrated with finance charge memos, which are documents informing customers of interests or other money penalties for payment delays.';
                }
                action("Finance Charge Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Finance Charge Memos';
                    Image = FinChargeMemo;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Finance Charge Memo List";
                    ToolTip = 'Send finance charge memos to customers with delayed payments, typically following a reminder process. Finance charges are calculated automatically and added to the overdue amounts on the customer''s account according to the specified finance charge terms and penalty/interest amounts.';
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action("Posted Sales Return Receipts")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Posted Sales Return Receipts';
                    RunObject = Page "Posted Return Receipts";
                    ToolTip = 'Open the list of posted sales return receipts.';
                }
                action("Issued Reminders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Reminders';
                    Image = OrderReminder;
                    RunObject = Page "Issued Reminder List";
                    ToolTip = 'View the list of issued reminders.';
                }
                action("Issued Finance Charge Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Finance Charge Memos';
                    Image = PostedMemo;
                    RunObject = Page "Issued Fin. Charge Memo List";
                    ToolTip = 'View the list of issued finance charge memos.';
                }
            }
            group(ActionGroup41)
            {
                Caption = 'Purchasing';
                Image = AdministrationSalesPurchases;
                ToolTip = 'Manage purchase invoices and credit memos. Maintain vendors and their history.';
                action(Purchase_VendorList)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendors';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Vendor List";
                    ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
                }
                action("Incoming Documents")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Incoming Documents';
                    Gesture = None;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Incoming Documents";
                    ToolTip = 'Handle incoming documents, such as vendor invoices in PDF or as image files, that you can manually or automatically convert to document records, such as purchase invoices. The external files that represent incoming documents can be attached at any process stage, including to posted documents and to the resulting vendor, customer, and general ledger entries.';
                }
                action(Action131)
                {
                    ApplicationArea = Suite;
                    Caption = 'Item Charges';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Item Charges";
                    ToolTip = 'View or edit the codes for item charges that you can assign to purchase and sales transactions to include any added costs, such as freight, physical handling, and insurance that you incur when purchasing or selling items. This is important to ensure correct inventory valuation. For purchases, the landed cost of a purchased item consists of the vendor''s purchase price and all additional direct item charges that can be assigned to individual receipts or return shipments. For sales, knowing the cost of shipping sold items can be as vital to your company as knowing the landed cost of purchased items.';
                }
                action("Purchase Quotes")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Quotes';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Purchase Quotes";
                    ToolTip = 'Create purchase quotes to represent your request for quotes from vendors. Quotes can be converted to purchase orders.';
                }
                action("<Page Purchase Orders>")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Orders';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Purchase Order List";
                    ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action("Blanket Purchase Orders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Blanket Purchase Orders';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Blanket Purchase Orders";
                    ToolTip = 'Use blanket purchase orders as a framework for a long-term agreement between you and your vendors to buy large quantities that are to be delivered in several smaller shipments over a certain period of time. Blanket orders often cover only one item with predetermined delivery dates. The main reason for using a blanket order rather than a purchase order is that quantities entered on a blanket order do not affect item availability and thus can be used as a worksheet for monitoring, forecasting, and planning purposes.';
                }
                action("<Page Purchase Invoices>")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Invoices';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Purchase Invoices";
                    ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action("<Page Purchase Credit Memos>")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Credit Memos';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Purchase Credit Memos";
                    ToolTip = 'Create purchase credit memos to mirror sales credit memos that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. If you need more control of the purchase return process, such as warehouse documents for the physical handling, use purchase return orders, in which purchase credit memos are integrated. Purchase credit memos can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
                }
                action("Purchase Return Orders")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Purchase Return Orders';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Purchase Return Order List";
                    ToolTip = 'Create purchase return orders to mirror sales return documents that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. Purchase return orders enable you to ship back items from multiple purchase documents with one purchase return and support warehouse documents for the item handling. Purchase return orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
                }
                action("<Page Posted Purchase Invoices>")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action("<Page Posted Purchase Credit Memos>")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("<Page Posted Purchase Receipts>")
                {
                    ApplicationArea = Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Purchase Return Shipments")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Posted Purchase Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Open the list of posted purchase return shipments.';
                }
            }
            group(SetupAndExtensions)
            {
                Caption = 'Setup & Extensions';
                Image = Setup;
                ToolTip = 'Overview and change system and application settings, and manage extensions and services';
                action(Action104)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Assisted Setup';
                    Image = QuestionaireSetup;
                    RunObject = Page "Assisted Setup";
                    ToolTip = 'Set up core functionality such as sales tax, sending documents as email, and approval workflow by running through a few pages that guide you through the information.';
                }
                action("Manual Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Manual Setup';
                    RunObject = Page "Manual Setup";
                    ToolTip = 'Define your company policies for business departments and for general activities by filling setup windows manually.';
                }
                // action(General)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'General';
                //     RunObject = Page "Manual Setup";
                //     RunPageView = sorting(Name)
                //                   where(Area = filter(General));
                //     ToolTip = 'Fill in your official company information, and define general codes and information that is used across the business functionality, such as currencies and languages. ';
                // }
                // action(Finance)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Finance';
                //     RunObject = Page "Manual Setup";
                //     RunPageView = sorting(Name)
                //                   where(Area = filter(Finance));
                //     ToolTip = 'Define your general accounting policies, such as the allowed posting period and how payments are processed. Set up your default dimensions for financial analysis.';
                // }
                // action(Sales)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Sales';
                //     RunObject = Page "Manual Setup";
                //     RunPageView = sorting(Name)
                //                   where(Area = filter(Sales));
                //     ToolTip = 'Define your general policies for sales invoicing and returns, such as when to show credit and stockout warnings and how to post sales discounts. Set up your number series for creating customers and different sales documents.';
                // }
                // action(Purchasing)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Purchasing';
                //     RunObject = Page "Manual Setup";
                //     RunPageView = sorting(Name)
                //                   where(Area = filter(Purchasing));
                //     ToolTip = 'Define your general policies for purchase invoicing and returns, such as whether to require vendor invoice numbers and how to post purchase discounts. Set up your number series for creating vendors and different purchase documents.';
                // }
                // action(Jobs)
                // {
                //     ApplicationArea = Jobs;
                //     Caption = 'Jobs';
                //     RunObject = Page "Manual Setup";
                //     RunPageView = sorting(Name)
                //                   where(Area = filter(Jobs));
                //     ToolTip = 'Define a project activity by creating a job card with integrated job tasks and job planning lines, structured in two layers. The job task enables you to set up job planning lines and to post consumption to the job. The job planning lines specify the detailed use of resources, items, and various general ledger expenses.';
                // }
                action("Fixed Asset")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Asset';
                    RunObject = Page "Manual Setup";
                 //   RunPageView = sorting(Name)
                  //                where(Area = filter("Fixed Assets"));
                    ToolTip = 'Manage periodic depreciation of your machinery or machines, keep track of your maintenance costs, manage insurance policies related to fixed assets, and monitor fixed asset statistics.';
                }
                action(HR)
                {
                    ApplicationArea = BasicHR;
                    Caption = 'HR';
                    RunObject = Page "Manual Setup";
                //    RunPageView = sorting(Name)
                 //                 where(Area = filter(HR));
                    ToolTip = 'Set up number series for creating new employee cards and define if employment time is measured by days or hours.';
                }
                action(Inventory)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inventory';
                    RunObject = Page "Manual Setup";
                 //   RunPageView = sorting(Name)
                    //              where(Area = filter(Inventory));
                    ToolTip = 'Define your general inventory policies, such as whether to allow negative inventory and how to post and adjust item costs. Set up your number series for creating new inventory items or services.';
                }
                action(Service)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Service';
                    RunObject = Page "Manual Setup";
                //    RunPageView = sorting(Name)
               //                   where(Area = filter(Service));
                    ToolTip = 'Configure your company policies for service management.';
                }
                action(System)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'System';
                    RunObject = Page "Manual Setup";
                  //  RunPageView = sorting(Name)
                    //              where(Area = filter(System));
                    ToolTip = 'System';
                }
                action("Relationship Management")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Relationship Management';
                  //  RunObject = Page "Manual Setup";
                  //  RunPageView = sorting(Name)
                  //                where(Area = filter("Relationship Mngt"));
                    ToolTip = 'Set up business relations, configure sales cycles, campaigns, and interactions, and define codes for various marketing communication.';
                }
                action(Intercompany)
                {
                    ApplicationArea = Intercompany;
                    Caption = 'Intercompany';
                    RunObject = Page "Manual Setup";
                  //  RunPageView = sorting(Name)
                  //                where(Area = filter(Intercompany));
                    ToolTip = 'Configure intercompany processes, such as the inbox and outbox for business documents exchanged within your group.';
                }
                action(Action107)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Service Connections';
                    Image = ServiceTasks;
                    RunObject = Page "Service Connections";
                    ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
                }
                action(Action106)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Extensions';
                    Image = NonStockItemSetup;
                    RunObject = Page "Extension Management";
                    ToolTip = 'Install Extensions for greater functionality of the system.';
                }
                action(Action132)
                {
                    ApplicationArea = Suite;
                    Caption = 'Workflows';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page Workflows;
                    ToolTip = 'Set up or enable workflows that connect business-process tasks performed by different users. System tasks, such as automatic posting, can be included as steps in workflows, preceded or followed by user tasks. Requesting and granting approval to create new records are typical workflow steps.';
                }
            }
        }
    }
}

