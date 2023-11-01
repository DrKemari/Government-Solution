#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
/// <summary>
/// Page Leave Applications Card (ID 69207).
/// </summary>
Page 69207 "Leave Applications Card"
{
    Caption = 'Leave Application';
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Comments';
    SourceTable = "HR Leave Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Application No';
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Application No field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = "Responsibility CenterEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    // Editable = "Leave TypeEditable";
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Type field.';
                    trigger OnValidate()
                    var
                        LeaveLedger: Record "HR Leave Ledger Entries";
                        Period: Record "HR Leave Periods";
                    begin
                        if Rec."Leave Type" = '' then begin
                            //Do maternity test
                            //Test leave ledger entry for any existing maternity leaves this year

                            //Process range of last open period
                            Period.Reset;
                            Period.SetRange(Period.Closed, false);
                            Period.Find('-');

                            LeaveLedger.Reset;
                            LeaveLedger.SetRange(LeaveLedger."Staff No.", Rec."Employee No");
                            LeaveLedger.SetRange(LeaveLedger."Leave Start Date", Period.Starts, Period.Ends);
                            LeaveLedger.SetRange(LeaveLedger."Leave Type", 'MATERNITY');
                            if LeaveLedger.Find('-') then begin
                                Error('You cannot apply maternity twice in the same leave period');
                            end;
                            //*******End do maternity test
                        end;

                        UserSetup.Reset;
                        UserSetup.SetRange("User ID", UserId);
                        if UserSetup.Find('-') then begin
                            Rec."Employee No" := UserSetup."Employee No.";
                        end;
                        GetLeaveStats(Rec."Leave Type");
                        //  CurrPage.UPDATE;
                        /*29/05/2019
                        HREmp.GET("Employee No");
                        IF "Leave Type"='ANNUAL' THEN BEGIN
                          IF "Days Applied">dLeft THEN
                           ERROR('Days applied cannot exceed leave balance for this leave');
                        END ELSE BEGIN
                         HRLeaveTypes.RESET;
                         HRLeaveTypes.SETRANGE(HRLeaveTypes.Code,"Leave Type");
                         IF HRLeaveTypes.FIND('-') THEN BEGIN
                          IF "Days Applied">HRLeaveTypes.Days THEN
                           ERROR('Days applied cannot exceed leave balance for this leave');
                         END;
                        
                        END;
                        */

                    end;
                }
                field("Annual Leave Type"; Rec."Annual Leave Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Leave Type field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    Editable = "Days AppliedEditable";
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                    trigger OnValidate()
                    begin
                        HREmp.Get(Rec."Employee No");
                        if Rec."Leave Type" = 'ANNUAL' then begin
                            if HREmp."Allow Negative Leave" = false then begin
                                if Rec."Days Applied" > dLeft then
                                    Error('Days applied cannot exceed leave balance for this leave');
                            end;
                        end else begin
                            HRLeaveTypes.Reset;
                            HRLeaveTypes.SetRange(HRLeaveTypes.Code, Rec."Leave Type");
                            if HRLeaveTypes.Find('-') then begin
                                if Rec."Days Applied" > HRLeaveTypes.Days then
                                    Error('Days applied cannot exceed leave balance for this leave');
                            end;

                        end;

                        if Rec."Leave Type" = 'MATERNITY' then begin
                            HRLeaveTypes.Reset;
                            HRLeaveTypes.SetRange(HRLeaveTypes.Code, Rec."Leave Type");
                            if HRLeaveTypes.Find('-') then begin
                                if Rec."Days Applied" < HRLeaveTypes.Days then
                                    Error(TEXT004, HRLeaveTypes.Days);
                            end;
                        end;

                        if Rec."Days Applied" < 0 then
                            Error('Days applied cannot be less than zero');
                    end;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Start DateEditable";
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                label("Employee Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Details';
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No.';
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                // field(EmpName; EmpName)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Applicant Name';
                //     Editable = false;
                //     Enabled = false;
                //     Importance = Promoted;
                //     ToolTip = 'Specifies the value of the Applicant Name field.';
                // }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(EmpJobDesc; EmpJobDesc)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Description';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    Editable = SupervisorEditable;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                    trigger OnValidate()
                    begin
                        /*    //GET THE APPROVER NAMES
                            HREmp.RESET;
                            HREmp.SETRANGE("User ID",Supervisor);
                            IF HREmp.FIND('-') THEN
                            BEGIN

                            END ELSE BEGIN
                            SupervisorName:='';
                            END;
                            */


                    end;
                }
                field(SupervisorName; SupervisorName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Supervisor Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field("Supervisor Email"; Rec."Supervisor Email")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supervisor Email';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Email field.';
                }
                field("Approved days"; Rec."Approved days")
                {
                    ApplicationArea = Basic;
                    Editable = ApprovedDaysEditable;
                    ToolTip = 'Specifies the value of the Approved days field.';
                }
                label(Control1102755082)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19010232;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(dEarnd; dEarnd)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Leave Days';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Total Leave Days field.';
                }
                field(dTaken; dTaken)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Leave Taken';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Total Leave Taken field.';
                }
                field(dLeft; dLeft)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Balance';
                    Editable = false;
                    Enabled = false;
                    Style = Strong;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                label(Control1000000000)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text1;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(Reliever; Rec.Reliever)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reliever Code';
                    DrillDown = true;
                    ToolTip = 'Specifies the value of the Reliever Code field.';
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Reliever Name field.';
                }
                field(Attachments; Rec.Attachments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachments field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("More Leave Details")
            {
                Caption = 'More Leave Details';
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    Editable = "Cell Phone NumberEditable";
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cell Phone Number field.';
                }
                field("E-mail Address"; Rec."E-mail Address")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the E-mail Address field.';
                }
                field("Details of Examination"; Rec."Details of Examination")
                {
                    ApplicationArea = Basic;
                    Editable = "Details of ExaminationEditable";
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Details of Examination field.';
                }
                field("Date of Exam"; Rec."Date of Exam")
                {
                    ApplicationArea = Basic;
                    Editable = "Date of ExamEditable";
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date of Exam field.';
                }
                field("Number of Previous Attempts"; Rec."Number of Previous Attempts")
                {
                    ApplicationArea = Basic;
                    Editable = NumberofPreviousAttemptsEditab;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Number of Previous Attempts field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control1000000003; "HR Leave Applications Factbox")
            {
                SubPageLink = "No." = field("Employee No");
                ApplicationArea = Basic;
            }
            systempart(s; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Comments action.';
                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition",HRLeave,"Training Application","Transport Requisition";
                    begin
                        DocumentType := Documenttype::HRLeave;

                        /*ApprovalComments.Setfilters(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                        ApprovalComments.SetUpLine(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                        ApprovalComments.RUN;*/

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    begin
                        DocumentType := Documenttype::"Leave Application";
                        //  ApprovalEntries.Setfilters(Database::"HR Leave Application", 15, Rec."Application Code");
                        //ApprovalEntries.Setfilters(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                        //  ApprovalEntries.Run;
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Cell Phone Number");
                        Rec.TestField("E-mail Address");
                        Rec.CalcFields(Attachments);
                        if HRLeaveTypes2.Get(Rec."Leave Type") then begin
                            if HRLeaveTypes2."Attachment Mandatory" then begin
                                RecordLink.Reset;
                                RecordLink.SetRange("Record ID", Rec.RecordId);
                                if not RecordLink.Find('-') then
                                    Error('The leave type %1 requires an attachment,kindly attach a document before proceeding', Rec."Leave Type");
                            end;
                            //check if links has any link
                            VarVariant := Rec;
                            if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                                ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                        end
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Re-Open action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    begin
                        HRLeaveApp.Reset;
                        HRLeaveApp.SetRange(HRLeaveApp."Application Code", Rec."Application Code");
                        if HRLeaveApp.Find('-') then
                            Report.Run(Report::"Leave Application Form", true, true, HRLeaveApp);
                    end;
                }
                action("Create Leave Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Leave Ledger Entries';
                    Image = CreateLinesFromJob;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Create Leave Ledger Entries action.';
                    trigger OnAction()
                    begin
                        Rec.CreateLeaveLedgerEntries;
                        Rec.Reset;
                    end;
                }
                action("&Post Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = '&Post Leave Application';
                    Image = Post;
                    ToolTip = 'Executes the &Post Leave Application action.';
                    trigger OnAction()
                    begin
                        // if Rec.Posted = true then Error('This Leave application has already been posted');
                        // if Rec.Status <> Rec.Status::Released then
                        //     Error('The Leave Status must be Approved')
                        // else
                        //     HRLeaveApp.Reset;
                        // HRLeaveApp.SetRange(HRLeaveApp."Application Code", Rec."Application Code");
                        // if HRLeaveApp.Find('-') then begin
                        //     HRLeaveApp.CreateLeaveLedgerEntries;

                        // end;
                        // //Dave---To notify leave applicant
                        // if Confirm('Do you wish to notify the employee') = true then begin
                        //     HREmp.Get(Rec."Employee No");
                        //     HREmp.TestField(HREmp."Company E-Mail");

                        //     // //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
                        //     // HREmailParameters.Reset;
                        //     // HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."associate with"::General);
                        //     // if HREmailParameters.Find('-') then begin
                        //     //     HREmp.TestField(HREmp."Company E-Mail");
                        //     //     //SMTP.Create(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmp."Company E-Mail",
                        //     //     HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
                        //     //     HREmailParameters.Body + ' ' + "Application Code" + ' ' + HREmailParameters."Body 2", true);
                        //     //     //SMTP.Send();
                        //     end;
                        // end;


                        //  Message('Leave applicant has been notified successfully');
                    end;
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Attach Documents action.';
                    trigger OnAction()
                    begin
                        // DMSManagement.FnUploadLeaveApplicationDocs(Rec."Application Code", 'Leave Application', Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // EmpDept:='';
        //PASS VALUES TO VARIABLES ON THE FORM
        FillVariables;
        //GET LEAVE STATS FOR THIS EMPLOYEE FROM THE EMPLOYEE TABLE
        GetLeaveStats(Rec."Leave Type");
        //TO PREVENT USER FROM SEEING OTHER PEOPLES LEAVE APPLICATIONS
        // SETFILTER("User ID",USERID);
        //Machira
        Rec.SetFilter("Requester ID", UserId);

        Updatecontrols;
    end;

    trigger OnInit()
    begin
        NumberofPreviousAttemptsEditab := true;
        "Date of ExamEditable" := true;
        "Details of ExaminationEditable" := true;
        "Cell Phone NumberEditable" := true;
        SupervisorEditable := true;
        RequestLeaveAllowanceEditable := true;
        RelieverEditable := true;
        "Leave Allowance AmountEditable" := true;
        "Start DateEditable" := TRUE;
        "Responsibility CenterEditable" := true;
        "Days AppliedEditable" := TRUE;
        // "Leave TypeEditable" := true;
        // "Application CodeEditable" := true;
        HRSetup.Get;
        HRSetup.TestField("Leave Allowance Code");
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", Database.UserId);
        if UserSetup.Find('-') then begin
            Rec."Employee No" := UserSetup."Employee No.";
            Rec.Validate("Employee No");

        end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        /*IF (Status=Status::"7") OR (Status=Status::"10") THEN
        ERROR('You cannot edit an approved or posted leave application')
        */

    end;

    trigger OnOpenPage()
    begin
        SupervisorName := '';
        UserSetup.Reset;
        UserSetup.SetRange("User ID", Rec.Supervisor);
        if UserSetup.Find('-') then begin
            Rec."Supervisor Email" := UserSetup."E-Mail";
            Rec.Supervisor := Rec.Supervisor;
            SupervisorName := UserSetup."Employee Name";
        end
    end;

    var
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        OpenApprovalEntriesExist: Boolean;
        HREmp: Record Employee;
        EmpJobDesc: Text[50];
        HRJobs: Record Positions;
        SupervisorName: Text[60];
        //SMTP: Codeunit "Email Message";
        URL: Text[500];
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        HRSetup: Record "Human Resources Setup";
        EmpDept: Text[30];
        ApprovalMgt: Codeunit "Custom Approvals Codeunit";
        HRLeaveApp: Record "HR Leave Application";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Imprest Memo","Payment Voucher","Petty Cash"," Imprest","Imprest Surrender",Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer"," ";
        // ApprovalEntries: Page "Approval Entries";
        // HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        // EmpName: Text[70];
        // ApprovalComments: Page "Approval Comments";
        // [InDataSet]
        // "Application CodeEditable": Boolean;
        // [InDataSet]
        // "Leave TypeEditable": Boolean;
        [InDataSet]
        "Days AppliedEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Start DateEditable": Boolean;
        [InDataSet]
        "Leave Allowance AmountEditable": Boolean;
        [InDataSet]
        RelieverEditable: Boolean;
        [InDataSet]
        RequestLeaveAllowanceEditable: Boolean;
        [InDataSet]
        SupervisorEditable: Boolean;
        [InDataSet]
        "Cell Phone NumberEditable": Boolean;
        [InDataSet]
        "Details of ExaminationEditable": Boolean;
        [InDataSet]
        "Date of ExamEditable": Boolean;
        [InDataSet]
        NumberofPreviousAttemptsEditab: Boolean;
        Text19010232: label 'Leave Statistics';
        Text1: label 'Reliver Details';
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        LeaveGjline: Record "HR Journal Line";
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "Base Calendar";
        HREmailParameters: Record "Hr E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Template";
        ApprovedDaysEditable: Boolean;
        TEXT004: label 'You can not take Maternity Leave for less than %1 Days';
        "-----Philip": Integer;
        HRLeaveTypes2: Record "HR Leave Types";
        //  DMSManagement: Codeunit "DMS Management";
        RecordLink: Record "Record Link";


    procedure FillVariables()
    begin
        //GET THE APPLICANT DETAILS

        HREmp.Reset;
        if HREmp.Get(Rec."Employee No") then begin
            //  EmpName := HREmp.FullName;
            EmpDept := HREmp."Global Dimension 1 Code";
            //EmpJobDesc:=HREmp."Job Title";
        end else begin
            EmpDept := '';
            //EmpJobDesc:='';
        end;

        //GET THE JOB DESCRIPTION FRON THE HR JOBS TABLE AND PASS IT TO THE VARIABLE

        HRJobs.Reset;
        if HRJobs.Get(HREmp."Job ID") then begin
            EmpJobDesc := HRJobs."Job Description";
        end else begin
            EmpJobDesc := '';
        end;

        //GET THE APPROVER NAMES
        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", Rec.Supervisor);
        if HREmp.Find('-') then begin
            SupervisorName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
        end else begin
            SupervisorName := '';
        end;
    end;


    procedure GetLeaveStats(LeaveType: Text[50])
    begin
        dAlloc := 0;
        dEarnd := 0;
        dTaken := 0;
        dLeft := 0;
        cReimbsd := 0;
        cPerDay := 0;
        cbf := 0;
        if HREmp.Get(Rec."Employee No") then begin
            HREmp.SetFilter(HREmp."Leave Type Filter", LeaveType);
            HREmp.CalcFields(HREmp."Allocated Leave Days");
            dAlloc := HREmp."Allocated Leave Days";
            HREmp.Validate(HREmp."Allocated Leave Days");
            dEarnd := HREmp."Total (Leave Days)";
            HREmp.CalcFields(HREmp."Total Leave Taken");
            dTaken := HREmp."Total Leave Taken";
            HREmp.CalcFields(HREmp."Leave Outstanding Bal");
            dLeft := HREmp."Leave Outstanding Bal";
            cReimbsd := HREmp."Cash - Leave Earned";
            cPerDay := HREmp."Cash per Leave Day";
            HREmp.CalcFields(HREmp."Reimbursed Leave Days");
            cbf := HREmp."Reimbursed Leave Days";
        end;
    end;


    procedure TESTFIELDS()
    begin
        Rec.TestField("Leave Type");
        Rec.TestField("Days Applied");
        Rec.TestField("Start Date");
        //TESTFIELD(Reliever);
        Rec.TestField(Supervisor);
        Rec.TestField("Cell Phone Number");
    end;


    procedure Updatecontrols()
    begin

        if Rec.Status = Rec.Status::Open then begin
            // "Application CodeEditable" := true;
            // "Leave TypeEditable" := true;
            "Days AppliedEditable" := true;
            "Responsibility CenterEditable" := true;
            "Start DateEditable" := true;
            "Leave Allowance AmountEditable" := true;
            RelieverEditable := false;
            RequestLeaveAllowanceEditable := true;
            SupervisorEditable := false;
            "Cell Phone NumberEditable" := true;
            //CurrForm."E-mail Address".EDITABLE:=TRUE;
            "Details of ExaminationEditable" := true;
            "Date of ExamEditable" := true;
            NumberofPreviousAttemptsEditab := true;
            ApprovedDaysEditable := false
        end else begin
            // "Application CodeEditable" := false;
            // "Leave TypeEditable" := false;
            "Days AppliedEditable" := false;
            "Responsibility CenterEditable" := false;
            "Start DateEditable" := false;
            "Leave Allowance AmountEditable" := false;
            RelieverEditable := true;
            RequestLeaveAllowanceEditable := false;
            SupervisorEditable := false;
            "Cell Phone NumberEditable" := false;
            ApprovedDaysEditable := true;
            //CurrForm."E-mail Address".EDITABLE:=FALSE;
            "Details of ExaminationEditable" := false;
            "Date of ExamEditable" := false;
            NumberofPreviousAttemptsEditab := false;
        end;
    end;


    procedure TestLeaveFamily()
    var
        LeaveFamily: Record "HR Leave Family Groups";
        LeaveFamilyEmployees: Record "HR Leave Family Employees";
        Employees: Record Employee;
    begin
        LeaveFamilyEmployees.SetRange(LeaveFamilyEmployees."Employee No", Rec."Employee No");
        if LeaveFamilyEmployees.FindSet then //find the leave family employee is associated with
            repeat
                LeaveFamily.SetRange(LeaveFamily.Code, LeaveFamilyEmployees.Family);
                LeaveFamily.SetFilter(LeaveFamily."Max Employees On Leave", '>0');
                if LeaveFamily.FindSet then //find the status other employees on the same leave family
                  begin
                    Employees.SetRange(Employees."No.", LeaveFamilyEmployees."Employee No");
                    Employees.SetRange(Employees."Leave Status", Employees."leave status"::" ");
                    if Employees.Count > LeaveFamily."Max Employees On Leave" then
                        Error('The Maximum number of employees on leave for this family has been exceeded, Contact th HR manager for more information');
                end
            until LeaveFamilyEmployees.Next = 0;
    end;


    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
            if Rec.DetermineIfIncludesNonWorking(Rec."Leave Type") = false then begin
                fReturnDate := CalcDate('1D', fReturnDate);
                if Rec.DetermineIfIsNonWorking(fReturnDate) then
                    varDaysApplied := varDaysApplied + 1
                else
                    varDaysApplied := varDaysApplied;
                varDaysApplied := varDaysApplied - 1
            end
            else begin
                fReturnDate := CalcDate('1D', fReturnDate);
                varDaysApplied := varDaysApplied - 1;
            end;
        until varDaysApplied = 0;
        exit(fReturnDate);
    end;


    procedure DetermineIfIncludesNonWorking(var fLeaveCode: Code[10]): Boolean
    begin
        if HRLeaveTypes.Get(fLeaveCode) then begin
            if HRLeaveTypes."Inclusive of Non Working Days" = true then
                exit(true);
        end;
    end;


    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    begin

        HRSetup.Find('-');
        HRSetup.TestField(HRSetup."Base Calendar");
        BaseCalendarChange.SetFilter(BaseCalendarChange."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendarChange.SetRange(BaseCalendarChange.Date, bcDate);

        if BaseCalendarChange.Find('-') then begin
            if BaseCalendarChange.Nonworking = false then
                Error('Start date can only be a Working Day Date');
            exit(true);
        end;

        /*
        Customized.RESET;
        Customized.SETRANGE(Customized.Date,bcDate);
        IF Customized.FIND('-') THEN BEGIN
            IF Customized."Non Working" = TRUE THEN
            EXIT(TRUE)
            ELSE
            EXIT(FALSE);
        END;
         */

    end;


    procedure DeterminethisLeaveEndDate(var fDate: Date) fEndDate: Date
    begin
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('-1D', fEndDate);
            while (ReturnDateLoop) do begin
                if Rec.DetermineIfIsNonWorking(fEndDate) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
            end
        end;
        exit(fEndDate);
    end;


    procedure CreateLeaveLedgerEntries()
    begin
        Rec.TestField("Approved days");
        HRSetup.Reset;
        if HRSetup.Find('-') then begin

            LeaveGjline.Reset;
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            LeaveGjline.DeleteAll;
            //Dave
            //HRSetup.TESTFIELD(HRSetup."Leave Template");
            //HRSetup.TESTFIELD(HRSetup."Leave Batch");

            HREmp.Get(Rec."Employee No");
            HREmp.TestField(HREmp."Company E-Mail");

            //POPULATE JOURNAL LINES

            "LineNo." := 10000;
            LeaveGjline.Init;
            LeaveGjline."Journal Template Name" := HRSetup."Leave Template";
            LeaveGjline."Journal Batch Name" := HRSetup."Leave Batch";
            LeaveGjline."Line No." := "LineNo.";

            HRLeavePeriods.Reset;
            HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
            if HRLeavePeriods.Find('-') then
                LeaveGjline."Leave Period" := Format(HRLeavePeriods.Code);
            LeaveGjline."Document No." := Rec."Application Code";
            LeaveGjline."Staff No." := Rec."Employee No";
            LeaveGjline.Validate(LeaveGjline."Staff No.");
            LeaveGjline."Posting Date" := Today;
            LeaveGjline."Leave Entry Type" := LeaveGjline."leave entry type"::Negative;
            LeaveGjline."Leave Approval Date" := Today;
            LeaveGjline.Description := 'Leave Taken';
            LeaveGjline."Leave Type" := Rec."Leave Type";
            //------------------------------------------------------------
            //HRSetup.RESET;
            //HRSetup.FIND('-');
            HRSetup.TestField(HRSetup."Leave Posting Period[FROM]");
            HRSetup.TestField(HRSetup."Leave Posting Period[TO]");
            //------------------------------------------------------------
            LeaveGjline."Leave Period Start Date" := HRSetup."Leave Posting Period[FROM]";
            LeaveGjline."Leave Period End Date" := HRSetup."Leave Posting Period[TO]";
            LeaveGjline."No. of Days" := Rec."Approved days";
            if LeaveGjline."No. of Days" <> 0 then
                LeaveGjline.Insert(true);

            //Post Journal
            LeaveGjline.Reset;
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            if LeaveGjline.Find('-') then begin
                Codeunit.Run(Codeunit::"HR Leave Jnl.-Post", LeaveGjline);
            end;
            //Rec.Status := Rec.Status::"10";
            Rec.Modify;

            /*END ELSE BEGIN
            ERROR('You must specify no of days');
            END;
            END;*/
            //NotifyApplicant;
        end;

    end;


    procedure NotifyApplicant()
    begin
        HREmp.Get(Rec."Employee No");
        HREmp.TestField(HREmp."Company E-Mail");

        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        HREmailParameters.Reset;
        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."associate with"::General);
        if HREmailParameters.Find('-') then begin


            HREmp.TestField(HREmp."Company E-Mail");
            //SMTP.Create(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmp."Company E-Mail",
            // HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
            // HREmailParameters.Body + ' ' + "Application Code" + ' ' + HREmailParameters."Body 2", true);
            // //SMTP.Send();


            Message('Leave applicant has been notified successfully');
        end;
    end;
}

#pragma implicitwith restore

