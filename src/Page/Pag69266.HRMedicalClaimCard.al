#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69266 "HR Medical Claim Card"
{
    PageType = Card;
    SourceTable = "HR Medical Claims";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Claim Type"; Rec."Claim Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim Type field.';
                }
                field("Claim Date"; Rec."Claim Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim Date field.';
                }
                field("Claim No"; Rec."Claim No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim No field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No.';
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Patient Name"; Rec."Patient Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Patient Name field.';
                }
                field("Document Ref"; Rec."Document Ref")
                {
                    ApplicationArea = Basic;
                    Caption = 'Document No.(From Hospital)';
                    ToolTip = 'Specifies the value of the Document No.(From Hospital) field.';
                }
                field("Date of Service"; Rec."Date of Service")
                {
                    ApplicationArea = Basic;
                    Caption = 'Visit Date(Hospital)';
                    ToolTip = 'Specifies the value of the Visit Date(Hospital) field.';
                }
                field("Attended By"; Rec."Attended By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Attended By field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field(Dependants; Rec.Dependants)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dependant';
                    ToolTip = 'Specifies the value of the Dependant field.';
                }
                field("Dependant DoB"; Rec."Dependant DoB")
                {
                    ApplicationArea = Basic;
                    Caption = 'Dependant Date of Birth';
                    ToolTip = 'Specifies the value of the Dependant Date of Birth field.';
                }
                field("Dependant  Age"; Rec."Dependant  Age")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dependant  Age field.';
                }
                field("Amount Charged"; Rec."Amount Charged")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Charged field.';
                }
                field("Amount Claimed"; Rec."Amount Claimed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Claimed field.';
                }
                field("Reason for Variance"; Rec."Reason for Variance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason for Variance in Amount Claimed';
                    ToolTip = 'Specifies the value of the Reason for Variance in Amount Claimed field.';
                }
                field("Hospital/Medical Centre"; Rec."Hospital/Medical Centre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hospital/Medical Centre field.';
                }
                field("Claim Limit"; Rec."Claim Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Claim Limit field.';
                }
                field("Bank Account"; Rec."Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Claim';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Post Claim action.';
                    trigger OnAction()
                    begin



                        Rec.TestField("Claim Date");
                        Rec.TestField("Amount Claimed");

                        if Confirm('Do you Wish to Post this transaction?', false) = false then begin exit end;


                        ClaimJNL.Init;
                        ClaimJNL."Document No." := Rec."Document Ref";
                        ClaimJNL."Claim No" := Rec."Claim No";
                        ClaimJNL."Employee No" := Rec."Member No";
                        ClaimJNL."Employee Name" := Rec."Patient Name";
                        ClaimJNL."Claim Date" := Rec."Claim Date";
                        ClaimJNL."Hospital Visit Date" := Rec."Date of Service";
                        ClaimJNL."Claim Limit" := Rec."Claim Limit";
                        ClaimJNL."Balance Claim Amount" := Rec.Balance;
                        ClaimJNL."Amount Charged" := Rec."Amount Charged";
                        ClaimJNL."Amount Claimed" := Rec."Amount Claimed";
                        ClaimJNL.Comments := Rec.Comments;
                        ClaimJNL."USER ID" := UserId;
                        ClaimJNL."Date Posted" := Today;
                        ClaimJNL."Time Posted" := Time;
                        ClaimJNL.Posted := true;
                        ClaimJNL.Insert;



                        Rec."Date Posted" := Today;
                        Rec."Time Posted" := Time;
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;

                        Message('Transaction Posted Successfully');
                    end;
                }
                separator(Action1000000024)
                {
                }
                action(PrintNew)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        //TESTFIELD(Status,Status::Approved);
                        /*IF (Status=Status::Pending) OR  (Status=Status::"Pending Approval") THEN
                           ERROR('You cannot Print until the document is Approved'); */

                        PHeader2.Reset;
                        PHeader2.SetRange(PHeader2."Member No", Rec."Member No");
                        if PHeader2.FindFirst then
                            Report.Run(51516199, true, true, PHeader2);

                        /*RESET;
                        SETRANGE("No.","No.");
                        IF "No." = '' THEN
                          REPORT.RUNMODAL(51516000,TRUE,TRUE,Rec)
                        ELSE
                          REPORT.RUNMODAL(51516344,TRUE,TRUE,Rec);
                        RESET;
                        */

                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        if Confirm('Do you Wish to Cancel the approval request', false) = false then begin exit end;/*DocumentType:=DocumentType::ImprestRequisition;
                        ApprovalEntries.Setfilters(DATABASE::"Imprest Header",DocumentType,"No.");
                        ApprovalEntries.RUN;
                        */

                    end;
                }
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        Text001: label 'This Batch is already pending approval';
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if Confirm('Do you Wish to send this transaction for Approval', false) = false then begin exit end;


                        /*
                        //if //ApprovalsMgmt.CheckImprestRequisitionApprovalsWorkflowEnabled(Rec) THEN
                          //ApprovalsMgmt.OnSendImprestRequisitionForApproval(Rec);
                        */

                    end;
                }
                action("Canel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Canel Approval Request action.';
                    trigger OnAction()
                    var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalMgt.CancelBatchAppr(Rec,TRUE,TRUE) THEN;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //TO PREVENT USER FROM SEEING OTHER PEOPLES LEAVE APPLICATIONS
        Rec.SetFilter("User ID", UserId);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Claim Type"='Outpatient';
    end;

    var
        PHeader2: Record "HR Medical Claims";
        HREmp: Record Employee;
        EmpName: Text;
        EmpDept: Text;
        ClaimJNL: Record "HR Medical Claim Entries";

    local procedure FillVariables()
    begin
        //GET THE APPLICANT DETAILS

        HREmp.Reset;
        if HREmp.Get(Rec."Member No") then begin
            EmpName := HREmp.FullName;
            EmpDept := HREmp."Global Dimension 2 Code";
        end else begin
            EmpDept := '';
        end;
    end;
}

#pragma implicitwith restore

