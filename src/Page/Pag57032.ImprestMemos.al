#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57032 "Imprest Memos"
{
    ApplicationArea = Basic;
    CardPageID = "Imprest Memo";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = filter(Open | "Pending Approval"),
                            Posted = const(false),
                            "Document Type" = const("Imprest Memo"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Objective field.';
                }
                field("Terms of Reference"; TermsText)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the TermsText field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor field.';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000012; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000013; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000014; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                begin
                    //if //ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnSendImpMemoForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelSalesApprovalRequest(SalesRec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    //Ushindi changes

                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57001, true, true, Rec);
                    Rec.Reset;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Accounts User"=FALSE THEN
        // SETRANGE("User ID",USERID);
        // END
        /*
        CALCFIELDS("Terms of Reference");
        "Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TOR.GETSUBTEXT(TermsText,1) ;
        */

    end;

    trigger OnInit()
    begin
        //
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."Accounts User"=FALSE THEN
        // SETRANGE("User ID",USERID);
        // END

        /*
        CALCFIELDS("Terms of Reference");
        "Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TOR.GETSUBTEXT(TermsText,1) ;
        */

    end;

    var
        Instr: InStream;
        TOR: BigText;
        Outstr: OutStream;
        TermsText: Text;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SalesRec: Record "Sales Header";
        OpenApprovalEntriesExist: Boolean;
        UserSetup: Record "User Setup";

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

