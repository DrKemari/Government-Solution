#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56214 "Employee service Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Service Cue";

    layout
    {
        area(content)
        {
            cuegroup("Imprest Applications & Processing")
            {
                Caption = 'Imprest Applications & Processing';
                field("Imprest Request-Inprocess"; Rec."Imprest Request-Inprocess")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Imprest Requisitions";
                    ToolTip = 'Specifies the value of the Imprest Request-Inprocess field.';
                }
                field("Imprest Requisition-Aproved"; Rec."Imprest Requisition-Aproved")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approved Imprest Requisitions";
                    ToolTip = 'Specifies the value of the Imprest Requisition-Aproved field.';
                }
                field("Imprest Request-P"; Rec."Imprest Request-P")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Requisitions';
                    ToolTip = 'Specifies the value of the Posted Imprest Requisitions field.';
                }

                actions
                {
                    action("New Imprest Memo")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Imprest Memo';
                        Image = Document;
                        RunObject = Page "Imprest Memo";
                        RunPageMode = Create;
                        ToolTip = 'Executes the New Imprest Memo action.';
                    }
                    action("New Imprest Surrender Memo")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Imprest Surrender Memo';
                        RunObject = Page "Imprest Surr Memo card";
                        RunPageMode = Create;
                        Visible = false;
                        ToolTip = 'Executes the New Imprest Surrender Memo action.';
                    }
                }
            }
            cuegroup("Leave Applications ")
            {
                Caption = 'Leave Applications ';
                field("Leave Application-Inprocess"; Rec."Leave Application-Inprocess")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Leave Applications List";
                    ToolTip = 'Specifies the value of the Leave Application-Inprocess field.';
                }
                field("Leave Application-Approved"; Rec."Leave Application-Approved")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "My Approved Leave Applications";
                    ToolTip = 'Specifies the value of the Leave Application-Approved field.';
                }

                actions
                {
                    action("New Imprest Surrender")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Imprest Surrender';
                        Image = Document;
                        RunObject = Page "Imprest Surrender";
                        RunPageMode = Create;
                        ToolTip = 'Executes the New Imprest Surrender action.';
                    }
                }
            }
            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies the value of the Requests to Approve field.';
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approval Entries";
                    ToolTip = 'Specifies the value of the Requests Sent for Approval field.';
                }

                actions
                {
                    action("New Purchase Requisition")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Purchase Requisition';
                        RunObject = Page "Purchase Requisition Card";
                        RunPageMode = Create;
                        ToolTip = 'Executes the New Purchase Requisition action.';
                    }
                    action("New Leave Application")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Leave Application';
                        RunObject = Page "Leave Application";
                        RunPageMode = Create;
                        ToolTip = 'Executes the New Leave Application action.';
                    }
                }
            }
            cuegroup(Control2)
            {
                field("Fleet Requisition List>"; Page::"Fleet Requisition List")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Fleet Requisition List";
                    LookupPageID = "Fleet Requisition List";
                    ToolTip = 'Specifies the value of the Page::Fleet Requisition List field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetRespCenterFilter;
        Rec.SetRange("Date Filter", 0D, WorkDate);
        Rec.SetFilter("User ID Filter", '=%1', UserId);
    end;
}

#pragma implicitwith restore

