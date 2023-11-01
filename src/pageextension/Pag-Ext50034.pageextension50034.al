#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50034 "pageextension50034" extends "G/L Budget Names"
{
    layout
    {
        addafter(Description)
        {
            field("Budget Type"; Rec."Budget Type")
            {
                ApplicationArea = Basic;
            }
            field("Original Budget"; Rec."Original Budget")
            {
                ApplicationArea = Basic;
            }
            field("Approval Status"; Rec."Approval Status")
            {
                ApplicationArea = Basic;
                Editable = true;
            }
        }
        addbefore(Control1900383207)
        {


            part("Attached Documents"; "Document Attachments")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(95),
                              "No." = FIELD(Name);
            }

        }


    }
    actions
    {
        addafter(ReportTrialBalance)
        {
            action("Original/Supplimentary")
            {
                ApplicationArea = Suite;
                Caption = 'Original/Supplimentary';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'View budget details in relation to the supplimentary budget.';

                trigger OnAction()
                begin
                    Rec.SetRange(Name, Rec.Name);
                    Report.Run(57008, true, false, Rec);
                end;
            }
            separator(Action20)
            {
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = true;

                trigger OnAction()
                begin
                    //if //ApprovalsMgmt.OnSendICTIssuanceForApproval(Rec) then
                    //ApprovalsMgmt.OnSendBudgetForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = true;

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    //ApprovalsMgmt.CheckInspectionWorkflowEnabled(Rec);
                end;
            }
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    ApprovalEntries.Setfilters(Database::"G/L Budget Name", 31, Rec.Name);
                    ApprovalEntries.Run;
                end;
            }
        }
    }

    var
        GLBudgetEntry: Record "G/L Budget Entry";
        GLAccount: Record "G/L Account";
        ApprovalEntries: Page "Approval Entries";
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

#pragma implicitwith restore

