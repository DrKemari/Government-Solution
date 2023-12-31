#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69246 "HR Shortlisting Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Shortlist,Qualify';
    SourceTable = "Employee Requisitions";
    SourceTableView = where(Status = const(Approved),
                            Closed = const(false));

    layout
    {
        area(content)
        {
            group("Job Details")
            {
                Caption = 'Job Details';
                Editable = true;
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Requisition DateEditable";
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    Editable = PriorityEditable;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Vacant Positions field.';
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ApplicationArea = Basic;
                    Editable = "Required PositionsEditable";
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Required Positions field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Shortlisted; "HR Shortlisting Lines")
            {
                SubPageLink = "Employee Requisition No" = field("Requisition No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control1102755003; "HR Jobs Factbox")
            {
                // SubPageLink = "Entry No" = field("Job ID");
                ApplicationArea = Basic;
            }
            systempart(Control1102755001; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Applicants)
            {
                Caption = 'Applicants';
                action("Get ShortListed Applicants")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get ShortListed Applicants';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Get ShortListed Applicants action.';
                    trigger OnAction()
                    begin
                        HRJobRequirements.Reset;
                        HRJobRequirements.SetRange(HRJobRequirements."Job Id", Rec."Job ID");
                        /*IF HRJobRequirements.COUNT=0 THEN BEGIN
                        MESSAGE('Job Requirements for the job '+ "Job ID" +' have not been setup');
                        EXIT;
                        END ELSE */
                        begin

                            //GET JOB REQUIREMENTS
                            HRJobRequirements.Reset;
                            HRJobRequirements.SetRange(HRJobRequirements."Job Id", Rec."Job ID");
                            //DELETE ALL RECORDS FROM THE SHORTLISTED APPLICANTS TABLE
                            HRShortlistedApplicants.Reset;
                            HRShortlistedApplicants.SetRange(HRShortlistedApplicants."Employee Requisition No", Rec."Requisition No.");
                            HRShortlistedApplicants.DeleteAll;


                            //GET JOB APPLICANTS
                            HRJobApplications.Reset;
                            HRJobApplications.SetRange(HRJobApplications."Employee Requisition No", Rec."Requisition No.");
                            HRJobApplications.SetRange(Shortlist, true);
                            if HRJobApplications.FindSet then begin
                                repeat
                                    HRShortlistedApplicants."Employee Requisition No" := Rec."Requisition No.";
                                    HRShortlistedApplicants."Job Application No" := HRJobApplications."Application No";
                                    HRShortlistedApplicants."Stage Score" := Rec.Score;
                                    HRShortlistedApplicants."Qualified for Written Intervie" := Rec.Qualified;
                                    HRShortlistedApplicants."First Name" := HRJobApplications."First Name";
                                    HRShortlistedApplicants."Middle Name" := HRJobApplications."Middle Name";
                                    HRShortlistedApplicants."Last Name" := HRJobApplications."Last Name";
                                    HRShortlistedApplicants."ID No" := HRJobApplications."ID Number";
                                    HRShortlistedApplicants.Gender := HRJobApplications.Gender;
                                    HRShortlistedApplicants.Email := HRJobApplications."E-Mail";
                                    HRShortlistedApplicants."Marital Status" := HRJobApplications."Marital Status";
                                    HRShortlistedApplicants.Insert;

                                until HRJobApplications.Next = 0;
                                Message('Shortlisting Competed Successfully.');
                            end else begin
                                Message('No shortlisted applicants found, relating to the vacant position');
                            end;

                        end

                    end;
                }
                action("Qualify Applicants")
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualify Applicants';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Qualify Applicants action.';
                    trigger OnAction()
                    begin
                        //GET JOB APPLICANTS
                        HRShortlistedApplicants.Reset;
                        HRShortlistedApplicants.SetRange("Employee Requisition No", Rec."Requisition No.");
                        HRShortlistedApplicants.SetRange(Qualified, true);
                        if HRShortlistedApplicants.FindSet then begin
                            repeat
                                HRJobApplications.Reset;
                                HRJobApplications.SetRange("Application No", HRShortlistedApplicants."Job Application No");
                                if HRJobApplications.FindSet then begin
                                    HRJobApplications.Qualified := true;
                                    HRJobApplications."Date of Interview" := HRShortlistedApplicants."Interview Date";
                                    HRJobApplications.Modify(true);
                                end;
                            until HRShortlistedApplicants.Next = 0;
                        end;
                        SendQualifyEmail;
                        SendRegretEmail;
                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintReport;
                    ToolTip = 'Executes the &Print action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmpReq.Reset;
                        HREmpReq.SetRange(HREmpReq."Requisition No.", Rec."Requisition No.");
                        if HREmpReq.Find('-') then
                            Report.Run(53926, true, true, HREmpReq);
                    end;
                }
                action("&Send Interview Invitation")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Interview Invitation';
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Send Interview Invitation action.';
                    trigger OnAction()
                    begin
                        CompInfo.Get;
                        Window.Open('SENDING  INTERVIEW NOTIFICATION ##########');
                        WindowisOpen := true;
                        HRShortlistedApplicants.SetRange("Employee Requisition No", Rec."Requisition No.");
                        HRShortlistedApplicants.SetRange("Interviewee Notified", false);
                        if HRShortlistedApplicants.FindSet then begin
                            repeat
                                HRJobApplications.Reset;
                                HRJobApplications.SetRange("Application No", HRShortlistedApplicants."Job Application No");
                                if HRJobApplications.FindSet then begin
                                    HRShortlistedApplicants.TestField("Interview Date");
                                    HRShortlistedApplicants.TestField("Interview Time");
                                    HRShortlistedApplicants.TestField("Interview Venue");
                                    SMTPMailSetup.Get;
                                    InterviewDate := Format(HRShortlistedApplicants."Interview Date", 0, 7);
                                    Body := 'Dear' + ' ' + HRShortlistedApplicants.Initials + '  ' + HRShortlistedApplicants."First Name" + ' ' + HRShortlistedApplicants."Middle Name" + ' ' + HRShortlistedApplicants."Last Name" + ',<BR>' +
                                   'Reference is made to your application letter dated' + ' ' + '<b>' + Format(HRJobApplications."Date Applied", 0, 7) + '</b>' + ',  ' +
                                   'for the advertised position of' + '  ' + Rec."Job Title" + ' - ' + 'Job Group' + '  ' + Rec."Job Grade" + '<BR><BR>' +
                                   'We wish to invite you for an interview on' + ' ' + InterviewDate + ',' + Format(HRShortlistedApplicants."Interview Time", 0, '<Hours24,2>:<Minutes,2>') + ' ' + 'at' + ' ' + HRShortlistedApplicants."Interview Venue" +
                                   '<BR><BR>Kindly confirm receipt and attendance by response to this invitation on email.<BR>';


                                    Title := 'RE:INVITATION FOR INTERVIEW -' + ' ' + InterviewDate;
                                    //  Notification1.CreateMessage('KERRA JOB APPLICATION', SMTPMailSetup."Email Sender Address", HRShortlistedApplicants.Email, Title, Body, true);
                                    //change address to email
                                    Counter := Counter + 1;
                                    // Notification1.AppendToBody(
                                    // '<BR>Yours Sincerely,' +
                                    // '<BR><b>Judith Yamo </b><BR>' +
                                    // '<b>For:Director General</b><BR>' +
                                    // CompInfo.Name + '<BR>' +
                                    // CompInfo.Address + '<BR>' +
                                    // CompInfo."Address 2" + '<BR>' +
                                    // CompInfo."Phone No." + '<BR>' +
                                    // CompInfo.City);
                                    //  Notification1.AddBCC(SMTPMailSetup."Email Sender Address");
                                    //  Notification1.Send;
                                    //HRShortlistedApplicants."Interviewee Notified":=TRUE;
                                    HRShortlistedApplicants.Modify();
                                end;
                            until HRShortlistedApplicants.Next = 0;
                            Message('The shortlisted applicants were succesfully notified');
                        end else
                            Message('Candidates already notified');


                        Sleep(1000);
                        Window.Close;
                    end;
                }
                action("&Print1")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print1';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the &Print1 action.';
                    trigger OnAction()
                    begin
                        /*HRJobApplications.RESET;
                        HRJobApplications.SETRANGE(HRJobApplications."Application No","Application No");
                        IF HRJobApplications.FIND('-') THEN
                        REPORT.RUN(55523,TRUE,TRUE,HRJobApplications);*/

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnInit()
    begin
        /*
        "Required PositionsEditable" := TRUE;
        PriorityEditable := TRUE;
        ShortlistedEditable := TRUE;
        "Requisition DateEditable" := TRUE;
        "Job IDEditable" := TRUE;
        */

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

    var
        HRJobRequirements: Record "HR Job Requirements";
        AppQualifications: Record "HR Applicant Qualifications";
        HRJobApplications: Record "HR Job Applications";
        Qualified: Boolean;
        StageScore: Decimal;
        HRShortlistedApplicants: Record "HR Shortlisted Applicants";
        MyCount: Integer;
        RecCount: Integer;
        HREmpReq: Record "Employee Requisitions";
        [InDataSet]
        "Job IDEditable": Boolean;
        [InDataSet]
        "Requisition DateEditable": Boolean;
        [InDataSet]
        ShortlistedEditable: Boolean;
        [InDataSet]
        PriorityEditable: Boolean;
        [InDataSet]
        "Required PositionsEditable": Boolean;
        Text19057439: label 'Short Listed Candidates';
        WindowisOpen: Boolean;
        SMTPMailSetup: Record "Email Account";
        Notification1: Codeunit "Email Message";
        CompInfo: Record "Company Information";
        //"Object": Record "Object";
        Window: Dialog;
        Counter: Integer;
        CashManagementSetup: Record "Cash Management Setup";
        Body: Text;
        Title: Text;
        InterviewDate: Text;


    procedure UpdateControls()
    begin

        if Rec.Status = Rec.Status::New then begin
            "Job IDEditable" := true;
            "Requisition DateEditable" := true;
            ShortlistedEditable := true;
            PriorityEditable := true;
            "Required PositionsEditable" := true;
        end else begin
            "Job IDEditable" := false;
            "Requisition DateEditable" := false;
            ShortlistedEditable := false;
            PriorityEditable := false;
            "Required PositionsEditable" := false;
        end;
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;

        UpdateControls;
    end;

    local procedure SendQualifyEmail()
    begin
        HRShortlistedApplicants.TestField("Reporting Date");
        CompInfo.Get;
        Window.Open('NOTIFYING QUALIFIED APPLICANTS ##########');
        WindowisOpen := true;
        HRShortlistedApplicants.SetRange("Employee Requisition No", Rec."Requisition No.");
        HRShortlistedApplicants.SetRange(Qualified, true);
        HRShortlistedApplicants.SetRange("Candidate Qualified", false);
        if HRShortlistedApplicants.FindSet then begin
            repeat
                CashManagementSetup.Get;
                SMTPMailSetup.Get;
                InterviewDate := Format(HRShortlistedApplicants."Interview Date", 0, '<Day,1>/<Month,2>/<Year4>');
                Body := 'Dear' + ' ' + HRShortlistedApplicants.Initials + '  ' + HRShortlistedApplicants."First Name" + ' ' + HRShortlistedApplicants."Middle Name" + ' ' + HRShortlistedApplicants."Last Name" + ',<BR>' +
               'Reference is made to your application letter dated' + ' ' + '<b>' + Format(HRJobApplications."Date Applied", 0, '<Day,1>/<Month,2>/<Year4>') + '</b>' + ',  ' +
               'and interview on' + '  ' + Format(HRShortlistedApplicants."Interview Date", 0, '<Day,1>/<Month,2>/<Year4>') + ' ' + 'for the position of' + '  ' + Rec."Job Title" + ' ' + Rec."Job Grade" + '<BR><BR>' +
               'This is to kindly request you to pick your letter of offer of appointment in the office of the Deputy Director HRM,at the institute.';


                Title := 'RE:LETTER OF OFFER NOTIFICATION';
                //   Notification1.CreateMessage('KeRRA JOB APPLICATION', SMTPMailSetup."Email Sender Address", HRShortlistedApplicants.Email, Title, Body, true);
                //change address to email    //change address to email
                Counter := Counter + 1;
               // Notification1.AppendToBody(
                // '<BR>Yours Sincerely,' +
                // '<BR><BR><b>Judith Yamo</b><BR>' +
                // '<b>For:Director General</b><BR>' +
                // CompInfo.Name + '<BR>' +
                // CompInfo.Address + '<BR>' +
                // CompInfo."Address 2" + '<BR>' +
                // CompInfo."Phone No." + '<BR>' +
                // CompInfo.City);
                //  Notification1.AddBCC(CashManagementSetup."Imprest Email");
                //  Notification1.Send;
                HRShortlistedApplicants."Candidate Qualified" := true;
            until HRShortlistedApplicants.Next = 0;
            Message('Qualified applicants succesfully notified');
        end else begin
            Message('No qualified applicant found');
        end;
        Sleep(1000);
        Window.Close;
    end;

    local procedure SendRegretEmail()
    begin
        CompInfo.Get;
        Window.Open('NOTIFYING FAILED APPLICANTS ##########');
        WindowisOpen := true;
        HRShortlistedApplicants.SetRange("Employee Requisition No", Rec."Requisition No.");
        HRShortlistedApplicants.SetRange(Qualified, false);
        HRShortlistedApplicants.SetRange("Candidate Qualified", false);
        if HRShortlistedApplicants.FindSet then begin
            repeat
                CashManagementSetup.Get;
                SMTPMailSetup.Get;
                Body := 'Dear' + ' ' + HRShortlistedApplicants.Initials + '  ' + HRShortlistedApplicants."First Name" + ' ' + HRShortlistedApplicants."Middle Name" + ' ' + HRShortlistedApplicants."Last Name" + ',<BR>' +
                'Thank you very much for taking the time to interview with us for the position' + ' ' + '<b>' + Rec."Job Title" + '</b>' + '  ' +
                'on' + '  ' + Format(HRShortlistedApplicants."Interview Date") + ' ' + 'at Kenya Rural Roads Authority.<BR><BR>' + 'However, we  regret to inform you' + ' ' +
                ' after the competitive selection process,another applicant was selected for the position.<BR><BR>' + ' ' + 'While you were not selected for this' + ' ' +
                ' position,we wish to appreciate your interest in the position, and thank you for the time spent with the interviewing panel.We encourage' + ' ' +
                'you to apply for other openings in the institute in future.';
                Title := 'RE:REGRET NOTIFICATION-' + ' ' + Rec."Job Title";
                //    Notification1.CreateMessage('KeRRA JOB APPLICATION', CashManagementSetup."Imprest Email", HRShortlistedApplicants.Email, Title, Body, true);
                //change address to email
                Counter := Counter + 1;
             //   Notification1.AppendToBody(
            //    '<BR><BR>Yours Sincerely,' +
            //    '<BR><BR><b>Judith Yamo><BR>' +
            //    '<b>For:Director General</b><BR>' +
            //    CompInfo.Name + '<BR>' +
            //    CompInfo.Address + '<BR>' +
            //    CompInfo."Address 2" + '<BR>' +
            //    CompInfo."Phone No." + '<BR>' +
            //    CompInfo.City);
                //   Notification1.AddBCC(CashManagementSetup."Imprest Email");
                //   Notification1.Send;
                HRShortlistedApplicants."Candidate Qualified" := true;
            until HRShortlistedApplicants.Next = 0;
            Message('Failed applicants succesfully notified');
        end else begin
            Message('No failed applicant found');
        end;
        Sleep(1000);
        Window.Close;
    end;
}

#pragma implicitwith restore

