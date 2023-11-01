#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57141 "Standing Imprest Card-Approved"
{
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = filter(Released),
                            Posted = const(false));

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Center/Dept  Code';
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Center/Dept Name';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Code';
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Total Other Costs"; Rec."Total Other Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Cheque Type"; Rec."Cheque Type")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000023; "Standing Expenses")
            {
                Caption = 'Expenses';
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000017; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000018; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000019; Links)
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

                trigger OnAction()
                begin
                    editTransport := false;
                    Rec.TestField(Status, Rec.Status::Open);//status must be open.
                    //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
                    Rec.TestField(Objective);
                    Rec.TestField(Subject);
                    Rec.TestField(Date);
                    Rec.TestField("Imprest Naration");
                    if Rec."Vote Amount" < Rec."Total Subsistence Allowance" then
                        Error('Budgeted Amount is less than the Amount requested');

                    //check if the requester is part of the team
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."No.", Rec.Requestor);
                    if ProjectTeam.FindFirst = false then
                        Error(Text001);
                    if Rec.Status = Rec.Status::"Pending Approval" then begin
                        if Rec."User ID" = 'DYNASOFT' then
                            editTransport := true;

                    end else begin
                        editTransport := false;
                    end;


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

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                    //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
                    //ApprovalsMgmt.OnCancelImpMemoApprovalRequest(Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Enabled = Show;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin

                    PaymentPost.PostImprestMemo(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction()
                begin

                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57001, true, true, Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    ApprovalEntries.Setfilters(Database::"Imprest Memo", 6, Rec."No.");
                    ApprovalEntries.Run;
                end;
            }
            action("Re&lease")
            {
                ApplicationArea = Basic;
                Caption = 'Re&lease';
                Image = ReleaseDoc;
                ShortCutKey = 'Ctrl+F9';

                trigger OnAction()
                var
                //ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    Rec.TestField("Reason to Reopen");
                    Releasememo.PerformManualRelease(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
        Rec.CalcFields("Terms of Reference", Objective);
        Rec."Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);


        Rec.Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Standing Imprest";
    end;

    trigger OnOpenPage()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        Show: Boolean;
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        ProjectTeam: Record "Project Members";
        Text001: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        Text002: label 'The Imprest Memo must be fully approved before printing';
        Text003: label 'You do no have rights to post Imprest memo surrender. Please Seek Assistance from Accounts';
        usersetup: Record "User Setup";
        Releasememo: Codeunit "Imprest Memo";
        pteam: Record "Project Members";
        impmemo: Record "Imprest Memo";
        exeplan: Record "Execution Plan";
        editTransport: Boolean;
        safariteam: Page "Safari Team";

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

