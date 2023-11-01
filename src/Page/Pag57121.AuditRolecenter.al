#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57121 "Audit Role center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group("Managers Role Centers")
            {
                part(Control1901197008; "Audit activities")
                {
                    ApplicationArea = Basic;
                }
                part(Control1907692008; "My Customers")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control1900724708)
            {
                part(Control17; "My Job Queue")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                part(Control1902476008; "My Vendors")
                {
                    ApplicationArea = Basic;
                }
                part(Control18; "Report Inbox Part")
                {
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
            action("A&ccount Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'A&ccount Schedule';
                Image = "Report";
                RunObject = Report "Account Schedule";
                ToolTip = 'Executes the A&ccount Schedule action.';
            }
            group("&Trial Balance")
            {
                Caption = '&Trial Balance';
                Image = Balance;
                action("&G/L Trial Balance")
                {
                    ApplicationArea = Basic;
                    Caption = '&G/L Trial Balance';
                    Image = "Report";
                    RunObject = Report "Trial Balance";
                    ToolTip = 'Executes the &G/L Trial Balance action.';
                }
                action("Bank &Detail Trial Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank &Detail Trial Balance';
                    Image = "Report";
                    RunObject = Report "Bank Acc. - Detail Trial Bal.";
                    ToolTip = 'Executes the Bank &Detail Trial Balance action.';
                }
                action("T&rial Balance/Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'T&rial Balance/Budget';
                    Image = "Report";
                    RunObject = Report "Trial Balance/Budget";
                    ToolTip = 'Executes the T&rial Balance/Budget action.';
                }
                action("Trial Balance by &Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Trial Balance by &Period';
                    Image = "Report";
                    RunObject = Report "Trial Balance by Period";
                    ToolTip = 'Executes the Trial Balance by &Period action.';
                }
                action("Closing Tria&l Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closing Tria&l Balance';
                    Image = "Report";
                    RunObject = Report "Closing Trial Balance";
                    ToolTip = 'Executes the Closing Tria&l Balance action.';
                }
            }
            action("&Fiscal Year Balance")
            {
                ApplicationArea = Basic;
                Caption = '&Fiscal Year Balance';
                Image = "Report";
                RunObject = Report "Fiscal Year Balance";
                ToolTip = 'Executes the &Fiscal Year Balance action.';
            }
            action("Balance C&omp. . Prev. Year")
            {
                ApplicationArea = Basic;
                Caption = 'Balance C&omp. . Prev. Year';
                Image = "Report";
                RunObject = Report "Balance Comp. - Prev. Year";
                ToolTip = 'Executes the Balance C&omp. . Prev. Year action.';
            }
            separator(Action49)
            {
            }
            action("&Aged Accounts Receivable")
            {
                ApplicationArea = Basic;
                Caption = '&Aged Accounts Receivable';
                Image = "Report";
                RunObject = Report "Aged Accounts Receivable";
                ToolTip = 'Executes the &Aged Accounts Receivable action.';
            }
            action("Aged Accou&nts Payable")
            {
                ApplicationArea = Basic;
                Caption = 'Aged Accou&nts Payable';
                Image = "Report";
                RunObject = Report "Aged Accounts Payable";
                ToolTip = 'Executes the Aged Accou&nts Payable action.';
            }
            action("Reconcile Cust. and &Vend. Accs")
            {
                ApplicationArea = Basic;
                Caption = 'Reconcile Cust. and &Vend. Accs';
                Image = "Report";
                RunObject = Report "Reconcile Cust. and Vend. Accs";
                ToolTip = 'Executes the Reconcile Cust. and &Vend. Accs action.';
            }
            separator(Action53)
            {
            }
            action("VAT Reg&istration No. Check")
            {
                ApplicationArea = Basic;
                Caption = 'VAT Reg&istration No. Check';
                Image = "Report";
                RunObject = Report "VAT Registration No. Check";
                ToolTip = 'Executes the VAT Reg&istration No. Check action.';
            }
            action("VAT E&xceptions")
            {
                ApplicationArea = Basic;
                Caption = 'VAT E&xceptions';
                Image = "Report";
                RunObject = Report "VAT Exceptions";
                ToolTip = 'Executes the VAT E&xceptions action.';
            }
            action("VAT State&ment")
            {
                ApplicationArea = Basic;
                Caption = 'VAT State&ment';
                Image = "Report";
                RunObject = Report "VAT Statement";
                ToolTip = 'Executes the VAT State&ment action.';
            }
            action("VAT - VI&ES Declaration Tax Auth")
            {
                ApplicationArea = Basic;
                Caption = 'VAT - VI&ES Declaration Tax Auth';
                Image = "Report";
                RunObject = Report "VAT- VIES Declaration Tax Auth";
                ToolTip = 'Executes the VAT - VI&ES Declaration Tax Auth action.';
            }
            action("VAT - VIES Declaration Dis&k")
            {
                ApplicationArea = Basic;
                Caption = 'VAT - VIES Declaration Dis&k';
                Image = "Report";
                RunObject = Report "VAT- VIES Declaration Disk";
                ToolTip = 'Executes the VAT - VIES Declaration Dis&k action.';
            }
            action("EC &Sales List")
            {
                ApplicationArea = Basic;
                Caption = 'EC &Sales List';
                Image = "Report";
                RunObject = Report "EC Sales List";
                ToolTip = 'Executes the EC &Sales List action.';
            }
        }
        area(embedding)
        {
            ToolTip = 'Collect and make payments, prepare statements, and manage reminders.';
            action("Chart of Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'Executes the Chart of Accounts action.';
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'Executes the Bank Accounts action.';
            }
            action(Customers)
            {
                ApplicationArea = Basic;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'Executes the Customers action.';
            }
            action(Balance)
            {
                ApplicationArea = Basic;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Customer List";
                RunPageView = where("Balance (LCY)" = filter(<> 0));
                ToolTip = 'Executes the Balance action.';
            }
            action(Vendors)
            {
                ApplicationArea = Basic;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                ToolTip = 'Executes the Vendors action.';
            }
            action(Action5)
            {
                ApplicationArea = Basic;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Vendor List";
                RunPageView = where("Balance (LCY)" = filter(<> 0));
                ToolTip = 'Executes the Balance action.';
            }
            action("Payment on Hold")
            {
                ApplicationArea = Basic;
                Caption = 'Payment on Hold';
                RunObject = Page "Vendor List";
                RunPageView = where(Blocked = filter(Payment));
                ToolTip = 'Executes the Payment on Hold action.';
            }
            action("VAT Statements")
            {
                ApplicationArea = Basic;
                Caption = 'VAT Statements';
                RunObject = Page "VAT Statement Names";
                ToolTip = 'Executes the VAT Statements action.';
            }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Invoices';
                RunObject = Page "Purchase Invoices";
                ToolTip = 'Executes the Purchase Invoices action.';
            }
            action("Purchase Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                ToolTip = 'Executes the Purchase Orders action.';
            }
            action("Sales Invoices")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Invoices';
                Image = Invoice;
                RunObject = Page "Sales Invoice List";
                ToolTip = 'Executes the Sales Invoices action.';
            }
            action("Sales Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
                ToolTip = 'Executes the Sales Orders action.';
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                RunObject = Page "Requests to Approve";
                ToolTip = 'Executes the Approvals action.';
            }
            action("Cash Receipt Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Cash Receipt Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const("Cash Receipts"),
                                    Recurring = const(false));
                ToolTip = 'Executes the Cash Receipt Journals action.';
            }
            action("Payment Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Payment Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(Payments),
                                    Recurring = const(false));
                ToolTip = 'Executes the Payment Journals action.';
            }
            action("General Journals")
            {
                ApplicationArea = Basic;
                Caption = 'General Journals';
                Image = Journal;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(General),
                                    Recurring = const(false));
                ToolTip = 'Executes the General Journals action.';
            }
            action("Recurring General Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Recurring General Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(General),
                                    Recurring = const(true));
                ToolTip = 'Executes the Recurring General Journals action.';
            }
            action("Intrastat Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Intrastat Journals';
                RunObject = Page "Intrastat Jnl. Batches";
                ToolTip = 'Executes the Intrastat Journals action.';
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View posted invoices and credit memos, and analyze G/L registers.';
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
            group(ActionGroup22)
            {
                Caption = 'Approvals';
                ToolTip = 'Request approval of your documents, cards, or journal lines or, as the approver, approve requests made by other users.';
                action("Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Requests Sent for Approval';
                    Image = Approvals;
                    RunObject = Page "Approval Entries";
                    RunPageView = sorting("Record ID to Approve", "Workflow Step Instance ID", "Sequence No.")
                                  order(ascending)
                                  where(Status = filter(Open));
                    ToolTip = 'Executes the Requests Sent for Approval action.';
                }
                action(RequestsToApprove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requests to Approve';
                    Image = Approvals;
                    RunObject = Page "Requests to Approve";
                    ToolTip = 'Executes the Requests to Approve action.';
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                Image = Administration;
                action(Currencies)
                {
                    ApplicationArea = Basic;
                    Caption = 'Currencies';
                    Image = Currency;
                    RunObject = Page Currencies;
                    ToolTip = 'Executes the Currencies action.';
                }
                action("Accounting Periods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accounting Periods';
                    Image = AccountingPeriods;
                    RunObject = Page "Accounting Periods";
                    ToolTip = 'Executes the Accounting Periods action.';
                }
                action("Number Series")
                {
                    ApplicationArea = Basic;
                    Caption = 'Number Series';
                    RunObject = Page "No. Series";
                    ToolTip = 'Executes the Number Series action.';
                }
            }
        }
        area(creation)
        {
            action("C&ustomer")
            {
                ApplicationArea = Basic;
                Caption = 'C&ustomer';
                Image = Customer;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Customer Card";
                RunPageMode = Create;
                ToolTip = 'Executes the C&ustomer action.';
            }
            action("Sales &Invoice")
            {
                ApplicationArea = Basic;
                Caption = 'Sales &Invoice';
                Image = Invoice;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
                ToolTip = 'Executes the Sales &Invoice action.';
            }
            action("Cash Receipt")
            {
                ApplicationArea = Basic;
                Caption = 'Cash Receipt';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page Receipt;
                RunPageMode = Create;
                ToolTip = 'Executes the Cash Receipt action.';
            }
            action("Sales &Fin. Charge Memo")
            {
                ApplicationArea = Basic;
                Caption = 'Sales &Fin. Charge Memo';
                Image = FinChargeMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Finance Charge Memo";
                RunPageMode = Create;
                ToolTip = 'Executes the Sales &Fin. Charge Memo action.';
            }
            action("Sales &Reminder")
            {
                ApplicationArea = Basic;
                Caption = 'Sales &Reminder';
                Image = Reminder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page Reminder;
                RunPageMode = Create;
                ToolTip = 'Executes the Sales &Reminder action.';
            }
            separator(Action554)
            {
            }
            action("&Vendor")
            {
                ApplicationArea = Basic;
                Caption = '&Vendor';
                Image = Vendor;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Vendor Card";
                RunPageMode = Create;
                ToolTip = 'Executes the &Vendor action.';
            }
            action("&Purchase Invoice")
            {
                ApplicationArea = Basic;
                Caption = '&Purchase Invoice';
                Image = Invoice;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Invoice";
                RunPageMode = Create;
                ToolTip = 'Executes the &Purchase Invoice action.';
            }
        }
        area(processing)
        {
            separator(Action67)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Cash Re&ceipt Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Cash Re&ceipt Journal';
                Image = CashReceiptJournal;
                RunObject = Page "Cash Receipt Journal";
                ToolTip = 'Executes the Cash Re&ceipt Journal action.';
            }
            action("Payment &Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Payment &Journal';
                Image = PaymentJournal;
                RunObject = Page "Payment Journal";
                ToolTip = 'Executes the Payment &Journal action.';
            }
            action("Payment Registration")
            {
                ApplicationArea = Basic;
                Caption = 'Payment Registration';
                Image = Payment;
                RunObject = Page "Payment Registration";
                ToolTip = 'Executes the Payment Registration action.';
            }
            separator(Action77)
            {
            }
            action("B&ank Account Reconciliations")
            {
                ApplicationArea = Basic;
                Caption = 'B&ank Account Reconciliations';
                Image = BankAccountRec;
                RunObject = Page "Bank Acc. Reconciliation";
                ToolTip = 'Executes the B&ank Account Reconciliations action.';
            }
            action("Adjust E&xchange Rates")
            {
                ApplicationArea = Basic;
                Caption = 'Adjust E&xchange Rates';
                Ellipsis = true;
                Image = AdjustExchangeRates;
                RunObject = Report "Adjust Exchange Rates";
                ToolTip = 'Executes the Adjust E&xchange Rates action.';
            }
            action("Post Inventor&y Cost to G/L")
            {
                ApplicationArea = Basic;
                Caption = 'Post Inventor&y Cost to G/L';
                Ellipsis = true;
                Image = PostInventoryToGL;
                RunObject = Report "Post Inventory Cost to G/L";
                ToolTip = 'Executes the Post Inventor&y Cost to G/L action.';
            }
            action("Calc. and Pos&t VAT Settlement")
            {
                ApplicationArea = Basic;
                Caption = 'Calc. and Pos&t VAT Settlement';
                Ellipsis = true;
                Image = SettleOpenTransactions;
                RunObject = Report "Calc. and Post VAT Settlement";
                ToolTip = 'Executes the Calc. and Pos&t VAT Settlement action.';
            }
            separator(Action84)
            {
                Caption = 'Administration';
                IsHeader = true;
            }
            action("Sa&les && Receivables Setup")
            {
                ApplicationArea = Basic;
                Caption = 'Sa&les && Receivables Setup';
                Image = Setup;
                RunObject = Page "Sales & Receivables Setup";
                ToolTip = 'Executes the Sa&les && Receivables Setup action.';
            }
            separator(Action89)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic;
                Caption = 'Navi&gate';
                Image = Navigate;
                RunObject = Page Navigate;
                ToolTip = 'Executes the Navi&gate action.';
            }
        }
    }
}

