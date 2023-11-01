#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59098 "Approved File Requsition Card"
{
    Caption = 'Approved File Requsition Card';
    DeleteAllowed = false;
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
                field("Issuing File Location"; Rec."Issuing File Location")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Issuing File Location field.';
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
                field("Date Retrieved"; Rec."Date Retrieved")
                {
                    ApplicationArea = Basic;
                    Caption = 'Issue Date';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Issue Date field.';
                }
                field("File Movement Status"; Rec."File Movement Status")
                {
                    ApplicationArea = Basic;
                    OptionCaption = 'Open,Issued,Returned,Transferred';
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
            action("Dispatch File")
            {
                ApplicationArea = Basic;
                Caption = 'Dispatch File';
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = true;
                ToolTip = 'Executes the Dispatch File action.';
                trigger OnAction()
                begin
                    Rec."Retrieved By" := UserId;
                    FileLines.Reset;
                    FileLines.SetRange("Document No.", Rec."No.");
                    if FileLines.Find('-') then begin
                        Rec."Current File Location" := FileLines."Department Name";
                    end;

                    Rec."File Movement Status" := Rec."file movement status"::Issued;
                    Rec."Date Retrieved" := Today;
                    Rec.Modify;
                    Message('Issued Successfully');
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
                    //"Returned By":=USERID
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
                trigger OnAction()
                begin
                    //"Current File Location":='REGISRTY';
                end;
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
        FileLines: Record "File Movement Line";
}

#pragma implicitwith restore

