#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56213 "Employee Self-Service RC"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1904652008; "Employee service Activities")
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
            action("Imprest Memo")
            {
                ApplicationArea = Basic;
                Caption = 'Imprest Memo';
                Image = "Report";
                //RunObject = Report "Imprest Memo";
                ToolTip = 'Executes the Imprest Memo action.';
            }
            action("Imprest Requisitions")
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
            separator(Action9)
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
            separator(Action14)
            {
            }
        }
        area(embedding)
        {
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
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Imprest Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Memos';
                    Image = PostedVoucherGroup;
                    RunObject = Page "Posted Imprest Memos";
                    ToolTip = 'Executes the Posted Imprest Memos action.';
                }
                action("Posted Imprest Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Requisitions';
                    Image = PostedServiceOrder;
                    RunObject = Page "Posted Imprest Requisitions";
                    ToolTip = 'Executes the Posted Imprest Requisitions action.';
                }
                action("Posted Imprest Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Surrender';
                    RunObject = Page "Imprest Surrenders";
                    ToolTip = 'Executes the Posted Imprest Surrender action.';
                }
            }
        }
        area(creation)
        {
            group("&SelfService")
            {
                Caption = '&SelfService';
                Image = Tools;
                action(Action17)
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
                    ToolTip = 'Executes the Imprest Requisition action.';
                }
                action(Action16)
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
}

