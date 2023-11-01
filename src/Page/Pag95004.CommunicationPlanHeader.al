#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95004 "Communication Plan Header"
{
    PageType = Card;
    SourceTable = "Communication Plan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Work Execution Plan ID"; Rec."Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Execution Plan ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary MIssion"; Rec."Primary MIssion")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary MIssion field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("No. Of Planned Meetings"; Rec."No. Of Planned Meetings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Planned Meetings field.';
                }
                field("No. Of Meetings Held"; Rec."No. Of Meetings Held")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Meetings Held field.';
                }
                field("No. Of Project Report"; Rec."No. Of Project Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Project Report field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date Time field.';
                }
            }
            part(Control19; "Communication Plan Lines")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Communication Plan Objective")
            {
                ApplicationArea = Basic;
                Image = OpenWorksheet;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Communication Plan Objectives";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No");
                ToolTip = 'Executes the Communication Plan Objective action.';
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
        }
    }
}

#pragma implicitwith restore

