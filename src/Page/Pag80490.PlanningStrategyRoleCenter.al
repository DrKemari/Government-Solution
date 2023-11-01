#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80490 "Planning &Strategy Role Center"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control10;"Headline RC Business Manager")
            {
                ApplicationArea = Basic,Suite;
            }
            part(Control9;"Planning & Strategy Activities")
            {
                AccessByPermission = TableData "Activities Cue"=I;
                ApplicationArea = Basic,Suite;
            }
            part(Control6;"Headline RC Business Manager")
            {
                ApplicationArea = Basic,Suite;
            }
            part(Control5;"Help And Chart Wrapper")
            {
               // AccessByPermission = TableData "Assisted Setup"=I;
                ApplicationArea = Basic,Suite;
                Caption = '';
                //ToolTip = 'Specifies the view of your business assistance';
            }
            part(Control4;"Power BI Report Spinner Part")
            {
                AccessByPermission = TableData "Power BI User Configuration"=I;
                ApplicationArea = Basic,Suite;
            }
            part(Control3;"O365 Link to Financials")
            {
                ApplicationArea = Invoicing;
                Caption = ' ';
            }
            part(Control2;"Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox"=IMD;
                ApplicationArea = Basic,Suite;
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
                }
                action("Imprest Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Requisition';
                    Image = NewDocument;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Requisition";
                    RunPageMode = Create;
                }
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
                    AccessByPermission = TableData Customer=IMD;
                    ApplicationArea = Basic,Suite;
                    Caption = 'Funding Agencies';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageMode = Create;
                    ToolTip = 'Register a new =Funding Agent';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                group("Grants Reports")
                {
                    Caption = 'Grants Reports';
                    Image = ReferenceData;
                }
                group("Self Service Reports")
                {
                    Caption = 'Self Service Reports';
                    Image = ReferenceData;
                }
            }
        }
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
        }
        area(sections)
        {
            group("My Request")
            {
                Caption = 'My Request';
                action("Imprest Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memos';
                    RunObject = Page "Imprest Memos";
                }
                action("<Page Project Imprest Requisition>")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Requisitions';
                    Image = Quote;
                    RunObject = Page "Imprest Requisitions";
                }
                action("My Store Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Store Requisitions';
                    Image = Document;
                    RunObject = Page "Store Requisitions";
                }
                action("My Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Surrenders';
                    Image = Document;
                    RunObject = Page "Imprest Surrenders";
                }
                action("My Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Leave Applications';
                    Image = ServiceCode;
                    RunObject = Page "Leave Applications List";
                }
                action("ICT Helpdesk Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Helpdesk Request';
                    Enabled = false;
                    Image = SendTo;
                    RunObject = Page "ICT Helpdesk Request List";
                    Visible = false;
                }
                action("My Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Purchase Requisitions';
                    Image = Loaners;
                    RunObject = Page "Purchase Requisitions";
                }
                action("Fleet Requisition List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Fleet Requisition List";
                }
                action(Items)
                {
                    ApplicationArea = Basic;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Item List";
                }
            }
            group("My Approved Requests")
            {
                action("My Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My Approved Leave Applications";
                }
                action("Approved Imprest Memos")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Imprest Memos";
                }
                action("Approved Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Imprest Surrenders";
                }
                action("Approved Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Purchase Requisition";
                }
            }
            group("Target Setting")
            {
                Image = Travel;
                action("Annual Strategy Workplans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Corporate Annual Workplan';
                    RunObject = Page "Annual Strategy Workplans";
                }
                action("Functional/Operational PCs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Draft Awp Cascading Templates';
                    RunObject = Page "Functional/Operational PCs";
                }
                action("Directors Perfomance Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'DCS annual Workplan';
                    RunObject = Page "Directors Perfomance Contracts";
                }
                action("Departments\Centers PCs ")
                {
                    ApplicationArea = Basic;
                    Caption = 'HOD Annual Workplans';
                    RunObject = Page "Departments\Centers PCs";
                }
                action("Individual Scorecards")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Annual workplan';
                    RunObject = Page "Individual Scorecards";
                }
            }
            group("Performance Mornitoring")
            {
                action("Performance Diary Logs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Performance Reporting';
                    RunObject = Page "Performance Diary Logs";
                }
            }
        }
    }
}

