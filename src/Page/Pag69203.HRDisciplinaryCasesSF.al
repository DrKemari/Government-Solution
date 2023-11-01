#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69203 "HR Disciplinary Cases SF"
{
    PageType = Card;
    SourceTable = "HR Disciplinary Cases";

    layout
    {
        area(content)
        {
            group("General Details")
            {
                Caption = 'General Details';
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Disciplinary Case field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accused employee';
                    ToolTip = 'Specifies the value of the Accused employee field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Case Description field.';
                }
                field("Case Severity"; Rec."Case Severity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Offence Type field.';
                }
                field("Mode of Lodging the Complaint"; Rec."Mode of Lodging the Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mode of Lodging the Case field.';
                }
                field("Body Handling The Complaint"; Rec."Body Handling The Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body Handling The Case field.';
                }
                field("Disciplinary Commitee"; Rec."Disciplinary Commitee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commitee Membership field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Accuser Is Staff"; Rec."Accuser Is Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Originator Is Staff field.';
                }
                field(Accuser; Rec.Accuser)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Originator field.';
                }
                field("Non Staff Originator"; Rec."Non Staff Originator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non Staff Originator field.';
                }
                field("Witness#1 Staff"; Rec."Witness#1 Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness#1 Staff field.';
                }
                field("Witness #1"; Rec."Witness #1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness #1 field.';
                }
                field("Non Staff Witness #1"; Rec."Non Staff Witness #1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non Staff Witness #1 field.';
                }
                field("Witness#2 Staff"; Rec."Witness#2 Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness#2 Staff field.';
                }
                field("Witness #2"; Rec."Witness #2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness #2 field.';
                }
                field("Non Staff Witness #2"; Rec."Non Staff Witness #2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non Staff Witness #2 field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Brief; Rec.Brief)
                {
                    ApplicationArea = Basic;
                    Visible = corec1;
                    ToolTip = 'Specifies the value of the Brief field.';
                }
            }
            group("Case Details")
            {
                Caption = 'Case Details';
                Visible = corec15;
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date To Discuss Case field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disciplinary Action Taken';
                    ToolTip = 'Specifies the value of the Disciplinary Action Taken field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Case Closure Date';
                    ToolTip = 'Specifies the value of the Case Closure Date field.';
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Professional Opinion';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Professional Opinion field.';
                }
                field("HR/Payroll Implications"; Rec."HR/Payroll Implications")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR/Payroll Implications field.';
                }
                field("Policy Guidlines In Effect"; Rec."Policy Guidlines In Effect")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Guidlines In Effect field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field("Legal Case No."; Rec."Legal Case No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal Case No. field.';
                }
                field("Legal Case Recommendation"; Rec."Legal Case Recommendation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal Case Recommendation field.';
                }
            }
            group("Case Appeal Information")
            {
                Caption = 'Case Appeal Information';
                Visible = corec2;
                field("Disciplinary Case Type"; Rec."Disciplinary Case Type")
                {
                    ApplicationArea = Basic;
                    Visible = corec2;
                    ToolTip = 'Specifies the value of the Disciplinary Case Type field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup4)
            {
                Image = Alerts;
                action("Notify Commitee By Email")
                {
                    ApplicationArea = Basic;
                    Image = Email;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Email all Board Members of this case';

                    trigger OnAction()
                    begin
                        Cases.SetRange("Case Number", Rec."Case Number");
                        if Rec."Disciplinary Commitee" <> '' then begin
                            HRDiscipMemb.Reset;
                            HRDiscipMemb.SetRange(HRDiscipMemb.Committee, Rec."Disciplinary Commitee");
                            if HRDiscipMemb.Find('-') then begin
                                repeat
                                    if Employee.Get(HRDiscipMemb.Code) then begin
                                        Filename := ObjCompany."HR Document Link" + Employee."First Name" + '_' + Employee."Last Name" + ' ' + Cases."Case Number" + '.pdf';

                                        HRCases.Reset;
                                        HRCases.SetRange(HRCases."Employee No", Rec."Employee No");
                                        HRCases.SetRange(HRCases."Case Number", Rec."Case Number");
                                        //Report.SaveAsPdf(69140, Filename, HRCases);
                                        Header := 'NOTICE OF HRMAC MEETING';

                                        if SMTPSetup.Get() then begin
                                            //   SenderEmail := SMTPSetup."Email Sender Address";
                                            //  SenderName := SMTPSetup."Email Sender Name";
                                        end;
                                        if Employee."E-Mail" <> '' then begin
                                            //     SMTPMail.Create(SenderName, SenderEmail, Employee."E-Mail", Header, '', true);
                                            // SMTPMail.AppendToBody('<br><br>');
                                            // SMTPMail.AppendToBody('Dear ' + Employee."First Name" + ' ' + Employee."Last Name" + ',');
                                            // SMTPMail.AppendToBody('<br><br>');
                                            // SMTPMail.AppendToBody('This is to invite you for a commitee meeting');// for the month of January 2014');
                                            // SMTPMail.AppendToBody('<br><br>');
                                            // SMTPMail.AppendToBody('Attached is the complete memo on the above subject');
                                            // SMTPMail.AppendToBody('<br><br>');
                                            // SMTPMail.AppendToBody('Thanks & Regards');
                                            // SMTPMail.AppendToBody('<br><br>');
                                            // SMTPMail.AppendToBody(SenderName);
                                            // SMTPMail.AppendToBody('<br><br>');
                                            // SMTPMail.AppendToBody('<HR>');
                                            // SMTPMail.AppendToBody('This is a system generated mail.');
                                            // SMTPMail.AppendToBody('<br><br>');
                                            // SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR@kerra.go.ke');
                                            // SMTPMail.AppendToBody('<br><br>');
                                            // SMTPMail.AddAttachment(Filename, 'Memo ' + Cases."Case Number" + '.pdf');
                                            // SMTPMail.Send;
                                            //MESSAGE('The email %1 for %2 is invalid',Employee."E-Mail",Employee."No.");

                                            //IF EXISTS(Filename) THEN
                                            //ERASE(Filename);
                                        end;
                                        //End email
                                    end;
                                until HRDiscipMemb.Next = 0;
                            end;
                        end;
                        Message('Notifications send');
                    end;
                }
            }
            group("Case Management")
            {
                Caption = 'Case Management';
                Image = BankContact;
                action("Create Court Case")
                {
                    ApplicationArea = Basic;
                    Image = BankContact;
                    Promoted = true;
                    Visible = corec15;
                    ToolTip = 'Executes the Create Court Case action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Handled By", Rec."handled by"::Court);
                        if Rec."Handled By" = Rec."handled by"::Court then begin
                            Rec.TestField("Case Created", false);
                            if Dialog.Confirm('Are you sure you want to send this case to Legal?', true) then begin
                                CaseRegister.Reset;
                                CaseRegister.Init;
                                CaseRegister.Status := CaseRegister.Status::New;
                                CaseRegister."Employee No" := Rec."Employee No";
                                CaseRegister."Case Number" := Rec."Case Number";
                                //CaseRegister.
                                CaseRegister."Nature of Claim" := Rec."Case Description";
                                CaseRegister."Case Desscription/Transpired" := Rec."Case Description";
                                Employee.Get(Rec."Employee No");
                                CaseRegister."Employee Name" := Rec."Employee Name";
                                CaseRegister."From Document Number" := Rec."Case Number";
                                CaseRegister.Insert(true);
                                if CaseRegister.Insert(true) then begin
                                    Rec."Case Created" := true;
                                    Rec."Legal Case No." := CaseRegister."No.";
                                    Rec.Status := Rec.Status::Closed;
                                    Rec.Modify;
                                end;
                            end;
                            Message('%1 Legal case created', CaseRegister."No.");
                            CR.Reset;
                            CR.SetRange(CR."No.", CaseRegister."No.");
                            Page.Run(56098, CR);
                        end;
                    end;
                }
                action("Close Case File")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = corec15;
                    ToolTip = 'Executes the Close Case File action.';
                    trigger OnAction()
                    begin
                        //TESTFIELD(Status,Status::Open);
                        Rec.TestField("Action Taken");
                        if Dialog.Confirm('Are you sure you want to close case ' + Rec."Case Number" + '?', true) then begin
                            if DisciplinaryStatus.Get(Rec."Action Taken") then begin
                                AssignmentMatrixX.Init;
                                AssignmentMatrixX."Employee No" := Rec."Employee No";
                                AssignmentMatrixX.Type := AssignmentMatrixX.Type::Deduction;
                                AssignmentMatrixX.Code := Rec."HR/Payroll Implications";
                                AssignmentMatrixX.Validate(AssignmentMatrixX.Code);
                                AssignmentMatrixX.Code := DisciplinaryStatus."Deductions Based On";
                                PayPeriod.Reset;
                                PayPeriod.SetRange(PayPeriod.Closed, false);
                                if PayPeriod.Find('-') then
                                    AssignmentMatrixX."Payroll Period" := PayPeriod."Starting Date";

                                case DisciplinaryStatus."Computation Method" of
                                    DisciplinaryStatus."computation method"::"Flat Amount":
                                        begin
                                            AssignmentMatrixX.Amount := -DisciplinaryStatus.Amount;
                                            //AssignmentMatrixX.Code:=DisciplinaryStatus."Deductions Based On";
                                            //AssignmentMatrixX.INSERT(TRUE);
                                        end;
                                    DisciplinaryStatus."computation method"::Percentage:
                                        begin
                                            AssMatx.Reset;
                                            AssMatx.SetRange(Code, DisciplinaryStatus."Deductions Based On");
                                            AssMatx.SetRange("Employee No", Rec."Employee No");
                                            if AssMatx.FindLast then begin
                                                AssignmentMatrixX.Amount := AssMatx.Amount * (DisciplinaryStatus.Percentage / 100);
                                                //AssignmentMatrixX.Code:=DisciplinaryStatus."Deductions Based On";
                                            end;
                                        end;
                                    DisciplinaryStatus."computation method"::Formula:
                                        begin

                                        end;
                                end;

                                AssignmentMatrixX.Insert(true);
                                Cases.Reset;
                                Cases.SetRange("Case Number", Rec."Case Number");
                                if Cases.FindSet then begin
                                    Rec.Status := Rec.Status::Closed;
                                    Rec."Closed By" := UserId;
                                    Rec.Modify(true);
                                    Message('Payroll deduction Added');
                                end;
                            end;

                        end;
                        Message('Case Closed');
                    end;
                }
                action("Submit Case")
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Submit Case action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Submitted;
                        Rec.Modify(true);
                        Message('Submitted Successfully');
                    end;
                }
                action("Print Show Cause Letter")
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    Visible = corec;
                    ToolTip = 'Executes the Print Show Cause Letter action.';
                    trigger OnAction()
                    begin
                        Message('Printing...');
                    end;
                }
                action("Appeal Case")
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Promoted = true;
                    Visible = corec1;
                    ToolTip = 'Executes the Appeal Case action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Brief);
                        if Rec."Handled By" = Rec."handled by"::Board then begin
                            Error('A decision by the Board or a Committee of the Board shall not be liable to appeal');
                        end;
                        Cases.Reset;
                        Cases.SetRange("Case Number", Rec."Case Number");
                        Cases.SetRange("Employee No", Rec."Employee No");
                        if Cases.FindSet then
                            Cases.Init;
                        Cases."Case Number" := '';
                        Cases."Accuser Is Staff" := Rec."Accuser Is Staff";
                        Cases.Accuser := Rec.Accuser;
                        Cases.Type := Cases.Type::Disciplinary;
                        Cases."Created By" := UserId;
                        Cases."Employee No" := Rec."Employee No";
                        Cases."Employee Name" := Rec."Employee Name";
                        Cases."Case Severity" := Rec."Case Severity";
                        Cases."Mode of Lodging the Complaint" := Rec."Mode of Lodging the Complaint";
                        Cases."Type of Disciplinary Case" := Rec."Type of Disciplinary Case";
                        Cases."Responsibility Center" := Rec."Responsibility Center";
                        Cases."Case Description" := 'Appeal for case for ' + Rec."Case Description";
                        Cases."Disciplinary Case Type" := Cases."disciplinary case type"::Appeal;
                        Cases.Insert(true);
                        HrCaseWitness.Reset;
                        HrCaseWitness.SetRange("Case Number", Rec."Case Number");
                        if HrCaseWitness.Find('-') then begin
                            repeat
                                HrCaseWitness.Init;
                                HrCaseWitness."Line No" := HrCaseWitness."Line No" + 100;
                                HrCaseWitness."Case Number" := Cases."Case Number";
                                HrCaseWitness."Witness is Staff" := HrCaseWitness."Witness is Staff";
                                HrCaseWitness."Employee No" := HrCaseWitness."Employee No";
                                HrCaseWitness."Witness Number" := HrCaseWitness."Witness Number";
                                HrCaseWitness."Witness Name" := HrCaseWitness."Witness Name";
                                HrCaseWitness."Witness Statement" := HrCaseWitness."Witness Statement";
                                HrCaseWitness.Insert;
                            until HrCaseWitness.Next = 0;
                        end;
                        Rec.Status := Rec.Status::Appealed;
                        Rec."Appealed case No" := Cases."Case Number";
                        Rec.Modify(true);
                        Message('Appeal Case Created');
                    end;
                }
                action("Initiate Case Proceedings")
                {
                    ApplicationArea = Basic;
                    Image = Resource;
                    Promoted = true;
                    Visible = corec;
                    ToolTip = 'Executes the Initiate Case Proceedings action.';
                    trigger OnAction()
                    begin
                        Rec."Case Discussion" := true;
                        Rec.Modify(true);
                        Message('Case Proceedings initiated, Proceed to the next step');
                    end;
                }
                action("Close Case Appeal")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = corec2;
                    ToolTip = 'Executes the Close Case Appeal action.';
                    trigger OnAction()
                    begin
                        //TESTFIELD(Status,Status::Open);
                        Rec.TestField("Action Taken");
                        if Dialog.Confirm('Are you sure you want to close the Appeal' + Rec."Case Number" + '?', true) then begin
                            if DisciplinaryStatus.Get(Rec."Action Taken") then begin
                                AssignmentMatrixX.Init;
                                AssignmentMatrixX."Employee No" := Rec."Employee No";
                                AssignmentMatrixX.Type := AssignmentMatrixX.Type::Deduction;
                                AssignmentMatrixX.Code := Rec."HR/Payroll Implications";
                                AssignmentMatrixX.Validate(AssignmentMatrixX.Code);
                                AssignmentMatrixX.Code := DisciplinaryStatus."Deductions Based On";
                                PayPeriod.Reset;
                                PayPeriod.SetRange(PayPeriod.Closed, false);
                                if PayPeriod.Find('-') then
                                    AssignmentMatrixX."Payroll Period" := PayPeriod."Starting Date";

                                case DisciplinaryStatus."Computation Method" of
                                    DisciplinaryStatus."computation method"::"Flat Amount":
                                        begin
                                            AssignmentMatrixX.Amount := -DisciplinaryStatus.Amount;
                                            //AssignmentMatrixX.Code:=DisciplinaryStatus."Deductions Based On";
                                            //AssignmentMatrixX.INSERT(TRUE);
                                        end;
                                    DisciplinaryStatus."computation method"::Percentage:
                                        begin
                                            AssMatx.Reset;
                                            AssMatx.SetRange(Code, DisciplinaryStatus."Deductions Based On");
                                            AssMatx.SetRange("Employee No", Rec."Employee No");
                                            if AssMatx.FindLast then begin
                                                AssignmentMatrixX.Amount := AssMatx.Amount * (DisciplinaryStatus.Percentage / 100);
                                                //AssignmentMatrixX.Code:=DisciplinaryStatus."Deductions Based On";
                                            end;
                                        end;
                                    DisciplinaryStatus."computation method"::Formula:
                                        begin

                                        end;
                                end;

                                AssignmentMatrixX.Insert(true);
                                Cases.Reset;
                                Cases.SetRange("Case Number", Rec."Case Number");
                                if Cases.FindSet then begin
                                    Rec.Status := Rec.Status::Closed;
                                    Rec."Closed By" := UserId;
                                    Rec.Modify(true);
                                    Message('Payroll deduction Added');
                                end;
                            end;

                        end;
                        Message('Appeal Closed');
                    end;
                }
                action("Attach Case Documents")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Case Documents';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Attach Case Documents action.';
                    trigger OnAction()
                    var
                        filename: Text;
                        filecu: Codeunit "File Management";
                        setuprec: Record "Purchases & Payables Setup";
                    begin
                        // setuprec.RESET;
                        // setuprec.GET;
                        // filename:=filecu.OpenFileDialog('Attach Case Documents','Select Memo Name','');
                        // IF filename <>'' THEN BEGIN
                        //    filecu.CopyClientFile(filename,setuprec."Direct Documents Path"+filecu.GetFileName(filename),TRUE);
                        // "Justification Memo":= setuprec."Direct Documents Path"+filecu.GetFileName(filename);
                        Message('Memo Attached Successfully!');
                        // END;
                    end;
                }
                action("Send Show Cause Letter")
                {
                    ApplicationArea = Basic;
                    Image = SendAsPDF;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = corec15;
                    ToolTip = 'Executes the Send Show Cause Letter action.';
                    trigger OnAction()
                    begin
                        //TESTFIELD(Status,Status::Open);

                        Message('Send Show Cause Letter Sent Successfully');
                    end;
                }
                action("Case Witnesses")
                {
                    ApplicationArea = Basic;
                    Image = Resource;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Hr Case Witness";
                    RunPageLink = "Case Number" = field("Case Number");
                    ToolTip = 'Executes the Case Witnesses action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        corec := false;
        if (Rec.Status = Rec.Status::Submitted) and (Rec."Case Discussion" = false) then begin
            corec := true;
        end;
        corec15 := false;
        if (Rec.Status = Rec.Status::Submitted) and (Rec."Case Discussion" = true) then begin
            corec15 := true;
        end;
        corec1 := false;
        if Rec.Status = Rec.Status::Closed then begin
            corec1 := true;
        end;
        corec2 := false;
        if Rec.Status = Rec.Status::Appealed then begin
            corec2 := true;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Disciplinary;
        Rec.Modify(true);
    end;

    trigger OnOpenPage()
    begin
        corec := false;
        if (Rec.Status = Rec.Status::Submitted) and (Rec."Case Discussion" = false) then begin
            corec := true;
        end;
        corec15 := false;
        if (Rec.Status = Rec.Status::Submitted) and (Rec."Case Discussion" = true) then begin
            corec15 := true;
        end;
        corec1 := false;
        if Rec.Status = Rec.Status::Closed then begin
            corec1 := true;
        end;
        corec2 := false;
        if Rec.Status = Rec.Status::Appealed then begin
            corec2 := true;
        end;
    end;

    var
        Cases: Record "HR Disciplinary Cases";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Employee: Record Employee;
        HRDiscipMemb: Record "Disciplinary Committee Members";
        HRCases: Record "HR Disciplinary Cases";
        CaseRegister: Record "Case Register";
        AssignmentMatrixX: Record "Assignment Matrix-X";
        DisciplinaryStatus: Record "Disciplinary Status Table";
        PayPeriod: Record "Payroll PeriodX";
        CR: Record "Case Register";
        AmountDeducted: Decimal;
        Emp: Record Employee;
        AssMatx: Record "Assignment Matrix-X";
        HRDisciplinaryCases: Record "HR Disciplinary Cases";
        corec: Boolean;
        corec1: Boolean;
        corec2: Boolean;
        corec15: Boolean;
        HrCaseWitness: Record "Hr Case Witness";
}

#pragma implicitwith restore

