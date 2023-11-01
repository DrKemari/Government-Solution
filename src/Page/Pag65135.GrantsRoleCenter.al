#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65135 "Grants  Role Center"
{
    // CurrPage."Help And Setup List".ShowFeatured;

    Caption = 'Manager''s  Role Center', Comment = '{Dependency=Match,"ProfileDescription_SMALLBUSINESS"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control23; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control22; "Grant Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            part(Control21; "Help And Chart Wrapper")
            {
                //AccessByPermission = TableData "Assisted Setup" = I;
                ApplicationArea = Basic, Suite;
                Caption = '';
                ToolTip = 'Specifies the view of your business assistance';
            }
            part(Control19; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Favorite Accounts';
            }
            part(Control18; "Trial Balance")
            {
                AccessByPermission = TableData "G/L Entry" = R;
                ApplicationArea = Basic, Suite;
            }
            part(Control17; "Power BI Report Spinner Part")
            {
                AccessByPermission = TableData "Power BI User Configuration" = I;
                ApplicationArea = Basic, Suite;
            }
            part(Control15; "Team Member Activities No Msgs")
            {
                ApplicationArea = Suite;
            }
            part(Control14; "O365 Link to Financials")
            {
                ApplicationArea = Invoicing;
                Caption = ' ';
            }
            part(Control12; "Report Inbox Part")
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
            action("User Task List")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Tasks';
                RunObject = Page "User Task List";
                ToolTip = 'Executes the Assign Tasks action.';
            }
            group("&SelfService")
            {
                Caption = '&SelfService';
                Image = Tools;
                action("Imprest Memo")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memo';
                    Image = New;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Memo";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Imprest Memo action.';
                }
                // action("Imprest Requisition")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Imprest Requisition';
                //     Image = NewDocument;
                //     Promoted = false;
                //     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedCategory = Process;
                //     RunObject = Page "Imprest Requisition";
                //     RunPageMode = Create;
                //     ToolTip = 'Executes the Imprest Requisition action.';
                // }
                action("Imprest Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    Image = NewDocument;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Surrender";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Imprest Surrender action.';
                }
                action("Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application';
                    Image = Document;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Leave Application";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Leave Application action.';
                }
                action("Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition';
                    Image = Document;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Purchase Requisition Card";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Purchase Requisition action.';
                }
            }
        }
        area(processing)
        {
            group(New)
            {
                Caption = 'New';
                Image = New;
                action("Funding Agencies")
                {
                    AccessByPermission = TableData Customer = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Funding Agencies';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageMode = Create;
                    RunPageView = where("Funding Class" = const(Grant));
                    ToolTip = 'Register a new =Funding Agent';
                }
                action("Collaborator & Partners")
                {
                    ApplicationArea = Basic;
                    Caption = 'Collaborator & Partners';
                    RunObject = Page "Contact Card";
                    ToolTip = 'Executes the Collaborator & Partners action.';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                group("Grants Reports")
                {
                    Caption = 'Grants Reports';
                    Image = ReferenceData;
                    // action("Research Centers")
                    // {
                    //     ApplicationArea = Basic;
                    //     RunObject = Report "Research Center List";
                    //     ToolTip = 'Executes the Research Centers action.';
                    // }
                    // action("Funding Announcements")
                    // {
                    //     ApplicationArea = Basic;
                    //     RunObject = Report "FOA List";
                    //     ToolTip = 'Executes the Funding Announcements action.';
                    // }
                    // action("Research Center Grants")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Grants Per Research Center';
                    //     RunObject = Report "Research Center Grants";
                    //     ToolTip = 'Executes the Grants Per Research Center action.';
                    // }
                    // action("Research Center Projects")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Projects Per Research Center';
                    //     RunObject = Report "Research Center Projects";
                    //     ToolTip = 'Executes the Projects Per Research Center action.';
                    // }
                }
                group("Self Service Reports")
                {
                    Caption = 'Self Service Reports';
                    Image = ReferenceData;
                    action(Action37)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Memo';
                        Image = "Report";
                        //RunObject = Report "Imprest Memo";
                        ToolTip = 'Executes the Imprest Memo action.';
                    }
                    // action("Imprest Requisition")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Imprest Requisition';
                    //     Image = "Report";
                    //     //RunObject = Report "Imprest Requisition";
                    //     ToolTip = 'Executes the Imprest Requisition action.';
                    // }
                    action(Action35)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Surrender';
                        Image = "Report";
                        //RunObject = Report "Imprest Surrender";
                        ToolTip = 'Executes the Imprest Surrender action.';
                    }
                    separator(Action33)
                    {
                    }
                    action(" Leave Application Print Out")
                    {
                        ApplicationArea = Basic;
                        Caption = ' Leave Application Print Out';
                        Image = "Report";
                        //RunObject = Report "Leave Application";
                        ToolTip = 'Executes the  Leave Application Print Out action.';
                    }
                    separator(Action31)
                    {
                    }
                }
            }
        }
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
            action("Research Center List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Research Centers';
                RunObject = Page "Research Center List";
                ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
            }
            action("Research Program List")
            {
                ApplicationArea = Basic;
                Caption = 'Research Programs';
                RunObject = Page "Research Program List";
                ToolTip = 'Executes the Research Programs action.';
            }
            action(Researchers)
            {
                ApplicationArea = Basic;
                Caption = 'Researchers';
                RunObject = Page "Researcher List";
                ToolTip = 'Executes the Researchers action.';
            }
            action("Admin List ")
            {
                ApplicationArea = Basic;
                Caption = 'Grant Administrators';
                RunObject = Page "Admin List";
                ToolTip = 'Executes the Grant Administrators action.';
            }
            action("Contact List")
            {
                ApplicationArea = Basic;
                Caption = 'Collaborators & Partners';
                RunObject = Page "Contact List";
                ToolTip = 'Executes the Collaborators & Partners action.';
            }
            action("Funding Agency List")
            {
                ApplicationArea = Basic;
                Caption = 'Funding Agencies';
                RunObject = Page "Funding Agency List";
                ToolTip = 'Executes the Funding Agencies action.';
            }
        }
        area(sections)
        {
            group("Pre-Award")
            {
                Caption = 'Pre-Award';
                Image = Sales;
                ToolTip = 'Make quotes, orders, and credit memos to customers. Manage customers and view transaction history.';
            }
            group("My Request")
            {
                Caption = 'My Request';
                action("Imprest Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memos';
                    RunObject = Page "Imprest Memos";
                    ToolTip = 'Executes the Imprest Memos action.';
                }
                action("<Page Project Imprest Requisition>")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Requisitions';
                    Image = Quote;
                    RunObject = Page "Imprest Requisitions";
                    ToolTip = 'Executes the My Imprest Requisitions action.';
                }
                action("My Store Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Store Requisitions';
                    Image = Document;
                    RunObject = Page "Store Requisitions";
                    ToolTip = 'Executes the My Store Requisitions action.';
                }
                action("My Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Surrenders';
                    Image = Document;
                    RunObject = Page "Imprest Surrenders";
                    ToolTip = 'Executes the My Imprest Surrenders action.';
                }
                action("My Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Leave Applications';
                    Image = ServiceCode;
                    RunObject = Page "Leave Applications List";
                    ToolTip = 'Executes the My Leave Applications action.';
                }
                action("ICT Helpdesk Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Helpdesk Request';
                    Enabled = false;
                    Image = SendTo;
                    RunObject = Page "ICT Helpdesk Request List";
                    Visible = false;
                    ToolTip = 'Executes the ICT Helpdesk Request action.';
                }
                action("My Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Purchase Requisitions';
                    Image = Loaners;
                    RunObject = Page "Purchase Requisitions";
                    ToolTip = 'Executes the My Purchase Requisitions action.';
                }
                action("Fleet Requisition List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Fleet Requisition List";
                    ToolTip = 'Executes the Fleet Requisition List action.';
                }
                action(Items)
                {
                    ApplicationArea = Basic;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Item List";
                    ToolTip = 'Executes the Items action.';
                }
            }
            group("My Approved Requests")
            {
                action("My Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My Approved Leave Applications";
                    ToolTip = 'Executes the My Approved Leave Applications action.';
                }
                action("Approved Imprest Memos")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Imprest Memos";
                    ToolTip = 'Executes the Approved Imprest Memos action.';
                }
                action("Approved Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Imprest Surrenders";
                    ToolTip = 'Executes the Approved Imprest Surrenders action.';
                }
                action("Approved Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Purchase Requisition";
                    ToolTip = 'Executes the Approved Purchase Requisition action.';
                }
            }
        }
    }
}

