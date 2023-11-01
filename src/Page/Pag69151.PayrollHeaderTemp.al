#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Payroll Header Temp (ID 69151).
/// </summary>
#pragma implicitwith disable
Page 69151 "Payroll Header Temp"
{
    PageType = Card;
    SourceTable = "Payroll HeaderT";
    SourceTableView = where("Account Type" = const(Casuals),
                            Status = filter(<> Released));

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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross Pay field.';
                }
                field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Pay field.';
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Deductions field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Time Posted field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            // part(Control14; "Payroll Lines Temp")
            // {
            //     SubPageLink = "Payroll Header" = field("No.");
            //     ApplicationArea = Basic;
            // }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup16)
            {
                action("Run Payroll")
                {
                    ApplicationArea = Basic;
                    Image = Recalculate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Run Payroll action.';
                    trigger OnAction()
                    var
                        emp: Record Employee;
                    begin
                        //CurrPage.SETSELECTIONFILTER(FORMAT("Payroll Period"));
                        //REPORT.RUNMODAL(69004,TRUE,FALSE,REC);


                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        //REPORT.RUN(69400,TRUE,TRUE,EmpT);

                        PayrollHeaderT.SetRange(PayrollHeaderT."No.", Rec."No.");
                        Report.Run(69406, true, true, PayrollHeaderT)

                        /*
                        Assignmat.RESET;
                        Assignmat.SETRANGE(Assignmat.Type,Assignmat.Type::Payment);
                        Assignmat.SETRANGE(Assignmat."Payroll Period","Payroll Period");
                        IF Assignmat.FIND('-') THEN BEGIN
                         REPEAT
                           LineNo:=LineNo+1000;
                           PayrollLines."Line No":=LineNo;
                           PayrollLines."Payroll Header":="No.";
                           PayrollLines."Payroll Group":=Assignmat."Posting Group Filter";
                           PayrollLines."Annuitant Name":=Assignmat."First Name"+' '+Assignmat."Last Name"+' '+Assignmat."Middle Name";
                           //PayrollLines."Basic Arrears":=Assignmat."Basic Pay Arrears";
                           PayrollLines."Basic Pension":=Assignmat."Basic Pay";
                           PayrollLines."Gross Pay":=Assignmat.Amount;
                           PayrollLines.Netpay:=Assignmat.Amount;
                           PayrollLines.Wtax:=Assignmat.Amount;
                           PayrollLines."Annuitant No":=Assignmat."Employee No";
                           PayrollLines."Payroll Period":="Payroll Period";
                           PayrollLines.INSERT;
                         UNTIL Assignmat.NEXT=0;
                        END;
                        */

                    end;
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Master Roll action.';
                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69402, true, true, EmpT)
                    end;
                }
                action("Payroll Reconciliation Detailed")
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //   RunObject = Report "Payroll Reconciliation DetailT";
                    ToolTip = 'Executes the Payroll Reconciliation Detailed action.';
                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("Payroll Reconciliation Summary")
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //   RunObject = Report "Payroll Reconciliation SummarT";
                    ToolTip = 'Executes the Payroll Reconciliation Summary action.';
                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("Monthly PAYE Report")
                {
                    ApplicationArea = Basic;
                    Image = ViewCheck;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    //   RunObject = Report "Monthly PAYE Report Export";
                    ToolTip = 'Executes the Monthly PAYE Report action.';
                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("EFT Export")
                {
                    ApplicationArea = Basic;
                    Image = ViewCheck;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the EFT Export action.';
                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
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
                        //MESSAGE('%1',//ApprovalsMgmt.CheckTSalaryApprovalsWorkflowEnabled(Rec));
                        //if //ApprovalsMgmt.CheckTSalaryApprovalsWorkflowEnabled(Rec) then
                        //ApprovalsMgmt.OnSendTSalaryForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OnCancelTSalaryApprovalRequest(Rec);
                    end;
                }
                separator(Action29)
                {
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Payroll HeaderT", 19, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Image = Check;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Release action.';
                    trigger OnAction()
                    begin
                        //OpenDoc.ReopenPayroll(Rec)
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify;
                        CurrPage.Close;
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Re-Open action.';
                    trigger OnAction()
                    begin
                        //OpenDoc.ReopenPayroll(Rec)
                    end;
                }
            }
            group(ActionGroup26)
            {
                action("&Navigate")
                {
                    ApplicationArea = Basic;
                    Caption = '&Navigate';
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;
                    Scope = Repeater;
                    ToolTip = 'Executes the &Navigate action.';
                    trigger OnAction()
                    begin
                        Navigate.SetDoc(Rec."Payroll Period", Rec."No.");
                        Navigate.Run;
                    end;
                }
                action("General Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "General Ledger Entries";
                    RunPageLink = "Document No." = field("No."),
                                  "Posting Date" = field("Payroll Period");
                    ToolTip = 'Executes the General Ledger Entries action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false;
        Rec."Account Type" := Rec."account type"::Casuals;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false;
        Rec."Account Type" := Rec."account type"::Casuals;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Account Type" := Rec."account type"::Casuals;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false;
        Rec."Account Type" := Rec."account type"::Casuals;
    end;

    var
        emp: Record "Temporary Employee";
        Assignmat: Record "Assignment Matrix-X Temp-E";
        PayrollLines: Record "Payroll Pay Mode";
        LineNo: Integer;
        [InDataSet]
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Navigate: Page Navigate;
        Post: Boolean;
        GenLedgerSetup: Record "General Ledger Setup";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Sclaims,"Imprest Memo","Payment Voucher","Petty Cash"," Imprest","Imprest Surrender",Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition";
        PayPeriod: Record "Payroll PeriodXT";
        DocNumber: Text;
        GLEntry: Record "G/L Entry";
        EmpT: Record "Temporary Employee";
        PayrollHeaderT: Record "Payroll HeaderT";
}

#pragma implicitwith restore

