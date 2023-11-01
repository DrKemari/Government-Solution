#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59081 "Outward Mail RegisterCard"
{
    Caption = 'Mail RegisterCard';
    PageType = Card;
    SourceTable = "Inward Mail Register";
    SourceTableView = where(Dispatched = const(false),
                            "Document Type" = const("Outward Register"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Mail Register No"; Rec."Mail Register No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Mail Register No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Date received"; Rec."Date received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date received field.';
                }
                field("Reference Number"; Rec."Reference Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference Number field.';
                }
                field("Date of letter"; Rec."Date of letter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Dispatch field.';
                }
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization Name field.';
                }
                field("Author Name"; Rec."Author Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Author Name field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File No field.';
                }
                field("File folio"; Rec."File folio")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File folio field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Dispatch File")
            {
                ApplicationArea = Basic;
                Caption = 'Dispatch File';
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Dispatch File action.';
                trigger OnAction()
                var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    SMTPSetup: Codeunit "Email Message";
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[500];
                    Subject: Text[80];
                    FileName: Text;
                    FileMangement: Codeunit "File Management";
                    ProgressWindow: Dialog;
                    SMTPMailSet: Record "Email Account";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    cu400: Codeunit "Email Message";
                    DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    FundingOpp: Record "Project Contract Header";
                    GrantsSetup: Record "Grants Setup";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                    Policy: Record Policy;
                begin
                    Rec.Dispatched := true;
                    Rec."Dispatched By" := UserId;
                    Rec."Dispatched Date" := Today;
                    Rec."Dispatch Time" := Time;

                    Rec.Modify;

                    CompanyInfo.Get();
                    SMTPMailSet.Get;
                   // ..SenderAddress := SMTPMailSet."Email Sender Address";
                    SenderName := CompanyInfo.Name + ' RECORDS';
                    Subject := StrSubstNo('File Requsition');


                    FileDirectory := 'C:\DOCS\';
                    FileName := 'File_' + Rec."Mail Register No" + '.pdf';
                    //Window.OPEN('processing');
                    Window.Open('PROCESSING FILE DISPATCH ############1##');
                    Window.Update(1, Rec."File No" + '-' + Rec."File folio");

                    WindowisOpen := true;
                    if FileName = '' then
                        Error('Please specify what the file should be saved as');
                    InwardMailRegister.Reset;
                    InwardMailRegister.SetRange("Mail Register No", Rec."Mail Register No");
                    if InwardMailRegister.Find('-') then begin
                        //Report.SaveAsPdf(59071, FileDirectory + FileName, InwardMailRegister);
                    end;



                    // IF EXISTS(FileDirectory+FileName) THEN BEGIN
                    Counter := Counter + 1;

                    SMTPMailSet.Get;
                 //  .. SenderAddress := SMTPMailSet."Email Sender Address";

                    Employee.Reset;
                    Employee.SetRange("No.", Rec."Assigned Employee");
                    if Employee.Find('-') then
                        Recipients := Employee."Company E-Mail";

                    // if Recipients <> '' then begin
                    //     Body := 'Dear ' + "Assigned Employee Names" + '<BR>This email is to notify you of File:<Br>'
                    //     + "File No" + ' ' + "File folio" + ' ' + Format("Reference Number") + ' ' + 'Date of Letter' + ''
                    //     + Format("Date of letter")
                    //     + '<BR>Please adhere to Records Policy and Guidelines regarding File Return';
                    //     cu400.Create(CompanyInfo.Name, SenderAddress, Recipients, Subject, Body, true);

                    //     cu400.AppendToBody(
                    //     '<BR><BR>Kind Regards,');
                    //     cu400.AppendToBody('<BR>' + CompInfo.Name);
                    //     cu400.AddAttachment(FileDirectory + FileName, FileName);
                    //     cu400.Send;

                    //     Sleep(1000);
                    //     Window.Close;
                    // end;



                    Message('Dispatched Sucessfully');
                end;
            }
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
                    //DocumentType:=DocumentType::"File Movement";
                    //ApprovalEntries.Setfilters(DATABASE::"File Movement Header",DocumentType,"No.");
                    //ApprovalEntries.RUN;
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
                    /*FileMovementLine.RESET;
                    FileMovementLine.SETRANGE(FileMovementLine."Document No.",Rec."No.");
                    NoRec :=  FileMovementLine.COUNT;
                    IF NoRec < 1 THEN
                      ERROR('No lines entered, please select file movement lines');
                     //if //ApprovalsMgmt.CheckFileMovementApprovalsWorkflowEnabled(Rec) THEN
                      //ApprovalsMgmt.OnSendFileMovementForApproval(Rec);
                      */

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
                    /*//if //ApprovalsMgmt.CheckFileMovementApprovalsWorkflowEnabled(Rec) THEN
                      //ApprovalsMgmt.OnCancelFileMovementApprovalRequest(Rec);
                    */

                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec."Document Type" := Rec."document type"::"Outward Register";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Outward Register";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Outward Register";
    end;

    var
        InwardMailRegister: Record "Inward Mail Register";
}

#pragma implicitwith restore

