#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59103 "Issued File Requsition card"
{
    Caption = 'Approved File Requsition Card';
    PageType = Card;
    SourceTable = "File Movement Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field("Responsiblity Center"; Rec."Responsiblity Center")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Responsiblity Center field.';
                }
                field("Duration Requested"; Rec."Duration Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration Requested field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Expected Return Date"; Rec."Expected Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Return Date field.';
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
                field("Date Retrieved"; Rec."Date Retrieved")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Issued';
                    ToolTip = 'Specifies the value of the Date Issued field.';
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By field.';
                }
                field("Issued By Name"; Rec."Issued By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By Name field.';
                }
                field("File Movement Status"; Rec."File Movement Status")
                {
                    ApplicationArea = Basic;
                    OptionCaption = '<Open,Issued,Returned>';
                    ToolTip = 'Specifies the value of the File Movement Status field.';
                }
            }
            part(Control1000000023; "File Movement Line App")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    DocumentType := Documenttype::"File Movement";
                    ApprovalEntries.Setfilters(Database::"File Movement Header", DocumentType, Rec."No.");
                    ApprovalEntries.Run;
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = true;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                begin
                    //OnSend Approval
                    // //if //ApprovalsMgmt.CheckFileMovementApprovalWorkflowEnabled(Rec) THEN
                    //  //ApprovalsMgmt.OnSendFileMovementDocForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                begin
                    // //if //ApprovalsMgmt.CheckFileMovementApprovalWorkflowEnabled(Rec) THEN
                    //   //ApprovalsMgmt.OnCancelFileMovementApprovalRequest(Rec);
                end;
            }
            action("Receive File")
            {
                ApplicationArea = Basic;
                Caption = 'Receive File';
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Receive File action.';
                trigger OnAction()
                begin
                    Rec."Returned By" := UserId
                end;
            }
            action("Return File")
            {
                ApplicationArea = Basic;
                Caption = 'Return File';
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                ToolTip = 'Executes the Return File action.';
                trigger OnAction()
                begin
                    Rec."Recieved By" := UserId;
                    Rec."Current File Location" := 'REGISRTY';
                    Rec."File Movement Status" := Rec."file movement status"::Returned;
                    Rec."Date Returned" := Today;
                    Rec.Modify;
                    Message('File Returned Successfully');
                end;
            }
            action("Transfer File")
            {
                ApplicationArea = Basic;
                Caption = 'Transfer File';
                Image = AssemblyBOM;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Transfer File action.';
            }
        }
    }

    trigger OnInit()
    begin
        //IF Status = Status::Approved THEN
        //CurrPage.EDITABLE:=FALSE;
    end;

    trigger OnOpenPage()
    begin
        //IF Status = Status::Approved THEN
        //CurrPage.EDITABLE:=FALSE;
        //"Issuing File Location":='REGISRTY';
    end;

    var
        DocumentType: Option " ",Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Withdrawal","Membership Reg","Loan Batches","Payment Voucher","Petty Cash",Loan,Interbank,Checkoff,"Savings Product Opening","Standing Order",ChangeRequest,Custodial,"File Movement";
        ApprovalEntries: Page "Approval Entries";
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

#pragma implicitwith restore

