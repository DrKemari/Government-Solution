#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 85000 "Examination"
{

    trigger OnRun()
    begin
    end;

    var
        StudentManagement: Codeunit "Student management";
        SMSIntegration: Codeunit "SMS Integration";

    procedure SendEmaiNotificationOnApplicantAccountActivation(ApplicantRequest: Record "Dynasoft Portal User")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetupNew: Record "Examination Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        CompInfo.Get;
        HRSetup.Get;
        HRSetupNew.Get;
        RequesterEmail := ApplicantRequest."Authentication Email";
        RequesterName := ApplicantRequest."Full Name";
        Counter := Counter + 1;
        PortalUser.Reset;
        PortalUser.SetRange("Authentication Email", ApplicantRequest."Authentication Email");
        if PortalUser.FindSet then
            Password := PortalUser."Password Value";
        IF CompInfo."E-Mail" = '' THEN
            ERROR('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := CompInfo."E-Mail";
        CustEmail := HRSetup."E-Mail";
        CompanyDetails := 'Dear' + ApplicantRequest."Full Name" + ',' + '<BR>';
        SenderMessage := 'Your student account has been created on the e-hrmpeb portal. Your registration details are as follows:</BR>' + '</BR></BR>';
        SupplierDetails := '</BR>' + '<BR></BR> Name:</>' + ApplicantRequest."Full Name" + '</BR>' +
        '<BR>Mobile Phone No:' + ApplicantRequest."Mobile Phone No." + '</BR>' + '</BR></BR>';
        LoginDetails := 'User Name: ' + ApplicantRequest."Authentication Email" + '<BR></BR>' + 'Password: ' + ApplicantRequest."Password Value";
        ActivationDetails := '<BR></BR>To access the hrmpeb services, login to the ehrmpeb portal.</BR></BR>.' + ' Use this e-hrmpeb link .' + ' ' + '<b><a href="https://online.hrmpeb.or.ke/">to access the portal and login</a></b><BR>';

        if CustEmail = '' then
            exit;
        emailhdr := 'student Account Activation (Applicant Account No:' + ApplicantRequest."Record ID" + ')';
        // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
        // cu400.AddCC(RequesterEmail);
        // cu400.AppendToBody(ProcNote);
        // cu400.Send;
        // SendingDate := Today;
        // SendingTime := Time;
        EmailMessage.Create(RequesterEmail, emailhdr, CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails + ProcNote);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);


    end;

    procedure RegistrationStudent(StudentProcessingHeader: Record "Student Processing Header")
    var
        ApplicantProfile: Record Customer;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        PortalUSer: Record "Dynasoft Portal User";
        RandomDigit: Text[50];
    begin
        PortalUSer.Reset;
        PortalUSer.SetRange("Id Number", StudentProcessingHeader."ID Number/Passport No.");
        PortalUSer.SetRange("Authentication Email", StudentProcessingHeader.Email);
        if PortalUSer.Find('-') then begin

        end else begin

            PortalUSer.Init;
            PortalUSer."User Name" := StudentProcessingHeader.Email;
            PortalUSer."Full Name" := StudentProcessingHeader."First Name" + '  ' + StudentProcessingHeader."Middle Name" + ' ' + StudentProcessingHeader.Surname;
            PortalUSer.FirstName := StudentProcessingHeader."First Name";
            PortalUSer.LastName := StudentProcessingHeader.Surname;
            PortalUSer.MiddleName := StudentProcessingHeader."Middle Name";
            PortalUSer."Authentication Email" := StudentProcessingHeader.Email;
            PortalUSer."Mobile Phone No." := StudentProcessingHeader."Phone No.";
            PortalUSer.State := PortalUSer.State::Enabled;
            PortalUSer."Record Type" := PortalUSer."record type"::Customer;
            PortalUSer."Record ID" := StudentProcessingHeader."Student No.";
            PortalUSer."Id Number" := StudentProcessingHeader."ID Number/Passport No.";
            RandomDigit := CreateGuid;
            RandomDigit := DelChr(RandomDigit, '=', '{}-01');
            RandomDigit := CopyStr(RandomDigit, 1, 8);
            PortalUSer."Password Value" := RandomDigit;
            PortalUSer."Last Modified Date" := Today;
            PortalUSer.Insert(true);
            StudentManagement.FnSendEmaiNotificationOnApplicantAccountActivation(PortalUSer);

        end;
    end;

    procedure RegistrationUpdateStudent(ExaminationAccount: Record "Dynasoft Portal User"; NewEmail: Text)
    var
        ApplicantProfile: Record Customer;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        PortalUSer: Record "Dynasoft Portal User";
        RandomDigit: Text[50];
        PortalUSer1: Record "Dynasoft Portal User";
        RegAccount: Record "Examination Account";
        ProcessingHeader: Record "Student Processing Header";
        Customer: Record Customer;
    begin
        PortalUSer1.Reset;
        PortalUSer1.SetRange("Id Number", ExaminationAccount."Id Number");
        PortalUSer1.SetRange("Authentication Email", ExaminationAccount."Authentication Email");
        if PortalUSer1.Find('-') then begin
            //disable the account and creat a new one
            PortalUSer1.State := PortalUSer.State::Disabled;
            PortalUSer1."Updated By" := UserId;
            PortalUSer1."Updated On" := CurrentDatetime;
            PortalUSer1.Modify(true);
            PortalUSer.Init;
            PortalUSer."User Name" := NewEmail;
            PortalUSer."Full Name" := ExaminationAccount."Full Name";
            PortalUSer.FirstName := ExaminationAccount.FirstName;
            PortalUSer.LastName := ExaminationAccount.LastName;
            PortalUSer.MiddleName := ExaminationAccount.MiddleName;
            PortalUSer."Authentication Email" := NewEmail;
            PortalUSer."Mobile Phone No." := ExaminationAccount."Mobile Phone No.";
            PortalUSer.State := PortalUSer.State::Enabled;
            PortalUSer."Record Type" := PortalUSer."record type"::Customer;
            PortalUSer."Record ID" := ExaminationAccount."Record ID";
            PortalUSer."Id Number" := ExaminationAccount."Id Number";
            RandomDigit := CreateGuid;
            RandomDigit := DelChr(RandomDigit, '=', '{}-01');
            RandomDigit := CopyStr(RandomDigit, 1, 8);
            PortalUSer."Password Value" := RandomDigit;
            PortalUSer."Last Modified Date" := Today;
            PortalUSer.Insert(true);
            StudentManagement.FnSendEmaiNotificationOnApplicantAccountActivation(PortalUSer);
            //modify the other tables
            RegAccount.Reset;
            RegAccount.SetRange("ID No.", PortalUSer."Id Number");
            if RegAccount.FindSet then begin
                repeat
                    RegAccount.Email := NewEmail;
                    RegAccount.Modify(true);
                until RegAccount.Next = 0
            end;

            Customer.Reset;
            Customer.SetRange("ID. No.", PortalUSer."Id Number");
            if Customer.FindFirst then begin
                Customer."E-Mail" := NewEmail;
                Customer.Modify(true);
            end;
            ProcessingHeader.Reset;
            ProcessingHeader.SetRange("ID Number/Passport No.", PortalUSer."Id Number");
            ProcessingHeader.SetRange(Posted, false);
            if ProcessingHeader.FindSet then begin
                repeat
                    ProcessingHeader.Email := NewEmail;
                    ProcessingHeader.Modify(true);
                until ProcessingHeader.Next = 0;
            end
        end
    end;


    procedure ValidatePendingRenewals(Header: Record "Student Processing Header")
    var
        ExaminationAccount: Record "Examination Account";
        ProcessingLines: Record "Student Processing Lines";
        "EntryNo.": Integer;
        TXT001: label 'The student %1,has no pending renewals';
        ExaminationSetup: Record "Examination Setup";
    begin
        ExaminationSetup.Get;
        ExaminationSetup.TestField("Renewal Fee");
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", Header."Student Reg. No.");
        if ExaminationAccount.FindSet then begin
            if ExaminationAccount."Renewal Pending" > 0 then begin
                //insert line
                ProcessingLines.Reset;
                if ProcessingLines.FindLast then
                    "EntryNo." := ProcessingLines."Line No.";
                ProcessingLines.Reset;
                ProcessingLines."Booking Header No." := Header."No.";
                ProcessingLines."Line No." := "EntryNo." + 1;
                ProcessingLines."Booking Type" := ProcessingLines."booking type"::Renewal;
                ProcessingLines.Part := ' ';
                ProcessingLines.Paper := ' ';
                ProcessingLines.Description := 'Renewal Fees';
                ProcessingLines.Amount := ExaminationSetup."Renewal Fee" * ExaminationAccount."Renewal Pending";
                ProcessingLines."Amount LCY" := ProcessingLines.Amount;
                ProcessingLines.Insert(true);

            end else
                Error(TXT001, ExaminationAccount."Registration No.");
        end
    end;

    procedure RunAutoExempt(StudentProcessingHeader: Record "Student Processing Header")
    var
        StudentHeader: Record "Student Processing Header";
        ExamTransactionType: Record "Exam Transaction Type";
        StudentBookingLines: Record "Student Processing Lines";
        ExemptionsSetup: Record "Exemptions Setup";
        LineNo: Integer;
        Subject: Record Papers;
        ResourcePrice: Record "Resource Price";
        Resource: Record Resource;
        Rate: Decimal;
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
    begin
        StudentHeader.Reset;
        StudentHeader.SetRange("No.", StudentProcessingHeader."No.");
        if StudentHeader.FindSet then begin
            ExemptionsSetup.Reset;
            ExemptionsSetup.SetRange("Examination Code", StudentHeader."Examination ID");
            if ExemptionsSetup.FindSet then begin
                repeat
                    LineNo := 0;
                    StudentBookingLines.Reset;
                    if StudentBookingLines.FindLast then begin
                        LineNo := StudentBookingLines."Line No.";
                    end;
                    Subject.Reset;
                    Subject.SetRange(Code, ExemptionsSetup."Exemption Subject Code");
                    if Subject.FindFirst then begin
                        //get the part and section for each paper

                        StudentBookingLines.Init;
                        StudentBookingLines."Line No." := LineNo + 1;
                        StudentBookingLines."Course Id" := StudentProcessingHeader."Examination ID";
                        StudentBookingLines."Booking Header No." := StudentProcessingHeader."No.";
                        StudentBookingLines.Part := Subject.Level;
                        StudentBookingLines.Section := Subject.Section;
                        StudentBookingLines.Paper := Subject.Code;
                        Rate := 1;
                        //get the level of the paper

                        Resource.Reset;
                        Resource.SetRange("Course ID", StudentProcessingHeader."Examination ID");
                        //Resource.SetRange("Part ID", Subject.Level);
                        if Resource.FindSet then begin
                            ResourcePrice.Reset;
                            ResourcePrice.SetRange(Code, Resource."No.");
                            ResourcePrice.SetRange("Work Type Code", Resource."No.");
                            ResourcePrice.SetRange("Currency Code", StudentHeader."Currency Code");
                            if ResourcePrice.FindSet then begin
                                //MESSAGE('%1',ResourcePrice."Unit Price");
                                StudentBookingLines.Amount := -ResourcePrice."Unit Price";
                                Rate := CurrExchRate.ExchangeRate(StudentProcessingHeader.Date, StudentProcessingHeader."Currency Code");
                                StudentBookingLines."Amount LCY" := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(StudentProcessingHeader.Date, StudentProcessingHeader."Currency Code",
                                StudentBookingLines.Amount, Rate));
                                //StudentBookingLines."Amount LCY":=StudentBookingLines.Amount*Rate;
                            end;
                        end;
                        //get amount for exemption for the subject

                        StudentBookingLines.Exempted := true;
                        StudentBookingLines.Insert;
                    end;
                until ExemptionsSetup.Next = 0;
            end;
        end
    end;

    procedure PostExaminationVoucher(var StudentProcessingHeader: Record "Student Processing Header") Available: Boolean
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        EntryNo: Integer;
        TXT001: label 'Examination Booking for %1  has been done succesfully';
        ExemptionEntries: Record "Exemption Entries";
        StudentBookingLines: Record "Student Processing Lines";
        Papers: Record Papers;
        StudentProcessingHeader1: Record "Student Processing Header";
        ExamBookingEntries1: Record "Exam Booking Entries";
        ExamBookingEntries2: Record "Exam Booking Entries";
        ExamBookingEntries3: Record "Exam Booking Entries";
        HeaderNo: Code[30];
        TXT002: label 'The center %1,selected cannot accomodate the student';
    begin
        //create exam booking entries
        if not StudentProcessingHeader."Additional Exemption" = true then begin
            ExamBookingEntries2.Reset;
            ExamBookingEntries2.SetRange("Student Reg No.", StudentProcessingHeader."Student Reg. No.");
            ExamBookingEntries2.SetRange("Exam Sitting", StudentProcessingHeader."Examination Sitting");
            ExamBookingEntries2.SetRange(Status, ExamBookingEntries2.Status::Open);
            ExamBookingEntries2.SetRange(Cancelled, false);
            if ExamBookingEntries2.FindFirst then begin
                //mark document as posted
                StudentProcessingHeader.Posted := true;
                StudentProcessingHeader."Posted By" := UserId;
                StudentProcessingHeader."Posted Date" := Today;
                StudentProcessingHeader.Modify(true);
                Message('The booking %1 is posted succesfully', StudentProcessingHeader."No.");
                exit;
            end;
        end;
        if CheckSlotAvailability(StudentProcessingHeader) = true then begin
            StudentBookingLines.Reset;
            StudentBookingLines.SetRange("Booking Header No.", StudentProcessingHeader."No.");
            StudentBookingLines.SetRange(Exempted, false);
            if StudentBookingLines.FindSet then begin
                repeat
                    if StudentBookingLines."Transaction Type" = StudentBookingLines."transaction type"::Booking then begin
                        //modify the failed booking entries as blocked
                        ExamBookingEntries1.Reset;
                        ExamBookingEntries1.SetRange("Student Reg No.", StudentProcessingHeader."Student Reg. No.");
                        ExamBookingEntries1.SetRange(Paper, StudentBookingLines.Paper);
                        ExamBookingEntries1.SetRange(Status, ExamBookingEntries1.Status::Failed);
                        if ExamBookingEntries1.FindFirst then begin
                            ExamBookingEntries1.Blocked := true;
                            ExamBookingEntries1.Modify(true);
                        end;
                        ExamBookingEntries.Reset;
                        if ExamBookingEntries.FindLast then begin
                            EntryNo := ExamBookingEntries."Entry No.";
                        end;

                        //if only paper based
                        ExamBookingEntries.Reset;
                        if ExamBookingEntries.FindLast then begin
                            EntryNo := ExamBookingEntries."Entry No.";
                        end;

                        if StudentProcessingHeader."Additional Exemption" = true then begin
                            ExamBookingEntries3.Reset;
                            ExamBookingEntries3.SetRange("Student Reg No.", StudentProcessingHeader."Student Reg. No.");
                            ExamBookingEntries3.SetRange("Exam Sitting", StudentProcessingHeader."Examination Sitting");
                            ExamBookingEntries3.SetRange(Status, ExamBookingEntries3.Status::Open);
                            if ExamBookingEntries3.FindFirst then begin
                                HeaderNo := ExamBookingEntries3.Code;
                            end;
                        end
                        else begin
                            HeaderNo := StudentProcessingHeader."No.";
                        end;
                        ExamBookingEntries.Init;
                        ExamBookingEntries."Entry No." := EntryNo + 1;
                        ExamBookingEntries.Code := HeaderNo;
                        ExamBookingEntries."Student Reg No." := StudentProcessingHeader."Student Reg. No.";
                        ExamBookingEntries.Validate("Student Reg No.");
                        ExamBookingEntries."Exam Center" := StudentProcessingHeader."Preferred Exam Center";
                        ExamBookingEntries.Examination := StudentProcessingHeader."Examination ID";
                        ExamBookingEntries.Paper := StudentBookingLines.Paper;
                        ExamBookingEntries.Part := StudentBookingLines.Part;
                        ExamBookingEntries.Section := StudentBookingLines.Section;
                        ExamBookingEntries."Project Code" := StudentProcessingHeader."Examination Project Code";
                        ExamBookingEntries."Exam Center" := StudentProcessingHeader."Examination Center Code";
                        ExamBookingEntries.Validate("Exam Center");
                        ExamBookingEntries."Exam Sitting" := StudentProcessingHeader."Examination Sitting";
                        ExamBookingEntries.Description := StudentBookingLines.Description;
                        ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
                        ExamBookingEntries."Fee Amount" := StudentBookingLines."Amount LCY";
                        ExamBookingEntries.Validate("Currency Code");

                        ExamBookingEntries.Insert;
                    end;


                    if StudentBookingLines."Transaction Type" = StudentBookingLines."transaction type"::Renewal then begin
                        //validate renewal
                        BookingRenewalUpdateDetails(StudentProcessingHeader);

                    end

                until StudentBookingLines.Next = 0;
            end;

            StudentBookingLines.Reset;
            StudentBookingLines.SetRange("Booking Header No.", StudentProcessingHeader."No.");
            StudentBookingLines.SetRange(Exempted, true);
            if StudentBookingLines.FindSet then begin
                repeat
                    //create exemption entries
                    EntryNo := 0;
                    //insert a paper
                    if ExemptionEntries.FindLast then begin
                        EntryNo := ExemptionEntries."Entry No.";
                    end;
                    ExemptionEntries.Init;
                    ExemptionEntries."Entry No." := EntryNo + 1;
                    ExemptionEntries."Exemption Voucher No." := StudentProcessingHeader."No.";
                    ExemptionEntries."Course Id" := StudentBookingLines."Course Id";
                    ExemptionEntries.Type := ExemptionEntries.Type::Paper;
                    ExemptionEntries."No." := StudentBookingLines.Paper;
                    ExemptionEntries."Stud. Cust No." := StudentProcessingHeader."Student No.";
                    ExemptionEntries."Stud. Reg. No" := StudentProcessingHeader."Student Reg. No.";
                    ExemptionEntries.Validate("No.");
                    ExemptionEntries."Amount LCY" := -StudentBookingLines."Amount LCY";
                    ExemptionEntries.Amount := -StudentBookingLines.Amount;
                    ExemptionEntries.Insert;
                until StudentBookingLines.Next = 0;
            end;
            //MESSAGE(TXT001,StudentProcessingHeader."No.");
            Commit;
            //BookingSendReceipt(StudentProcessingHeader); //receipt to be sent by job queue
            StudentProcessingHeader1.Reset;
            StudentProcessingHeader1.SetRange("No.", StudentProcessingHeader."No.");
            StudentProcessingHeader1.SetRange(Posted, false);
            if StudentProcessingHeader1.FindSet then begin


                StudentProcessingHeader1.Posted := true;
                StudentProcessingHeader1."Posted By" := UserId;
                StudentProcessingHeader1."Posted On" := CurrentDatetime;
                StudentProcessingHeader1."Posted Date" := Today;
                StudentProcessingHeader1.Modify(true);
            end;
            Available := true;
        end else begin
            Available := false;
            if StudentProcessingHeader.Portal = false then
                Error(TXT002, StudentProcessingHeader."Examination Center");
        end
    end;

    procedure RunAutoExemptSingle(StudentProcessingHeader: Record "Student Processing Header")
    var
        StudentHeader: Record "Student Processing Header";
        ExamTransactionType: Record "Exam Transaction Type";
        StudentBookingLines: Record "Exemption Lines";
        ExemptionsSetup: Record "Exemptions Setup";
        LineNo: Integer;
        Subject: Record Papers;
        Papers: Record Papers;
        ResourcePrice: Record "Resource Price";
        Resource: Record Resource;
        Rate: Decimal;
        ExemptionQualifications: Record "Exemption Qualifications";
        StudentBookingLines1: Record "Exemption Lines";
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        TXT001: label 'Kindly input the qualifications to run this process';
    begin
        StudentHeader.Reset;
        StudentHeader.SetRange("No.", StudentProcessingHeader."No.");
        if StudentHeader.FindSet then begin
            ExemptionsSetup.Reset;
            ExemptionsSetup.SetRange("Examination Code", StudentHeader."Examination ID");
            if ExemptionsSetup.FindSet then begin
                repeat
                    LineNo := 0;
                    StudentBookingLines.Reset;
                    if StudentBookingLines.FindLast then begin
                        LineNo := StudentBookingLines."Line No.";
                    end;
                    Subject.Reset;
                    Subject.SetRange("Not to be Exempted", false);
                    Subject.SetRange(Code, ExemptionsSetup."Exemption Subject Code");
                    if Subject.FindFirst then begin
                        //get the part and section for each paper

                        //check the lines do not replicate the course
                        StudentBookingLines1.Reset;
                        StudentBookingLines1.SetRange("Header No.", StudentHeader."No.");
                        StudentBookingLines1.SetRange("No.", Subject.Code);
                        if not StudentBookingLines1.FindSet then begin
                            StudentBookingLines.Init;
                            StudentBookingLines."Line No." := LineNo + 1;
                            StudentBookingLines."Course Id" := StudentHeader."Examination ID";
                            StudentBookingLines."Header No." := StudentHeader."No.";
                            StudentBookingLines.Type := StudentBookingLines.Type::Paper;
                            StudentBookingLines."No." := Subject.Code;
                            StudentBookingLines.Name := Subject.Description;
                            StudentBookingLines.Validate("No.");
                            Rate := 1;
                            Resource.Reset;
                            Resource.SetRange("Course ID", StudentHeader."Examination ID");
                            Resource.SetRange("Part ID", Subject.Level);
                            if Resource.FindSet then begin
                                repeat

                                    ResourcePrice.Reset;
                                    ResourcePrice.SetRange(Code, Resource."No.");
                                    ResourcePrice.SetRange("Document Type", ResourcePrice."document type"::Exemption);
                                    ResourcePrice.SetRange("Currency Code", StudentHeader."Currency Code");
                                    if ResourcePrice.FindSet then begin
                                        StudentBookingLines.Amount := ResourcePrice."Unit Price";
                                        StudentBookingLines."Amount LCY" := ResourcePrice."Unit Price";
                                        if StudentBookingLines.Amount <> 0 then
                                            StudentBookingLines.Insert(true);
                                    end;
                                until Resource.Next = 0;
                            end;

                            //   StudentBookingLines.Insert(true);
                        end;
                        //get amount for exemption for the subject

                    end;
                until ExemptionsSetup.Next = 0;
            end;
            // FnClearAttemptedPapers(StudentHeader."No.");
            //          FNClearExemptedPpaers2(StudentHeader."No.");
        end;

        MESSAGE('Suggested');
    end;

    procedure PostExemptionVoucher(StudentProcessingHeader: Record "Student Processing Header") Found: Boolean
    var
        ExemptionLines: Record "Exemption Lines";
        BookingLines: Record "Student Processing Lines";
        ExemptionEntries: Record "Exemption Entries";
        Section: Record Section;
        Papers: Record Papers;
        LineNo: Integer;
        ExemptionEntries1: Record "Exemption Entries";
        TXT001: label 'The exemption entries for %1,already exists';
        TXT002: label 'The exemption entries for %1 have been effected succesfully';
        BookingEntries: Record "Exam Booking Entries";
        Header: Record "Student Processing Header";
    begin

        ExemptionEntries1.Reset;
        ExemptionEntries1.SetRange("Exemption Voucher No.", StudentProcessingHeader."No.");
        if ExemptionEntries1.FindSet then begin
            Header.Reset;
            Header.SetRange("No.", StudentProcessingHeader."No.");
            if Header.FindFirst then begin
                Header.Posted := true;
                Header."Posted By" := UserId;
                Header."Posted Date" := Today;
                Header."Posted On" := CurrentDatetime;
                Header.Modify(true);
            end;
            exit;

            // ERROR(TXT001,ExemptionEntries1."Stud. Reg. No");

        end;


        Found := false;
        ExemptionLines.Reset;
        ExemptionLines.SetRange("Header No.", StudentProcessingHeader."No.");
        ExemptionLines.SetFilter("No.", '<>%1', '');
        if ExemptionLines.FindSet then begin
            repeat
                LineNo := 0;
                if ExemptionLines.Type = ExemptionLines.Type::Section then begin
                    Papers.Reset;
                    Papers.SetRange(Section, ExemptionLines."No.");
                    if Papers.FindSet then begin
                        repeat
                            if ExemptionEntries.FindLast then begin
                                LineNo := ExemptionEntries."Entry No.";
                            end;
                            ExemptionEntries.Init;
                            ExemptionEntries."Entry No." := LineNo + 1;
                            ExemptionEntries."Exemption Voucher No." := StudentProcessingHeader."No.";
                            ExemptionEntries."Course Id" := ExemptionLines."Course Id";
                            ExemptionEntries.Type := ExemptionEntries.Type::Paper;
                            ExemptionEntries."No." := Papers.Code;
                            ExemptionEntries."Stud. Cust No." := StudentProcessingHeader."Student No.";
                            ExemptionEntries."Stud. Reg. No" := StudentProcessingHeader."Student Reg. No.";
                            ExemptionEntries.Amount := ExemptionLines.Amount;
                            ExemptionEntries."Amount LCY" := ExemptionLines."Amount LCY";
                            ExemptionEntries.Validate("No.");
                            ExemptionEntries.Insert;
                        until Papers.Next = 0;
                    end
                end else begin
                    LineNo := 0;
                    //insert a paper
                    if ExemptionEntries.FindLast then begin
                        LineNo := ExemptionEntries."Entry No.";
                    end;
                    //check if paper is in booking entries and delete
                    BookingEntries.Reset;
                    BookingEntries.SetRange("Student Reg No.", StudentProcessingHeader."Student Reg. No.");
                    BookingEntries.SetRange(Paper, ExemptionLines."No.");
                    BookingEntries.SetRange(Status, BookingEntries.Status::Failed);
                    if BookingEntries.FindFirst then begin
                        BookingEntries.Delete;
                    end;
                    ExemptionEntries.Init;
                    ExemptionEntries."Entry No." := LineNo + 1;
                    ExemptionEntries."Exemption Voucher No." := StudentProcessingHeader."No.";
                    ExemptionEntries."Course Id" := ExemptionLines."Course Id";
                    ExemptionEntries.Type := ExemptionEntries.Type::Paper;
                    ExemptionEntries."No." := ExemptionLines."No.";
                    ExemptionEntries.Validate("No.");
                    ExemptionEntries."Stud. Cust No." := StudentProcessingHeader."Student No.";
                    ExemptionEntries."Stud. Reg. No" := StudentProcessingHeader."Student Reg. No.";
                    ExemptionEntries.Amount := ExemptionLines.Amount;
                    ExemptionEntries."Amount LCY" := ExemptionLines."Amount LCY";
                    ExemptionEntries.Insert;
                end;
            until ExemptionLines.Next = 0;
            //added for sending the receipt and Exemption Letter
            ExemptionSendReceipt(StudentProcessingHeader);
            //End of sending Letter
            Message(TXT002, StudentProcessingHeader."No.");
        end;
        exit(Found);
    end;

    procedure ExemptionCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TXT004: label 'The invoice %1,has been sent to the student succesfuly';
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        Cust: Record Customer;
        Contact: Record Contact;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        //CashMngmntSetup: Record cash mana
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ExamFee: Record Resource;
        ExamFeeCost: Record "Resource Cost";
        Amount: Decimal;
        WorkType: Record "Work Type";
        Existing: Boolean;
        ExamAccountNo: Code[30];
        ResourcePrice: Record "Resource Price";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
        TXT001: label 'The invoice %1,has been created succesfully';
        SalesHeader: Record "Sales Header";
        TXT002: label 'An invoice %1 already exists for the application %2';
        Header: Record "Student Processing Header";
        ExemptionEntries: Record "Exemption Entries";
        TXT003: label 'The student %1,already has exemptions processed for the course %2';
        TXT005: label 'Ensure mandatory documents are attached';
        DocumentLink: Record "Record Link";
        PostedInvoice: Record "Sales Invoice Header";
        TotalAmount: Decimal;
        ProcessingLines: Record "Student Processing Lines";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
    begin
        // IF BulkProcessingHeader.Portal=TRUE THEN BEGIN
        // DocumentLink.RESET;
        // DocumentLink.SETRANGE("Record ID",BulkProcessingHeader.RECORDID);
        // IF NOT  DocumentLink.FINDSET THEN BEGIN
        //  ERROR(TXT005);
        // END
        // END;
        if not BulkProcessingHeader."Additional Exemption" = true then begin
            ExemptionEntries.Reset;
            ExemptionEntries.SetRange("Course Id", BulkProcessingHeader."Examination ID");
            ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
            ExemptionEntries.SetRange(Deleted, false);
            if ExemptionEntries.FindSet then begin
                Error(TXT003, BulkProcessingHeader."Student Reg. No.", BulkProcessingHeader."Examination Description");
            end;
        end;
        //ensure no posted invoice exists
        PostedInvoice.Reset;
        PostedInvoice.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        PostedInvoice.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not PostedInvoice.FindFirst then begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if not SalesInv.FindFirst then begin
                SalesInv.Init;
                SalesInv."Document Type" := SalesInv."document type"::Invoice;
                SalesInv."No." := '';
                SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
                SalesInv."Document Date" := Today;
                SalesInv."Order Date" := Today;
                SalesInv."Posting Date" := Today;
                SalesInv."Currency Code" := BulkProcessingHeader."Currency Code";
                SalesInv."External Document No." := BulkProcessingHeader."No.";
                SalesInv.Type := SalesInv.Type::Normal;
                SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
                SalesInv."Prepayment %" := 100;//enforce prepayment`
                SalesInv.Insert(true);

                //get resource entry
                ResourcePrice.Reset;
                ResourcePrice.SetRange(Code, BulkProcessingHeader."Fee Type");
                if ResourcePrice.FindSet then begin
                    SalesLine.Init;
                    SalesLine."Document Type" := SalesLine."document type"::Invoice;
                    SalesLine."Document No." := SalesInv."No.";
                    SalesLine.Type := SalesLine.Type::Resource;
                    SalesLine."No." := ResourcePrice.Code;
                    SalesLine.Validate("No.");
                    SalesLine.Quantity := 1;
                    //          //get total exemption
                    //          ProcessingLines.RESET;
                    //          ProcessingLines.SETRANGE("Booking Header No.",BulkProcessingHeader."No.");
                    //          IF ProcessingLines.FINDSET THEN BEGIN
                    //          REPEAT
                    //          TotalAmount:=TotalAmount+ProcessingLines.Amount;
                    //          UNTIL ProcessingLines.NEXT=0;
                    //          END;

                    BulkProcessingHeader.CalcFields("Exemption Amount");

                    //          IF BulkProcessingHeader."Currency Code"<>'' THEN
                    //          SalesLine."Unit Price":=TotalAmount
                    //          ELSE
                    SalesLine."Unit Price" := BulkProcessingHeader."Exemption Amount";

                    SalesLine.Validate("Unit Price");
                    SalesLine.Validate(Quantity);
                    SalesLine.Insert(true);
                end;

                BulkProcessingHeader."Exemption Invoice No." := SalesInv."No.";
                BulkProcessingHeader.Modify;
                Message(TXT001, SalesInv."No.");
                Commit;
                //send email pro-forma

                ExaminationSetup.Get;
                Email2 := ExaminationSetup."Registration Sender Email";
                SMTP.Create(BulkProcessingHeader.Email, 'HRMPEB STUDENT EXEMPTION',
                 'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
                 'Your exemption request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
                 'Find attached the invoice for payment');
                Filename := BulkProcessingHeader."Student No." + '.pdf';
                Filelocation := ExaminationSetup."Examination Path" + Filename;
                Header.Reset;
                Header.SetRange("No.", BulkProcessingHeader."No.");
                if Header.FindFirst then begin
                    Report.SaveAsPdf(85043, Filelocation, Header);
                end;
                SMTP.AddAttachment(Filelocation, 'PDF', InStr);
                // SMTP.AddBCC(Email2);
                // SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
                // SMTP.AppendToBody('<BR><BR>HRMPEB STUDENT REGISTRATION<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                // SMTP.Send();
                Message(TXT004, SalesInv."No.");
            end else
                Error(TXT002, SalesInv."No.", BulkProcessingHeader."No.");
        end
    end;

    procedure ExemptionCreatReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        Cust: Record Customer;
        Contact: Record Contact;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ExamFee: Record Resource;
        ExamFeeCost: Record "Resource Cost";
        Amount: Decimal;
        WorkType: Record "Work Type";
        Existing: Boolean;
        ExamAccountNo: Code[30];
        ResourcePrice: Record "Resource Price";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        PaymentsPost: Codeunit "Payments-Post";
        SalesInv1: Record "Sales Header";
    begin
        //code to post the created invoice

        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.Find('-') then begin
            SalesInv."Posting Date" := Today;
            SalesInv.Modify(true);
            Commit;
            SalesInv1.Reset;
            SalesInv1.SetRange("No.", SalesInv."No.");
            if SalesInv1.FindFirst then begin
                SalesPostYesNo.Run(SalesInv1);
            end;
            Message('Invoice %1 has been posted Successfully', SalesInv."No.");
            CashMngmntSetup.Get();
            ExaminationSetup.Get();
            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode";
            ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code";
            ReceiptHeader.Validate("Bank Code");
            ReceiptHeader."Received From" := BulkProcessingHeader."Student Name";
            ReceiptHeader."On Behalf Of" := BulkProcessingHeader."Student Name";
            ReceiptHeader."Posted Date" := Today;
            ReceiptHeader."Posting Date" := Today;
            ReceiptHeader.Insert(true);
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Exemption amount';
            ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;
            ReceiptLines.Insert(true);
            StudentManagement.PostReceipt(ReceiptHeader);
            ExemptionSendReceipt(BulkProcessingHeader);


            BulkProcessingHeader."Exemption Receipt 6No." := ReceiptHeader."No.";
            BulkProcessingHeader."Pay Mode" := ReceiptHeader."Pay Mode";
            BulkProcessingHeader.Posted := true;
            BulkProcessingHeader."Posted Date" := Today;
            BulkProcessingHeader."Posted By" := UserId;
            BulkProcessingHeader."Posted On" := CurrentDatetime;
            BulkProcessingHeader.Modify(true);
        end
    end;

    procedure PostBulkExaminationVoucher(StudentProcessingHeader: Record "Bulk Processing Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        EntryNo: Integer;
        TXT001: label 'Examination Booking for %1  has been done succesfully';
        ExemptionEntries: Record "Exemption Entries";
        StudentBookingLines: Record "Bulk Processing Lines";
        Papers: Record Papers;
    begin
        //create exam booking entries
        StudentBookingLines.Reset;
        StudentBookingLines.SetRange("Bulk Header No.", StudentProcessingHeader."No.");
        if StudentBookingLines.FindSet then begin
            repeat

                if StudentBookingLines."Booking Type" = StudentBookingLines."booking type"::Section then begin
                    Papers.Reset;
                    Papers.SetRange(Section, StudentBookingLines.Section);
                    if Papers.FindSet then begin
                        repeat
                            ExamBookingEntries.Reset;
                            if ExamBookingEntries.FindLast then begin
                                EntryNo := ExamBookingEntries."Entry No.";
                            end;
                            ExamBookingEntries.Init;
                            ExamBookingEntries."Entry No." := EntryNo + 1;
                            ExamBookingEntries.Code := StudentProcessingHeader."No.";
                            ExamBookingEntries."Student Reg No." := StudentBookingLines."Registration No.";
                            ExamBookingEntries.Validate("Student Reg No.");
                            ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
                            ExamBookingEntries.Examination := StudentBookingLines."Course ID";
                            ExamBookingEntries.Paper := Papers.Code;
                            ExamBookingEntries.Section := Papers.Section;
                            ExamBookingEntries.Part := Papers.Level;
                            ExamBookingEntries."Project Code" := StudentBookingLines."Examination Project Code";
                            ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
                            ExamBookingEntries.Validate("Exam Center");
                            ExamBookingEntries."Exam Sitting" := StudentBookingLines."Examination Cyce";
                            ExamBookingEntries.Description := StudentBookingLines.Description;
                            ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
                            ExamBookingEntries."Fee Amount" := StudentBookingLines."Amount LCY";
                            ExamBookingEntries.Validate("Currency Code");
                            ExamBookingEntries.Insert;
                        until Papers.Next = 0;
                    end
                end else
                    if StudentBookingLines."Booking Type" = StudentBookingLines."booking type"::Part then begin
                        Papers.Reset;
                        Papers.SetRange(Level, StudentBookingLines.Part);
                        if Papers.FindSet then begin
                            //if entire part
                            repeat
                                ExamBookingEntries.Reset;
                                if ExamBookingEntries.FindLast then begin
                                    EntryNo := ExamBookingEntries."Entry No.";
                                end;
                                ExamBookingEntries.Init;
                                ExamBookingEntries."Entry No." := EntryNo + 1;
                                ExamBookingEntries.Code := StudentProcessingHeader."No.";
                                ExamBookingEntries."Student Reg No." := StudentBookingLines."Registration No.";
                                ExamBookingEntries.Validate("Student Reg No.");
                                ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
                                ExamBookingEntries.Examination := StudentBookingLines."Course ID";
                                ExamBookingEntries.Paper := Papers.Code;
                                ExamBookingEntries.Section := Papers.Section;
                                ExamBookingEntries.Part := Papers.Level;
                                ExamBookingEntries."Project Code" := StudentBookingLines."Examination Project Code";
                                ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
                                ExamBookingEntries.Validate("Exam Center");
                                ExamBookingEntries."Exam Sitting" := StudentBookingLines."Examination Cyce";
                                ExamBookingEntries.Description := Papers.Description;
                                ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
                                ExamBookingEntries."Fee Amount" := StudentBookingLines."Amount LCY";
                                ExamBookingEntries.Validate("Currency Code");

                                ExamBookingEntries.Insert;
                            until Papers.Next = 0;
                        end
                    end else
                        if StudentBookingLines."Booking Type" = StudentBookingLines."booking type"::Paper then begin
                            //if only paper based
                            ExamBookingEntries.Reset;
                            if ExamBookingEntries.FindLast then begin
                                EntryNo := ExamBookingEntries."Entry No.";
                            end;
                            ExamBookingEntries.Init;
                            ExamBookingEntries."Entry No." := EntryNo + 1;
                            ExamBookingEntries.Code := StudentProcessingHeader."No.";
                            ExamBookingEntries."Student Reg No." := StudentBookingLines."Registration No.";
                            ExamBookingEntries.Validate("Student Reg No.");
                            ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
                            ExamBookingEntries.Examination := StudentBookingLines."Course ID";
                            ExamBookingEntries.Paper := StudentBookingLines.Paper;
                            ExamBookingEntries.Part := StudentBookingLines.Part;
                            ExamBookingEntries.Section := StudentBookingLines.Section;
                            ExamBookingEntries."Project Code" := StudentBookingLines."Examination Project Code";
                            ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
                            ExamBookingEntries.Validate("Exam Center");
                            ExamBookingEntries."Exam Sitting" := StudentBookingLines."Examination Cyce";
                            ExamBookingEntries.Description := StudentBookingLines.Description;
                            ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
                            ExamBookingEntries."Fee Amount" := StudentBookingLines."Amount LCY";
                            ExamBookingEntries.Validate("Currency Code");

                            ExamBookingEntries.Insert;
                        end;



            until StudentBookingLines.Next = 0;
        end;
    end;

    // procedure PostBulkCenterBookingAllocation(CenterBookingHeader: Record "Bulk Processing Header")
    // var
    //     CenterBookingLines: Record "Bulk Processing Lines";
    //     BookingEntries: Record "Center Booking Entries";
    //     EntryNo: Integer;
    //     CenterCourse: Record "Center Course Capacity";
    //     TXT001: label 'The center %1,does not offer the examination %2';
    //     BookingEntries1: Record "Center Booking Entries";
    // begin
    //     //check if center offers that exam
    //     //check if student has any entries
    //     CenterBookingLines.Reset;
    //     CenterBookingLines.SetRange("Bulk Header No.", CenterBookingHeader."No.");
    //     if CenterBookingLines.FindSet then begin
    //          //check if student has any entries
    //         CenterBookingLines.Reset;
    //         CenterBookingLines.SetRange("Registration No.", BookingEntries1."Student Reg No.");
    //         CenterBookingLines.SetRange(Paper, BookingEntries1."Subject Code");
    //         CenterBookingLines.SetRange("Examination Cyce", BookingEntries1."Examination Sitting");
    //         if not CenterBookingLines.FindSet then begin
    //             BookingEntries.Reset;
    //             if BookingEntries.FindLast then begin
    //                 EntryNo := BookingEntries."Line No.";
    //             end;
    //             CenterBookingLines.SetRange("Bulk Header No.", CenterBookingHeader."No.");
    //             //CenterBookingLines.SetRange("Transaction Type", CenterBookingLines."transaction type"::Registration);
    //             if CenterBookingLines.FindSet then begin
    //                 repeat
    //                     BookingEntries.Init;
    //                     BookingEntries."Line No." := EntryNo + 1;
    //                     BookingEntries.Status := BookingEntries.Status::Allocated;
    //                     BookingEntries."Header No." := CenterBookingHeader."No.";
    //                     BookingEntries."Exam Center Code" := CenterBookingLines."Examination Center Code";
    //                     BookingEntries."Center Name" := CenterBookingLines."Examination Center";
    //                     BookingEntries."Student Reg No." := CenterBookingLines."Registration No.";
    //                     BookingEntries."Student Name" := CenterBookingLines."Student Name";
    //                     BookingEntries."Examination Id" := CenterBookingLines."Examination ID";
    //                     BookingEntries."Subject Code" := CenterBookingLines.Paper;
    //                     BookingEntries.Validate("Subject Code");
    //                     BookingEntries.Year := CenterBookingLines.Year;
    //                     BookingEntries."Examination Description" := CenterBookingLines."Examination Description";
    //                     BookingEntries."Examination Sitting" := CenterBookingLines."Examination Cyce";
    //                     BookingEntries.Insert;
    //                     EntryNo += 1;
    //                 until CenterBookingLines.Next = 0;
    //             end;


    //         end;
    //     end;
    //     if not CenterBookingHeader."Additional Exemption" = true then begin
    //         BookingEntries1.Reset;
    //         BookingEntries1.SetRange("Student Reg No.", CenterBookingHeader."Student Reg. No.");
    //         BookingEntries1.SetRange("Examination Sitting", CenterBookingHeader."Examination Sitting");
    //         if BookingEntries1.FindSet then begin
    //             CenterBookingHeader.Posted := true;
    //             CenterBookingHeader."Posted By" := UserId;
    //             CenterBookingHeader."Posted Date" := Today;g
    //             CenterBookingHeader."Posted On" := CurrentDatetime;
    //             CenterBookingHeader.Modify(true);
    //             exit;
    //         end
    //     end
    //     else begin
    //         CenterCourse.Reset;
    //         CenterCourse.SetRange("Centre Code", CenterBookingHeader."Examination Center Code");
    //         CenterCourse.SetRange("Course Id", CenterBookingHeader."Examination ID");
    //         if CenterCourse.FindFirst then begin
    //             BookingEntries.Reset;
    //             if BookingEntries.FindLast then begin
    //                 EntryNo := BookingEntries."Line No.";
    //             end;
    //             CenterBookingLines.Reset;
    //             CenterBookingLines.SetRange("Booking Header No.", CenterBookingHeader."No.");
    //             CenterBookingLines.SetRange("Transaction Type", CenterBookingLines."transaction type"::Booking);
    //             if CenterBookingLines.FindSet then begin
    //                 repeat
    //                     BookingEntries.Init;
    //                     BookingEntries."Line No." := EntryNo + 1;
    //                     BookingEntries.Status := BookingEntries.Status::Allocated;
    //                     BookingEntries."Header No." := CenterBookingHeader."No.";
    //                     BookingEntries."Exam Center Code" := CenterBookingHeader."Examination Center Code";
    //                     BookingEntries."Center Name" := CenterBookingHeader."Examination Center";
    //                     BookingEntries."Student Reg No." := CenterBookingHeader."Student Reg. No.";
    //                     BookingEntries."Student Name" := CenterBookingHeader."Student Name";
    //                     BookingEntries."Examination Id" := CenterBookingHeader."Examination ID";
    //                     BookingEntries."Subject Code" := CenterBookingLines.Paper;
    //                     BookingEntries.Validate("Subject Code");
    //                     BookingEntries.Year := CenterBookingLines.Year;
    //                     BookingEntries."Examination Description" := CenterBookingHeader."Examination Description";
    //                     BookingEntries."Examination Sitting" := CenterBookingHeader."Examination Sitting";
    //                     BookingEntries.Insert;
    //                     EntryNo += 1;
    //                 until CenterBookingLines.Next = 0;
    //             end;
    //         end else
    //             Error(TXT001, CenterBookingHeader."Examination Center", CenterBookingHeader."Examination ID");
    //     end
    //end;

    procedure NotifyResources(AppointmentHeader: Record "Appointment Header")
    var
        AppointmentLine: Record "Staff Appointment Line";
        Window: Dialog;
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SMTPMail: Codeunit "Email Message";
        DocLog: Record "Document E-mail Log";
        UserSetup: Record "User Setup";
        CompInfo: Record "Company Information";
        ExaminationSetup: Record "Examination Setup";
        SenderAddress: Text;
        StaffTerminationLine: Record "Staff Termination Line";
        Employee: Record Employee;
        UserSetup1: Record "User Setup";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        if (AppointmentHeader."Document Type" = AppointmentHeader."document type"::Appointment) or (AppointmentHeader."Document Type" = AppointmentHeader."document type"::"Int Examination Appointment")
          or (AppointmentHeader."Document Type" = AppointmentHeader."document type"::"Ext Examination Appointment") then begin
            AppointmentLine.Reset;
            AppointmentLine.SetRange("Header No.", AppointmentHeader.Code);
            if AppointmentLine.FindSet then begin
                repeat
                    ExaminationSetup.Get;
                    if ExaminationSetup."Appointment Sender Email" = '' then
                        Error('Please specify Appointment Sender Email under Examination setup page!!');
                    SenderAddress := ExaminationSetup."Appointment Sender Email";

                    EmailMessage.Create(AppointmentLine.Email, 'APPOINTMENT:' + ' ' + '-' + AppointmentLine.Name,
                    'Dear ' + AppointmentLine.Name + ',<BR><BR>' +
                    'You have been succesfully appointed for the role ' + UpperCase(AppointmentLine."Role Code") + '.<BR>' +
                    'The examination period runs from' + ' ' + Format(AppointmentHeader."Examination Start Date") + ' ' + 'to' + ' ' + Format(AppointmentHeader."Examination End Date") +
                    'Your effective date of appointment is' + ' ' + Format(AppointmentLine."Effective Date") + '<BR><BR>Kind Regards,' +
                    '<BR><BR>EXAMINATION DEPARTMENT.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                    //check if staff and copy supervisor
                    Employee.Reset;
                    Employee.SetRange("No.", AppointmentLine."Resource No.");
                    if Employee.FindFirst then begin
                        UserSetup1.Reset;
                        UserSetup1.SetRange("User ID", Employee.Supervisor);
                        if UserSetup1.FindFirst then begin
                            UserSetup1.TestField("E-Mail");
                            //  Email.AddCC(UserSetup1."E-Mail");
                        end
                    end;
                    //  SMTPMail.Send;
                    // EmailMessage.app
                    Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

                    DocLog.Init;
                    DocLog."Entry No" := 0;
                    DocLog."Customer No" := AppointmentLine."Resource No.";
                    DocLog."E-mailed To" := AppointmentLine.Email;
                    DocLog.Date := Today;
                    DocLog.Time := Time;
                    DocLog."Sender ID" := UserId;
                    DocLog.Insert(true);

                until AppointmentLine.Next = 0;
            end;
            Message('Notifications sent succesfully');
        end else
            if AppointmentHeader."Document Type" = AppointmentHeader."document type"::Termination then begin
                StaffTerminationLine.Reset;
                StaffTerminationLine.SetRange("Header No.", AppointmentHeader.Code);
                if StaffTerminationLine.FindSet then begin
                    repeat
                        ExaminationSetup.Get;
                        if ExaminationSetup."Appointment Sender Email" = '' then
                            Error('Please specify Appointment Sender Email under Examination setup page!!');
                        SenderAddress := ExaminationSetup."Appointment Sender Email";

                        EmailMessage.Create(StaffTerminationLine.Email, 'TERMINATION:' + ' ' + '-' + StaffTerminationLine.Name,
                        'Dear ' + StaffTerminationLine.Name + ',<BR><BR>' +
                        'You have been terminated for the role ' + UpperCase(StaffTerminationLine."Role Code") + '.<BR>' +
                        'For the following reason/s' + ' ' + Format(StaffTerminationLine."Termination Category") + ': ' + StaffTerminationLine."Termination Details" +
                        'Your effective date of termination is' + ' ' + Format(StaffTerminationLine."Termination Date") + '<BR><BR>Kind Regards,' +
                        '<BR><BR>EXAMINATION DEPARTMENT.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>''<BR>' + CompInfo.Name);
                        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                        DocLog.Init;
                        DocLog."Entry No" := 0;
                        DocLog."Customer No" := StaffTerminationLine."Resource No.";
                        DocLog."E-mailed To" := StaffTerminationLine.Email;
                        DocLog.Date := Today;
                        DocLog.Time := Time;
                        DocLog."Sender ID" := UserId;
                        DocLog.Insert(true);

                    until StaffTerminationLine.Next = 0;
                    Message('Notifications sent succesfully');
                end;
            end
    end;

    procedure SuggestCenterAllocation(CenterBookingHeader: Record "Center Booking Header")
    var
        CenterBookingLines: Record "Center Booking Lines";
        BookingLines: Record "Exam Booking Entries";
        LineNo: Integer;
        CenterCourseCapacity: Record "Center Course Capacity";
        TXT001: label 'There are no students registrered for the course %1, at the center %2';
    begin
        //delete all lines
        CenterBookingLines.Reset;
        CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
        if CenterBookingLines.FindSet then begin
            CenterBookingLines.DeleteAll;
        end;
        CenterBookingLines.Reset;
        if CenterBookingLines.FindLast then begin
            LineNo := CenterBookingLines."Line No.";
        end;
        //exam based
        CenterCourseCapacity.Reset;
        CenterCourseCapacity.SetRange("Centre Code", CenterBookingHeader."Exam Center Code");
        if CenterCourseCapacity.FindSet then begin
            repeat
                BookingLines.Reset;
                BookingLines.SetRange("Exam Center", CenterBookingHeader."Exam Center Code");
                BookingLines.SetRange(Status, BookingLines.Status::Open);
                BookingLines.SetRange(Examination, CenterCourseCapacity."Course Id");
                BookingLines.SetRange("Exam Sitting", CenterBookingHeader."Examination Sitting");
                if BookingLines.FindSet then begin
                    repeat
                        //check if student already exists
                        CenterBookingLines.Reset;
                        CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
                        CenterBookingLines.SetRange("Student Reg No.", BookingLines."Student Reg No.");
                        if not CenterBookingLines.FindSet then begin
                            CenterBookingLines.Init;
                            CenterBookingLines."Line No." := LineNo + 1;
                            CenterBookingLines."Header No." := CenterBookingHeader."Header No.";
                            CenterBookingLines."Student Reg No." := BookingLines."Student Reg No.";
                            CenterBookingLines."Student Name" := BookingLines."Student Name";
                            CenterBookingLines."Course Id" := BookingLines.Examination;
                            CenterBookingLines.Validate("Course Id");
                            CenterBookingLines."Subject Code" := BookingLines.Paper;
                            CenterBookingLines.Validate("Subject Code");
                            CenterBookingLines.Zone := CenterBookingHeader.Zone;
                            CenterBookingLines.Region := CenterBookingHeader.Region;
                            CenterBookingLines."Exam Center Code" := CenterBookingHeader."Exam Center Code";
                            CenterBookingLines."Center Name" := CenterBookingHeader."Center Name";
                            CenterBookingLines.Year := CenterBookingHeader.Year;
                            CenterBookingLines."Maximum Capacity" := CenterBookingHeader."Maximum Capacity";
                            CenterBookingLines."Sitting Cycle" := CenterBookingHeader."Examination Sitting";
                            CenterBookingLines.Insert;

                        end;
                        LineNo += 1;
                    until BookingLines.Next = 0;
                end else
                    Error(TXT001, CenterCourseCapacity."Course Description", CenterBookingHeader."Center Name");
            until CenterCourseCapacity.Next = 0
        end
    end;

    procedure PostCenterAllocation(CenterBookingHeader: Record "Center Booking Header")
    var
        CenterBookingLines: Record "Center Booking Lines";
        BookingEntries: Record "Center Booking Entries";
        EntryNo: Integer;
    begin
        CenterBookingLines.Reset;
        CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
        if CenterBookingLines.FindSet then begin
            repeat
                BookingEntries.Reset;
                if BookingEntries.FindLast then begin
                    EntryNo := BookingEntries."Line No.";
                end;
                BookingEntries.Init;
                BookingEntries."Line No." := EntryNo + 1;
                BookingEntries.Status := BookingEntries.Status::Allocated;
                BookingEntries."Header No." := CenterBookingHeader."Header No.";
                BookingEntries."Exam Center Code" := CenterBookingHeader."Exam Center Code";
                BookingEntries."Center Name" := CenterBookingHeader."Center Name";
                BookingEntries."Student Reg No." := CenterBookingLines."Student Reg No.";
                BookingEntries."Student Name" := CenterBookingLines."Student Name";
                BookingEntries."Examination Id" := CenterBookingLines."Course Id";
                BookingEntries.Year := CenterBookingLines.Year;
                BookingEntries."Examination Description" := CenterBookingLines."Course Description";
                BookingEntries."Examination Sitting" := CenterBookingLines."Sitting Cycle";
                BookingEntries.Insert;
            until
          CenterBookingLines.Next = 0;
        end;
        Message('Allocation Voucher %1,posted succesfully', CenterBookingHeader."Header No.");
        CenterBookingHeader.Posted := true;
        CenterBookingHeader.Modify(true);
    end;

    procedure SuggestCenterEntries(CenterBookingHeader: Record "Center Booking Header")
    var
        CenterBookingLines: Record "Center Booking Lines";
        BookingLines: Record "Exam Booking Entries";
        LineNo: Integer;
        CenterBookingLines1: Record "Exam Booking Entries";
        CenterBookingLines2: Record "Center Booking Lines";
        TXT001: label 'There are no students with open entries in this center';
    begin
        CenterBookingLines.Reset;
        CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
        if CenterBookingLines.FindSet then begin
            CenterBookingLines.DeleteAll;
        end;
        CenterBookingLines.Reset;
        if CenterBookingLines.FindLast then begin
            LineNo := CenterBookingLines."Line No.";
        end;
        CenterBookingLines1.Reset;
        CenterBookingLines1.SetRange("Exam Center", CenterBookingHeader."Initial Center Code");
        CenterBookingLines1.SetRange(Status, CenterBookingLines1.Status::Open);
        CenterBookingLines1.SetRange(Blocked, false);
        CenterBookingLines1.SetRange(Cancelled, false);
        CenterBookingLines1.SetRange("Exam Sitting", CenterBookingHeader."Examination Sitting");
        if CenterBookingLines1.FindSet then begin
            repeat
                //check if student already exists
                CenterBookingLines2.Reset;
                CenterBookingLines2.SetRange("Header No.", CenterBookingHeader."Header No.");
                CenterBookingLines2.SetRange("Student Reg No.", CenterBookingLines1."Student Reg No.");
                if not CenterBookingLines2.FindSet then begin

                    CenterBookingLines."Line No." := LineNo + 1;
                    CenterBookingLines."Header No." := CenterBookingHeader."Header No.";
                    CenterBookingLines."Student Reg No." := CenterBookingLines1."Student Reg No.";
                    CenterBookingLines."Student Name" := CenterBookingLines1."Student Name";
                    CenterBookingLines."Course Id" := CenterBookingLines1.Examination;
                    CenterBookingLines.Validate("Course Id");
                    CenterBookingLines.Zone := CenterBookingHeader.Zone;
                    CenterBookingLines.Region := CenterBookingHeader.Region;
                    CenterBookingLines."Exam Center Code" := CenterBookingHeader."Exam Center Code";
                    CenterBookingLines."Center Name" := CenterBookingHeader."Center Name";
                    CenterBookingLines.Year := CenterBookingHeader.Year;
                    CenterBookingLines."Maximum Capacity" := CenterBookingHeader."Maximum Capacity";
                    CenterBookingLines."Sitting Cycle" := CenterBookingHeader."Examination Sitting";
                    CenterBookingLines.Moved := false;
                    CenterBookingLines.Insert;
                end;
                LineNo += 1;
            until CenterBookingLines1.Next = 0;
        end else
            Error(TXT001);
    end;

    procedure PostCenterReAllocation(CenterBookingHeader: Record "Center Booking Header")
    var
        CenterBookingLines: Record "Center Booking Lines";
        BookingEntries: Record "Center Booking Entries";
        EntryNo: Integer;
        StudentProcessingHeader: Record "Student Processing Header";
        TXT001: label 'There is not enough space to accomodate the students';
        BookingEntries1: Record "Center Booking Entries";
        BookingEntries2: Record "Center Booking Entries";
        StudentProcessingHeader1: Record "Student Processing Header";
        TotalValue: Boolean;
        ExamEntries: Record "Exam Booking Entries";
        TXT002: label 'The center cannot accomodate all the selected students';
        CenterBookingLines1: Record "Center Booking Lines";
        TotalChecks: Integer;
        CenterBookingLines2: Record "Center Booking Lines";
        ExamEntries1: Record "Exam Booking Entries";
        TXT003: label 'Kindly remove the student %1,as they do not have Open booking entries for the %2 sitting';
    begin
        //get the lines
        // CenterBookingLines1.RESET;
        // CenterBookingLines1.SETRANGE("Header No.",CenterBookingHeader."Header No.");
        // IF CenterBookingLines1.FINDSET THEN BEGIN
        //  TotalChecks:=CenterBookingLines1.COUNT;
        // END;
        CenterBookingLines.Reset;
        CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
        CenterBookingLines.SetRange(Moved, false);
        if CenterBookingLines.FindSet then begin
            repeat
                BookingEntries2.Reset;
                if BookingEntries2.FindLast then begin
                    EntryNo := BookingEntries2."Line No.";
                end;
                //check for all students
                ExamEntries1.Reset;
                ExamEntries1.SetRange("Student Reg No.", CenterBookingLines."Student Reg No.");
                ExamEntries1.SetRange("Exam Sitting", CenterBookingHeader."Examination Sitting");
                ExamEntries1.SetRange(Status, ExamEntries1.Status::Open);
                if not ExamEntries1.FindFirst then begin
                    Error(TXT003, CenterBookingLines."Student Reg No.", CenterBookingHeader."Examination Sitting");
                end;
                StudentProcessingHeader.Reset;
                StudentProcessingHeader.SetRange("Student Reg. No.", CenterBookingLines."Student Reg No.");
                StudentProcessingHeader.SetRange("Examination Sitting", CenterBookingHeader."Examination Sitting");
                StudentProcessingHeader.SetRange("Document Type", StudentProcessingHeader."document type"::Booking);
                if StudentProcessingHeader.FindFirst then begin
                    if CheckCenterAvailability(StudentProcessingHeader, CenterBookingHeader."Exam Center Code", TotalChecks) = true then begin


                        BookingEntries.Reset;
                        BookingEntries.SetRange("Student Reg No.", CenterBookingLines."Student Reg No.");
                        BookingEntries.SetRange(Status, BookingEntries.Status::Allocated);
                        BookingEntries.SetRange("Exam Center Code", CenterBookingHeader."Initial Center Code");
                        if BookingEntries.FindSet then begin
                            repeat
                                BookingEntries1.Init;
                                BookingEntries1.TransferFields(BookingEntries);
                                BookingEntries1."Line No." := EntryNo + 1;
                                BookingEntries1."Exam Center Code" := CenterBookingHeader."Exam Center Code";
                                BookingEntries1.Validate("Exam Center Code");
                                BookingEntries1.Status := BookingEntries1.Status::Allocated;
                                BookingEntries1."Re-Allocation Center Code" := CenterBookingHeader."Initial Center Code";
                                BookingEntries1.Validate("Re-Allocation Center Code");
                                BookingEntries1.Insert(true);
                                BookingEntries.Status := BookingEntries.Status::"Re-allocated";
                                BookingEntries.Modify(true);
                                EntryNo += 1;
                            until BookingEntries.Next = 0;
                        end;
                        //modify the booking entries
                        ExamEntries.Reset;
                        ExamEntries.SetRange("Student Reg No.", CenterBookingLines."Student Reg No.");
                        ExamEntries.SetRange(Status, ExamEntries.Status::Open);
                        if ExamEntries.FindSet then begin
                            repeat
                                ExamEntries."Exam Center" := CenterBookingHeader."Exam Center Code";
                                ExamEntries.Validate("Exam Center");
                                ExamEntries.Modify(true);

                            until ExamEntries.Next = 0;
                        end;

                        //modify the header
                        StudentProcessingHeader.Reset;
                        StudentProcessingHeader.SetRange("Student Reg. No.", CenterBookingLines."Student Reg No.");
                        StudentProcessingHeader.SetRange("Document Type", StudentProcessingHeader."document type"::Booking);
                        StudentProcessingHeader.SetRange("Examination Sitting", CenterBookingHeader."Examination Sitting");
                        StudentProcessingHeader.SetRange(Posted, true);
                        if StudentProcessingHeader.FindSet then begin
                            repeat
                                StudentProcessingHeader."Examination Center Code" := CenterBookingHeader."Exam Center Code";
                                StudentProcessingHeader.Validate("Examination Center Code");
                                StudentProcessingHeader.Modify(true);
                            until StudentProcessingHeader.Next = 0;
                        end;
                        Commit;
                        //send timetable
                        StudentProcessingHeader1.Reset;
                        StudentProcessingHeader1.SetRange("Student Reg. No.", CenterBookingLines."Student Reg No.");
                        if StudentProcessingHeader1.FindFirst then begin
                            //BookingSendReceipt(StudentProcessingHeader);
                        end;
                        CenterBookingLines2.Reset;
                        CenterBookingLines2.SetRange("Header No.", CenterBookingLines."Header No.");
                        CenterBookingLines2.SetRange("Student Reg No.", CenterBookingLines."Student Reg No.");
                        if CenterBookingLines2.FindFirst then begin
                            CenterBookingLines2.Moved := true;
                            CenterBookingLines2.Modify(true);

                        end;
                        Commit;
                    end
                    else begin

                        Error('The limit in %1 center is already exhausted,Kindly adjust the Maximum Sitting Per Session to accomodate more students', CenterBookingHeader."Exam Center Code");
                    end
                end
                else
                    Error('No Booking entry found for the student %1', CenterBookingLines."Student Reg No.");

            until CenterBookingLines.Next = 0;
            CenterBookingHeader.Posted := true;
            CenterBookingHeader.Modify(true);
            Message('Re-allocation posted successfully');

        end else
            CenterBookingHeader.Posted := true;
        CenterBookingHeader.Modify(true);
        Message('Re-allocation posted successfully');
    end;

    procedure RejectCenterReAllocation(CenterBookingHeader: Record "Center Booking Header")
    var
        CenterBookingLines: Record "Center Booking Lines";
        BookingEntries: Record "Center Booking Entries";
        EntryNo: Integer;
        TXT001: label 'There is not enough space to accomodate the students';
        BookingEntries1: Record "Center Booking Entries";
        BookingEntries2: Record "Center Booking Entries";
        TotalValue: Boolean;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Receipts Header1";
        FileName1: Text;
        FileLocation1: Text;
        Header: Record "Student Processing Header";
        ExemptionEntries: Record "Exemption Entries";
        DocLog: Record "Student Mgmt E-mail Log";
        Counter: Integer;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        CenterBookingLines.Reset;
        CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
        if CenterBookingLines.FindFirst then begin
            ExaminationAccount.Reset;
            ExaminationAccount.SetRange("Registration No.", CenterBookingLines."Student Reg No.");
            if ExaminationAccount.FindFirst then begin
                ExaminationSetup.Get;
                ExaminationAccount.TestField(Email);
                Email2 := ExaminationSetup."Registration Sender Email";

                EmailMessage.Create(ExaminationAccount.Email,
                'HRMPEB:CENTER CHANGE',
                'Dear ' + CenterBookingLines."Student Name" + ',<BR><BR>' +
                'Your center change request done on <b>' + ' ' + Format(CenterBookingHeader."Created On") + ' ' + '</b> has been rejected.<BR>' +
                'The following is/are the reason(s):' + ' <b>' + CenterBookingHeader."Rejection Reason" + '</b>.<br>');
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                //SMTP.AddBCC(Email2);
                //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
                //SMTP.AppendToBody('<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                //SMTP.Send();
                Counter := Counter + 1;
                DocLog.Init;
                DocLog."Entry No" := 0;
                DocLog."Customer No" := CenterBookingLines."Student Reg No.";
                DocLog."E-mailed To" := ExaminationAccount.Email;
                DocLog.Date := Today;
                DocLog."Document Type" := DocLog."document type"::" ";
                DocLog.Time := Time;
                DocLog."S/no" := Counter;

                DocLog."Sender ID" := UserId;
                DocLog.Insert(true);
                CenterBookingHeader.Posted := true;
                CenterBookingHeader.Modify(true);
                Message('Communication sent succesfully');

            end;
        end;
    end;

    procedure ExaminationCenterSummarySendReport(ExaminationCentres: Record "Examination Centres")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Student Processing Header";
        FileName1: Text;
        FileLocation1: Text;
        ProcessingHeader: Record "Student Processing Header";
        DocLog: Record "Student Mgmt E-mail Log";
        Counter: Integer;
        Header: Record "Student Processing Header";
        ExaminationCentres1: Record "Examination Centres";
        TimetablePlannerHeader: Record "Timetable Planner Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";

        InStr: Instream;
    begin

        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        EmailMessage.Create(ExaminationCentres."E-Mail", 'HRMPEB:EXAMINATION CENTRE SUMMARY',
        'Dear ' + ExaminationCentres.Name + ',<BR><BR>' +
        'Find attached the Centre Summary and the  provisional timetable. ');

        FileName := ExaminationCentres.Name + '.pdf';
        FileLocation := ExaminationSetup."Examination Path" + FileName;

        ExaminationCentres1.Reset;
        ExaminationCentres1.SetRange(Code, ExaminationCentres.Code);
        if ExaminationCentres1.FindFirst then begin
            Report.SaveAsPdf(85085, FileLocation, ExaminationCentres1);
            EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
        end;

        //Attach timetable
        TimetablePlannerHeader.Reset;
        TimetablePlannerHeader.SetRange(Published, false);
        TimetablePlannerHeader.SetFilter("Exam Sitting ID", '<>%1', '');
        if TimetablePlannerHeader.FindSet then begin
            FileName1 := TimetablePlannerHeader."Exam Sitting ID" + '.pdf';
            FileLocation1 := ExaminationSetup."Examination Path" + FileName1;

            Report.SaveAsPdf(85012, FileLocation1, TimetablePlannerHeader);
            EmailMessage.AddAttachment(FileLocation1, 'PDF', InStr);
        end;
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

        //SMTP.AddBCC(Email2);
        //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>EXAMINATION BOOKING<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();
        //StudentProcessingHeader."Email Sent":=TRUE;
        //StudentProcessingHeader.MODIFY;
        //send receipt

        //record sending details

        Counter := Counter + 1;

        DocLog.Init;
        DocLog."Entry No" := 0;
        DocLog."Center No" := ExaminationCentres.Code;
        DocLog."Center Name" := ExaminationCentres.Name;
        DocLog."E-mailed To" := ExaminationCentres."E-Mail";
        DocLog.Date := Today;
        DocLog."Document Type" := DocLog."document type"::Center;
        DocLog."Document No" := ExaminationCentres.Code;
        DocLog."File Extension" := FileLocation1;
        DocLog.Time := Time;
        DocLog."S/no" := Counter;
        DocLog."Sender ID" := UserId;
        DocLog.Insert(true);
    end;

    procedure SuggestAppointees(AppointmentHeader: Record "Appointment Header")
    var
        AppointmentLine: Record "Staff Appointment Line";
        StaffTerminationLine: Record "Staff Termination Line";
        "Entry No": Integer;
    begin
        AppointmentLine.Reset;
        AppointmentLine.SetRange("Header No.", AppointmentHeader."Appointment Code");
        if AppointmentLine.FindSet then begin
            repeat
                StaffTerminationLine.Reset;
                if StaffTerminationLine.FindLast then begin
                    "Entry No" := StaffTerminationLine."Line No.";
                end;

                StaffTerminationLine.Init;
                StaffTerminationLine."Line No." := "Entry No" + 1;
                StaffTerminationLine."Header No." := AppointmentHeader.Code;
                StaffTerminationLine."Resource No." := AppointmentLine."Resource No.";
                StaffTerminationLine.Name := AppointmentLine.Name;
                StaffTerminationLine.Email := AppointmentLine.Email;
                StaffTerminationLine."Project Manager" := AppointmentLine."Team Leader";
                StaffTerminationLine."Staff Category" := AppointmentLine."Staff Category";
                StaffTerminationLine."Role Code" := AppointmentLine."Role Code";
                StaffTerminationLine."Project Start Date" := AppointmentHeader."Examination Start Date";
                StaffTerminationLine."Project End Date" := AppointmentHeader."Examination End Date";
                StaffTerminationLine."Appointment Document No." := AppointmentHeader.Code;
                StaffTerminationLine.Insert;
            until AppointmentLine.Next = 0
        end;
        Message('The appointed resources:%1,has been added succesfully', AppointmentHeader.Code);
        //insert on the project
        //send notification for appointment

        AppointmentHeader.Posted := true;
        AppointmentHeader."Posted By" := UserId;
        AppointmentHeader."Posted On" := CurrentDatetime;
        AppointmentHeader.Modify;

    end;

    procedure PostAppointmentVoucher(AppointmentHeader: Record "Appointment Header")
    var
        AppointmentLine: Record "Staff Appointment Line";
        AppointmentFunction: Record "Staff Appointment Function";
        EntryNo: Integer;
    begin
        AppointmentLine.Reset;
        AppointmentLine.SetRange("Header No.", AppointmentHeader.Code);
        if AppointmentLine.FindSet then begin
            repeat
                AppointmentFunction.Reset;
                if AppointmentFunction.FindLast then begin
                    EntryNo := AppointmentFunction."Entry No.";
                end;
                AppointmentFunction.Init;
                AppointmentFunction."Entry No." := EntryNo + 1;
                AppointmentFunction."Header No." := AppointmentHeader.Code;
                AppointmentFunction."Resource No." := AppointmentLine."Resource No.";
                AppointmentFunction.Name := AppointmentLine.Name;
                AppointmentFunction.Email := AppointmentLine.Email;
                AppointmentFunction."Project Manager" := AppointmentLine."Team Leader";
                AppointmentFunction."Staff Category" := AppointmentLine."Staff Category";
                AppointmentFunction."Effective Date" := AppointmentLine."Effective Date";
                AppointmentFunction."Expiry Date" := AppointmentLine."Expiry Date";
                AppointmentFunction."Staff Role Code" := AppointmentLine."Role Code";
                AppointmentFunction.Description := AppointmentHeader.Description;
                AppointmentFunction."Posted By" := UserId;
                AppointmentFunction."Posting Date" := Today;
                AppointmentFunction.Insert;
            until AppointmentLine.Next = 0
        end;
        Message('The appoinment header no:%1,has been posted succesfully', AppointmentHeader.Code);
        //insert on the project
        AppointmentHeader.Posted := true;
        AppointmentHeader."Posted By" := UserId;
        AppointmentHeader."Posted On" := CurrentDatetime;
        AppointmentHeader.Modify;

    end;

    procedure PostTerminationVoucher(AppointmentHeader: Record "Appointment Header")
    var
        AppointmentLine: Record "Staff Termination Line";
        AppointmentFunction: Record "Staff Appointment Function";
        EntryNo: Integer;
    begin
        AppointmentLine.Reset;
        AppointmentLine.SetRange("Header No.", AppointmentHeader.Code);
        if AppointmentLine.FindSet then begin
            repeat
                AppointmentFunction.Reset;
                if AppointmentFunction.FindLast then begin
                    EntryNo := AppointmentFunction."Entry No.";
                end;
                AppointmentFunction.Init;
                AppointmentFunction."Entry No." := EntryNo + 1;
                AppointmentFunction."Header No." := AppointmentHeader.Code;
                AppointmentFunction."Resource No." := AppointmentLine."Resource No.";
                AppointmentFunction.Name := AppointmentLine.Name;
                AppointmentFunction.Email := AppointmentLine.Email;
                AppointmentFunction."Project Manager" := AppointmentLine."Project Manager";
                AppointmentFunction."Staff Category" := AppointmentLine."Staff Category";
                AppointmentFunction."Termination Date" := AppointmentLine."Termination Date";
                AppointmentFunction."Termination Details" := AppointmentLine."Termination Details";
                AppointmentFunction."Termination Category" := AppointmentLine."Termination Category";
                AppointmentFunction."Staff Role Code" := AppointmentLine."Role Code";
                AppointmentFunction.Description := AppointmentHeader.Description;
                AppointmentFunction."Posted By" := UserId;
                AppointmentFunction."Posting Date" := Today;
                AppointmentFunction.Insert;
            until AppointmentLine.Next = 0
        end;
        Message('The termination voucher no:%1,has been posted succesfully', AppointmentHeader.Code);
        //insert on the project
        AppointmentHeader.Posted := true;
        AppointmentHeader."Posted By" := UserId;
        AppointmentHeader."Posted On" := CurrentDatetime;
        AppointmentHeader.Modify;

    end;

    procedure SuggestTaskLines(PlannerHeader: Record "Exam Material Planner Header")
    var
        PlannerLine: Record "Exam Planner Line";
        Job: Record Job;
        JobTask: Record "Job Task";
        TXT001: label 'The entries have been populated succesfully';
        EntryNo: Integer;
        PlannerLine1: Record "Exam Planner Line";
        JobPlanningLine: Record "Job Planning Line";
        PlannerItems: Record "Examination Planner Items";
        PlannerItems1: Record "Examination Planner Items";
        LineNo: Integer;
        Papers: Record Papers;
    begin
        PlannerLine.Reset;
        PlannerLine.SetRange("Planner No.", PlannerHeader.Code);
        if PlannerLine.FindSet then begin
            PlannerLine.DeleteAll;
        end;

        PlannerItems.Reset;
        PlannerItems.SetRange("Exam Planner No.", PlannerHeader.Code);
        if PlannerItems.FindSet then begin
            PlannerItems.DeleteAll;
        end;

        EntryNo := 0;
        PlannerLine1.Reset;
        if PlannerLine1.FindLast then begin
            EntryNo := PlannerLine1."Line No.";
        end;

        LineNo := 0;
        PlannerItems1.Reset;
        if PlannerItems1.FindLast then begin
            LineNo := PlannerItems1."Line No.";
        end;

        JobTask.Reset;
        JobTask.SetRange("Job No.", PlannerHeader."Examination Project ID");
        if JobTask.FindSet then begin
            repeat

                Papers.Reset;
                Papers.SetRange(Course, JobTask."Job Task No.");
                if Papers.FindSet then begin
                    repeat

                        //LOOP THE COURSES TABLE

                        PlannerLine.Init;
                        PlannerLine."Line No." := EntryNo + 1;
                        PlannerLine.Examination := JobTask."Job Task No.";
                        PlannerLine."Planner No." := PlannerHeader.Code;
                        PlannerLine."Financial Year Code" := PlannerHeader."Financial Year Code";
                        PlannerLine."Project No." := PlannerHeader."Examination Project ID";
                        PlannerLine."Examination Task No." := JobTask."Job Task No.";
                        PlannerLine.Validate("Examination Task No.");
                        PlannerLine."Subject Code" := Papers.Code;
                        PlannerLine.Validate("Subject Code");
                        PlannerLine.Insert;
                        //INSERT ENTRIES
                        JobPlanningLine.Reset;
                        JobPlanningLine.SetRange("Job Task No.", JobTask."Job Task No.");
                        if JobPlanningLine.FindSet then begin
                            repeat
                                PlannerItems.Init;
                                PlannerItems."Line No." := LineNo + 1;
                                PlannerItems."Exam Planner No." := PlannerHeader.Code;
                                PlannerItems."Exam Planner Entry" := PlannerLine."Line No.";
                                PlannerItems.Description := JobPlanningLine.Description;
                                PlannerItems."Unit of Measure" := JobPlanningLine."Unit of Measure Code";
                                PlannerItems.Type := JobPlanningLine.Type;
                                PlannerItems."No." := JobPlanningLine."No.";
                                PlannerItems."Total Amount" := JobPlanningLine."Total Cost";
                                PlannerItems.Quantity := JobPlanningLine.Quantity;
                                PlannerItems."Unit Amount" := JobPlanningLine."Unit Cost";
                                PlannerItems.Insert;
                                LineNo += 1;
                            until JobPlanningLine.Next = 0;
                        end;
                        EntryNo := EntryNo + 1;
                    until Papers.Next = 0;
                end;

            until JobTask.Next = 0;
        end;
        Message(TXT001);
    end;

    procedure PostMaterialPlanner(PlannerHeader: Record "Exam Material Planner Header")
    var
        PlannerLine: Record "Exam Planner Line";
        Job: Record Job;
        JobTask: Record "Job Task";
        TXT001: label 'The voucher has been posted succesfully';
        EntryNo: Integer;
        JobPlanningLine: Record "Job Planning Line";
        ExamPlannerLine: Record "Exam Planner Line";
        PlannerItems: Record "Examination Planner Items";
        JobPlanningLine1: Record "Job Planning Line";
    begin
        JobPlanningLine.Reset;
        JobPlanningLine.SetRange("Job No.", PlannerHeader."Examination Project ID");
        if JobPlanningLine.FindSet then begin
            JobPlanningLine.DeleteAll;
        end;
        PlannerLine.Reset;
        PlannerLine.SetRange("Planner No.", PlannerHeader.Code);
        if PlannerLine.FindSet then begin
            repeat
                JobTask.Reset;
                JobTask.SetRange("Job No.", PlannerHeader."Examination Project ID");
                JobTask.SetRange("Job Task No.", PlannerLine."Examination Task No.");
                if JobTask.FindSet then begin
                    repeat
                        EntryNo := 0;
                        JobPlanningLine1.Reset;
                        JobPlanningLine1.SetRange("Job No.", PlannerHeader."Examination Project ID");
                        if JobPlanningLine1.FindLast then begin
                            EntryNo := JobPlanningLine1."Line No.";
                        end;
                        PlannerItems.Reset;
                        PlannerItems.SetRange("Exam Planner No.", PlannerHeader.Code);
                        PlannerItems.SetRange("Exam Planner Entry", PlannerLine."Line No.");
                        if PlannerItems.FindSet then begin
                            repeat
                                JobPlanningLine.Init;
                                JobPlanningLine."Line No." := EntryNo + 1;
                                JobPlanningLine."Job No." := PlannerHeader."Examination Project ID";
                                JobPlanningLine."Job Task No." := PlannerLine."Examination Task No.";
                                JobPlanningLine."Document No." := PlannerHeader.Code;
                                JobPlanningLine.Type := PlannerItems.Type;
                                JobPlanningLine."No." := PlannerItems."No.";
                                JobPlanningLine."Unit of Measure Code" := PlannerItems."Unit of Measure";
                                JobPlanningLine.Validate("No.");
                                JobPlanningLine."Planning Date" := PlannerHeader."Planning Start Date";
                                JobPlanningLine."Planned Delivery Date" := PlannerHeader."Planning End Date";
                                JobPlanningLine.Quantity := PlannerItems.Quantity;
                                JobPlanningLine."Unit Cost" := PlannerItems."Unit Amount";
                                JobPlanningLine.Validate(Quantity);
                                JobPlanningLine.Validate("Unit Cost");
                                JobPlanningLine.Insert;
                                EntryNo += 1;
                            until PlannerItems.Next = 0;
                        end;
                    until JobTask.Next = 0;
                end;
            until PlannerLine.Next = 0;
        end;
        Message(TXT001);
        PlannerHeader.Posted := true;
        PlannerHeader."Posted By" := UserId;
        PlannerHeader."Posted On" := CurrentDatetime;
        PlannerHeader.Modify;
    end;

    procedure SuggestPapers(TimetablePlanner: Record "Timetable Planner Header")
    var
        Job: Record Job;
        PlannerLines: Record "Timetable Planner Lines";
        LineNo: Integer;
        Papers: Record Papers;
        JobTask: Record "Job Task";
        PlannerLines1: Record "Timetable Planner Lines";
        TXT001: label 'Papers for the Exams to be offered on %1,have been added';
        ExaminationLines: Record "Timetable Examination Lines";
        ExaminationLines1: Record "Timetable Examination Lines";
        LineNo1: Integer;
    begin
        PlannerLines1.Reset;
        PlannerLines1.SetRange(Code, TimetablePlanner.Code);
        if PlannerLines1.FindSet then begin
            PlannerLines1.DeleteAll;
        end;

        ExaminationLines1.Reset;
        ExaminationLines1.SetRange(Code, TimetablePlanner.Code);
        if ExaminationLines1.FindSet then begin
            ExaminationLines1.DeleteAll;
        end;
        //get job first
        Job.Reset;
        Job.SetRange("Examination Sitting Cycle", TimetablePlanner."Exam Sitting ID");
        if Job.FindFirst then begin
            JobTask.Reset;
            JobTask.SetRange("Job No.", Job."No.");
            if JobTask.FindSet then begin
                repeat
                    //get papers
                    //INSERT Exam'
                    ExaminationLines1.Reset;
                    if ExaminationLines1.FindLast then begin
                        LineNo1 := ExaminationLines1."Line No.";
                    end;
                    ExaminationLines.Code := TimetablePlanner.Code;
                    ExaminationLines."Line No." := LineNo1 + 1;
                    ExaminationLines.Examination := JobTask."Job Task No.";
                    ExaminationLines.Validate(Examination);
                    //ExaminationLines.Description:=JobTask.Description;
                    ExaminationLines.Insert(true);

                    Papers.Reset;
                    Papers.SetRange(Course, JobTask."Job Task No.");
                    Papers.SetRange(Blocked, false);
                    if Papers.FindSet then begin
                        repeat
                            PlannerLines1.Reset;
                            if PlannerLines1.FindLast then begin
                                LineNo := PlannerLines1."Line No.";
                            end;
                            PlannerLines."Line No." := LineNo + 1;
                            PlannerLines."Entry No." := ExaminationLines."Line No.";
                            PlannerLines.Code := TimetablePlanner.Code;
                            PlannerLines.Examination := Papers.Course;
                            PlannerLines."Exam Sitting ID" := TimetablePlanner."Exam Sitting ID";
                            PlannerLines.Part := Papers.Level;
                            PlannerLines.Section := Papers.Section;
                            PlannerLines.Paper := Papers.Code;
                            PlannerLines.Validate(Paper);
                            PlannerLines.Insert;
                            LineNo1 += 1;
                        until Papers.Next = 0;
                    end;
                until JobTask.Next = 0;
                Message(TXT001, TimetablePlanner."Exam Sitting ID");
            end;
        end
    end;

    procedure SuggestStudentsBooked(MarksheetHeader: Record "Marksheet Header")
    var
        MarksheetLines: Record "Exam Marksheet Lines";
        MarksheetLines1: Record "Exam Marksheet Lines";
        DetailedLines: Record "Marksheet Detailed Lines";
        ExamBooking: Record "Exam Booking Entries";
        TXT001: label 'The booked students have been suggested successfully';
        DetailedLines1: Record "Marksheet Detailed Lines";
        EntryNo: Integer;
        ScriptVoucher: Record "Center  Header";
        SerialNoDetails: Record "Script Envelope Serials";
        EnvelopeNO: Code[30];
    begin
        //delete all lines
        //Pass Examination
        MarksheetLines1.Reset;
        MarksheetLines1.SetRange("Document No.", MarksheetHeader."Document No.");
        if MarksheetLines1.FindSet then begin
            MarksheetLines1.DeleteAll;
        end;
        //delet all detailed lines

        DetailedLines.Reset;
        DetailedLines.SetRange("Document No.", MarksheetHeader."Document No.");
        if DetailedLines.FindSet then begin
            DetailedLines.DeleteAll;
        end;

        DetailedLines.Reset;
        if DetailedLines.FindLast then
            EntryNo := DetailedLines."Line No.";

        //insert lines

        ExamBooking.Reset;
        ExamBooking.SetRange("Exam Sitting", MarksheetHeader."Examination Sitting ID");
        ExamBooking.SetRange(Status, ExamBooking.Status::Open);
        if ExamBooking.FindSet then begin
            repeat
                //check Envelope Serial No
                EnvelopeNO := '';
                ScriptVoucher.Reset;
                ScriptVoucher.SetRange("Center Code", ExamBooking."Exam Center");
                if ScriptVoucher.FindSet then begin
                    SerialNoDetails.Reset;
                    SerialNoDetails.SetRange("Document No.", ScriptVoucher."Document No.");
                    SerialNoDetails.SetRange("Paper Code", ExamBooking.Paper);
                    if SerialNoDetails.FindSet then begin
                        EnvelopeNO := SerialNoDetails."Envelope Serial No.";
                    end;
                end;
                //check if student exists twice
                MarksheetLines1.Reset;
                MarksheetLines1.SetRange("Document No.", MarksheetHeader."Document No.");
                MarksheetLines1.SetRange("Student Reg No.", ExamBooking."Student Reg No.");
                if not MarksheetLines1.FindFirst then begin

                    MarksheetLines."Document No." := MarksheetHeader."Document No.";
                    MarksheetLines."Student Reg No." := ExamBooking."Student Reg No.";
                    MarksheetLines.Validate("Student Reg No.");
                    MarksheetLines."Examination Center" := ExamBooking."Exam Center";
                    MarksheetLines."Examination Sitting ID" := MarksheetHeader."Examination Sitting ID";
                    MarksheetLines.Insert;

                end;
                //insert detailed line
                DetailedLines.Reset;
                DetailedLines.SetRange("Document No.", MarksheetHeader."Document No.");
                DetailedLines.SetRange("Student Reg No.", ExamBooking."Student Reg No.");
                DetailedLines.SetRange(Paper, ExamBooking.Paper);
                if not DetailedLines.FindFirst then begin
                    DetailedLines1."Line No." := EntryNo + 1;
                    DetailedLines1."Document No." := MarksheetHeader."Document No.";
                    DetailedLines1."Student Reg No." := ExamBooking."Student Reg No.";
                    DetailedLines1.Validate("Student Reg No.");
                    DetailedLines1."Examination Center" := ExamBooking."Exam Center";
                    DetailedLines1."Examination Sitting ID" := MarksheetHeader."Examination Sitting ID";
                    DetailedLines1.Examination := ExamBooking.Examination;
                    DetailedLines1.Part := ExamBooking.Part;
                    DetailedLines1.Paper := ExamBooking.Paper;
                    DetailedLines1.Validate(Paper);
                    DetailedLines1."Envelope Serial No." := EnvelopeNO;
                    DetailedLines1.Insert;
                    EntryNo += 1;
                end
            until ExamBooking.Next = 0;
            Message(TXT001);
        end;
    end;

    procedure SuggestEnvelopeSerial(MarksheetHeader: Record "Marksheet Header")
    var
        MarksheetLines: Record "Exam Marksheet Lines";
        MarksheetLines1: Record "Exam Marksheet Lines";
        DetailedLines: Record "Marksheet Detailed Lines";
        ExamBooking: Record "Exam Booking Entries";
        TXT001: label 'The booked students have been suggested successfully';
        DetailedLines1: Record "Marksheet Detailed Lines";
        EntryNo: Integer;
        ScriptVoucher: Record "Center  Header";
        SerialNoDetails: Record "Script Envelope Serials";
        EnvelopeNO: Code[30];
    begin
        //delete all lines
        //Pass Examination



        DetailedLines.Reset;
        if DetailedLines.FindLast then
            EntryNo := DetailedLines."Line No.";

        //insert lines

        ExamBooking.Reset;
        ExamBooking.SetRange("Exam Sitting", MarksheetHeader."Examination Sitting ID");
        ExamBooking.SetRange(Status, ExamBooking.Status::Open);
        if ExamBooking.FindSet then begin
            repeat



                DetailedLines.Reset;
                DetailedLines.SetRange("Document No.", MarksheetHeader."Document No.");
                DetailedLines.SetRange("Student Reg No.", ExamBooking."Student Reg No.");
                DetailedLines.SetRange(Paper, ExamBooking.Paper);
                if DetailedLines.FindSet then begin
                    //check Envelope Serial No
                    EnvelopeNO := '';
                    ScriptVoucher.Reset;
                    ScriptVoucher.SetRange("Center Code", ExamBooking."Exam Center");
                    if ScriptVoucher.FindSet then begin
                        SerialNoDetails.Reset;
                        SerialNoDetails.SetRange("Document No.", ScriptVoucher."Document No.");
                        SerialNoDetails.SetRange("Paper Code", ExamBooking.Paper);
                        if SerialNoDetails.FindSet then begin
                            EnvelopeNO := SerialNoDetails."Envelope Serial No.";
                        end;
                    end;

                    DetailedLines1."Envelope Serial No." := EnvelopeNO;
                    DetailedLines1.Modify;
                    EntryNo += 1;
                end


            //insert detailed line

            until ExamBooking.Next = 0;
            Message(TXT001);
        end;
    end;

    procedure GenerateResults(MarksheetHeader: Record "Marksheet Header")
    var
        ExaminationResults: Record "Examination Results";
        LineNo: Integer;
        ExaminationResults1: Record "Examination Results";
        DetailedLines: Record "Marksheet Detailed Lines";
    begin
        ExaminationResults.Reset;
        ExaminationResults.SetRange("Examination Sitting ID", MarksheetHeader."Examination Sitting ID");
        if ExaminationResults.FindSet then begin
            ExaminationResults.DeleteAll;
        end;
        //insert detailed lines
        DetailedLines.Reset;
        DetailedLines.SetRange("Document No.", MarksheetHeader."Document No.");
        if DetailedLines.FindSet then begin
            repeat
                ExaminationResults1.Reset;
                if ExaminationResults1.FindLast then begin
                    LineNo := ExaminationResults1."Line No.";
                end;
                ExaminationResults."Student Reg No." := DetailedLines."Student Reg No.";
                ExaminationResults."Line No." := LineNo + 1;
                ExaminationResults.Validate("Student Reg No.");
                ExaminationResults.Examination := DetailedLines.Examination;
                ExaminationResults.Part := DetailedLines.Part;
                ExaminationResults.Section := DetailedLines.Section;
                ExaminationResults.Paper := DetailedLines.Paper;
                ExaminationResults.Validate(Paper);
                ExaminationResults.Grade := DetailedLines.Grade;
                ExaminationResults."Financial Year" := MarksheetHeader."Financial Year Code";
                ExaminationResults."Examination Sitting ID" := MarksheetHeader."Examination Sitting ID";
                ExaminationResults."Section Grade" := CalculateSectionGrade(DetailedLines);
                ExaminationResults.Insert;


            until DetailedLines.Next = 0;
        end
    end;

    local procedure CalculateSectionGrade(DetailedLines: Record "Marksheet Detailed Lines") GradeCode: Code[30]
    var
        TotalPassed: Integer;
        SectionGrading: Record "Section Grading System";
        DetailedLines1: Record "Marksheet Detailed Lines";
    begin
        SectionGrading.Reset;
        SectionGrading.SetRange(Section, DetailedLines.Section);
        if SectionGrading.FindSet then begin
            repeat
                DetailedLines1.Reset;
                DetailedLines1.SetRange("Student Reg No.", DetailedLines."Student Reg No.");
                DetailedLines1.SetRange(Examination, SectionGrading.Examination);
                DetailedLines1.SetRange(Passed, true);
                DetailedLines1.SetRange(Section, SectionGrading.Section);
                if DetailedLines1.FindSet then begin
                    TotalPassed := 0;
                    repeat
                        TotalPassed += 1;
                    until DetailedLines1.Next = 0;
                end;
                if (TotalPassed = SectionGrading."No. of Papers Qualified") then begin
                    GradeCode := SectionGrading."Grade Code";
                end;
            until SectionGrading.Next = 0
        end;
        exit(GradeCode);
    end;

    procedure ApplicationSendRegretEmail(StudentUser: Record "Student Processing Header")
    var
        ContactUsers: Record Contact;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        EmailMessage.Create(StudentUser.Email,
        'HRMPEB STUDENT REGISTRATION',
         'Dear ' + StudentUser."Student Name" + ',<BR><BR>' +
         'Your registration request done on <b>' + ' ' + Format(StudentUser."Created On") + ' ' + '</b> is unsuccessful.<BR>' +
         'The following are/is the reason:' + StudentUser."Reason for Rejection" + '<BR>.Kindly login to the student portal and rectify the' +
         'application to proceed with the registration.' + '<BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.AddBCC(Email2);
        //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
        //SMTP.AppendToBody('<BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        StudentUser."Approval Status" := StudentUser."approval status"::Rejected;
        StudentUser.Modify(true);
    end;

    procedure ApplicationCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        CashMngmntSetup: Record "Cash Management Setup";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TXT001: label 'There is no unposted invoice for the application %1';
        ExaminationSetup: Record "Examination Setup";
        PaymentsPost: Codeunit "Payments-Post";
        Studentmanagement: Codeunit "Student management";
        ReceiptHeader1: Record "Receipts Header1";
        SalesInv1: Record "Sales Header";
    begin
        //code to post the created invoice
        ExaminationSetup.Get;
        ExaminationSetup.TestField("Payments Bank Code");
        CashMngmntSetup.Get();
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.FindFirst then begin
            SalesInv."Posting Date" := Today;
            SalesInv.Modify(true);
            Commit;
            SalesInv1.Reset;
            SalesInv1.SetRange("No.", SalesInv."No.");
            if SalesInv1.FindFirst then begin
                SalesPostYesNo.Run(SalesInv1);
            end;
        end;
        //check if receipt exists
        ReceiptHeader1.Reset;
        ReceiptHeader1.SetRange("Cheque No", BulkProcessingHeader."No.");
        ReceiptHeader1.SetRange(Posted, false);
        if ReceiptHeader1.FindFirst then begin
            Studentmanagement.PostReceipt(ReceiptHeader1);
        end
        else begin

            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code";
            if BulkProcessingHeader."Pay Mode" = '' then
                ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode"
            else
                ReceiptHeader."Pay Mode" := BulkProcessingHeader."Pay Mode";
            ReceiptHeader.Validate("Bank Code");
            ReceiptHeader."Received From" := BulkProcessingHeader."Student Name";
            ReceiptHeader."On Behalf Of" := BulkProcessingHeader."Student Name";
            ReceiptHeader."Posted Date" := Today;
            ReceiptHeader."Posting Date" := Today;
            ReceiptHeader.Insert(true);
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Registration amount';
            ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;

            ReceiptLines.Insert(true);
            if ExaminationSetup."Auto-Posting" = true then begin
                Studentmanagement.PostReceipt(ReceiptHeader);

                //RecSendPDFRegistration(BulkProcessingHeader);
            end;
            BulkProcessingHeader."Application Receipt" := ReceiptHeader."No.";
        end;
        //code to assing a unique registration No.]
        /*BulkProcessingHeader."Application Receipt":=ReceiptHeader."No.";
        ReceiptHeader.CALCFIELDS(Amount);
        BulkProcessingHeader."Application Amount":=ReceiptHeader.Amount;*/

        //open the receipt card

        ApplicationAssignRegistrationNo(BulkProcessingHeader);

        BulkProcessingHeader.Posted := true;
        BulkProcessingHeader."Posted Date" := Today;
        BulkProcessingHeader."Posted By" := UserId;
        BulkProcessingHeader."Posted On" := CurrentDatetime;
        BulkProcessingHeader.Modify(true);
        Commit;
        RecSendPDFRegistration(BulkProcessingHeader);

        //END

        //send email receipt

    end;

    procedure ApplicationCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        FileName: Text;
        FileLocation: Text;
        SalesHeader: Record "Sales Header";
        TXT001: label 'A sales invoice no %1,has already been processed for this application';
        ProcessingHeader: Record "Student Processing Header";
        PostedInvoice: Record "Sales Invoice Header";
    begin

        BulkProcessingHeader.TestField("Fee Type");

        ExaminationSetup.Get;
        PostedInvoice.Reset;
        PostedInvoice.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        PostedInvoice.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not PostedInvoice.FindFirst then begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if not SalesInv.FindFirst then begin
                SalesInv."Document Type" := SalesInv."document type"::Invoice;
                SalesInv."No." := '';
                SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
                SalesInv."Document Date" := Today;
                SalesInv."Order Date" := Today;
                SalesInv."Posting Date" := Today;
                SalesInv."External Document No." := BulkProcessingHeader."No.";
                SalesInv.Type := SalesInv.Type::Normal;
                SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
                SalesInv."Prepayment %" := 100;//enforce prepayment`

                SalesInv.Insert(true);
                SalesLine.Init;
                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                SalesLine."Document No." := SalesInv."No.";
                SalesLine.Type := SalesLine.Type::Resource;
                SalesLine."No." := BulkProcessingHeader."Fee Type";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := BulkProcessingHeader."Application Amount";
                SalesLine.Validate("Unit Price");
                if BulkProcessingHeader.Disabled = true then begin
                    SalesLine."Line Discount %" := ExaminationSetup."Disability Discount %";
                    SalesLine.Validate("Line Discount %");
                end;
                SalesLine.Insert(true);
                Commit;
                if BulkProcessingHeader.Disabled = true then begin
                    SalesInv.CalcFields(Amount);
                    BulkProcessingHeader."Application Amount" := SalesInv.Amount;
                end;
                BulkProcessingHeader."Application Invoice" := SalesInv."No.";
                BulkProcessingHeader.Modify(true);
                ;
                Commit;

            end
            else begin
                BulkProcessingHeader."Application Invoice" := SalesInv."No.";
                BulkProcessingHeader.Modify(true);
                ;
                Commit;
            end
        end else
            Error(TXT001, SalesInv."No.");
    end;


    procedure ApplicationOnboardCustomer(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        salesheader: Page "Sales Invoice";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLines: Record "Receipt Lines1";
        PaymentPost: Codeunit "Payments-Post";
        BOSAACC: Code[20];
        Amount: Decimal;
        FileDirectory: Text;
        FileName: Text;
        SMTPMailSet: Record "Email Account";
        Notification1: Codeunit "Email Message";
        objCustomer: Record Customer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BulkProcessingLines: Record "Bulk Processing Lines";
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        TXT001: label 'Are you sure you want to create the Account';
        TXT002: label 'The student %1 has been created to the customer account %2';
        TXT003: label 'The student %1 already has an existing customer account %2';
        Cust: Record Customer;
        WorkType: Record "Work Type";
        DocumentLink: Record "Record Link";
        TXT004: label 'Kindly attach the mandatory documents required for this application';
    begin
        //check for an attachment
        if BulkProcessingHeader.Portal = true then begin
            DocumentLink.Reset;
            DocumentLink.SetRange("Record ID", BulkProcessingHeader.RecordId);
            if not DocumentLink.FindSet then
                Error(TXT004);

        end;

        BulkProcessingHeader.TestField("Fee Type");
        ExaminationSetup.Get;
        AppNo := '';
        Cust.Reset;
        Cust.SetRange("ID. No.", BulkProcessingHeader."ID Number/Passport No.");
        if not Cust.FindSet then begin

            //create student account
            NoSeriesMgt.InitSeries(ExaminationSetup."Student Nos.", ExaminationSetup."Student Nos.", 0D, AppNo, ExaminationSetup."Student Nos.");

            Cust."No." := AppNo;
            Cust."Funding Class" := Cust."funding class"::Student;
            Cust."Customer Type" := Cust."customer type"::Student;
            Cust.Name := BulkProcessingHeader."First Name" + ' ' + BulkProcessingHeader."Middle Name" + ' ' + BulkProcessingHeader.Surname;
            Cust."First Name" := BulkProcessingHeader."First Name";
            Cust."Middle Name" := BulkProcessingHeader."Middle Name";
            Cust."Last Name" := BulkProcessingHeader.Surname;
            Cust.Address := BulkProcessingHeader.Address;
            Cust."Address 2" := BulkProcessingHeader."Address 2";
            Cust."Post Code" := BulkProcessingHeader."Post Code";
            if BulkProcessingHeader.Gender = BulkProcessingHeader.Gender::Female then
                Cust.Gender := Cust.Gender::Female;
            if BulkProcessingHeader.Gender = BulkProcessingHeader.Gender::Male then
                Cust.Gender := Cust.Gender::Male;
            if BulkProcessingHeader.Gender = BulkProcessingHeader.Gender::" " then
                Cust.Gender := Cust.Gender::Other;
            Cust.Validate("Post Code");
            Cust."Currency Code" := BulkProcessingHeader."Currency Code";
            //get work type
            WorkType.Reset;
            WorkType.SetRange(Code, BulkProcessingHeader."Type Code");
            if WorkType.FindFirst then begin
                Cust."Gen. Bus. Posting Group" := WorkType."Gen. Bus. Posting Group";
                Cust."Customer Posting Group" := WorkType."Customer Posting Group";
            end;

            Cust."NCPWD No." := BulkProcessingHeader."NCPWD No.";
            Cust."ID. No." := BulkProcessingHeader."ID Number/Passport No.";
            Cust.County := BulkProcessingHeader.County;
            Cust."Phone No." := BulkProcessingHeader."Phone No.";
            Cust."E-Mail" := BulkProcessingHeader.Email;
            Cust.Image := BulkProcessingHeader.Image;
            Cust.Insert(true);
            Cust."Bill-to Customer No." := AppNo;
            Cust.Validate("Bill-to Customer No.");
            Cust.Modify(true);
            BulkProcessingHeader.Created := true;
            BulkProcessingHeader."Student No." := Cust."No.";
            BulkProcessingHeader."Student Name" := Cust.Name;
            BulkProcessingHeader.Modify(true);

            ApplicationCreateInvoice(BulkProcessingHeader);
            RegistrationStudent(BulkProcessingHeader);
        end else
            Error('The student with the number %1,already exists', Cust."ID. No.");

    end;

    procedure ApplicationAssignRegistrationNo(BulkProcessingHeader: Record "Student Processing Header") RegistrationNo: Code[30]
    var
        ExaminationAccount: Record "Examination Account";
        Courses: Record Courses;
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        ExamAccountNo: Code[50];
        NoSeries: Code[50];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TXT001: label 'The student account %1, has been created successfully..';
        RegistrationAccount: Record "Examination Account";
        TXT002: label 'The student %1,has an existing registration with no %2 on the course %3';
        ExamSittingCycle: Record "Exam Sitting Cycle";
        RenewalDateVar: Date;
        RenewalDate: Date;
        RegistrationMonth: Integer;
        NextCycleMonth: Integer;
        RenewalDay: Integer;
        RenewalMonth: Integer;
        RenewalYear: Integer;
        RenewalDateValue: Text;
        ExaminationSetup: Record "Examination Setup";
        DocLog: Record "Student Mgmt E-mail Log";
        Counter: Integer;
        Header: Record "Student Processing Header";
        Cust: Record Customer;
        CustomerCode: Code[50];
        ExaminationAccount1: Record "Examination Account";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        Recipients: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;
        BulkProcessingHead: Record "Student Processing Header";
    begin
        //check if student has existing registration no.
        if BulkProcessingHeader."Student No." = '' then begin
            Cust.Reset;
            Cust.SetRange("ID. No.", BulkProcessingHeader."ID Number/Passport No.");
            if Cust.FindFirst then begin
                CustomerCode := Cust."No.";
            end
        end
        else begin
            CustomerCode := BulkProcessingHeader."Student No.";
        end;



        ExaminationSetup.Get;
        RegistrationAccount.Reset;
        RegistrationAccount.SetRange("Student Cust No.", CustomerCode);
        RegistrationAccount.SetRange("Course ID", BulkProcessingHeader."Examination ID");
        if not RegistrationAccount.FindSet then begin
            ExamAccountNo := '';
            Courses.Reset;
            Courses.SetRange(Code, BulkProcessingHeader."Examination ID");
            if Courses.FindFirst then begin
                NoSeriesMgt.InitSeries(Courses."No. Series", Courses."No. Series", 0D, ExamAccountNo, Courses."No. Series");
                ExaminationAccount.Init;
                ExaminationAccount."Registration No." := ExamAccountNo;
                ExaminationAccount."Student Cust No." := BulkProcessingHeader."Student No.";
                ExaminationAccount."Student Cust No." := CustomerCode;
                ExaminationAccount.Validate("Student Cust No.");
                ExaminationAccount."Course ID" := BulkProcessingHeader."Examination ID";
                ExaminationAccount.Validate("Course ID");
                ExaminationAccount."Registration Date" := Today;
                ExaminationAccount.Email := BulkProcessingHeader.Email;
                ExaminationAccount."Current Examination Sitting" := BulkProcessingHeader."Examination Sitting";
                if Courses."Renewal On Booking" = true then begin
                    ExaminationAccount."Renewal Pending" := 1;
                end;
                ExaminationAccount.Insert(true);
                Commit;

                RegistrationMonth := Date2dwy(Today, 2);
                if RegistrationMonth > 7 then begin
                    RenewalDate := CalcDate('+1y', Today);
                    RenewalDay := 1;
                    RenewalMonth := 7;
                    RenewalYear := Date2dwy(RenewalDate, 3);
                    RenewalDate := Dmy2date(RenewalDay, RenewalMonth, RenewalYear);
                end else begin
                    RenewalDay := 1;
                    RenewalMonth := 7;
                    RenewalYear := Date2dwy(Today, 3);
                    RenewalDate := Dmy2date(RenewalDay, RenewalMonth, RenewalYear);
                end;


                ExamSittingCycle.Reset;
                ExamSittingCycle.SetFilter("Exam Start Date", '>%1', Today);
                ExamSittingCycle.SetRange("Sitting Status", ExamSittingCycle."sitting status"::Active);
                if ExamSittingCycle.FindFirst then begin
                    RenewalDateValue := Format(RenewalDate, 0, '<Day,2>/<Month,2>/<Year4>');



                    // IF BulkProcessingHeader.Portal=TRUE THEN BEGIN
                    ExaminationAccount1.Reset;
                    ExaminationAccount1.SetRange("ID No.", BulkProcessingHeader."ID Number/Passport No.");
                    ExaminationAccount1.SetRange("Course ID", BulkProcessingHeader."Examination ID");
                    if ExaminationAccount1.FindFirst then begin
                        // EmailMessage.Create(BulkProcessingHeader.Email,
                        // 'HRMPEB STUDENT REGISTRATION',
                        // 'Dear ' + BulkProcessingHeader."Student Name" + '<BR><BR>' +
                        // 'Congratulations on your succesfull registration  done on<b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b>.<BR><BR>' +
                        // 'Your registration number is:   <b>' + ExamAccountNo + '</b><BR>' +
                        // 'Your first eligible examination sitting is:   <b>' + ExamSittingCycle."Exam Sitting Cycle" + '</b><BR>' +
                        // 'Your first renewal is due on:   <b>' + RenewalDateValue + '</b><BR><BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');

                        BulkProcessingHead.SetRange("No.", BulkProcessingHeader."No.");
                        RecRef.GetTable(BulkProcessingHead);
                        TempBlob.CreateOutStream(OutStr);
                        Report.SaveAs(Report::"Registration Letter", '', ReportFormat::Pdf, OutStr, RecRef);
                        TempBlob.CreateInStream(InStr);
                        InStr.ReadText(BodyTxt);

                        EmailMessage.Create(BulkProcessingHeader.Email,
                                        'HRMPEB STUDENT REGISTRATION',
                                        'Dear ' + BulkProcessingHeader."Student Name" + '<br/><br/>' +
                                        'Congratulations on your succesfull registration  done on<strong>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</strong>.<br/><br/>' +
                                        'Your registration number is:   <strong>' + ExamAccountNo + '</strong><br/>' +
                                        'Your first eligible examination sitting is:   <strong>' + ExamSittingCycle."Exam Sitting Cycle" + '</strong><br/>' +
                                        'Your first renewal is due on:   <strong>' + RenewalDateValue + '</strong><br/><br/><br/>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]', true);

                        // add attachment for with pdf
                        // TempBlob.CreateOutStream(OutStr2);
                        // Report.SaveAs(Report::"Registration Letter", '', ReportFormat::Pdf, OutStr, RecRef);
                        // TempBlob.CreateInStream(InStr2);
                        // EmailMessage.AddAttachmentStream(InStr2, 'attachment.pdf');
                        // EmailMessage.add
                        EmailMessage.AddAttachment('attachment.pdf', 'PDF', InStr);
                        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);


                    end;
                    //SMS integration
                    if BulkProcessingHeader."Phone No." <> '' then begin
                        SMSIntegration.FnSendSMSMessage(BulkProcessingHeader."No.", ExamAccountNo, BulkProcessingHeader."Phone No.", 'Registration No::' + ExamAccountNo + '');
                    end;
                    //end SMS integration
                    // END;
                end;

                Message(TXT001, ExamAccountNo);
            end;
            if ((BulkProcessingHeader.Portal = true) or (BulkProcessingHeader."Manual Input" = true)) then begin
                BulkProcessingHeader.Posted := true;
                BulkProcessingHeader."Posted Date" := Today;
                BulkProcessingHeader."Posted By" := UserId;
                BulkProcessingHeader."Posted On" := CurrentDatetime;
                BulkProcessingHeader.Modify(true);

            end;
            exit(ExamAccountNo);
        end else begin
            BulkProcessingHeader.Posted := true;
            BulkProcessingHeader."Posted Date" := Today;
            BulkProcessingHeader."Posted By" := UserId;
            BulkProcessingHeader."Posted On" := CurrentDatetime;
            BulkProcessingHeader.Modify(true);
            Commit;
            Error(TXT002, BulkProcessingHeader."Student No.", RegistrationAccount."Registration No.", RegistrationAccount."Course Description");

        end;
    end;

    procedure ApplicationTransferRegistrationNo(BulkProcessingHeader: Record "Examination Account"; CourseId: Code[30])
    var
        ExaminationAccount: Record "Examination Account";
        Courses: Record Courses;
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        ExamAccountNo: Code[30];
        NoSeries: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TXT001: label 'The student account %1, has been created successfully';
        RegistrationAccount: Record "Examination Account";
        TXT002: label 'The student %1,has an existing registration with no %2 on the course %3';
        ExamSittingCycle: Record "Exam Sitting Cycle";
        RenewalDateVar: Date;
        RenewalDate: Date;
        RegistrationMonth: Integer;
        NextCycleMonth: Integer;
        RenewalDay: Integer;
        RenewalMonth: Integer;
        RenewalYear: Integer;
        RenewalDateValue: Text;
        ExaminationSetup: Record "Examination Setup";
        Courses1: Record "Transferable Course Setup";
        TXT003: label 'You are not allowed to transfer the student in this course to the selected one consult the system Administrator';
        ProcessingHeader: Record "Student Processing Header";
        TXT004: label 'The student account has been cancelled,kindly raise an existing student registration for this case';
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        //check if student has existing registration no.
        ExaminationSetup.Get;
        ExamAccountNo := '';
        Courses1.Reset;
        Courses1.SetRange(Course, BulkProcessingHeader."Course ID");
        Courses1.SetRange("Transferable Course", CourseId);
        if Courses1.FindFirst then begin
            if Courses1."Refund Required" = false then begin
                Courses.Reset;
                Courses.SetRange(Code, Courses1."Transferable Course");
                if Courses.FindFirst then begin
                    NoSeriesMgt.InitSeries(Courses."No. Series", Courses."No. Series", 0D, ExamAccountNo, Courses."No. Series");
                    ExaminationAccount.Init;
                    ExaminationAccount."Registration No." := ExamAccountNo;
                    ExaminationAccount."Student Cust No." := BulkProcessingHeader."Student Cust No.";
                    ExaminationAccount.Validate("Student Cust No.");
                    ExaminationAccount."Course ID" := Courses.Code;
                    ExaminationAccount.Validate("Course ID");
                    ExaminationAccount.Email := BulkProcessingHeader.Email;
                    ExaminationAccount."Current Examination Sitting" := BulkProcessingHeader."Current Examination Sitting";
                    ExaminationAccount.Insert;
                    RegistrationMonth := Date2dwy(BulkProcessingHeader."Registration Date", 2);
                    if RegistrationMonth > 7 then begin
                        RenewalDate := CalcDate('+1y', Today);
                        RenewalDay := 1;
                        RenewalMonth := 7;
                        RenewalYear := Date2dwy(RenewalDate, 3);
                        RenewalDate := Dmy2date(RenewalDay, RenewalMonth, RenewalYear);
                    end else begin
                        RenewalDay := 1;
                        RenewalMonth := 7;
                        RenewalYear := Date2dwy(Today, 3);
                        RenewalDate := Dmy2date(RenewalDay, RenewalMonth, RenewalYear);
                    end;

                    ExamSittingCycle.Reset;
                    ExamSittingCycle.SetFilter("Exam Start Date", '>%1', Today);
                    ExamSittingCycle.SetRange("Sitting Status", ExamSittingCycle."sitting status"::Active);
                    if ExamSittingCycle.FindFirst then begin
                        RenewalDateValue := Format(RenewalDate, 0, '<Day,2>/<Month,2>/<Year4>');
                        EmailMessage.Create(BulkProcessingHeader.Email,
                        'HRMPEB STUDENT REGISTRATION',
                        'Dear ' + BulkProcessingHeader."First Name" + '<BR><BR>' +
                        'Congratulations on your succesfull transfer of registration  done on<b>' + ' ' + Format(Today) + ' ' + '</b>.<BR><BR>' +
                        'Your registration number is:   <b>' + ExamAccountNo + '</b><BR>' +
                        'Your first eligible examination sitting is:   <b>' + ExamSittingCycle."Exam Sitting Cycle" + '</b><BR>' +
                        'Your first renewal is due on:   <b>' + RenewalDateValue + '</b><BR><BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
                        //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
                        //SMTP.Send();
                        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                    end;
                    Message(TXT001, ExamAccountNo);
                end
            end else begin

                // create a reversal journal
                ApplicationRefundRegistrationMoney(BulkProcessingHeader);

                BulkProcessingHeader.Transfered := true;
                BulkProcessingHeader.Blocked := true;
                BulkProcessingHeader."Blocked Start Date" := Today;
                BulkProcessingHeader."Transfer Date" := Today;
                BulkProcessingHeader."Transfered By" := UserId;
                BulkProcessingHeader.Status := BulkProcessingHeader.Status::Inactive;
                BulkProcessingHeader.Modify(true);
                Message(TXT001, ExamAccountNo);
            end;
        end
        else
            Error(TXT003);

    end;


    procedure ApplicationRefundRegistrationMoney(ExemptionEntries: Record "Examination Account")
    var
        ProcessingLines: Record "Student Processing Lines";
        Header: Record "Student Processing Header";
        ExaminationSetup: Record "Examination Setup";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        InvoiceHeader: Record "Sales Invoice Header";
        SalesLine: Record "Sales Invoice Line";
        Resource: Record Resource;
        PostingSetup: Record "General Posting Setup";
    begin
        if ExemptionEntries.Status = ExemptionEntries.Status::Active then begin
            //create a journal for each reversal
            Header.Reset;
            Header.SetRange("ID Number/Passport No.", ExemptionEntries."ID No.");
            Header.SetRange("Document Type", Header."document type"::Registration);
            Header.SetRange(Posted, true);
            if Header.FindFirst then begin
                ExaminationSetup.Get;
                GenJnLine.Reset;
                GenJnLine.SetRange(GenJnLine."Journal Template Name", ExaminationSetup."Registration Reversal Template");
                GenJnLine.SetRange(GenJnLine."Journal Batch Name", ExaminationSetup."Regist  Reversal Batch Name");
                GenJnLine.DeleteAll;
                LineNo := 10;
                //get the resource from the exemption
                InvoiceHeader.Reset;
                InvoiceHeader.SetRange("External Document No.", Header."No.");
                if InvoiceHeader.FindFirst then begin
                    InvoiceHeader.CalcFields(Amount);
                    SalesLine.Reset;
                    SalesLine.SetRange("Document No.", InvoiceHeader."No.");
                    if SalesLine.FindFirst then begin

                        Resource.Reset;
                        Resource.SetRange("No.", SalesLine."No.");
                        if Resource.FindFirst then begin
                            PostingSetup.Reset;
                            PostingSetup.SetRange("Gen. Prod. Posting Group", Resource."Gen. Prod. Posting Group");
                            if PostingSetup.FindFirst then begin

                                GenJnLine.Init;
                                GenJnLine."Journal Template Name" := ExaminationSetup."Registration Reversal Template";
                                GenJnLine."Journal Batch Name" := ExaminationSetup."Regist  Reversal Batch Name";
                                GenJnLine."Line No." := LineNo + 10;
                                GenJnLine."Account Type" := GenJnLine."account type"::Customer;
                                GenJnLine."Account No." := InvoiceHeader."Sell-to Customer No.";
                                GenJnLine.Validate(GenJnLine."Account No.");
                                GenJnLine."Posting Date" := Today;
                                GenJnLine."Document No." := ExemptionEntries."Registration No.";
                                GenJnLine."External Document No." := Format(ExemptionEntries."Registration No.");
                                GenJnLine.Description := 'Reversal Registration-' + ' ' + ExemptionEntries."Registration No.";
                                GenJnLine.Amount := -InvoiceHeader.Amount;
                                GenJnLine.Validate(GenJnLine.Amount);
                                GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
                                GenJnLine."Bal. Account No." := PostingSetup."Sales Account";
                                if GenJnLine.Amount <> 0 then
                                    GenJnLine.Insert;
                                LineNo += 1;

                            end;
                            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

                        end;
                    end
                end;


            end;
        end
    end;

    procedure RecSendPDFRegistration(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptsHeader1: Record "Student Processing Header";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //GET Assigned registration number
        ExaminationAccount.RESET;
        ExaminationAccount.SETRANGE("Student Cust No.", StudentProcessingHeader."Student No.");
        IF ExaminationAccount.FINDFIRST THEN BEGIN
            RegistrationNo := ExaminationAccount."Registration No.";
        END;
        EmailMessage.Create(StudentProcessingHeader.Email,
        'HRMPEB STUDENT REGISTRATION',
        'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        'Your registration payment done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        'Your assigned registration Number is:<BR/><b>' + RegistrationNo + '</b><BR>' +
        'Find attached the receipt:' + StudentProcessingHeader."Application Receipt" + '');
        FileName := StudentProcessingHeader."Application Receipt" + '.pdf';
        FileLocation := ExaminationSetup."Examination Path" + FileName;
        ReceiptsHeader1.Reset;
        ReceiptsHeader1.SetRange("No.", StudentProcessingHeader."No.");
        if ReceiptsHeader1.FindFirst then begin
            Report.SaveAsPdf(85049, FileLocation, ReceiptsHeader1);
        end;

        EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        //SMTP.AddBCC(Email2);
        //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>HRMPEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();
    end;

    procedure RecSendPDFRegistrationandReg(BulkProcessingHeader: Record "Bulk Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptsHeader1: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        BulkProcessingLines: Record "Bulk Processing Lines";
        StudentProcessingHeader: Record "Student Processing Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //send email to the institution
        EmailMessage.Create(StudentProcessingHeader.Email,
        'HRMPEB STUDENT REGISTRATION',
        'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        'Your registration request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        'Find attached the receipt:' + BulkProcessingHeader."Application Receipt" + '');

        FileName := BulkProcessingHeader."Application Receipt" + '.pdf';
        FileLocation := ExaminationSetup."Examination Path" + FileName;
        ReceiptsHeader1.Reset;
        ReceiptsHeader1.SetRange("Payment Reference", BulkProcessingHeader."No.");
        if ReceiptsHeader1.FindFirst then begin
            Report.SaveAsPdf(56003, FileLocation, ReceiptsHeader1);
        end;
        EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        //SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>HRMPEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        ////SMTP.Send();
        //send email to individual students

        BulkProcessingLines.Reset;
        //BulkProcessingLines.SETRANGE("Bulk Header No.",BulkProcessingHeader."No.");
        BulkProcessingLines.SetRange(Passed, true);
        if BulkProcessingLines.FindSet then begin
            repeat
                //generate registration no
                RegistrationNo := BulkAssignRegistrationNo(BulkProcessingLines);

                //send email to the student
                if BulkProcessingLines.Email <> '' then begin
                    //SMTP.Create('HRMPEB STUDENT REGISTRATION', Email2, BulkProcessingLines.Email,
                    // 'HRMPEB STUDENT REGISTRATION',
                    // 'Dear ' + BulkProcessingLines."Student Name" + ',<BR><BR>' +
                    // 'Your registration request through<b> ' + BulkProcessingHeader."Institution Name" + '</b> has been processed.<BR>' +
                    // 'Your assigned registration Number is:<BR/><b>' + RegistrationNo + '</b><BR>', true);
                    //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
                    //SMTP.AppendToBody('The registration numbers have been shared to the student emails shared');
                    //SMTP.AppendToBody('<BR><BR>HRMPEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                    //SMTP.Send();
                end;
            until BulkProcessingLines.Next = 0;
        end;
    end;

    procedure BookingCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        TXT001: label 'Invoice %1 sent succesfully';
        TXT002: label 'An invoice no %1 for this booking has already been processed';
        StudentLines: Record "Student Processing Lines";
        ExaminationAccount: Record "Examination Account";
        DocumentLink: Record "Record Link";
        TXT003: label 'Kindly attach the mandatory document for this application';
        InvoiceHeader: Record "Sales Invoice Header";
        StudentLines1: Record "Student Processing Lines";
        TotalAmount: Decimal;
        TXT004: label 'Select the Examination Center For the Booking %1';
        ExamBookingEntries: Record "Exam Booking Entries";
        TXT005: label 'Booking entries for this student already exist';
        SalesInv2: Record "Sales Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        // IF BulkProcessingHeader.Portal=TRUE THEN BEGIN
        // DocumentLink.RESET;
        // DocumentLink.SETRANGE("Record ID",BulkProcessingHeader.RECORDID);
        // IF NOT  DocumentLink.FINDSET THEN BEGIN
        //  ERROR(TXT003);
        // END
        //END;
        //ensure no bookings exists for the sitting
        if not BulkProcessingHeader."Additional Exemption" = true then begin
            ExamBookingEntries.Reset;
            ExamBookingEntries.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
            ExamBookingEntries.SetRange("Exam Sitting", BulkProcessingHeader."Examination Sitting");
            ExamBookingEntries.SetRange(Status, ExamBookingEntries.Status::Open);
            if ExamBookingEntries.FindSet then begin
                // ERROR(TXT005);
                // EXIT;
            end;
        end;
        if BulkProcessingHeader."Examination Center Code" = '' then
            Error(TXT004, BulkProcessingHeader."No.");
        //check posted invoice
        InvoiceHeader.Reset;
        InvoiceHeader.SetRange("External Document No.", BulkProcessingHeader."No.");
        if InvoiceHeader.FindSet then begin
            BulkProcessingHeader."Booking Invoice No." := InvoiceHeader."Pre-Assigned No.";
            BulkProcessingHeader.Modify(true);
            Commit;
            exit;
        end;

        SalesInv.Reset;
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not SalesInv.FindFirst then begin

            if BulkProcessingHeader."Currency Code" <> '' then begin
                StudentLines1.Reset;
                StudentLines1.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                if StudentLines1.FindSet then begin
                    repeat
                        TotalAmount := TotalAmount + StudentLines1.Amount;
                    until StudentLines1.Next = 0;
                end;
            end;
            SalesInv."Document Type" := SalesInv."document type"::Invoice;
            SalesInv."No." := '';
            SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
            SalesInv."Document Date" := Today;
            SalesInv."Order Date" := Today;
            SalesInv."Currency Code" := BulkProcessingHeader."Currency Code";
            SalesInv.Validate(SalesInv."Currency Code");
            SalesInv."Posting Date" := Today;
            SalesInv."External Document No." := BulkProcessingHeader."No.";
            SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
            SalesInv.Type := SalesInv.Type::Normal;
            SalesInv."Prepayment %" := 100;//enforce prepayment`
            SalesInv.Insert(true);
            BulkProcessingHeader.CalcFields("Booking Amount");
            //get resource entry
            ResourcePrice.Reset;
            ResourcePrice.SetRange(Code, BulkProcessingHeader."Fee Type");
            if ResourcePrice.FindSet then begin
                SalesLine.Init;
                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                SalesLine."Document No." := SalesInv."No.";
                SalesLine."No." := ResourcePrice.Code;
                SalesLine.Type := SalesLine.Type::Resource;
                SalesLine.Validate(SalesLine."No.");
                SalesLine.Validate(SalesLine.Quantity, 1);
                if BulkProcessingHeader."Currency Code" <> '' then
                    SalesLine.Validate(SalesLine."Unit Price", TotalAmount)
                else
                    SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Booking Amount");
                SalesLine.Insert(true);
            end;
            BulkProcessingHeader."Booking Invoice No." := SalesInv."No.";
            BulkProcessingHeader.Modify;
            //send email pro-forma
            ExaminationSetup.GET;
            Email2 := ExaminationSetup."Registration Sender Email";
            EmailMessage.Create(BulkProcessingHeader.Email,
            'HRMPEB STUDENT BOOKING',
             'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
             'Your registration request done on <b>' + ' ' + FORMAT(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
             'Find attached the invoice for payment');
            Filename := SalesInv."No." + '.pdf';
            FileLocation := ExaminationSetup."Examination Path" + Filename;
            SalesHeader.RESET;
            SalesHeader.SETRANGE("No.", SalesInv."No.");
            IF SalesHeader.FINDSET THEN BEGIN
                Report.SaveAsPdf(1302, FileLocation, SalesHeader);
            END;
            EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            //SMTP.AddBCC(Email2);
            //SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>For more details contact the following:<BR>');
            //SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>HRMPEB STUDENT BOOKING<BR>');
            //SMTP.Send();
            Message(TXT001, SalesInv."No.");
            StudentLines.Reset;
            StudentLines.SetRange("Booking Header No.", BulkProcessingHeader."No.");
            if StudentLines.FindSet then begin
                if StudentLines."Transaction Type" = StudentLines."transaction type"::Renewal then begin
                    ExaminationAccount.Reset;
                    ExaminationAccount.SetRange("Registration No.", BulkProcessingHeader."Student Reg. No.");
                    if ExaminationAccount.FindFirst then begin
                        //POST RENEWAL ENTRIES
                        ExaminationAccount."Renewal Amount" := 0;
                        ExaminationAccount."Renewal Pending" := 0;
                        ExaminationAccount.Modify(true);
                    end;
                end;
                if StudentLines."Transaction Type" = StudentLines."transaction type"::Reinstatement then begin
                    ExaminationAccount.Reset;
                    ExaminationAccount.SetRange("Registration No.", BulkProcessingHeader."Student Reg. No.");
                    if ExaminationAccount.FindFirst then begin
                        ExaminationAccount."Re-Activation Amount" := 0;
                        ExaminationAccount.Modify(true);
                    end;
                end;
            end
        end else begin
            SalesInv2.Reset;
            SalesInv2.SetRange("No.", SalesInv."No.");
            if SalesInv2.FindFirst then begin
                SalesInv2."Posting Date" := Today;
                SalesInv2.Modify(true);

            end;
            Error(TXT002, SalesInv."No.");
        end

    end;

    procedure BookingRemoveInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        TXT001: label 'Invoice %1 sent succesfully';
        TXT002: label 'An invoice no %1 for this booking has already been processed';
        StudentLines: Record "Student Processing Lines";
        ExaminationAccount: Record "Examination Account";
        DocumentLink: Record "Record Link";
        TXT003: label 'Kindly attach the mandatory document for this application';
        InvoiceHeader: Record "Sales Invoice Header";
        StudentLines1: Record "Student Processing Lines";
        TotalAmount: Decimal;
        TXT004: label 'Select the Examination Center For the Booking %1';
        ExamBookingEntries: Record "Exam Booking Entries";
        TXT005: label 'Booking entries for this student already exist';
        TXT006: label 'Kindly reverse the booking invoice %1,to allow  removal from the booking';
    begin

        //check posted invoice
        InvoiceHeader.Reset;
        InvoiceHeader.SetRange("External Document No.", BulkProcessingHeader."No.");
        InvoiceHeader.SetFilter("Remaining Amount", '<>%1', 0);
        if InvoiceHeader.FindSet then begin
            Error(TXT006, InvoiceHeader."No.");
        end else begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if SalesInv.FindFirst then begin
                SalesInv."External Document No." := '';
                SalesInv.Modify(true);
            end;
            BulkProcessingHeader."Booking Invoice No." := '';
            BulkProcessingHeader."Application Invoice" := '';
            BulkProcessingHeader.Modify(true);
        end;
    end;

    procedure BookingCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
        CustLedgerEntry: Record "Cust. Ledger Entry";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesInv1: Record "Sales Header";
    begin
        //code to post the created invoice
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.Find('-') then begin
            SalesInv."Posting Date" := Today;
            SalesInv.Modify(true);
            Commit;
            SalesInv1.Reset;
            SalesInv1.SetRange("No.", SalesInv."No.");
            if SalesInv1.FindFirst then begin
                SalesPostYesNo.Run(SalesInv1);
            end;
            Message('Invoice %1 has been posted Successfully', SalesInv."No.");
            CashMngmntSetup.Get();
            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code";

            if BulkProcessingHeader."Pay Mode" = '' then
                ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode"
            else
                ReceiptHeader."Pay Mode" := BulkProcessingHeader."Pay Mode";
            ReceiptHeader.Validate("Bank Code");
            ReceiptHeader."Received From" := BulkProcessingHeader."Student Name";
            ReceiptHeader."On Behalf Of" := BulkProcessingHeader."Student Name";
            ReceiptHeader."Posted Date" := Today;
            ReceiptHeader."Posting Date" := Today;
            ReceiptHeader.Date := Today;

            ReceiptHeader.Insert(true);
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Booking amount';
            ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            CustLedgerEntry.SetRange(Amount, BulkProcessingHeader."Booking Amount");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;
            ReceiptLines.Insert(true);
            Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
        end;
        BulkProcessingHeader."Booking Receipt No." := ReceiptHeader."No.";
        BulkProcessingHeader.Modify(true);
    end;

    procedure BookingSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Student Processing Header";
        FileName1: Text;
        FileLocation1: Text;
        ProcessingHeader: Record "Student Processing Header";
        DocLog: Record "Student Mgmt E-mail Log";
        Counter: Integer;
        Header: Record "Student Processing Header";
        BookingEntries: Record "Exam Booking Entries";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";

        //check if booking entries have a value
        BookingEntries.Reset;
        BookingEntries.SetRange(Code, StudentProcessingHeader."No.");
        BookingEntries.SetRange(Blocked, false);
        BookingEntries.SetRange(Cancelled, false);
        if not BookingEntries.FindFirst then begin
            exit;
        end;
        if StudentProcessingHeader.Image.Hasvalue then begin
            EmailMessage.Create(StudentProcessingHeader.Email,
            'HRMPEB:EXAMINATION BOOKING',
            'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
            'Your booking request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
            'Find attached the receipt and the  provisional timetable which you should check for an updated one <b>21 Days</b> before the examination. ');

            FileName := StudentProcessingHeader."Booking Invoice No." + '.pdf';
            FileLocation := ExaminationSetup."Examination Path" + FileName;

            ReceiptHeader1.Reset;
            ReceiptHeader1.SetRange("No.", StudentProcessingHeader."No.");
            if ReceiptHeader1.FindSet then begin
                Report.SaveAsPdf(85047, FileLocation, ReceiptHeader1);
                EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
            end;

            //Attach timetable
            FileName1 := StudentProcessingHeader."No." + '.pdf';
            FileLocation1 := ExaminationSetup."Examination Path" + FileName1;
            ProcessingHeader.Reset;
            ProcessingHeader.SetRange("No.", StudentProcessingHeader."No.");
            if ProcessingHeader.FindFirst then begin
                Report.SaveAsPdf(85026, FileLocation1, ProcessingHeader);
                EmailMessage.AddAttachment(FileLocation1, 'PDF', InStr);
            end;
        end else begin
            //students with no photo
            EmailMessage.Create(StudentProcessingHeader.Email,
            'HRMPEB:EXAMINATION BOOKING',
            'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
            'Your booking request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
            'Find attached the receipt for payment.<br><br><b>Kindly note that your timetable be available once you update your picture on the student portal.</b>');

            FileName := StudentProcessingHeader."Booking Invoice No." + '.pdf';
            FileLocation := ExaminationSetup."Examination Path" + FileName;

            ReceiptHeader1.Reset;
            ReceiptHeader1.SetRange("No.", StudentProcessingHeader."No.");
            if ReceiptHeader1.FindSet then begin
                Report.SaveAsPdf(85047, FileLocation, ReceiptHeader1);
                SMTP.AddAttachment(FileLocation, 'PDF', InStr);
            end;


        end;
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        //SMTP.AddBCC(Email2);
        //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>EXAMINATION BOOKING<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();
        Message('notification sent successfuly');
        //send receipt

        //record sending details

        Counter := Counter + 1;
        DocLog.Init;
        DocLog."Entry No" := 0;
        DocLog."Customer No" := StudentProcessingHeader."Student Reg. No.";
        DocLog."E-mailed To" := StudentProcessingHeader.Email;
        DocLog.Date := Today;
        DocLog."Document Type" := DocLog."document type"::Booking;
        DocLog."File Extension" := FileLocation1;
        DocLog.Time := Time;
        DocLog."S/no" := Counter;

        DocLog."Sender ID" := UserId;
        if DocLog.Insert(true) then begin
            Header.Reset;
            Header.SetRange("No.", StudentProcessingHeader."No.");
            if Header.FindFirst then begin
                Header."Email Sent" := true;
                Header.Modify(true);
            end;

        end;
    end;


    procedure BookingCancel(ExamBookingEntries: Record "Exam Booking Entries")
    var
        ProcessingLines: Record "Student Processing Lines";
        Header: Record "Student Processing Header";
        ExaminationSetup: Record "Examination Setup";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        InvoiceHeader: Record "Sales Invoice Header";
        SalesLine: Record "Sales Invoice Line";
        Resource: Record Resource;
        PostingSetup: Record "General Posting Setup";
    begin
        if ExamBookingEntries."Fee Amount" <> 0 then begin
            //create a journal for each reversal
            Header.Reset;
            Header.SetRange("No.", ExamBookingEntries.Code);
            Header.SetRange(Posted, true);
            if Header.FindFirst then begin
                ExaminationSetup.Get;
                GenJnLine.Reset;
                GenJnLine.SetRange(GenJnLine."Journal Template Name", ExaminationSetup."Booking Reversal Template");
                GenJnLine.SetRange(GenJnLine."Journal Batch Name", ExaminationSetup."Booking Reversal Batch Name");
                GenJnLine.DeleteAll;
                LineNo := 10;
                //get the resource from the exemption
                InvoiceHeader.Reset;
                InvoiceHeader.SetRange("External Document No.", Header."No.");
                if InvoiceHeader.FindFirst then begin

                    SalesLine.SetRange("Document No.", InvoiceHeader."No.");
                    if SalesLine.FindFirst then begin

                        Resource.Reset;
                        Resource.SetRange("No.", SalesLine."No.");
                        if Resource.FindFirst then begin

                            PostingSetup.Reset;
                            PostingSetup.SetRange("Gen. Prod. Posting Group", Resource."Gen. Prod. Posting Group");
                            if PostingSetup.FindFirst then begin

                                GenJnLine.Init;
                                GenJnLine."Journal Template Name" := ExaminationSetup."Booking Reversal Template";
                                GenJnLine."Journal Batch Name" := ExaminationSetup."Booking Reversal Batch Name";
                                GenJnLine."Line No." := LineNo + 10;
                                GenJnLine."Account Type" := GenJnLine."account type"::Customer;
                                GenJnLine."Account No." := InvoiceHeader."Sell-to Customer No.";
                                GenJnLine.Validate(GenJnLine."Account No.");
                                GenJnLine."Posting Date" := Today;
                                GenJnLine."Document No." := ExamBookingEntries.Code;
                                GenJnLine."External Document No." := Format(ExamBookingEntries."Entry No.");
                                GenJnLine.Description := 'Reversal Booking-' + ' ' + ExamBookingEntries.Paper;
                                GenJnLine.Amount := -ExamBookingEntries."Fee Amount";
                                GenJnLine.Validate(GenJnLine.Amount);
                                GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
                                GenJnLine."Bal. Account No." := PostingSetup."Sales Account";
                                if GenJnLine.Amount <> 0 then
                                    GenJnLine.Insert;
                                LineNo += 1;

                            end;
                            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
                            ExamBookingEntries.Cancelled := true;
                            ExamBookingEntries.Blocked := true;
                            ExamBookingEntries."Cancelled By" := UserId;
                            ExamBookingEntries."Cancelled Date" := Today;
                            ExamBookingEntries.Modify(true);
                        end;
                    end
                end;


            end;
        end
        else begin
            ExamBookingEntries.Blocked := true;
            ExamBookingEntries.Cancelled := true;
            ExamBookingEntries."Cancelled By" := UserId;
            ExamBookingEntries."Cancelled Date" := Today;
            ExamBookingEntries.Modify(true);
        end
    end;


    procedure BookingUpdate(StudentProcessingHeader: Record "Student Processing Header"; CorrectSitting: Code[30])
    var
        ProcessingLines: Record "Student Processing Lines";
        Header: Record "Student Processing Header";
        ExaminationSetup: Record "Examination Setup";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        InvoiceHeader: Record "Sales Invoice Header";
        SalesLine: Record "Sales Invoice Line";
        Resource: Record Resource;
        PostingSetup: Record "General Posting Setup";
        UserSetup: Record "User Setup";
        TXT001: label 'You do not have sufficient rights to change the sitting.Consult the system administrator';
        BookingEntries: Record "Exam Booking Entries";
        TXT002: label 'There are no open entries for the student %1';
        ExamSittingCycle: Record "Exam Sitting Cycle";
        TXT003: label 'Booking updated succesfully';
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Exam Support Admin" = true then begin
                ExamSittingCycle.Reset;
                ExamSittingCycle.SetRange("Exam Sitting Cycle", CorrectSitting);
                if ExamSittingCycle.FindFirst then begin
                    BookingEntries.Reset;
                    BookingEntries.SetRange(Code, StudentProcessingHeader."No.");
                    BookingEntries.SetRange("Student Reg No.", StudentProcessingHeader."Student Reg. No.");
                    BookingEntries.SetRange("Exam Sitting", StudentProcessingHeader."Examination Sitting");
                    BookingEntries.SetRange(Status, BookingEntries.Status::Open);
                    if BookingEntries.FindSet then begin
                        repeat
                            BookingEntries."Project Code" := ExamSittingCycle."Examination Project ID";
                            BookingEntries."Exam Sitting" := ExamSittingCycle."Exam Sitting Cycle";
                            BookingEntries.Modify(true);
                        until BookingEntries.Next = 0;

                        StudentProcessingHeader."Examination Project Code" := ExamSittingCycle."Examination Project ID";
                        StudentProcessingHeader."Examination Sitting" := ExamSittingCycle."Exam Sitting Cycle";
                        ;
                        StudentProcessingHeader.Modify(true);
                        Message(TXT003);
                    end
                    else
                        Error(TXT002, StudentProcessingHeader."Student Reg. No.");
                end
            end
            else
                Error(TXT001);
        end
    end;


    procedure BookingEntryBlock(ExamBookingEntries: Record "Exam Booking Entries")
    var
        ProcessingLines: Record "Student Processing Lines";
        Header: Record "Student Processing Header";
        ExaminationSetup: Record "Examination Setup";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        InvoiceHeader: Record "Sales Invoice Header";
        SalesLine: Record "Sales Invoice Line";
        Resource: Record Resource;
        PostingSetup: Record "General Posting Setup";
    begin
        if ExamBookingEntries."Fee Amount" = 0 then begin
            ExamBookingEntries.Blocked := true;
            ExamBookingEntries."Cancelled By" := UserId;
            ExamBookingEntries."Cancelled Date" := Today;
            ExamBookingEntries.Modify(true);
        end;
    end;

    procedure CancelExemptionEntries(CenterBookingHeader: Record "Student Processing Header")
    var
        EntryNo: Integer;
        TXT001: label 'No exemption entries found for the document %1';
        ExemptionEntries1: Record "Exemption Entries";
        ExemptionEntries: Record "Exemption Entries";
        ExaminationSetup: Record "Examination Setup";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        InvoiceHeader: Record "Sales Invoice Header";
        SalesLine: Record "Sales Invoice Line";
        PostingSetup: Record "General Posting Setup";
        Resource: Record Resource;
        ReversalAmnt: Decimal;
        GenJnLine1: Record "Gen. Journal Line";
        TXT002: label 'The exemption %1 is  already cancelled';
    begin
        //check if center offers that exam
        //check if student has any entries
        if CenterBookingHeader.Cancelled = true then begin
            Error(TXT002, CenterBookingHeader."No.");
        end
        else begin
            ExemptionEntries1.Reset;
            ExemptionEntries1.SetRange("Stud. Cust No.", CenterBookingHeader."Student No.");
            ExemptionEntries1.SetRange("Stud. Reg. No", CenterBookingHeader."Student Reg. No.");
            ExemptionEntries1.SetRange("Exemption Voucher No.", CenterBookingHeader."No.");
            if ExemptionEntries1.FindSet then begin
                ReversalAmnt := 0;
                repeat
                    ExemptionEntries.Reset;
                    ExemptionEntries.SetRange("Entry No.", ExemptionEntries1."Entry No.");
                    if ExemptionEntries.FindFirst then begin
                        ReversalAmnt := ReversalAmnt + ExemptionEntries.Amount;
                        ExemptionEntries.Deleted := true;
                        ExemptionEntries."Deleted By" := UserId;
                        ExemptionEntries."Deleted On" := CurrentDatetime;
                        ExemptionEntries.Modify(true);
                    end
                until ExemptionEntries1.Next = 0;

                //create reversal journal and post
                ExaminationSetup.Get;
                InvoiceHeader.Reset;
                InvoiceHeader.SetRange("External Document No.", CenterBookingHeader."No.");
                if InvoiceHeader.FindFirst then begin
                    GenJnLine1.Reset;
                    GenJnLine1.SetRange("Journal Template Name", ExaminationSetup."Exemption Reversal Template");
                    GenJnLine1.SetRange("Journal Batch Name", ExaminationSetup."Exemption Reversal Batch Name");
                    GenJnLine1.DeleteAll;
                    SalesLine.Reset;
                    SalesLine.SetRange("Document No.", InvoiceHeader."No.");
                    if SalesLine.FindFirst then begin
                        Resource.Reset;
                        Resource.SetRange("No.", SalesLine."No.");
                        if Resource.FindFirst then begin
                            PostingSetup.Reset;
                            PostingSetup.SetRange("Gen. Prod. Posting Group", Resource."Gen. Prod. Posting Group");
                            if PostingSetup.FindFirst then begin

                                CenterBookingHeader.CalcFields("Exemption Amount");
                                GenJnLine.Init;
                                GenJnLine."Journal Template Name" := ExaminationSetup."Exemption Reversal Template";
                                GenJnLine."Journal Batch Name" := ExaminationSetup."Exemption Reversal Batch Name";
                                GenJnLine."Line No." := LineNo + 10;
                                GenJnLine."Account Type" := GenJnLine."account type"::Customer;
                                GenJnLine."Account No." := InvoiceHeader."Sell-to Customer No.";
                                GenJnLine.Validate(GenJnLine."Account No.");
                                GenJnLine."Posting Date" := Today;
                                GenJnLine."Document No." := CenterBookingHeader."No.";
                                GenJnLine."External Document No." := CenterBookingHeader."No.";
                                GenJnLine.Description := 'Reversal on invoice Exemption-' + ' ' + CenterBookingHeader."No.";
                                GenJnLine.Amount := -ReversalAmnt;
                                GenJnLine.Validate(GenJnLine.Amount);
                                GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
                                GenJnLine."Bal. Account No." := PostingSetup."Sales Account";
                                if GenJnLine.Amount <> 0 then
                                    GenJnLine.Insert;
                                LineNo += 1;
                                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
                            end;
                        end;
                    end;
                end;
                CenterBookingHeader.Cancelled := true;
                CenterBookingHeader."Cancelled By" := UserId;
                CenterBookingHeader."Cancelled On" := Today;
                CenterBookingHeader."Last Date Modified" := Today;
                CenterBookingHeader."Last Modified Date Time" := CurrentDatetime;
                CenterBookingHeader.Modify(true);
                Message('Exemption cancellation and payment reversal done succesfully');
            end else
                Error(TXT001);
        end
    end;


    procedure ExemptionDelete(ExemptionEntries: Record "Exemption Entries")
    var
        ProcessingLines: Record "Student Processing Lines";
        Header: Record "Student Processing Header";
        ExaminationSetup: Record "Examination Setup";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        InvoiceHeader: Record "Sales Invoice Header";
        SalesLine: Record "Sales Invoice Line";
        Resource: Record Resource;
        PostingSetup: Record "General Posting Setup";
    begin
        if ExemptionEntries.Amount <> 0 then begin
            //create a journal for each reversal
            Header.Reset;
            Header.SetRange("No.", ExemptionEntries."Exemption Voucher No.");
            Header.SetRange(Posted, true);
            if Header.FindFirst then begin
                ExaminationSetup.Get;
                GenJnLine.Reset;
                GenJnLine.SetRange(GenJnLine."Journal Template Name", ExaminationSetup."Exemption Reversal Template");
                GenJnLine.SetRange(GenJnLine."Journal Batch Name", ExaminationSetup."Exemption Reversal Batch Name");
                GenJnLine.DeleteAll;
                LineNo := 10;
                //get the resource from the exemption
                InvoiceHeader.Reset;
                InvoiceHeader.SetRange("External Document No.", Header."No.");
                if InvoiceHeader.FindFirst then begin
                    SalesLine.Reset;
                    SalesLine.SetRange("Document No.", InvoiceHeader."No.");
                    if SalesLine.FindFirst then begin
                        Resource.Reset;
                        Resource.SetRange("No.", SalesLine."No.");
                        if Resource.FindFirst then begin
                            PostingSetup.Reset;
                            PostingSetup.SetRange("Gen. Prod. Posting Group", Resource."Gen. Prod. Posting Group");
                            if PostingSetup.FindFirst then begin
                                GenJnLine.Init;
                                GenJnLine."Journal Template Name" := ExaminationSetup."Exemption Reversal Template";
                                GenJnLine."Journal Batch Name" := ExaminationSetup."Exemption Reversal Batch Name";
                                GenJnLine."Line No." := LineNo + 10;
                                GenJnLine."Account Type" := GenJnLine."account type"::Customer;
                                GenJnLine."Account No." := InvoiceHeader."Sell-to Customer No.";
                                GenJnLine.Validate(GenJnLine."Account No.");
                                GenJnLine."Posting Date" := Today;
                                GenJnLine."Document No." := ExemptionEntries."Exemption Voucher No.";
                                GenJnLine."External Document No." := Format(ExemptionEntries."Entry No.");
                                GenJnLine.Description := 'Reversal Exemption-' + ' ' + ExemptionEntries."No.";
                                GenJnLine.Amount := -ExemptionEntries.Amount;
                                GenJnLine.Validate(GenJnLine.Amount);
                                GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
                                GenJnLine."Bal. Account No." := PostingSetup."Sales Account";
                                if GenJnLine.Amount <> 0 then
                                    GenJnLine.Insert;
                                LineNo += 1;

                            end;
                            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
                            ExemptionEntries.Deleted := true;
                            ExemptionEntries."Deleted By" := UserId;
                            ExemptionEntries."Deleted On" := CurrentDatetime;
                            ExemptionEntries.Modify(true);
                        end;
                    end
                end;


            end;
        end
        else begin
            ExemptionEntries.Deleted := true;
            ExemptionEntries."Deleted By" := UserId;
            ExemptionEntries."Deleted On" := CurrentDatetime;
            ExemptionEntries.Modify(true);
        end
    end;

    procedure ExemptionSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Receipts Header1";
        FileName1: Text;
        FileLocation1: Text;
        Header: Record "Student Processing Header";
        ExemptionEntries: Record "Exemption Entries";
        DocLog: Record "Student Mgmt E-mail Log";
        Counter: Integer;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        Recipients: List of [Text];
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;
    begin
        if StudentProcessingHeader."Additional Exemption" = false then begin
            ExemptionEntries.Reset;
            ExemptionEntries.SetRange("Exemption Voucher No.", StudentProcessingHeader."No.");
            ExemptionEntries.SetRange("Stud. Reg. No", StudentProcessingHeader."Student Reg. No.");
            if not ExemptionEntries.FindSet then begin
                PostExemptionVoucher(StudentProcessingHeader);
            end;
        end;

        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";

        // EmailMessage.Create(StudentProcessingHeader.Email,
        // 'HRMPEB STUDENT EXEMPTION',
        // 'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        // 'Your exemption request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        // 'Find attached the receipt and exemption letter');

        // FileName := StudentProcessingHeader."Exemption Invoice No." + '.pdf';
        // FileLocation := ExaminationSetup."Examination Path" + FileName;
        // FileName1 := StudentProcessingHeader."No." + '.pdf';
        // FileLocation1 := ExaminationSetup."Examination Path" + FileName1;



        // Header.Reset;
        // Header.SetRange("No.", StudentProcessingHeader."No.");
        // if Header.FindSet then begin
        //     Report.SaveAsPdf(85048, FileLocation, Header);
        //     SMTP.AddAttachment(FileLocation, 'PDF', InStr);
        // end;

        // Header.Reset;
        // Header.SetRange("No.", StudentProcessingHeader."No.");
        // if Header.FindFirst then begin
        //     Report.SaveAsPdf(85022, FileLocation1, Header);
        //     SMTP.AddAttachment(FileLocation1, 'PDF', InStr);
        // end;
        Header.SetRange("No.", StudentProcessingHeader."No.");
        RecRef.GetTable(Header);
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr);
        InStr.ReadText(BodyTxt);

        EmailMessage.Create(StudentProcessingHeader.Email, 'HRMPEB STUDENT EXEMPTION',
        'Dear ' + StudentProcessingHeader."Student Name" + ',<br/><br/>' +
        'Your exemption request done on <strong>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</strong> has been processed.<BR>' +
        'Find attached the exemption letter', true);

        // add attachment for with pdf
        TempBlob.CreateOutStream(OutStr2);
        Report.SaveAs(Report::"Exemption Letter", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr2);
        // EmailMessage.AddAttachmentStream(InStr2, 'attachment.pdf');
        // EmailMessage.add
        EmailMessage.AddAttachment('attachment.pdf', 'PDF', InStr2);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);




        // Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>HRMPEB STUDENT EXEMPTION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");

        //SMTP.Send();

        //record sending details

        Counter := Counter + 1;

        DocLog.Init;
        DocLog."Entry No" := 0;
        DocLog."Customer No" := StudentProcessingHeader."Student Reg. No.";
        DocLog."E-mailed To" := StudentProcessingHeader.Email;
        DocLog.Date := Today;
        DocLog."Document Type" := DocLog."document type"::Exemption;
        DocLog."File Extension" := FileLocation1 + FileName1;
        DocLog.Time := Time;
        DocLog."S/no" := Counter;

        DocLog."Sender ID" := UserId;
        if DocLog.Insert(true) then begin
            /* Header.RESET;
           Header.SETRANGE("No.",StudentProcessingHeader."No.");
           IF Header.FINDFIRST THEN BEGIN
             Header."Exemption Letter Sent":=TRUE;
             Header.MODIFY;
             END;*/

        end;




        //send receipt

    end;

    procedure CheckSlotAvailability(StudentProcessingHeader: Record "Student Processing Header") Available: Boolean
    var
        CenterBookingEntries: Record "Exam Booking Entries";
        TimetablePlannerLines: Record "Timetable Planner Lines";
        "TotalNo.": Integer;
        "PlannedNo.": Integer;
        BookingLines: Record "Student Processing Lines";
        TimetableHeader: Record "Timetable Planner Header";
        SlotFree: Boolean;
        ExamCenter: Record "Examination Centres";
        TXT001: label 'Select the papers the student is supposed to sit for in the booking %1';
        PlannerLines: Record "Timetable Planner Lines";
        ExamEntries: Record "Exam Booking Entries";
        Window: Dialog;
        ExamCenter1: Record "Examination Centres";
        TXT002: label 'The center %1,is currently blocked,kindly select another Center';
    begin
        //check if slots are available
        //loop through all planned timetable per center if more than planned
        Window.Open('#Checking Center availability...');
        //check if center is blocked
        ExamCenter1.Reset;
        ExamCenter1.SetRange(Code, StudentProcessingHeader."Examination Center Code");
        ExamCenter1.SetRange(Blocked, true);
        if ExamCenter1.FindFirst then begin
            Error(TXT002, ExamCenter1.Name);
        end;
        SlotFree := false;
        BookingLines.Reset;
        BookingLines.SetRange("Booking Header No.", StudentProcessingHeader."No.");
        BookingLines.SetRange("Booking Type", BookingLines."booking type"::Paper);
        if BookingLines.FindSet then begin
            SlotFree := true;
            repeat
                if SlotFree = true then begin
                    "TotalNo." := 0;
                    /*commented on 29/11/2021 by Machira
                    //  CenterBookingEntries.RESET;
                    //  CenterBookingEntries.SETRANGE("Exam Center",StudentProcessingHeader."Examination Center Code");
                    //  CenterBookingEntries.SETRANGE(Status,CenterBookingEntries.Status::Open);
                    //  CenterBookingEntries.SETRANGE(Paper,BookingLines.Paper);
                    //  IF CenterBookingEntries.FINDSET THEN
                    //    BEGIN
                    //     "TotalNo.":=CenterBookingEntries.COUNT;
                    //    END;

                    */
                    //check planner for a center session size
                    ExamCenter.Reset;
                    ExamCenter.SetRange(Code, StudentProcessingHeader."Examination Center Code");
                    if ExamCenter.FindFirst then begin
                        "PlannedNo." := ExamCenter."Maximum Capacity Per Session";
                    end;

                    //    //check planner activity

                    TimetableHeader.Reset;
                    TimetableHeader.SetRange("Examination  Project Code", StudentProcessingHeader."Examination Project Code");
                    if TimetableHeader.FindFirst then begin
                        PlannerLines.Reset;
                        PlannerLines.SetRange(Code, TimetableHeader.Code);
                        PlannerLines.SetRange(Paper, BookingLines.Paper);
                        if PlannerLines.FindFirst then begin
                            //get all papers planned for that day that session
                            TimetablePlannerLines.Reset;
                            TimetablePlannerLines.SetRange(Code, TimetableHeader.Code);
                            TimetablePlannerLines.SetRange(Date, PlannerLines.Date);
                            TimetablePlannerLines.SetRange("Session Code", PlannerLines."Session Code");
                            TimetablePlannerLines.SetRange(TimetablePlannerLines."Exam Center Filter", Format(StudentProcessingHeader."Examination Center Code"));
                            if TimetablePlannerLines.FindSet then begin
                                repeat
                                    TimetablePlannerLines.CalcFields("Total No");
                                    if TimetablePlannerLines."Total No" > 0 then
                                        "TotalNo." := "TotalNo." + TimetablePlannerLines."Total No";

                                until TimetablePlannerLines.Next = 0;
                            end;
                        end;
                    end;


                    if "TotalNo." < "PlannedNo." then
                        SlotFree := true
                    else
                        SlotFree := false;
                end;

            until BookingLines.Next = 0;
            Available := SlotFree;

            Sleep(1);
            Window.Close;
        end else
            Error(TXT001, StudentProcessingHeader."No.");

    end;

    procedure CheckSlotAvailabilityV1(StudentProcessingHeader: Record "Student Processing Header") Available: Boolean
    var
        CenterBookingEntries: Record "Exam Booking Entries";
        TimetablePlannerLines: Record "Timetable Planner Lines";
        "TotalNo.": Integer;
        "PlannedNo.": Integer;
        BookingLines: Record "Student Processing Lines";
        TimetableHeader: Record "Timetable Planner Header";
        SlotFree: Boolean;
        ExamCenter: Record "Examination Centres";
        TXT001: label 'Select the papers the student is supposed to sit for';
        PlannerLines: Record "Timetable Planner Lines";
        ExamEntries: Record "Exam Booking Entries";
        Window: Dialog;
        ExamCenter1: Record "Examination Centres";
        TXT002: label 'The center %1,is currently blocked,kindly select another Center';
    begin
        //check if slots are available
        //loop through all planned timetable per center if more than planned
        //Window.OPEN('#Checking Center availability...');
        //check if center is blocked

        ExamCenter1.Get(StudentProcessingHeader."Examination Center Code");
        if ExamCenter1.Blocked = true then begin
            Error(TXT002, ExamCenter1.Name);
        end;

        SlotFree := false;
        BookingLines.Reset;
        BookingLines.SetRange("Booking Header No.", StudentProcessingHeader."No.");
        BookingLines.SetRange("Booking Type", BookingLines."booking type"::Paper);
        if BookingLines.FindSet then begin
            SlotFree := true;
            repeat
                if SlotFree = true then begin
                    "TotalNo." := 0;
                    /*commented on 29/11/2021 by Machira
                    //  CenterBookingEntries.RESET;
                    //  CenterBookingEntries.SETRANGE("Exam Center",StudentProcessingHeader."Examination Center Code");
                    //  CenterBookingEntries.SETRANGE(Status,CenterBookingEntries.Status::Open);
                    //  CenterBookingEntries.SETRANGE(Paper,BookingLines.Paper);
                    //  IF CenterBookingEntries.FINDSET THEN
                    //    BEGIN
                    //     "TotalNo.":=CenterBookingEntries.COUNT;
                    //    END;

                    */
                    //check planner for a center session size

                    if ExamCenter.Get(StudentProcessingHeader."Examination Center Code") then begin
                        "PlannedNo." := ExamCenter."Maximum Capacity Per Session";
                    end;

                    //    //check planner activity

                    //    TimetableHeader.RESET;
                    //    TimetableHeader.SETRANGE("Examination  Project Code",StudentProcessingHeader."Examination Project Code");
                    //    IF TimetableHeader.FINDFIRST THEN BEGIN
                    PlannerLines.Reset;
                    PlannerLines.SetRange("Exam Sitting ID", StudentProcessingHeader."Examination Sitting");
                    PlannerLines.SetRange(Paper, BookingLines.Paper);
                    if PlannerLines.FindFirst then begin
                        //get all papers planned for that day that session
                        TimetablePlannerLines.Reset;
                        TimetablePlannerLines.SetRange("Exam Sitting ID", StudentProcessingHeader."Examination Sitting");
                        TimetablePlannerLines.SetRange(Date, PlannerLines.Date);
                        TimetablePlannerLines.SetRange("Session Code", PlannerLines."Session Code");
                        if TimetablePlannerLines.FindSet then begin
                            // TimetablePlannerLines.SETAUTOCALCFIELDS("Total Capacity");
                            repeat

                                //get total students for individual papers
                                ExamEntries.Reset;
                                ExamEntries.SetRange("Exam Center", StudentProcessingHeader."Examination Center Code");
                                ExamEntries.SetRange(Status, ExamEntries.Status::Open);
                                ExamEntries.SetRange("Exam Sitting", PlannerLines."Exam Sitting ID");
                                ExamEntries.SetRange(Paper, TimetablePlannerLines.Paper);
                                if ExamEntries.FindSet then begin
                                    "TotalNo." := "TotalNo." + ExamEntries.Count;
                                end;

                            until TimetablePlannerLines.Next = 0;
                        end;
                    end;
                    // END;


                    if "TotalNo." < "PlannedNo." then
                        SlotFree := true
                    else
                        SlotFree := false;
                end;

            until BookingLines.Next = 0;
            Commit;
            Available := SlotFree;
            //SLEEP(1);
            //Window.CLOSE;
        end else
            Error(TXT001);

    end;

    procedure CheckCenterAvailability(StudentProcessingHeader: Record "Student Processing Header"; ExamCenterCode: Code[30]; TotalSlots: Integer) Available: Boolean
    var
        CenterBookingEntries: Record "Center Booking Entries";
        TimetablePlannerLines: Record "Timetable Planner Lines";
        "TotalNo.": Integer;
        "PlannedNo.": Integer;
        TimetableHeader: Record "Timetable Planner Header";
        SlotFree: Boolean;
        ExamCenter: Record "Examination Centres";
        BookingLines: Record "Exam Booking Entries";
        PlannerLines: Record "Timetable Planner Lines";
        ExamEntries: Record "Exam Booking Entries";
        Window: Dialog;
    begin
        //check if slots are available
        //Window.OPEN('# Checking Center availability for #1',StudentProcessingHeader."Student Reg. No.");
        SlotFree := false;
        "TotalNo." := 0;
        BookingLines.Reset;
        BookingLines.SetRange("Student Reg No.", StudentProcessingHeader."Student Reg. No.");
        BookingLines.SetRange("Exam Sitting", StudentProcessingHeader."Examination Sitting");
        BookingLines.SetRange(Status, BookingLines.Status::Open);
        BookingLines.SetRange(Blocked, false);
        BookingLines.SetRange(Cancelled, false);
        if BookingLines.FindSet then begin
            SlotFree := true;

            repeat
                if SlotFree = true then begin
                    "TotalNo." := 0;
                    //check planner for a center session size
                    ExamCenter.Reset;
                    ExamCenter.SetRange(Code, ExamCenterCode);
                    if ExamCenter.FindFirst then begin
                        "PlannedNo." := ExamCenter."Maximum Capacity Per Session";
                    end;

                    //    //check planner activity

                    TimetableHeader.Reset;
                    TimetableHeader.SetRange("Examination  Project Code", StudentProcessingHeader."Examination Project Code");
                    if TimetableHeader.FindFirst then begin
                        PlannerLines.Reset;
                        PlannerLines.SetRange(Code, TimetableHeader.Code);
                        PlannerLines.SetRange(Paper, BookingLines.Paper);
                        if PlannerLines.FindFirst then begin
                            //get all papers planned for that day that session
                            TimetablePlannerLines.Reset;
                            TimetablePlannerLines.SetRange(Code, TimetableHeader.Code);
                            TimetablePlannerLines.SetRange(Date, PlannerLines.Date);
                            TimetablePlannerLines.SetRange("Session Code", PlannerLines."Session Code");
                            if TimetablePlannerLines.FindSet then begin
                                //REPEAT
                                //get total students for individual papers
                                ExamEntries.Reset;
                                ExamEntries.SetRange("Exam Center", ExamCenterCode);
                                ExamEntries.SetRange(Status, ExamEntries.Status::Open);
                                ExamEntries.SetRange(Blocked, false);
                                ExamEntries.SetRange(Cancelled, false);
                                ExamEntries.SetRange("Exam Sitting", TimetableHeader."Exam Sitting ID");
                                ExamEntries.SetRange(Paper, TimetablePlannerLines.Paper);
                                if ExamEntries.FindSet then begin
                                    "TotalNo." := "TotalNo." + ExamEntries.Count;
                                end;
                                "TotalNo." := "TotalNo.";
                                //UNTIL TimetablePlannerLines.NEXT=0;
                            end;
                        end;
                    end;


                    if "TotalNo." < "PlannedNo." then
                        SlotFree := true
                    else
                        SlotFree := false;
                end;
            //  MESSAGE('Available %1--%2 Allocated',"PlannedNo.","TotalNo.");

            until BookingLines.Next = 0;
            Available := SlotFree;
            //SLEEP(1);
            //Window.CLOSE;
        end
    end;

    procedure CancelBookingEntries(CenterBookingHeader: Record "Student Processing Header")
    var
        CenterBookingLines: Record "Student Processing Lines";
        BookingEntries: Record "Center Booking Entries";
        EntryNo: Integer;
        CenterCourse: Record "Center Course Capacity";
        TXT001: label 'The examination sitting has to be selected';
        BookingEntries1: Record "Center Booking Entries";
        ExamBookingEntries: Record "Exam Booking Entries";
        ExamBookingEntries1: Record "Exam Booking Entries";
        ExaminationSetup: Record "Examination Setup";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        InvoiceHeader: Record "Sales Invoice Header";
        SalesLine: Record "Sales Invoice Line";
        PostingSetup: Record "General Posting Setup";
        Resource: Record Resource;
        ReversalAmnt: Decimal;
        GenJnLine1: Record "Gen. Journal Line";
        ExamBookingEntries2: Record "Exam Booking Entries";
        TXT002: label 'You are not allowed to cancel a booking twice,Consult the system administrator';
    begin
        //check if center offers that exam
        //check if student has any entries
        //check if booking is already cancelled
        ExamBookingEntries2.Reset;
        ExamBookingEntries2.SetRange("Stud. Cust No.", CenterBookingHeader."Student No.");
        ExamBookingEntries2.SetRange(Code, CenterBookingHeader."No.");
        ExamBookingEntries2.SetRange("Student Reg No.", CenterBookingHeader."Student Reg. No.");
        ExamBookingEntries2.SetRange("Exam Sitting", CenterBookingHeader."Examination Sitting");
        ExamBookingEntries2.SetRange(Status, ExamBookingEntries2.Status::Cancelled);
        if ExamBookingEntries2.FindSet then begin
            Error(TXT002);
            exit;
        end;


        if CenterBookingHeader."Examination Sitting" <> '' then begin
            ExamBookingEntries1.Reset;
            ExamBookingEntries1.SetRange("Stud. Cust No.", CenterBookingHeader."Student No.");
            ExamBookingEntries1.SetRange("Student Reg No.", CenterBookingHeader."Student Reg. No.");
            ExamBookingEntries1.SetRange("Exam Sitting", CenterBookingHeader."Examination Sitting");
            ExamBookingEntries1.SetRange(Status, ExamBookingEntries1.Status::Open);
            ExamBookingEntries1.SetRange(Code, CenterBookingHeader."No.");
            if ExamBookingEntries1.FindSet then begin
                ReversalAmnt := 0;
                repeat
                    ExamBookingEntries.Reset;
                    ExamBookingEntries.SetRange("Entry No.", ExamBookingEntries1."Entry No.");
                    if ExamBookingEntries.FindFirst then begin
                        ReversalAmnt := ReversalAmnt + ExamBookingEntries."Fee Amount";
                        ExamBookingEntries.Status := ExamBookingEntries.Status::Cancelled;
                        ExamBookingEntries.Modify(true);
                    end
                until ExamBookingEntries1.Next = 0;

                BookingEntries1.Reset;
                BookingEntries1.SetRange("Student Reg No.", CenterBookingHeader."Student Reg. No.");
                BookingEntries1.SetRange("Examination Sitting", CenterBookingHeader."Examination Sitting");
                if BookingEntries1.FindSet then begin

                    repeat
                        BookingEntries.Reset;
                        BookingEntries.SetRange("Line No.", BookingEntries1."Line No.");
                        if BookingEntries.FindFirst then begin
                            BookingEntries.Blocked := true;
                            BookingEntries.Status := BookingEntries.Status::Cancelled;
                            BookingEntries.Modify(true);
                        end

                    until BookingEntries1.Next = 0
                end;
                //create reversal journal and post
                ExaminationSetup.Get;
                InvoiceHeader.Reset;
                InvoiceHeader.SetRange("External Document No.", CenterBookingHeader."No.");
                if InvoiceHeader.FindFirst then begin
                    //clear the journal lines
                    GenJnLine1.Reset;
                    GenJnLine1.SetRange("Journal Template Name", ExaminationSetup."Booking Reversal Template");
                    GenJnLine1.SetRange("Journal Batch Name", ExaminationSetup."Booking Reversal Batch Name");
                    GenJnLine1.DeleteAll;

                    SalesLine.Reset;
                    SalesLine.SetRange("Document No.", InvoiceHeader."No.");
                    if SalesLine.FindFirst then begin
                        Resource.Reset;
                        Resource.SetRange("No.", SalesLine."No.");
                        if Resource.FindFirst then begin
                            PostingSetup.Reset;
                            PostingSetup.SetRange("Gen. Prod. Posting Group", Resource."Gen. Prod. Posting Group");
                            if PostingSetup.FindFirst then begin

                                CenterBookingHeader.CalcFields("Booking Amount");
                                GenJnLine.Init;
                                GenJnLine."Journal Template Name" := ExaminationSetup."Booking Reversal Template";
                                GenJnLine."Journal Batch Name" := ExaminationSetup."Booking Reversal Batch Name";
                                GenJnLine."Line No." := LineNo + 10;
                                GenJnLine."Account Type" := GenJnLine."account type"::Customer;
                                GenJnLine."Account No." := InvoiceHeader."Sell-to Customer No.";
                                GenJnLine.Validate(GenJnLine."Account No.");
                                GenJnLine."Posting Date" := Today;
                                GenJnLine."Document No." := CenterBookingHeader."No.";
                                GenJnLine."External Document No." := CenterBookingHeader."No.";
                                GenJnLine.Description := 'Reversal on invoice Booking-' + ' ' + CenterBookingHeader."Examination Sitting";
                                GenJnLine.Amount := -ReversalAmnt;
                                GenJnLine.Validate(GenJnLine.Amount);
                                GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
                                GenJnLine."Bal. Account No." := PostingSetup."Sales Account";
                                if GenJnLine.Amount <> 0 then
                                    GenJnLine.Insert;
                                LineNo += 1;
                                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

                            end;
                        end;
                    end;
                end;
                CenterBookingHeader.Cancelled := true;
                CenterBookingHeader.Modify(true);
                Message('Booking cancellation and payment reversal done succesfully');
            end;

        end else
            Error(TXT001);
    end;

    procedure PostCenterBookingAllocation(CenterBookingHeader: Record "Student Processing Header")
    var
        CenterBookingLines: Record "Student Processing Lines";
        BookingEntries: Record "Center Booking Entries";
        EntryNo: Integer;
        CenterCourse: Record "Center Course Capacity";
        TXT001: label 'The center %1,does not offer the examination %2';
        BookingEntries1: Record "Center Booking Entries";
    begin
        //check if center offers that exam
        //check if student has any entries
        if not CenterBookingHeader."Additional Exemption" = true then begin
            BookingEntries1.Reset;
            BookingEntries1.SetRange("Student Reg No.", CenterBookingHeader."Student Reg. No.");
            BookingEntries1.SetRange("Examination Sitting", CenterBookingHeader."Examination Sitting");
            if BookingEntries1.FindSet then begin
                CenterBookingHeader.Posted := true;
                CenterBookingHeader."Posted By" := UserId;
                CenterBookingHeader."Posted Date" := Today;
                CenterBookingHeader."Posted On" := CurrentDatetime;
                CenterBookingHeader.Modify(true);
                exit;
            end
        end
        else begin
            CenterCourse.Reset;
            CenterCourse.SetRange("Centre Code", CenterBookingHeader."Examination Center Code");
            CenterCourse.SetRange("Course Id", CenterBookingHeader."Examination ID");
            if CenterCourse.FindFirst then begin
                BookingEntries.Reset;
                if BookingEntries.FindLast then begin
                    EntryNo := BookingEntries."Line No.";
                end;
                CenterBookingLines.Reset;
                CenterBookingLines.SetRange("Booking Header No.", CenterBookingHeader."No.");
                CenterBookingLines.SetRange("Transaction Type", CenterBookingLines."transaction type"::Booking);
                if CenterBookingLines.FindSet then begin
                    repeat
                        BookingEntries.Init;
                        BookingEntries."Line No." := EntryNo + 1;
                        BookingEntries.Status := BookingEntries.Status::Allocated;
                        BookingEntries."Header No." := CenterBookingHeader."No.";
                        BookingEntries."Exam Center Code" := CenterBookingHeader."Examination Center Code";
                        BookingEntries."Center Name" := CenterBookingHeader."Examination Center";
                        BookingEntries."Student Reg No." := CenterBookingHeader."Student Reg. No.";
                        BookingEntries."Student Name" := CenterBookingHeader."Student Name";
                        BookingEntries."Examination Id" := CenterBookingHeader."Examination ID";
                        BookingEntries."Subject Code" := CenterBookingLines.Paper;
                        BookingEntries.Validate("Subject Code");
                        BookingEntries.Year := CenterBookingLines.Year;
                        BookingEntries."Examination Description" := CenterBookingHeader."Examination Description";
                        BookingEntries."Examination Sitting" := CenterBookingHeader."Examination Sitting";
                        BookingEntries.Insert;
                        EntryNo += 1;
                    until CenterBookingLines.Next = 0;
                end;
            end else
                Error(TXT001, CenterBookingHeader."Examination Center", CenterBookingHeader."Examination ID");
        end
    end;

    procedure ExaminationSendResults(MarksheetHeader: Record "Marksheet Header")
    var
        ContactUsers: Record Contact;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        ExaminationAccount: Record "Examination Account";
        MarksheetLines: Record "Exam Marksheet Lines";
        FileName: Text;
        FileLocation: Text;
        MarksheetLines1: Record "Exam Marksheet Lines";
        ExaminationResults: Record "Examination Results";
        TXT001: label 'The header %1,has no students to send results to';
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        MarksheetLines.Reset;
        MarksheetLines.SetRange("Document No.", MarksheetHeader."Document No.");
        if MarksheetLines.FindSet then begin
            repeat
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.", MarksheetLines."Student Reg No.");
                if ExaminationAccount.FindFirst then begin
                    if ExaminationAccount.Email <> '' then begin
                        ExaminationSetup.Get;
                        Email2 := ExaminationSetup."Registration Sender Email";
                        EmailMessage.Create(ExaminationAccount.Email,
                        'HRMPEB EXAMINATION RESULTS',
                        'Dear ' + ' ' + ExaminationAccount."First Name" + '-' + ExaminationAccount."Registration No." + ',<BR><BR>' +
                        'Your results for the examination conducted from <b>' + ' ' + Format(MarksheetHeader."Examination Start Date") + ' ' + 'to' + '</b> <b>' + ' ' + Format(MarksheetHeader."Examination End Date") +
                        '' + 'have been processed.<BR>' + 'Find attached the result slip');
                        //   SMTP.AddBCC(Email2);
                        //insert code to send results
                        FileName := ExaminationAccount."Student Cust No." + '.pdf';
                        FileLocation := ExaminationSetup."Examination Path" + FileName;

                        ExaminationResults.Reset;
                        ExaminationResults.SetRange("Student Reg No.", MarksheetLines."Student Reg No.");
                        if ExaminationResults.FindSet then begin
                            Report.SaveAsPdf(85016, FileLocation, ExaminationResults);
                            SMTP.AddAttachment(FileLocation, 'PDF', InStr);
                        end;
                        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
                        //SMTP.AppendToBody('<BR><BR>HRMPEB EXAMINATION Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                        //SMTP.Send();
                        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                    end
                end;


            until MarksheetLines.Next = 0;
            MarksheetHeader.Posted := true;
            MarksheetHeader."Posted By" := UserId;
            MarksheetHeader."Posted On" := CurrentDatetime;
            MarksheetHeader.Modify(true);
        end else
            Error(TXT001, MarksheetHeader."Document No.");


    end;

    procedure SuggestMarkingPapers(TimetablePlanner: Record "Center  Header")
    var
        Job: Record Job;
        PlannerLines: Record "Marking Lines";
        LineNo: Integer;
        Papers: Record Papers;
        JobTask: Record "Job Task";
        PlannerLines1: Record "Marking Lines";
        TXT001: label 'Papers for the Exams to be offered on %1,have been added';
    begin
        PlannerLines1.Reset;
        PlannerLines1.SetRange("Document No.", TimetablePlanner."Document No.");
        if PlannerLines1.FindSet then begin
            PlannerLines1.DeleteAll;
        end;
        //get job first
        PlannerLines1.Reset;
        if PlannerLines1.FindLast then begin
            LineNo := PlannerLines1."Line No.";
        end;
        Job.Reset;
        Job.SetRange("No.", TimetablePlanner."Project No.");
        if Job.FindFirst then begin
            JobTask.Reset;
            JobTask.SetRange("Job No.", Job."No.");
            if JobTask.FindSet then begin
                repeat
                    Papers.Reset;
                    Papers.SetRange(Course, JobTask."Job Task No.");
                    if Papers.FindSet then begin
                        repeat
                            //get papers

                            PlannerLines."Line No." := LineNo + 1;
                            PlannerLines."Document No." := TimetablePlanner."Document No.";
                            PlannerLines.Examination := Papers.Course;
                            PlannerLines.Part := Papers.Level;
                            PlannerLines.Section := Papers.Section;
                            PlannerLines.Paper := Papers.Code;
                            PlannerLines.Validate(Paper);
                            PlannerLines.Insert;
                            LineNo += 1;
                        until Papers.Next = 0;

                    end;
                until JobTask.Next = 0;
                Message(TXT001, TimetablePlanner."Center Name");
            end;
        end
    end;

    procedure BulkAssignRegistrationNo(BulkProcessingHeader: Record "Bulk Processing Lines") RegNo: Code[30]
    var
        ExaminationAccount: Record "Examination Account";
        Courses: Record Courses;
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        ExamAccountNo: Code[30];
        NoSeries: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TXT001: label 'The student account %1, has been created successfully';
    begin
        ExamAccountNo := '';
        Courses.Reset;
        Courses.SetRange(Code, BulkProcessingHeader."Course ID");
        if Courses.FindFirst then begin
            NoSeriesMgt.InitSeries(Courses."No. Series", Courses."No. Series", 0D, ExamAccountNo, Courses."No. Series");
            ExaminationAccount.Init;
            ExaminationAccount."Registration No." := ExamAccountNo;
            ExaminationAccount."Student Cust No." := BulkProcessingHeader."Student No.";
            ExaminationAccount.Validate("Student Cust No.");
            ExaminationAccount."Course ID" := BulkProcessingHeader."Course ID";
            ExaminationAccount."Course Description" := Courses.Description;
            ExaminationAccount.Email := BulkProcessingHeader.Email;
            ExaminationAccount."Current Examination Sitting" := BulkProcessingHeader."Examination Cyce";
            ExaminationAccount.Insert;
            RegNo := ExamAccountNo;
        end;

    end;


    procedure EffectCaseVerdict(StudentProcessingHeader: Record "Student Processing Header")
    var
        CaseCategories: Record "Case Categories";
        Customer: Record Customer;
        ExaminationAccount: Record "Examination Account";
    begin
        CaseCategories.Reset;
        CaseCategories.SetRange(Code, StudentProcessingHeader."Case Code");
        if CaseCategories.FindFirst then begin
            //effect verdict
            if Format(CaseCategories."Block Period") <> '' then begin
                Customer.Reset;
                Customer.SetRange("No.", StudentProcessingHeader."Student No.");
                if Customer.FindFirst then begin
                    Customer.Blocked := Customer.Blocked::All;
                    Customer."Blocked Start Date" := Today;
                    Customer."Blocked End Date" := CalcDate(CaseCategories."Block Period", Today);
                    Customer.Modify(true);

                end;
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Student Cust No.", StudentProcessingHeader."Student No.");
                if ExaminationAccount.FindFirst then begin
                    ExaminationAccount."Blocked Start Date" := Today;
                    ExaminationAccount."Blocked End Date" := CalcDate(CaseCategories."Block Period", Today);
                    ExaminationAccount.Blocked := true;
                    ExaminationAccount.Modify(true);
                end;
            end;
        end;
        StudentProcessingHeader.Posted := true;
        StudentProcessingHeader."Posted Date" := Today;
        StudentProcessingHeader."Posted By" := UserId;
        StudentProcessingHeader."Posted On" := CurrentDatetime;
        StudentProcessingHeader.Modify(true);
    end;

    procedure CaseSendVerdictEmail(StudentUser: Record "Student Processing Header")
    var
        ContactUsers: Record Contact;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        EmailMessage.Create(StudentUser.Email,
        'HRMPEB STUDENT DISCIPLINARY',
        'Dear ' + StudentUser."Student Name" + ',<BR><BR>' +
        'The case referring to <b>' + ' ' + StudentUser."Case Description" + ' ' + 'created on' + ' ' + Format(StudentUser."Created On") + ' ' + '</b> has been decided on.<BR>' +
        'The verdict is:' + StudentUser."Verdict Description" + '');
        // SMTP.AddBCC(Email2);
        // SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        // SMTP.AppendToBody('<BR><BR>HRMPEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        // SMTP.Send();
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

    end;


    procedure EffectReinsVerdict(StudentProcessingHeader: Record "Student Processing Header")
    var
        CaseCategories: Record "Case Categories";
        Customer: Record Customer;
        ExaminationAccount: Record "Examination Account";
    begin
        CaseCategories.Reset;
        CaseCategories.SetRange(Code, StudentProcessingHeader."Case Code");
        if CaseCategories.FindFirst then begin
            //effect verdict
            if Format(CaseCategories."Block Period") <> '' then begin
                Customer.Reset;
                Customer.SetRange("No.", StudentProcessingHeader."Student No.");
                if Customer.FindFirst then begin
                    Customer.Blocked := Customer.Blocked::" ";
                    Customer.Modify(true);

                end;
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Student Cust No.", StudentProcessingHeader."Student No.");
                if ExaminationAccount.FindFirst then begin
                    ExaminationAccount.Blocked := false;
                    ExaminationAccount.Modify(true);
                end;
            end;
        end;
        StudentProcessingHeader."Case Status" := StudentProcessingHeader."case status"::Closed;
        StudentProcessingHeader.Posted := true;
        StudentProcessingHeader."Posted Date" := Today;
        StudentProcessingHeader."Posted By" := UserId;
        StudentProcessingHeader."Posted On" := CurrentDatetime;
        StudentProcessingHeader.Modify(true);
    end;

    procedure SuggestHighestScorers(TimetablePlanner: Record "Marksheet Header")
    var
        Job: Record Job;
        PlannerLines: Record "Marksheet Detailed Lines";
        LineNo: Integer;
        Papers: Record Papers;
        JobTask: Record "Job Task";
        PlannerLines1: Record "Marksheet Detailed Lines";
        TXT001: label 'Top Scorers fro the cycle  %1,have been added';
        ExaminationResults: Record "Examination Results";
        Results: Record "Examination Results";
    begin
        PlannerLines1.Reset;
        PlannerLines1.SetRange("Document No.", TimetablePlanner."Document No.");
        if PlannerLines1.FindSet then begin
            PlannerLines1.DeleteAll;
        end;
        //get job first
        PlannerLines1.Reset;
        if PlannerLines1.FindLast then begin
            LineNo := PlannerLines1."Line No.";
        end;
        Job.Reset;
        Job.SetRange("No.", TimetablePlanner."Examination Project ID");
        if Job.FindFirst then begin
            JobTask.Reset;
            JobTask.SetRange("Job No.", Job."No.");
            if JobTask.FindSet then begin
                repeat
                    Papers.Reset;
                    Papers.SetRange(Course, JobTask."Job Task No.");
                    if Papers.FindSet then begin
                        repeat
                            //get paper highest scorer

                            PlannerLines."Line No." := LineNo + 1;
                            PlannerLines."Student Reg No." := CalculateHighestScore(Papers.Code);
                            //get the results
                            Results.Reset;
                            Results.SetRange("Student Reg No.", PlannerLines."Student Reg No.");
                            Results.SetRange(Paper, Papers.Code);
                            if Results.FindFirst then begin
                                PlannerLines.Validate("Student Reg No.");
                                PlannerLines."Document No." := TimetablePlanner."Document No.";
                                PlannerLines.Examination := Papers.Course;
                                PlannerLines.Part := Papers.Level;
                                PlannerLines."Examination Sitting ID" := TimetablePlanner."Examination Sitting ID";
                                PlannerLines.Section := Papers.Section;
                                PlannerLines.Mark := Results.Mark;
                                PlannerLines.Validate(Mark);
                                PlannerLines.Paper := Papers.Code;
                                PlannerLines.Validate(Paper);
                                PlannerLines.Insert;
                                LineNo += 1;
                            end;



                        until Papers.Next = 0;

                    end;
                until JobTask.Next = 0;
                Message(TXT001, TimetablePlanner."Examination Sitting ID");
            end;
        end
    end;

    local procedure CalculateHighestScore(PaperCode: Code[30]) StudentNo: Code[30]
    var
        PaperResults: Record "Examination Results";
        ExaminationResults: Record "Examination Results";
    begin
        ExaminationResults.Reset;
        ExaminationResults.SetCurrentkey(Mark);
        ExaminationResults.SetAscending(Mark, false);
        ExaminationResults.SetRange(Paper, PaperCode);
        if ExaminationResults.FindFirst then begin
            PaperResults.Reset;
            PaperResults.SetRange(Paper, ExaminationResults.Paper);
            if PaperResults.FindSet then begin
                repeat
                    if PaperResults.Mark > ExaminationResults.Mark then
                        StudentNo := PaperResults."Student Reg No."
                    else
                        StudentNo := ExaminationResults."Student Reg No.";

                until PaperResults.Next = 0;

            end;
        end
    end;

    procedure CertificateSendEmail(StudentUser: Record "Student Processing Header")
    var
        ContactUsers: Record Contact;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        EmailMessage.Create(StudentUser.Email,
        'HRMPEB-CERTIFICATE',
        'Dear ' + StudentUser."Student Name" + ',<BR><BR>' +
        'This is to notify you that you collected your certificate relating to <b>' + ' ' + StudentUser."Examination Description" + ' ' + 'on' +
        ' ' + Format(StudentUser."Collection Date") + ' ' + '</b> .<BR>Certificate No:' +
        ' ' + StudentUser."Certificate No." + ' ' + 'Issued By' + ' ' + StudentUser."Issued By Officer Name");
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        //SMTP.AddBCC(Email2);
        //SMTP.AddCC(StudentUser."Collected By Email");
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>HRMPEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();

    end;


    procedure CloseExaminationAccount(StudentProcessingHeader: Record "Student Processing Header")
    var
        CaseCategories: Record "Case Categories";
        Customer: Record Customer;
        ExaminationAccount: Record "Certificate Entry";
        Accounts: Record "Examination Account";
    begin
        ExaminationAccount.Init;
        ExaminationAccount."Student Reg No." := StudentProcessingHeader."Student Reg. No.";
        ExaminationAccount.Validate("Student Reg No.");
        ExaminationAccount."Exam Sitting ID" := StudentProcessingHeader."Examination Sitting";
        ExaminationAccount."Exam Center" := StudentProcessingHeader."Examination Center Code";
        ExaminationAccount.Type := StudentProcessingHeader."Certificate Type";
        ExaminationAccount."Certificate No." := StudentProcessingHeader."Certificate No.";
        ExaminationAccount."Collected By Email" := StudentProcessingHeader."Collected By Email";
        ExaminationAccount."Collected By ID Number" := StudentProcessingHeader."Collected By ID No.";
        ExaminationAccount."Collected By Name" := StudentProcessingHeader."Collected By Name";
        ExaminationAccount."Collection Date" := StudentProcessingHeader."Collection Date";
        ExaminationAccount."Issued  By" := StudentProcessingHeader."Issued By Officer";
        ExaminationAccount."Issued Date" := Today;
        ExaminationAccount."Issued Time" := Time;

        ExaminationAccount.Insert(true);
        Accounts.Reset;
        Accounts.SetRange("Registration No.", StudentProcessingHeader."Student Reg. No.");
        if Accounts.FindSet then begin
            Accounts."Certificate No." := StudentProcessingHeader."Certificate No.";
            Accounts."Collected By Email" := StudentProcessingHeader."Collected By Email";
            Accounts."Collected By ID No." := StudentProcessingHeader."Collected By ID No.";
            Accounts."Collected By Name" := StudentProcessingHeader."Collected By Name";
            Accounts.Issued := true;
            Accounts."Collection Date" := StudentProcessingHeader."Collection Date";
            Accounts.Modify(true);

        end;
        StudentProcessingHeader.Posted := true;
        StudentProcessingHeader."Posted Date" := Today;
        StudentProcessingHeader."Posted By" := UserId;
        StudentProcessingHeader."Posted On" := CurrentDatetime;
        StudentProcessingHeader.Modify(true);
    end;

    procedure RemarkingSendRegretEmail(StudentUser: Record "Student Processing Header")
    var
        ContactUsers: Record Contact;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        EmailMessage.Create(StudentUser.Email,
        'HRMPEB REMARKING',
         'Dear ' + StudentUser."Student Name" + ',<BR><BR>' +
         'Your remarking request done on <b>' + ' ' + Format(StudentUser."Created On") + ' ' + '</b> relating to the examination' + ' ' + StudentUser."Examination Description" + ' ' + 'has been rejected.<BR>' +
         'The following are/is the reason for rejection.' + StudentUser."Reason for Rejection" + '');

        // //SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>HRMPEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

    end;

    procedure RemarkCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TXT004: label 'The invoice %1,has been sent to the student succesfuly';
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        Cust: Record Customer;
        Contact: Record Contact;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ExamFee: Record Resource;
        ExamFeeCost: Record "Resource Cost";
        Amount: Decimal;
        WorkType: Record "Work Type";
        Existing: Boolean;
        ExamAccountNo: Code[30];
        ResourcePrice: Record "Resource Price";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
        TXT001: label 'The invoice %1,has been created succesfully';
        SalesHeader: Record "Sales Header";
        TXT002: label 'An invoice %1 already exists for the application %2';
    begin
        SalesInv.Reset;
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not SalesInv.FindFirst then begin
            SalesInv.Init;
            SalesInv."Document Type" := SalesInv."document type"::Invoice;
            SalesInv."No." := '';
            SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
            SalesInv."Document Date" := Today;
            SalesInv."Order Date" := Today;
            SalesInv."Posting Date" := Today;
            SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
            SalesInv."External Document No." := BulkProcessingHeader."No.";
            SalesInv.Type := SalesInv.Type::Normal;
            SalesInv."Prepayment %" := 100;//enforce prepayment`
            SalesInv.Insert(true);
            //get resource entry
            ExamFee.Reset;
            ExamFee.SetRange("No.", BulkProcessingHeader."Type Code");
            if ExamFee.FindSet then begin
                SalesLine.Init;
                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                SalesLine."Document No." := SalesInv."No.";
                SalesLine.Type := SalesLine.Type::Resource;
                SalesLine."No." := ResourcePrice.Code;
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                BulkProcessingHeader.CalcFields("Remark Amount");
                SalesLine."Unit Price" := BulkProcessingHeader."Remark Amount";
                SalesLine.Validate("Unit Price");
                SalesLine.Validate(Quantity);
                SalesLine.Insert(true);
            end;

            Message(TXT001, SalesInv."No.");
        end;
        RemarkCreatReceipt(BulkProcessingHeader);
    end;

    procedure RemarkCreatReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        Cust: Record Customer;
        Contact: Record Contact;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ExamFee: Record Resource;
        ExamFeeCost: Record "Resource Cost";
        Amount: Decimal;
        WorkType: Record "Work Type";
        Existing: Boolean;
        ExamAccountNo: Code[30];
        ResourcePrice: Record "Resource Price";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        SalesInv1: Record "Sales Header";
    begin
        //code to post the created invoice
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.Find('-') then begin
            SalesInv."Posting Date" := Today;
            SalesInv.Modify(true);
            Commit;
            SalesInv1.Reset;
            SalesInv1.SetRange("No.", SalesInv."No.");
            if SalesInv1.FindFirst then begin
                SalesPostYesNo.Run(SalesInv1);
            end;

            Message('Invoice %1 has been posted Successfully', SalesInv."No.");
            CashMngmntSetup.Get();
            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader.Insert(true);
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines."Applies to Doc. No" := SalesInv."No.";
            ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;
            ReceiptLines.Insert(true);
            Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
        end;
        BulkProcessingHeader."Exemption Receipt 6No." := ReceiptHeader."No.";
        BulkProcessingHeader.Modify;
    end;

    procedure DefferalCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        FileName: Text;
        FileLocation: Text;
        SalesHeader: Record "Sales Header";
        TXT001: label 'A sales invoice no %1,has already been processed for this application';
        ExamBookingEntries: Record "Exam Booking Entries";
        ExamSittingCycle: Record "Exam Sitting Cycle";
        ExamBookingEntries1: Record "Exam Booking Entries";
        EntryNo: Integer;
    begin
        SalesInv.Reset;
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not SalesInv.FindFirst then begin
            SalesInv."Document Type" := SalesInv."document type"::Invoice;
            SalesInv."No." := '';
            SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
            SalesInv."Document Date" := Today;
            SalesInv."Order Date" := Today;
            SalesInv."Posting Date" := Today;
            SalesInv."External Document No." := BulkProcessingHeader."No.";
            SalesInv.Type := SalesInv.Type::Normal;
            SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
            SalesInv."Prepayment %" := 100;//enforce prepayment`
            SalesInv.Insert(true);
            SalesLine.Init;
            SalesLine."Document Type" := SalesLine."document type"::Invoice;
            SalesLine."Document No." := SalesInv."No.";
            SalesLine.Type := SalesLine.Type::Resource;
            SalesLine."No." := BulkProcessingHeader."Fee Type";
            SalesLine.Validate("No.");
            SalesLine.Quantity := 1;
            SalesLine.Validate(Quantity);
            SalesLine."Unit Price" := BulkProcessingHeader."Administrative Fees";
            SalesLine.Validate("Unit Price");
            SalesLine.Insert(true);
            BulkProcessingHeader."Application Invoice" := SalesInv."No.";
            BulkProcessingHeader.Modify;
            DefferalSendInvoice(BulkProcessingHeader);


        end else
            Error(TXT001, SalesInv."No.");
    end;

    procedure DefferalCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        CashMngmntSetup: Record "Cash Management Setup";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TXT001: label 'There is no unposted invoice for the application %1';
        SalesInv1: Record "Sales Header";
    begin
        //code to post the created invoice
        CashMngmntSetup.Get();
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.FindFirst then begin
            SalesInv."Posting Date" := Today;
            SalesInv.Modify(true);
            Commit;
            SalesInv1.Reset;
            SalesInv1.SetRange("No.", SalesInv."No.");
            if SalesInv1.FindFirst then begin
                SalesPostYesNo.Run(SalesInv1);
            end;

            Message('Invoice %1 has been posted Successfully', SalesInv."No.");

            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader.Insert(true);
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines.Description := BulkProcessingHeader."Student Name" + '- Defferal fees';
            ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;

            ReceiptLines.Insert(true);
            ApplicationAssignRegistrationNo(BulkProcessingHeader);
            //code to assing a unique registration No.]
            BulkProcessingHeader."Application Receipt" := ReceiptHeader."No.";
            ReceiptHeader.CalcFields(Amount);
            BulkProcessingHeader."Application Amount" := ReceiptHeader.Amount;
            BulkProcessingHeader.Modify;
            //open the receipt card
            Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
        end else
            Error(TXT001, BulkProcessingHeader."No.");

        //send email receipt
    end;

    procedure DefferalSendInvoice(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Student Processing Header";
        FileName1: Text;
        FileLocation1: Text;
        ProcessingHeader: Record "Student Processing Header";
        DocLog: Record "Student Mgmt E-mail Log";
        Counter: Integer;
        Header: Record "Student Processing Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        EmailMessage.Create(StudentProcessingHeader.Email,
        'HRMPEB:EXAMINATION DEFERMENT',
        'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        'This is to inform you that your application for deferment from the' + '<b>' + StudentProcessingHeader."Examination Sitting" + ' </b>' +
        'examination has been <b>approved</b>.<BR>' +
        'Find the attached invoice for payment.' + '<BR><BR>Kind Regards,' + '<BR>' +
        '<BR><BR>EXAMINATION BOOKING<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');

        FileName := StudentProcessingHeader."Application Invoice" + '.pdf';
        FileLocation := ExaminationSetup."Examination Path" + FileName;


        ProcessingHeader.Reset;
        ProcessingHeader.SetRange("No.", StudentProcessingHeader."No.");
        if ProcessingHeader.FindSet then begin
            Report.SaveAsPdf(85102, FileLocation, ProcessingHeader);
            EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
        end;


        //SMTP.AddBCC(Email2);
        //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR>');
        //SMTP.AppendToBody('<BR><BR>EXAMINATION BOOKING<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        Message('notification sent successfuly');


        //record sending details

        Counter := Counter + 1;
        DocLog.Init;
        DocLog."Entry No" := 0;
        DocLog."Customer No" := StudentProcessingHeader."Student Reg. No.";
        DocLog."E-mailed To" := StudentProcessingHeader.Email;
        DocLog.Date := Today;
        DocLog."Document Type" := DocLog."document type"::" ";
        DocLog."File Extension" := FileLocation1;
        DocLog.Time := Time;
        DocLog."S/no" := Counter;

        DocLog."Sender ID" := UserId;
        if DocLog.Insert(true) then begin
            Header.Reset;
            Header.SetRange("No.", StudentProcessingHeader."No.");
            if Header.FindFirst then begin
                Header."Email Sent" := true;
                Header.Modify(true);
            end;

        end
    end;

    procedure RejectDefferal(CenterBookingHeader: Record "Student Processing Header")
    var
        CenterBookingLines: Record "Center Booking Lines";
        BookingEntries: Record "Center Booking Entries";
        EntryNo: Integer;
        TXT001: label 'There is not enough space to accomodate the students';
        BookingEntries1: Record "Center Booking Entries";
        BookingEntries2: Record "Center Booking Entries";
        TotalValue: Boolean;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Receipts Header1";
        FileName1: Text;
        FileLocation1: Text;
        Header: Record "Student Processing Header";
        ExemptionEntries: Record "Exemption Entries";
        DocLog: Record "Student Mgmt E-mail Log";
        Counter: Integer;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", CenterBookingHeader."Student Reg. No.");
        if ExaminationAccount.FindFirst then begin
            ExaminationSetup.Get;
            ExaminationAccount.TestField(Email);
            Email2 := ExaminationSetup."Registration Sender Email";

            EmailMessage.Create(CenterBookingHeader.Email,
              'HRMPEB:EXAMINATION DEFERMENT',
              'Dear ' + CenterBookingHeader."Student Name" + ',<BR><BR>' +
              'This is to inform you that your application for deferment from the  <b>' + ' ' + CenterBookingHeader."Examination Sitting" + ' ' + '</b> has been <b>declined</b>.<BR> due to' + ' ' + CenterBookingHeader."Reason for Rejection" + ' ' + '.<BR>' +
             '<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
            //SMTP.AddBCC(Email2);
            //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
            //SMTP.AppendToBody('<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
            //SMTP.Send();
            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            Counter := Counter + 1;
            DocLog.Init;
            DocLog."Entry No" := 0;
            DocLog."Customer No" := CenterBookingLines."Student Reg No.";
            DocLog."E-mailed To" := ExaminationAccount.Email;
            DocLog.Date := Today;
            DocLog."Document Type" := DocLog."document type"::" ";
            DocLog.Time := Time;
            DocLog."S/no" := Counter;

            DocLog."Sender ID" := UserId;
            DocLog.Insert(true);
            CenterBookingHeader."Approval Status" := CenterBookingHeader."approval status"::Rejected;
            CenterBookingHeader.Posted := true;
            CenterBookingHeader."Posted By" := UserId;
            CenterBookingHeader.Modify(true);
            Message('Communication sent succesfully');

        end;
    end;

    procedure PostDefferalVoucher(var StudentProcessingHeader: Record "Student Processing Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        EntryNo: Integer;
        TXT001: label 'Examination Booking for %1  has been done succesfully';
        ExemptionEntries: Record "Exemption Entries";
        StudentBookingLines: Record "Student Processing Lines";
        Papers: Record Papers;
        StudentProcessingHeader1: Record "Student Processing Header";
        ExamBookingEntries1: Record "Exam Booking Entries";
        ExamBookingEntries2: Record "Exam Booking Entries";
        ExamBookingEntries3: Record "Exam Booking Entries";
        HeaderNo: Code[30];
        TXT002: label 'The center %1,selected cannot accomodate the student';
        ExamSittingCycle: Record "Exam Sitting Cycle";
        Header: Record "Student Processing Header";
    begin
        //create exam booking entries

        StudentProcessingHeader1.Reset;
        StudentProcessingHeader1.SetRange("No.", StudentProcessingHeader."No.");
        if StudentProcessingHeader1.FindSet then begin
            StudentBookingLines.Reset;
            StudentBookingLines.SetRange("Booking Header No.", StudentProcessingHeader."No.");
            if StudentBookingLines.FindSet then begin
                repeat
                    ExamBookingEntries.Reset;
                    ExamBookingEntries.SetRange("Student Reg No.", StudentProcessingHeader."Student Reg. No.");
                    ExamBookingEntries.SetRange(Paper, StudentBookingLines.Paper);
                    ExamBookingEntries.SetRange("Exam Sitting", StudentProcessingHeader."Examination Sitting");
                    if ExamBookingEntries.FindFirst then begin
                        ExamBookingEntries1.Reset;
                        if ExamBookingEntries1.FindLast then
                            EntryNo := ExamBookingEntries1."Entry No.";
                        ExamBookingEntries2.TransferFields(ExamBookingEntries);
                        ExamBookingEntries2."Entry No." := EntryNo + 1;
                        ExamBookingEntries2.Status := ExamBookingEntries2.Status::Open;
                        ExamBookingEntries2.Blocked := false;
                        ExamBookingEntries2."Exam Sitting" := StudentProcessingHeader."Prefered Examination Sitting";
                        ExamBookingEntries2.Insert(true);

                        ExamBookingEntries.Status := ExamBookingEntries.Status::Defered;
                        ExamBookingEntries."Last Date Modified" := Today;
                        ExamBookingEntries."Last Modified Date Time" := CurrentDatetime;
                        ExamBookingEntries.Blocked := true;
                        ExamBookingEntries.Modify(true);
                    end;
                until StudentBookingLines.Next = 0;
            end;
            Header.Reset;
            Header.SetRange("Student Reg. No.", StudentProcessingHeader."Student Reg. No.");
            Header.SetRange(Posted, true);
            Header.SetRange("Examination Sitting", StudentProcessingHeader."Examination Sitting");
            if Header.FindFirst then begin
                Header."Examination Sitting" := StudentProcessingHeader."Prefered Examination Sitting";
                Header.Validate("Examination Sitting");
                Header.Modify(true);
            end;

            StudentProcessingHeader1.Posted := true;
            StudentProcessingHeader1."Posted By" := UserId;
            StudentProcessingHeader1."Posted On" := CurrentDatetime;
            StudentProcessingHeader1."Posted Date" := Today;
            StudentProcessingHeader1.Modify(true);
        end;
    end;

    procedure WithdrawalCreateVoucher(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record Payments;
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "PV Lines";
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        Cust: Record Customer;
        Contact: Record Contact;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ExamFee: Record Resource;
        ExamFeeCost: Record "Resource Cost";
        Amount: Decimal;
        WorkType: Record "Work Type";
        Existing: Boolean;
        ExamAccountNo: Code[30];
        ResourcePrice: Record "Resource Price";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CashMngmntSetup.Get();
        NoSeriesMgt.InitSeries(CashMngmntSetup."PV Nos", CashMngmntSetup."PV Nos", 0D, NoSeries, CashMngmntSetup."PV Nos");
        ReceiptHeader.Init;
        ReceiptHeader."No." := NoSeries;
        ReceiptHeader.Date := Today;
        ReceiptHeader."Payment Narration" := Format(BulkProcessingHeader."Document Type") + ' ' + BulkProcessingHeader."Student Name";
        ReceiptHeader.Payee := BulkProcessingHeader."Student Name";
        ReceiptHeader.Insert(true);
        ReceiptLines.Init;
        ReceiptLines.No := ReceiptHeader."No.";
        ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
        ReceiptLines."Account No" := BulkProcessingHeader."Student No.";
        ReceiptLines.Validate("Account No");
        ReceiptLines.Amount := BulkProcessingHeader."Withdrawal Refund Amount";
        ReceiptLines.Validate(Amount);
        ReceiptLines.Insert(true);
        Page.Run(57001, ReceiptHeader, ReceiptHeader."No.");
        BulkProcessingHeader."Payment Created" := true;
        BulkProcessingHeader.Modify(true);
    end;

    procedure WithdrawalSendApproval(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Student Processing Header";
        FileName1: Text;
        FileLocation1: Text;
        ProcessingHeader: Record "Student Processing Header";
        DocLog: Record "Student Mgmt E-mail Log";
        Counter: Integer;
        Header: Record "Student Processing Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        EmailMessage.Create(StudentProcessingHeader.Email,
        'HRMPEB:EXAMINATION WITHDRAWAL',
        'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        'This is to inform you that your application for withdrawal from the' + '<b>' + StudentProcessingHeader."Examination Sitting" + ' </b>' +
        'examination has been <b>approved</b>.<BR>' +
        'Please await payment by HRMPEB' + '<BR><BR>Kind Regards,' + '<BR>' + '<BR><BR>EXAMINATION BOOKING<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');


        //SMTP.AddBCC(Email2);
        //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR>');
        //SMTP.AppendToBody('<BR><BR>EXAMINATION BOOKING<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        Message('notification sent successfuly');


        //record sending details

        Counter := Counter + 1;
        DocLog.Init;
        DocLog."Entry No" := 0;
        DocLog."Customer No" := StudentProcessingHeader."Student Reg. No.";
        DocLog."E-mailed To" := StudentProcessingHeader.Email;
        DocLog.Date := Today;
        DocLog."Document Type" := DocLog."document type"::" ";
        DocLog."File Extension" := FileLocation1;
        DocLog.Time := Time;
        DocLog."S/no" := Counter;

        DocLog."Sender ID" := UserId;
        if DocLog.Insert(true) then begin
            Header.Reset;
            Header.SetRange("No.", StudentProcessingHeader."No.");
            if Header.FindFirst then begin
                Header."Email Sent" := true;
                Header.Modify(true);
            end;

        end
    end;

    local procedure WithdrawalCreateCreditMemo(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        ExamBookingEntries: Record "Exam Booking Entries";
        StudentBookingLines: Record "Student Processing Lines";
        Examination: Codeunit Examination;
        SalesInv1: Record "Sales Header";
    begin
        SalesInv.Init;
        SalesInv."Document Type" := SalesInv."document type"::"Credit Memo";
        SalesInv."No." := '';
        SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv."Document Date" := Today;
        SalesInv."Order Date" := Today;
        SalesInv."Posting Date" := Today;
        SalesInv."External Document No." := BulkProcessingHeader."No.";
        SalesInv.Type := SalesInv.Type::Normal;
        SalesInv."Prepayment %" := 100;//enforce prepayment`
        SalesInv.Insert(true);
        BulkProcessingHeader.CalcFields("Total Withdrawal Amount");
        //get resource entry
        ResourcePrice.Reset;
        ResourcePrice.SetRange(Code, BulkProcessingHeader."Fee Type");
        if ResourcePrice.FindSet then begin
            SalesLine.Init;
            SalesLine."Document Type" := SalesLine."document type"::"Credit Memo";
            SalesLine."Document No." := SalesInv."No.";
            SalesLine."No." := ResourcePrice.Code;
            SalesLine.Type := SalesLine.Type::Resource;
            SalesLine.Validate(SalesLine."No.");
            SalesLine.Validate(SalesLine.Quantity, 1);
            SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Withdrawal Refund Amount");
            SalesLine.Insert(true);
        end;
        SalesInv."Posting Date" := Today;
        SalesInv.Modify(true);
        Commit;
        SalesInv1.Reset;
        SalesInv1.SetRange("No.", SalesInv."No.");
        if SalesInv1.FindFirst then begin
            SalesPostYesNo.Run(SalesInv1);
        end;


        Message('Credit Memo %1, posted succesfully', SalesInv."No.");
    end;


    procedure PostWthdrawalVoucher(PV: Record "Student Processing Header")
    var
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Examination Setup";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        ExamBookingEntries: Record "Exam Booking Entries";
        StudentBookingLines: Record "Student Processing Lines";
        Examination: Codeunit Examination;
    begin
        //create an action to reduce the income

        if Confirm('Are you sure you want to post the Withdrawal Voucher No. ' + PV."No." + ' ?') = true then begin
            WithdrawalCreateCreditMemo(PV);
            if PV.Posted then
                Error('Withdrawal Voucher %1 has been posted', PV."No.");

            //block entries for examination
            StudentBookingLines.Reset;
            StudentBookingLines.SetRange("Booking Header No.", PV."No.");
            if StudentBookingLines.FindSet then begin
                repeat
                    ExamBookingEntries.Reset;
                    ExamBookingEntries.SetRange("Student Reg No.", PV."Student Reg. No.");
                    ExamBookingEntries.SetRange(Examination, PV."Examination ID");
                    ExamBookingEntries.SetRange("Exam Sitting", PV."Examination Sitting");
                    ExamBookingEntries.SetRange(Paper, StudentBookingLines.Paper);
                    if ExamBookingEntries.FindSet then begin
                        ExamBookingEntries.Blocked := true;
                        ExamBookingEntries.Status := ExamBookingEntries.Status::Withdrawn;
                        ExamBookingEntries.Modify;
                    end;
                until StudentBookingLines.Next = 0
            end;


            PV.Posted := true;
            PV."Posted By" := UserId;
            PV."Posted Date" := Today;
            PV."Posted On" := CurrentDatetime;
            PV.Modify(true);
            Commit;
            WithdrawalSendApproval(PV);
        end;
    end;

    procedure RejectWithdrawal(CenterBookingHeader: Record "Student Processing Header")
    var
        CenterBookingLines: Record "Center Booking Lines";
        BookingEntries: Record "Center Booking Entries";
        EntryNo: Integer;
        TXT001: label 'There is not enough space to accomodate the students';
        BookingEntries1: Record "Center Booking Entries";
        BookingEntries2: Record "Center Booking Entries";
        TotalValue: Boolean;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Receipts Header1";
        FileName1: Text;
        FileLocation1: Text;
        Header: Record "Student Processing Header";
        ExemptionEntries: Record "Exemption Entries";
        DocLog: Record "Student Mgmt E-mail Log";
        Counter: Integer;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", CenterBookingHeader."Student Reg. No.");
        if ExaminationAccount.FindFirst then begin
            ExaminationSetup.Get;
            ExaminationAccount.TestField(Email);
            Email2 := ExaminationSetup."Registration Sender Email";

            EmailMessage.Create(CenterBookingHeader.Email,
              'HRMPEB:EXAMINATION WITHDRAWAL',
              'Dear ' + CenterBookingHeader."Student Name" + ',<BR><BR>' +
              'This is to inform you that your application for withdrawal from the  <b>' + ' ' + CenterBookingHeader."Examination Sitting" + ' ' + '</b> has been <b>declined</b> due to' + '  ' + CenterBookingHeader."Reason for Rejection" + ' ' + '.<BR>' +
              '<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
            //SMTP.AddBCC(Email2);
            //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
            //SMTP.AppendToBody('<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
            //SMTP.Send();
            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            Counter := Counter + 1;
            DocLog.Init;
            DocLog."Entry No" := 0;
            DocLog."Customer No" := CenterBookingLines."Student Reg No.";
            DocLog."E-mailed To" := ExaminationAccount.Email;
            DocLog.Date := Today;
            DocLog."Document Type" := DocLog."document type"::" ";
            DocLog.Time := Time;
            DocLog."S/no" := Counter;

            DocLog."Sender ID" := UserId;
            DocLog.Insert(true);
            CenterBookingHeader."Approval Status" := CenterBookingHeader."approval status"::Rejected;
            CenterBookingHeader.Posted := true;
            CenterBookingHeader."Posted By" := UserId;
            CenterBookingHeader.Modify(true);
            Message('Communication sent succesfully');

        end;
    end;

    procedure SendTimetableEmail(TimetablePlanner: Record "Timetable Planner Header")
    var
        ContactUsers: Record Contact;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        StudentUser: Record "Examination Account";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        StudentUser.Reset;
        StudentUser.SetRange(Blocked, false);
        if StudentUser.FindSet then begin
            repeat
                if StudentUser.Email <> '' then
                    EmailMessage.Create(StudentUser.Email,
                    'HRMPEB EXAMINATION TIMETABLE',
                    'Dear ' + StudentUser."First Name" + '-' + StudentUser."Registration No." + ',<BR><BR>' +
                    'The timetable for the examination cycle' + ' ' + TimetablePlanner."Exam Sitting ID" + ' ' + 'is ready.<BR>' +
                    'Find the timetable attached' + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
                    '<BR><BR>HRMPEB EXAMINATION Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');


                // SMTP.AddBCC(Email2);
                // SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
                // SMTP.AppendToBody('<BR><BR>HRMPEB EXAMINATION Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                // SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
                // SMTP.Send();
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            until StudentUser.Next = 0
        end;


    end;

    procedure RenewalCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        TXT001: label 'Invoice %1 sent succesfully';
        TXT002: label 'An invoice no %1 for this renewal has already been processed';
        ExaminationAccount: Record "Examination Account";
        StudentProcessingLines: Record "Student Processing Lines";
        Resource: Record Resource;
        RenewalAmount: Decimal;
        Header: Record "Student Processing Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        //ensure invoice cannot appear twice
        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not SalesInvoiceHeader.FindSet then begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if not SalesInv.FindFirst then begin

                SalesInv."Document Type" := SalesInv."document type"::Invoice;
                SalesInv."No." := '';
                SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
                SalesInv."Document Date" := Today;
                SalesInv."Order Date" := Today;
                SalesInv."Posting Date" := Today;
                SalesInv."Currency Code" := BulkProcessingHeader."Currency Code";
                SalesInv."External Document No." := BulkProcessingHeader."No.";
                SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
                SalesInv.Type := SalesInv.Type::Normal;
                SalesInv."Prepayment %" := 100;//enforce prepayment`
                SalesInv.Insert(true);

                //insert lines based on lines
                ExaminationSetup.Get;
                StudentProcessingLines.Reset;
                StudentProcessingLines.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                if StudentProcessingLines.FindSet then begin
                    // REPEAT
                    if BulkProcessingHeader."Currency Code" <> '' then
                        RenewalAmount := StudentProcessingLines."Amount LCY"
                    else
                        RenewalAmount := StudentProcessingLines.Amount;

                    SalesLine.Init;
                    SalesLine."Document Type" := SalesLine."document type"::Invoice;
                    SalesLine."Document No." := SalesInv."No.";
                    Resource.Reset;
                    Resource.SetRange("Course ID", StudentProcessingLines."Course Id");
                    if Resource.FindSet then begin
                        repeat
                            ResourcePrice.Reset;
                            ResourcePrice.SetRange("Document Type", ResourcePrice."document type"::Renewal);
                            ResourcePrice.SetRange("Currency Code", StudentProcessingLines."Currency Code");
                            ResourcePrice.SetRange(Code, Resource."No.");
                            if ResourcePrice.FindFirst then begin//get the price

                                SalesLine.Type := SalesLine.Type::Resource;
                                SalesLine."No." := Resource."No.";
                                SalesLine.Validate(SalesLine."No.");
                                SalesLine.Validate(SalesLine.Quantity, 1);
                                SalesLine.Validate(SalesLine."Unit Price", RenewalAmount);
                                SalesLine.Insert(true);
                            end;
                        until Resource.Next = 0;
                    end;

                    //get resource based on course and level



                    // UNTIL StudentProcessingLines.NEXT=0;

                end;
                BulkProcessingHeader."Renewal Invoice No." := SalesInv."No.";
                BulkProcessingHeader.Modify(true);



                //send email pro-forma
                ExaminationSetup.Get;
                Email2 := ExaminationSetup."Registration Sender Email";
                EmailMessage.Create(BulkProcessingHeader.Email,
                'HRMPEB STUDENT RENEWAL',
                 'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
                 'Your renewal request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
                 'Find attached the invoice for payment' + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
                '<BR><BR>Kind Regards,' + '<BR><BR>HRMPEB STUDENT RENEWAL<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                Filename := SalesInv."No." + '.pdf';
                FileLocation := ExaminationSetup."Examination Path" + Filename;
                Header.Reset;
                Header.SetRange("No.", BulkProcessingHeader."No.");
                if Header.FindSet then begin
                    Report.SaveAsPdf(85051, FileLocation, Header);
                end;
                EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
                //SMTP.AddBCC(Email2);
                //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
                //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>HRMPEB STUDENT RENEWAL<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                //SMTP.Send();
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                Message(TXT001, SalesInv."No.");
                //reduce the renewals to 0


            end
            else
                Error(TXT002, SalesInv."No.");
        end
    end;

    procedure RenewalCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
        CustLedgerEntry: Record "Cust. Ledger Entry";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExaminationAccount: Record "Examination Account";
        StudentProcessingLines: Record "Student Processing Lines";
        PaymentsPost: Codeunit "Payments-Post";
        RenewalAmount: Decimal;
        TotalRenewal: Integer;
        RemainingAmount: Decimal;
        ReceiptHeader2: Record "Receipts Header1";
        ReceiptNo: Code[50];
        Header: Record "Student Processing Header";
        SalesInv1: Record "Sales Header";
    begin
        ExaminationSetup.Get;//code to post the created invoice

        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.Find('-') then begin
            SalesInv."Posting Date" := Today;
            SalesInv.Modify(true);
            Commit;
            SalesInv1.Reset;
            SalesInv1.SetRange("No.", SalesInv."No.");
            if SalesInv1.FindFirst then begin
                SalesPostYesNo.Run(SalesInv1);
            end;

            Message('Invoice %1 has been posted Successfully', SalesInv."No.");
        end;

        //IT Exist before posting REceipt

        //check ledger if posted invoice then exit
        CustLedgerEntry.Reset;
        CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
        CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
        CustLedgerEntry.CalcFields(Amount);
        CustLedgerEntry.SetFilter(Amount, '>%1', 0);
        if CustLedgerEntry.FindFirst then begin
            RenewalUpdateDetails(BulkProcessingHeader);
            //get the receipt and mark as posted
            ReceiptHeader2.Reset;
            ReceiptHeader2.SetRange("Cheque No", CustLedgerEntry."External Document No.");
            if ReceiptHeader2.FindFirst then begin
                ReceiptHeader2.Posted := true;
                ReceiptHeader2."Posted By" := UserId;
                ReceiptHeader2."Posted Date" := Today;
                ReceiptHeader2."Posted Time" := Time;
                ReceiptHeader2.Modify(true);

                Header.Reset;
                Header.SetRange("No.", BulkProcessingHeader."No.");
                if Header.FindFirst then begin

                    Header."Renewal Invoice No." := CustLedgerEntry."Document No.";
                    Header."Renewal Receipt No." := ReceiptHeader2."No.";
                    Header.Posted := true;
                    Header."Posted By" := UserId;
                    Header."Posted Date" := Today;
                    Header."Posted On" := CurrentDatetime;
                    Header.Modify(true);
                end;
                exit;
            end
            else begin
                //create and post a receipt if its not present
                ReceiptHeader1.Reset;
                ReceiptHeader1.SetRange("Cheque No", BulkProcessingHeader."No.");
                ReceiptHeader1.SetRange(Posted, false);
                if ReceiptHeader1.FindFirst then begin
                    StudentManagement.PostReceipt(ReceiptHeader1);
                    ReceiptNo := ReceiptHeader1."No.";
                end
                else begin
                    CashMngmntSetup.Get();
                    NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
                    ReceiptHeader.Init;
                    ReceiptHeader."No." := NoSeries;
                    ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
                    ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
                    if BulkProcessingHeader."Pay Mode" = '' then
                        ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode"
                    else
                        ReceiptHeader."Pay Mode" := BulkProcessingHeader."Pay Mode";
                    if BulkProcessingHeader."Bank Code" = '' then
                        ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code"
                    else
                        ReceiptHeader."Bank Code" := BulkProcessingHeader."Bank Code";
                    ReceiptHeader.Validate("Bank Code");
                    ReceiptHeader."Received From" := BulkProcessingHeader."Student Name";
                    ReceiptHeader."On Behalf Of" := BulkProcessingHeader."Student Name";
                    ReceiptHeader."Posted Date" := Today;
                    ReceiptHeader."Posting Date" := Today;
                    ReceiptHeader.Insert(true);
                    ReceiptLines.Init;
                    ReceiptLines."Receipt No." := ReceiptHeader."No.";
                    ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
                    ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Renewal amount';
                    ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
                    ReceiptLines.Validate("Account No.");
                    //get posted invoice number
                    CustLedgerEntry.Reset;
                    CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
                    CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
                    if CustLedgerEntry.FindFirst then begin
                        ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                        ReceiptLines.Validate("Applies to Doc. No");
                    end;
                    ReceiptLines.Insert(true);
                    if ReceiptLines.Amount <> 0 then begin
                        StudentManagement.PostReceipt(ReceiptHeader);
                    end;
                    ReceiptNo := NoSeries;
                end;
                BulkProcessingHeader."Renewal Invoice No." := CustLedgerEntry."Document No.";
                BulkProcessingHeader."Renewal Receipt No." := ReceiptNo;
                BulkProcessingHeader.Posted := true;
                BulkProcessingHeader."Posted By" := UserId;
                BulkProcessingHeader."Posted Date" := Today;
                BulkProcessingHeader."Posted On" := CurrentDatetime;
                BulkProcessingHeader.Modify(true);

            end;

        end;
    end;

    procedure RenewalSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Student Processing Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        if StudentProcessingHeader.Email <> '' then begin
            EmailMessage.Create(StudentProcessingHeader.Email,
            'HRMPEB STUDENT RENEWAL',
            'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
            'Your renewal request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
            'Find attached the receipt' + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
           '<BR><BR>EXAMINATION RENEWAL.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
            FileName := ReceiptHeader."No." + '.pdf';
            FileLocation := ExaminationSetup."Examination Path" + FileName;
            ReceiptHeader1.Reset;
            ReceiptHeader1.SetRange("No.", StudentProcessingHeader."No.");
            if ReceiptHeader1.FindSet then begin
                Report.SaveAsPdf(85050, FileLocation, ReceiptHeader1);
            end;
            EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
            //SMTP.AddBCC(Email2);
            //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
            //SMTP.AppendToBody('<BR><BR>EXAMINATION RENEWAL.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
            //SMTP.Send();
            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        end
        //send receipt
    end;


    procedure RenewalUpdateDetails(BulkProcessingHeader: Record "Student Processing Header")
    var
        StudentProcessingLines: Record "Student Processing Lines";
        RenewalAmount: Decimal;
        ExaminationAccount: Record "Examination Account";
        RemainingAmount: Decimal;
        TotalRenewal: Integer;
        RenewalEntries: Record "Student Renewal Entries";
        RenewalEntries1: Record "Student Renewal Entries";
        EntryNo: Integer;
        LineNo: Integer;
        RenewalValue: Decimal;
        ResourcePrice: Record "Resource Price";
        Resource: Record Resource;
        ReactAmt: Decimal;
    begin
        //modify the pending renewals
        //for each line modify the pending reenwals based on amount
        //GET Renewal amount
        RenewalValue := 0.0;



        StudentProcessingLines.Reset;
        StudentProcessingLines.SetRange("Booking Header No.", BulkProcessingHeader."No.");
        if StudentProcessingLines.FindFirst then begin
            repeat
                Resource.Reset;
                Resource.SetRange("Course ID", StudentProcessingLines."Course Id");
                if Resource.FindSet then begin
                    repeat
                        ResourcePrice.Reset;
                        ResourcePrice.SetRange("Document Type", ResourcePrice."document type"::Renewal);
                        ResourcePrice.SetRange("Currency Code", StudentProcessingLines."Currency Code");
                        ResourcePrice.SetRange(Code, Resource."No.");
                        if ResourcePrice.FindFirst then begin//get the price

                            RenewalValue := ResourcePrice."Unit Price";
                        end;
                    until Resource.Next = 0;
                end;
                RenewalAmount := StudentProcessingLines."Amount LCY";
                //check exam account
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Student Cust No.", BulkProcessingHeader."Student No.");
                ExaminationAccount.SetRange("Registration No.", StudentProcessingLines."Registration No.");
                if ExaminationAccount.FindFirst then begin
                    //ensure renewal has pending amount
                    if ExaminationAccount."Renewal Pending" > 0 then begin
                        if ExaminationAccount."Re-Activation Amount" > 0 then begin
                            if RenewalAmount > ExaminationAccount."Re-Activation Amount" then begin
                                //update reactivation
                                ReactAmt := ExaminationAccount."Re-Activation Amount";
                                //update remaining amount

                                RenewalAmount := RenewalAmount - ExaminationAccount."Re-Activation Amount";

                                //get no of years for remaning renewal amount
                                if RenewalAmount > 0 then begin
                                    TotalRenewal := ROUND(RenewalAmount / RenewalValue, 1, '<');

                                    ExaminationAccount."Renewal Amount" := ExaminationAccount."Renewal Amount" - RenewalAmount;
                                    ExaminationAccount."Renewal Pending" := ExaminationAccount."Renewal Pending" - TotalRenewal;

                                end;
                                ExaminationAccount."Re-Activation Amount" := ReactAmt - ExaminationAccount."Re-Activation Amount";
                                ExaminationAccount.Status := ExaminationAccount.Status::Active;
                                ExaminationAccount.Modify(true);
                            end
                        end
                        else begin //where student does not have reactivation


                            if RenewalAmount = ExaminationAccount."Renewal Amount" then begin
                                ExaminationAccount."Renewal Amount" := RenewalAmount - ExaminationAccount."Renewal Amount";
                                ExaminationAccount."Renewal Pending" := 0;
                            end;
                            if RenewalAmount <> ExaminationAccount."Renewal Amount" then begin
                                if ExaminationAccount."Renewal Amount" > 0 then begin
                                    TotalRenewal := ROUND(RenewalAmount / RenewalValue, 1, '<');
                                    ExaminationAccount."Renewal Amount" := RenewalAmount - ExaminationAccount."Renewal Amount";
                                    ExaminationAccount."Renewal Pending" := ExaminationAccount."Renewal Pending" - TotalRenewal;
                                end;
                            end;

                            ExaminationAccount.Modify(true);
                        end;
                        RenewalEntries1.Reset;
                        if RenewalEntries1.FindLast then begin
                            LineNo := RenewalEntries1."Entry No.";
                        end;

                        RenewalEntries.Init;
                        RenewalEntries."Entry No." := LineNo + 1;
                        RenewalEntries."Course Id" := ExaminationAccount."Course ID";
                        RenewalEntries."Document  No." := BulkProcessingHeader."No.";
                        RenewalEntries.Description := StudentProcessingLines.Description;
                        RenewalEntries."Renewal Date" := Today;
                        RenewalEntries.Year := Date2dmy(Today, 3) + 1;
                        RenewalEntries."Stud. Reg. No" := ExaminationAccount."Registration No.";
                        RenewalEntries."Stud. Cust No." := ExaminationAccount."Student Cust No.";
                        RenewalEntries.Validate("Stud. Reg. No");
                        RenewalEntries.Insert(true);
                    end;

                end;


            until StudentProcessingLines.Next = 0;
        end;
    end;


    procedure RenewalGetAmount(BulkProcessingHeader: Record "Student Processing Header") Amount: Decimal
    var
        StudentProcessingLines: Record "Student Processing Lines";
        RenewalAmount: Decimal;
        ExaminationAccount: Record "Examination Account";
        RemainingAmount: Decimal;
        TotalRenewal: Integer;
        RenewalEntries: Record "Student Renewal Entries";
        RenewalEntries1: Record "Student Renewal Entries";
        EntryNo: Integer;
        StudentProcessingLines1: Record "Student Processing Lines";
    begin
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Student Cust No.", BulkProcessingHeader."Student No.");
        ExaminationAccount.SetRange(Blocked, false);
        if ExaminationAccount.FindSet then begin
            repeat
                StudentProcessingLines1.Reset;
                if StudentProcessingLines1.FindLast then
                    EntryNo := StudentProcessingLines1."Line No.";
                StudentProcessingLines.Init;
                StudentProcessingLines."Booking Header No." := BulkProcessingHeader."No.";
                StudentProcessingLines."Line No." := EntryNo + 1;
                StudentProcessingLines.Description := 'Renewal Amount';
                StudentProcessingLines."Document Type" := StudentProcessingLines."document type"::Renewal;
                StudentProcessingLines."Student No." := BulkProcessingHeader."Student No.";
                StudentProcessingLines."Registration No." := ExaminationAccount."Registration No.";
                StudentProcessingLines."Course Id" := ExaminationAccount."Course ID";
                StudentProcessingLines.Amount := ExaminationAccount."Renewal Amount" + ExaminationAccount."Re-Activation Amount";
                StudentProcessingLines."Amount LCY" := ExaminationAccount."Renewal Amount" + ExaminationAccount."Re-Activation Amount";
                StudentProcessingLines.Insert(true);
                EntryNo += 1;
            until
            ExaminationAccount.Next = 0;
            Amount := ExaminationAccount."Renewal Amount" + ExaminationAccount."Re-Activation Amount";
        end;
        exit(Amount);
    end;


    procedure BookingRenewalUpdateDetails(BulkProcessingHeader: Record "Student Processing Header")
    var
        StudentProcessingLines: Record "Student Processing Lines";
        RenewalAmount: Decimal;
        ExaminationAccount: Record "Examination Account";
        RemainingAmount: Decimal;
        TotalRenewal: Integer;
        RenewalEntries: Record "Student Renewal Entries";
        RenewalEntries1: Record "Student Renewal Entries";
        LineNo: Integer;
    begin
        //modify the pending renewals
        //for each line modify the pending reenwals based on amount
        StudentProcessingLines.Reset;
        StudentProcessingLines.SetRange("Transaction Type", StudentProcessingLines."transaction type"::Renewal);
        StudentProcessingLines.SetRange("Booking Header No.", BulkProcessingHeader."No.");
        if StudentProcessingLines.FindSet then begin
            repeat

                RenewalAmount := StudentProcessingLines."Amount LCY";
                //check exam account
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Student Cust No.", BulkProcessingHeader."Student No.");
                if ExaminationAccount.FindFirst then begin
                    if ExaminationAccount."Re-Activation Amount" > 0 then begin
                        if RenewalAmount > ExaminationAccount."Re-Activation Amount" then begin
                            ExaminationAccount."Re-Activation Amount" := RenewalAmount - ExaminationAccount."Re-Activation Amount";
                            if RemainingAmount > 0 then begin
                                RemainingAmount := RenewalAmount - ExaminationAccount."Re-Activation Amount";
                                TotalRenewal := ROUND(ExaminationAccount."Renewal Amount" / RemainingAmount, 1, '<');
                                ExaminationAccount."Renewal Amount" := ExaminationAccount."Renewal Amount" - RemainingAmount;
                                ExaminationAccount."Renewal Pending" := ExaminationAccount."Renewal Pending" - TotalRenewal;
                            end;
                            ExaminationAccount.Modify(true);
                        end
                        else begin
                            ExaminationAccount."Re-Activation Amount" := ExaminationAccount."Re-Activation Amount" - RenewalAmount;
                            ExaminationAccount.Modify(true);
                        end;

                    end
                    else begin
                        if ExaminationAccount."Renewal Pending" > 0 then begin

                            if RenewalAmount > 0 then begin

                                TotalRenewal := ROUND(ExaminationAccount."Renewal Amount" / RenewalAmount, 1, '<');
                                ExaminationAccount."Renewal Amount" := ExaminationAccount."Renewal Amount" - RenewalAmount;
                                ExaminationAccount."Renewal Pending" := ExaminationAccount."Renewal Pending" - TotalRenewal;
                                ExaminationAccount.Modify(true);
                            end;
                        end


                    end;
                    RenewalEntries1.Reset;
                    if RenewalEntries1.FindLast then begin
                        LineNo := RenewalEntries1."Entry No.";
                    end;

                    RenewalEntries.Init;
                    RenewalEntries."Entry No." := LineNo + 1;
                    RenewalEntries."Course Id" := ExaminationAccount."Course ID";
                    RenewalEntries."Document  No." := BulkProcessingHeader."No.";
                    RenewalEntries.Description := StudentProcessingLines.Description;
                    RenewalEntries."Renewal Date" := Today;
                    RenewalEntries.Year := Date2dmy(Today, 3) + 1;
                    RenewalEntries."Stud. Reg. No" := BulkProcessingHeader."Student Reg. No.";
                    RenewalEntries.Validate("Stud. Reg. No");
                    RenewalEntries.Insert(true);

                end;
            until StudentProcessingLines.Next = 0;
            Commit;
        end;
    end;

    procedure ActivationCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
        CustLedgerEntry: Record "Cust. Ledger Entry";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExaminationAccount: Record "Examination Account";
        StudentProcessingLines: Record "Student Processing Lines";
    begin
        //code to post the created invoice
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.Find('-') then begin
            SalesPostYesNo.Run(SalesInv);
            Message('Invoice %1 has been posted Successfully', SalesInv."No.");
            CashMngmntSetup.Get();
            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader.Insert(true);
            BulkProcessingHeader.CalcFields("Renewal Amount");
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            CustLedgerEntry.SetRange(Amount, BulkProcessingHeader."Renewal Amount");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;
            ReceiptLines.Insert(true);
            Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
        end;
        BulkProcessingHeader."Renewal Receipt No." := ReceiptHeader."No.";
        BulkProcessingHeader.Posted := true;
        BulkProcessingHeader."Posted By" := UserId;
        BulkProcessingHeader."Posted Date" := Today;
        BulkProcessingHeader."Posted On" := CurrentDatetime;
        BulkProcessingHeader.Modify(true);
    end;

    procedure ActivationSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Receipts Header1";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";

        EmailMessage.Create(StudentProcessingHeader.Email,
        'HRMPEB STUDENT RENEWAL',
        'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        'Your renewal request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        'Find attached the receipt' + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
       '<BR><BR>EXAMINATION BOOKING.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        FileName := ReceiptHeader."No." + '.pdf';
        FileLocation := ExaminationSetup."Examination Path" + FileName;
        ReceiptHeader1.Reset;
        ReceiptHeader1.SetRange("No.", StudentProcessingHeader."Renewal Receipt No.");
        if ReceiptHeader1.FindSet then begin
            Report.SaveAsPdf(56003, FileLocation, ReceiptHeader1);
        end;
        SMTP.AddAttachment(FileLocation, 'PDF', InStr);
        //SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>EXAMINATION BOOKING.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        //send receipt
    end;

    procedure ConfirmationCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        TXT001: label 'Invoice %1 sent succesfully';
        TXT002: label 'An invoice no %1 for this confirmation has already been processed';
        ExaminationAccount: Record "Examination Account";
        StudentProcessingLines: Record "Student Processing Lines";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not SalesInvoiceHeader.FindFirst then begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if not SalesInv.FindFirst then begin

                SalesInv."Document Type" := SalesInv."document type"::Invoice;
                SalesInv."No." := '';
                SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Requestor No.");
                SalesInv."Document Date" := Today;
                SalesInv."Order Date" := Today;
                SalesInv."Posting Date" := Today;
                SalesInv."External Document No." := BulkProcessingHeader."No.";
                SalesInv.Type := SalesInv.Type::Normal;
                SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
                SalesInv."Prepayment %" := 100;//enforce prepayment`
                SalesInv.Insert(true);
                ExaminationSetup.Get;
                SalesLine.Init;
                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                SalesLine."Document No." := SalesInv."No.";
                SalesLine."No." := ExaminationSetup."Re-Activation Resource";
                SalesLine.Type := SalesLine.Type::Resource;
                SalesLine.Validate(SalesLine."No.");
                SalesLine.Validate(SalesLine.Quantity, 1);
                BulkProcessingHeader.CalcFields("Activation Amount");
                SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Activation Amount");
                SalesLine.Insert(true);
                BulkProcessingHeader."Activation Invoice No." := SalesInv."No.";
                BulkProcessingHeader.Modify;
                //send email pro-forma
                ExaminationSetup.Get;
                Email2 := ExaminationSetup."Registration Sender Email";
                EmailMessage.Create(BulkProcessingHeader."Requested By E-Mail",
                'HRMPEB STUDENT CONFIRMATION',
                 'Dear ' + BulkProcessingHeader."Requested By Name" + ',<BR><BR>' +
                 'Your confirmation request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> payment has been processed.<BR>' +
                 'Find attached the receipt' + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
                 '<BR><BR>HRMPEB STUDENT CONFIRMATION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                Filename := SalesInv."No." + '.pdf';
                FileLocation := ExaminationSetup."Examination Path" + Filename;
                SalesHeader.Reset;
                SalesHeader.SetRange("No.", SalesInv."No.");
                if SalesHeader.FindSet then begin
                    Report.SaveAsPdf(1302, FileLocation, SalesHeader);
                end;
                EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                //SMTP.AddBCC(Email2);
                //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
                //SMTP.AppendToBody('<BR><BR>HRMPEB STUDENT CONFIRMATION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                // //SMTP.Send();
                Message(TXT001, SalesInv."No.");

            end
            else
                Error(TXT002, SalesInv."No.")
        end
        else
            Error(TXT002, SalesInvoiceHeader."No.")
    end;

    procedure ConfirmationCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
        CustLedgerEntry: Record "Cust. Ledger Entry";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExaminationAccount: Record "Examination Account";
        StudentProcessingLines: Record "Student Processing Lines";
    begin
        //code to post the created invoice
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Requestor No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.Find('-') then begin
            SalesPostYesNo.Run(SalesInv);
            Message('Invoice %1 has been posted Successfully', SalesInv."No.");
            CashMngmntSetup.Get();
            ExaminationSetup.Get;
            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode";
            ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code";
            ReceiptHeader.Insert(true);
            BulkProcessingHeader.CalcFields("Renewal Amount");
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines."Account No." := BulkProcessingHeader."Requestor No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            CustLedgerEntry.SetRange(Amount, BulkProcessingHeader."Renewal Amount");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;
            ReceiptLines.Insert(true);
            Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
        end;
        BulkProcessingHeader."Renewal Receipt No." := ReceiptHeader."No.";
        BulkProcessingHeader.Posted := true;
        BulkProcessingHeader."Posted By" := UserId;
        BulkProcessingHeader."Posted Date" := Today;
        BulkProcessingHeader."Posted On" := CurrentDatetime;
        BulkProcessingHeader.Modify(true);
        //ConfirmationSendReceipt(BulkProcessingHeader);
    end;

    procedure ConfirmationSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Receipts Header1";
        FileName1: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //Email2:='student_notifications@hrmpeb.or.ke';

        EmailMessage.Create(StudentProcessingHeader."Requested By E-Mail",
        COMPANYNAME + ' ' + 'STUDENT CONFIRMATION',
        'Dear ' + StudentProcessingHeader."Requested By Name" + ',<BR><BR>' +
        'Your confirmation request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        'Find attached the confirmation letter' + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
         '<BR><BR>EXAMINATION CONFIRMATION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        FileName := ReceiptHeader."No." + '.pdf';
        FileName1 := StudentProcessingHeader."No." + '.pdf';
        FileLocation := ExaminationSetup."Examination Path" + FileName;
        /*ReceiptHeader1.RESET;
        ReceiptHeader1.SETRANGE("No.",StudentProcessingHeader."Renewal Receipt No.");
        IF ReceiptHeader1.FINDSET THEN BEGIN
        //Report.SaveAsPdf(56003,FileLocation, ReceiptHeader1);
        END;*/
        Report.SaveAsPdf(85025, FileLocation, StudentProcessingHeader);
        EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
        // SMTP.AddAttachment(FileLocation+FileName1,FileName1);
        // SMTP.AddBCC(Email2);
        // SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        // SMTP.AppendToBody('<BR><BR>EXAMINATION CONFIRMATION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        // SMTP.Send();
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        //send receipt

    end;

    procedure ReinstatementCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        FileName: Text;
        FileLocation: Text;
        SalesHeader: Record "Sales Header";
        TXT001: label 'A sales invoice no %1,has already been processed for this application';
    begin
        SalesInv.Reset;
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not SalesInv.FindFirst then begin
            SalesInv."Document Type" := SalesInv."document type"::Invoice;
            SalesInv."No." := '';
            SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
            SalesInv."Document Date" := Today;
            SalesInv."Order Date" := Today;
            SalesInv."Posting Date" := Today;
            SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
            SalesInv."External Document No." := BulkProcessingHeader."No.";
            SalesInv.Type := SalesInv.Type::Normal;
            SalesInv."Prepayment %" := 100;//enforce prepayment`
            SalesInv.Insert(true);
            SalesLine.Init;
            SalesLine."Document Type" := SalesLine."document type"::Invoice;
            SalesLine."Document No." := SalesInv."No.";
            SalesLine.Type := SalesLine.Type::Resource;
            SalesLine."No." := BulkProcessingHeader."Fee Type";
            SalesLine.Validate("No.");
            SalesLine.Quantity := 1;
            SalesLine.Validate(Quantity);
            SalesLine."Unit Price" := BulkProcessingHeader."Reinstatement Amount";
            SalesLine.Validate("Unit Price");
            SalesLine.Insert(true);
            ReinstatementCReceipt(BulkProcessingHeader);
            BulkProcessingHeader."Application Invoice" := SalesInv."No.";
            BulkProcessingHeader.Modify;
        end else
            Error(TXT001, SalesInv."No.");
    end;

    procedure ReinstatementCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        CashMngmntSetup: Record "Cash Management Setup";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TXT001: label 'There is no unposted invoice for the application %1';
        ExaminationAccount: Record "Examination Account";
    begin
        //code to post the created invoice

        CashMngmntSetup.Get();
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.FindFirst then begin
            SalesPostYesNo.Run(SalesInv);
            Message('Invoice %1 has been posted Successfully', SalesInv."No.");

            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader.Insert(true);
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Re-instatement amount';
            ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;
            ReceiptLines.Insert(true);

            BulkProcessingHeader."Reinstatement Receipt No." := ReceiptHeader."No.";
            BulkProcessingHeader.Modify;
            //unblock the student
            ExaminationAccount.Reset;
            ExaminationAccount.SetRange("Registration No.", BulkProcessingHeader."Student Reg. No.");
            if ExaminationAccount.FindFirst then begin
                ExaminationAccount.Blocked := false;
                ExaminationAccount.Modify(true);
            end;
            //open the receipt card
            Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
        end else
            Error(TXT001, BulkProcessingHeader."No.");

        //send email receipt
    end;

    procedure ReinstatementSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Receipts Header1";
        FileName1: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Contact Email";

        EmailMessage.Create(StudentProcessingHeader.Email,
        COMPANYNAME + ' ' + 'STUDENT REINSTATEMENT',
        'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        'Your reinstatement has been confirmed.<BR>' +
        'Find attached the receipt' + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
       '<BR><BR>EXAMINATION DEPARTMENT.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        FileName := ReceiptHeader."No." + '.pdf';
        FileLocation := ExaminationSetup."Examination Path" + FileName;
        ReceiptHeader1.Reset;
        ReceiptHeader1.SetRange("No.", StudentProcessingHeader."Reinstatement Receipt No.");
        if ReceiptHeader1.FindSet then begin
            //Report.SaveAsPdf(56003, FileLocation, ReceiptHeader1);
        end;
        EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        // SMTP.AddBCC(Email2);
        // SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        // SMTP.AppendToBody('<BR><BR>EXAMINATION DEPARTMENT.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        // SMTP.Send();

        //send receipt
    end;


    procedure StudentPaymentApplication(CustLedgerEntry: Record "Cust. Ledger Entry")
    var
        TXT001: label 'Are you sure you want to apply the selected payments';
        DCustLedgEntry1: Record "Detailed Cust. Ledg. Entry";
        DCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        TotalAmount: Decimal;
        ApplicationAmount: Decimal;
        ApplicationInvoice: Code[50];
        SalesInv: Record "Sales Header";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        ProcessingHeader: Record "Student Processing Header";
        PostedInvoiceNo: Code[30];
        "No.": Integer;
        DCustLedgEntry3: Record "Detailed Cust. Ledg. Entry";
        CustLedgerEntry1: Record "Cust. Ledger Entry";
        PostedInvoiceNoEntry: Integer;
        DCustLedgEntry4: Record "Detailed Cust. Ledg. Entry";
        DCustLedgEntry5: Record "Detailed Cust. Ledg. Entry";
        CustLedgerEntry2: Record "Cust. Ledger Entry";
        TXT002: label 'Application for the document %1,has already been done.Kindly post it or Consult the System Administrator';
        CustLedgerEntry3: Record "Cust. Ledger Entry";
        SalesInv1: Record "Sales Header";
    begin
        //ensure the application is open
        //get the open application for student
        ProcessingHeader.Reset;
        ProcessingHeader.SetRange("Student No.", CustLedgerEntry."Customer No.");
        ProcessingHeader.SetRange(Posted, false);
        if ProcessingHeader.FindSet then begin
            repeat
                if (ProcessingHeader."Application Invoice" <> '') or (ProcessingHeader."Exemption Invoice No." <> '')
                  or (ProcessingHeader."Booking Invoice No." <> '') or (ProcessingHeader."Renewal Invoice No." <> '') then begin
                    if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Registration then begin
                        ApplicationInvoice := ProcessingHeader."Application Invoice";
                        ApplicationAmount := ProcessingHeader."Application Amount";
                    end;
                    if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Booking then begin
                        ProcessingHeader.CalcFields("Booking Amount");
                        ApplicationInvoice := ProcessingHeader."Booking Invoice No.";
                        ApplicationAmount := ProcessingHeader."Booking Amount";
                    end;
                    if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Exemption then begin
                        ProcessingHeader.CalcFields("Exemption Amount");
                        ApplicationInvoice := ProcessingHeader."Exemption Invoice No.";
                        ApplicationAmount := ProcessingHeader."Exemption Amount";
                    end;
                    if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Renewal then begin
                        ProcessingHeader.CalcFields("Renewal Amount");
                        ApplicationInvoice := ProcessingHeader."Renewal Invoice No.";
                        ApplicationAmount := ProcessingHeader."Renewal Amount";
                    end;
                    if ((ProcessingHeader."Document Type" = ProcessingHeader."document type"::Withdrawal) or (ProcessingHeader."Document Type" = ProcessingHeader."document type"::Defferment)) then begin
                        ApplicationInvoice := ProcessingHeader."Application Invoice";
                        ApplicationAmount := ProcessingHeader."Administrative Fees";
                    end;
                    if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Confirmation then begin
                        ProcessingHeader.CalcFields("Activation Amount");
                        ApplicationInvoice := ProcessingHeader."Activation Invoice No.";
                        ApplicationAmount := ProcessingHeader."Activation Amount"
                    end;

                    SalesInv.Reset;
                    SalesInv.SetRange("No.", ApplicationInvoice);
                    SalesInv.SetRange("Sell-to Customer No.", ProcessingHeader."Student No.");
                    SalesInv.SetRange("External Document No.", ProcessingHeader."No.");
                    if SalesInv.FindFirst then begin
                        SalesInv."Posting Date" := Today;
                        SalesInv.Modify(true);
                        Commit;
                        SalesInv1.Reset;
                        SalesInv1.SetRange("No.", SalesInv."No.");
                        if SalesInv1.FindFirst then begin
                            SalesPostYesNo.Run(SalesInv1);
                        end
                    end;
                    //get the posted invoice no
                    SalesInvoiceHeader.Reset;
                    SalesInvoiceHeader.SetRange("Sell-to Customer No.", CustLedgerEntry."Customer No.");
                    SalesInvoiceHeader.SetRange("External Document No.", ProcessingHeader."No.");
                    if SalesInvoiceHeader.FindFirst then begin

                        PostedInvoiceNo := SalesInvoiceHeader."No.";
                    end;
                    //get the customer ledger entry for the invoice
                    CustLedgerEntry1.Reset;
                    CustLedgerEntry1.SetRange("Customer No.", CustLedgerEntry."Customer No.");
                    CustLedgerEntry1.SetRange("External Document No.", ProcessingHeader."No.");
                    if CustLedgerEntry1.FindFirst then begin
                        CustLedgerEntry1.CalcFields(Amount);
                        PostedInvoiceNoEntry := CustLedgerEntry1."Entry No.";
                        if (CustLedgerEntry1.Amount = ApplicationAmount) or (CustLedgerEntry1.Amount > ApplicationAmount) then begin
                            CustLedgerEntry1.Open := false;
                            CustLedgerEntry1."Closed by Entry No." := "No." + 1;
                            CustLedgerEntry1."Closed at Date" := Today;
                            CustLedgerEntry1.Modify(true);

                        end;
                    end;

                    //copy detailed to
                    DCustLedgEntry3.Reset;
                    if DCustLedgEntry3.FindLast then
                        "No." := DCustLedgEntry3."Entry No.";

                    DCustLedgEntry.Reset;
                    DCustLedgEntry.SetRange("Document No.", PostedInvoiceNo);
                    if DCustLedgEntry.FindSet then begin

                        DCustLedgEntry1.TransferFields(DCustLedgEntry);
                        DCustLedgEntry1."Entry No." := "No." + 1;
                        DCustLedgEntry1."Entry Type" := DCustLedgEntry1."entry type"::Application;
                        DCustLedgEntry1."Applied Cust. Ledger Entry No." := PostedInvoiceNoEntry;
                        DCustLedgEntry1.Amount := -DCustLedgEntry.Amount;
                        DCustLedgEntry1."Amount (LCY)" := -DCustLedgEntry."Amount (LCY)";
                        DCustLedgEntry1.Insert(true);
                        //copy detailed to
                        DCustLedgEntry4.Reset;
                        DCustLedgEntry4.SetRange("Cust. Ledger Entry No.", CustLedgerEntry."Entry No.");
                        if DCustLedgEntry4.FindSet then begin

                            DCustLedgEntry5.TransferFields(DCustLedgEntry4);
                            DCustLedgEntry5."Entry No." := "No." + 2;
                            DCustLedgEntry5."Application No." := "No." + 1;
                            DCustLedgEntry5."Entry Type" := DCustLedgEntry1."entry type"::Application;
                            DCustLedgEntry5."Applied Cust. Ledger Entry No." := PostedInvoiceNoEntry;
                            DCustLedgEntry5.Amount := ApplicationAmount;
                            DCustLedgEntry5."Amount (LCY)" := ApplicationAmount;
                            DCustLedgEntry5.Insert(true);
                        end;

                    end;
                    //check amount
                    CustLedgerEntry.CalcFields(Amount);
                    CustLedgerEntry.CalcFields("Remaining Amount");
                    if (CustLedgerEntry.Amount = ApplicationAmount) or (CustLedgerEntry."Remaining Amount" = 0) then begin
                        CustLedgerEntry.Open := false;
                        CustLedgerEntry."Closed by Entry No." := "No." + 1;
                        CustLedgerEntry."Closed at Date" := Today;
                        CustLedgerEntry.Modify(true)
                    end;

                    //Check IF posted invoice remaining amount is 0
                    if PostedInvoiceNo <> '' then begin
                        CustLedgerEntry2.Reset;
                        CustLedgerEntry2.SetRange("Document No.", PostedInvoiceNo);
                        if CustLedgerEntry2.FindSet then begin
                            if CustLedgerEntry2.Open = false then begin
                                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Registration then begin
                                    ApplicationAssignRegistrationNo(ProcessingHeader);
                                    ProcessingHeader.Posted := true;
                                    ProcessingHeader."Posted By" := UserId;
                                    ProcessingHeader."Posted On" := CurrentDatetime;
                                    ProcessingHeader.Modify(true);
                                end;
                                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Booking then begin
                                    PostExaminationVoucher(ProcessingHeader);
                                    PostCenterBookingAllocation(ProcessingHeader);
                                    // BookingSendReceipt(ProcessingHeader);commented to test server speed

                                end;
                                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Exemption then begin
                                    PostExemptionVoucher(ProcessingHeader);
                                    //ExemptionSendReceipt(ProcessingHeader);
                                    //          IF ProcessingHeader.Posted=FALSE THEN BEGIN
                                    //          ProcessingHeader.Posted:=TRUE;
                                    //          ProcessingHeader."Posted By":=USERID;
                                    //          ProcessingHeader."Posted On":=CURRENTDATETIME;
                                    //          ProcessingHeader.MODIFY(TRUE);
                                    //          END;
                                end;
                                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Renewal then begin
                                    RenewalUpdateDetails(ProcessingHeader);
                                    //RenewalSendReceipt(ProcessingHeader);
                                    ProcessingHeader.Posted := true;
                                    ProcessingHeader."Posted By" := UserId;
                                    ProcessingHeader."Posted On" := CurrentDatetime;
                                    ProcessingHeader.Modify(true);
                                end;
                                if ((ProcessingHeader."Document Type" = ProcessingHeader."document type"::Exemption) or (ProcessingHeader."Document Type" = ProcessingHeader."document type"::Defferment)) then begin
                                    PostDefferalVoucher(ProcessingHeader);

                                end;
                                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Confirmation then begin
                                    ConfirmationSendReceipt(ProcessingHeader);
                                    ProcessingHeader.Posted := true;
                                    ProcessingHeader."Posted By" := UserId;
                                    ProcessingHeader."Posted On" := CurrentDatetime;
                                    ProcessingHeader.Modify(true);
                                end;
                            end
                        end;

                    end//invoice checker end
                end
            until ProcessingHeader.Next = 0;

        end
    end;

    procedure StudentSittingPapers(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        TXT001: label 'Student papers populated succesfully';
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        TXT002: label 'The student %1,has an existing processed booking %2';
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
    begin
        //check for reenwal amount and re-activation amount
        Window.Open('#Sourcing student papers...');
        //check if student has booking posted
        if BulkProcessingHeader."Additional Exemption" = false then begin
            BookingEntries2.Reset;
            BookingEntries2.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
            BookingEntries2.SetRange("Exam Sitting", BulkProcessingHeader."Examination Sitting");
            BookingEntries2.SetRange(Status, BookingEntries2.Status::Open);
            if BookingEntries2.FindFirst then begin
                Error(TXT002, BulkProcessingHeader."Student Reg. No.", BookingEntries2.Code);
                exit;
            end;
        end;
        //delete existing ones first
        StudentLines3.Reset;
        StudentLines3.SetRange("Booking Header No.", BulkProcessingHeader."No.");
        if StudentLines3.FindSet then begin
            StudentLines3.DeleteAll;
        end;

        //check for renewal amount
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", BulkProcessingHeader."Student Reg. No.");
        if ExaminationAccount.FindFirst then begin
            if ExaminationAccount."Renewal Amount" > 0 then begin
                StudentLines.Reset;
                if StudentLines.FindLast then begin
                    LineNo := StudentLines."Line No.";
                end;
                StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                StudentLines1."Line No." := LineNo + 1;
                StudentLines1."Transaction Type" := StudentLines1."transaction type"::Renewal;
                StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                StudentLines1.Validate("Student No.");
                StudentLines1.Description := Format(StudentLines1."document type"::Renewal);
                StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                StudentLines1.Amount := ExaminationAccount."Renewal Amount";
                StudentLines1."Amount LCY" := ExaminationAccount."Renewal Amount";
                StudentLines1.Insert(true);
            end;
        end;
        //check is exam sitting falls in a different financial year
        ExamSitting.Reset;
        ExamSitting.SetRange("Exam Sitting Cycle", BulkProcessingHeader."Examination Sitting");
        if ExamSitting.FindFirst then begin
            SittingMonth := Date2dwy(ExamSitting."Exam Start Date", 2);
            RegistrationMonth := Date2dwy(Today, 2);
            if ((SittingMonth > 7) and (RegistrationMonth < 7)) then begin
                //insert renewal fees
                StudentLines.Reset;
                if StudentLines.FindLast then begin
                    LineNo := StudentLines."Line No.";
                end;
                StudentLines1."Transaction Type" := StudentLines1."transaction type"::Renewal;
                StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                StudentLines1."Line No." := LineNo + 1;
                StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                StudentLines1.Validate("Student No.");
                StudentLines1.Description := Format(StudentLines1."document type"::Renewal);
                StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                // StudentLines1.Amount:=ExaminationAccount."Renewal Amount";
                //StudentLines1."Amount LCY":=ExaminationAccount."Renewal Amount";
                // StudentLines1.INSERT(TRUE);
            end;
        end;
        //check if any re-activation exists
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", BulkProcessingHeader."Student Reg. No.");
        if ExaminationAccount.FindFirst then begin
            if ExaminationAccount."Re-Activation Amount" > 0 then begin
                StudentLines.Reset;
                if StudentLines.FindLast then begin
                    LineNo := StudentLines."Line No.";
                end;
                StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                StudentLines1."Line No." := LineNo + 1;
                StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                StudentLines1.Validate("Student No.");
                StudentLines1.Description := Format(StudentLines1."document type"::"Re-Activation");
                StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                StudentLines1.Amount := ExaminationAccount."Re-Activation Amount";
                StudentLines1."Amount LCY" := ExaminationAccount."Re-Activation Amount";
                StudentLines1.Insert(true);
            end;
        end;
        //check if student has booking entries
        StartLevel := 1;
        BookingEntries.Reset;
        BookingEntries.SetRange(Examination, BulkProcessingHeader."Examination ID");
        BookingEntries.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
        //BookingEntries.SETFILTER(Status,'<>%1',BookingEntries.Status::Cancelled);
        BookingEntries.SetRange(Blocked, false);
        if not BookingEntries.FindSet then begin

            //ensure no exemption entries are present
            ExemptionEntries.Reset;
            ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
            ExemptionEntries.SetRange("Course Id", BulkProcessingHeader."Examination ID");
            ExemptionEntries.SetRange(Deleted, false);
            if not ExemptionEntries.FindSet then begin
                Level.Reset;
                Level.SetRange(Course, BulkProcessingHeader."Examination ID");
                Level.SetRange(Level, StartLevel);
                if Level.FindFirst then begin
                    Papers.Reset;
                    Papers.SetRange(Level, Level.Code);
                    Papers.SetRange(Blocked, false);
                    Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
                    if Papers.FindSet then begin
                        repeat
                            //check is paper already inserted

                            StudentLines2.Reset;
                            StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
                            StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                            StudentLines2.SetRange(Paper, Papers.Code);
                            if not StudentLines2.FindFirst then begin
                                //check if exempted
                                ExemptionEntries.Reset;
                                ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
                                ExemptionEntries.SetRange("No.", Papers.Code);
                                if not ExemptionEntries.FindFirst then begin
                                    //insert all papers
                                    StudentLines.Reset;
                                    if StudentLines.FindLast then begin
                                        LineNo := StudentLines."Line No.";
                                    end;
                                    StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                                    StudentLines1."Line No." := LineNo + 1;
                                    StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                    StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                    StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                                    StudentLines1.Validate("Student No.");
                                    StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                                    StudentLines1.Part := Level.Code;
                                    StudentLines1.Paper := Papers.Code;
                                    StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                    StudentLines1.Validate(Paper);
                                    StudentLines1.Insert(true);
                                    LineNo += 1;
                                end
                            end

                        until Papers.Next = 0;
                    end;//end of papers

                end //end of level
            end//end of exemtpion checker

            else begin

                Level.Reset;
                Level.SetRange(Course, BulkProcessingHeader."Examination ID");
                Level.SetCurrentkey(Level);
                Level.SetAscending(Level, true);
                if Level.FindSet then begin
                    repeat
                        PapersInserted := 0;
                        LevelNo := Level.Level;
                        if LevelNo > LevelNo1 then begin

                            ExemptionEntries1.Reset;
                            ExemptionEntries1.SetRange("Course Id", ExemptionEntries."Course Id");
                            ExemptionEntries1.SetRange("Stud. Reg. No", ExemptionEntries."Stud. Reg. No");
                            ExemptionEntries1.SetRange(Level, Level.Code);
                            ExemptionEntries1.SetRange(Deleted, false);
                            TotalExemption := ExemptionEntries1.Count;

                            Papers.Reset;
                            Papers.SetRange(Level, Level.Code);
                            Papers.SetRange(Blocked, false);
                            Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
                            TotalPapers := Papers.Count;

                            if TotalPapers = TotalExemption then begin

                                LevelNo1 := Level.Level + 1;
                                //insert papers that are in the next level
                                Level.Reset;
                                Level.SetRange(Course, BulkProcessingHeader."Examination ID");
                                Level.SetRange(Level, LevelNo1);
                                if Level.FindFirst then begin
                                    Papers.Reset;
                                    Papers.SetRange(Level, Level.Code);
                                    Papers.SetRange(Blocked, false);
                                    Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
                                    if Papers.FindSet then begin
                                        repeat
                                            //check is paper already inserted
                                            StudentLines2.Reset;
                                            StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
                                            StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                                            StudentLines2.SetRange(Paper, Papers.Code);
                                            if not StudentLines2.FindFirst then begin
                                                //check if exempted
                                                ExemptionEntries.Reset;
                                                ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
                                                ExemptionEntries.SetRange("No.", Papers.Code);
                                                ExemptionEntries.SetRange(Deleted, false);
                                                if not ExemptionEntries.FindFirst then begin
                                                    //insert all papers
                                                    StudentLines.Reset;
                                                    if StudentLines.FindLast then begin
                                                        LineNo := StudentLines."Line No.";
                                                    end;
                                                    StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                                                    StudentLines1."Line No." := LineNo + 1;
                                                    StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                                    StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                                    StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                                                    StudentLines1.Validate("Student No.");
                                                    StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                                                    StudentLines1.Part := Level.Code;
                                                    StudentLines1.Paper := Papers.Code;
                                                    StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                                    StudentLines1.Validate(Paper);
                                                    StudentLines1.Insert(true);
                                                    PapersInserted += 1;
                                                    LineNo += 1;
                                                end
                                            end;



                                        until Papers.Next = 0;
                                    end;
                                    exit;//end of papers

                                end;//end of level

                            end;



                            if TotalPapers > TotalExemption then begin

                                LevelNo1 := Level.Level;
                                //insert papers that are in the next level
                                Level.Reset;
                                Level.SetRange(Course, BulkProcessingHeader."Examination ID");
                                Level.SetRange(Level, LevelNo1);
                                if Level.FindFirst then begin
                                    Papers.Reset;
                                    Papers.SetRange(Level, Level.Code);
                                    Papers.SetRange(Blocked, false);
                                    Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
                                    if Papers.FindSet then begin
                                        repeat
                                            //check is paper already inserted
                                            StudentLines2.Reset;
                                            StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
                                            StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                                            StudentLines2.SetRange(Paper, Papers.Code);
                                            if not StudentLines2.FindFirst then begin
                                                //check if exempted
                                                ExemptionEntries.Reset;
                                                ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
                                                ExemptionEntries.SetRange("No.", Papers.Code);
                                                ExemptionEntries.SetRange(Deleted, false);
                                                if not ExemptionEntries.FindFirst then begin
                                                    //insert all papers
                                                    StudentLines.Reset;
                                                    if StudentLines.FindLast then begin
                                                        LineNo := StudentLines."Line No.";
                                                    end;
                                                    StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                                                    StudentLines1."Line No." := LineNo + 1;
                                                    StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                                    StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                                    StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                                                    StudentLines1.Validate("Student No.");
                                                    StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                                                    StudentLines1.Part := Level.Code;
                                                    StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                                    StudentLines1.Paper := Papers.Code;
                                                    StudentLines1.Validate(Paper);
                                                    StudentLines1.Insert(true);
                                                    LineNo += 1;
                                                end
                                            end;



                                        until Papers.Next = 0;
                                    end;
                                    exit;//end of papers
                                end;//end of level

                            end
                        end
                    until Level.Next = 0;

                end;


            end
        end //end of first logic
        else begin //start of  other student logic
                   //check if any level has failed papers

            Level.Reset;
            Level.SetRange(Course, BulkProcessingHeader."Examination ID");
            Level.SetCurrentkey(Level);
            Level.SetAscending(Level, false);
            if Level.FindSet then begin
                repeat

                    //get the levelno

                    LevelNo := Level.Level;
                    //check if student has failed any paper on the level
                    BookingEntries1.Reset;
                    BookingEntries1.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
                    BookingEntries1.SetRange(Examination, BulkProcessingHeader."Examination ID");
                    BookingEntries1.SetRange(Part, Level.Code);
                    BookingEntries1.SetRange(Blocked, false);
                    BookingEntries1.SetRange(Status, BookingEntries1.Status::Failed);
                    if BookingEntries1.FindSet then begin
                        repeat
                            //
                            Papers.Reset;
                            Papers.SetRange(Level, Level.Code);
                            Papers.SetRange(Code, BookingEntries1.Paper);
                            Papers.SetRange(Blocked, false);
                            if Papers.FindFirst then begin

                                StudentLines.Reset;
                                if StudentLines.FindLast then begin
                                    LineNo := StudentLines."Line No.";
                                end;
                                StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                                StudentLines1."Line No." := LineNo + 1;
                                StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                                StudentLines1.Validate("Student No.");
                                StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                                StudentLines1.Part := BookingEntries1.Part;
                                StudentLines1.Paper := BookingEntries1.Paper;
                                StudentLines1.Validate(Paper);
                                StudentLines1.Insert(true);
                                LineNo += 1;
                            end
                        until BookingEntries1.Next = 0;
                        //insert papers that student has not attempted in that level

                        Papers2.Reset;
                        Papers2.SetRange(Level, BookingEntries1.Part);
                        Papers2.SetRange(Course, BookingEntries1.Examination);
                        Papers2.SetRange(Blocked, false);
                        if Papers2.FindSet then begin
                            repeat

                                //check its not exempted
                                ExemptionEntries2.Reset;
                                ExemptionEntries2.SetRange("No.", Papers2.Code);
                                ExemptionEntries2.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
                                ExemptionEntries2.SetRange(Deleted, false);
                                if not ExemptionEntries2.FindFirst then begin //end check its not exempted
                                    BookingEntries3.Reset;
                                    BookingEntries3.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
                                    BookingEntries3.SetRange(Paper, Papers2.Code);
                                    BookingEntries3.SetRange(Blocked, false);
                                    // BookingEntries3.SETFILTER(Status,'<>%1',BookingEntries3.Status::Cancelled);
                                    if not BookingEntries3.FindFirst then begin
                                        //insert missing papers
                                        StudentLines.Reset;
                                        if StudentLines.FindLast then begin
                                            LineNo := StudentLines."Line No.";
                                        end;
                                        StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                                        StudentLines1."Line No." := LineNo + 1;
                                        StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                        StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                        StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                        StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                                        StudentLines1.Validate("Student No.");
                                        StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                                        StudentLines1.Part := BookingEntries1.Part;
                                        StudentLines1.Paper := Papers2.Code;
                                        StudentLines1.Validate(Paper);
                                        StudentLines1.Insert(true);
                                        LineNo += 1;
                                        //end insert missing papers
                                    end
                                end

                            until Papers2.Next = 0;
                        end;

                        exit;
                    end;//end of booking entries


                    //check if student has attempted the levels
                    // MESSAGE(Level.Code);
                    //check if student has passed any paper on the level
                    BookingEntries1.Reset;
                    BookingEntries1.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
                    BookingEntries1.SetRange(Examination, BulkProcessingHeader."Examination ID");
                    BookingEntries1.SetRange(Part, Level.Code);
                    BookingEntries1.SetRange(Blocked, false);
                    BookingEntries1.SetRange(Status, BookingEntries1.Status::Passed);
                    if BookingEntries1.FindSet then begin
                        Papers2.Reset;
                        Papers2.SetRange(Level, BookingEntries1.Part);
                        Papers2.SetRange(Course, BookingEntries1.Examination);
                        Papers2.SetRange(Blocked, false);
                        if Papers2.FindSet then begin
                            repeat

                                //check its not exempted
                                ExemptionEntries2.Reset;
                                ExemptionEntries2.SetRange("No.", Papers2.Code);
                                ExemptionEntries2.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
                                ExemptionEntries2.SetRange(Deleted, false);
                                if not ExemptionEntries2.FindFirst then begin //end check its not exempted
                                    BookingEntries3.Reset;
                                    BookingEntries3.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
                                    BookingEntries3.SetRange(Paper, Papers2.Code);
                                    BookingEntries3.SetRange(Blocked, false);
                                    // BookingEntries3.SETFILTER(Status,'<>%1',BookingEntries3.Status::Cancelled);
                                    if not BookingEntries3.FindFirst then begin
                                        //insert missing papers
                                        StudentLines.Reset;
                                        if StudentLines.FindLast then begin
                                            LineNo := StudentLines."Line No.";
                                        end;
                                        StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                                        StudentLines1."Line No." := LineNo + 1;
                                        StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                        StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                        StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                        StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                                        StudentLines1.Validate("Student No.");
                                        StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                                        StudentLines1.Part := BookingEntries1.Part;
                                        StudentLines1.Paper := Papers2.Code;
                                        StudentLines1.Validate(Paper);
                                        StudentLines1.Insert(true);
                                        LineNo += 1;
                                        //end insert missing papers
                                    end
                                end

                            until Papers2.Next = 0;
                        end;
                        exit;
                    end;
                    LevelNo := Level.Level;
                until Level.Next = 0;
            end;//end of level


            //checker for continuing students only
            BookingEntries.Reset;
            BookingEntries.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
            BookingEntries.SetFilter(Status, '<>%1', BookingEntries.Status::Cancelled);
            BookingEntries.SetRange(Blocked, false);
            if BookingEntries.FindLast then begin
                LevelNoCont := BookingEntries.Part;

                //insert papers for the level

                Level.Reset;
                Level.SetRange(Code, LevelNoCont);
                Level.SetRange(Course, BookingEntries.Examination);
                if Level.FindFirst then begin
                    LevelNo1 := Level.Level + 1;
                end;
                Level.Reset;
                Level.SetRange(Course, BookingEntries.Examination);
                Level.SetRange(Level, LevelNo1);
                if Level.FindFirst then begin
                    LevelNoCont := Level.Code;
                end;

                Papers.Reset;
                Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
                Papers.SetRange(Blocked, false);
                Papers.SetRange(Level, LevelNoCont);
                if Papers.FindSet then begin
                    repeat
                        //check is papers exist
                        StudentLines2.Reset;
                        StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
                        StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                        StudentLines2.SetRange(Paper, Papers.Code);
                        if not StudentLines2.FindFirst then begin
                            //check if exempted
                            ExemptionEntries.Reset;
                            ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
                            ExemptionEntries.SetRange("No.", Papers.Code);
                            ExemptionEntries.SetRange(Deleted, false);
                            if not ExemptionEntries.FindFirst then begin
                                LevelNo1 := LevelNo + 1;
                                StudentLines.Reset;
                                if StudentLines.FindLast then begin
                                    LineNo := StudentLines."Line No.";
                                end;
                                StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                                StudentLines1."Line No." := LineNo + 1;
                                StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                                StudentLines1.Validate("Student No.");
                                StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                                StudentLines1.Part := Level.Code;
                                StudentLines1.Paper := Papers.Code;
                                StudentLines1.Validate(Paper);
                                StudentLines1.Insert(true);
                                LineNo += 1;
                            end
                        end
                    until Papers.Next = 0;
                end;//end of papers

                exit;


            end;

            //end checker

            Sleep(1);
            Window.Close;
        end;
        //end of other logic
    end;


    procedure PostBankEntries(BankImportEntries: Record "Bank Import Entries")
    var
        BankImportEntries1: Record "Bank Import Entries";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        CMSetup: Record "Examination Setup";
        TotalAmount: Decimal;
        BankAccount: Record "Bank Account";
    begin
        if Confirm('Post Bank Entries for %1', false, BankImportEntries."Bank Code") = true then begin
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Bank Import Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Bank Import Batch Name");
            GenJnLine.DeleteAll;
            LineNo := 10;
            //check if bank is usd
            BankAccount.Reset;
            BankAccount.SetRange("No.", BankImportEntries."Bank Code");
            if BankAccount.FindFirst then begin
                if BankAccount."Currency Code" <> '' then begin
                    //individual lines for computation
                    BankImportEntries1.Reset;
                    BankImportEntries1.SetRange("Bank Code", BankImportEntries."Bank Code");
                    BankImportEntries1.SetRange(Posted, false);
                    if BankImportEntries1.FindSet then begin
                        repeat
                            //TotalAmount:=TotalAmount+BankImportEntries1.Amount;
                            GenJnLine.Init;
                            if CMSetup.Get then
                                GenJnLine."Journal Template Name" := CMSetup."Bank Import Template";
                            GenJnLine."Journal Batch Name" := CMSetup."Bank Import Batch Name";
                            GenJnLine."Line No." := LineNo + 10;
                            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
                            GenJnLine."Account No." := BankImportEntries1."Bank Code";
                            GenJnLine.Validate(GenJnLine."Account No.");
                            GenJnLine."Posting Date" := BankImportEntries1."Transaction Date";
                            GenJnLine."Document No." := Format(BankImportEntries."Entry No");
                            GenJnLine."External Document No." := BankImportEntries1."Reference No.";
                            GenJnLine.Description := BankImportEntries1."Student Name";
                            GenJnLine.Amount := BankImportEntries1.Amount;
                            GenJnLine.Validate(GenJnLine.Amount);
                            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"G/L Account";
                            GenJnLine."Bal. Account No." := CMSetup."Unnalocated Account";
                            GenJnLine.Validate("Bal. Account No.");
                            if GenJnLine.Amount <> 0 then
                                GenJnLine.Insert;
                            LineNo += 1;
                            BankImportEntries1.Posted := true;
                            BankImportEntries1.Modify(true);
                        until BankImportEntries1.Next = 0;
                    end;
                end
                else begin
                    //consolidated lines
                    BankImportEntries1.Reset;
                    BankImportEntries1.SetRange("Bank Code", BankImportEntries."Bank Code");
                    BankImportEntries1.SetRange(Posted, false);
                    if BankImportEntries1.FindSet then begin
                        repeat
                            TotalAmount := TotalAmount + BankImportEntries1.Amount;
                            GenJnLine.Init;
                            if CMSetup.Get then
                                GenJnLine."Journal Template Name" := CMSetup."Bank Import Template";
                            GenJnLine."Journal Batch Name" := CMSetup."Bank Import Batch Name";
                            GenJnLine."Line No." := LineNo + 10;
                            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
                            GenJnLine."Account No." := BankImportEntries1."Bank Code";
                            GenJnLine.Validate(GenJnLine."Account No.");
                            GenJnLine."Posting Date" := BankImportEntries1."Transaction Date";
                            GenJnLine."Document No." := Format(BankImportEntries."Entry No");
                            GenJnLine."External Document No." := BankImportEntries1."Reference No.";
                            GenJnLine.Description := BankImportEntries1."Student Name";
                            GenJnLine.Amount := BankImportEntries1.Amount;
                            GenJnLine.Validate(GenJnLine.Amount);
                            if GenJnLine.Amount <> 0 then
                                GenJnLine.Insert;
                            LineNo += 1;
                            BankImportEntries1.Posted := true;
                            BankImportEntries1.Modify(true);
                        until BankImportEntries1.Next = 0;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."Bank Import Template";
                        GenJnLine."Journal Batch Name" := CMSetup."Bank Import Batch Name";
                        GenJnLine."Line No." := LineNo + 10;
                        GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
                        GenJnLine."Account No." := CMSetup."Unnalocated Account";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        GenJnLine."Posting Date" := BankImportEntries1."Transaction Date";
                        GenJnLine."Document No." := Format(BankImportEntries."Entry No");
                        GenJnLine."External Document No." := BankImportEntries1."Reference No.";
                        GenJnLine.Description := 'Import on  ' + Format(BankImportEntries1."Transaction Date");
                        GenJnLine.Amount := -TotalAmount;
                        GenJnLine.Validate(GenJnLine.Amount);
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                        LineNo += 1;

                    end
                end;



                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            end;

        end
    end;


    procedure ApplyPaymentEntry(ProcessingHeader: Record "Student Processing Header")
    var
        BankImportEntries1: Record "Bank Import Entries";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        CMSetup: Record "Examination Setup";
        TotalAmount: Decimal;
        ApplicationAmount: Decimal;
        ApplicationInvoice: Code[50];
        SalesInv: Record "Sales Header";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        RegistrationNo: Code[30];
        TXT001: label 'The student account %1, has been created successfully';
        ExemptionEntries1: Record "Exemption Entries";
        ProcessingHeader1: Record "Student Processing Header";
        ProcessingHeader2: Record "Student Processing Header";
        InvoiceRemAmnt: Decimal;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Customer: Record Customer;
        GenJournalBatch: Record "Gen. Journal Batch";
        GenJournalBatch1: Record "Gen. Journal Batch";
        BatchName: Text;
        UserSetup: Record "User Setup";
        SalesInv1: Record "Sales Header";
    begin
        if Confirm('Apply payment for application %1', false, ProcessingHeader."No.") = true then begin
            //ensure the import entries have a value

            //check sales header if not posted
            SalesInv.Reset;
            SalesInv.SetRange("Sell-to Customer No.", ProcessingHeader."Student No.");
            SalesInv.SetRange("External Document No.", ProcessingHeader."No.");
            if SalesInv.FindFirst then begin
                SalesInv."Posting Date" := Today;
                SalesInv.Modify(true);
                Commit;
                SalesInv1.Reset;
                SalesInv1.SetRange("No.", SalesInv."No.");
                if SalesInv1.FindFirst then begin
                    SalesPostYesNo.Run(SalesInv1);
                end;

            end;


            InvoiceRemAmnt := 0;
            //get the remaining amount on the invoice
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", ProcessingHeader."No.");
            if CustLedgerEntry.FindFirst then begin
                CustLedgerEntry.CalcFields("Remaining Amount");
                InvoiceRemAmnt := CustLedgerEntry."Remaining Amount";
            end;
            if InvoiceRemAmnt = 0 then begin
                Customer.Reset;
                Customer.SetRange("No.", ProcessingHeader."Student No.");
                if Customer.FindFirst then begin
                    Customer.CalcFields(Balance);
                    if Customer.Balance < 0 then begin
                        InvoiceRemAmnt := Customer.Balance;
                    end;
                end;
            end;
            //get amount by document type
            if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Registration then begin
                ApplicationAmount := ProcessingHeader."Application Amount";
                ApplicationInvoice := ProcessingHeader."Application Invoice";
            end;
            if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Booking then begin
                ProcessingHeader.CalcFields("Booking Amount");
                ApplicationAmount := ProcessingHeader."Booking Amount";
                ApplicationInvoice := ProcessingHeader."Booking Invoice No.";
            end;
            if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Exemption then begin
                ProcessingHeader.CalcFields("Exemption Amount");
                ApplicationAmount := ProcessingHeader."Exemption Amount";
                ApplicationInvoice := ProcessingHeader."Exemption Invoice No.";
            end;
            if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Renewal then begin
                ProcessingHeader.CalcFields("Renewal Amount");
                ApplicationAmount := ProcessingHeader."Renewal Amount";
                ApplicationInvoice := ProcessingHeader."Renewal Invoice No.";
            end;
            if ((ProcessingHeader."Document Type" = ProcessingHeader."document type"::Defferment) or (ProcessingHeader."Document Type" = ProcessingHeader."document type"::Withdrawal)) then begin

                ApplicationAmount := ProcessingHeader."Administrative Fees";
                ApplicationInvoice := ProcessingHeader."Application Invoice";
            end;


            CMSetup.Get;

            UserSetup.Reset;
            if UserSetup.Get(UserId) then begin
                if UserSetup."Employee No." <> '' then begin
                    // //get user id batch
                    GenJournalBatch.Reset;
                    GenJournalBatch.SetRange("Journal Template Name", CMSetup."Student Allocation Template");
                    GenJournalBatch.SetRange("User ID", UserId);
                    if not GenJournalBatch.FindFirst then begin
                        //create new  batch
                        GenJournalBatch1."Journal Template Name" := CMSetup."Student Allocation Template";
                        GenJournalBatch1.Name := Format(UserSetup."Resource No", 10);
                        ;
                        GenJournalBatch1."User ID" := UserId;
                        GenJournalBatch1.Insert(true);
                        BatchName := Format(UserSetup."Resource No", 10);
                    end else begin
                        BatchName := GenJournalBatch.Name;
                    end;
                end else
                    BatchName := CMSetup."Student Allocation Batch Name";
            end else
                BatchName := CMSetup."Student Allocation Batch Name";
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Student Allocation Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", BatchName);
            GenJnLine.DeleteAll;
            LineNo := 10;
            BankImportEntries1.Reset;
            BankImportEntries1.SetRange("Reference No.", ProcessingHeader."Payment Reference No.");
            BankImportEntries1.SetRange(Closed, false);
            if BankImportEntries1.FindFirst then begin
                GenJnLine.Init;
                GenJnLine."Journal Template Name" := CMSetup."Student Allocation Template";
                GenJnLine."Journal Batch Name" := BatchName;
                GenJnLine."Line No." := LineNo + 10;
                GenJnLine."Account Type" := GenJnLine."account type"::Customer;
                GenJnLine."Account No." := ProcessingHeader."Student No.";
                GenJnLine.Validate(GenJnLine."Account No.");
                GenJnLine."Posting Date" := Today;
                //added for Currency applications
                GenJnLine."Currency Code" := ProcessingHeader."Currency Code";
                GenJnLine.Validate(GenJnLine."Currency Code");
                GenJnLine."Document No." := ProcessingHeader."No.";
                ;
                GenJnLine."External Document No." := BankImportEntries1."Reference No.";
                GenJnLine.Description := 'Application for ' + ProcessingHeader."Student Name";

                GenJnLine."Bal. Account Type" := GenJnLine."account type"::"G/L Account";
                GenJnLine."Bal. Account No." := CMSetup."Unnalocated Account";
                if BankImportEntries1."Remaining Amount" > ApplicationAmount then begin
                    GenJnLine.Amount := -ApplicationAmount;
                end;
                if (BankImportEntries1."Remaining Amount" < ApplicationAmount) or (BankImportEntries1."Remaining Amount" = ApplicationAmount) then begin
                    GenJnLine.Amount := -BankImportEntries1."Remaining Amount";
                end;

                GenJnLine.Validate(GenJnLine.Amount);
                //GET THE Invoice posted
                SalesInvoiceHeader.Reset;
                SalesInvoiceHeader.SetRange("Sell-to Customer No.", ProcessingHeader."Student No.");
                SalesInvoiceHeader.SetRange("External Document No.", ProcessingHeader."No.");
                SalesInvoiceHeader.SetRange(Closed, false);
                if SalesInvoiceHeader.FindFirst then begin
                    GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                    GenJnLine."Applies-to Doc. No." := SalesInvoiceHeader."No.";
                    GenJnLine.Validate("Applies-to Doc. No.");
                end;

                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;

                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

                Commit;





                //check with remaining amount

                if ((BankImportEntries1."Remaining Amount" > ApplicationAmount) or (BankImportEntries1."Remaining Amount" = ApplicationAmount)) then begin
                    //registration
                    if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Registration then begin
                        RegistrationNo := ApplicationAssignRegistrationNo(ProcessingHeader);
                        Message(TXT001, RegistrationNo);
                        //mark document as posted
                        ProcessingHeader.Posted := true;
                        ProcessingHeader."Posted By" := UserId;
                        ProcessingHeader."Posted On" := CurrentDatetime;
                        ProcessingHeader."Posted Date" := Today;
                        ProcessingHeader.Modify(true);

                    end;
                    //booking
                    if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Booking then begin

                        PostExaminationVoucher(ProcessingHeader);
                        Commit;

                        PostCenterBookingAllocation(ProcessingHeader);

                        ProcessingHeader1.Reset;
                        ProcessingHeader1.SetRange("No.", ProcessingHeader."No.");
                        if ProcessingHeader1.FindFirst then begin
                            //BookingSendReceipt(ProcessingHeader1);commented to test server speed 08/02/2022
                        end;
                    end;
                    //exemption
                    if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Exemption then begin
                        ExemptionEntries1.Reset;
                        ExemptionEntries1.SetRange("Exemption Voucher No.", ProcessingHeader."No.");
                        if not ExemptionEntries1.FindSet then begin
                            PostExemptionVoucher(ProcessingHeader);
                        end;
                        ProcessingHeader.Posted := true;
                        ProcessingHeader."Posted By" := UserId;
                        ProcessingHeader."Posted Date" := Today;
                        ProcessingHeader."Posted On" := CurrentDatetime;
                        ProcessingHeader.Modify(true);
                    end;
                    //exemption on balance
                    if ((Abs(InvoiceRemAmnt) <> 0) and (BankImportEntries1."Remaining Amount" = Abs(InvoiceRemAmnt))) then begin
                        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Exemption then begin
                            ExemptionEntries1.Reset;
                            ExemptionEntries1.SetRange("Exemption Voucher No.", ProcessingHeader."No.");
                            if not ExemptionEntries1.FindSet then begin
                                PostExemptionVoucher(ProcessingHeader);
                            end;
                            ProcessingHeader.Posted := true;
                            ProcessingHeader."Posted By" := UserId;
                            ProcessingHeader."Posted Date" := Today;
                            ProcessingHeader."Posted On" := CurrentDatetime;
                            ProcessingHeader.Modify(true);
                        end;
                    end;
                    //renewal
                    if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Renewal then begin
                        RenewalUpdateDetails(ProcessingHeader);
                        ProcessingHeader.Posted := true;
                        ProcessingHeader."Posted By" := UserId;
                        ProcessingHeader."Posted Date" := Today;
                        ProcessingHeader."Posted On" := CurrentDatetime;
                        ProcessingHeader.Modify(true);

                    end;
                    if ((ProcessingHeader."Document Type" = ProcessingHeader."document type"::Defferment) or (ProcessingHeader."Document Type" = ProcessingHeader."document type"::Withdrawal)) then begin
                        PostDefferalVoucher(ProcessingHeader);


                    end;

                    if BankImportEntries1."Remaining Amount" = ApplicationAmount then
                        BankImportEntries1.Closed := true;
                    BankImportEntries1."Applied Amount" := ApplicationAmount;
                    BankImportEntries1."Remaining Amount" := BankImportEntries1."Remaining Amount" - ApplicationAmount;
                    BankImportEntries1.Modify(true);
                end
                else begin

                    BankImportEntries1.Closed := true;
                    BankImportEntries1."Applied Amount" := ApplicationAmount;
                    BankImportEntries1."Remaining Amount" := BankImportEntries1."Remaining Amount" - ApplicationAmount;
                    BankImportEntries1.Modify(true);
                    ProcessingHeader."Payment Remaining Amount" := ApplicationAmount - BankImportEntries1."Remaining Amount";
                    ProcessingHeader.Modify(true);
                    //update remaining amount

                end

            end;
            //find entry and mark as closed

        end;
    end;


    procedure PostStudentReceipt(ReceiptRec: Record "Receipts Header1")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        ExaminationSetup: Record "Examination Setup";
        TransactionType: Record "Miscellaneous Transaction Type";
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInv1: Record "Sales Header";
    begin
        if Confirm('Post Receipt', false, ReceiptRec."No.") = true then begin

            if ReceiptRec.Posted = true then
                Error('Already Posted', ReceiptRec."No.");
            ReceiptRec.TestField(Date);
            ReceiptRec.TestField("Bank Code");
            ReceiptRec.TestField("Received From");
            ReceiptRec.TestField("Pay Mode");

            if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
                ReceiptRec.TestField("Cheque No");
                ReceiptRec.TestField("Cheque Date");
            end;

            ReceiptRec.CalcFields(Amount);
            //Check Lines
            if ReceiptRec.Amount = 0 then
                Error('Amount cannot be zero');
            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            if not RcptLines.FindLast then
                Error('Receipt Lines cannot be empty');

            ExaminationSetup.Get;
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", ExaminationSetup."Student Receipt Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", ExaminationSetup."Student Receipt Batch Name");
            GenJnLine.DeleteAll;



            //Bank Entries
            LineNo := LineNo + 10000;

            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            RcptLines.Validate(Amount);
            RcptLines.CalcSums(Amount);



            GenJnLine.Init;
            if ExaminationSetup.Get then
                GenJnLine."Journal Template Name" := ExaminationSetup."Student Receipt Template";
            GenJnLine."Journal Batch Name" := ExaminationSetup."Student Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := ReceiptRec."Bank Code";
            GenJnLine.Validate(GenJnLine."Account No.");
            if ReceiptRec.Date = 0D then
                Error('You must specify the Receipt date');
            GenJnLine."Posting Date" := ReceiptRec."Posted Date";
            GenJnLine."Document No." := ReceiptRec."No.";
            GenJnLine."External Document No." := ReceiptRec."Cheque No";
            GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
            GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
            GenJnLine.Amount := ReceiptRec.Amount;
            GenJnLine."Currency Code" := ReceiptRec."Currency Code";
            GenJnLine.Validate("Currency Code");
            GenJnLine."Currency Factor" := ReceiptRec."Currency Factor";
            GenJnLine.Validate("Currency Factor");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //Receipt Lines Entries
            RcptLines.Reset;
            RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
            if RcptLines.FindSet then begin
                repeat
                    //create and post a sales invoice
                    TransactionType.Reset;
                    TransactionType.SetRange(Code, RcptLines."Transaction Type");
                    if TransactionType.FindFirst then begin
                        TransactionType.TestField(Resource);
                        //
                        SalesInvoiceHeader.Reset;
                        SalesInvoiceHeader.SetRange("External Document No.", ReceiptRec."No." + ' ' + Format(RcptLines."Line No"));
                        if not SalesInvoiceHeader.FindSet then begin

                            SalesInv.Reset;
                            SalesInv.SetRange("External Document No.", ReceiptRec."No." + ' ' + Format(RcptLines."Line No"));
                            if not SalesInv.FindFirst then begin
                                SalesInv."Document Type" := SalesInv."document type"::Invoice;
                                SalesInv."No." := '';
                                SalesInv.Validate(SalesInv."Sell-to Customer No.", RcptLines."Account No.");
                                SalesInv."Document Date" := ReceiptRec."Posted Date";
                                SalesInv."Order Date" := ReceiptRec."Posted Date";
                                SalesInv."Currency Code" := ReceiptRec."Currency Code";
                                SalesInv.Validate("Currency Code");
                                SalesInv."Posting Date" := ReceiptRec."Posted Date";
                                SalesInv."External Document No." := ReceiptRec."No." + ' ' + Format(RcptLines."Line No");
                                SalesInv."Registration No." := RcptLines."Registration No.";
                                SalesInv.Type := SalesInv.Type::Normal;
                                SalesInv."Prepayment %" := 100;//enforce prepayment`
                                SalesInv.Insert(true);
                                SalesLine.Init;
                                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                                SalesLine."Document No." := SalesInv."No.";
                                SalesLine.Type := SalesLine.Type::Resource;
                                SalesLine."No." := TransactionType.Resource;
                                SalesLine.Validate("No.");
                                SalesLine.Quantity := 1;
                                SalesLine.Validate(Quantity);
                                SalesLine."Unit Price" := RcptLines.Amount;
                                SalesLine.Validate("Unit Price");
                                SalesLine.Insert(true);
                            end;
                            SalesInv."Posting Date" := Today;
                            SalesInv.Modify(true);
                            Commit;
                            SalesInv1.Reset;
                            SalesInv1.SetRange("No.", SalesInv."No.");
                            if SalesInv1.FindFirst then begin
                                SalesPostYesNo.Run(SalesInv1);
                            end;


                        end;
                    end;
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if ExaminationSetup.Get then
                        GenJnLine."Journal Template Name" := ExaminationSetup."Student Receipt Template";
                    GenJnLine."Journal Batch Name" := ExaminationSetup."Student Receipt Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := ReceiptRec."Posted Date";
                    GenJnLine."Document No." := ReceiptRec."No.";
                    GenJnLine."External Document No." := ReceiptRec."Cheque No";
                    GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                    GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                    GenJnLine.Amount := -RcptLines.Amount;
                    //get posted invoice number
                    CustLedgerEntry.Reset;
                    CustLedgerEntry.SetRange("Customer No.", RcptLines."Account No.");
                    CustLedgerEntry.SetRange("External Document No.", ReceiptRec."No." + ' ' + Format(RcptLines."Line No"));
                    CustLedgerEntry.SetFilter("Remaining Amount", '>%1', 0);
                    if CustLedgerEntry.FindFirst then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := CustLedgerEntry."Document No.";
                        GenJnLine.Validate("Applies-to Doc. No.");
                    end;

                    GenJnLine."Currency Code" := ReceiptRec."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine."Currency Factor" := ReceiptRec."Currency Factor";
                    GenJnLine.Validate("Currency Factor");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                    //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                    //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");
                    if GenJnLine."Applies-to Doc. No." <> '' then begin
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    end
                until RcptLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                ReceiptRec.Posted := true;
                ReceiptRec."Posted By" := UserId;
                ReceiptRec."Posted Date" := ReceiptRec."Posted Date";
                ReceiptRec."Posted Time" := Time;
                ReceiptRec.Modify;

            end;

        end;
    end;


    procedure ApplyMiscPaymentEntry(Receipts: Record "Receipts Header1")
    var
        BankImportEntries1: Record "Bank Import Entries";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        CMSetup: Record "Examination Setup";
        TotalAmount: Decimal;
        ApplicationAmount: Decimal;
        ApplicationInvoice: Code[50];
        SalesInv: Record "Sales Header";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Lines: Record "Receipt Lines1";
        "CustNo.": Code[30];
        TransactionType: Record "Miscellaneous Transaction Type";
        SalesLine: Record "Sales Line";
        SalesInv1: Record "Sales Header";
    begin
        if Confirm('Apply payment for application %1', false, Receipts."No.") = true then begin
            //check sales header if not posted
            Receipts.CalcFields(Amount);
            ApplicationAmount := Receipts.Amount - Receipts."Remaining Amount";
            Lines.Reset;
            Lines.SetRange("Receipt No.", Receipts."No.");
            if Lines.FindSet then begin
                repeat
                    "CustNo." := Lines."Account No.";

                    //create invoice

                    TransactionType.Reset;
                    TransactionType.SetRange(Code, Lines."Transaction Type");
                    if TransactionType.FindFirst then begin
                        TransactionType.TestField(Resource);
                        SalesInv.Reset;
                        SalesInv.SetRange("External Document No.", Receipts."No." + ' ' + Format(Lines."Line No"));
                        if not SalesInv.FindFirst then begin
                            SalesInv."Document Type" := SalesInv."document type"::Invoice;
                            SalesInv."No." := '';
                            SalesInv.Validate(SalesInv."Sell-to Customer No.", Lines."Account No.");
                            SalesInv."Document Date" := Today;
                            SalesInv."Order Date" := Today;
                            SalesInv."Posting Date" := Today;
                            SalesInv."External Document No." := Receipts."No." + ' ' + Format(Lines."Line No");
                            SalesInv."Registration No." := Lines."Registration No.";
                            SalesInv.Type := SalesInv.Type::Normal;
                            SalesInv."Prepayment %" := 100;//enforce prepayment`
                            SalesInv.Insert(true);
                            SalesLine.Init;
                            SalesLine."Document Type" := SalesLine."document type"::Invoice;
                            SalesLine."Document No." := SalesInv."No.";
                            SalesLine.Type := SalesLine.Type::Resource;
                            SalesLine."No." := TransactionType.Resource;
                            SalesLine.Validate("No.");
                            SalesLine.Quantity := 1;
                            SalesLine.Validate(Quantity);
                            SalesLine."Unit Price" := Lines."Amount (LCY)";
                            SalesLine.Validate("Unit Price");
                            SalesLine.Insert(true);
                        end;
                        SalesInv."Posting Date" := Today;
                        SalesInv.Modify(true);
                        Commit;
                        SalesInv1.Reset;
                        SalesInv1.SetRange("No.", SalesInv."No.");
                        if SalesInv1.FindFirst then begin
                            SalesPostYesNo.Run(SalesInv1);
                        end;




                        CMSetup.Get;
                        // Delete Lines Present on the General Journal Line
                        GenJnLine.Reset;
                        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Student Allocation Template");
                        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Student Allocation Batch Name");
                        GenJnLine.DeleteAll;
                        LineNo := 10;
                        BankImportEntries1.Reset;
                        BankImportEntries1.SetRange("Reference No.", Receipts."Payment Reference No.");
                        if BankImportEntries1.FindFirst then begin
                            GenJnLine.Init;
                            GenJnLine."Journal Template Name" := CMSetup."Student Allocation Template";
                            GenJnLine."Journal Batch Name" := CMSetup."Student Allocation Batch Name";
                            GenJnLine."Line No." := LineNo + 10;
                            GenJnLine."Account Type" := GenJnLine."account type"::Customer;
                            GenJnLine."Account No." := "CustNo.";
                            GenJnLine.Validate(GenJnLine."Account No.");
                            GenJnLine."Posting Date" := Today;
                            GenJnLine."Document No." := Receipts."No.";
                            ;
                            GenJnLine."External Document No." := BankImportEntries1."Reference No.";
                            GenJnLine.Description := Format('Application for ' + Lines.Description, 50);
                            GenJnLine.Amount := -ApplicationAmount;
                            GenJnLine.Validate(GenJnLine.Amount);
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                            //GET THE Invoice posted
                            SalesInvoiceHeader.Reset;
                            SalesInvoiceHeader.SetRange("Sell-to Customer No.", "CustNo.");
                            SalesInvoiceHeader.SetRange("External Document No.", Receipts."No.");
                            SalesInvoiceHeader.SetRange(Closed, false);
                            if SalesInvoiceHeader.FindFirst then begin
                                GenJnLine."Applies-to Doc. No." := SalesInvoiceHeader."No.";
                                GenJnLine.Validate("Applies-to Doc. No.");
                            end;
                            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"G/L Account";
                            GenJnLine."Bal. Account No." := CMSetup."Unnalocated Account";
                            if GenJnLine.Amount <> 0 then
                                GenJnLine.Insert;

                            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

                            Commit;
                        end
                    end
                until Lines.Next = 0;
                if BankImportEntries1.Amount = ApplicationAmount then begin
                    BankImportEntries1.Closed := true;
                    BankImportEntries1."Applied Amount" := ApplicationAmount;
                    BankImportEntries1."Remaining Amount" := BankImportEntries1.Amount - ApplicationAmount;
                    BankImportEntries1.Modify(true);
                    Receipts.Posted := true;
                    Receipts."Posted By" := UserId;
                    Receipts."Posted Date" := Today;
                    Receipts."Posted Time" := Time;
                    Receipts.Modify(true);
                end;
                if BankImportEntries1.Amount > ApplicationAmount then begin

                    BankImportEntries1."Applied Amount" := ApplicationAmount;
                    BankImportEntries1."Remaining Amount" := BankImportEntries1.Amount - ApplicationAmount;
                    BankImportEntries1.Modify(true);
                    Receipts.Posted := true;
                    Receipts."Posted By" := UserId;
                    Receipts."Posted Date" := Today;
                    Receipts."Posted Time" := Time;
                    Receipts.Modify(true);
                end;
                if BankImportEntries1.Amount < ApplicationAmount then begin
                    BankImportEntries1.Closed := true;
                    BankImportEntries1."Applied Amount" := ApplicationAmount;
                    BankImportEntries1.Modify(true);
                    Receipts."Remaining Amount" := Receipts.Amount - BankImportEntries1.Amount;
                    Receipts.Modify(true);
                end;




            end

        end;

    end;


    procedure ApplyMiscMPESAPaymentEntry(Receipts: Record "Receipts Header1")
    var
        BankImportEntries1: Record "MPESA Integration Table";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        CMSetup: Record "Examination Setup";
        TotalAmount: Decimal;
        ApplicationAmount: Decimal;
        ApplicationInvoice: Code[50];
        SalesInv: Record "Sales Header";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Lines: Record "Receipt Lines1";
        "CustNo.": Code[30];
        TransactionType: Record "Miscellaneous Transaction Type";
        SalesLine: Record "Sales Line";
        ExtDocNo: Code[50];
        SalesInv1: Record "Sales Header";
    begin
        if Confirm('Apply payment for application %1', false, Receipts."No.") = true then begin
            //check sales header if not posted
            Receipts.CalcFields(Amount);
            ApplicationAmount := Receipts.Amount - Receipts."Remaining Amount";
            Lines.Reset;
            Lines.SetRange("Receipt No.", Receipts."No.");
            if Lines.FindSet then begin
                repeat
                    "CustNo." := Lines."Account No.";
                    //create invoice

                    TransactionType.Reset;
                    TransactionType.SetRange(Code, Lines."Transaction Type");
                    if TransactionType.FindFirst then begin
                        TransactionType.TestField(Resource);
                        //check invoice
                        SalesInvoiceHeader.Reset;
                        SalesInvoiceHeader.SetRange("External Document No.", Receipts."No." + ' ' + Format(Lines."Line No"));
                        if not SalesInvoiceHeader.FindSet then begin
                            SalesInv.Reset;
                            SalesInv.SetRange("External Document No.", Receipts."No." + ' ' + Format(Lines."Line No"));
                            if not SalesInv.FindFirst then begin
                                SalesInv."Document Type" := SalesInv."document type"::Invoice;
                                SalesInv."No." := '';
                                SalesInv.Validate(SalesInv."Sell-to Customer No.", Lines."Account No.");
                                SalesInv."Document Date" := Today;
                                SalesInv."Order Date" := Today;
                                SalesInv."Posting Date" := Today;
                                SalesInv."External Document No." := Receipts."No." + ' ' + Format(Lines."Line No");
                                ExtDocNo := Receipts."No." + ' ' + Format(Lines."Line No");
                                ;
                                SalesInv."Registration No." := Lines."Registration No.";
                                SalesInv.Type := SalesInv.Type::Normal;
                                SalesInv."Prepayment %" := 100;//enforce prepayment`
                                SalesInv.Insert(true);
                                SalesLine.Init;
                                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                                SalesLine."Document No." := SalesInv."No.";
                                SalesLine.Type := SalesLine.Type::Resource;
                                SalesLine."No." := TransactionType.Resource;
                                SalesLine.Validate("No.");
                                SalesLine.Quantity := 1;
                                SalesLine.Validate(Quantity);
                                SalesLine."Unit Price" := Lines."Amount (LCY)";
                                SalesLine.Validate("Unit Price");
                                SalesLine.Insert(true);
                            end;
                            SalesInv."Posting Date" := Today;
                            SalesInv.Modify(true);
                            Commit;
                            SalesInv1.Reset;
                            SalesInv1.SetRange("No.", SalesInv."No.");
                            if SalesInv1.FindFirst then begin
                                SalesPostYesNo.Run(SalesInv1);
                            end;


                        end;
                    end
                until Lines.Next = 0;
                //create and post receipt
                CMSetup.Get;
                // Delete Lines Present on the General Journal Line
                GenJnLine.Reset;
                GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Student Allocation Template");
                GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Student Allocation Batch Name");
                GenJnLine.DeleteAll;
                LineNo := 10;
                BankImportEntries1.Reset;
                BankImportEntries1.SetRange(MPESA_TXN_ID, Receipts."Payment Reference No.");
                BankImportEntries1.SetRange(Fetch, false);
                if BankImportEntries1.FindFirst then begin
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Student Allocation Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Student Allocation Batch Name";
                    GenJnLine."Line No." := LineNo + 10;
                    GenJnLine."Account Type" := GenJnLine."account type"::Customer;
                    GenJnLine."Account No." := "CustNo.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := Today;
                    GenJnLine."Document No." := Receipts."No.";
                    ;
                    GenJnLine."External Document No." := BankImportEntries1.MPESA_TXN_ID;
                    GenJnLine.Description := Format('Received from ' + Lines."Account Name", 50);
                    GenJnLine.Amount := -BankImportEntries1.MPESA_AMOUNT;
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                    //GET THE Invoice posted
                    SalesInvoiceHeader.Reset;
                    SalesInvoiceHeader.SetRange("Sell-to Customer No.", "CustNo.");
                    SalesInvoiceHeader.SetRange("External Document No.", ExtDocNo);
                    SalesInvoiceHeader.SetRange(Closed, false);
                    if SalesInvoiceHeader.FindFirst then begin
                        GenJnLine."Applies-to Doc. No." := ExtDocNo;
                        GenJnLine.Validate("Applies-to Doc. No.");
                    end;
                    GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
                    GenJnLine."Bal. Account No." := Receipts."Bank Code";
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                    if GenJnLine.Amount <> 0 then begin
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
                    end else
                        exit;
                    Commit;
                    if BankImportEntries1.MPESA_AMOUNT = ApplicationAmount then begin
                        Receipts.Posted := true;
                        Receipts."Posted By" := UserId;
                        Receipts."Posted Date" := Today;
                        Receipts."Posted Time" := Time;
                        Receipts.Modify(true);
                    end;
                    if BankImportEntries1.MPESA_AMOUNT > ApplicationAmount then begin
                        Receipts.Posted := true;
                        Receipts."Posted By" := UserId;
                        Receipts."Posted Date" := Today;
                        Receipts."Posted Time" := Time;
                        Receipts.Modify(true);
                    end;
                    if BankImportEntries1.MPESA_AMOUNT < ApplicationAmount then begin

                        Receipts."Remaining Amount" := Receipts.Amount - BankImportEntries1.MPESA_AMOUNT;
                        Receipts.Modify(true);
                    end;
                    BankImportEntries1.Fetch := true;
                    BankImportEntries1."Applied Amount" := BankImportEntries1.MPESA_AMOUNT;
                    BankImportEntries1.Modify(true);

                end;
            end;
        end
    end;


    procedure MPESAApplyPaymentEntry(ProcessingHeader: Record "Student Processing Header")
    var
        MPESAEntry: Record "MPESA Integration Table";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        CMSetup: Record "Examination Setup";
        TotalAmount: Decimal;
        ApplicationAmount: Decimal;
        ApplicationInvoice: Code[50];
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        ExaminationSetup: Record "Examination Setup";
        PaymentsPost: Codeunit "Payments-Post";
        Studentmanagement: Codeunit "Student management";
        ReceiptHeader1: Record "Receipts Header1";
        RcptNo: Code[30];
        ExamBookingEntries: Record "Exam Booking Entries";
        ExamSittingCycle: Record "Exam Sitting Cycle";
        EntryNo: Integer;
        ExamBookingEntries1: Record "Exam Booking Entries";
        ReceiptHeader2: Record "Receipts Header1";
        MPESAEntry1: Record "MPESA Integration Table";
        SalesInvoiceHeader1: Record "Sales Invoice Header";
        SalesInv1: Record "Sales Header";
        TXT001: label 'Kindly process an invoice for the document %1';
    begin

        //check if the mpesa has been utilized;

        ReceiptHeader2.Reset;
        ReceiptHeader2.SetRange("Payment Reference", ProcessingHeader."Payment Reference No.");
        if ReceiptHeader2.FindFirst then begin
            MPESAEntry1.Reset;
            MPESAEntry1.SetRange(MPESA_TXN_ID, ReceiptHeader2."Payment Reference");
            if MPESAEntry1.FindFirst then begin
                MPESAEntry1.Fetch := true;
                MPESAEntry1."Remaining Amount" := 0;
                MPESAEntry1."Applied Amount" := MPESAEntry1.MPESA_AMOUNT;
                MPESAEntry1.Modify(true);
            end;
            Commit;

        end;
        //check for invoice
        //if posted
        SalesInvoiceHeader1.Reset;
        SalesInvoiceHeader1.SetRange("External Document No.", ProcessingHeader."No.");
        if not SalesInvoiceHeader1.FindFirst then begin
            SalesInv1.Reset;
            SalesInv1.SetRange("External Document No.", ProcessingHeader."No.");
            if not SalesInv1.FindFirst then begin
                Error(TXT001, ProcessingHeader."No.");
            end;
        end;
        //get amount by document type
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Registration then begin
            if ProcessingHeader.Portal = true then begin
                if ProcessingHeader."Student No." = '' then begin
                    ApplicationOnlyOnboardCustomer(ProcessingHeader);
                    Commit;
                end;
                if ProcessingHeader."Application Invoice" = '' then begin
                    ApplicationCreateInvoice(ProcessingHeader);
                end;
                Commit;
            end;
            ApplicationAmount := ProcessingHeader."Application Amount";
            ApplicationInvoice := ProcessingHeader."Application Invoice";
        end;
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Booking then begin
            ProcessingHeader.CalcFields("Booking Amount");

            ApplicationAmount := ProcessingHeader."Booking Amount";
            ApplicationInvoice := ProcessingHeader."Booking Invoice No.";
        end;
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Exemption then begin
            ProcessingHeader.CalcFields("Exemption Amount");

            ApplicationAmount := ProcessingHeader."Exemption Amount";
            ApplicationInvoice := ProcessingHeader."Exemption Invoice No.";
        end;
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Renewal then begin
            ProcessingHeader.CalcFields("Renewal Amount");

            ApplicationAmount := ProcessingHeader."Renewal Amount";
            ApplicationInvoice := ProcessingHeader."Renewal Invoice No.";
        end;
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Defferment then begin

            ApplicationAmount := ProcessingHeader."Administrative Fees";
            ApplicationInvoice := ProcessingHeader."Application Invoice";
        end;
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Withdrawal then begin
            ProcessingHeader.CalcFields("Renewal Amount");

            ApplicationAmount := ProcessingHeader."Administrative Fees";
            ApplicationInvoice := ProcessingHeader."Application Invoice";
        end;
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Confirmation then begin
            ProcessingHeader.CalcFields("Activation Amount");

            ApplicationAmount := ProcessingHeader."Activation Amount";
            ApplicationInvoice := ProcessingHeader."Activation Invoice No.";
        end;
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Collection then begin
            //  ProcessingHeader.CALCFIELDS("Activation Amount");

            ApplicationAmount := ProcessingHeader."Total Storage Fee";
            ApplicationInvoice := ProcessingHeader."Cert Collect Invoice No.";
        end;
        //check sales header if not posted
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", ProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", ProcessingHeader."No.");
        if SalesInv.FindFirst then begin
            SalesInv."Posting Date" := Today;
            SalesInv.Modify(true);
            Commit;
            SalesInv1.Reset;
            SalesInv1.SetRange("No.", SalesInv."No.");
            if SalesInv1.FindFirst then begin
                SalesPostYesNo.Run(SalesInv1);
            end;
        end;
        CMSetup.Get;
        MPESAEntry.Reset;
        MPESAEntry.SetRange(MPESA_TXN_ID, ProcessingHeader."Payment Reference No.");
        MPESAEntry.SetRange(Fetch, false);
        if MPESAEntry.FindFirst then begin
            //create and post a receipt
            ReceiptHeader1.Reset;
            ReceiptHeader1.SetRange("Cheque No", ProcessingHeader."No.");
            ReceiptHeader1.SetRange("Payment Reference", ProcessingHeader."Payment Reference No.");
            if ReceiptHeader1.FindFirst then begin
                if ReceiptHeader1.Posted = false then begin
                    //check first for cust ledger entry
                    CustLedgerEntry.Reset;
                    CustLedgerEntry.SetRange("External Document No.", ProcessingHeader."No.");
                    CustLedgerEntry.SetFilter(Amount, '<%1', 0);
                    if CustLedgerEntry.FindFirst then begin
                        //mark receipt as posted
                        ReceiptHeader1.Posted := true;
                        ReceiptHeader1."Posted By" := UserId;
                        ReceiptHeader1."Posted Date" := Today;
                        ReceiptHeader1."Posted Time" := Time;
                        ReceiptHeader1.Modify(true);
                        RcptNo := ReceiptHeader1."No.";
                    end
                    else begin

                        Studentmanagement.PostReceipt(ReceiptHeader1);
                        RcptNo := ReceiptHeader1."No.";
                    end;

                end
                else
                    RcptNo := ReceiptHeader1."No.";
            end else begin
                CashMngmntSetup.Get;
                ExaminationSetup.Get;
                NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
                ReceiptHeader.Init;
                ReceiptHeader."No." := NoSeries;
                ReceiptHeader."Payment Reference" := ProcessingHeader."Payment Reference No.";
                ReceiptHeader."Cheque No" := ProcessingHeader."No.";
                ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code";
                if ProcessingHeader."Pay Mode" = '' then
                    ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode"
                else
                    ReceiptHeader."Pay Mode" := ProcessingHeader."Pay Mode";
                ReceiptHeader.Validate("Bank Code");
                ReceiptHeader."Received From" := ProcessingHeader."Student Name";
                ReceiptHeader."On Behalf Of" := ProcessingHeader."Student Name";
                ReceiptHeader."Posted Date" := Today;
                ReceiptHeader."Posting Date" := Today;
                ReceiptHeader.Insert(true);
                ReceiptLines.Init;
                ReceiptLines."Receipt No." := ReceiptHeader."No.";
                ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
                ReceiptLines.Description := ProcessingHeader."Student Name" + '-application amount';
                ReceiptLines."Account No." := ProcessingHeader."Student No.";
                ReceiptLines.Validate("Account No.");
                //get posted invoice number
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Customer No.", ProcessingHeader."Student No.");
                CustLedgerEntry.SetRange("External Document No.", ProcessingHeader."No.");
                CustLedgerEntry.SetRange(Open, true);
                if CustLedgerEntry.FindFirst then begin
                    ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                    ReceiptLines.Validate("Applies to Doc. No");
                end;
                //check amount difference
                if MPESAEntry."Remaining Amount" > 0 then begin
                    if ((MPESAEntry.MPESA_AMOUNT > ApplicationAmount) or (MPESAEntry."Remaining Amount" > ApplicationAmount)) then begin
                        ReceiptLines.Amount := MPESAEntry."Remaining Amount";
                        ReceiptLines."Amount (LCY)" := MPESAEntry."Remaining Amount";
                    end;
                    if ((MPESAEntry.MPESA_AMOUNT < ApplicationAmount) or (MPESAEntry."Remaining Amount" < ApplicationAmount)) then begin
                        ReceiptLines.Amount := MPESAEntry."Remaining Amount";
                        ReceiptLines."Amount (LCY)" := MPESAEntry."Remaining Amount";
                    end;
                    if ((MPESAEntry.MPESA_AMOUNT = ApplicationAmount) or (MPESAEntry."Remaining Amount" = ApplicationAmount)) then begin
                        ReceiptLines.Amount := MPESAEntry."Remaining Amount";
                        ReceiptLines."Amount (LCY)" := MPESAEntry."Remaining Amount";
                    end;
                end;
                ReceiptLines.Insert(true);
                Studentmanagement.PostReceipt(ReceiptHeader);
                ProcessingHeader."Application Receipt" := ReceiptHeader."No.";
                RcptNo := ReceiptHeader."No.";
            end;


            if ((MPESAEntry."Remaining Amount" > ApplicationAmount) or (MPESAEntry."Remaining Amount" = ApplicationAmount)
              or (MPESAEntry.MPESA_AMOUNT = ProcessingHeader."Payment Remaining Amount")) then begin
                //registration
                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Registration then begin
                    ApplicationAssignRegistrationNo(ProcessingHeader);
                    //mark document as posted
                    ProcessingHeader."Application Receipt" := RcptNo;
                    if ProcessingHeader.Portal = false then begin
                        ProcessingHeader.Posted := true;
                        ProcessingHeader."Posted By" := UserId;
                        ProcessingHeader."Posted On" := CurrentDatetime;
                        ProcessingHeader."Posted Date" := Today;
                        ProcessingHeader.Modify(true);
                    end;
                end;
                //booking
                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Booking then begin
                    ProcessingHeader."Booking Receipt No." := RcptNo;
                    ProcessingHeader.Modify(true);
                    PostExaminationVoucher(ProcessingHeader);
                    Commit;
                    //PostCenterBookingAllocation(ProcessingHeader);
                    BookingSendReceipt(ProcessingHeader);
                end;
                //renewal
                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Renewal then begin

                    //mark document as posted

                    ProcessingHeader."Renewal Receipt No." := RcptNo;
                    ProcessingHeader.Posted := true;
                    ProcessingHeader."Posted By" := UserId;
                    ProcessingHeader."Posted On" := CurrentDatetime;
                    ProcessingHeader."Posted Date" := Today;
                    ProcessingHeader.Modify(true);

                    Commit;
                    RenewalUpdateDetails(ProcessingHeader);
                end;
                //defferment
                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Defferment then begin

                    //mark document as posted
                    PostDefferalVoucher(ProcessingHeader);
                    Commit;

                end;
                //exemption
                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Exemption then begin
                    ProcessingHeader."Exemption Receipt 6No." := RcptNo;
                    ProcessingHeader.Posted := true;
                    ProcessingHeader."Posted By" := UserId;
                    ProcessingHeader."Posted On" := CurrentDatetime;
                    ProcessingHeader."Posted Date" := Today;
                    ProcessingHeader.Modify(true);
                    Commit;
                    ExemptionSendReceipt(ProcessingHeader);
                end;
                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Confirmation then begin
                    ProcessingHeader."Activation Receipt No." := RcptNo;
                    ProcessingHeader.Posted := true;
                    ProcessingHeader."Posted By" := UserId;
                    ProcessingHeader."Posted On" := CurrentDatetime;
                    ProcessingHeader."Posted Date" := Today;
                    ProcessingHeader.Modify(true);
                    Commit;
                    ConfirmationSendReceipt(ProcessingHeader);
                end;
                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Collection then begin
                    ProcessingHeader."Activation Receipt No." := RcptNo;
                    ProcessingHeader.Posted := true;
                    ProcessingHeader."Posted By" := UserId;
                    ProcessingHeader."Posted On" := CurrentDatetime;
                    ProcessingHeader."Posted Date" := Today;
                    ProcessingHeader.Modify(true);
                    Commit;
                    FnCertCollectSendReceipt(ProcessingHeader);
                end;
                if ((ProcessingHeader."Document Type" = ProcessingHeader."document type"::Withdrawal) or (ProcessingHeader."Document Type" = ProcessingHeader."document type"::Withdrawal)) then begin
                    //mark entries as deffered for next period
                    ExamBookingEntries.Reset;
                    ExamBookingEntries.SetRange("Student Reg No.", ProcessingHeader."Student Reg. No.");
                    ExamBookingEntries.SetRange("Exam Sitting", ProcessingHeader."Examination Sitting");
                    ExamBookingEntries.SetRange(Status, ExamBookingEntries.Status::Open);
                    if ExamBookingEntries.FindSet then begin
                        EntryNo := ExamBookingEntries."Entry No." + 100;
                        repeat

                            //get next cycle
                            ExamSittingCycle.Reset;
                            ExamSittingCycle.SetRange(Closed, false);
                            ExamSittingCycle.SetRange("Sitting Status", ExamSittingCycle."sitting status"::Upcoming);
                            if ExamSittingCycle.FindFirst then begin
                                if ExamSittingCycle."Exam Sitting Cycle" <> ProcessingHeader."Examination Sitting" then
                                    ExamBookingEntries1.Init;
                                ExamBookingEntries1.TransferFields(ExamBookingEntries);
                                ExamBookingEntries1."Entry No." := EntryNo + 1;
                                ExamBookingEntries1."Exam Sitting" := ExamSittingCycle."Exam Sitting Cycle";

                                ExamBookingEntries1.Insert(true);
                                ExamBookingEntries.Status := ExamBookingEntries.Status::Defered;
                                ExamBookingEntries.Modify(true);
                            end;
                            EntryNo += 1;
                        until ExamBookingEntries.Next = 0;
                    end;
                    ProcessingHeader."Application Receipt" := RcptNo;
                    ProcessingHeader.Posted := true;
                    ProcessingHeader."Posted By" := UserId;
                    ProcessingHeader."Posted On" := CurrentDatetime;
                    ProcessingHeader."Posted Date" := Today;
                    ProcessingHeader.Modify(true);
                    Commit;

                end;

                MPESAEntry.Fetch := true;
                MPESAEntry."Applied Amount" := MPESAEntry."Remaining Amount";
                MPESAEntry."Remaining Amount" := MPESAEntry.MPESA_AMOUNT - MPESAEntry."Remaining Amount";
                MPESAEntry.Modify(true);
                ProcessingHeader."Payment Remaining Amount" := ApplicationAmount - MPESAEntry.MPESA_AMOUNT;
                ProcessingHeader.Modify(true);
                //update remaining amount

            end

        end;
        //find entry and mark as closed


    end;

    procedure ApplicationInstitutionCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        FileName: Text;
        FileLocation: Text;
        SalesHeader: Record "Sales Header";
        TXT001: label 'A sales invoice no %1,has already been processed for this application';
        ProcessingHeader: Record "Student Processing Header";
        PostedInvoice: Record "Sales Invoice Header";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        Customer: Record Customer;
        CustomerCode: Code[30];
        SalesInv1: Record "Sales Header";
    begin

        BulkProcessingHeader.TestField("Fee Type");



        ExaminationSetup.Get;
        PostedInvoice.Reset;
        PostedInvoice.SetRange("Sell-to Customer No.", BulkProcessingHeader."Institution Code");
        PostedInvoice.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not PostedInvoice.FindFirst then begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if not SalesInv.FindFirst then begin
                SalesInv."Document Type" := SalesInv."document type"::Invoice;
                SalesInv."No." := '';
                SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Institution Code");
                SalesInv."Document Date" := Today;
                SalesInv."Order Date" := Today;
                SalesInv."Currency Code" := BulkProcessingHeader."Currency Code";
                SalesInv."Posting Date" := Today;
                SalesInv."External Document No." := BulkProcessingHeader."No.";
                SalesInv.Type := SalesInv.Type::Normal;
                SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
                SalesInv."Prepayment %" := 100;//enforce prepayment`

                SalesInv.Insert(true);
                SalesLine.Init;
                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                SalesLine."Document No." := SalesInv."No.";
                SalesLine.Type := SalesLine.Type::Resource;
                SalesLine."No." := BulkProcessingHeader."Fee Type";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := BulkProcessingHeader."Application Amount";
                SalesLine.Validate("Unit Price");
                if BulkProcessingHeader.Disabled = true then begin
                    SalesLine."Line Discount %" := ExaminationSetup."Disability Discount %";
                    SalesLine.Validate("Line Discount %");
                end;
                SalesLine.Insert(true);

                if BulkProcessingHeader."Student No." = '' then begin
                    Customer.Reset;
                    Customer.SetRange("ID. No.", BulkProcessingHeader."ID Number/Passport No.");
                    if Customer.FindFirst then begin

                        BulkProcessingHeader."Student No." := Customer."No.";
                        BulkProcessingHeader."Student Name" := Customer.Name;

                    end;
                end;

                BulkProcessingHeader."Application Invoice" := SalesInv."No.";
                BulkProcessingHeader.Posted := true;
                BulkProcessingHeader."Posted Date" := Today;
                BulkProcessingHeader."Posted By" := UserId;
                BulkProcessingHeader."Posted On" := CurrentDatetime;
                BulkProcessingHeader.Modify(true);

                Commit;


            end;
            SalesInv.Reset;
            SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Institution Code");
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if SalesInv.FindFirst then begin
                SalesInv."Posting Date" := Today;
                SalesInv.Modify(true);
                Commit;
                SalesInv1.Reset;
                SalesInv1.SetRange("No.", SalesInv."No.");
                if SalesInv1.FindFirst then begin
                    SalesPostYesNo.Run(SalesInv1);
                end;
            end;
        end
    end;

    procedure ExemptionInstitutionCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        FileName: Text;
        FileLocation: Text;
        SalesHeader: Record "Sales Header";
        TXT001: label 'A sales invoice no %1,has already been processed for this application';
        ProcessingHeader: Record "Student Processing Header";
        PostedInvoice: Record "Sales Invoice Header";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        Customer: Record Customer;
        SalesInv1: Record "Sales Header";
    begin

        BulkProcessingHeader.TestField("Fee Type");
        BulkProcessingHeader.CalcFields("Exemption Amount");

        ExaminationSetup.Get;
        PostedInvoice.Reset;
        PostedInvoice.SetRange("Sell-to Customer No.", BulkProcessingHeader."Institution Code");
        PostedInvoice.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not PostedInvoice.FindFirst then begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if not SalesInv.FindFirst then begin
                SalesInv."Document Type" := SalesInv."document type"::Invoice;
                SalesInv."No." := '';
                SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Institution Code");
                SalesInv."Document Date" := Today;
                SalesInv."Order Date" := Today;
                SalesInv."Posting Date" := Today;
                SalesInv."External Document No." := BulkProcessingHeader."No.";
                SalesInv.Type := SalesInv.Type::Normal;
                SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
                SalesInv."Prepayment %" := 100;//enforce prepayment`

                SalesInv.Insert(true);
                SalesLine.Init;
                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                SalesLine."Document No." := SalesInv."No.";
                SalesLine.Type := SalesLine.Type::Resource;
                SalesLine."No." := BulkProcessingHeader."Fee Type";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := BulkProcessingHeader."Exemption Amount";
                SalesLine.Validate("Unit Price");
                if BulkProcessingHeader.Disabled = true then begin
                    SalesLine."Line Discount %" := ExaminationSetup."Disability Discount %";
                    SalesLine.Validate("Line Discount %");
                end;
                SalesLine.Insert(true);
                //get student no
                Customer.Reset;
                Customer.SetRange("ID. No.", BulkProcessingHeader."ID Number/Passport No.");
                if Customer.FindFirst then begin
                    BulkProcessingHeader."Student No." := Customer."No.";
                    BulkProcessingHeader."Student Name" := Customer.Name;
                end;
                BulkProcessingHeader."Application Invoice" := SalesInv."No.";
                BulkProcessingHeader.Modify;
                Commit;
                SalesInv.Reset;
                SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Institution Code");
                SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
                if SalesInv.FindFirst then begin
                    SalesInv."Posting Date" := Today;
                    SalesInv.Modify(true);
                    Commit;
                    SalesInv1.Reset;
                    SalesInv1.SetRange("No.", SalesInv."No.");
                    if SalesInv1.FindFirst then begin
                        SalesPostYesNo.Run(SalesInv1);
                    end;
                end;

            end
        end else
            Error(TXT001, SalesInv."No.");
    end;

    procedure ExemptionInstitutionSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Receipts Header1";
        FileName1: Text;
        FileLocation1: Text;
        Header: Record "Student Processing Header";
        ExemptionEntries: Record "Exemption Entries";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExemptionEntries.Reset;
        ExemptionEntries.SetRange("Exemption Voucher No.", StudentProcessingHeader."No.");
        ExemptionEntries.SetRange("Stud. Reg. No", StudentProcessingHeader."Student Reg. No.");
        if not ExemptionEntries.FindSet then begin
            PostExemptionVoucher(StudentProcessingHeader);
        end;
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";

        EmailMessage.Create(StudentProcessingHeader.Email,
        'HRMPEB STUDENT EXEMPTION',
        'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        'Your exemption request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        'Find attached the receipt and exemption letter' + '<BR><BR>HRMPEB STUDENT EXEMPTION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');

        FileName := StudentProcessingHeader."Exemption Invoice No." + '.pdf';
        FileLocation := ExaminationSetup."Examination Path" + FileName;
        FileName1 := StudentProcessingHeader."No." + '.pdf';
        FileLocation1 := ExaminationSetup."Examination Path" + FileName1;


        Header.Reset;
        Header.SetRange("No.", StudentProcessingHeader."No.");
        if Header.FindFirst then begin
            Report.SaveAsPdf(85022, FileLocation1, Header);
            SMTP.AddAttachment(FileLocation1, 'PDF', InStr);
        end;



        //SMTP.AppendToBody('<BR><BR>HRMPEB STUDENT EXEMPTION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");

        //SMTP.Send();
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        //send receipt
    end;

    procedure BookingInstitutionCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        TXT001: label 'Invoice %1 sent succesfully';
        TXT002: label 'An invoice no %1 for this booking has already been processed';
        StudentLines: Record "Student Processing Lines";
        ExaminationAccount: Record "Examination Account";
        DocumentLink: Record "Document Attachment";
        TXT003: label 'Kindly attach the mandatory document for this application';
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInv1: Record "Sales Header";
    begin
        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not SalesInvoiceHeader.FindFirst then begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if not SalesInv.FindFirst then begin

                SalesInv."Document Type" := SalesInv."document type"::Invoice;
                SalesInv."No." := '';
                SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Institution Code");
                SalesInv."Document Date" := Today;
                SalesInv."Order Date" := Today;
                SalesInv."Posting Date" := Today;
                SalesInv."External Document No." := BulkProcessingHeader."No.";
                SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
                SalesInv.Type := SalesInv.Type::Normal;
                SalesInv."Prepayment %" := 100;//enforce prepayment`
                SalesInv.Insert(true);
                BulkProcessingHeader.CalcFields("Booking Amount");
                //get resource entry
                ResourcePrice.Reset;
                ResourcePrice.SetRange(Code, BulkProcessingHeader."Fee Type");
                if ResourcePrice.FindSet then begin
                    SalesLine.Init;
                    SalesLine."Document Type" := SalesLine."document type"::Invoice;
                    SalesLine."Document No." := SalesInv."No.";
                    SalesLine."No." := ResourcePrice.Code;
                    SalesLine.Type := SalesLine.Type::Resource;
                    SalesLine.Validate(SalesLine."No.");
                    SalesLine.Validate(SalesLine.Quantity, 1);
                    SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Booking Amount");
                    SalesLine.Insert(true);
                end;
                BulkProcessingHeader."Booking Invoice No." := SalesInv."No.";
                BulkProcessingHeader.Modify(true);
                ;
                StudentLines.Reset;
                StudentLines.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                SalesInv.Reset;
                SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Institution Code");
                SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
                if SalesInv.FindFirst then begin
                    SalesInv."Posting Date" := Today;
                    SalesInv.Modify(true);
                    Commit;
                    SalesInv1.Reset;
                    SalesInv1.SetRange("No.", SalesInv."No.");
                    if SalesInv1.FindFirst then begin
                        SalesPostYesNo.Run(SalesInv1);
                    end;
                end;
            end
            else
                Error(TXT002, SalesInv."No.");
        end;
    end;

    procedure RenewalInstitutionCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        TXT001: label 'Invoice %1 sent succesfully';
        TXT002: label 'An invoice no %1 for this booking has already been processed';
        StudentLines: Record "Student Processing Lines";
        ExaminationAccount: Record "Examination Account";
        DocumentLink: Record "Document Attachment";
        TXT003: label 'Kindly attach the mandatory document for this application';
        RenewalAmount: Decimal;
        Resource: Record Resource;
        StudentProcessingLines: Record "Student Processing Lines";
    begin
        SalesInv.Reset;
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not SalesInv.FindFirst then begin

            SalesInv."Document Type" := SalesInv."document type"::Invoice;
            SalesInv."No." := '';
            SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Institution Code");
            SalesInv."Document Date" := Today;
            SalesInv."Order Date" := Today;
            SalesInv."Posting Date" := Today;
            SalesInv."External Document No." := BulkProcessingHeader."No.";
            SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
            SalesInv.Type := SalesInv.Type::Normal;
            SalesInv."Prepayment %" := 100;//enforce prepayment`
            SalesInv.Insert(true);
            BulkProcessingHeader.CalcFields("Renewal Amount");
            //insert lines based on lines
            StudentProcessingLines.Reset;
            StudentProcessingLines.SetRange("Booking Header No.", BulkProcessingHeader."No.");
            if StudentProcessingLines.FindFirst then begin
                ExaminationSetup.Get;
                if BulkProcessingHeader."Currency Code" <> '' then
                    RenewalAmount := StudentProcessingLines.Amount
                else
                    RenewalAmount := StudentProcessingLines."Amount LCY";

                SalesLine.Init;
                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                SalesLine."Document No." := SalesInv."No.";
                Resource.Reset;
                Resource.SetRange("Course ID", StudentProcessingLines."Course Id");
                if Resource.FindSet then begin
                    repeat
                        ResourcePrice.Reset;
                        ResourcePrice.SetRange("Document Type", ResourcePrice."document type"::Renewal);
                        ResourcePrice.SetRange("Currency Code", StudentProcessingLines."Currency Code");
                        ResourcePrice.SetRange(Code, Resource."No.");
                        if ResourcePrice.FindFirst then begin//get the price

                            SalesLine.Type := SalesLine.Type::Resource;
                            SalesLine."No." := Resource."No.";
                            SalesLine.Validate(SalesLine."No.");
                            SalesLine.Validate(SalesLine.Quantity, 1);
                            SalesLine.Validate(SalesLine."Unit Price", RenewalAmount);
                            SalesLine.Insert(true);
                        end;
                    until Resource.Next = 0;
                end;

                //get resource based on course and level


            end;

            BulkProcessingHeader."Renewal Invoice No." := SalesInv."No.";
            BulkProcessingHeader.Modify;


        end
        else
            Error(TXT002, SalesInv."No.");
    end;


    procedure RegOnboardInstitutionCustomer(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        salesheader: Page "Sales Invoice";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLines: Record "Receipt Lines1";
        PaymentPost: Codeunit "Payments-Post";
        BOSAACC: Code[20];
        Amount: Decimal;
        FileDirectory: Text;
        FileName: Text;
        SMTPMailSet: Record "Email Account";
        Notification1: Codeunit "Email Message";
        objCustomer: Record Customer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BulkProcessingLines: Record "Bulk Processing Lines";
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        TXT001: label 'Are you sure you want to create the Account';
        TXT002: label 'The student %1 has been created to the customer account %2';
        TXT003: label 'The student %1 already has an existing customer account %2';
        Cust: Record Customer;
        WorkType: Record "Work Type";
        DocumentLink: Record "Record Link";
        TXT004: label 'Kindly attach the mandatory documents required for this application';
    begin
        //check for an attachment
        if BulkProcessingHeader.Portal = true then begin
            DocumentLink.Reset;
            DocumentLink.SetRange("Record ID", BulkProcessingHeader.RecordId);
            if not DocumentLink.FindSet then
                Error(TXT004);

        end;

        BulkProcessingHeader.TestField("Fee Type");
        ExaminationSetup.Get;
        AppNo := '';
        Cust.Reset;
        Cust.SetRange("ID. No.", BulkProcessingHeader."ID Number/Passport No.");
        if not Cust.FindSet then begin

            //create student account
            NoSeriesMgt.InitSeries(ExaminationSetup."Student Nos.", ExaminationSetup."Student Nos.", 0D, AppNo, ExaminationSetup."Student Nos.");

            Cust."No." := AppNo;
            Cust."Funding Class" := Cust."funding class"::Student;
            Cust."Customer Type" := Cust."customer type"::Student;
            Cust.Name := BulkProcessingHeader."First Name" + ' ' + BulkProcessingHeader."Middle Name" + ' ' + BulkProcessingHeader.Surname;
            Cust."First Name" := BulkProcessingHeader."First Name";
            Cust."Middle Name" := BulkProcessingHeader."Middle Name";
            Cust."Last Name" := BulkProcessingHeader.Surname;
            Cust.Address := BulkProcessingHeader.Address;
            Cust."Address 2" := BulkProcessingHeader."Address 2";
            Cust."Post Code" := BulkProcessingHeader."Post Code";
            Cust.Validate("Post Code");
            Cust."Currency Code" := BulkProcessingHeader."Currency Code";
            //get work type
            WorkType.Reset;
            WorkType.SetRange(Code, BulkProcessingHeader."Type Code");
            if WorkType.FindFirst then begin
                Cust."Gen. Bus. Posting Group" := WorkType."Gen. Bus. Posting Group";
                Cust."Customer Posting Group" := WorkType."Customer Posting Group";
            end;

            Cust."NCPWD No." := BulkProcessingHeader."NCPWD No.";
            Cust."ID. No." := BulkProcessingHeader."ID Number/Passport No.";
            Cust.County := BulkProcessingHeader.County;
            Cust."Phone No." := BulkProcessingHeader."Phone No.";
            Cust."E-Mail" := BulkProcessingHeader.Email;
            Cust.Image := BulkProcessingHeader.Image;
            Cust.Insert(true);
            Cust."Bill-to Customer No." := AppNo;
            Cust.Validate("Bill-to Customer No.");
            Cust.Modify(true);

        end else
            Error('The student with the number %1,already exists', Cust."ID. No.");

    end;


    procedure ApplyInstitutionPayment(ProcessingHeader: Record "Student Processing Header")
    var
        Customer: Record Customer;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        InvoiceHeader: Record "Sales Invoice Header";
        SalesLine: Record "Sales Line";
        Payments: Record Payments;
        ReceiptsHeader1: Record "Receipts Header1";
        ReceiptLines1: Record "Receipt Lines1";
        TXT001: label 'The reference %1 is not available for application';
        ApplyPostedEntries: Codeunit "CustEntry-Apply Posted Entries";
        CustLedgerEntry1: Record "Cust. Ledger Entry";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        ProcessingHeader1: Record "Student Processing Header";
        TXT002: label 'The renewal %1 has been updated succesfully';
    begin
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Registration then begin
            //create and post the invoice and apply to a ledger entry
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", ProcessingHeader."Institution Reference No.");
            CustLedgerEntry.SetRange(Open, true);
            CustLedgerEntry.SetRange("Customer No.", ProcessingHeader."Institution Code");
            if CustLedgerEntry.FindFirst then begin
                //get the total remaining amount
                CustLedgerEntry.CalcFields("Remaining Amount");
                if (Abs(CustLedgerEntry."Remaining Amount") > ProcessingHeader."Application Amount") or
                  (Abs(CustLedgerEntry."Remaining Amount") = ProcessingHeader."Application Amount") then begin
                    if ProcessingHeader."Student No." = '' then begin
                        RegOnboardInstitutionCustomer(ProcessingHeader);

                    end;
                    ApplicationInstitutionCreateInvoice(ProcessingHeader);
                    Commit;
                    ApplicationAssignRegistrationNo(ProcessingHeader);
                end
            end else
                Error(TXT001, ProcessingHeader."Institution Reference No.");

        end;
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Exemption then begin
            //create and post the invoice and apply to a ledger entry
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", ProcessingHeader."Institution Reference No.");
            CustLedgerEntry.SetRange(Open, true);
            CustLedgerEntry.SetRange("Customer No.", ProcessingHeader."Institution Code");
            ProcessingHeader.CalcFields("Exemption Amount");
            if CustLedgerEntry.FindFirst then begin
                //get the total remaining amount
                CustLedgerEntry.CalcFields("Remaining Amount");
                if (Abs(CustLedgerEntry."Remaining Amount") > ProcessingHeader."Exemption Amount") or
                  (Abs(CustLedgerEntry."Remaining Amount") = ProcessingHeader."Exemption Amount") then begin
                    ExemptionInstitutionCreateInvoice(ProcessingHeader);
                    ExemptionInstitutionSendReceipt(ProcessingHeader);
                    ProcessingHeader1.Reset;
                    ProcessingHeader1.SetRange("No.", ProcessingHeader."No.");
                    if ProcessingHeader1.FindFirst then begin
                        ProcessingHeader1.Posted := true;
                        ProcessingHeader1."Posted By" := UserId;
                        ProcessingHeader1."Posted Date" := Today;
                        ProcessingHeader1."Posted On" := CurrentDatetime;
                        ProcessingHeader1.Modify(true);
                    end;
                end
            end else
                Error(TXT001, ProcessingHeader."Institution Reference No.");

        end;
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Booking then begin
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", ProcessingHeader."Institution Reference No.");
            CustLedgerEntry.SetRange(Open, true);
            CustLedgerEntry.SetRange("Customer No.", ProcessingHeader."Institution Code");
            if CustLedgerEntry.FindFirst then begin

                CustLedgerEntry.CalcFields("Remaining Amount");
                ProcessingHeader.CalcFields("Booking Amount");
                if (Abs(CustLedgerEntry."Remaining Amount") > ProcessingHeader."Booking Amount") or
                (Abs(CustLedgerEntry."Remaining Amount") = ProcessingHeader."Booking Amount") then begin

                    BookingInstitutionCreateInvoice(ProcessingHeader);
                    ProcessingHeader1.Reset;
                    ProcessingHeader1.SetRange("No.", ProcessingHeader."No.");
                    if ProcessingHeader1.FindFirst then begin
                        PostExaminationVoucher(ProcessingHeader1);
                    end;
                    PostCenterBookingAllocation(ProcessingHeader);
                end
            end else
                Error(TXT001, ProcessingHeader."Institution Reference No.");


        end;
        if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Renewal then begin

            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", ProcessingHeader."Institution Reference No.");
            CustLedgerEntry.SetRange(Open, true);
            CustLedgerEntry.SetRange("Customer No.", ProcessingHeader."Institution Code");
            if CustLedgerEntry.FindFirst then begin
                CustLedgerEntry.CalcFields("Remaining Amount");
                ProcessingHeader.CalcFields("Renewal Amount");
                if (Abs(CustLedgerEntry."Remaining Amount") > ProcessingHeader."Renewal Amount") or
                (Abs(CustLedgerEntry."Remaining Amount") = ProcessingHeader."Renewal Amount") then begin
                    RenewalInstitutionCreateInvoice(ProcessingHeader);
                    RenewalUpdateDetails(ProcessingHeader);
                    Message(TXT002, ProcessingHeader."No.");
                    ProcessingHeader1.Reset;
                    ProcessingHeader1.SetRange("No.", ProcessingHeader."No.");
                    if ProcessingHeader1.FindFirst then begin
                        ProcessingHeader1.Posted := true;
                        ProcessingHeader1."Posted By" := UserId;
                        ProcessingHeader1."Posted Date" := Today;
                        ProcessingHeader1."Posted On" := CurrentDatetime;
                        ProcessingHeader1.Modify(true);
                    end

                end;
                if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Defferment then begin
                    CustLedgerEntry.Reset;
                    CustLedgerEntry.SetRange("External Document No.", ProcessingHeader."Institution Reference No.");
                    CustLedgerEntry.SetRange(Open, true);
                    if CustLedgerEntry.FindFirst then begin
                        //     CustLedgerEntry.CALCFIELDS("Remaining Amount");
                        //    ProcessingHeader.CALCFIELDS("Renewal Amount");
                        //    IF (ABS(CustLedgerEntry."Remaining Amount")>ProcessingHeader."Renewal Amount")OR
                        //    (ABS(CustLedgerEntry."Remaining Amount")=ProcessingHeader."Renewal Amount") THEN BEGIN
                        //
                        //        MESSAGE(TXT002,ProcessingHeader."No.");
                        //        ProcessingHeader1.RESET;
                        //        ProcessingHeader1.SETRANGE("No.",ProcessingHeader."No.");
                        //        IF ProcessingHeader1.FINDFIRST THEN BEGIN
                        //        ProcessingHeader1.Posted:=TRUE;
                        //        ProcessingHeader1."Posted By":=USERID;
                        //        ProcessingHeader1."Posted Date":=TODAY;
                        //        ProcessingHeader1."Posted On":=CURRENTDATETIME;
                        //        ProcessingHeader1.MODIFY(TRUE);
                    end

                end;
            end else
                Error(TXT001, ProcessingHeader."Institution Reference No.");


        end;
    end;


    procedure ApplicationOnlyOnboardCustomer(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        salesheader: Page "Sales Invoice";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLines: Record "Receipt Lines1";
        PaymentPost: Codeunit "Payments-Post";
        BOSAACC: Code[20];
        Amount: Decimal;
        FileDirectory: Text;
        FileName: Text;
        SMTPMailSet: Record "Email Account";
        Notification1: Codeunit "Email Message";
        objCustomer: Record Customer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BulkProcessingLines: Record "Bulk Processing Lines";
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        TXT001: label 'Are you sure you want to create the Account';
        TXT002: label 'The student %1 has been created to the customer account %2';
        TXT003: label 'The student %1 already has an existing customer account %2';
        Cust: Record Customer;
        WorkType: Record "Work Type";
    begin
        ExaminationSetup.Get();
        AppNo := '';
        Cust.Reset;
        Cust.SetRange("ID. No.", BulkProcessingHeader."ID Number/Passport No.");
        if not Cust.FindSet then begin
            NoSeriesMgt.InitSeries(ExaminationSetup."Student Nos.", ExaminationSetup."Student Nos.", 0D, AppNo, ExaminationSetup."Student Nos.");

            Cust."No." := AppNo;
            Cust."Funding Class" := Cust."funding class"::Student;
            Cust."Customer Type" := Cust."customer type"::Student;
            Cust.Name := BulkProcessingHeader."First Name" + ' ' + BulkProcessingHeader."Middle Name" + ' ' + BulkProcessingHeader.Surname;
            Cust."First Name" := BulkProcessingHeader."First Name";
            Cust."Middle Name" := BulkProcessingHeader."Middle Name";
            Cust."Last Name" := BulkProcessingHeader.Surname;
            Cust.Address := BulkProcessingHeader.Address;
            Cust."Address 2" := BulkProcessingHeader."Address 2";
            Cust."Post Code" := BulkProcessingHeader."Post Code";
            Cust.Validate("Post Code");
            Cust."Currency Code" := BulkProcessingHeader."Currency Code";
            //get work type
            WorkType.Reset;
            WorkType.SetRange(Code, BulkProcessingHeader."Type Code");
            if WorkType.FindSet then begin
                Cust."Gen. Bus. Posting Group" := WorkType."Gen. Bus. Posting Group";
                Cust."Customer Posting Group" := WorkType."Customer Posting Group";
            end;

            Cust."NCPWD No." := BulkProcessingHeader."NCPWD No.";
            Cust."ID. No." := BulkProcessingHeader."ID Number/Passport No.";
            Cust.County := BulkProcessingHeader.County;
            Cust."Phone No." := BulkProcessingHeader."Phone No.";
            Cust."E-Mail" := BulkProcessingHeader.Email;
            Cust.Image := BulkProcessingHeader.Image;


            Cust.Insert(true);
            Cust."Bill-to Customer No." := AppNo;
            Cust.Validate("Bill-to Customer No.");
            Cust.Modify(true);
            BulkProcessingHeader.Created := true;
            BulkProcessingHeader."Student No." := Cust."No.";
            BulkProcessingHeader."Student Name" := Cust.Name;
            BulkProcessingHeader.Modify;
            Commit;

        end else begin
            BulkProcessingHeader.Created := true;
            BulkProcessingHeader."Student No." := Cust."No.";
            BulkProcessingHeader."Student Name" := Cust.Name;
            BulkProcessingHeader.Modify;
            Commit;

        end
    end;

    local procedure UpdateStudentDetails()
    begin
    end;


    procedure AllocateTotalStudentBalance(StudentProcessingHeader: Record "Student Processing Header")
    var
        TXT001: label 'Are you sure you want to allocate %1 to student %2';
        BankImportEntries: Record "Bank Import Entries";
        ExaminationSetup: Record "Examination Setup";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        CMSetup: Record "Examination Setup";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Customer: Record Customer;
        GenJournalBatch: Record "Gen. Journal Batch";
        GenJournalBatch1: Record "Gen. Journal Batch";
        BatchName: Text;
        UserSetup: Record "User Setup";
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        TXT002: label 'The reference %1 does not exist in the bank import entries or has already been allocated';
        CustLedgerEntry1: Record "Cust. Ledger Entry";
        UtilizedAmount: Decimal;
        RemainingAmount: Decimal;
        TXT003: label 'Allocate the reference %1,belonging to %2, amount totalling to %3 to %4';
    begin
        if Confirm(TXT001, true, StudentProcessingHeader."Payment Reference No.", StudentProcessingHeader."Student Name") = true
        then begin
            BankImportEntries.Reset;
            BankImportEntries.SetRange("Reference No.", StudentProcessingHeader."Payment Reference No.");
            BankImportEntries.SetRange(Posted, true);
            BankImportEntries.SetRange(Closed, false);
            if BankImportEntries.FindFirst then begin
                if Confirm(TXT003, true, BankImportEntries."Reference No.", BankImportEntries."Student Identifier", BankImportEntries."Remaining Amount", StudentProcessingHeader."Student Name") = true then begin
                    BankAccountLedgerEntry.Reset;
                    BankAccountLedgerEntry.SetRange("Bank Account No.", BankImportEntries."Bank Code");
                    BankAccountLedgerEntry.SetRange("External Document No.", StudentProcessingHeader."Payment Reference No.");
                    if BankAccountLedgerEntry.FindFirst then begin
                        //create journal to post the entire amount
                        CMSetup.Get;
                        UserSetup.Reset;
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Employee No." <> '' then begin
                                //get user id batch
                                GenJournalBatch.Reset;
                                GenJournalBatch.SetRange("Journal Template Name", CMSetup."Student Allocation Template");
                                GenJournalBatch.SetRange("User ID", UserId);
                                if not GenJournalBatch.FindFirst then begin
                                    //create new  batch
                                    GenJournalBatch1."Journal Template Name" := CMSetup."Student Allocation Template";
                                    GenJournalBatch1.Name := Format(UserSetup."Resource No", 10);
                                    ;
                                    GenJournalBatch1."User ID" := UserId;
                                    GenJournalBatch1.Insert(true);
                                    BatchName := Format(UserSetup."Resource No", 10);
                                end else begin
                                    BatchName := GenJournalBatch.Name;
                                end;
                            end else
                                BatchName := CMSetup."Student Allocation Batch Name";
                        end else
                            BatchName := CMSetup."Student Allocation Batch Name";
                        // Delete Lines Present on the General Journal Line
                        GenJnLine.Reset;
                        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Student Allocation Template");
                        GenJnLine.SetRange(GenJnLine."Journal Batch Name", BatchName);
                        GenJnLine.DeleteAll;
                        LineNo := 10;
                        GenJnLine.Init;
                        GenJnLine."Journal Template Name" := CMSetup."Student Allocation Template";
                        GenJnLine."Journal Batch Name" := BatchName;
                        GenJnLine."Line No." := LineNo + 10;
                        GenJnLine."Account Type" := GenJnLine."account type"::Customer;
                        GenJnLine."Account No." := StudentProcessingHeader."Student No.";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        GenJnLine."Posting Date" := BankAccountLedgerEntry."Posting Date";
                        //added for Currency applications
                        GenJnLine."Currency Code" := BankAccountLedgerEntry."Currency Code";
                        GenJnLine.Validate(GenJnLine."Currency Code");
                        //get the correct remaining amount
                        UtilizedAmount := 0.0;
                        CustLedgerEntry1.Reset;
                        CustLedgerEntry1.SetRange("Customer No.", StudentProcessingHeader."Student No.");
                        CustLedgerEntry1.SetRange("External Document No.", BankImportEntries."Reference No.");
                        CustLedgerEntry1.SetRange(Reversed, false);
                        if CustLedgerEntry1.FindSet then begin
                            repeat
                                CustLedgerEntry1.CalcFields(Amount);
                                UtilizedAmount := UtilizedAmount + Abs(CustLedgerEntry1.Amount);
                            until CustLedgerEntry1.Next = 0;
                        end;
                        if BankImportEntries."Remaining Amount" <> BankImportEntries.Amount then
                            RemainingAmount := BankImportEntries.Amount - UtilizedAmount
                        else
                            RemainingAmount := BankImportEntries."Remaining Amount" - UtilizedAmount;
                        GenJnLine.Amount := -RemainingAmount;
                        GenJnLine.Validate(GenJnLine.Amount);
                        GenJnLine."Document No." := Format(BankImportEntries."Reference No.", 20);
                        GenJnLine."External Document No." := BankImportEntries."Reference No.";
                        GenJnLine.Description := 'Bank Import for: ' + StudentProcessingHeader."Student Name";
                        GenJnLine."Bal. Account Type" := GenJnLine."account type"::"G/L Account";
                        GenJnLine."Bal. Account No." := CMSetup."Unnalocated Account";

                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;

                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GenJnLine);

                        Commit;
                        //end of journal posting
                    end;

                    BankImportEntries.Closed := true;
                    BankImportEntries."Remaining Amount" := 0;
                    BankImportEntries."Applied Amount" := BankImportEntries.Amount;
                    BankImportEntries.Modify(true);
                end else
                    Error(TXT002, StudentProcessingHeader."Payment Reference No.");
                //get the bank reference
            end;
        end
    end;


    procedure BlockStudentAccount(ExaminationAccount: Record "Examination Account")
    var
        TXT001: label 'Are you sure you want to block %1';
    begin
        if Confirm(TXT001, true, ExaminationAccount."Registration No.") = true then begin
            ExaminationAccount.TestField("Blocked Start Date");
            ExaminationAccount.TestField("Blocked End Date");
            ExaminationAccount.Status := ExaminationAccount.Status::Inactive;
            ExaminationAccount.Blocked := true;
            ExaminationAccount.Modify(true);
        end
    end;


    procedure SuggestCenterPapersBooked(CenterHeader: Record "Center  Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalBookedStudents: Integer;
        Courses: Record Courses;
        Papers: Record Papers;
        CenterDispatchLines: Record "Center Dispatch Lines";
        LineNo: Integer;
        TXT001: label 'You cannot overwrite this record since some scripts have already been submitted';
        CenterDispatchLines1: Record "Center Dispatch Lines";
    begin
        TotalBookedStudents := 0;
        LineNo := 0;
        CenterDispatchLines.Reset;
        CenterDispatchLines.SetRange("Document No.", CenterHeader."Document No.");
        CenterDispatchLines.SetRange(Posted, true);
        if CenterDispatchLines.FindFirst then begin
            Error(TXT001);
        end else begin

            CenterDispatchLines.Reset;
            CenterDispatchLines.SetRange("Document No.", CenterHeader."Document No.");
            if CenterDispatchLines.FindSet then begin
                CenterDispatchLines.DeleteAll;
            end;
            Courses.Reset;
            if Courses.FindSet then begin
                repeat
                    Papers.Reset;
                    Papers.SetRange(Course, Courses.Code);
                    Papers.SetRange(Blocked, false);
                    if Papers.FindSet then begin
                        repeat
                            ExamBookingEntries.Reset;
                            ExamBookingEntries.SetRange("Exam Sitting", CenterHeader."Sitting Cycle");
                            ExamBookingEntries.SetRange(Status, ExamBookingEntries.Status::Open);
                            ExamBookingEntries.SetRange("Exam Center", CenterHeader."Center Code");
                            ExamBookingEntries.SetRange(Paper, Papers.Code);
                            if ExamBookingEntries.FindFirst then begin

                                TotalBookedStudents := ExamBookingEntries.Count;
                                if TotalBookedStudents > 0 then begin


                                    CenterDispatchLines."Line No." := FnGetLastLineNo(CenterHeader."Document No.") + 1;
                                    CenterDispatchLines."Document No." := CenterHeader."Document No.";
                                    CenterDispatchLines.Examination := Papers.Course;
                                    CenterDispatchLines."No. of Envelopes" := 1;
                                    CenterDispatchLines.Level := Papers.Level;
                                    CenterDispatchLines."Paper Code" := Papers.Code;
                                    CenterDispatchLines.Validate("Paper Code");
                                    CenterDispatchLines."Quantity Received" := 0;
                                    CenterDispatchLines."Examination Sitting" := CenterHeader."Sitting Cycle";
                                    CenterDispatchLines."No. of Scripts Expected" := TotalBookedStudents;
                                    CenterDispatchLines."Created By" := '';
                                    CenterDispatchLines.Posted := false;
                                    CenterDispatchLines.Submitted := false;
                                    // CenterDispatchLines."Last Modified Date":=CREATEDATETIME(0D,TIME);
                                    CenterDispatchLines.Insert(true);

                                    LineNo += 1;

                                end;

                            end;


                        until Papers.Next = 0
                    end;

                until Courses.Next = 0;
            end;
        end
    end;


    procedure SubmitScriptsUpdated(CenterDispatchLines: Record "Center Dispatch Lines")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalBookedStudents: Integer;
        Courses: Record Courses;
        Papers: Record Papers;
        CenterDispatchLines1: Record "Center Dispatch Lines";
        LineNo: Integer;
    begin

        CenterDispatchLines1.Reset;
        CenterDispatchLines1.SetRange("Line No.", CenterDispatchLines."Line No.");
        CenterDispatchLines1.SetRange(Posted, false);
        CenterDispatchLines1.SetRange("Document No.", CenterDispatchLines."Document No.");
        if CenterDispatchLines1.FindSet then begin
            repeat
                CenterDispatchLines1.Posted := true;
                CenterDispatchLines1."Created By" := UserId;
                CenterDispatchLines1."Last Modified Date" := CreateDatetime(Today, Time);
                CenterDispatchLines1.Modify(true);
            until CenterDispatchLines1.Next = 0;
        end;
    end;


    procedure ReOpenSubmittedScripts(CenterDispatchLines: Record "Center Dispatch Lines")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalBookedStudents: Integer;
        Courses: Record Courses;
        Papers: Record Papers;
        CenterDispatchLines1: Record "Center Dispatch Lines";
        LineNo: Integer;
    begin

        CenterDispatchLines1.Reset;
        CenterDispatchLines1.SetRange("Line No.", CenterDispatchLines."Line No.");
        CenterDispatchLines1.SetRange(Posted, true);
        CenterDispatchLines1.SetRange("Document No.", CenterDispatchLines."Document No.");
        if CenterDispatchLines1.FindSet then begin
            repeat
                CenterDispatchLines1.Posted := false;
                CenterDispatchLines1."Created By" := UserId;
                CenterDispatchLines1."Last Modified Date" := CreateDatetime(Today, Time);
                CenterDispatchLines1.Modify(true);
            until CenterDispatchLines1.Next = 0;
        end;
    end;

    procedure RenewalRemoveInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        TXT001: label 'Invoice %1 sent succesfully';
        TXT002: label 'An invoice no %1 for this renewal has already been processed';
        StudentLines: Record "Student Processing Lines";
        ExaminationAccount: Record "Examination Account";
        DocumentLink: Record "Record Link";
        TXT003: label 'Kindly attach the mandatory document for this application';
        InvoiceHeader: Record "Sales Invoice Header";
        StudentLines1: Record "Student Processing Lines";
        TotalAmount: Decimal;
        TXT004: label 'Select the Examination Center For the Booking %1';
        ExamBookingEntries: Record "Exam Booking Entries";
        TXT005: label 'Booking entries for this student already exist';
        TXT006: label 'Kindly reverse the renewal invoice %1,to allow  removal from the renewal';
    begin

        //check posted invoice
        InvoiceHeader.Reset;
        InvoiceHeader.SetRange("External Document No.", BulkProcessingHeader."No.");
        InvoiceHeader.SetFilter("Remaining Amount", '<>%1', 0);
        if InvoiceHeader.FindSet then begin
            Error(TXT006, InvoiceHeader."No.");
        end else begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if SalesInv.FindFirst then begin
                SalesInv."External Document No." := '';
                SalesInv.Modify(true);
            end;
            BulkProcessingHeader."Renewal Invoice No." := '';
            BulkProcessingHeader.Modify(true);
        end;
    end;

    procedure ExemptionRemoveInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        TXT001: label 'Invoice %1 sent succesfully';
        TXT002: label 'An invoice no %1 for this  has already been processed';
        StudentLines: Record "Student Processing Lines";
        ExaminationAccount: Record "Examination Account";
        DocumentLink: Record "Record Link";
        TXT003: label 'Kindly attach the mandatory document for this application';
        InvoiceHeader: Record "Sales Invoice Header";
        StudentLines1: Record "Student Processing Lines";
        TotalAmount: Decimal;
        TXT004: label 'Select the Examination Center For the Booking %1';
        ExamBookingEntries: Record "Exam Booking Entries";
        TXT005: label 'Booking entries for this student already exist';
        TXT006: label 'Kindly reverse the exemption invoice %1,to allow  removal from the exemption';
    begin

        //check posted invoice
        InvoiceHeader.Reset;
        InvoiceHeader.SetRange("External Document No.", BulkProcessingHeader."No.");
        InvoiceHeader.SetFilter("Remaining Amount", '<>%1', 0);
        if InvoiceHeader.FindSet then begin
            Error(TXT006, InvoiceHeader."No.");
        end else begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if SalesInv.FindFirst then begin
                SalesInv."External Document No." := '';
                SalesInv.Modify(true);
            end;
            BulkProcessingHeader."Exemption Invoice No." := '';
            BulkProcessingHeader.Modify(true);
        end;
    end;

    local procedure "***Suggest Papers Functions******"()
    begin
    end;

    procedure StudentSuggestFunction(Header: Record "Student Processing Header")
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        BookingEntries4: Record "Exam Booking Entries";
        TXT001: label 'The student has open entries for the sitting %1.Update the results first';
    begin
        Message('Logic begin!');
        //new student
        StudentLines.Reset;
        StudentLines.SetRange("Booking Header No.", Header."No.");
        StudentLines.DeleteAll;

        //ensure student has no open entries
        if Header."Additional Exemption" = false then begin
            BookingEntries4.Reset;
            BookingEntries4.SetRange("Student Reg No.", Header."Student Reg. No.");
            BookingEntries4.SetRange(Status, BookingEntries4.Status::Open);
            BookingEntries4.SetRange(Blocked, false);
            if BookingEntries4.FindFirst then begin
                Error(TXT001, BookingEntries4."Exam Sitting");
            end;
        end;
        // BookingEntries.Reset;
        // BookingEntries.SetRange("Student Reg No.", Header."Student Reg. No.");
        // if not BookingEntries.FindFirst then begin
        //     Message('fresh student function!');
        //     FreshPapersStudent(Header."Student Reg. No.");
        //     exit;
        // end;

        FreshPapersStudent(Header."Student Reg. No.");
        FnClearPassedPapers(Header."Student Reg. No.");
        FNClearExemptedPpaers(Header."Student Reg. No.");

        //if student has failed a paper in a level
        // Level.RESET;
        // Level.SETCURRENTKEY(Level);
        // Level.SETASCENDING(Level,FALSE);
        // IF Level.FINDSET THEN BEGIN
        //    REPEAT
        //      //attempted studentt
        //            BookingEntries.RESET;
        //            BookingEntries.SETRANGE("Student Reg No.",Header."Student Reg. No.");
        //            BookingEntries.SETFILTER(Status,'<>%1',BookingEntries.Status::Cancelled);
        //            BookingEntries.SETRANGE(Status,BookingEntries.Status::Failed);
        //            BookingEntries.SETRANGE(Blocked,FALSE);
        //            BookingEntries.SETRANGE(Part,Level.Code);
        //            IF BookingEntries.FINDSET THEN BEGIN
        //              FailedLevelStudent(BookingEntries."Student Reg No.",Level.Code);
        //              EXIT;
        //            END
        //
        // UNTIL Level.NEXT=0;
        // END;

        //if student has passed all papers in a level
        //hrmpeb
        //end end hrmpeb
    end;

    local procedure FreshPapersStudent(Account: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        BulkProcessingHeader: Record "Student Processing Header";
        FoundValue: Boolean;
    begin
        //check if student has booking entries
        FoundValue := false;
        StartLevel := 1;
        BulkProcessingHeader.Reset;
        BulkProcessingHeader.SetRange("Student Reg. No.", Account);
        BulkProcessingHeader.SetRange(Posted, false);
        BulkProcessingHeader.SetRange("Document Type", BulkProcessingHeader."document type"::Booking);
        if BulkProcessingHeader.FindFirst then begin
            // BookingEntries.Reset;
            // BookingEntries.SetRange(Examination, BulkProcessingHeader."Examination ID");
            // BookingEntries.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
            // BookingEntries.SetRange(Blocked, false);
            // if not BookingEntries.FindSet then begin
            Level.Reset;
            Level.SetRange(Course, BulkProcessingHeader."Examination ID");
            //Level.SetRange(Level, StartLevel);
            if Level.FindSet then begin
                repeat
                    Papers.Reset;
                    Papers.SetRange(Level, Level.Code);
                    Papers.SetRange(Blocked, false);
                    Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
                    if Papers.FindSet then begin
                        repeat
                            //check is paper already inserted
                            //Message('%1', Papers.Code);

                            StudentLines2.Reset;
                            StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
                            StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                            StudentLines2.SetRange(Paper, Papers.Code);
                            if not StudentLines2.FindFirst then begin
                                //check if exempted
                                ExemptionEntries.Reset;
                                ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
                                ExemptionEntries.SetRange("No.", Papers.Code);
                                if not ExemptionEntries.FindFirst then begin
                                    //insert all papers
                                    StudentLines1.init;
                                    StudentLines.Reset;
                                    if StudentLines.FindLast then begin
                                        LineNo := StudentLines."Line No.";
                                    end;
                                    StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                                    StudentLines1."Line No." := LineNo + 1;
                                    StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                    StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                    StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                                    StudentLines1.Validate("Student No.");
                                    StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                                    StudentLines1.Part := Level.Code;
                                    StudentLines1.Paper := Papers.Code;
                                    StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                    StudentLines1.Validate(Paper);
                                    StudentLines1.Insert(true);
                                    LineNo += 1;
                                    FoundValue := true;
                                end
                            end

                        until Papers.Next = 0;
                    end;//end of papers
                until Level.next = 0;
                //end; //end of level
                //beginning of logic
                //hrmpeb
                //end hrmpeb
            end
        end
    end;

    procedure SendEmailNotif(BulkProcessingHeader: Record "Student Processing Header")
    var
        EmailItem: Record "Email Item" temporary;
        Customer: Record Customer;
        RecRef: RecordRef;
        OutStr: OutStream;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        BulkProcessingHead: Record "Student Processing Header";
    begin

        EmailItem."Send to" := 'edwinmatara@dynasoft.co.ke';
        EmailItem.Subject := 'Registration Invoice';
        EmailItem.Validate("Plaintext Formatted", false);

        // get the customer record and save the report to outstream
        BulkProcessingHead.SetRange("No.", BulkProcessingHeader."No.");
        RecRef.GetTable(BulkProcessingHead);
        EmailItem.Body.CreateOutStream(OutStr);
        Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);

        EmailItem.Send(true);
    end;

    procedure SendEmailNotif2(BulkProcessingHeader: Record "Student Processing Header")
    var
        Customer: Record Customer;
        // SMTPMail: Codeunit "SMTP Mail";
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        Recipients: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;

        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        BulkProcessingHead: Record "Student Processing Header";
    begin

        Recipients.Add('edwinmatara@dynasoft.co.ke');

        // get the customer record and save the report to outstream then do instream and wrtie it to text
        BulkProcessingHead.SetRange("No.", BulkProcessingHeader."No.");
        RecRef.GetTable(BulkProcessingHead);
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr);
        InStr.ReadText(BodyTxt);

        EmailMessage.Create('drkemari@gmail.com', 'Hello SMTP', BodyTxt);

        // add attachment for with pdf
        TempBlob.CreateOutStream(OutStr2);
        Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr2);
        // EmailMessage.AddAttachmentStream(InStr2, 'attachment.pdf');
        // EmailMessage.add
        EmailMessage.AddAttachment('attachment.pdf', 'PDF', InStr2);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    local procedure FnClearPassedPapers(Account: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        BulkProcessingHeader: Record "Student Processing Header";
        FoundValue: Boolean;
    begin
        //check if student has booking entries
        FoundValue := false;
        StartLevel := 1;
        BulkProcessingHeader.Reset;
        BulkProcessingHeader.SetRange("Student Reg. No.", Account);
        BulkProcessingHeader.SetRange(Posted, false);
        BulkProcessingHeader.SetRange("Document Type", BulkProcessingHeader."document type"::Booking);
        if BulkProcessingHeader.FindFirst then begin
            BookingEntries.Reset;
            BookingEntries.SetRange(Examination, BulkProcessingHeader."Examination ID");
            BookingEntries.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
            BookingEntries.SetRange(Status, BookingEntries.Status::Passed);
            BookingEntries.SetRange(Blocked, false);
            if BookingEntries.Findset() then begin
                repeat
                    StudentLines2.Reset;
                    StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
                    StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                    StudentLines2.SetRange(Paper, BookingEntries.Paper);
                    if StudentLines2.Findset() then begin
                        StudentLines2.Delete();


                    end;
                until BookingEntries.next = 0

            end;
        end
    end;

    procedure FnClearAttemptedPapers(Account: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Exemption Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        BulkProcessingHeader: Record "Student Processing Header";
        FoundValue: Boolean;
    begin
        //check if student has booking entries
        FoundValue := false;
        StartLevel := 1;
        BulkProcessingHeader.Reset;
        BulkProcessingHeader.SetRange("No.", Account);
        BulkProcessingHeader.SetRange(Posted, false);
        // BulkProcessingHeader.SetRange("Document Type", BulkProcessingHeader."document type"::Booking);
        if BulkProcessingHeader.FindFirst then begin
            BookingEntries.Reset;
            BookingEntries.SetRange(Examination, BulkProcessingHeader."Examination ID");
            BookingEntries.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
            BookingEntries.SetFilter(Status, '=%1|%2', BookingEntries.Status::Passed, BookingEntries.Status::Failed);
            BookingEntries.SetRange(Blocked, false);
            if BookingEntries.Findset() then begin
                repeat
                    StudentLines2.Reset;
                    StudentLines2.SetRange("Course Id", BulkProcessingHeader."Examination ID");
                    StudentLines2.SetRange("Header No.", BulkProcessingHeader."No.");
                    StudentLines2.SetRange("No.", BookingEntries.Paper);
                    if StudentLines2.Findset() then begin
                        StudentLines2.Delete();


                    end;
                until BookingEntries.next = 0

            end;
        end
    end;

    local procedure FNClearExemptedPpaers(Account: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        BulkProcessingHeader: Record "Student Processing Header";
        FoundValue: Boolean;
    begin
        //check if student has booking entries
        FoundValue := false;
        StartLevel := 1;
        BulkProcessingHeader.Reset;
        BulkProcessingHeader.SetRange("Student Reg. No.", Account);
        BulkProcessingHeader.SetRange(Posted, false);
        BulkProcessingHeader.SetRange("Document Type", BulkProcessingHeader."document type"::Booking);
        if BulkProcessingHeader.FindFirst then begin
            ExemptionEntries.Reset;
            ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
            // ExemptionEntries.SetRange("No.", Papers.Code);
            if ExemptionEntries.Findset() then begin
                repeat
                    StudentLines2.Reset;
                    StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
                    StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                    StudentLines2.SetRange(Paper, ExemptionEntries."No.");
                    if StudentLines2.Findset() then begin
                        StudentLines2.delete();
                    end
                until ExemptionEntries.next = 0;
            end


        end
    end;

    procedure FNClearExemptedPpaers2(Account: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Exemption Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        BulkProcessingHeader: Record "Student Processing Header";
        FoundValue: Boolean;
    begin
        //check if student has booking entries
        FoundValue := false;
        StartLevel := 1;
        BulkProcessingHeader.Reset;
        BulkProcessingHeader.SetRange("No.", Account);
        BulkProcessingHeader.SetRange(Posted, false);
        // BulkProcessingHeader.SetRange("Document Type", BulkProcessingHeader."document type"::Booking);
        if BulkProcessingHeader.FindFirst then begin
            ExemptionEntries.Reset;
            ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
            // ExemptionEntries.SetRange("No.", Papers.Code);
            if ExemptionEntries.Findset() then begin
                repeat
                    StudentLines2.Reset;
                    StudentLines2.SetRange("Course Id", BulkProcessingHeader."Examination ID");
                    StudentLines2.SetRange("Header No.", BulkProcessingHeader."No.");
                    StudentLines2.SetRange("No.", ExemptionEntries."No.");

                    if StudentLines2.Findset() then begin
                        StudentLines2.delete();
                    end
                until ExemptionEntries.next = 0;
            end


        end
    end;

    local procedure FailedLevelStudent(Account: Code[30]; LevelCode: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
    begin
    end;

    local procedure PassedLevelStudent(Account: Code[30]; LevelCode: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        Level1: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        Header: Record "Student Processing Header";
        ExaminationResults: Record "Exam Booking Entries";
    begin
        Level1.Reset;
        Level1.SetRange(Code, LevelCode);
        if Level1.FindFirst then begin
            StartLevel := Level1.Level + 1;//add level
        end;

        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", Account);
        if ExaminationAccount.FindFirst then begin

            Header.Reset;
            Header.SetRange(Posted, false);
            Header.SetRange("Student Reg. No.", Account);
            Header.SetRange("Document Type", Header."document type"::Booking);
            if Header.FindFirst then begin
                Level.Reset;
                Level.SetRange(Course, ExaminationAccount."Course ID");
                Level.SetRange(Level, StartLevel);
                if Level.FindFirst then begin
                    //insert papers in the higher level
                    Papers.Reset;
                    Papers.SetRange(Level, Level.Code);
                    Papers.SetRange(Blocked, false);
                    Papers.SetRange(Course, ExaminationAccount."Course ID");
                    if Papers.FindSet then begin
                        repeat
                            ExemptionEntries.Reset;
                            ExemptionEntries.SetRange("Stud. Reg. No", ExaminationAccount."Registration No.");
                            ExemptionEntries.SetRange(Deleted, false);
                            ExemptionEntries.SetRange("No.", Papers.Code);
                            if not ExemptionEntries.FindFirst then begin
                                ExaminationResults.Reset;
                                ExaminationResults.SetRange("Student Reg No.", ExaminationAccount."Registration No.");
                                ExaminationResults.SetRange(Status, ExaminationResults.Status::Passed);
                                ExaminationResults.SetRange(Paper, Papers.Code);
                                if not ExaminationResults.FindSet then begin
                                    //check in booking entries as passed
                                    BookingEntries.Reset;
                                    BookingEntries.SetRange("Student Reg No.", ExaminationAccount."Registration No.");
                                    BookingEntries.SetRange(Status, BookingEntries.Status::Passed);
                                    BookingEntries.SetRange(Paper, Papers.Code);
                                    if not BookingEntries.FindFirst then begin
                                        //insert the paper
                                        StudentLines.Reset;
                                        if StudentLines.FindLast then begin
                                            LineNo := StudentLines."Line No.";
                                        end;
                                        StudentLines1."Booking Header No." := Header."No.";
                                        StudentLines1."Line No." := LineNo + 1;
                                        StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                        StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                        StudentLines1."Student No." := Header."Student No.";
                                        StudentLines1.Validate("Student No.");
                                        StudentLines1."Course Id" := Header."Examination ID";
                                        StudentLines1.Part := Level.Code;
                                        StudentLines1.Paper := Papers.Code;
                                        StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                        StudentLines1.Validate(Paper);
                                        StudentLines1.Insert(true);
                                        LineNo += 1;

                                    end
                                end
                            end


                        until Papers.Next = 0;
                        //insert renewal
                        if ExaminationAccount."Renewal Amount" > 0 then begin
                            StudentLines.Reset;
                            if StudentLines.FindLast then begin
                                LineNo := StudentLines."Line No.";
                            end;
                            StudentLines2."Booking Header No." := Header."No.";
                            StudentLines2."Line No." := LineNo + 1;
                            StudentLines2."Transaction Type" := StudentLines1."transaction type"::Renewal;
                            StudentLines2."Document Type" := StudentLines1."document type"::Booking;
                            StudentLines2."Student No." := Header."Student No.";
                            StudentLines2.Validate("Student No.");
                            StudentLines2.Description := Format(StudentLines1."document type"::Renewal);
                            StudentLines2."Course Id" := Header."Examination ID";
                            StudentLines2.Amount := ExaminationAccount."Renewal Amount";
                            StudentLines2."Amount LCY" := ExaminationAccount."Renewal Amount";
                            StudentLines2.Insert(true);
                        end;
                    end
                end
            end
        end

    end;

    local procedure NotCompletedLevelStudent(Account: Code[30]; LevelCode: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        Header: Record "Student Processing Header";
        ExaminationResults: Record "Exam Booking Entries";
    begin
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", Account);
        if ExaminationAccount.FindFirst then begin
            Header.Reset;
            Header.SetRange(Posted, false);
            Header.SetRange("Student Reg. No.", Account);
            Header.SetRange("Document Type", Header."document type"::Booking);
            if Header.FindFirst then begin
                Level.Reset;
                Level.SetRange(Course, ExaminationAccount."Course ID");
                Level.SetRange(Code, LevelCode);
                if Level.FindFirst then begin
                    //insert papers in the higher level
                    Papers.Reset;
                    Papers.SetRange(Level, Level.Code);
                    Papers.SetRange(Blocked, false);
                    Papers.SetRange(Course, ExaminationAccount."Course ID");
                    if Papers.FindSet then begin
                        repeat
                            //not exempted

                            ExemptionEntries.Reset;
                            ExemptionEntries.SetRange("Stud. Reg. No", ExaminationAccount."Registration No.");
                            ExemptionEntries.SetRange(Deleted, false);
                            ExemptionEntries.SetRange("No.", Papers.Code);
                            if not ExemptionEntries.FindFirst then begin
                                //not passed
                                ExaminationResults.Reset;
                                ExaminationResults.SetRange("Student Reg No.", ExaminationAccount."Registration No.");
                                ExaminationResults.SetRange(Status, ExaminationResults.Status::Passed);
                                ExaminationResults.SetRange(Paper, Papers.Code);
                                if not ExaminationResults.FindSet then begin
                                    //insert the paper
                                    //check in booking entries as passed
                                    BookingEntries.Reset;
                                    BookingEntries.SetRange("Student Reg No.", ExaminationAccount."Registration No.");
                                    BookingEntries.SetRange(Status, BookingEntries.Status::Passed);
                                    BookingEntries.SetRange(Paper, Papers.Code);
                                    if not BookingEntries.FindFirst then begin
                                        StudentLines.Reset;
                                        if StudentLines.FindLast then begin
                                            LineNo := StudentLines."Line No.";
                                        end;
                                        StudentLines1."Booking Header No." := Header."No.";
                                        StudentLines1."Line No." := LineNo + 1;
                                        StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                        StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                        StudentLines1."Student No." := Header."Student No.";
                                        StudentLines1.Validate("Student No.");
                                        StudentLines1."Course Id" := Header."Examination ID";
                                        StudentLines1.Part := Level.Code;
                                        StudentLines1.Paper := Papers.Code;
                                        StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                        StudentLines1.Validate(Paper);
                                        StudentLines1.Insert(true);
                                        LineNo += 1;
                                    end
                                end
                            end
                        until Papers.Next = 0;
                        //insert renewal
                        if ExaminationAccount."Renewal Amount" > 0 then begin
                            StudentLines.Reset;
                            if StudentLines.FindLast then begin
                                LineNo := StudentLines."Line No.";
                            end;
                            StudentLines2."Booking Header No." := Header."No.";
                            StudentLines2."Line No." := LineNo + 1;
                            StudentLines2."Transaction Type" := StudentLines1."transaction type"::Renewal;
                            StudentLines2."Document Type" := StudentLines1."document type"::Booking;
                            StudentLines2."Student No." := Header."Student No.";
                            StudentLines2.Validate("Student No.");
                            StudentLines2.Description := Format(StudentLines1."document type"::Renewal);
                            StudentLines2."Course Id" := Header."Examination ID";
                            StudentLines2.Amount := ExaminationAccount."Renewal Amount";
                            StudentLines2."Amount LCY" := ExaminationAccount."Renewal Amount";
                            StudentLines2.Insert(true);
                        end;
                    end
                end
            end
        end
    end;

    local procedure LevelCheckerFunction(Account: Code[30]; LevelCode: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        ExaminationResults: Record "Exam Booking Entries";
        TotalPassed: Integer;
    begin
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", Account);
        if ExaminationAccount.FindFirst then begin

            //introduce old and new streamer logic
            if ((ExaminationAccount."Old Streamer" = false) and (LevelCode <> 'ADVANCED')) then begin
                //get total papers
                Papers.Reset;
                Papers.SetRange(Level, LevelCode);
                Papers.SetRange(Blocked, false);
                Papers.SetRange(Course, ExaminationAccount."Course ID");
                TotalPapers := Papers.Count;

                //get total passed
                ExaminationResults.Reset;
                ExaminationResults.SetRange(Part, LevelCode);
                ExaminationResults.SetRange("Student Reg No.", Account);
                ExaminationResults.SetRange(Status, ExaminationResults.Status::Passed);
                TotalPassed := ExaminationResults.Count;


                //get total exempted
                ExemptionEntries.Reset;
                ExemptionEntries.SetRange("Stud. Reg. No", Account);
                ExemptionEntries.SetRange(Level, LevelCode);
                ExemptionEntries.SetRange(Deleted, false);
                TotalExemption := ExemptionEntries.Count;
                //where student has passed the level
                if TotalPapers = TotalPassed + TotalExemption then begin
                    PassedLevelStudent(ExaminationAccount."Registration No.", LevelCode);
                end;



                //where student is yet to complete the level
                if TotalPapers > TotalPassed + TotalExemption then begin
                    NotCompletedLevelStudent(ExaminationAccount."Registration No.", LevelCode);
                end



            end else begin
                OldStreamerLevelStudent(ExaminationAccount."Registration No.", LevelCode, ExaminationAccount."Course ID");
            end
        end

    end;

    local procedure OldStreamerLevelStudent(Account: Code[30]; LevelCode: Code[30]; CourseCode: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        ExaminationResults: Record "Examination Results";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        TotalMandatory: Integer;
        PassedMandatory: Integer;
        PassedOptional: Integer;
    begin
        Papers.Reset;
        Papers.SetRange(Level, LevelCode);
        Papers.SetRange(Blocked, false);
        Papers.SetRange(Status, Papers.Status::Mandatory);
        Papers.SetRange(Course, CourseCode);
        TotalMandatory := Papers.Count;

        //check if student has passed all mandatory papers
        PassedMandatory := 0;
        PassedOptional := 0;
        Papers2.Reset;
        Papers2.SetRange(Level, LevelCode);
        Papers2.SetRange(Blocked, false);
        Papers2.SetRange(Status, Papers2.Status::Mandatory);
        Papers2.SetRange(Course, CourseCode);
        if Papers2.FindSet then begin
            repeat
                ExaminationResults.Reset;
                ExaminationResults.SetRange(Part, LevelCode);
                ExaminationResults.SetRange(Paper, Papers2.Code);
                ExaminationResults.SetRange("Student Reg No.", Account);
                ExaminationResults.SetRange(Passed, true);
                if ExaminationResults.FindFirst then begin
                    PassedMandatory := PassedMandatory + 1;
                end;

            until Papers2.Next = 0;
        end;
        if PassedMandatory = TotalMandatory then begin
            PassedOldStreamerLevelStudent(Account, LevelCode, CourseCode);
        end
        else begin
            NotCompletedLevelStudent(Account, LevelCode);
        end

    end;

    local procedure PassedOldStreamerLevelStudent(Account: Code[30]; LevelCode: Code[30]; CourseCode: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines";
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        ExaminationResults: Record "Examination Results";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        TotalMandatory: Integer;
        PassedMandatory: Integer;
        PassedOptional: Integer;
    begin
        PassedOptional := 0;
        Papers2.Reset;
        Papers2.SetRange(Level, LevelCode);
        Papers2.SetRange(Blocked, false);
        Papers2.SetRange(Status, Papers2.Status::Optional);
        Papers2.SetRange(Course, CourseCode);
        if Papers2.FindSet then begin
            repeat
                ExaminationResults.Reset;
                ExaminationResults.SetRange(Part, LevelCode);
                ExaminationResults.SetRange(Paper, Papers2.Code);
                ExaminationResults.SetRange("Student Reg No.", Account);
                ExaminationResults.SetRange(Passed, true);
                PassedOptional := PassedOptional + 1;
            until Papers2.Next = 0;
        end;
        if PassedOptional > 0 then begin
            PassedLevelStudent(Account, LevelCode);
        end else begin
            NotCompletedLevelStudent(Account, LevelCode);
        end


    end;

    procedure BookingCheckAdvancedPapers(ProcessingHeader: Record "Student Processing Header")
    var
        ProcessingLines: Record "Student Processing Lines";
        TXT001: label 'You are not allowed to select more than 2 Advanced level optional papers';
        Papers: Record Papers;
        Level: Record Level;
        LevelCode: Code[30];
        TotalPapers: Integer;
    begin
        Level.Reset;
        Level.SetRange(Level, 3);
        Level.SetRange(Course, ProcessingHeader."Examination ID");
        if Level.FindFirst then begin
            LevelCode := Level.Code;
        end;

        TotalPapers := 0;
        ProcessingLines.Reset;
        ProcessingLines.SetRange("Booking Header No.", ProcessingHeader."No.");
        ProcessingLines.SetRange(Part, LevelCode);
        if ProcessingLines.FindSet then begin
            repeat
                Papers.Reset;
                Papers.SetRange(Course, ProcessingHeader."Examination ID");
                Papers.SetRange(Level, LevelCode);
                Papers.SetRange(Code, ProcessingLines.Paper);
                Papers.SetRange(Status, Papers.Status::Optional);
                if Papers.FindSet then begin
                    TotalPapers := TotalPapers + 1;
                end;
            until ProcessingLines.Next = 0;
        end;
        if TotalPapers > 2 then
            Error(TXT001);
    end;

    local procedure "*********Mpesa integration***********"()
    begin
    end;


    procedure UpdateMpesaDetails(MPESAEntry: Record "MPESA Integration Table"; CorrectAmount: Decimal)
    var
        MPESAIntegrationTable: Record "MPESA Integration Table";
    begin
        MPESAEntry.Reset;
        MPESAEntry.SetRange(MPESA_TXN_ID, MPESAEntry.MPESA_TXN_ID);
        if MPESAEntry.FindFirst then begin
            if MPESAEntry."Remaining Amount" <> CorrectAmount then begin
                MPESAEntry."Remaining Amount" := CorrectAmount;
                MPESAEntry."Applied Amount" := MPESAEntry.MPESA_AMOUNT - CorrectAmount;
                MPESAEntry.Fetch := false;
                MPESAEntry.Modify(true);
            end else begin
                MPESAEntry.Fetch := false;
                MPESAEntry.Modify(true);
            end
        end
    end;

    local procedure "***Suggest Papers Comparison  Functions******"()
    begin
    end;

    procedure StudentSuggestFunction1(Header: Record "Student Processing Header")
    var
        StudentProcessingLines: Record "Student Processing Lines-Data";
        StudentLines: Record "Student Processing Lines-Data";
        StudentLines1: Record "Student Processing Lines-Data";
        StudentLines2: Record "Student Processing Lines-Data";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines-Data";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
    begin
        //new student
        StudentLines.Reset;
        StudentLines.SetRange("Booking Header No.", Header."No.");
        StudentLines.DeleteAll;

        BookingEntries.Reset;
        BookingEntries.SetRange("Student Reg No.", Header."Student Reg. No.");
        BookingEntries.SetFilter("Exam Sitting", '<>%1', 'APRIL 2022');
        if not BookingEntries.FindFirst then begin
            FreshPapersStudent(Header."Student Reg. No.");
            exit;
        end;
        //if student has failed a paper in a level
        // Level.RESET;
        // Level.SETCURRENTKEY(Level);
        // Level.SETASCENDING(Level,FALSE);
        // IF Level.FINDSET THEN BEGIN
        //    REPEAT
        //      //attempted studentt
        //            BookingEntries.RESET;
        //            BookingEntries.SETRANGE("Student Reg No.",Header."Student Reg. No.");
        //            BookingEntries.SETFILTER(Status,'<>%1',BookingEntries.Status::Cancelled);
        //            BookingEntries.SETRANGE(Status,BookingEntries.Status::Failed);
        //            BookingEntries.SETRANGE(Blocked,FALSE);
        //            BookingEntries.SETRANGE(Part,Level.Code);
        //            IF BookingEntries.FINDSET THEN BEGIN
        //              FailedLevelStudent(BookingEntries."Student Reg No.",Level.Code);
        //              EXIT;
        //            END
        //
        // UNTIL Level.NEXT=0;
        // END;

        //if student has passed all papers in a level
        Level.Reset;
        Level.SetCurrentkey(Level);
        Level.SetAscending(Level, false);
        if Level.FindSet then begin
            repeat
                //attempted studentt
                BookingEntries.Reset;
                BookingEntries.SetRange("Student Reg No.", Header."Student Reg. No.");
                //BookingEntries.SETFILTER(Status,'<>%1',BookingEntries.Status::Cancelled);
                BookingEntries.SetFilter("Exam Sitting", '<>%1', 'APRIL 2022');
                BookingEntries.SetRange(Part, Level.Code);
                if BookingEntries.FindSet then begin

                    LevelCheckerFunction(BookingEntries."Student Reg No.", Level.Code);
                    exit;
                end

            until Level.Next = 0;
        end;
    end;

    local procedure FreshPapersStudent1(Account: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines-Data";
        StudentLines: Record "Student Processing Lines-Data";
        StudentLines1: Record "Student Processing Lines-Data";
        StudentLines2: Record "Student Processing Lines-Data";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines-Data";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        BulkProcessingHeader: Record "Student Processing Header";
    begin
        //check if student has booking entries
        StartLevel := 1;
        BulkProcessingHeader.Reset;
        BulkProcessingHeader.SetRange("Student Reg. No.", Account);
        //BulkProcessingHeader.SETRANGE(Posted,FALSE);
        BulkProcessingHeader.SetRange("Document Type", BulkProcessingHeader."document type"::Booking);
        if BulkProcessingHeader.FindFirst then begin
            BookingEntries.Reset;
            BookingEntries.SetRange(Examination, BulkProcessingHeader."Examination ID");
            BookingEntries.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
            BookingEntries.SetFilter("Exam Sitting", '<>%1', 'APRIL 2022');
            if not BookingEntries.FindSet then begin

                Level.Reset;
                Level.SetRange(Course, BulkProcessingHeader."Examination ID");
                Level.SetRange(Level, StartLevel);
                if Level.FindFirst then begin
                    Papers.Reset;
                    Papers.SetRange(Level, Level.Code);
                    Papers.SetRange(Blocked, false);
                    Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
                    if Papers.FindSet then begin
                        repeat
                            //check is paper already inserted

                            StudentLines2.Reset;
                            StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
                            StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
                            StudentLines2.SetRange(Paper, Papers.Code);
                            if not StudentLines2.FindFirst then begin
                                //check if exempted
                                ExemptionEntries.Reset;
                                ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
                                ExemptionEntries.SetRange("No.", Papers.Code);
                                if not ExemptionEntries.FindFirst then begin
                                    //insert all papers
                                    StudentLines.Reset;
                                    if StudentLines.FindLast then begin
                                        LineNo := StudentLines."Line No.";
                                    end;
                                    StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
                                    StudentLines1."Line No." := LineNo + 1;
                                    StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                    StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                    StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                                    StudentLines1.Validate("Student No.");
                                    StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                                    StudentLines1.Part := Level.Code;
                                    StudentLines1.Paper := Papers.Code;
                                    StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                    StudentLines1.Validate(Paper);
                                    StudentLines1.Insert(true);
                                    LineNo += 1;
                                end
                            end

                        until Papers.Next = 0;
                    end;//end of papers

                end //end of level
            end
        end
    end;

    local procedure FailedLevelStudent1(Account: Code[30]; LevelCode: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines-Data";
        StudentLines: Record "Student Processing Lines-Data";
        StudentLines1: Record "Student Processing Lines-Data";
        StudentLines2: Record "Student Processing Lines-Data";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines-Data";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
    begin
    end;

    local procedure PassedLevelStudent1(Account: Code[30]; LevelCode: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines-Data";
        StudentLines: Record "Student Processing Lines-Data";
        StudentLines1: Record "Student Processing Lines-Data";
        StudentLines2: Record "Student Processing Lines-Data";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        Level1: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines-Data";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        Header: Record "Student Processing Header";
        ExaminationResults: Record "Examination Results";
    begin
        Level1.Reset;
        Level1.SetRange(Code, LevelCode);
        if Level1.FindFirst then begin
            StartLevel := Level1.Level + 1;//add level
        end;

        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", Account);
        if ExaminationAccount.FindFirst then begin

            Header.Reset;
            //Header.SETRANGE(Posted,FALSE);
            Header.SetRange("Student Reg. No.", Account);
            Header.SetRange("Document Type", Header."document type"::Booking);
            if Header.FindFirst then begin
                Level.Reset;
                Level.SetRange(Course, ExaminationAccount."Course ID");
                Level.SetRange(Level, StartLevel);
                if Level.FindFirst then begin
                    //insert papers in the higher level
                    Papers.Reset;
                    Papers.SetRange(Level, Level.Code);
                    Papers.SetRange(Course, ExaminationAccount."Course ID");
                    if Papers.FindSet then begin
                        repeat
                            ExemptionEntries.Reset;
                            ExemptionEntries.SetRange("Stud. Reg. No", ExaminationAccount."Registration No.");
                            ExemptionEntries.SetRange(Deleted, false);
                            ExemptionEntries.SetRange("No.", Papers.Code);
                            if not ExemptionEntries.FindFirst then begin
                                ExaminationResults.Reset;
                                ExaminationResults.SetRange("Student Reg No.", ExaminationAccount."Registration No.");
                                ExaminationResults.SetRange(Passed, true);
                                ExaminationResults.SetRange(Paper, Papers.Code);
                                if not ExaminationResults.FindSet then begin
                                    //check in booking entries as passed
                                    BookingEntries.Reset;
                                    BookingEntries.SetRange("Student Reg No.", ExaminationAccount."Registration No.");
                                    BookingEntries.SetRange(Status, BookingEntries.Status::Passed);
                                    BookingEntries.SetRange(Paper, Papers.Code);
                                    if not BookingEntries.FindFirst then begin
                                        //insert the paper
                                        StudentLines.Reset;
                                        if StudentLines.FindLast then begin
                                            LineNo := StudentLines."Line No.";
                                        end;
                                        StudentLines1."Booking Header No." := Header."No.";
                                        StudentLines1."Line No." := LineNo + 1;
                                        StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                        StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                        StudentLines1."Student No." := Header."Student No.";
                                        StudentLines1.Validate("Student No.");
                                        StudentLines1."Course Id" := Header."Examination ID";
                                        StudentLines1.Part := Level.Code;
                                        StudentLines1.Paper := Papers.Code;
                                        StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                        StudentLines1.Validate(Paper);
                                        StudentLines1.Insert(true);
                                        LineNo += 1;

                                    end
                                end
                            end


                        until Papers.Next = 0;
                        //insert renewal
                        if ExaminationAccount."Renewal Amount" > 0 then begin
                            StudentLines.Reset;
                            if StudentLines.FindLast then begin
                                LineNo := StudentLines."Line No.";
                            end;
                            StudentLines2."Booking Header No." := Header."No.";
                            StudentLines2."Line No." := LineNo + 1;
                            StudentLines2."Transaction Type" := StudentLines1."transaction type"::Renewal;
                            StudentLines2."Document Type" := StudentLines1."document type"::Booking;
                            StudentLines2."Student No." := Header."Student No.";
                            StudentLines2.Validate("Student No.");
                            StudentLines2.Description := Format(StudentLines1."document type"::Renewal);
                            StudentLines2."Course Id" := Header."Examination ID";
                            StudentLines2.Amount := ExaminationAccount."Renewal Amount";
                            StudentLines2."Amount LCY" := ExaminationAccount."Renewal Amount";
                            StudentLines2.Insert(true);
                        end;
                    end
                end
            end
        end

    end;

    local procedure NotCompletedLevelStudent1(Account: Code[30]; LevelCode: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines-Data";
        StudentLines: Record "Student Processing Lines-Data";
        StudentLines1: Record "Student Processing Lines-Data";
        StudentLines2: Record "Student Processing Lines-Data";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines-Data";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        Header: Record "Student Processing Header";
        ExaminationResults: Record "Examination Results";
    begin
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", Account);
        if ExaminationAccount.FindFirst then begin
            Header.Reset;
            // Header.SETRANGE(Posted,FALSE);
            Header.SetRange("Student Reg. No.", Account);
            Header.SetRange("Document Type", Header."document type"::Booking);
            if Header.FindFirst then begin
                Level.Reset;
                Level.SetRange(Course, ExaminationAccount."Course ID");
                Level.SetRange(Code, LevelCode);
                if Level.FindFirst then begin
                    //insert papers in the higher level
                    Papers.Reset;
                    Papers.SetRange(Level, Level.Code);
                    Papers.SetRange(Course, ExaminationAccount."Course ID");
                    if Papers.FindSet then begin
                        repeat
                            //not exempted

                            ExemptionEntries.Reset;
                            ExemptionEntries.SetRange("Stud. Reg. No", ExaminationAccount."Registration No.");
                            ExemptionEntries.SetRange(Deleted, false);
                            ExemptionEntries.SetRange("No.", Papers.Code);
                            if not ExemptionEntries.FindFirst then begin
                                //not passed
                                ExaminationResults.Reset;
                                ExaminationResults.SetRange("Student Reg No.", ExaminationAccount."Registration No.");
                                ExaminationResults.SetRange(Passed, true);
                                ExaminationResults.SetRange(Paper, Papers.Code);
                                if not ExaminationResults.FindSet then begin
                                    //insert the paper
                                    //check in booking entries as passed
                                    BookingEntries.Reset;
                                    BookingEntries.SetRange("Student Reg No.", ExaminationAccount."Registration No.");
                                    BookingEntries.SetRange(Status, BookingEntries.Status::Passed);
                                    BookingEntries.SetRange(Paper, Papers.Code);
                                    if not BookingEntries.FindFirst then begin
                                        StudentLines.Reset;
                                        if StudentLines.FindLast then begin
                                            LineNo := StudentLines."Line No.";
                                        end;
                                        StudentLines1."Booking Header No." := Header."No.";
                                        StudentLines1."Line No." := LineNo + 1;
                                        StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
                                        StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                                        StudentLines1."Student No." := Header."Student No.";
                                        StudentLines1.Validate("Student No.");
                                        StudentLines1."Course Id" := Header."Examination ID";
                                        StudentLines1.Part := Level.Code;
                                        StudentLines1.Paper := Papers.Code;
                                        StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                                        StudentLines1.Validate(Paper);
                                        StudentLines1.Insert(true);
                                        LineNo += 1;
                                    end
                                end
                            end
                        until Papers.Next = 0;
                        //insert renewal
                        if ExaminationAccount."Renewal Amount" > 0 then begin
                            StudentLines.Reset;
                            if StudentLines.FindLast then begin
                                LineNo := StudentLines."Line No.";
                            end;
                            StudentLines2."Booking Header No." := Header."No.";
                            StudentLines2."Line No." := LineNo + 1;
                            StudentLines2."Transaction Type" := StudentLines1."transaction type"::Renewal;
                            StudentLines2."Document Type" := StudentLines1."document type"::Booking;
                            StudentLines2."Student No." := Header."Student No.";
                            StudentLines2.Validate("Student No.");
                            StudentLines2.Description := Format(StudentLines1."document type"::Renewal);
                            StudentLines2."Course Id" := Header."Examination ID";
                            StudentLines2.Amount := ExaminationAccount."Renewal Amount";
                            StudentLines2."Amount LCY" := ExaminationAccount."Renewal Amount";
                            StudentLines2.Insert(true);
                        end;
                    end
                end
            end
        end
    end;

    local procedure LevelCheckerFunction1(Account: Code[30]; LevelCode: Code[30])
    var
        StudentProcessingLines: Record "Student Processing Lines-Data";
        StudentLines: Record "Student Processing Lines-Data";
        StudentLines1: Record "Student Processing Lines-Data";
        StudentLines2: Record "Student Processing Lines-Data";
        BookingEntries: Record "Exam Booking Entries";
        Exam: Record Courses;
        Level: Record Level;
        StartLevel: Integer;
        LineNo: Integer;
        Papers: Record Papers;
        ExemptionEntries: Record "Exemption Entries";
        ExemptionEntries1: Record "Exemption Entries";
        LevelNo: Integer;
        LevelNo1: Integer;
        ExaminationAccount: Record "Examination Account";
        BookingEntries1: Record "Exam Booking Entries";
        TotalExemption: Integer;
        TotalPapers: Integer;
        Window: Dialog;
        RegistrationMonth: Integer;
        ExamSitting: Record "Exam Sitting Cycle";
        SittingMonth: Integer;
        PapersInserted: Integer;
        StudentLines3: Record "Student Processing Lines-Data";
        BookingEntries2: Record "Exam Booking Entries";
        LevelNoCont: Code[30];
        ExemptionEntries2: Record "Exemption Entries";
        BookingEntries3: Record "Exam Booking Entries";
        Papers2: Record Papers;
        ExaminationResults: Record "Examination Results";
        TotalPassed: Integer;
    begin
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Registration No.", Account);
        if ExaminationAccount.FindFirst then begin
            //get total papers
            Papers.Reset;
            Papers.SetRange(Level, LevelCode);
            Papers.SetRange(Blocked, false);
            Papers.SetRange(Course, ExaminationAccount."Course ID");
            TotalPapers := Papers.Count;

            //get total passed
            ExaminationResults.Reset;
            ExaminationResults.SetRange(Part, LevelCode);
            ExaminationResults.SetRange("Student Reg No.", Account);
            ExaminationResults.SetRange(Passed, true);
            TotalPassed := ExaminationResults.Count;


            //get total exempted
            ExemptionEntries.Reset;
            ExemptionEntries.SetRange("Stud. Reg. No", Account);
            ExemptionEntries.SetRange(Level, LevelCode);
            ExemptionEntries.SetRange(Deleted, false);
            TotalExemption := ExemptionEntries.Count;
            //where student has passed the level
            if TotalPapers = TotalPassed + TotalExemption then begin
                PassedLevelStudent(ExaminationAccount."Registration No.", LevelCode);
            end;



            //where student is yet to complete the level
            if TotalPapers > TotalPassed + TotalExemption then begin
                NotCompletedLevelStudent(ExaminationAccount."Registration No.", LevelCode);
            end




        end

    end;

    local procedure "*************************Curriculum Development*************************"()
    begin
    end;


    procedure CreateSyllabusJob(var SyallabusReview: Record "Syllabus Review") CreatedJob: Boolean
    var
        JobTask: Record "Job Task";
        Job: Record Job;
        ProjectReviewTasks: Record "Project Review Tasks";
        ExaminationSetup: Record "Examination Setup";
    begin
        ExaminationSetup.Get;
        ExaminationSetup.TestField("Default Bill To Customer");
        Job.Reset;
        Job."No." := SyallabusReview."Application No.";
        Job."Bill-to Customer No." := ExaminationSetup."Default Bill To Customer";
        Job.Validate("Bill-to Customer No.");
        Job.Validate(Description, SyallabusReview."Syllabus Name" + '-' + SyallabusReview."Syllabus Type Name");
        Job."Creation Date" := Today;
        Job."Starting Date" := Today;
        //Job."Document Type" := Job."document type"::"4";
        Job."Person Responsible" := SyallabusReview."Person Responsible";
        Job.Validate("Person Responsible");
        Job.Insert(true);
        ProjectReviewTasks.Reset;
        ProjectReviewTasks.SetRange("Type of Syllabus", SyallabusReview."Type of Syllabus");
        if ProjectReviewTasks.FindSet then begin
            repeat
                JobTask."Job Task No." := ProjectReviewTasks.Code;
                JobTask."Job No." := SyallabusReview."Application No.";
                JobTask.Description := ProjectReviewTasks.Description;
                JobTask.Insert(true);
            until ProjectReviewTasks.Next = 0;
        end;
        SyallabusReview.Status := SyallabusReview.Status::"Stakeholder Views";
        SyallabusReview."Project No." := Job."No.";
        SyallabusReview.Modify(true);
        Page.Run(85301, Job, Job."No.");
    end;


    // procedure AppointTaskForce(Header: Record UnknownRecord51263)
    // var
    //     ResourceLines: Record "Resource Accreditation Lines";
    //     JobPlanningLines: Record "Job Planning Line";
    //     LineNo: Integer;
    // begin
    //     Header.TestField(Posted, false);
    //     Header.TestField("Start Date");
    //     Header.TestField("Tentative End Date");

    //     JobPlanningLines.Reset;
    //     if JobPlanningLines.FindLast then begin
    //         LineNo := JobPlanningLines."Line No.";
    //     end;
    //     ResourceLines.Reset;
    //     ResourceLines.SetRange("Resource Card No.", Header.Code);
    //     ResourceLines.SetRange("Job No", Header."Job No");
    //     ResourceLines.SetRange(Confirmed, true);
    //     ResourceLines.SetRange(Appoint, false);
    //     if ResourceLines.FindSet then begin

    //         repeat
    //             JobPlanningLines.Init;
    //             JobPlanningLines."Line No." := LineNo + 1;
    //             JobPlanningLines."Job No." := ResourceLines."Job No";
    //             JobPlanningLines."Job Task No." := ResourceLines."Job Task Code";
    //             JobPlanningLines.Validate(Type, ResourceLines."Account Type");
    //             JobPlanningLines.Validate("No.", ResourceLines."Account No");
    //             JobPlanningLines."Planning Date" := Header."Start Date";
    //             JobPlanningLines."Planned Delivery Date" := Header."Tentative End Date";
    //             JobPlanningLines."Document No." := Header.Code;
    //             JobPlanningLines.Quantity := ResourceLines.Quantity;
    //             JobPlanningLines."Unit Cost" := ResourceLines.Amount;
    //             JobPlanningLines."Work Type Code" := ResourceLines."Work Type";
    //             JobPlanningLines.Validate("Work Type Code");
    //             JobPlanningLines.Validate(Quantity);
    //             JobPlanningLines.Validate("Unit Cost");
    //             JobPlanningLines.Insert(true);
    //             ResourceLines.Status := ResourceLines.Status::Completed;
    //             LineNo := LineNo + 1;
    //             ResourceLines.Appoint := true;
    //             ResourceLines."Appointed On" := CurrentDatetime;
    //             TaskForceInvitationEmail(ResourceLines);
    //             ResourceLines.Notified := true;
    //             ResourceLines."Notified On" := CurrentDatetime;
    //             ResourceLines.Modify(true);
    //         until ResourceLines.Next = 0;
    //         Header.Posted := true;
    //         Header."Posted By" := UserId;
    //         Header."Posted Date" := Today;

    //         Message('Resources to the project %1, have been assigned succesfully and email notifications sent', ResourceLines."Job No");
    //     end else
    //         Message('There are no resources to appoint');
    // end;


    procedure CloseSyllabusJob(var SyallabusReview: Record "Syllabus Review") CreatedJob: Boolean
    var
        JobTask: Record "Job Task";
        Job: Record Job;
        ProjectReviewTasks: Record "Project Review Tasks";
        ExaminationSetup: Record "Examination Setup";
        TXT001: label 'The review process %1 has been completed';
    begin
        Job.Reset;
        Job.SetRange("No.", SyallabusReview."Application No.");
        if Job.FindFirst then begin
            SyallabusReview.Status := SyallabusReview.Status::Completed;
            SyallabusReview.Modify(true);
            Job.Complete := true;
            Job.Status := Job.Status::Completed;
            Job.Validate(Status);
            Job."Completed (%)" := 100;
            Job.Modify(true);
            Message(TXT001, SyallabusReview."Syllabus Name");
        end;

    end;

    procedure TaskForceInvitationEmail(ResourceLines: Record "Resource Accreditation Lines")
    var
        AccreditationSetup: Record "Accreditation Setups";
        CompInfo: Record "Company Information";
        Window: Dialog;
        WindowisOpen: Boolean;
        SMTPMailSet: Record "Email Account";
        objCustomer: Record Resource;
        Customer: Code[30];
        Notification1: Codeunit "Email Message";
    begin
        // SMTPMailSet.Get;
        // objCustomer.Reset;//insert control to find a unique member
        // objCustomer.Get(ResourceLines."Account No");//<a href="https://imis.cue.or.ke/">imis.cue.or.ke</a>
        // Customer := ResourceLines."Account No";
        // Notification1.CreateMessage('HRMPEB', SMTPMailSet."Email Sender Address", objCustomer.Address, 'Invitation to Work Order',
        //         'Dear ' + objCustomer.Name + ',<BR><BR>' +
        //         ' HRMPEB has identified you as a suitable Resource Person for the<B> ' + ' ' + UpperCase(ResourceLines."Job Task Description") + '</b> ' +
        //         '<BR>' +
        //         '', true);
        // //change address to email
        // Notification1.AppendToBody(
        // '<BR><BR>SYLLABUS DEVELOPMENT,''<BR>' + CompInfo.Name + '<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
        // Notification1.AddBCC(SMTPMailSet."Email Sender Address");
        // Notification1.Send;
    end;


    procedure CreateSyllabusDraft(var SyallabusReview: Record "Syllabus Review")
    var
        SyllabusHeader: Record "Syllabus Header";
        SyllabusPapers: Record "Syllabus Papers";
        SyllabusPaperLine: Record "Syllabus Paper Line";
        ExaminationSetup: Record "Examination Setup";
        SyllabusRules: Record "Syllabus Rules and Regulations";
        SyllabusHeader1: Record "Syllabus Header";
        SyllabusPapers1: Record "Syllabus Papers";
        SyllabusPaperLine1: Record "Syllabus Paper Line";
        ExaminationSetup1: Record "Examination Setup";
        SyllabusRules1: Record "Syllabus Rules and Regulations";
        DraftNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TXT001: label 'Draft syllabus no. %1 has been created succesfully';
    begin
        //create a new syllabus
        ExaminationSetup.Get;
        SyllabusHeader1.Init;
        if DraftNo = '' then begin
            ExaminationSetup.TestField("Draft Syllabus Nos.");
            NoSeriesMgt.InitSeries(ExaminationSetup."Draft Syllabus Nos.", ExaminationSetup."Draft Syllabus Nos.", 0D, DraftNo, ExaminationSetup."Draft Syllabus Nos.");
        end;
        SyllabusHeader1.Code := DraftNo;
        SyllabusHeader1."Original Syllabus No." := SyallabusReview."Syllabus No.";
        SyllabusHeader1.Description := SyallabusReview.Description;
        SyllabusHeader1."Domain Code" := SyallabusReview."Domain Code";
        SyllabusHeader1."Domain Name" := SyallabusReview."Domain Name";
        SyllabusHeader1."External Document No." := SyallabusReview."Application No.";
        SyllabusHeader1."Project ID" := SyallabusReview."Application No.";
        SyllabusHeader1.Status := SyllabusHeader1.Status::"Under Review";
        SyllabusHeader1."Created By" := UserId;
        SyllabusHeader1."Created On" := CurrentDatetime;
        SyllabusHeader1."Document Type" := SyllabusHeader1."document type"::Draft;
        SyllabusHeader1.Insert(true);

        SyllabusHeader.Reset;
        SyllabusHeader.SetRange(Code, SyallabusReview."Syllabus No.");
        if SyllabusHeader.FindFirst then begin
            //copy papers
            SyllabusPapers.Reset;
            SyllabusPapers.SetRange("Syllabus No.", SyllabusHeader.Code);
            if SyllabusPapers.FindSet then begin
                repeat
                    SyllabusPapers1.Init;
                    SyllabusPapers1.TransferFields(SyllabusPapers);
                    SyllabusPapers1."Document Type" := SyllabusPapers1."document type"::Draft;
                    SyllabusPapers1."Syllabus No." := DraftNo;
                    SyllabusPapers1.Insert(true);

                until SyllabusPapers.Next = 0;
            end;
            //COPY Paper details
            SyllabusPaperLine.Reset;
            SyllabusPaperLine.SetRange("Syllabus No.", SyallabusReview."Syllabus No.");
            if SyllabusPaperLine.FindSet then begin
                repeat
                    SyllabusPaperLine1.Init;
                    SyllabusPaperLine1.TransferFields(SyllabusPaperLine);
                    SyllabusPaperLine1."Syllabus No." := DraftNo;
                    SyllabusPaperLine1.Insert(true);
                until SyllabusPaperLine.Next = 0;
            end;
            //COPY Rules
            SyllabusRules.Reset;
            SyllabusRules.SetRange("Syllabus No.", SyallabusReview."Syllabus No.");
            if SyllabusRules.FindSet then begin
                repeat
                    SyllabusRules1.Init;
                    SyllabusRules1.TransferFields(SyllabusRules);
                    SyllabusRules1."Syllabus No." := DraftNo;
                    SyllabusRules1.Insert(true);
                until SyllabusRules.Next = 0;
            end;
            Message(TXT001, DraftNo);
        end


    end;


    procedure CreateSyllabusNew(var SyallabusReview: Record "Syllabus Review"; var VerdictDate: Date)
    var
        SyllabusHeader: Record "Syllabus Header";
        SyllabusPapers: Record "Syllabus Papers";
        SyllabusPaperLine: Record "Syllabus Paper Line";
        ExaminationSetup: Record "Examination Setup";
        SyllabusRules: Record "Syllabus Rules and Regulations";
        SyllabusHeader1: Record "Syllabus Header";
        SyllabusPapers1: Record "Syllabus Papers";
        SyllabusPaperLine1: Record "Syllabus Paper Line";
        ExaminationSetup1: Record "Examination Setup";
        SyllabusRules1: Record "Syllabus Rules and Regulations";
        DraftNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TXT001: label 'The Syllabus no. %1 has been created succesfully and %2 marked as archive';
    begin
        //create a new syllabus
        ExaminationSetup.Get;
        SyllabusHeader1.Init;
        if DraftNo = '' then begin
            ExaminationSetup.TestField("Syllabus Nos.");
            NoSeriesMgt.InitSeries(ExaminationSetup."Syllabus Nos.", ExaminationSetup."Syllabus Nos.", 0D, DraftNo, ExaminationSetup."Syllabus Nos.");
        end;
        SyllabusHeader1.Code := DraftNo;
        SyllabusHeader1."Original Syllabus No." := SyallabusReview."Syllabus No.";
        SyllabusHeader1.Description := SyallabusReview.Description;
        SyllabusHeader1."Domain Code" := SyallabusReview."Domain Code";
        SyllabusHeader1."Domain Name" := SyallabusReview."Domain Name";
        SyllabusHeader1."External Document No." := SyallabusReview."Application No.";
        SyllabusHeader1."Project ID" := SyallabusReview."Application No.";
        SyllabusHeader1.Status := SyllabusHeader1.Status::Current;
        SyllabusHeader1."Created By" := UserId;
        SyllabusHeader1."Created On" := CurrentDatetime;
        SyllabusHeader1."Approval Date" := VerdictDate;
        SyllabusHeader1."Next Minor Review Date" := CalcDate('+3Y', VerdictDate);
        SyllabusHeader1."Next Major Review Date" := CalcDate('+5Y', VerdictDate);
        SyllabusHeader1."Document Type" := SyllabusHeader1."document type"::Syllabus;
        SyllabusHeader1.Insert(true);

        SyllabusHeader.Reset;
        SyllabusHeader.SetRange(Code, SyallabusReview."Syllabus No.");
        if SyllabusHeader.FindFirst then begin
            //copy papers
            SyllabusPapers.Reset;
            SyllabusPapers.SetRange("Syllabus No.", SyllabusHeader.Code);
            if SyllabusPapers.FindSet then begin
                repeat
                    SyllabusPapers1.Init;
                    SyllabusPapers1.TransferFields(SyllabusPapers);
                    SyllabusPapers1."Document Type" := SyllabusPapers1."document type"::Syllabus;
                    SyllabusPapers1."Syllabus No." := DraftNo;
                    SyllabusPapers1.Insert(true);

                until SyllabusPapers.Next = 0;
                SyllabusHeader1."Course ID" := SyllabusPapers.Course;
                SyllabusHeader1.Validate("Course ID");
                SyllabusHeader1.Modify(true);
            end;
            //COPY Paper details
            SyllabusPaperLine.Reset;
            SyllabusPaperLine.SetRange("Syllabus No.", SyallabusReview."Syllabus No.");
            if SyllabusPaperLine.FindSet then begin
                repeat
                    SyllabusPaperLine1.Init;
                    SyllabusPaperLine1.TransferFields(SyllabusPaperLine);
                    SyllabusPaperLine1."Syllabus No." := DraftNo;
                    SyllabusPaperLine1.Insert(true);
                until SyllabusPaperLine.Next = 0;
            end;
            //COPY Rules
            SyllabusRules.Reset;
            SyllabusRules.SetRange("Syllabus No.", SyallabusReview."Syllabus No.");
            if SyllabusRules.FindSet then begin
                repeat
                    SyllabusRules1.Init;
                    SyllabusRules1.TransferFields(SyllabusRules);
                    SyllabusRules1."Syllabus No." := DraftNo;
                    SyllabusRules1.Insert(true);
                until SyllabusRules.Next = 0;
            end;
            Message(TXT001, DraftNo, SyallabusReview."Syllabus No.");
            SyllabusHeader.Status := SyllabusHeader.Status::Retired;
            SyllabusHeader.Modify(true);
        end


    end;


    procedure CreateSyllabusVersion(var SyallabusReview: Record "Syllabus Review"; var VerdictDate: Date)
    var
        SyllabusHeader: Record "Syllabus Header";
        SyllabusPapers: Record "Syllabus Papers";
        SyllabusPaperLine: Record "Syllabus Paper Line";
        ExaminationSetup: Record "Examination Setup";
        SyllabusRules: Record "Syllabus Rules and Regulations";
        SyllabusHeader1: Record "Syllabus Header";
        SyllabusPapers1: Record "Syllabus Papers";
        SyllabusPaperLine1: Record "Syllabus Paper Line";
        ExaminationSetup1: Record "Examination Setup";
        SyllabusRules1: Record "Syllabus Rules and Regulations";
        DraftNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TXT001: label 'The Syllabus no. %1 has been created succesfully and %2 marked as archive';
    begin
        //create a new syllabus
        ExaminationSetup.Get;
        SyllabusHeader1.Init;
        SyllabusHeader1.Code := SyallabusReview."Syllabus No.";
        SyllabusHeader1."Original Syllabus No." := SyallabusReview."Syllabus No.";
        SyllabusHeader1.Description := SyallabusReview.Description;
        SyllabusHeader1."Domain Code" := SyallabusReview."Domain Code";
        SyllabusHeader1."Domain Name" := SyallabusReview."Domain Name";
        SyllabusHeader1."External Document No." := SyallabusReview."Application No.";
        SyllabusHeader1."Project ID" := SyallabusReview."Application No.";
        SyllabusHeader1.Status := SyllabusHeader1.Status::"Under Review";
        SyllabusHeader1."Created By" := UserId;
        SyllabusHeader1."Created On" := CurrentDatetime;
        SyllabusHeader1."Version No." := 1;
        SyllabusHeader1."Document Type" := SyllabusHeader1."document type"::Version;
        SyllabusHeader1.Insert(true);
        /*
        SyllabusHeader.RESET;
        SyllabusHeader.SETRANGE(Code,SyallabusReview."Syllabus No.");
        IF SyllabusHeader.FINDFIRST THEN BEGIN
          //copy papers
          SyllabusPapers.RESET;
          SyllabusPapers.SETRANGE("Syllabus No.",SyllabusHeader.Code);
          IF SyllabusPapers.FINDSET THEN BEGIN
            REPEAT
              SyllabusPapers1.INIT;
              SyllabusPapers1.TRANSFERFIELDS(SyllabusPapers);
              SyllabusPapers1."Document Type":=SyllabusPapers1."Document Type"::Version;
              SyllabusPapers1."Syllabus No.":=SyallabusReview."Syllabus No.";
              SyllabusPapers1.INSERT(TRUE);

           UNTIL SyllabusPapers.NEXT=0;
           SyllabusHeader1."Course ID":=SyllabusPapers.Course;
           SyllabusHeader1.VALIDATE("Course ID");
           SyllabusHeader1.MODIFY(TRUE);
           END;
           //COPY Paper details
           SyllabusPaperLine.RESET;
           SyllabusPaperLine.SETRANGE("Syllabus No.",SyallabusReview."Syllabus No.");
           IF SyllabusPaperLine.FINDSET THEN BEGIN
             REPEAT
               SyllabusPaperLine1.INIT;
               SyllabusPaperLine1.TRANSFERFIELDS(SyllabusPaperLine);
               SyllabusPaperLine1."Syllabus No.":=SyallabusReview."Syllabus No.";
               SyllabusPaperLine1.INSERT(TRUE);
             UNTIL SyllabusPaperLine.NEXT=0;
           END;
           //COPY Rules
           SyllabusRules.RESET;
           SyllabusRules.SETRANGE("Syllabus No.",SyallabusReview."Syllabus No.");
           IF SyllabusRules.FINDSET THEN BEGIN
             REPEAT
               SyllabusRules1.INIT;
               SyllabusRules1.TRANSFERFIELDS(SyllabusRules);
               SyllabusRules1."Syllabus No.":=SyallabusReview."Syllabus No.";
               SyllabusRules1.INSERT(TRUE);
             UNTIL SyllabusRules.NEXT=0;
           END;
            MESSAGE(TXT001,DraftNo,SyallabusReview."Syllabus No.");
            SyllabusHeader.Status:=SyllabusHeader.Status::Retired;
            SyllabusHeader.MODIFY(TRUE);
        END
        */


    end;

    local procedure "************Accreditation*************"()
    begin
    end;

    procedure AccreditationCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TXT004: label 'The invoice %1,has been sent to the student succesfuly';
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        Cust: Record Customer;
        Contact: Record Contact;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ExamFee: Record Resource;
        ExamFeeCost: Record "Resource Cost";
        Amount: Decimal;
        WorkType: Record "Work Type";
        Existing: Boolean;
        ExamAccountNo: Code[30];
        ResourcePrice: Record "Resource Price";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
        TXT001: label 'The invoice %1,has been created succesfully';
        SalesHeader: Record "Sales Header";
        TXT002: label 'An invoice %1 already exists for the application %2';
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        SalesInv.Reset;
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not SalesInv.FindFirst then begin
            SalesInv.Init;
            SalesInv."Document Type" := SalesInv."document type"::Invoice;
            SalesInv."No." := '';
            SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
            SalesInv."Document Date" := Today;
            SalesInv."Order Date" := Today;
            SalesInv."Posting Date" := Today;
            SalesInv."External Document No." := BulkProcessingHeader."No.";
            SalesInv.Type := SalesInv.Type::Normal;
            SalesInv."Prepayment %" := 100;//enforce prepayment`
            SalesInv.Insert(true);
            //get resource entry
            ResourcePrice.Reset;
            ResourcePrice.SetRange(Code, BulkProcessingHeader."Fee Type");
            if ResourcePrice.FindSet then begin
                SalesLine.Init;
                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                SalesLine."Document No." := SalesInv."No.";
                SalesLine.Type := SalesLine.Type::Resource;
                SalesLine."No." := ResourcePrice.Code;
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                BulkProcessingHeader.CalcFields("Exemption Amount");
                SalesLine."Unit Price" := BulkProcessingHeader."Exemption Amount";
                SalesLine.Validate("Unit Price");
                SalesLine.Validate(Quantity);
                SalesLine.Insert(true);
            end;

            BulkProcessingHeader."Exemption Invoice No." := SalesInv."No.";
            BulkProcessingHeader.Modify;
            Message(TXT001, SalesInv."No.");
            //send email pro-forma

            ExaminationSetup.Get;
            Email2 := ExaminationSetup."Registration Sender Email";
            EmailMessage.Create(BulkProcessingHeader.Email,
            'HRMPEB STUDENT EXEMPTION',
             'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
             'Your exemption request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
             'Find attached the invoice for payment' + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
             '<BR><BR>HRMPEB STUDENT REGISTRATION<BR><BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
            Filename := BulkProcessingHeader."Student No." + '.pdf';
            Filelocation := ExaminationSetup."Examination Path" + Filename;
            SalesHeader.Reset;
            SalesHeader.SetRange("No.", SalesInv."No.");
            if SalesHeader.FindFirst then begin
                Report.SaveAsPdf(1302, Filelocation, SalesHeader);

            end;
            EmailMessage.AddAttachment(Filelocation, 'PDF', InStr);
            //SMTP.AddBCC(Email2);
            //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
            //SMTP.AppendToBody('<BR><BR>HRMPEB STUDENT REGISTRATION<BR><BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
            ////SMTP.Send();
            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            Message(TXT004, SalesInv."No.");
        end else
            Error(TXT002, SalesInv."No.", BulkProcessingHeader."No.");
    end;

    procedure AccreditationCreatReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        Cust: Record Customer;
        Contact: Record Contact;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ExamFee: Record Resource;
        ExamFeeCost: Record "Resource Cost";
        Amount: Decimal;
        WorkType: Record "Work Type";
        Existing: Boolean;
        ExamAccountNo: Code[30];
        ResourcePrice: Record "Resource Price";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        //code to post the created invoice
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.Find('-') then begin
            SalesPostYesNo.Run(SalesInv);
            Message('Invoice %1 has been posted Successfully', SalesInv."No.");
            CashMngmntSetup.Get();
            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader.Insert(true);
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines."Applies to Doc. No" := SalesInv."No.";
            ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;
            ReceiptLines.Insert(true);
            Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
        end;
        BulkProcessingHeader."Exemption Receipt 6No." := ReceiptHeader."No.";
        BulkProcessingHeader.Modify;
    end;

    procedure AccreditationSendRegretEmail(StudentUser: Record "Student Processing Header")
    var
        ContactUsers: Record Contact;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        EmailMessage.Create(StudentUser.Email,
        'HRMPEB STUDENT REGISTRATION',
         'Dear ' + StudentUser."Student Name" + ',<BR><BR>' +
         'Your registration request done on <b>' + ' ' + Format(StudentUser."Created On") + ' ' + '</b> has been rejected.<BR>' +
         'The following are/is the reason for rejection.' + StudentUser."Reason for Rejection" + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
         '<BR><BR>HRMPEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        //SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>HRMPEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();

    end;

    // procedure AccreditationAssessmentVisit(ResourceHeader: Record UnknownRecord51263)
    // var
    //     TXT004: label 'The invoice %1,has been sent to the student succesfuly';
    //     ExaminationSetup: Record "Examination Setup";
    //     AppNo: Code[30];
    //     SMTP: Codeunit "Email Message";
    //     Body: Text;
    //     Filelocation: Text;
    //     Filename: Text;
    //     TXT001: label 'The invoice %1,has been created succesfully';
    //     TXT002: label 'An invoice %1 already exists for the application %2';
    //     AccreditationApp: Record "Accreditation Application";
    //     Email2: Text;
    // begin
    //     ExaminationSetup.Get;
    //     Email2 := ExaminationSetup."Registration Sender Email";
    //     AccreditationApp.Reset;
    //     AccreditationApp.SetRange("Application No.", ResourceHeader."Job No");
    //     if AccreditationApp.FindFirst then begin
    //         //SMTP.Create('HRMPEB ACCREDITATION ASSESSMENT VISIT', Email2, AccreditationApp.Email,
    //     //   'HRMPEB ACCREDITATION ASSESSMENT VISIT',
    //     //   'The Principal' + ' ' + AccreditationApp.Name + ',<BR><BR>' +
    //     //   'Your application for accreditation dated<b>' + ' ' + Format(AccreditationApp."Created On") + ' ' + '</b> is succesfully under assessment visit<BR>' +
    //     //   'Find attached detailed information regarding the visit', true);
    //         Filename := AccreditationApp."Application No." + '.pdf';
    //         Filelocation := ExaminationSetup."Examination Path" + Filename;

    //         //Report.SaveAsPdf(51254, Filelocation, AccreditationApp);
    //         //SMTP.AddAttachment(Filelocation, Filename);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>HRMPEB ACCREDITATION<BR><BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
    //         //SMTP.Send();
    //     end;
    // end;

    procedure AccreditationCloseCompleteness(EvaluationHeader: Record "Evaluation Header")
    var
        TXT004: label 'The invoice %1,has been sent to the student succesfuly';
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        TXT001: label 'The invoice %1,has been created succesfully';
        TXT002: label 'An invoice %1 already exists for the application %2';
        AccreditationApp: Record "Accreditation Application";
        Email2: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        AccreditationApp.Reset;
        AccreditationApp.SetRange("Application No.", EvaluationHeader."Application No.");
        if AccreditationApp.FindFirst then begin
            EmailMessage.Create(AccreditationApp.Email,
              'APPLICATION FOR HRMPEB ACCREDITATION',
              'The Principal' + ' ' + AccreditationApp.Name + ',<BR><BR>' +
              'Your application for accreditation applied on <b>' + ' ' + Format(AccreditationApp."Created On") + ' ' + '</b> has been received succesfully<BR>' +
              'Find attached the acknowledgement letter.' + '<BR><BR>ACCREDITATION DIVISION<BR><BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
            Filename := AccreditationApp."Application No." + '.pdf';
            Filelocation := ExaminationSetup."Examination Path" + Filename;

            Report.SaveAsPdf(51253, Filelocation, AccreditationApp);
            EmailMessage.AddAttachment(Filelocation, 'PDF', InStr);
            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            //SMTP.AddBCC(Email2);
            //SMTP.AppendToBody('<BR><BR>ACCREDITATION DIVISION<BR><BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
            //SMTP.Send();
        end;
    end;


    procedure AccreditationCloseApplication(AccreditationApplication: Record "Accreditation Application")
    var
        Customer: Record Customer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Cust: Record Customer;
        WorkType: Record "Work Type";
        EvaluationVerdicts: Record "Evaluation Verdicts";
    begin
        EvaluationVerdicts.Reset;
        EvaluationVerdicts.SetRange(Code, AccreditationApplication."Verdict Code");
        EvaluationVerdicts.SetRange("Update Customer", true);
        if EvaluationVerdicts.FindFirst then begin
            Cust.Reset;
            Cust.SetRange("E-Mail", AccreditationApplication.Email);
            if Cust.FindFirst then begin
                Cust."Customer Type" := Cust."customer type"::Institution;
                Cust.Name := AccreditationApplication.Name;
                Cust.Address := AccreditationApplication.Address;
                Cust."Address 2" := AccreditationApplication."Address 2";
                Cust."Post Code" := AccreditationApplication."Post Code";
                Cust.Validate("Post Code");
                Cust.County := AccreditationApplication.County;
                Cust."Phone No." := AccreditationApplication."Phone No.";
                Cust.Status := Cust.Status::Approved;
                Cust."Accreditation Status Code" := AccreditationApplication."Verdict Code";
                Cust."Accreditation Status" := AccreditationApplication."Verdict Description";
                Cust."Accreditation Start Date" := Today;
                Cust.Modify(true);
                AccreditationApplication.Status := AccreditationApplication.Status::Completed;
                AccreditationApplication.Modify(true);
                Message('Application process completed successfully');
            end else
                Error('No customer with the email %1,exists', AccreditationApplication.Email);
        end else begin
            AccreditationApplication.Status := AccreditationApplication.Status::Completed;
            AccreditationApplication.Modify(true);
            Message('Application process completed successfully');
        end
    end;


    procedure AccreditationSuggestEvaluationArea(EvaluationHeader: Record "Evaluation Header")
    var
        ApplicationLines: Record "Application Lines";
        ApplicationLines1: Record "Application Lines";
        LineNo: Integer;
        ApplicationSubTopics: Record "Application SubTopics";
    begin
        ApplicationSubTopics.Reset;
        ApplicationSubTopics.SetRange(Type, ApplicationSubTopics.Type::"Site Visit");
        if ApplicationSubTopics.FindSet then begin
            repeat
                //
                ApplicationLines1.Reset;
                if ApplicationLines1.FindLast then
                    LineNo := ApplicationLines1.Code;

                ApplicationLines."Evaluation Header No." := EvaluationHeader.Code;
                ApplicationLines."Document Type" := ApplicationLines."document type"::"Site Visit";
                ApplicationLines.Code := LineNo + 1;
                ApplicationLines."Application No." := EvaluationHeader."Application No.";
                ApplicationLines."Component Code" := ApplicationSubTopics."Component Code";
                ApplicationLines.Validate("Component Code");
                ApplicationLines."Sub-Component Code" := ApplicationSubTopics.Code;
                ApplicationLines.Validate("Sub-Component Code");
                ApplicationLines.Insert(true);

                LineNo += 1;

            until ApplicationSubTopics.Next = 0;
        end
    end;

    local procedure "********Budget*******"()
    begin
    end;


    procedure CreateProjectFromBudget(BudgetName: Code[30])
    var
        Job: Record Job;
        JobPlanningLine: Record "Job Planning Line";
        JobTask: Record "Job Task";
        GLAccount: Record "G/L Account";
        EntryNo: Integer;
        TXT001: label 'Project created succesfully';
        TXT002: label 'Project updated succefully';
        GLBudgetEntry: Record "G/L Budget Entry";
        TotalAmount: Decimal;
        JobPlanningLine1: Record "Job Planning Line";
        GLBudgetName: Record "G/L Budget Name";
        JobTask1: Record "Job Task";
    begin
        GLBudgetName.Reset;
        GLBudgetName.SetRange(Name, BudgetName);
        if GLBudgetName.FindFirst then begin
            GLAccount.Reset;
            GLAccount.SetRange("Account Type", GLAccount."account type"::Posting);
            if GLAccount.FindSet then begin
                repeat
                    TotalAmount := 0.0;
                    GLBudgetEntry.Reset;
                    GLBudgetEntry.SetRange("Budget Name", GLBudgetName.Name);
                    GLBudgetEntry.SetRange("G/L Account No.", GLAccount."No.");
                    if GLBudgetEntry.FindSet then begin
                        repeat
                            TotalAmount := TotalAmount + GLBudgetEntry.Amount;
                        until GLBudgetEntry.Next = 0;
                    end;
                    //insert task lines
                    JobTask1.Reset;
                    JobTask1.SetRange("Job No.", GLBudgetName.Name);
                    JobTask1.SetRange("Job Task No.", GLAccount."No.");
                    if not JobTask1.FindFirst then begin
                        JobTask.Init;
                        JobTask."Job No." := GLBudgetName.Name;
                        JobTask."Job Task No." := GLAccount."No.";
                        JobTask.Description := GLAccount.Name;
                        JobTask."Job Task Type" := JobTask."job task type"::Posting;
                        JobTask.Insert(true);
                    end;
                    //insert planning lines
                    JobPlanningLine1.Reset;
                    if JobPlanningLine1.FindLast then begin
                        EntryNo := JobPlanningLine1."Line No.";
                    end;
                    JobPlanningLine.Init;
                    JobPlanningLine."Line No." := EntryNo + 1;
                    JobPlanningLine."Job No." := GLBudgetName.Name;
                    JobPlanningLine."Job Task No." := GLAccount."No.";
                    JobPlanningLine."Planning Date" := GLBudgetName."Start Date";
                    JobPlanningLine."Line Type" := JobPlanningLine."line type"::Budget;
                    JobPlanningLine.Type := JobPlanningLine.Type::"G/L Account";
                    JobPlanningLine."No." := GLAccount."No.";
                    JobPlanningLine.Description := Format('BUDGET FY' + GLBudgetName.Name, 50);
                    JobPlanningLine.Quantity := 1;
                    JobPlanningLine."Unit Cost" := TotalAmount;
                    JobPlanningLine.Insert(true);
                until GLAccount.Next = 0;
            end;
        end
    end;


    procedure FnPostScriptReceiptVoucher(CenterHeader: Record "Center  Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalBookedStudents: Integer;
        Courses: Record Courses;
        Papers: Record Papers;
        CenterDispatchLines: Record "Center Dispatch Lines";
        LineNo: Integer;
        TXT001: label 'You cannot overwrite this record since some scripts have already been submitted';
        ExamScriptsEntries: Record "Exam Scripts Entries";
        ExamScriptsEntries2: Record "Exam Scripts Entries";
        DispScriptEnvelopeSerials: Record "Disp Script Envelope Serials";
        ScriptEnvelopeSerials: Record "Script Envelope Serials";
    begin
        CenterDispatchLines.Reset;
        CenterDispatchLines.SetRange(Posted, false);
        CenterDispatchLines.SetRange("Document No.", CenterHeader."Document No.");
        if CenterDispatchLines.FindFirst then begin
            Error('ERROR!, There exist papers that have not been submitted for this center');
        end;
        LineNo := 0;
        CenterHeader.TestField(Posted, false);
        CenterDispatchLines.Reset;
        CenterDispatchLines.SetRange(Posted, true);
        CenterDispatchLines.SetRange("Document No.", CenterHeader."Document No.");
        if CenterDispatchLines.FindSet then begin
            repeat
                ;
                ExamScriptsEntries2.Reset;
                if ExamScriptsEntries2.FindLast then
                    LineNo := ExamScriptsEntries2."Line No." + 1;
                ExamScriptsEntries.Init;
                ExamScriptsEntries."Line No." := LineNo;
                ExamScriptsEntries."Document No." := CenterHeader."Document No.";
                ExamScriptsEntries."Project No" := CenterHeader."Project No.";
                ExamScriptsEntries."Project Name" := CenterHeader."Project Name";
                ExamScriptsEntries."Examination Sitting" := CenterHeader."Sitting Cycle";
                ExamScriptsEntries."Center Code" := CenterHeader."Center Code";
                ExamScriptsEntries."Center Name" := CenterHeader."Center Name";
                ExamScriptsEntries.Examination := CenterDispatchLines.Examination;
                ExamScriptsEntries."Paper Code" := CenterDispatchLines."Paper Code";
                ExamScriptsEntries.Level := CenterDispatchLines.Level;
                ExamScriptsEntries."Paper Name" := CenterDispatchLines."Paper Name";
                ExamScriptsEntries."No. of Scripts Expected" := CenterDispatchLines."No. of Scripts Expected";
                CenterDispatchLines.CalcFields("No. of Envelopes");
                CenterDispatchLines.CalcFields("Quantity Received");
                ExamScriptsEntries."No. of Envelopes" := CenterDispatchLines."No. of Envelopes";
                ExamScriptsEntries."Quantity Received" := CenterDispatchLines."Quantity Received";
                ExamScriptsEntries."Created By" := UserId;
                ExamScriptsEntries."Last Modified Date" := CreateDatetime(Today, Time);
                if ExamScriptsEntries.Insert(true) then begin
                    ScriptEnvelopeSerials.Reset;
                    ScriptEnvelopeSerials.SetRange("Document No.", CenterHeader."Document No.");
                    ScriptEnvelopeSerials.SetRange("Line No.", CenterDispatchLines."Line No.");
                    if ScriptEnvelopeSerials.FindSet then begin
                        repeat
                            DispScriptEnvelopeSerials.Init;
                            DispScriptEnvelopeSerials."Document No." := ScriptEnvelopeSerials."Document No.";
                            DispScriptEnvelopeSerials."Entry No" := ScriptEnvelopeSerials."Entry No";
                            DispScriptEnvelopeSerials."Line No." := ExamScriptsEntries."Line No.";
                            DispScriptEnvelopeSerials."Envelope Serial No." := ScriptEnvelopeSerials."Envelope Serial No.";
                            DispScriptEnvelopeSerials."No. of Scripts" := ScriptEnvelopeSerials."No. of Scripts";
                            DispScriptEnvelopeSerials."Project No" := ExamScriptsEntries."Project No";
                            DispScriptEnvelopeSerials."Project Name" := ExamScriptsEntries."Project Name";
                            DispScriptEnvelopeSerials."Examination Sitting" := ExamScriptsEntries."Examination Sitting";
                            DispScriptEnvelopeSerials."Center Code" := ExamScriptsEntries."Center Code";
                            DispScriptEnvelopeSerials."Center Name" := ExamScriptsEntries."Center Name";
                            DispScriptEnvelopeSerials.Examination := ExamScriptsEntries.Examination;
                            DispScriptEnvelopeSerials."Paper Code" := ExamScriptsEntries."Paper Code";
                            DispScriptEnvelopeSerials.Level := ExamScriptsEntries.Level;
                            DispScriptEnvelopeSerials."Paper Name" := ExamScriptsEntries."Paper Name";
                            DispScriptEnvelopeSerials.Insert(true);

                        until ScriptEnvelopeSerials.Next = 0;
                    end;
                end;
            until CenterDispatchLines.Next = 0;
        end;
        CenterHeader.Posted := true;
        CenterHeader."Posted By" := UserId;
        CenterHeader."Posted On" := CreateDatetime(Today, Time);
        CenterHeader.Modify(true);
        Message('Submitted Successfully');
    end;

    procedure FnPostScriptDispatchVoucher(CenterHeader: Record "Scripts Dispatch Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalBookedStudents: Integer;
        Courses: Record Courses;
        Papers: Record Papers;
        CenterDispatchLines: Record "Center Dispatch Lines";
        LineNo: Integer;
        TXT001: label 'You cannot overwrite this record since some scripts have already been submitted';
        ExamScriptsEntries: Record "Exam Scripts Entries";
        ExamScriptsEntries2: Record "Exam Scripts Entries";
        ScriptsDispatchLines: Record "Scripts Dispatch Lines";
        DispScriptEnvelopeSerials: Record "Disp Script Envelope Serials";
        ScriptsDispatchLines2: Record "Scripts Dispatch Lines";
    begin
        LineNo := 0;
        CenterHeader.TestField(Posted, false);
        ScriptsDispatchLines2.Reset;
        ScriptsDispatchLines2.SetRange("Document No.", CenterHeader."Document No.");
        if ScriptsDispatchLines2.FindFirst then begin
            if ScriptsDispatchLines2."Envelope No" = '' then
                Error('ERROR!!, Kindly ensure the marker has been assigned a particular envelope on each entry');
        end;

        ScriptsDispatchLines.Reset;
        ScriptsDispatchLines.SetRange("Document No.", CenterHeader."Document No.");
        if ScriptsDispatchLines.FindSet then begin
            repeat
                ;
                DispScriptEnvelopeSerials.Reset;
                DispScriptEnvelopeSerials.SetRange("Document No.", ScriptsDispatchLines."Script Receipt No");
                DispScriptEnvelopeSerials.SetRange("Line No.", ScriptsDispatchLines."Line No");
                DispScriptEnvelopeSerials.SetRange("Envelope Serial No.", ScriptsDispatchLines."Envelope No");
                if DispScriptEnvelopeSerials.FindSet then begin
                    DispScriptEnvelopeSerials."Marker Code" := CenterHeader."Marker No";
                    DispScriptEnvelopeSerials."Marker Name" := CenterHeader."Marker Name";
                    DispScriptEnvelopeSerials.Allocated := true;
                    DispScriptEnvelopeSerials.Modify(true);
                end;

            until ScriptsDispatchLines.Next = 0;
        end;
        // ScriptsDispatchLines.RESET;
        // ScriptsDispatchLines.SETRANGE("Document No.",CenterHeader."Document No.");
        // IF ScriptsDispatchLines.FINDSET THEN BEGIN
        //  REPEAT;
        // ExamScriptsEntries.RESET;
        // ExamScriptsEntries.SETRANGE("Center Code",ScriptsDispatchLines."Center Code");
        // ExamScriptsEntries.SETRANGE(Examination,CenterHeader.Examination);
        // ExamScriptsEntries.SETRANGE("Paper Code",CenterHeader."Paper Code");
        // ExamScriptsEntries.SETRANGE("Examination Sitting",CenterHeader."Sitting Cycle");
        // IF ExamScriptsEntries.FINDSET THEN BEGIN
        //   ExamScriptsEntries."Marker Code":=CenterHeader."Marker No";
        //   ExamScriptsEntries."Marker Name":=CenterHeader."Marker Name";
        //   ExamScriptsEntries.Allocated:=TRUE;
        //    ExamScriptsEntries.MODIFY(TRUE);
        // END;
        //
        // UNTIL ScriptsDispatchLines.NEXT=0;
        // END;
        //DispScriptEnvelopeSerials
        CenterHeader.Posted := true;
        CenterHeader."Posted By" := UserId;
        CenterHeader."Posted On" := CreateDatetime(Today, Time);
        CenterHeader.Modify(true);
        Message('Submitted Successfully');
    end;

    procedure FnSuggestMarkersPapers(CenterHeader: Record "Scripts Dispatch Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalBookedStudents: Integer;
        Courses: Record Courses;
        Papers: Record Papers;
        CenterDispatchLines: Record "Center Dispatch Lines";
        LineNo: Integer;
        TXT001: label 'You cannot overwrite this record since some scripts have already been submitted';
        ExamScriptsEntries: Record "Exam Scripts Entries";
        ExamScriptsEntries2: Record "Exam Scripts Entries";
        ScriptsDispatchLines: Record "Scripts Dispatch Lines";
        MarkerTaskAllocation: Record "Marker Task Allocation";
        MarkersClaimLines: Record "Markers Claim Lines";
        ScriptsDispatchLines1: Record "Scripts Dispatch Lines";
        DispatchHeader: Record "Scripts Dispatch Header";
    begin
        MarkersClaimLines.Reset;
        MarkersClaimLines.SetRange("Document No.", CenterHeader."Document No.");
        if MarkersClaimLines.FindSet then begin
            MarkersClaimLines.DeleteAll;
        end;

        MarkerTaskAllocation.Reset;
        MarkerTaskAllocation.SetRange("Resource No", CenterHeader."Marker No");
        if MarkerTaskAllocation.FindSet then begin
            repeat

                MarkersClaimLines.Init;
                MarkersClaimLines."Entry No" := MarkerTaskAllocation."Line No" + 11;
                MarkersClaimLines."Document No." := CenterHeader."Document No.";
                MarkersClaimLines.Examination := MarkerTaskAllocation.Course;
                MarkersClaimLines.Level := MarkerTaskAllocation.Level;
                MarkersClaimLines."Paper Code" := MarkerTaskAllocation."Paper ID";
                MarkersClaimLines."Paper Name" := MarkerTaskAllocation."Paper Name";
                MarkersClaimLines.Insert(true);
                //insert detailed claim lines
                DispatchHeader.Reset;
                DispatchHeader.SetRange("Sitting Cycle", CenterHeader."Sitting Cycle");
                DispatchHeader.SetRange("Marker No", CenterHeader."Marker No");
                DispatchHeader.SetRange("Paper Code", MarkerTaskAllocation."Paper ID");
                if DispatchHeader.FindFirst then begin
                    ScriptsDispatchLines.Reset;
                    ScriptsDispatchLines.SetRange("Document No.", DispatchHeader."Document No.");
                    if ScriptsDispatchLines.FindSet then begin
                        repeat
                            ScriptsDispatchLines1.TransferFields(ScriptsDispatchLines);
                            ScriptsDispatchLines1."Document No." := CenterHeader."Document No.";
                            ScriptsDispatchLines1.Insert(true);
                        until ScriptsDispatchLines.Next = 0;
                    end;
                end
            until MarkerTaskAllocation.Next = 0;
        end;
        Message('Submitted Successfully');
    end;

    procedure FnCertCollectCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        TXT001: label 'Invoice %1 sent succesfully';
        TXT002: label 'An invoice no %1 for this has already been processed';
        ExaminationAccount: Record "Examination Account";
        StudentProcessingLines: Record "Student Processing Lines";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange("External Document No.", BulkProcessingHeader."No.");
        if not SalesInvoiceHeader.FindFirst then begin
            SalesInv.Reset;
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if not SalesInv.FindFirst then begin

                SalesInv."Document Type" := SalesInv."document type"::Invoice;
                SalesInv."No." := '';
                SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
                SalesInv."Document Date" := Today;
                SalesInv."Order Date" := Today;
                SalesInv."Posting Date" := Today;
                SalesInv."External Document No." := BulkProcessingHeader."No.";
                SalesInv.Type := SalesInv.Type::Normal;
                SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
                SalesInv."Prepayment %" := 100;//enforce prepayment`
                SalesInv.Insert(true);
                ExaminationSetup.Get;
                SalesLine.Init;
                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                SalesLine."Document No." := SalesInv."No.";
                SalesLine."No." := ExaminationSetup."Certificate Collect Resource";
                SalesLine.Type := SalesLine.Type::Resource;
                SalesLine.Validate(SalesLine."No.");
                SalesLine.Validate(SalesLine.Quantity, 1);
                SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Total Storage Fee");
                SalesLine.Insert(true);
                BulkProcessingHeader."Cert Collect Invoice No." := SalesInv."No.";
                BulkProcessingHeader.Modify;
                //send email pro-forma
                ExaminationSetup.Get;
                Email2 := ExaminationSetup."Registration Sender Email";
                EmailMessage.Create(BulkProcessingHeader.Email,
                'HRMPEB CERTIFICATE COLLECTION',
                 'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
                 'Your certificate collection request has been processed.<BR>' +
                 'Find attached the Invoice' + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
                '<BR><BR>HRMPEB CERTIFICATE COLLECTION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                Filename := SalesInv."No." + '.pdf';
                FileLocation := ExaminationSetup."Examination Path" + Filename;
                SalesHeader.Reset;
                SalesHeader.SetRange("No.", SalesInv."No.");
                if SalesHeader.FindSet then begin
                    Report.SaveAsPdf(1302, FileLocation, SalesHeader);
                end;
                EmailMessage.AddAttachment(FileLocation, 'PDF', InStr);
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                //SMTP.AddBCC(Email2);
                //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
                //SMTP.AppendToBody('<BR><BR>HRMPEB CERTIFICATE COLLECTION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
                // //SMTP.Send();
                Message(TXT001, SalesInv."No.");

            end
            else
                Error(TXT002, SalesInv."No.")
        end
        else
            Error(TXT002, SalesInvoiceHeader."No.")
    end;

    procedure FnCertCollectCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
        CustLedgerEntry: Record "Cust. Ledger Entry";
        ResourcePrice: Record "Resource Price";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Filename: Text;
        FileLocation: Text;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
        ReceiptHeader1: Record "Receipts Header1";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExaminationAccount: Record "Examination Account";
        StudentProcessingLines: Record "Student Processing Lines";
    begin
        //code to post the created invoice
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Requestor No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.Find('-') then begin
            SalesPostYesNo.Run(SalesInv);
            Message('Invoice %1 has been posted Successfully', SalesInv."No.");
            CashMngmntSetup.Get();
            ExaminationSetup.Get;
            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode";
            ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code";
            ReceiptHeader.Insert(true);
            //BulkProcessingHeader.CALCFIELDS("Renewal Amount");
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines."Account No." := BulkProcessingHeader."Requestor No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            CustLedgerEntry.SetRange(Amount, BulkProcessingHeader."Total Storage Fee");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;
            ReceiptLines.Insert(true);
            Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
        end;
        BulkProcessingHeader."Cert Collect  Receipt No." := ReceiptHeader."No.";
        BulkProcessingHeader.Posted := true;
        BulkProcessingHeader."Posted By" := UserId;
        BulkProcessingHeader."Posted Date" := Today;
        BulkProcessingHeader."Posted On" := CurrentDatetime;
        BulkProcessingHeader.Modify(true);
        //ConfirmationSendReceipt(BulkProcessingHeader);
    end;

    procedure FnCertCollectSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    var
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        ReceiptHeader: Record "Receipts Header1";
        ExaminationAccount: Record "Examination Account";
        RegistrationNo: Code[30];
        ReceiptHeader1: Record "Receipts Header1";
        FileName1: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: Instream;
        OutStr: OutStream;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //Email2:='student_notifications@hrmpeb.or.ke';

        EmailMessage.Create(StudentProcessingHeader."Requested By E-Mail",
        COMPANYNAME + ' ' + 'STUDENT CERTIFICATE COLLECTION',
        'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        'Your Certificate collection request has been processed.<BR>' +
        'Find attached receipt' + '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' +
        '<BR><BR>STUDENT CERTIFICATE COLLECTION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        FileName := ReceiptHeader."No." + '.pdf';
        FileName1 := StudentProcessingHeader."No." + '.pdf';
        FileLocation := ExaminationSetup."Examination Path" + FileName;
        /*ReceiptHeader1.RESET;
        ReceiptHeader1.SETRANGE("No.",StudentProcessingHeader."Renewal Receipt No.");
        IF ReceiptHeader1.FINDSET THEN BEGIN
        //Report.SaveAsPdf(56003,FileLocation, ReceiptHeader1);
        END;*/
        Report.SaveAsPdf(85025, FileLocation, StudentProcessingHeader);
        ////SMTP.AddAttachment(FileLocation+FileName,FileName);
        SMTP.AddAttachment(FileLocation, 'PDF', InStr);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        ////SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>STUDENT CERTIFICATE COLLECTION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();

        //send receipt

    end;

    local procedure "*********Quality Assurance*********"()
    begin
    end;


    procedure CreateIndividualDepartmentReport(AuditAssuranceHeader: Record "Audit Assurance Header")
    var
        AuditAssuranceLines: Record "Audit Assurance Lines";
        AuditReportLines: Record "Audit Report Lines";
        AssuranceHeader: Record "Audit Assurance Header";
        DimensionValue: Record "Dimension Value";
        "DocumentNo.": Code[30];
        AssuranceHeader1: Record "Audit Assurance Header";
        AuditActionLines: Record "Audit Action Lines";
        AuditActionLines1: Record "Audit Action Lines";
        LineNo: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExaminationSetup: Record "Examination Setup";
        TXT001: label 'The report has been distributed to the departments succesfully';
    begin
        DimensionValue.Reset;
        DimensionValue.SetRange("Global Dimension No.", 2);
        if DimensionValue.FindSet then begin
            repeat

                AuditReportLines.Reset;
                AuditReportLines.SetRange("Header No.", AuditAssuranceHeader."Document No.");
                AuditReportLines.SetRange(Department, DimensionValue.Code);
                if AuditReportLines.FindSet then begin
                    repeat
                        //create header if not present else insert lines
                        AssuranceHeader1.Reset;
                        AssuranceHeader1.SetRange("Audit Plan ID", AuditAssuranceHeader."Audit Plan ID");
                        AssuranceHeader1.SetRange("Engagement Category", AuditAssuranceHeader."Engagement Category");
                        AssuranceHeader1.SetRange("Global Dimension  Dim 2 Code", DimensionValue.Code);
                        if not AssuranceHeader1.FindFirst then begin
                            "DocumentNo." := '';
                            AssuranceHeader.Init;
                            ExaminationSetup.Get;
                            if "DocumentNo." = '' then
                                NoSeriesMgt.InitSeries(ExaminationSetup."Assurance Department Report", ExaminationSetup."Assurance Department Report", 0D, "DocumentNo.", ExaminationSetup."Assurance Department Report");

                            AssuranceHeader.TransferFields(AuditAssuranceHeader);
                            AssuranceHeader."Document Type" := AssuranceHeader."document type"::"Audit Action";
                            AssuranceHeader."Document No." := "DocumentNo.";
                            AssuranceHeader."Global Dimension  Dim 2 Code" := DimensionValue.Code;
                            AssuranceHeader.Insert(true);

                        end else
                            "DocumentNo." := AssuranceHeader1."Document No.";
                        //insert lines
                        //AuditReportLines
                        AuditActionLines1.Reset;
                        if AuditActionLines1.FindLast then
                            LineNo := AuditActionLines1."Entry No.";

                        AuditActionLines.Reset;
                        AuditActionLines."Header No." := "DocumentNo.";
                        AuditActionLines."Entry No." := LineNo + 1;
                        AuditActionLines."Audit Report No." := AuditAssuranceHeader."Document No.";
                        AuditActionLines."Audit Report Item" := AuditReportLines."Entry No.";
                        AuditActionLines.Validate("Audit Report Item");
                        AuditActionLines.Insert(true);
                        LineNo += 1;


                    until AuditReportLines.Next = 0;
                end
            until DimensionValue.Next = 0;
            AuditAssuranceHeader.Status := AuditAssuranceHeader.Status::Closed;
            AuditAssuranceHeader.Modify(true);
            Message(TXT001);
        end
    end;


    procedure CopyAssurancePlan(ExamAuditPlan: Record "Exam Audit Plan")
    var
        AuditPlan: Record "Exam Audit Plan";
        ExamAuditLines: Record "Exam Audit Lines";
        AuditLines: Record "Exam Audit Lines";
        DocumentNo: Code[30];
        LineNo: Integer;
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AuditLines1: Record "Exam Audit Lines";
        TXT001: label 'Plan copied succesfully to %1';
    begin
        AuditPlan.Init;
        AuditPlan.TransferFields(ExamAuditPlan);
        ExaminationSetup.Get;
        ExaminationSetup.TestField("Assurance Plan Nos.");
        if DocumentNo = '' then
            NoSeriesMgt.InitSeries(ExaminationSetup."Assurance Plan Nos.", ExaminationSetup."Assurance Plan Nos.", 0D, DocumentNo, ExaminationSetup."Assurance Plan Nos.");
        AuditPlan."Audit Plan ID" := DocumentNo;
        AuditPlan.Insert(true);

        //copy lines
        AuditLines1.Reset;
        if AuditLines1.FindLast then
            LineNo := AuditLines1."Engagement Line No.";
        AuditLines.Reset;
        AuditLines.SetRange("Audit Plan ID", ExamAuditPlan."Audit Plan ID");
        if AuditLines.FindSet then begin
            repeat
                ExamAuditLines.TransferFields(AuditLines);
                ExamAuditLines."Audit Plan ID" := DocumentNo;
                ExamAuditLines."Engagement Line No." := LineNo + 1;
                ExamAuditLines.Insert(true);
                LineNo += 1;
            until AuditLines.Next = 0;

        end;
        Message(TXT001, DocumentNo);
    end;

    local procedure FnGetLastLineNo(DocNumber: Code[20]) LineNumber: Integer
    var
        CenterDispatchLines: Record "Center Dispatch Lines";
    begin
        CenterDispatchLines.Reset;
        CenterDispatchLines.SetRange("Document No.", DocNumber);
        CenterDispatchLines.SetCurrentkey("Line No.");
        if CenterDispatchLines.Find('+') then
            LineNumber := CenterDispatchLines."Line No."
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    procedure FnSuggestCenterPapersBooked(CenterHeader: Record "Center  Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalBookedStudents: Integer;
        Courses: Record Courses;
        Papers: Record Papers;
        CenterDispatchLines: Record "Center Dispatch Lines";
        LineNo: Integer;
        TXT001: label 'You cannot overwrite this record since some scripts have already been submitted';
        CenterDispatchLines1: Record "Center Dispatch Lines";
    begin
        TotalBookedStudents := 0;
        LineNo := 0;
        CenterDispatchLines.Reset;
        CenterDispatchLines.SetRange("Document No.", CenterHeader."Document No.");
        CenterDispatchLines.SetRange(Posted, true);
        if CenterDispatchLines.FindFirst then begin
            Error(TXT001);
        end else begin

            CenterDispatchLines.Reset;
            CenterDispatchLines.SetRange("Document No.", CenterHeader."Document No.");
            if CenterDispatchLines.FindSet then begin
                CenterDispatchLines.DeleteAll;
            end;
            Courses.Reset;
            if Courses.FindSet then begin
                repeat
                    Papers.Reset;
                    Papers.SetRange(Course, Courses.Code);
                    Papers.SetRange(Blocked, false);
                    if Papers.FindSet then begin
                        repeat
                            ExamBookingEntries.Reset;
                            ExamBookingEntries.SetRange("Exam Sitting", CenterHeader."Sitting Cycle");
                            ExamBookingEntries.SetRange(Status, ExamBookingEntries.Status::Open);
                            // ExamBookingEntries.SETRANGE("Exam Center",CenterHeader."Center Code");
                            ExamBookingEntries.SetRange(Paper, Papers.Code);
                            if ExamBookingEntries.FindFirst then begin

                                TotalBookedStudents := ExamBookingEntries.Count;
                                if TotalBookedStudents > 0 then begin


                                    CenterDispatchLines."Line No." := FnGetLastLineNo(CenterHeader."Document No.") + 1;
                                    CenterDispatchLines."Document No." := CenterHeader."Document No.";
                                    CenterDispatchLines.Examination := Papers.Course;
                                    CenterDispatchLines."No. of Envelopes" := 1;
                                    CenterDispatchLines.Level := Papers.Level;
                                    CenterDispatchLines."Paper Code" := Papers.Code;
                                    CenterDispatchLines.Validate("Paper Code");
                                    CenterDispatchLines."Quantity Received" := 0;
                                    CenterDispatchLines."Examination Sitting" := CenterHeader."Sitting Cycle";
                                    CenterDispatchLines."No. of Scripts Expected" := TotalBookedStudents;
                                    CenterDispatchLines."Created By" := '';
                                    CenterDispatchLines.Posted := false;
                                    CenterDispatchLines.Submitted := false;
                                    // CenterDispatchLines."Last Modified Date":=CREATEDATETIME(0D,TIME);
                                    CenterDispatchLines.Insert(true);

                                    LineNo += 1;

                                end;

                            end;


                        until Papers.Next = 0
                    end;

                until Courses.Next = 0;
            end;
        end
    end;

    procedure FnSuggestCriteria(CenterHeader: Record "Checker Evaluation Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalBookedStudents: Integer;
        Courses: Record Courses;
        CenterDispatchLines: Record "Center Dispatch Lines";
        LineNo: Integer;
        TXT001: label 'You cannot overwrite this record since some scripts have already been submitted';
        ExamScriptsEntries: Record "Exam Scripts Entries";
        ExamScriptsEntries2: Record "Exam Scripts Entries";
        ScriptsDispatchLines: Record "Scripts Dispatch Lines";
        DispScriptEnvelopeSerials: Record "Disp Script Envelope Serials";
        ScriptsDispatchLines2: Record "Scripts Dispatch Lines";
        MarkingProgressLines: Record "Marking Progress Lines";
        Papers: Record Papers;
        MarkingProgressLines2: Record "Marking Progress Lines";
        CheckerEvaluationLines: Record "Checker Evaluation Lines";
        CheckerEvaluationCriteria: Record "Checker Evaluation Criteria";
        CheckerEvaluationLines2: Record "Checker Evaluation Lines";
    begin

        CheckerEvaluationCriteria.Reset;
        CheckerEvaluationCriteria.SetRange(Blocked, false);
        if CheckerEvaluationCriteria.FindSet then begin
            repeat
                CheckerEvaluationLines."Document No" := CenterHeader."Document No.";
                CheckerEvaluationLines2.Reset;
                if CheckerEvaluationLines2.FindLast then
                    CheckerEvaluationLines."Line No" := CheckerEvaluationLines2."Line No" + 1;
                CheckerEvaluationLines.Criteria := CheckerEvaluationCriteria.Description;
                CheckerEvaluationLines.Insert(true);

            until CheckerEvaluationCriteria.Next = 0;
        end;
        Message('Done');
    end;

    procedure FnSuggestPapersMar(CenterHeader: Record "Scripts Dispatch Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalBookedStudents: Integer;
        Courses: Record Courses;
        CenterDispatchLines: Record "Center Dispatch Lines";
        LineNo: Integer;
        TXT001: label 'You cannot overwrite this record since some scripts have already been submitted';
        ExamScriptsEntries: Record "Exam Scripts Entries";
        ExamScriptsEntries2: Record "Exam Scripts Entries";
        ScriptsDispatchLines: Record "Scripts Dispatch Lines";
        DispScriptEnvelopeSerials: Record "Disp Script Envelope Serials";
        ScriptsDispatchLines2: Record "Scripts Dispatch Lines";
        MarkingProgressLines: Record "Marking Progress Lines";
        Papers: Record Papers;
        MarkingProgressLines2: Record "Marking Progress Lines";
    begin

        Papers.Reset;
        Papers.SetRange(Blocked, false);
        if Papers.FindSet then begin
            repeat
                MarkingProgressLines."Document No" := CenterHeader."Document No.";
                MarkingProgressLines2.Reset;
                if MarkingProgressLines2.FindLast then
                    MarkingProgressLines."Line No" := MarkingProgressLines2."Line No" + 2;
                MarkingProgressLines.Code := Papers.Code;
                MarkingProgressLines.Level := Papers.Level;
                MarkingProgressLines.Section := Papers.Section;
                MarkingProgressLines.Course := Papers.Course;
                MarkingProgressLines.Description := Papers.Description;
                MarkingProgressLines.Practical := Papers.Practical;
                MarkingProgressLines.Status := Papers.Status;
                MarkingProgressLines.Insert(true);

            until Papers.Next = 0;
        end;
        Message('Done');
    end;
}