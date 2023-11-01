#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 85006 "Examination1"
{

    trigger OnRun()
    begin
    end;

    //     var
    //         StudentManagement: Codeunit "Student management";

    //     procedure SendEmaiNotificationOnApplicantAccountActivation(ApplicantRequest: Record "Dynasoft Portal User")
    //     var
    //         SupplierReq: Record Contact;
    //         LastFieldNo: Integer;
    //         FooterPrinted: Boolean;
    //         FileDirectory: Text[100];
    //         FileName: Text[100];
    //         ReportID: Integer;
    //         "Object": Record "Object";
    //         Window: Dialog;
    //         RunOnceFile: Text[1000];
    //         TimeOut: Integer;
    //         Customer2: Record Customer;
    //         Cust: Record Customer;
    //         cr: Integer;
    //         lf: Integer;
    //         EmailBody: array[2] of Text[30];
    //         BodyText: Text[250];
    //         mymail: Codeunit Mail;
    //         DefaultPrinter: Text[200];
    //         WindowisOpen: Boolean;
    //         FileDialog: Codeunit "Email Message";
    //         SendingDate: Date;
    //         SendingTime: Time;
    //         Counter: Integer;
    //         cu400: Codeunit "Email Message";
    //         DocLog: Record "Document E-mail Log";
    //         BranchName: Code[80];
    //         DimValue: Record "Dimension Value";
    //         SenderAddress: Text[100];
    //         CustEmail: Text[100];
    //         UserSetup: Record "User Setup";
    //         HRSetupNew: Record "Examination Setup";
    //         HRSetup: Record "Company Information";
    //         Emp: Record Vendor;
    //         PayrollMonth: Date;
    //         PayrollMonthText: Text[30];
    //         PayPeriodtext: Text;
    //         PayPeriod: Record "Payroll PeriodX";
    //         CompInfo: Record "Company Information";
    //         DateFilter: Text;
    //         FromDate: Date;
    //         ToDate: Date;
    //         FromDateS: Text;
    //         ToDateS: Text;
    //         vend: Record Vendor;
    //         StartDate: Date;
    //         EndDAte: Date;
    //         EmailVerifier: Codeunit Payroll3;
    //         IsEmailValid: Boolean;
    //         RequesterName: Text[100];
    //         RequesterEmail: Text[100];
    //         emailhdr: Text[100];
    //         CompanyDetails: Text[250];
    //         SupplierDetails: Text[1000];
    //         SenderMessage: Text[1000];
    //         ProcNote: Text[1000];
    //         LoginDetails: Text[1000];
    //         PortalUser: Record "Dynasoft Portal User";
    //         Password: Text[50];
    //         ActivationDetails: Text[1000];
    //     begin
    //         CompInfo.Get;
    //         HRSetup.Get;
    //         HRSetupNew.Get;
    //         RequesterEmail := ApplicantRequest."Authentication Email";
    //         RequesterName := ApplicantRequest."Full Name";
    //         Counter := Counter + 1;
    //         PortalUser.Reset;
    //         PortalUser.SetRange("Authentication Email", ApplicantRequest."Authentication Email");
    //         if PortalUser.FindSet then
    //             Password := PortalUser."Password Value";
    //         //IF CompInfo."E-Mail"='' THEN
    //         //ERROR('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
    //         //SenderAddress:=CompInfo."E-Mail";
    //         CustEmail := HRSetup."E-Mail";
    //         CompanyDetails := 'Dear' + ApplicantRequest."Full Name" + ',' + '<BR>';
    //         SenderMessage := 'Your student account has been created on the e-kasneb portal. Your registration details are as follows:</BR>' + '</BR></BR>';
    //         SupplierDetails := '</BR>' + '<BR></BR> Name:</>' + ApplicantRequest."Full Name" + '</BR>' +
    //         '<BR>Mobile Phone No:' + ApplicantRequest."Mobile Phone No." + '</BR>' + '</BR></BR>';
    //         LoginDetails := 'User Name: ' + ApplicantRequest."Authentication Email" + '<BR></BR>' + 'Password: ' + ApplicantRequest."Password Value";
    //         ActivationDetails := '<BR></BR>To access the kasneb services, login to the ekasneb portal.</BR></BR>.' + ' Use this e-kasneb link .' + ' ' + '<b><a href="https://studentstest.kasneb.or.ke:8094/">to access the portal and login</a></b><BR>';

    //         if CustEmail = '' then
    //             exit;
    //         emailhdr := 'student Account Activation (Applicant Account No:' + ApplicantRequest."Record ID" + ')';
    //         // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
    //         // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
    //         // cu400.AddCC(RequesterEmail);
    //         // cu400.AppendToBody(ProcNote);
    //         // cu400.Send;
    //         SendingDate := Today;
    //         SendingTime := Time;


    //     end;

    //     procedure RegistrationStudent(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         ApplicantProfile: Record Customer;
    //         Contact: Record Contact;
    //         NoSeriesManagement: Codeunit NoSeriesManagement;
    //         MarketingSetup: Record "Marketing Setup";
    //         PortalUSer: Record "Dynasoft Portal User";
    //         RandomDigit: Text[50];
    //     begin
    //         PortalUSer.Reset;
    //         PortalUSer.SetRange("Id Number", StudentProcessingHeader."ID Number/Passport No.");
    //         PortalUSer.SetRange("Authentication Email", StudentProcessingHeader.Email);
    //         if PortalUSer.Find('-') then begin
    //             exit;
    //         end else begin

    //             PortalUSer.Init;
    //             PortalUSer."User Name" := StudentProcessingHeader.Email;
    //             PortalUSer."Full Name" := StudentProcessingHeader."First Name" + '  ' + StudentProcessingHeader."Middle Name" + ' ' + StudentProcessingHeader.Surname;
    //             PortalUSer.FirstName := StudentProcessingHeader."First Name";
    //             PortalUSer.LastName := StudentProcessingHeader.Surname;
    //             PortalUSer.MiddleName := StudentProcessingHeader."Middle Name";
    //             PortalUSer."Authentication Email" := StudentProcessingHeader.Email;
    //             PortalUSer."Mobile Phone No." := StudentProcessingHeader."Phone No.";
    //             PortalUSer.State := PortalUSer.State::Enabled;
    //             PortalUSer."Record Type" := PortalUSer."record type"::Customer;
    //             PortalUSer."Record ID" := StudentProcessingHeader."Student No.";
    //             PortalUSer."Id Number" := StudentProcessingHeader."ID Number/Passport No.";
    //             RandomDigit := CreateGuid;
    //             RandomDigit := DelChr(RandomDigit, '=', '{}-01');
    //             RandomDigit := CopyStr(RandomDigit, 1, 8);
    //             PortalUSer."Password Value" := RandomDigit;
    //             PortalUSer."Last Modified Date" := Today;
    //             PortalUSer.Insert(true);
    //             //StudentManagement.FnSendEmaiNotificationOnApplicantAccountActivation(PortalUSer);

    //         end;
    //     end;


    //     procedure ValidatePendingRenewals(Header: Record "Student Processing Header")
    //     var
    //         ExaminationAccount: Record "Examination Account";
    //         ProcessingLines: Record "Student Processing Lines";
    //         "EntryNo.": Integer;
    //         TXT001: label 'The student %1,has no pending renewals';
    //         ExaminationSetup: Record "Examination Setup";
    //     begin
    //         ExaminationSetup.Get;
    //         ExaminationSetup.TestField("Renewal Fee");
    //         ExaminationAccount.Reset;
    //         ExaminationAccount.SetRange("Registration No.", Header."Student Reg. No.");
    //         if ExaminationAccount.FindSet then begin
    //             if ExaminationAccount."Renewal Pending" > 0 then begin
    //                 //insert line
    //                 ProcessingLines.Reset;
    //                 if ProcessingLines.FindLast then
    //                     "EntryNo." := ProcessingLines."Line No.";
    //                 ProcessingLines.Reset;
    //                 ProcessingLines."Booking Header No." := Header."No.";
    //                 ProcessingLines."Line No." := "EntryNo." + 1;
    //                 ProcessingLines."Booking Type" := ProcessingLines."booking type"::Renewal;
    //                 ProcessingLines.Part := ' ';
    //                 ProcessingLines.Paper := ' ';
    //                 ProcessingLines.Description := 'Renewal Fees';
    //                 ProcessingLines.Amount := ExaminationSetup."Renewal Fee" * ExaminationAccount."Renewal Pending";
    //                 ProcessingLines."Amount LCY" := ProcessingLines.Amount;
    //                 ProcessingLines.Insert(true);

    //             end else
    //                 Error(TXT001, ExaminationAccount."Registration No.");
    //         end
    //     end;

    //     procedure RunAutoExempt(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         StudentHeader: Record "Student Processing Header";
    //         ExamTransactionType: Record "Exam Transaction Type";
    //         StudentBookingLines: Record "Student Processing Lines";
    //         ExemptionsSetup: Record "Exemptions Setup";
    //         LineNo: Integer;
    //         Subject: Record Papers;
    //         ResourcePrice: Record "Resource Price";
    //         Resource: Record Resource;
    //         Rate: Decimal;
    //         Currency: Record Currency;
    //         CurrExchRate: Record "Currency Exchange Rate";
    //     begin
    //         StudentHeader.Reset;
    //         StudentHeader.SetRange("No.", StudentProcessingHeader."No.");
    //         if StudentHeader.FindSet then begin
    //             ExemptionsSetup.Reset;
    //             ExemptionsSetup.SetRange("Examination Code", StudentHeader."Examination ID");
    //             if ExemptionsSetup.FindSet then begin
    //                 repeat
    //                     LineNo := 0;
    //                     StudentBookingLines.Reset;
    //                     if StudentBookingLines.FindLast then begin
    //                         LineNo := StudentBookingLines."Line No.";
    //                     end;
    //                     Subject.Reset;
    //                     Subject.SetRange(Code, ExemptionsSetup."Exemption Subject Code");
    //                     if Subject.FindFirst then begin
    //                         //get the part and section for each paper

    //                         StudentBookingLines.Init;
    //                         StudentBookingLines."Line No." := LineNo + 1;
    //                         StudentBookingLines."Course Id" := StudentProcessingHeader."Examination ID";
    //                         StudentBookingLines."Booking Header No." := StudentProcessingHeader."No.";
    //                         StudentBookingLines.Part := Subject.Level;
    //                         StudentBookingLines.Section := Subject.Section;
    //                         StudentBookingLines.Paper := Subject.Code;
    //                         Rate := 1;
    //                         //get the level of the paper

    //                         Resource.Reset;
    //                         Resource.SetRange("Course ID", StudentProcessingHeader."Examination ID");
    //                         Resource.SetRange("Part ID", Subject.Level);
    //                         if Resource.FindSet then begin
    //                             ResourcePrice.Reset;
    //                             ResourcePrice.SetRange(Code, Resource."No.");
    //                             ResourcePrice.SetRange("Work Type Code", Resource."No.");
    //                             ResourcePrice.SetRange("Currency Code", StudentHeader."Currency Code");
    //                             if ResourcePrice.FindSet then begin
    //                                 //MESSAGE('%1',ResourcePrice."Unit Price");
    //                                 StudentBookingLines.Amount := -ResourcePrice."Unit Price";
    //                                 Rate := CurrExchRate.ExchangeRate(StudentProcessingHeader.Date, StudentProcessingHeader."Currency Code");
    //                                 StudentBookingLines."Amount LCY" := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(StudentProcessingHeader.Date, StudentProcessingHeader."Currency Code",
    //                                 StudentBookingLines.Amount, Rate));
    //                                 //StudentBookingLines."Amount LCY":=StudentBookingLines.Amount*Rate;
    //                             end;
    //                         end;
    //                         //get amount for exemption for the subject

    //                         StudentBookingLines.Exempted := true;
    //                         StudentBookingLines.Insert;
    //                     end;
    //                 until ExemptionsSetup.Next = 0;
    //             end;
    //         end
    //     end;

    //     procedure PostExaminationVoucher(var StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         EntryNo: Integer;
    //         TXT001: label 'Examination Booking for %1  has been done succesfully';
    //         ExemptionEntries: Record "Exemption Entries";
    //         StudentBookingLines: Record "Student Processing Lines";
    //         Papers: Record Papers;
    //         StudentProcessingHeader1: Record "Student Processing Header";
    //         ExamBookingEntries1: Record "Exam Booking Entries";
    //     begin
    //         //create exam booking entries


    //         StudentBookingLines.Reset;
    //         StudentBookingLines.SetRange("Booking Header No.", StudentProcessingHeader."No.");
    //         StudentBookingLines.SetRange(Exempted, false);
    //         if StudentBookingLines.FindSet then begin
    //             repeat
    //                 //modify the failed booking entries as blocked
    //                 ExamBookingEntries1.Reset;
    //                 ExamBookingEntries1.SetRange("Student Reg No.", StudentProcessingHeader."Student Reg. No.");
    //                 ExamBookingEntries1.SetRange(Paper, StudentBookingLines.Paper);
    //                 ExamBookingEntries1.SetRange(Status, ExamBookingEntries1.Status::Failed);
    //                 if ExamBookingEntries1.FindFirst then begin
    //                     ExamBookingEntries1.Blocked := true;
    //                     ExamBookingEntries1.Modify(true);
    //                 end;
    //                 ExamBookingEntries.Reset;
    //                 if ExamBookingEntries.FindLast then begin
    //                     EntryNo := ExamBookingEntries."Entry No.";
    //                 end;
    //                 if StudentBookingLines."Booking Type" = StudentBookingLines."booking type"::Section then begin
    //                     Papers.Reset;
    //                     Papers.SetRange(Section, StudentBookingLines.Section);
    //                     if Papers.FindSet then begin
    //                         repeat

    //                             ExamBookingEntries.Init;
    //                             ExamBookingEntries."Entry No." := EntryNo + 1;
    //                             ExamBookingEntries.Code := StudentProcessingHeader."No.";
    //                             ExamBookingEntries."Student Reg No." := StudentProcessingHeader."Student Reg. No.";
    //                             ExamBookingEntries.Validate("Student Reg No.");
    //                             ExamBookingEntries."Stud. Cust No." := StudentProcessingHeader."Student No.";
    //                             ExamBookingEntries.Validate("Stud. Cust No.");
    //                             ExamBookingEntries."Exam Center" := StudentProcessingHeader."Examination Center Code";
    //                             ExamBookingEntries.Examination := StudentProcessingHeader."Examination ID";
    //                             ExamBookingEntries.Paper := Papers.Code;
    //                             ExamBookingEntries.Section := Papers.Section;
    //                             ExamBookingEntries.Part := Papers.Level;
    //                             ExamBookingEntries."Project Code" := StudentProcessingHeader."Examination Project Code";
    //                             ExamBookingEntries."Exam Center" := StudentProcessingHeader."Examination Center Code";
    //                             ExamBookingEntries.Validate("Exam Center");
    //                             ExamBookingEntries."Exam Sitting" := StudentProcessingHeader."Examination Sitting";
    //                             ExamBookingEntries.Description := Papers.Description;
    //                             ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
    //                             ExamBookingEntries."Fee Amount" := StudentBookingLines."Amount LCY";
    //                             ExamBookingEntries.Validate("Currency Code");
    //                             ExamBookingEntries.Insert;
    //                             EntryNo += 1;
    //                         until Papers.Next = 0;
    //                     end
    //                 end else
    //                     if StudentBookingLines."Booking Type" = StudentBookingLines."booking type"::Part then begin
    //                         Papers.Reset;
    //                         Papers.SetRange(Level, StudentBookingLines.Part);
    //                         if Papers.FindSet then begin
    //                             //if entire part
    //                             repeat
    //                                 ExamBookingEntries.Reset;
    //                                 if ExamBookingEntries.FindLast then begin
    //                                     EntryNo := ExamBookingEntries."Entry No.";
    //                                 end;
    //                                 ExamBookingEntries.Init;
    //                                 ExamBookingEntries."Entry No." := EntryNo + 1;
    //                                 ExamBookingEntries.Code := StudentProcessingHeader."No.";
    //                                 ExamBookingEntries."Student Reg No." := StudentProcessingHeader."Student Reg. No.";
    //                                 ExamBookingEntries.Validate("Student Reg No.");
    //                                 ExamBookingEntries.Examination := StudentProcessingHeader."Examination ID";
    //                                 ExamBookingEntries.Paper := Papers.Code;
    //                                 ExamBookingEntries.Section := Papers.Section;
    //                                 ExamBookingEntries.Part := Papers.Level;
    //                                 ExamBookingEntries."Project Code" := StudentProcessingHeader."Examination Project Code";
    //                                 ExamBookingEntries."Exam Center" := StudentProcessingHeader."Examination Center Code";
    //                                 ExamBookingEntries.Validate("Exam Center");
    //                                 ExamBookingEntries."Exam Sitting" := StudentProcessingHeader."Examination Sitting";
    //                                 ExamBookingEntries.Description := Papers.Description;
    //                                 ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
    //                                 ExamBookingEntries."Fee Amount" := StudentBookingLines."Amount LCY";
    //                                 ExamBookingEntries.Validate("Currency Code");

    //                                 ExamBookingEntries.Insert;
    //                             until Papers.Next = 0;
    //                         end
    //                     end else
    //                         if StudentBookingLines."Booking Type" = StudentBookingLines."booking type"::Paper then begin
    //                             //if only paper based
    //                             ExamBookingEntries.Reset;
    //                             if ExamBookingEntries.FindLast then begin
    //                                 EntryNo := ExamBookingEntries."Entry No.";
    //                             end;
    //                             ExamBookingEntries.Init;
    //                             ExamBookingEntries."Entry No." := EntryNo + 1;
    //                             ExamBookingEntries.Code := StudentProcessingHeader."No.";
    //                             ExamBookingEntries."Student Reg No." := StudentProcessingHeader."Student Reg. No.";
    //                             ExamBookingEntries.Validate("Student Reg No.");
    //                             ExamBookingEntries."Exam Center" := StudentProcessingHeader."Preferred Exam Center";
    //                             ExamBookingEntries.Examination := StudentProcessingHeader."Examination ID";
    //                             ExamBookingEntries.Paper := StudentBookingLines.Paper;
    //                             ExamBookingEntries.Part := StudentBookingLines.Part;
    //                             ExamBookingEntries.Section := StudentBookingLines.Section;
    //                             ExamBookingEntries."Project Code" := StudentProcessingHeader."Examination Project Code";
    //                             ExamBookingEntries."Exam Center" := StudentProcessingHeader."Examination Center Code";
    //                             ExamBookingEntries.Validate("Exam Center");
    //                             ExamBookingEntries."Exam Sitting" := StudentProcessingHeader."Examination Sitting";
    //                             ExamBookingEntries.Description := StudentBookingLines.Description;
    //                             ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
    //                             ExamBookingEntries."Fee Amount" := StudentBookingLines."Amount LCY";
    //                             ExamBookingEntries.Validate("Currency Code");

    //                             ExamBookingEntries.Insert;
    //                         end;



    //             until StudentBookingLines.Next = 0;
    //         end;

    //         StudentBookingLines.Reset;
    //         StudentBookingLines.SetRange("Booking Header No.", StudentProcessingHeader."No.");
    //         StudentBookingLines.SetRange(Exempted, true);
    //         if StudentBookingLines.FindSet then begin
    //             repeat
    //                 //create exemption entries
    //                 EntryNo := 0;
    //                 //insert a paper
    //                 if ExemptionEntries.FindLast then begin
    //                     EntryNo := ExemptionEntries."Entry No.";
    //                 end;
    //                 ExemptionEntries.Init;
    //                 ExemptionEntries."Entry No." := EntryNo + 1;
    //                 ExemptionEntries."Exemption Voucher No." := StudentProcessingHeader."No.";
    //                 ExemptionEntries."Course Id" := StudentBookingLines."Course Id";
    //                 ExemptionEntries.Type := ExemptionEntries.Type::Paper;
    //                 ExemptionEntries."No." := StudentBookingLines.Paper;
    //                 ExemptionEntries."Stud. Cust No." := StudentProcessingHeader."Student No.";
    //                 ExemptionEntries."Stud. Reg. No" := StudentProcessingHeader."Student Reg. No.";
    //                 ExemptionEntries.Validate("No.");
    //                 ExemptionEntries."Amount LCY" := -StudentBookingLines."Amount LCY";
    //                 ExemptionEntries.Amount := -StudentBookingLines.Amount;
    //                 ExemptionEntries.Insert;
    //             until StudentBookingLines.Next = 0;
    //         end;
    //         Message(TXT001, StudentProcessingHeader."No.");
    //         StudentProcessingHeader1.Reset;
    //         StudentProcessingHeader1.SetRange("No.", StudentProcessingHeader."No.");
    //         if StudentProcessingHeader1.FindSet then begin


    //             StudentProcessingHeader1.Posted := true;
    //             StudentProcessingHeader1."Posted By" := UserId;
    //             StudentProcessingHeader1."Posted On" := CurrentDatetime;
    //             StudentProcessingHeader1."Posted Date" := Today;
    //             StudentProcessingHeader1.Modify(true);
    //         end;
    //     end;

    //     procedure RunAutoExemptSingle(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         StudentHeader: Record "Student Processing Header";
    //         ExamTransactionType: Record "Exam Transaction Type";
    //         StudentBookingLines: Record "Exemption Lines";
    //         ExemptionsSetup: Record "Exemptions Setup";
    //         LineNo: Integer;
    //         Subject: Record Papers;
    //         ResourcePrice: Record "Resource Price";
    //         Resource: Record Resource;
    //         Rate: Decimal;
    //         ExemptionQualifications: Record "Exemption Qualifications";
    //         StudentBookingLines1: Record "Exemption Lines";
    //         Currency: Record Currency;
    //         CurrExchRate: Record "Currency Exchange Rate";
    //     begin
    //         StudentHeader.Reset;
    //         StudentHeader.SetRange("No.", StudentProcessingHeader."No.");
    //         if StudentHeader.FindSet then begin
    //             //insert loop on here
    //             ExemptionQualifications.Reset;
    //             ExemptionQualifications.SetRange("Document No.", StudentHeader."No.");
    //             if ExemptionQualifications.FindSet then begin
    //                 repeat

    //                     ExemptionsSetup.Reset;
    //                     ExemptionsSetup.SetRange("Qualification Code", ExemptionQualifications."Qualification Code");
    //                     ExemptionsSetup.SetRange("Examination Code", StudentHeader."Examination ID");
    //                     if ExemptionsSetup.FindSet then begin
    //                         repeat
    //                             LineNo := 0;
    //                             StudentBookingLines.Reset;
    //                             if StudentBookingLines.FindLast then begin
    //                                 LineNo := StudentBookingLines."Line No.";
    //                             end;
    //                             Subject.Reset;
    //                             Subject.SetRange(Code, ExemptionsSetup."Exemption Subject Code");
    //                             if Subject.FindFirst then begin
    //                                 //get the part and section for each paper

    //                                 //check the lines do not replicate the course
    //                                 StudentBookingLines1.Reset;
    //                                 StudentBookingLines1.SetRange("Header No.", StudentHeader."No.");
    //                                 StudentBookingLines1.SetRange("No.", Subject.Code);
    //                                 if not StudentBookingLines1.FindSet then begin
    //                                     StudentBookingLines.Init;
    //                                     StudentBookingLines."Line No." := LineNo + 1;
    //                                     StudentBookingLines."Course Id" := StudentProcessingHeader."Examination ID";
    //                                     StudentBookingLines."Header No." := StudentProcessingHeader."No.";
    //                                     StudentBookingLines.Type := StudentBookingLines.Type::Paper;
    //                                     StudentBookingLines."No." := Subject.Code;
    //                                     StudentBookingLines.Validate("No.");
    //                                     Rate := 1;
    //                                     Resource.Reset;
    //                                     Resource.SetRange("Course ID", StudentProcessingHeader."Examination ID");
    //                                     Resource.SetRange("Part ID", Subject.Level);
    //                                     if Resource.FindSet then begin
    //                                         repeat

    //                                             ResourcePrice.Reset;
    //                                             ResourcePrice.SetRange(Code, Resource."No.");
    //                                             ResourcePrice.SetRange("Document Type", ResourcePrice."document type"::Exemption);
    //                                             ResourcePrice.SetRange("Currency Code", StudentProcessingHeader."Currency Code");
    //                                             if ResourcePrice.FindSet then begin
    //                                                 StudentBookingLines.Amount := ResourcePrice."Unit Price";
    //                                                 Rate := CurrExchRate.ExchangeRate(StudentProcessingHeader.Date, StudentProcessingHeader."Currency Code");
    //                                                 StudentBookingLines."Amount LCY" := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(StudentProcessingHeader.Date, StudentProcessingHeader."Currency Code",
    //                                                     StudentBookingLines.Amount, Rate));
    //                                                 //StudentBookingLines."Amount LCY":=StudentBookingLines.Amount*Rate;
    //                                                 if StudentBookingLines.Amount <> 0 then
    //                                                     StudentBookingLines.Insert;
    //                                             end;
    //                                         until Resource.Next = 0;
    //                                     end;


    //                                 end;
    //                                 //get amount for exemption for the subject



    //                             end;
    //                         until ExemptionsSetup.Next = 0;
    //                     end;
    //                 until ExemptionQualifications.Next = 0;
    //             end

    //         end
    //     end;

    //     procedure PostExemptionVoucher(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         ExemptionLines: Record "Exemption Lines";
    //         BookingLines: Record "Student Processing Lines";
    //         ExemptionEntries: Record "Exemption Entries";
    //         Section: Record Section;
    //         Papers: Record Papers;
    //         LineNo: Integer;
    //         ExemptionEntries1: Record "Exemption Entries";
    //     begin
    //         ExemptionLines.Reset;
    //         ExemptionLines.SetRange("Header No.", StudentProcessingHeader."No.");
    //         if ExemptionLines.FindSet then begin
    //             repeat
    //                 LineNo := 0;
    //                 if ExemptionLines.Type = ExemptionLines.Type::Section then begin
    //                     Papers.Reset;
    //                     Papers.SetRange(Section, ExemptionLines."No.");
    //                     if Papers.FindSet then begin
    //                         repeat
    //                             if ExemptionEntries.FindLast then begin
    //                                 LineNo := ExemptionEntries."Entry No.";
    //                             end;
    //                             ExemptionEntries.Init;
    //                             ExemptionEntries."Entry No." := LineNo + 1;
    //                             ExemptionEntries."Exemption Voucher No." := StudentProcessingHeader."No.";
    //                             ExemptionEntries."Course Id" := ExemptionLines."Course Id";
    //                             ExemptionEntries.Type := ExemptionEntries.Type::Paper;
    //                             ExemptionEntries."No." := Papers.Code;
    //                             ExemptionEntries."Stud. Cust No." := StudentProcessingHeader."Student No.";
    //                             ExemptionEntries."Stud. Reg. No" := StudentProcessingHeader."Student Reg. No.";
    //                             ExemptionEntries.Amount := ExemptionLines.Amount;
    //                             ExemptionEntries."Amount LCY" := ExemptionLines."Amount LCY";
    //                             ExemptionEntries.Validate("No.");
    //                             ExemptionEntries.Insert;
    //                         until Papers.Next = 0;
    //                     end
    //                 end else begin
    //                     LineNo := 0;
    //                     //insert a paper
    //                     if ExemptionEntries.FindLast then begin
    //                         LineNo := ExemptionEntries."Entry No.";
    //                     end;
    //                     ExemptionEntries.Init;
    //                     ExemptionEntries."Entry No." := LineNo + 1;
    //                     ExemptionEntries."Exemption Voucher No." := StudentProcessingHeader."No.";
    //                     ExemptionEntries."Course Id" := ExemptionLines."Course Id";
    //                     ExemptionEntries.Type := ExemptionEntries.Type::Paper;
    //                     ExemptionEntries."No." := ExemptionLines."No.";
    //                     ExemptionEntries.Validate("No.");
    //                     ExemptionEntries."Stud. Cust No." := StudentProcessingHeader."Student No.";
    //                     ExemptionEntries."Stud. Reg. No" := StudentProcessingHeader."Student Reg. No.";
    //                     ExemptionEntries.Amount := ExemptionLines.Amount;
    //                     ExemptionEntries."Amount LCY" := ExemptionLines."Amount LCY";
    //                     ExemptionEntries.Insert;
    //                 end;
    //             until ExemptionLines.Next = 0;

    //         end;
    //     end;

    //     procedure ExemptionCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         TXT004: label 'The invoice %1,has been sent to the student succesfuly';
    //         ExaminationSetup: Record "Examination Setup";
    //         AppNo: Code[30];
    //         Cust: Record Customer;
    //         Contact: Record Contact;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         CashMngmntSetup: Record "Cash Management  Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         NoSeries: Code[30];
    //         ExamFee: Record Resource;
    //         ExamFeeCost: Record "Resource Cost";
    //         Amount: Decimal;
    //         WorkType: Record "Work Type";
    //         Existing: Boolean;
    //         ExamAccountNo: Code[30];
    //         ResourcePrice: Record "Resource Price";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         Filelocation: Text;
    //         Filename: Text;
    //         LineNo: Integer;
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         Examination: Codeunit Examination;
    //         TXT001: label 'The invoice %1,has been created succesfully';
    //         SalesHeader: Record "Sales Header";
    //         TXT002: label 'An invoice %1 already exists for the application %2';
    //         Header: Record "Student Processing Header";
    //         ExemptionEntries: Record "Exemption Entries";
    //         TXT003: label 'The student %1,already has exemptions processed for the course %2';
    //         TXT005: label 'Ensure mandatory documents are attached';
    //         DocumentLink: Record "Document Attachment";
    //     begin
    //         if BulkProcessingHeader.Portal = true then begin
    //             DocumentLink.Reset;
    //             DocumentLink.SetRange("No.", BulkProcessingHeader."No.");
    //             if not DocumentLink.FindSet then begin
    //                 Error(TXT005);
    //             end
    //         end;
    //         ExemptionEntries.Reset;
    //         ExemptionEntries.SetRange("Course Id", BulkProcessingHeader."Examination ID");
    //         ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
    //         if ExemptionEntries.FindSet then begin
    //             Error(TXT003, BulkProcessingHeader."Student Reg. No.", BulkProcessingHeader."Examination Description");
    //         end else begin
    //             SalesInv.Reset;
    //             SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             if not SalesInv.FindFirst then begin
    //                 SalesInv.Init;
    //                 SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //                 SalesInv."No." := '';
    //                 SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //                 SalesInv."Document Date" := Today;
    //                 SalesInv."Order Date" := Today;
    //                 SalesInv."Posting Date" := Today;
    //                 SalesInv."External Document No." := BulkProcessingHeader."No.";
    //                 SalesInv.Type := SalesInv.Type::Normal;
    //                 SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
    //                 SalesInv."Prepayment %" := 100;//enforce prepayment`
    //                 SalesInv.Insert(true);
    //                 //get resource entry
    //                 ResourcePrice.Reset;
    //                 ResourcePrice.SetRange(Code, BulkProcessingHeader."Fee Type");
    //                 if ResourcePrice.FindSet then begin
    //                     SalesLine.Init;
    //                     SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //                     SalesLine."Document No." := SalesInv."No.";
    //                     SalesLine.Type := SalesLine.Type::Resource;
    //                     SalesLine."No." := ResourcePrice.Code;
    //                     SalesLine.Validate("No.");
    //                     SalesLine.Quantity := 1;
    //                     BulkProcessingHeader.CalcFields("Exemption Amount");
    //                     SalesLine."Unit Price" := BulkProcessingHeader."Exemption Amount";
    //                     SalesLine.Validate("Unit Price");
    //                     SalesLine.Validate(Quantity);
    //                     SalesLine.Insert(true);
    //                 end;

    //                 BulkProcessingHeader."Exemption Invoice No." := SalesInv."No.";
    //                 BulkProcessingHeader.Modify;
    //                 Message(TXT001, SalesInv."No.");
    //                 //send email pro-forma

    //                 ExaminationSetup.Get;
    //                 Email2 := ExaminationSetup."Registration Sender Email";
    //                 //SMTP.Create('KASNEB STUDENT EXEMPTION', Email2, BulkProcessingHeader.Email,
    //                 'KASNEB STUDENT EXEMPTION',
    //                  'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
    //                  'Your exemption request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //                  'Find attached the invoice for payment', true);
    //                 Filename := BulkProcessingHeader."Student No." + '.pdf';
    //                 Filelocation := ExaminationSetup."Examination Path" + Filename;
    //                 Header.Reset;
    //                 Header.SetRange("No.", BulkProcessingHeader."No.");
    //                 if Header.FindFirst then begin
    //                     //Report.SaveAsPdf(85043, Filelocation, Header);
    //                 end;
    //                 //SMTP.AddAttachment(Filelocation, Filename);
    //                 //SMTP.AddBCC(Email2);
    //                 //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //                 //SMTP.AppendToBody('<BR><BR>KASNEB STUDENT REGISTRATION<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //                 //SMTP.Send();
    //                 Message(TXT004, SalesInv."No.");
    //             end else
    //                 Error(TXT002, SalesInv."No.", BulkProcessingHeader."No.");
    //         end
    //     end;

    //     procedure ExemptionCreatReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record "Receipts Header1";
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "Receipt Lines1";
    //         ExaminationSetup: Record "Examination Setup";
    //         AppNo: Code[30];
    //         Cust: Record Customer;
    //         Contact: Record Contact;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         NoSeries: Code[30];
    //         ExamFee: Record Resource;
    //         ExamFeeCost: Record "Resource Cost";
    //         Amount: Decimal;
    //         WorkType: Record "Work Type";
    //         Existing: Boolean;
    //         ExamAccountNo: Code[30];
    //         ResourcePrice: Record "Resource Price";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         Filelocation: Text;
    //         Filename: Text;
    //         LineNo: Integer;
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         Examination: Codeunit Examination;
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //         PaymentsPost: Codeunit "Payments-Post";
    //     begin
    //         //code to post the created invoice

    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if SalesInv.Find('-') then begin

    //             SalesPostYesNo.Run(SalesInv);
    //             Message('Invoice %1 has been posted Successfully', SalesInv."No.");
    //             CashMngmntSetup.Get();
    //             ExaminationSetup.Get();
    //             NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
    //             ReceiptHeader.Init;
    //             ReceiptHeader."No." := NoSeries;
    //             ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode";
    //             ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code";
    //             ReceiptHeader.Validate("Bank Code");
    //             ReceiptHeader."Received From" := BulkProcessingHeader."Student Name";
    //             ReceiptHeader."On Behalf Of" := BulkProcessingHeader."Student Name";
    //             ReceiptHeader."Posted Date" := Today;
    //             ReceiptHeader."Posting Date" := Today;
    //             ReceiptHeader.Insert(true);
    //             ReceiptLines.Init;
    //             ReceiptLines."Receipt No." := ReceiptHeader."No.";
    //             ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //             ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Exemption amount';
    //             ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
    //             ReceiptLines.Validate("Account No.");
    //             //get posted invoice number
    //             CustLedgerEntry.Reset;
    //             CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
    //             CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             if CustLedgerEntry.FindFirst then begin
    //                 ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
    //                 ReceiptLines.Validate("Applies to Doc. No");
    //             end;
    //             ReceiptLines.Insert(true);
    //             PaymentsPost.PostReceipt(ReceiptHeader);
    //             ExemptionSendReceipt(BulkProcessingHeader);


    //             BulkProcessingHeader."Exemption Receipt 6No." := ReceiptHeader."No.";
    //             BulkProcessingHeader."Pay Mode" := ReceiptHeader."Pay Mode";
    //             BulkProcessingHeader.Posted := true;
    //             BulkProcessingHeader."Posted Date" := Today;
    //             BulkProcessingHeader."Posted By" := UserId;
    //             BulkProcessingHeader."Posted On" := CurrentDatetime;
    //             BulkProcessingHeader.Modify(true);
    //         end
    //     end;

    //     procedure PostBulkExaminationVoucher(StudentProcessingHeader: Record "Bulk Processing Header")
    //     var
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         EntryNo: Integer;
    //         TXT001: label 'Examination Booking for %1  has been done succesfully';
    //         ExemptionEntries: Record "Exemption Entries";
    //         StudentBookingLines: Record "Bulk Processing Lines";
    //         Papers: Record Papers;
    //     begin
    //         //create exam booking entries
    //         StudentBookingLines.Reset;
    //         StudentBookingLines.SetRange("Bulk Header No.", StudentProcessingHeader."No.");
    //         if StudentBookingLines.FindSet then begin
    //             repeat

    //                 if StudentBookingLines."Booking Type" = StudentBookingLines."booking type"::Section then begin
    //                     Papers.Reset;
    //                     Papers.SetRange(Section, StudentBookingLines.Section);
    //                     if Papers.FindSet then begin
    //                         repeat
    //                             ExamBookingEntries.Reset;
    //                             if ExamBookingEntries.FindLast then begin
    //                                 EntryNo := ExamBookingEntries."Entry No.";
    //                             end;
    //                             ExamBookingEntries.Init;
    //                             ExamBookingEntries."Entry No." := EntryNo + 1;
    //                             ExamBookingEntries.Code := StudentProcessingHeader."No.";
    //                             ExamBookingEntries."Student Reg No." := StudentBookingLines."Registration No.";
    //                             ExamBookingEntries.Validate("Student Reg No.");
    //                             ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
    //                             ExamBookingEntries.Examination := StudentBookingLines."Course ID";
    //                             ExamBookingEntries.Paper := Papers.Code;
    //                             ExamBookingEntries.Section := Papers.Section;
    //                             ExamBookingEntries.Part := Papers.Level;
    //                             ExamBookingEntries."Project Code" := StudentBookingLines."Examination Project Code";
    //                             ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
    //                             ExamBookingEntries.Validate("Exam Center");
    //                             ExamBookingEntries."Exam Sitting" := StudentBookingLines."Examination Cyce";
    //                             ExamBookingEntries.Description := Papers.Description;
    //                             ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
    //                             ExamBookingEntries."Fee Amount" := StudentBookingLines."Amount LCY";
    //                             ExamBookingEntries.Validate("Currency Code");
    //                             ExamBookingEntries.Insert;
    //                         until Papers.Next = 0;
    //                     end
    //                 end else
    //                     if StudentBookingLines."Booking Type" = StudentBookingLines."booking type"::Part then begin
    //                         Papers.Reset;
    //                         Papers.SetRange(Level, StudentBookingLines.Part);
    //                         if Papers.FindSet then begin
    //                             //if entire part
    //                             repeat
    //                                 ExamBookingEntries.Reset;
    //                                 if ExamBookingEntries.FindLast then begin
    //                                     EntryNo := ExamBookingEntries."Entry No.";
    //                                 end;
    //                                 ExamBookingEntries.Init;
    //                                 ExamBookingEntries."Entry No." := EntryNo + 1;
    //                                 ExamBookingEntries.Code := StudentProcessingHeader."No.";
    //                                 ExamBookingEntries."Student Reg No." := StudentBookingLines."Registration No.";
    //                                 ExamBookingEntries.Validate("Student Reg No.");
    //                                 ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
    //                                 ExamBookingEntries.Examination := StudentBookingLines."Course ID";
    //                                 ExamBookingEntries.Paper := Papers.Code;
    //                                 ExamBookingEntries.Section := Papers.Section;
    //                                 ExamBookingEntries.Part := Papers.Level;
    //                                 ExamBookingEntries."Project Code" := StudentBookingLines."Examination Project Code";
    //                                 ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
    //                                 ExamBookingEntries.Validate("Exam Center");
    //                                 ExamBookingEntries."Exam Sitting" := StudentBookingLines."Examination Cyce";
    //                                 ExamBookingEntries.Description := Papers.Description;
    //                                 ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
    //                                 ExamBookingEntries."Fee Amount" := StudentBookingLines."Amount LCY";
    //                                 ExamBookingEntries.Validate("Currency Code");

    //                                 ExamBookingEntries.Insert;
    //                             until Papers.Next = 0;
    //                         end
    //                     end else
    //                         if StudentBookingLines."Booking Type" = StudentBookingLines."booking type"::Paper then begin
    //                             //if only paper based
    //                             ExamBookingEntries.Reset;
    //                             if ExamBookingEntries.FindLast then begin
    //                                 EntryNo := ExamBookingEntries."Entry No.";
    //                             end;
    //                             ExamBookingEntries.Init;
    //                             ExamBookingEntries."Entry No." := EntryNo + 1;
    //                             ExamBookingEntries.Code := StudentProcessingHeader."No.";
    //                             ExamBookingEntries."Student Reg No." := StudentBookingLines."Registration No.";
    //                             ExamBookingEntries.Validate("Student Reg No.");
    //                             ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
    //                             ExamBookingEntries.Examination := StudentBookingLines."Course ID";
    //                             ExamBookingEntries.Paper := StudentBookingLines.Paper;
    //                             ExamBookingEntries.Part := StudentBookingLines.Part;
    //                             ExamBookingEntries.Section := StudentBookingLines.Section;
    //                             ExamBookingEntries."Project Code" := StudentBookingLines."Examination Project Code";
    //                             ExamBookingEntries."Exam Center" := StudentBookingLines."Preferred Exam Center";
    //                             ExamBookingEntries.Validate("Exam Center");
    //                             ExamBookingEntries."Exam Sitting" := StudentBookingLines."Examination Cyce";
    //                             ExamBookingEntries.Description := StudentBookingLines.Description;
    //                             ExamBookingEntries."Currency Code" := StudentProcessingHeader."Currency Code";
    //                             ExamBookingEntries."Fee Amount" := StudentBookingLines."Amount LCY";
    //                             ExamBookingEntries.Validate("Currency Code");

    //                             ExamBookingEntries.Insert;
    //                         end;



    //             until StudentBookingLines.Next = 0;
    //         end;
    //     end;

    //     procedure NotifyResources(AppointmentHeader: Record "Appointment Header")
    //     var
    //         AppointmentLine: Record "Staff Appointment Line";
    //         Window: Dialog;
    //         WindowisOpen: Boolean;
    //         FileDialog: Codeunit "Email Message";
    //         SendingDate: Date;
    //         SMTPMail: Codeunit "Email Message";
    //         DocLog: Record "Document E-mail Log";
    //         UserSetup: Record "User Setup";
    //         CompInfo: Record "Company Information";
    //         ExaminationSetup: Record "Examination Setup";
    //         SenderAddress: Text;
    //         StaffTerminationLine: Record "Staff Termination Line";
    //         Employee: Record Employee;
    //         UserSetup1: Record "User Setup";
    //     begin
    //         if AppointmentHeader."Document Type" = AppointmentHeader."document type"::Appointment then begin
    //             AppointmentLine.Reset;
    //             AppointmentLine.SetRange("Header No.", AppointmentHeader.Code);
    //             if AppointmentLine.FindSet then begin
    //                 repeat
    //                     ExaminationSetup.Get;
    //                     if ExaminationSetup."Appointment Sender Email" = '' then
    //                         Error('Please specify Appointment Sender Email under Examination setup page!!');
    //                     SenderAddress := ExaminationSetup."Appointment Sender Email";

    //                     SMTPMail.Create(CompInfo.Name, SenderAddress,
    //                     AppointmentLine.Email, 'APPOINTMENT:' + ' ' + '-' + AppointmentLine.Name,
    //                     'Dear ' + AppointmentLine.Name + ',<BR><BR>' +
    //                     'You have been succesfully appointed for the role ' + UpperCase(AppointmentLine."Role Code") + '.<BR>' +
    //                     'The examination period runs from' + ' ' + Format(AppointmentHeader."Examination Start Date") + ' ' + 'to' + ' ' + Format(AppointmentHeader."Examination End Date") +
    //                     'Your effective date of appointment is' + ' ' + Format(AppointmentLine."Effective Date"), true);
    //                     SMTPMail.AppendToBody(
    //                     '<BR><BR>Kind Regards,' +
    //                     '<BR><BR>EXAMINATION DEPARTMENT.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //                     SMTPMail.AppendToBody('<BR>' + CompInfo.Name);
    //                     //check if staff and copy supervisor
    //                     Employee.Reset;
    //                     Employee.SetRange("No.", AppointmentLine."Resource No.");
    //                     if Employee.FindFirst then begin
    //                         UserSetup1.Reset;
    //                         UserSetup1.SetRange("User ID", Employee.Supervisor);
    //                         if UserSetup1.FindFirst then begin
    //                             UserSetup1.TestField("E-Mail");
    //                             SMTPMail.AddCC(UserSetup1."E-Mail");
    //                         end
    //                     end;
    //                     SMTPMail.Send;

    //                     DocLog.Init;
    //                     DocLog."Entry No" := 0;
    //                     DocLog."Customer No" := AppointmentLine."Resource No.";
    //                     DocLog."E-mailed To" := AppointmentLine.Email;
    //                     DocLog.Date := Today;
    //                     DocLog.Time := Time;
    //                     DocLog."Sender ID" := UserId;
    //                     DocLog.Insert(true);

    //                 until AppointmentLine.Next = 0;
    //             end;
    //             Message('Notifications sent succesfully');
    //         end else
    //             if AppointmentHeader."Document Type" = AppointmentHeader."document type"::Termination then begin
    //                 StaffTerminationLine.Reset;
    //                 StaffTerminationLine.SetRange("Header No.", AppointmentHeader.Code);
    //                 if StaffTerminationLine.FindSet then begin
    //                     repeat
    //                         ExaminationSetup.Get;
    //                         if ExaminationSetup."Appointment Sender Email" = '' then
    //                             Error('Please specify Appointment Sender Email under Examination setup page!!');
    //                         SenderAddress := ExaminationSetup."Appointment Sender Email";

    //                         SMTPMail.Create(CompInfo.Name, SenderAddress,
    //                         StaffTerminationLine.Email, 'TERMINATION:' + ' ' + '-' + StaffTerminationLine.Name,
    //                         'Dear ' + StaffTerminationLine.Name + ',<BR><BR>' +
    //                         'You have been terminated for the role ' + UpperCase(StaffTerminationLine."Role Code") + '.<BR>' +
    //                         'For the following reason/s' + ' ' + Format(StaffTerminationLine."Termination Category") + ': ' + StaffTerminationLine."Termination Details" +
    //                         'Your effective date of termination is' + ' ' + Format(StaffTerminationLine."Termination Date"), true);
    //                         SMTPMail.AppendToBody(
    //                         '<BR><BR>Kind Regards,' +
    //                         '<BR><BR>EXAMINATION DEPARTMENT.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //                         SMTPMail.AppendToBody('<BR>' + CompInfo.Name);
    //                         SMTPMail.Send;

    //                         DocLog.Init;
    //                         DocLog."Entry No" := 0;
    //                         DocLog."Customer No" := StaffTerminationLine."Resource No.";
    //                         DocLog."E-mailed To" := StaffTerminationLine.Email;
    //                         DocLog.Date := Today;
    //                         DocLog.Time := Time;
    //                         DocLog."Sender ID" := UserId;
    //                         DocLog.Insert(true);

    //                     until StaffTerminationLine.Next = 0;
    //                     Message('Notifications sent succesfully');
    //                 end;
    //             end
    //     end;

    //     procedure SuggestCenterAllocation(CenterBookingHeader: Record "Center Booking Header")
    //     var
    //         CenterBookingLines: Record "Center Booking Lines";
    //         BookingLines: Record "Exam Booking Entries";
    //         LineNo: Integer;
    //         CenterCourseCapacity: Record "Center Course Capacity";
    //         TXT001: label 'There are no students registrered for the course %1, at the center %2';
    //     begin
    //         //delete all lines
    //         CenterBookingLines.Reset;
    //         CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
    //         if CenterBookingLines.FindSet then begin
    //             CenterBookingLines.DeleteAll;
    //         end;
    //         CenterBookingLines.Reset;
    //         if CenterBookingLines.FindLast then begin
    //             LineNo := CenterBookingLines."Line No.";
    //         end;
    //         //exam based
    //         CenterCourseCapacity.Reset;
    //         CenterCourseCapacity.SetRange("Centre Code", CenterBookingHeader."Exam Center Code");
    //         if CenterCourseCapacity.FindSet then begin
    //             repeat
    //                 BookingLines.Reset;
    //                 BookingLines.SetRange("Exam Center", CenterBookingHeader."Exam Center Code");
    //                 BookingLines.SetRange(Status, BookingLines.Status::Open);
    //                 BookingLines.SetRange(Examination, CenterCourseCapacity."Course Id");
    //                 BookingLines.SetRange("Exam Sitting", CenterBookingHeader."Examination Sitting");
    //                 if BookingLines.FindSet then begin
    //                     repeat
    //                         //check if student already exists
    //                         CenterBookingLines.Reset;
    //                         CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
    //                         CenterBookingLines.SetRange("Student Reg No.", BookingLines."Student Reg No.");
    //                         if not CenterBookingLines.FindSet then begin
    //                             CenterBookingLines.Init;
    //                             CenterBookingLines."Line No." := LineNo + 1;
    //                             CenterBookingLines."Header No." := CenterBookingHeader."Header No.";
    //                             CenterBookingLines."Student Reg No." := BookingLines."Student Reg No.";
    //                             CenterBookingLines."Student Name" := BookingLines."Student Name";
    //                             CenterBookingLines."Course Id" := BookingLines.Examination;
    //                             CenterBookingLines.Validate("Course Id");
    //                             CenterBookingLines."Subject Code" := BookingLines.Paper;
    //                             CenterBookingLines.Validate("Subject Code");
    //                             CenterBookingLines.Zone := CenterBookingHeader.Zone;
    //                             CenterBookingLines.Region := CenterBookingHeader.Region;
    //                             CenterBookingLines."Exam Center Code" := CenterBookingHeader."Exam Center Code";
    //                             CenterBookingLines."Center Name" := CenterBookingHeader."Center Name";
    //                             CenterBookingLines.Year := CenterBookingHeader.Year;
    //                             CenterBookingLines."Maximum Capacity" := CenterBookingHeader."Maximum Capacity";
    //                             CenterBookingLines."Sitting Cycle" := CenterBookingHeader."Examination Sitting";
    //                             CenterBookingLines.Insert;

    //                         end;
    //                         LineNo += 1;
    //                     until BookingLines.Next = 0;
    //                 end else
    //                     Error(TXT001, CenterCourseCapacity."Course Description", CenterBookingHeader."Center Name");
    //             until CenterCourseCapacity.Next = 0
    //         end
    //     end;

    //     procedure PostCenterAllocation(CenterBookingHeader: Record "Center Booking Header")
    //     var
    //         CenterBookingLines: Record "Center Booking Lines";
    //         BookingEntries: Record "Center Booking Entries";
    //         EntryNo: Integer;
    //     begin
    //         CenterBookingLines.Reset;
    //         CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
    //         if CenterBookingLines.FindSet then begin
    //             repeat
    //                 BookingEntries.Reset;
    //                 if BookingEntries.FindLast then begin
    //                     EntryNo := BookingEntries."Line No.";
    //                 end;
    //                 BookingEntries.Init;
    //                 BookingEntries."Line No." := EntryNo + 1;
    //                 BookingEntries.Status := BookingEntries.Status::Allocated;
    //                 BookingEntries."Header No." := CenterBookingHeader."Header No.";
    //                 BookingEntries."Exam Center Code" := CenterBookingHeader."Exam Center Code";
    //                 BookingEntries."Center Name" := CenterBookingHeader."Center Name";
    //                 BookingEntries."Student Reg No." := CenterBookingLines."Student Reg No.";
    //                 BookingEntries."Student Name" := CenterBookingLines."Student Name";
    //                 BookingEntries."Examination Id" := CenterBookingLines."Course Id";
    //                 BookingEntries.Year := CenterBookingLines.Year;
    //                 BookingEntries."Examination Description" := CenterBookingLines."Course Description";
    //                 BookingEntries."Examination Sitting" := CenterBookingLines."Sitting Cycle";
    //                 BookingEntries.Insert;
    //             until
    //           CenterBookingLines.Next = 0;
    //         end;
    //         Message('Allocation Voucher %1,posted succesfully', CenterBookingHeader."Header No.");
    //         CenterBookingHeader.Posted := true;
    //         CenterBookingHeader.Modify(true);
    //     end;

    //     procedure SuggestCenterEntries(CenterBookingHeader: Record "Center Booking Header")
    //     var
    //         CenterBookingLines: Record "Center Booking Lines";
    //         BookingLines: Record "Exam Booking Entries";
    //         LineNo: Integer;
    //         CenterBookingLines1: Record "Center Booking Entries";
    //         CenterBookingLines2: Record "Center Booking Lines";
    //     begin
    //         CenterBookingLines.Reset;
    //         CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
    //         if CenterBookingLines.FindSet then begin
    //             CenterBookingLines.DeleteAll;
    //         end;
    //         CenterBookingLines.Reset;
    //         if CenterBookingLines.FindLast then begin
    //             LineNo := CenterBookingLines."Line No.";
    //         end;
    //         CenterBookingLines1.Reset;
    //         CenterBookingLines1.SetRange("Exam Center Code", CenterBookingHeader."Initial Center Code");
    //         if CenterBookingLines1.FindSet then begin
    //             repeat
    //                 //check if student already exists
    //                 CenterBookingLines2.Reset;
    //                 CenterBookingLines2.SetRange("Header No.", CenterBookingHeader."Header No.");
    //                 CenterBookingLines2.SetRange("Student Reg No.", CenterBookingLines1."Student Reg No.");
    //                 if not CenterBookingLines2.FindSet then begin

    //                     CenterBookingLines."Line No." := LineNo + 1;
    //                     CenterBookingLines."Header No." := CenterBookingHeader."Header No.";
    //                     CenterBookingLines."Student Reg No." := CenterBookingLines1."Student Reg No.";
    //                     CenterBookingLines."Student Name" := CenterBookingLines1."Student Name";
    //                     CenterBookingLines."Course Id" := CenterBookingLines1."Examination Id";
    //                     CenterBookingLines.Validate("Course Id");
    //                     CenterBookingLines."Subject Code" := CenterBookingLines1."Subject Code";
    //                     CenterBookingLines.Validate("Subject Code");
    //                     CenterBookingLines.Zone := CenterBookingHeader.Zone;
    //                     CenterBookingLines.Region := CenterBookingHeader.Region;
    //                     CenterBookingLines."Exam Center Code" := CenterBookingHeader."Exam Center Code";
    //                     CenterBookingLines."Center Name" := CenterBookingHeader."Center Name";
    //                     CenterBookingLines.Year := CenterBookingHeader.Year;
    //                     CenterBookingLines."Maximum Capacity" := CenterBookingHeader."Maximum Capacity";
    //                     CenterBookingLines."Sitting Cycle" := CenterBookingHeader."Examination Sitting";
    //                     CenterBookingLines.Insert;
    //                 end;
    //                 LineNo += 1;
    //             until CenterBookingLines1.Next = 0;
    //         end;
    //     end;

    //     procedure PostCenterReAllocation(CenterBookingHeader: Record "Center Booking Header")
    //     var
    //         CenterBookingLines: Record "Center Booking Lines";
    //         BookingEntries: Record "Center Booking Entries";
    //         EntryNo: Integer;
    //         StudentProcessingHeader: Record "Student Processing Header";
    //         TXT001: label 'There is not enough space to accomodate the students';
    //         BookingEntries1: Record "Center Booking Entries";
    //     begin
    //         //block the old entries
    //         BookingEntries1.Reset;
    //         BookingEntries1.SetRange(Status, BookingEntries.Status::Allocated);
    //         BookingEntries1.SetRange("Exam Center Code", CenterBookingHeader."Initial Center Code");
    //         if BookingEntries1.FindSet then begin
    //             repeat
    //                 BookingEntries1.Status := BookingEntries.Status::"Re-allocated";
    //                 BookingEntries1.Modify;
    //             until BookingEntries1.Next = 0;
    //         end;
    //         //check slot availability

    //         CenterBookingLines.Reset;
    //         CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
    //         if CenterBookingLines.FindSet then begin
    //             repeat
    //                 StudentProcessingHeader.Reset;
    //                 StudentProcessingHeader.SetRange("Document Type", StudentProcessingHeader."document type"::Booking);
    //                 StudentProcessingHeader.SetRange("Examination Center Code", CenterBookingHeader."Exam Center Code");
    //                 StudentProcessingHeader.SetRange("Examination Sitting", CenterBookingHeader."Examination Sitting");
    //                 StudentProcessingHeader.SetRange("Student Reg. No.", CenterBookingLines."Student Reg No.");
    //                 if StudentProcessingHeader.FindFirst then begin
    //                     if CheckSlotAvailability(StudentProcessingHeader) = true then begin
    //                         BookingEntries.Reset;
    //                         if BookingEntries.FindLast then begin
    //                             EntryNo := BookingEntries."Line No.";
    //                         end;
    //                         BookingEntries.Init;
    //                         BookingEntries.Status := BookingEntries.Status::Allocated;
    //                         BookingEntries."Line No." := EntryNo + 1;
    //                         BookingEntries."Header No." := CenterBookingHeader."Header No.";
    //                         BookingEntries."Exam Center Code" := CenterBookingHeader."Exam Center Code";
    //                         BookingEntries."Center Name" := CenterBookingHeader."Center Name";
    //                         BookingEntries."Re-Allocation Center Code" := CenterBookingHeader."Initial Center Booking";
    //                         BookingEntries."Re-Allocation Center Name" := CenterBookingHeader."Initial Center Name";
    //                         BookingEntries."Student Reg No." := CenterBookingLines."Student Reg No.";
    //                         BookingEntries."Student Name" := CenterBookingLines."Student Name";
    //                         BookingEntries."Examination Id" := CenterBookingLines."Course Id";
    //                         BookingEntries.Year := CenterBookingLines.Year;
    //                         BookingEntries.Validate("Examination Id");
    //                         BookingEntries."Examination Sitting" := CenterBookingLines."Sitting Cycle";
    //                         BookingEntries.Insert;
    //                     end;
    //                 end else
    //                     Error(TXT001);
    //             until CenterBookingLines.Next = 0;
    //         end;
    //         //send email to students

    //         Message('Re-Allocation Voucher %1,posted succesfully', CenterBookingHeader."Header No.");
    //         CenterBookingHeader.Posted := true;
    //         CenterBookingHeader.Modify(true);
    //     end;

    //     procedure SuggestAppointees(AppointmentHeader: Record "Appointment Header")
    //     var
    //         AppointmentLine: Record "Staff Appointment Line";
    //         StaffTerminationLine: Record "Staff Termination Line";
    //         "Entry No": Integer;
    //     begin
    //         AppointmentLine.Reset;
    //         AppointmentLine.SetRange("Header No.", AppointmentHeader."Appointment Code");
    //         if AppointmentLine.FindSet then begin
    //             repeat
    //                 StaffTerminationLine.Reset;
    //                 if StaffTerminationLine.FindLast then begin
    //                     "Entry No" := StaffTerminationLine."Line No.";
    //                 end;

    //                 StaffTerminationLine.Init;
    //                 StaffTerminationLine."Line No." := "Entry No" + 1;
    //                 StaffTerminationLine."Header No." := AppointmentHeader.Code;
    //                 StaffTerminationLine."Resource No." := AppointmentLine."Resource No.";
    //                 StaffTerminationLine.Name := AppointmentLine.Name;
    //                 StaffTerminationLine.Email := AppointmentLine.Email;
    //                 StaffTerminationLine."Project Manager" := AppointmentLine."Team Leader";
    //                 StaffTerminationLine."Staff Category" := AppointmentLine."Staff Category";
    //                 StaffTerminationLine."Role Code" := AppointmentLine."Role Code";
    //                 StaffTerminationLine."Project Start Date" := AppointmentHeader."Examination Start Date";
    //                 StaffTerminationLine."Project End Date" := AppointmentHeader."Examination End Date";
    //                 StaffTerminationLine."Appointment Document No." := AppointmentHeader.Code;
    //                 StaffTerminationLine.Insert;
    //             until AppointmentLine.Next = 0
    //         end;
    //         Message('The appointed resources:%1,has been added succesfully', AppointmentHeader.Code);
    //         //insert on the project
    //         //send notification for appointment

    //         AppointmentHeader.Posted := true;
    //         AppointmentHeader."Posted By" := UserId;
    //         AppointmentHeader."Posted On" := CurrentDatetime;
    //         AppointmentHeader.Modify;

    //     end;

    //     procedure PostAppointmentVoucher(AppointmentHeader: Record "Appointment Header")
    //     var
    //         AppointmentLine: Record "Staff Appointment Line";
    //         AppointmentFunction: Record "Staff Appointment Function";
    //         EntryNo: Integer;
    //     begin
    //         AppointmentLine.Reset;
    //         AppointmentLine.SetRange("Header No.", AppointmentHeader.Code);
    //         if AppointmentLine.FindSet then begin
    //             repeat
    //                 AppointmentFunction.Reset;
    //                 if AppointmentFunction.FindLast then begin
    //                     EntryNo := AppointmentFunction."Entry No.";
    //                 end;
    //                 AppointmentFunction.Init;
    //                 AppointmentFunction."Entry No." := EntryNo + 1;
    //                 AppointmentFunction."Header No." := AppointmentHeader.Code;
    //                 AppointmentFunction."Resource No." := AppointmentLine."Resource No.";
    //                 AppointmentFunction.Name := AppointmentLine.Name;
    //                 AppointmentFunction.Email := AppointmentLine.Email;
    //                 AppointmentFunction."Project Manager" := AppointmentLine."Team Leader";
    //                 AppointmentFunction."Staff Category" := AppointmentLine."Staff Category";
    //                 AppointmentFunction."Effective Date" := AppointmentLine."Effective Date";
    //                 AppointmentFunction."Expiry Date" := AppointmentLine."Expiry Date";
    //                 AppointmentFunction."Staff Role Code" := AppointmentLine."Role Code";
    //                 AppointmentFunction.Description := AppointmentHeader.Description;
    //                 AppointmentFunction."Posted By" := UserId;
    //                 AppointmentFunction."Posting Date" := Today;
    //                 AppointmentFunction.Insert;
    //             until AppointmentLine.Next = 0
    //         end;
    //         Message('The appoinment header no:%1,has been posted succesfully', AppointmentHeader.Code);
    //         //insert on the project
    //         AppointmentHeader.Posted := true;
    //         AppointmentHeader."Posted By" := UserId;
    //         AppointmentHeader."Posted On" := CurrentDatetime;
    //         AppointmentHeader.Modify;

    //     end;

    //     procedure PostTerminationVoucher(AppointmentHeader: Record "Appointment Header")
    //     var
    //         AppointmentLine: Record "Staff Termination Line";
    //         AppointmentFunction: Record "Staff Appointment Function";
    //         EntryNo: Integer;
    //     begin
    //         AppointmentLine.Reset;
    //         AppointmentLine.SetRange("Header No.", AppointmentHeader.Code);
    //         if AppointmentLine.FindSet then begin
    //             repeat
    //                 AppointmentFunction.Reset;
    //                 if AppointmentFunction.FindLast then begin
    //                     EntryNo := AppointmentFunction."Entry No.";
    //                 end;
    //                 AppointmentFunction.Init;
    //                 AppointmentFunction."Entry No." := EntryNo + 1;
    //                 AppointmentFunction."Header No." := AppointmentHeader.Code;
    //                 AppointmentFunction."Resource No." := AppointmentLine."Resource No.";
    //                 AppointmentFunction.Name := AppointmentLine.Name;
    //                 AppointmentFunction.Email := AppointmentLine.Email;
    //                 AppointmentFunction."Project Manager" := AppointmentLine."Project Manager";
    //                 AppointmentFunction."Staff Category" := AppointmentLine."Staff Category";
    //                 AppointmentFunction."Termination Date" := AppointmentLine."Termination Date";
    //                 AppointmentFunction."Termination Details" := AppointmentLine."Termination Details";
    //                 AppointmentFunction."Termination Category" := AppointmentLine."Termination Category";
    //                 AppointmentFunction."Staff Role Code" := AppointmentLine."Role Code";
    //                 AppointmentFunction.Description := AppointmentHeader.Description;
    //                 AppointmentFunction."Posted By" := UserId;
    //                 AppointmentFunction."Posting Date" := Today;
    //                 AppointmentFunction.Insert;
    //             until AppointmentLine.Next = 0
    //         end;
    //         Message('The termination voucher no:%1,has been posted succesfully', AppointmentHeader.Code);
    //         //insert on the project
    //         AppointmentHeader.Posted := true;
    //         AppointmentHeader."Posted By" := UserId;
    //         AppointmentHeader."Posted On" := CurrentDatetime;
    //         AppointmentHeader.Modify;

    //     end;

    //     procedure SuggestTaskLines(PlannerHeader: Record "Exam Material Planner Header")
    //     var
    //         PlannerLine: Record "Exam Planner Line";
    //         Job: Record Job;
    //         JobTask: Record "Job Task";
    //         TXT001: label 'The entries have been populated succesfully';
    //         EntryNo: Integer;
    //         PlannerLine1: Record "Exam Planner Line";
    //         JobPlanningLine: Record "Job Planning Line";
    //         PlannerItems: Record "Examination Planner Items";
    //         PlannerItems1: Record "Examination Planner Items";
    //         LineNo: Integer;
    //         Papers: Record Papers;
    //     begin
    //         PlannerLine.Reset;
    //         PlannerLine.SetRange("Planner No.", PlannerHeader.Code);
    //         if PlannerLine.FindSet then begin
    //             PlannerLine.DeleteAll;
    //         end;

    //         PlannerItems.Reset;
    //         PlannerItems.SetRange("Exam Planner No.", PlannerHeader.Code);
    //         if PlannerItems.FindSet then begin
    //             PlannerItems.DeleteAll;
    //         end;

    //         EntryNo := 0;
    //         PlannerLine1.Reset;
    //         if PlannerLine1.FindLast then begin
    //             EntryNo := PlannerLine1."Line No.";
    //         end;

    //         LineNo := 0;
    //         PlannerItems1.Reset;
    //         if PlannerItems1.FindLast then begin
    //             LineNo := PlannerItems1."Line No.";
    //         end;

    //         JobTask.Reset;
    //         JobTask.SetRange("Job No.", PlannerHeader."Examination Project ID");
    //         if JobTask.FindSet then begin
    //             repeat

    //                 Papers.Reset;
    //                 Papers.SetRange(Course, JobTask."Job Task No.");
    //                 if Papers.FindSet then begin
    //                     repeat

    //                         //LOOP THE COURSES TABLE

    //                         PlannerLine.Init;
    //                         PlannerLine."Line No." := EntryNo + 1;
    //                         PlannerLine.Examination := JobTask."Job Task No.";
    //                         PlannerLine."Planner No." := PlannerHeader.Code;
    //                         PlannerLine."Financial Year Code" := PlannerHeader."Financial Year Code";
    //                         PlannerLine."Project No." := PlannerHeader."Examination Project ID";
    //                         PlannerLine."Examination Task No." := JobTask."Job Task No.";
    //                         PlannerLine.Validate("Examination Task No.");
    //                         PlannerLine."Subject Code" := Papers.Code;
    //                         PlannerLine.Validate("Subject Code");
    //                         PlannerLine.Insert;
    //                         //INSERT ENTRIES
    //                         JobPlanningLine.Reset;
    //                         JobPlanningLine.SetRange("Job Task No.", JobTask."Job Task No.");
    //                         if JobPlanningLine.FindSet then begin
    //                             repeat
    //                                 PlannerItems.Init;
    //                                 PlannerItems."Line No." := LineNo + 1;
    //                                 PlannerItems."Exam Planner No." := PlannerHeader.Code;
    //                                 PlannerItems."Exam Planner Entry" := PlannerLine."Line No.";
    //                                 PlannerItems.Description := JobPlanningLine.Description;
    //                                 PlannerItems."Unit of Measure" := JobPlanningLine."Unit of Measure Code";
    //                                 PlannerItems.Type := JobPlanningLine.Type;
    //                                 PlannerItems."No." := JobPlanningLine."No.";
    //                                 PlannerItems."Total Amount" := JobPlanningLine."Total Cost";
    //                                 PlannerItems.Quantity := JobPlanningLine.Quantity;
    //                                 PlannerItems."Unit Amount" := JobPlanningLine."Unit Cost";
    //                                 PlannerItems.Insert;
    //                                 LineNo += 1;
    //                             until JobPlanningLine.Next = 0;
    //                         end;
    //                         EntryNo := EntryNo + 1;
    //                     until Papers.Next = 0;
    //                 end;

    //             until JobTask.Next = 0;
    //         end;
    //         Message(TXT001);
    //     end;

    //     procedure PostMaterialPlanner(PlannerHeader: Record "Exam Material Planner Header")
    //     var
    //         PlannerLine: Record "Exam Planner Line";
    //         Job: Record Job;
    //         JobTask: Record "Job Task";
    //         TXT001: label 'The voucher has been posted succesfully';
    //         EntryNo: Integer;
    //         JobPlanningLine: Record "Job Planning Line";
    //         ExamPlannerLine: Record "Exam Planner Line";
    //         PlannerItems: Record "Examination Planner Items";
    //         JobPlanningLine1: Record "Job Planning Line";
    //     begin
    //         JobPlanningLine.Reset;
    //         JobPlanningLine.SetRange("Job No.", PlannerHeader."Examination Project ID");
    //         if JobPlanningLine.FindSet then begin
    //             JobPlanningLine.DeleteAll;
    //         end;
    //         PlannerLine.Reset;
    //         PlannerLine.SetRange("Planner No.", PlannerHeader.Code);
    //         if PlannerLine.FindSet then begin
    //             repeat
    //                 JobTask.Reset;
    //                 JobTask.SetRange("Job No.", PlannerHeader."Examination Project ID");
    //                 JobTask.SetRange("Job Task No.", PlannerLine."Examination Task No.");
    //                 if JobTask.FindSet then begin
    //                     repeat
    //                         EntryNo := 0;
    //                         JobPlanningLine1.Reset;
    //                         JobPlanningLine1.SetRange("Job No.", PlannerHeader."Examination Project ID");
    //                         if JobPlanningLine1.FindLast then begin
    //                             EntryNo := JobPlanningLine1."Line No.";
    //                         end;
    //                         PlannerItems.Reset;
    //                         PlannerItems.SetRange("Exam Planner No.", PlannerHeader.Code);
    //                         PlannerItems.SetRange("Exam Planner Entry", PlannerLine."Line No.");
    //                         if PlannerItems.FindSet then begin
    //                             repeat
    //                                 JobPlanningLine.Init;
    //                                 JobPlanningLine."Line No." := EntryNo + 1;
    //                                 JobPlanningLine."Job No." := PlannerHeader."Examination Project ID";
    //                                 JobPlanningLine."Job Task No." := PlannerLine."Examination Task No.";
    //                                 JobPlanningLine."Document No." := PlannerHeader.Code;
    //                                 JobPlanningLine.Type := PlannerItems.Type;
    //                                 JobPlanningLine."No." := PlannerItems."No.";
    //                                 JobPlanningLine."Unit of Measure Code" := PlannerItems."Unit of Measure";
    //                                 JobPlanningLine.Validate("No.");
    //                                 JobPlanningLine."Planning Date" := PlannerHeader."Planning Start Date";
    //                                 JobPlanningLine."Planned Delivery Date" := PlannerHeader."Planning End Date";
    //                                 JobPlanningLine.Quantity := PlannerItems.Quantity;
    //                                 JobPlanningLine."Unit Cost" := PlannerItems."Unit Amount";
    //                                 JobPlanningLine.Validate(Quantity);
    //                                 JobPlanningLine.Validate("Unit Cost");
    //                                 JobPlanningLine.Insert;
    //                                 EntryNo += 1;
    //                             until PlannerItems.Next = 0;
    //                         end;
    //                     until JobTask.Next = 0;
    //                 end;
    //             until PlannerLine.Next = 0;
    //         end;
    //         Message(TXT001);
    //         PlannerHeader.Posted := true;
    //         PlannerHeader."Posted By" := UserId;
    //         PlannerHeader."Posted On" := CurrentDatetime;
    //         PlannerHeader.Modify;
    //     end;

    //     procedure SuggestPapers(TimetablePlanner: Record "Timetable Planner Header")
    //     var
    //         Job: Record Job;
    //         PlannerLines: Record "Timetable Planner Lines";
    //         LineNo: Integer;
    //         Papers: Record Papers;
    //         JobTask: Record "Job Task";
    //         PlannerLines1: Record "Timetable Planner Lines";
    //         TXT001: label 'Papers for the Exams to be offered on %1,have been added';
    //         ExaminationLines: Record "Timetable Examination Lines";
    //         ExaminationLines1: Record "Timetable Examination Lines";
    //         LineNo1: Integer;
    //     begin
    //         PlannerLines1.Reset;
    //         PlannerLines1.SetRange(Code, TimetablePlanner.Code);
    //         if PlannerLines1.FindSet then begin
    //             PlannerLines1.DeleteAll;
    //         end;

    //         ExaminationLines1.Reset;
    //         ExaminationLines1.SetRange(Code, TimetablePlanner.Code);
    //         if ExaminationLines1.FindSet then begin
    //             ExaminationLines1.DeleteAll;
    //         end;
    //         //get job first
    //         Job.Reset;
    //         Job.SetRange("Examination Sitting Cycle", TimetablePlanner."Exam Sitting ID");
    //         if Job.FindFirst then begin
    //             JobTask.Reset;
    //             JobTask.SetRange("Job No.", Job."No.");
    //             if JobTask.FindSet then begin
    //                 repeat
    //                     //get papers
    //                     //INSERT Exam'
    //                     ExaminationLines1.Reset;
    //                     if ExaminationLines1.FindLast then begin
    //                         LineNo1 := ExaminationLines1."Line No.";
    //                     end;
    //                     ExaminationLines.Code := TimetablePlanner.Code;
    //                     ExaminationLines."Line No." := LineNo1 + 1;
    //                     ExaminationLines.Examination := JobTask."Job Task No.";
    //                     ExaminationLines.Description := JobTask.Description;
    //                     ExaminationLines.Insert(true);

    //                     Papers.Reset;
    //                     Papers.SetRange(Course, JobTask."Job Task No.");
    //                     if Papers.FindSet then begin
    //                         repeat
    //                             PlannerLines1.Reset;
    //                             if PlannerLines1.FindLast then begin
    //                                 LineNo := PlannerLines1."Line No.";
    //                             end;
    //                             PlannerLines."Line No." := LineNo + 1;
    //                             PlannerLines."Entry No." := ExaminationLines."Line No.";
    //                             PlannerLines.Code := TimetablePlanner.Code;
    //                             PlannerLines.Examination := Papers.Course;
    //                             PlannerLines."Exam Sitting ID" := TimetablePlanner."Exam Sitting ID";
    //                             PlannerLines.Part := Papers.Level;
    //                             PlannerLines.Section := Papers.Section;
    //                             PlannerLines.Paper := Papers.Code;
    //                             PlannerLines.Validate(Paper);
    //                             PlannerLines.Insert;
    //                             LineNo1 += 1;
    //                         until Papers.Next = 0;
    //                     end;
    //                 until JobTask.Next = 0;
    //                 Message(TXT001, TimetablePlanner."Exam Sitting ID");
    //             end;
    //         end
    //     end;

    //     procedure SuggestStudentsBooked(MarksheetHeader: Record "Marksheet Header")
    //     var
    //         MarksheetLines: Record "Exam Marksheet Lines";
    //         MarksheetLines1: Record "Exam Marksheet Lines";
    //         DetailedLines: Record "Marksheet Detailed Lines";
    //         ExamBooking: Record "Exam Booking Entries";
    //         TXT001: label 'The booked students have been suggested successfully';
    //         DetailedLines1: Record "Marksheet Detailed Lines";
    //         EntryNo: Integer;
    //     begin
    //         //delete all lines
    //         //Pass Examination
    //         MarksheetLines1.Reset;
    //         MarksheetLines1.SetRange("Document No.", MarksheetHeader."Document No.");
    //         if MarksheetLines1.FindSet then begin
    //             MarksheetLines1.DeleteAll;
    //         end;
    //         //delet all detailed lines

    //         DetailedLines.Reset;
    //         DetailedLines.SetRange("Document No.", MarksheetHeader."Document No.");
    //         if DetailedLines.FindSet then begin
    //             DetailedLines.DeleteAll;
    //         end;

    //         DetailedLines.Reset;
    //         if DetailedLines.FindLast then
    //             EntryNo := DetailedLines."Line No.";

    //         //insert lines

    //         ExamBooking.Reset;
    //         ExamBooking.SetRange("Exam Sitting", MarksheetHeader."Examination Sitting ID");
    //         ExamBooking.SetRange(Status, ExamBooking.Status::Ongoing);
    //         if ExamBooking.FindSet then begin
    //             repeat
    //                 //check if student exists twice
    //                 MarksheetLines1.Reset;
    //                 MarksheetLines1.SetRange("Document No.", MarksheetHeader."Document No.");
    //                 MarksheetLines1.SetRange("Student Reg No.", ExamBooking."Student Reg No.");
    //                 if not MarksheetLines1.FindFirst then begin

    //                     MarksheetLines."Document No." := MarksheetHeader."Document No.";
    //                     MarksheetLines."Student Reg No." := ExamBooking."Student Reg No.";
    //                     MarksheetLines.Validate("Student Reg No.");
    //                     MarksheetLines."Examination Center" := ExamBooking."Exam Center";
    //                     MarksheetLines."Examination Sitting ID" := MarksheetHeader."Examination Sitting ID";
    //                     MarksheetLines.Insert;

    //                 end;
    //                 //insert detailed line
    //                 DetailedLines.Reset;
    //                 DetailedLines.SetRange("Document No.", MarksheetHeader."Document No.");
    //                 DetailedLines.SetRange("Student Reg No.", ExamBooking."Student Reg No.");
    //                 DetailedLines.SetRange(Paper, ExamBooking.Paper);
    //                 if not DetailedLines.FindFirst then begin
    //                     DetailedLines1."Line No." := EntryNo + 1;
    //                     DetailedLines1."Document No." := MarksheetHeader."Document No.";
    //                     DetailedLines1."Student Reg No." := ExamBooking."Student Reg No.";
    //                     DetailedLines1.Validate("Student Reg No.");
    //                     DetailedLines1."Examination Center" := ExamBooking."Exam Center";
    //                     DetailedLines1."Examination Sitting ID" := MarksheetHeader."Examination Sitting ID";
    //                     DetailedLines1.Examination := ExamBooking.Examination;
    //                     DetailedLines1.Part := ExamBooking.Part;
    //                     DetailedLines1.Paper := ExamBooking.Paper;
    //                     DetailedLines1.Validate(Paper);
    //                     DetailedLines1.Insert;
    //                     EntryNo += 1;
    //                 end
    //             until ExamBooking.Next = 0;
    //             Message(TXT001);
    //         end;
    //     end;

    //     procedure GenerateResults(MarksheetHeader: Record "Marksheet Header")
    //     var
    //         ExaminationResults: Record "Examination Results";
    //         LineNo: Integer;
    //         ExaminationResults1: Record "Examination Results";
    //         DetailedLines: Record "Marksheet Detailed Lines";
    //     begin
    //         ExaminationResults.Reset;
    //         ExaminationResults.SetRange("Examination Sitting ID", MarksheetHeader."Examination Sitting ID");
    //         if ExaminationResults.FindSet then begin
    //             ExaminationResults.DeleteAll;
    //         end;
    //         //insert detailed lines
    //         DetailedLines.Reset;
    //         DetailedLines.SetRange("Document No.", MarksheetHeader."Document No.");
    //         if DetailedLines.FindSet then begin
    //             repeat
    //                 ExaminationResults1.Reset;
    //                 if ExaminationResults1.FindLast then begin
    //                     LineNo := ExaminationResults1."Line No.";
    //                 end;
    //                 ExaminationResults."Student Reg No." := DetailedLines."Student Reg No.";
    //                 ExaminationResults."Line No." := LineNo + 1;
    //                 ExaminationResults.Validate("Student Reg No.");
    //                 ExaminationResults.Examination := DetailedLines.Examination;
    //                 ExaminationResults.Part := DetailedLines.Part;
    //                 ExaminationResults.Section := DetailedLines.Section;
    //                 ExaminationResults.Paper := DetailedLines.Paper;
    //                 ExaminationResults.Validate(Paper);
    //                 ExaminationResults.Grade := DetailedLines.Grade;
    //                 ExaminationResults."Financial Year" := MarksheetHeader."Financial Year Code";
    //                 ExaminationResults."Examination Sitting ID" := MarksheetHeader."Examination Sitting ID";
    //                 ExaminationResults."Section Grade" := CalculateSectionGrade(DetailedLines);
    //                 ExaminationResults.Insert;


    //             until DetailedLines.Next = 0;
    //         end
    //     end;

    //     local procedure CalculateSectionGrade(DetailedLines: Record "Marksheet Detailed Lines") GradeCode: Code[30]
    //     var
    //         TotalPassed: Integer;
    //         SectionGrading: Record "Section Grading System";
    //         DetailedLines1: Record "Marksheet Detailed Lines";
    //     begin
    //         SectionGrading.Reset;
    //         SectionGrading.SetRange(Section, DetailedLines.Section);
    //         if SectionGrading.FindSet then begin
    //             repeat
    //                 DetailedLines1.Reset;
    //                 DetailedLines1.SetRange("Student Reg No.", DetailedLines."Student Reg No.");
    //                 DetailedLines1.SetRange(Examination, SectionGrading.Examination);
    //                 DetailedLines1.SetRange(Passed, true);
    //                 DetailedLines1.SetRange(Section, SectionGrading.Section);
    //                 if DetailedLines1.FindSet then begin
    //                     TotalPassed := 0;
    //                     repeat
    //                         TotalPassed += 1;
    //                     until DetailedLines1.Next = 0;
    //                 end;
    //                 if (TotalPassed = SectionGrading."No. of Papers Qualified") then begin
    //                     GradeCode := SectionGrading."Grade Code";
    //                 end;
    //             until SectionGrading.Next = 0
    //         end;
    //         exit(GradeCode);
    //     end;

    //     procedure ApplicationSendRegretEmail(StudentUser: Record "Student Processing Header")
    //     var
    //         ContactUsers: Record Contact;
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";
    //         //SMTP.Create('KASNEB STUDENT REGISTRATION', Email2, StudentUser.Email,
    //         'KASNEB STUDENT REGISTRATION',
    //          'Dear ' + StudentUser."Student Name" + ',<BR><BR>' +
    //          'Your registration request done on <b>' + ' ' + Format(StudentUser."Created On") + ' ' + '</b> is unsuccessful.<BR>' +
    //          'The following are/is the reason:' + StudentUser."Reason for Rejection" + '', true);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
    //         //SMTP.AppendToBody('<BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();

    //     end;

    //     procedure ApplicationCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record "Receipts Header1";
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "Receipt Lines1";
    //         NoSeries: Code[30];
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //         TXT001: label 'There is no unposted invoice for the application %1';
    //         ExaminationSetup: Record "Examination Setup";
    //         PaymentsPost: Codeunit "Payments-Post";
    //         Studentmanagement: Codeunit "Student management";
    //         ReceiptHeader1: Record "Receipts Header1";
    //     begin
    //         //code to post the created invoice
    //         ExaminationSetup.Get;
    //         ExaminationSetup.TestField("Payments Bank Code");
    //         CashMngmntSetup.Get();
    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if SalesInv.FindFirst then begin
    //             SalesPostYesNo.Run(SalesInv);
    //         end;
    //         //check if receipt exists
    //         ReceiptHeader1.Reset;
    //         ReceiptHeader1.SetRange("Cheque No", BulkProcessingHeader."No.");
    //         ReceiptHeader1.SetRange(Posted, false);
    //         if ReceiptHeader1.FindFirst then begin
    //             Studentmanagement.PostReceipt(ReceiptHeader1);
    //         end else begin

    //             NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
    //             ReceiptHeader.Init;
    //             ReceiptHeader."No." := NoSeries;
    //             ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code";
    //             if BulkProcessingHeader."Pay Mode" = '' then
    //                 ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode"
    //             else
    //                 ReceiptHeader."Pay Mode" := BulkProcessingHeader."Pay Mode";
    //             ReceiptHeader.Validate("Bank Code");
    //             ReceiptHeader."Received From" := BulkProcessingHeader."Student Name";
    //             ReceiptHeader."On Behalf Of" := BulkProcessingHeader."Student Name";
    //             ReceiptHeader."Posted Date" := Today;
    //             ReceiptHeader."Posting Date" := Today;
    //             ReceiptHeader.Insert(true);
    //             ReceiptLines.Init;
    //             ReceiptLines."Receipt No." := ReceiptHeader."No.";
    //             ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //             ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Registration amount';
    //             ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
    //             ReceiptLines.Validate("Account No.");
    //             //get posted invoice number
    //             CustLedgerEntry.Reset;
    //             CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
    //             CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             if CustLedgerEntry.FindFirst then begin
    //                 ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
    //                 ReceiptLines.Validate("Applies to Doc. No");
    //             end;

    //             ReceiptLines.Insert(true);
    //         end;
    //         //code to assing a unique registration No.]
    //         /*BulkProcessingHeader."Application Receipt":=ReceiptHeader."No.";
    //         ReceiptHeader.CALCFIELDS(Amount);
    //         BulkProcessingHeader."Application Amount":=ReceiptHeader.Amount;*/

    //         //open the receipt card
    //         if ExaminationSetup."Auto-Posting" = true then begin
    //             Studentmanagement.PostReceipt(ReceiptHeader);

    //             //RecSendPDFRegistration(BulkProcessingHeader);
    //         end;
    //         ApplicationAssignRegistrationNo(BulkProcessingHeader);
    //         BulkProcessingHeader."Application Receipt" := ReceiptHeader."No.";
    //         ReceiptHeader.CalcFields(Amount);
    //         BulkProcessingHeader."Application Amount" := ReceiptHeader.Amount;
    //         BulkProcessingHeader.Posted := true;
    //         BulkProcessingHeader."Posted Date" := Today;
    //         BulkProcessingHeader."Posted By" := UserId;
    //         BulkProcessingHeader."Posted On" := CurrentDatetime;
    //         BulkProcessingHeader.Modify;
    //         RecSendPDFRegistration(BulkProcessingHeader);

    //         //END

    //         //send email receipt

    //     end;

    //     procedure ApplicationCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         FileName: Text;
    //         FileLocation: Text;
    //         SalesHeader: Record "Sales Header";
    //         TXT001: label 'A sales invoice no %1,has already been processed for this application';
    //         ProcessingHeader: Record "Student Processing Header";
    //     begin

    //         BulkProcessingHeader.TestField("Fee Type");

    //         ExaminationSetup.Get;
    //         SalesInv.Reset;
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if not SalesInv.FindFirst then begin

    //             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //             SalesInv."No." := '';
    //             SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //             SalesInv."Document Date" := Today;
    //             SalesInv."Order Date" := Today;
    //             SalesInv."Posting Date" := Today;
    //             SalesInv."External Document No." := BulkProcessingHeader."No.";
    //             SalesInv.Type := SalesInv.Type::Normal;
    //             SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
    //             SalesInv."Prepayment %" := 100;//enforce prepayment`

    //             if SalesInv.Insert(true) then begin
    //                 // ERROR('Hie');
    //                 SalesLine.Init;
    //                 SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //                 SalesLine."Document No." := SalesInv."No.";
    //                 SalesLine."Line No." := 100;
    //                 SalesLine.Type := SalesLine.Type::Resource;
    //                 SalesLine."No." := BulkProcessingHeader."Fee Type";
    //                 SalesLine.Validate("No.");
    //                 SalesLine.Quantity := 1;
    //                 SalesLine.Validate(Quantity);
    //                 SalesLine."Unit Price" := BulkProcessingHeader."Application Amount";
    //                 SalesLine.Validate("Unit Price");
    //                 // IF BulkProcessingHeader.Disabled=TRUE THEN BEGIN
    //                 //  SalesLine."Line Discount %":=ExaminationSetup."Disability Discount %";
    //                 //  SalesLine.VALIDATE("Line Discount %");
    //                 // END;
    //                 SalesLine.Insert(true);
    //                 ExaminationSetup.Get;
    //                 Email2 := ExaminationSetup."Registration Sender Email";
    //                 //SMTP.Create('KASNEB STUDENT REGISTRATION', Email2, BulkProcessingHeader.Email,
    //                 'KASNEB STUDENT REGISTRATION',
    //                 'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
    //                 'Your registration request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //                 'Find attached the invoice.' + BulkProcessingHeader."Application Invoice" + '', true);
    //                 FileName := SalesInv."No." + '.pdf';
    //                 FileLocation := ExaminationSetup."Examination Path" + FileName;
    //                 ProcessingHeader.Reset;
    //                 ProcessingHeader.SetRange("No.", BulkProcessingHeader."No.");
    //                 if ProcessingHeader.FindFirst then begin
    //                     //Report.SaveAsPdf(85042, FileLocation, ProcessingHeader);
    //                     //SMTP.AddAttachment(FileLocation, FileName);
    //                 end;

    //                 //SMTP.AddBCC(Email2);
    //                 //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //                 //SMTP.AppendToBody('<BR><BR>KASNEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //                 // //SMTP.Send();

    //                 // BulkProcessingHeader."Application Invoice":=SalesInv."No.";
    //                 // BulkProcessingHeader.MODIFY;

    //             end;
    //             //ApplicationCReceipt(BulkProcessingHeader);
    //         end else
    //             Error(TXT001, SalesInv."No.");
    //     end;


    //     procedure ApplicationOnboardCustomer(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         salesheader: Page "Sales Invoice";
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         ReceiptHeader: Record "Receipts Header1";
    //         ReceiptLines: Record "Receipt Lines1";
    //         PaymentPost: Codeunit "Payments-Post";
    //         BOSAACC: Code[20];
    //         Amount: Decimal;
    //         FileDirectory: Text;
    //         FileName: Text;
    //         SMTPMailSet: Record "Email Account";
    //         Notification1: Codeunit "Email Message";
    //         objCustomer: Record Customer;
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         BulkProcessingLines: Record "Bulk Processing Lines";
    //         ExaminationSetup: Record "Examination Setup";
    //         AppNo: Code[30];
    //         TXT001: label 'Are you sure you want to create the Account';
    //         TXT002: label 'The student %1 has been created to the customer account %2';
    //         TXT003: label 'The student %1 already has an existing customer account %2';
    //         Cust: Record Customer;
    //         WorkType: Record "Work Type";
    //         DocumentLink: Record "Document Attachment";
    //         TXT004: label 'Kindly attach the mandatory documents required for this application';
    //     begin
    //         //check for an attachment
    //         if BulkProcessingHeader.Portal = true then begin
    //             DocumentLink.Reset;
    //             DocumentLink.SetRange("No.", BulkProcessingHeader."No.");
    //             if not DocumentLink.FindSet then
    //                 Error(TXT004);

    //         end;

    //         BulkProcessingHeader.TestField("Fee Type");
    //         ExaminationSetup.Get;
    //         AppNo := '';
    //         Cust.Reset;
    //         Cust.SetRange("ID. No.", BulkProcessingHeader."ID Number/Passport No.");
    //         if not Cust.FindSet then begin

    //             //create student account
    //             NoSeriesMgt.InitSeries(ExaminationSetup."Student Nos.", ExaminationSetup."Student Nos.", 0D, AppNo, ExaminationSetup."Student Nos.");

    //             Cust."No." := AppNo;
    //             Cust."Funding Class" := Cust."funding class"::Student;
    //             Cust."Customer Type" := Cust."customer type"::Student;
    //             Cust.Name := BulkProcessingHeader."First Name" + ' ' + BulkProcessingHeader."Middle Name" + ' ' + BulkProcessingHeader.Surname;
    //             Cust."First Name" := BulkProcessingHeader."First Name";
    //             Cust."Middle Name" := BulkProcessingHeader."Middle Name";
    //             Cust."Last Name" := BulkProcessingHeader.Surname;
    //             Cust.Address := BulkProcessingHeader.Address;
    //             Cust."Address 2" := BulkProcessingHeader."Address 2";
    //             Cust."Post Code" := BulkProcessingHeader."Post Code";
    //             Cust.Validate("Post Code");
    //             Cust."Currency Code" := BulkProcessingHeader."Currency Code";
    //             //get work type
    //             WorkType.Reset;
    //             WorkType.SetRange(Code, BulkProcessingHeader."Type Code");
    //             if WorkType.FindFirst then begin
    //                 Cust."Gen. Bus. Posting Group" := WorkType."Gen. Bus. Posting Group";
    //                 Cust."Customer Posting Group" := WorkType."Customer Posting Group";
    //             end;

    //             Cust."NCPWD No." := BulkProcessingHeader."NCPWD No.";
    //             Cust."ID. No." := BulkProcessingHeader."ID Number/Passport No.";
    //             Cust.County := BulkProcessingHeader.County;
    //             Cust."Phone No." := BulkProcessingHeader."Phone No.";
    //             Cust."E-Mail" := BulkProcessingHeader.Email;
    //             Cust.Image := BulkProcessingHeader.Image;
    //             Cust.Insert(true);

    //             Cust."Bill-to Customer No." := AppNo;
    //             Cust.Validate("Bill-to Customer No.");
    //             Cust.Modify(true);
    //             Commit;

    //             RegistrationStudent(BulkProcessingHeader);
    //             Commit;
    //             ApplicationCreateInvoice(BulkProcessingHeader);
    //             BulkProcessingHeader.Created := true;
    //             BulkProcessingHeader."Student No." := Cust."No.";
    //             BulkProcessingHeader."Student Name" := Cust.Name;
    //             BulkProcessingHeader.Modify(true);
    //         end else
    //             Error('The student with the number %1,already exists', Cust."ID. No.");

    //     end;

    //     procedure ApplicationAssignRegistrationNo(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         ExaminationAccount: Record "Examination Account";
    //         Courses: Record Courses;
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         ExamAccountNo: Code[30];
    //         NoSeries: Code[30];
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         TXT001: label 'The student account %1, has been created successfully';
    //         RegistrationAccount: Record "Examination Account";
    //         TXT002: label 'The student %1,has an existing registration with no %2 on the course %3';
    //         ExamSittingCycle: Record "Exam Sitting Cycle";
    //         RenewalDateVar: Date;
    //         RenewalDate: Date;
    //         RegistrationMonth: Integer;
    //         NextCycleMonth: Integer;
    //         RenewalDay: Integer;
    //         RenewalMonth: Integer;
    //         RenewalYear: Integer;
    //         RenewalDateValue: Text;
    //         ExaminationSetup: Record "Examination Setup";
    //     begin
    //         //check if student has existing registration no.
    //         ExaminationSetup.Get;
    //         RegistrationAccount.Reset;
    //         RegistrationAccount.SetRange("Student Cust No.", BulkProcessingHeader."Student No.");
    //         RegistrationAccount.SetRange("Course ID", BulkProcessingHeader."Examination ID");
    //         if not RegistrationAccount.FindSet then begin
    //             ExamAccountNo := '';
    //             Courses.Reset;
    //             Courses.SetRange(Code, BulkProcessingHeader."Examination ID");
    //             if Courses.FindFirst then begin
    //                 NoSeriesMgt.InitSeries(Courses."No. Series", Courses."No. Series", 0D, ExamAccountNo, Courses."No. Series");
    //                 ExaminationAccount.Init;
    //                 ExaminationAccount."Registration No." := ExamAccountNo;
    //                 ExaminationAccount."Student Cust No." := BulkProcessingHeader."Student No.";
    //                 ExaminationAccount.Validate("Student Cust No.");
    //                 ExaminationAccount."Course ID" := BulkProcessingHeader."Examination ID";
    //                 ExaminationAccount.Validate("Course ID");
    //                 ExaminationAccount.Email := BulkProcessingHeader.Email;
    //                 ExaminationAccount."Current Examination Sitting" := BulkProcessingHeader."Examination Sitting";
    //                 ExaminationAccount.Insert;
    //                 RegistrationMonth := Date2dwy(Today, 2);
    //                 if RegistrationMonth > 7 then begin
    //                     RenewalDate := CalcDate('+1y', Today);
    //                     RenewalDay := 1;
    //                     RenewalMonth := 7;
    //                     RenewalYear := Date2dwy(RenewalDate, 3);
    //                     RenewalDate := Dmy2date(RenewalDay, RenewalMonth, RenewalYear);
    //                 end else begin
    //                     RenewalDay := 1;
    //                     RenewalMonth := 7;
    //                     RenewalYear := Date2dwy(Today, 3);
    //                     RenewalDate := Dmy2date(RenewalDay, RenewalMonth, RenewalYear);
    //                 end;

    //                 ExamSittingCycle.Reset;
    //                 ExamSittingCycle.SetFilter("Exam Start Date", '>%1', Today);
    //                 ExamSittingCycle.SetRange("Sitting Status", ExamSittingCycle."sitting status"::Active);
    //                 if ExamSittingCycle.FindFirst then begin
    //                     RenewalDateValue := Format(RenewalDate, 0, '<Day,2>/<Month,2>/<Year4>');



    //                     // IF BulkProcessingHeader.Portal=TRUE THEN BEGIN
    //                     //SMTP.Create('KASNEB STUDENT REGISTRATION', Email2, BulkProcessingHeader.Email,
    //                     'KASNEB STUDENT REGISTRATION',
    //                     'Dear ' + BulkProcessingHeader."Student Name" + '<BR><BR>' +
    //                     'Congratulations on your succesfull registration  done on<b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b>.<BR><BR>' +
    //                     'Your registration number is:   <b>' + ExamAccountNo + '</b><BR>' +
    //                     'Your first eligible examination sitting is:   <b>' + ExamSittingCycle."Exam Sitting Cycle" + '</b><BR>' +
    //                     'Your first renewal is due on:   <b>' + RenewalDateValue + '</b><BR><BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>', true);
    //                     //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
    //                     //SMTP.Send();

    //                     // END;
    //                 end;

    //                 Message(TXT001, ExamAccountNo);
    //             end;
    //             if BulkProcessingHeader.Portal = true then begin
    //                 BulkProcessingHeader.Posted := true;
    //                 BulkProcessingHeader."Posted Date" := Today;
    //                 BulkProcessingHeader."Posted By" := UserId;
    //                 BulkProcessingHeader."Posted On" := CurrentDatetime;
    //                 BulkProcessingHeader.Modify(true);
    //             end
    //         end else
    //             Error(TXT002, RegistrationAccount."Student Cust No.", RegistrationAccount."Registration No.", RegistrationAccount."Course Description");
    //     end;

    //     procedure RecSendPDFRegistration(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         FileName: Text;
    //         FileLocation: Text;
    //         ReceiptsHeader1: Record "Student Processing Header";
    //         ExaminationAccount: Record "Examination Account";
    //         RegistrationNo: Code[30];
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";
    //         // //GET Assigned registration number
    //         // ExaminationAccount.RESET;
    //         // ExaminationAccount.SETRANGE("Student Cust No.",StudentProcessingHeader."Student No.");
    //         // IF ExaminationAccount.FINDFIRST THEN BEGIN
    //         //  RegistrationNo:=ExaminationAccount."Registration No.";
    //         // END;
    //         //SMTP.Create('KASNEB STUDENT REGISTRATION', Email2, StudentProcessingHeader.Email,
    //         'KASNEB STUDENT REGISTRATION',
    //         'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
    //         'Your registration payment done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +

    //         'Find attached the receipt:' + StudentProcessingHeader."Application Receipt" + '', true);
    //         //'Your assigned registration Number is:<BR/><b>'+RegistrationNo+'</b><BR>'+
    //         FileName := StudentProcessingHeader."Application Receipt" + '.pdf';
    //         FileLocation := ExaminationSetup."Examination Path" + FileName;
    //         ReceiptsHeader1.Reset;
    //         ReceiptsHeader1.SetRange("No.", StudentProcessingHeader."No.");
    //         if ReceiptsHeader1.FindFirst then begin
    //             //Report.SaveAsPdf(85049, FileLocation, ReceiptsHeader1);
    //         end;

    //         //SMTP.AddAttachment(FileLocation, FileName);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>KASNEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();
    //     end;

    //     procedure RecSendPDFRegistrationandReg(BulkProcessingHeader: Record "Bulk Processing Header")
    //     var
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         FileName: Text;
    //         FileLocation: Text;
    //         ReceiptsHeader1: Record "Receipts Header1";
    //         ExaminationAccount: Record "Examination Account";
    //         RegistrationNo: Code[30];
    //         BulkProcessingLines: Record "Bulk Processing Lines";
    //         StudentProcessingHeader: Record "Student Processing Header";
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";
    //         //send email to the institution
    //         //SMTP.Create('KASNEB STUDENT REGISTRATION', Email2, StudentProcessingHeader.Email,
    //         'KASNEB STUDENT REGISTRATION',
    //         'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
    //         'Your registration request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //         'Find attached the receipt:' + BulkProcessingHeader."Application Receipt" + '', true);

    //         FileName := BulkProcessingHeader."Application Receipt" + '.pdf';
    //         FileLocation := ExaminationSetup."Examination Path" + FileName;
    //         ReceiptsHeader1.Reset;
    //         ReceiptsHeader1.SetRange("Payment Reference", BulkProcessingHeader."No.");
    //         if ReceiptsHeader1.FindFirst then begin
    //             //Report.SaveAsPdf(56003, FileLocation, ReceiptsHeader1);
    //         end;
    //         ////SMTP.AddAttachment(FileLocation,FileName);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>KASNEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         ////SMTP.Send();
    //         //send email to individual students

    //         BulkProcessingLines.Reset;
    //         //BulkProcessingLines.SETRANGE("Bulk Header No.",BulkProcessingHeader."No.");
    //         BulkProcessingLines.SetRange(Passed, true);
    //         if BulkProcessingLines.FindSet then begin
    //             repeat
    //                 //generate registration no
    //                 RegistrationNo := BulkAssignRegistrationNo(BulkProcessingLines);

    //                 //send email to the student
    //                 if BulkProcessingLines.Email <> '' then begin
    //                     //SMTP.Create('KASNEB STUDENT REGISTRATION', Email2, BulkProcessingLines.Email,
    //                     'KASNEB STUDENT REGISTRATION',
    //                     'Dear ' + BulkProcessingLines."Student Name" + ',<BR><BR>' +
    //                     'Your registration request through<b> ' + BulkProcessingHeader."Institution Name" + '</b> has been processed.<BR>' +
    //                     'Your assigned registration Number is:<BR/><b>' + RegistrationNo + '</b><BR>', true);
    //                     //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //                     //SMTP.AppendToBody('The registration numbers have been shared to the student emails shared');
    //                     //SMTP.AppendToBody('<BR><BR>KASNEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //                     //SMTP.Send();
    //                 end;
    //             until BulkProcessingLines.Next = 0;
    //         end;
    //     end;

    //     procedure BookingCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         ResourcePrice: Record "Resource Price";
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Filename: Text;
    //         FileLocation: Text;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         EntryNo: Integer;
    //         SalesHeader: Record "Sales Header";
    //         ReceiptHeader1: Record "Receipts Header1";
    //         TXT001: label 'Invoice %1 sent succesfully';
    //         TXT002: label 'An invoice no %1 for this booking has already been processed';
    //         StudentLines: Record "Student Processing Lines";
    //         ExaminationAccount: Record "Examination Account";
    //         DocumentLink: Record "Document Attachment";
    //         TXT003: label 'Kindly attach the mandatory document for this application';
    //     begin
    //         if BulkProcessingHeader.Portal = true then begin
    //             DocumentLink.Reset;
    //             DocumentLink.SetRange("No.", BulkProcessingHeader."No.");
    //             if not DocumentLink.FindSet then begin
    //                 Error(TXT003);
    //             end
    //         end;
    //         SalesInv.Reset;
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if not SalesInv.FindFirst then begin

    //             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //             SalesInv."No." := '';
    //             SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //             SalesInv."Document Date" := Today;
    //             SalesInv."Order Date" := Today;
    //             SalesInv."Posting Date" := Today;
    //             SalesInv."External Document No." := BulkProcessingHeader."No.";
    //             SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
    //             SalesInv.Type := SalesInv.Type::Normal;
    //             SalesInv."Prepayment %" := 100;//enforce prepayment`
    //             SalesInv.Insert(true);
    //             BulkProcessingHeader.CalcFields("Booking Amount");
    //             //get resource entry
    //             ResourcePrice.Reset;
    //             ResourcePrice.SetRange(Code, BulkProcessingHeader."Fee Type");
    //             if ResourcePrice.FindSet then begin
    //                 SalesLine.Init;
    //                 SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //                 SalesLine."Document No." := SalesInv."No.";
    //                 SalesLine."No." := ResourcePrice.Code;
    //                 SalesLine.Type := SalesLine.Type::Resource;
    //                 SalesLine.Validate(SalesLine."No.");
    //                 SalesLine.Validate(SalesLine.Quantity, 1);
    //                 SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Booking Amount");
    //                 SalesLine.Insert(true);
    //             end;
    //             BulkProcessingHeader."Booking Invoice No." := SalesInv."No.";
    //             BulkProcessingHeader.Modify;
    //             //send email pro-forma
    //             /*ExaminationSetup.GET;
    //                 Email2:= ExaminationSetup."Registration Sender Email";
    //              //SMTP.Create('KASNEB STUDENT BOOKING',Email2,BulkProcessingHeader.Email,
    //              'KASNEB STUDENT BOOKING',
    //               'Dear '+BulkProcessingHeader."Student Name"+',<BR><BR>'+
    //               'Your registration request done on <b>'+' '+FORMAT(BulkProcessingHeader."Created On")+' '+'</b> has been processed.<BR>'+
    //               'Find attached the invoice for payment',TRUE);
    //               Filename:=SalesInv."No."+'.pdf';
    //               FileLocation:=ExaminationSetup."Examination Path"+Filename;
    //               SalesHeader.RESET;
    //               SalesHeader.SETRANGE("No.",SalesInv."No.");
    //               IF SalesHeader.FINDSET THEN BEGIN
    //               //Report.SaveAsPdf(1302,FileLocation, SalesHeader);
    //                 END;
    //               //SMTP.AddAttachment(FileLocation,Filename);
    //               //SMTP.AddBCC(Email2);
    //               //SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>For more details contact the following:<BR>');
    //               //SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>KASNEB STUDENT BOOKING<BR>');
    //               //SMTP.Send();*/
    //             Message(TXT001, SalesInv."No.");
    //             StudentLines.Reset;
    //             StudentLines.SetRange("Booking Header No.", BulkProcessingHeader."No.");
    //             if StudentLines.FindSet then begin
    //                 if StudentLines."Transaction Type" = StudentLines."transaction type"::Renewal then begin
    //                     ExaminationAccount.Reset;
    //                     ExaminationAccount.SetRange("Registration No.", BulkProcessingHeader."Student Reg. No.");
    //                     if ExaminationAccount.FindFirst then begin
    //                         //POST RENEWAL ENTRIES
    //                         ExaminationAccount."Renewal Amount" := 0;
    //                         ExaminationAccount."Renewal Pending" := 0;
    //                         ExaminationAccount.Modify(true);
    //                     end;
    //                 end;
    //                 if StudentLines."Transaction Type" = StudentLines."transaction type"::Reinstatement then begin
    //                     ExaminationAccount.Reset;
    //                     ExaminationAccount.SetRange("Registration No.", BulkProcessingHeader."Student Reg. No.");
    //                     if ExaminationAccount.FindFirst then begin
    //                         ExaminationAccount."Re-Activation Amount" := 0;
    //                         ExaminationAccount.Modify(true);
    //                     end;
    //                 end;
    //             end
    //         end else
    //             Error(TXT002, SalesInv."No.");

    //     end;

    //     procedure BookingCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record "Receipts Header1";
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "Receipt Lines1";
    //         NoSeries: Code[30];
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //         ResourcePrice: Record "Resource Price";
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Filename: Text;
    //         FileLocation: Text;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         EntryNo: Integer;
    //         SalesHeader: Record "Sales Header";
    //         ReceiptHeader1: Record "Receipts Header1";
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //     begin
    //         //code to post the created invoice
    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if SalesInv.Find('-') then begin
    //             SalesPostYesNo.Run(SalesInv);
    //             Message('Invoice %1 has been posted Successfully', SalesInv."No.");
    //             CashMngmntSetup.Get();
    //             NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
    //             ReceiptHeader.Init;
    //             ReceiptHeader."No." := NoSeries;
    //             ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code";

    //             if BulkProcessingHeader."Pay Mode" = '' then
    //                 ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode"
    //             else
    //                 ReceiptHeader."Pay Mode" := BulkProcessingHeader."Pay Mode";
    //             ReceiptHeader.Validate("Bank Code");
    //             ReceiptHeader."Received From" := BulkProcessingHeader."Student Name";
    //             ReceiptHeader."On Behalf Of" := BulkProcessingHeader."Student Name";
    //             ReceiptHeader."Posted Date" := Today;
    //             ReceiptHeader."Posting Date" := Today;
    //             ReceiptHeader.Date := Today;

    //             ReceiptHeader.Insert(true);
    //             ReceiptLines.Init;
    //             ReceiptLines."Receipt No." := ReceiptHeader."No.";
    //             ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //             ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Booking amount';
    //             ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
    //             ReceiptLines.Validate("Account No.");
    //             //get posted invoice number
    //             CustLedgerEntry.Reset;
    //             CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             CustLedgerEntry.SetRange(Amount, BulkProcessingHeader."Booking Amount");
    //             if CustLedgerEntry.FindFirst then begin
    //                 ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
    //                 ReceiptLines.Validate("Applies to Doc. No");
    //             end;
    //             ReceiptLines.Insert(true);
    //             Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
    //         end;
    //         BulkProcessingHeader."Booking Receipt No." := ReceiptHeader."No.";
    //         BulkProcessingHeader.Modify(true);
    //     end;

    //     procedure BookingSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         FileName: Text;
    //         FileLocation: Text;
    //         ReceiptHeader: Record "Receipts Header1";
    //         ExaminationAccount: Record "Examination Account";
    //         RegistrationNo: Code[30];
    //         ReceiptHeader1: Record "Student Processing Header";
    //         FileName1: Text;
    //         FileLocation1: Text;
    //         ProcessingHeader: Record "Student Processing Header";
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";

    //         //SMTP.Create('KASNEB:EXAMINATION BOOKING', Email2, StudentProcessingHeader.Email,
    //         'KASNEB:EXAMINATION BOOKING',
    //         'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
    //         'Your booking request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //         'Find attached the receipt and the  provisional timetable which you should check for an updated one <b>21 Days</b> before the examination. ', true);

    //         FileName := StudentProcessingHeader."Booking Invoice No." + '.pdf';
    //         FileLocation := ExaminationSetup."Examination Path" + FileName;

    //         ReceiptHeader1.Reset;
    //         ReceiptHeader1.SetRange("No.", StudentProcessingHeader."No.");
    //         if ReceiptHeader1.FindSet then begin
    //             //Report.SaveAsPdf(85047, FileLocation, ReceiptHeader1);
    //             //SMTP.AddAttachment(FileLocation, FileName);
    //         end;

    //         //Attach timetable
    //         FileName1 := StudentProcessingHeader."No." + '.pdf';
    //         FileLocation1 := ExaminationSetup."Examination Path" + FileName1;
    //         ProcessingHeader.Reset;
    //         ProcessingHeader.SetRange("No.", StudentProcessingHeader."No.");
    //         if ProcessingHeader.FindFirst then begin
    //             //Report.SaveAsPdf(85026, FileLocation1, ProcessingHeader);
    //             //SMTP.AddAttachment(FileLocation1, FileName1);
    //         end;


    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>EXAMINATION BOOKING<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();

    //         //send receipt
    //     end;

    //     procedure ExemptionSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         FileName: Text;
    //         FileLocation: Text;
    //         ReceiptHeader: Record "Receipts Header1";
    //         ExaminationAccount: Record "Examination Account";
    //         RegistrationNo: Code[30];
    //         ReceiptHeader1: Record "Receipts Header1";
    //         FileName1: Text;
    //         FileLocation1: Text;
    //         Header: Record "Student Processing Header";
    //     begin
    //         PostExemptionVoucher(StudentProcessingHeader);
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";

    //         //SMTP.Create('KASNEB STUDENT EXEMPTION', Email2, StudentProcessingHeader.Email,
    //         'KASNEB STUDENT EXEMPTION',
    //         'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
    //         'Your exemption request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //         'Find attached the receipt and exemption letter', true);

    //         FileName := StudentProcessingHeader."Exemption Invoice No." + '.pdf';
    //         FileLocation := ExaminationSetup."Examination Path" + FileName;
    //         FileName1 := StudentProcessingHeader."No." + '.pdf';
    //         FileLocation1 := ExaminationSetup."Examination Path" + FileName1;

    //         Header.Reset;
    //         Header.SetRange("No.", StudentProcessingHeader."No.");
    //         if Header.FindSet then begin
    //             //Report.SaveAsPdf(85048, FileLocation, Header);
    //             //SMTP.AddAttachment(FileLocation, FileName);
    //         end;

    //         Header.Reset;
    //         Header.SetRange("No.", StudentProcessingHeader."No.");
    //         if Header.FindFirst then begin
    //             //Report.SaveAsPdf(85022, FileLocation1, Header);
    //             //SMTP.AddAttachment(FileLocation1, FileName1);
    //         end;


    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>KASNEB STUDENT EXEMPTION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
    //         //SMTP.Send();

    //         //send receipt
    //     end;

    //     procedure CheckSlotAvailability(StudentProcessingHeader: Record "Student Processing Header") Available: Boolean
    //     var
    //         CenterBookingEntries: Record "Center Booking Entries";
    //         TimetablePlannerLines: Record "Timetable Planner Lines";
    //         "TotalNo.": Integer;
    //         "PlannedNo.": Integer;
    //         BookingLines: Record "Student Processing Lines";
    //         TimetableHeader: Record "Timetable Planner Header";
    //         SlotFree: Boolean;
    //         ExamCenter: Record "Examination Centres";
    //     begin
    //         //check if slots are available
    //         //loop through all planned timetable per center if more than planned
    //         SlotFree := false;
    //         BookingLines.Reset;
    //         BookingLines.SetRange("Booking Header No.", StudentProcessingHeader."No.");
    //         if BookingLines.FindSet then begin
    //             SlotFree := true;
    //             repeat
    //                 if SlotFree = true then begin
    //                     "TotalNo." := 0;
    //                     CenterBookingEntries.Reset;
    //                     CenterBookingEntries.SetRange("Exam Center Code", StudentProcessingHeader."Examination Center Code");
    //                     CenterBookingEntries.SetRange(Status, CenterBookingEntries.Status::Allocated);
    //                     CenterBookingEntries.SetRange("Subject Code", BookingLines.Paper);
    //                     if CenterBookingEntries.FindSet then begin
    //                         repeat
    //                             "TotalNo." := "TotalNo." + 1;
    //                         until CenterBookingEntries.Next = 0;
    //                     end;
    //                     //check planner for a center
    //                     ExamCenter.Reset;
    //                     ExamCenter.SetRange(Code, StudentProcessingHeader."Examination Center Code");
    //                     if ExamCenter.FindFirst then begin
    //                         "PlannedNo." := ExamCenter."Maximum Capacity Per Session";
    //                     end;

    //                     //    //check planner activity
    //                     //    TimetableHeader.RESET;
    //                     //    TimetableHeader.SETRANGE("Examination  Project Code",StudentProcessingHeader."Examination Project Code");
    //                     //    IF TimetableHeader.FINDFIRST THEN BEGIN
    //                     //      TimetablePlannerLines.RESET;
    //                     //      TimetablePlannerLines.SETRANGE(Code,TimetableHeader.Code);
    //                     //      TimetablePlannerLines.SETRANGE(Paper,BookingLines.Paper);
    //                     //      IF TimetablePlannerLines.FINDSET THEN BEGIN
    //                     //        "PlannedNo.":=TimetablePlannerLines."Planned Capacity";
    //                     //      END;
    //                     //    END;

    //                     if "TotalNo." < "PlannedNo." then
    //                         SlotFree := true
    //                     else
    //                         SlotFree := false;
    //                 end;
    //             //MESSAGE('%1-%2:::%3',"TotalNo.","PlannedNo.",SlotFree);
    //             until BookingLines.Next = 0;
    //             Available := SlotFree;
    //         end
    //     end;

    //     procedure CancelBookingEntries(CenterBookingHeader: Record "Student Processing Header")
    //     var
    //         CenterBookingLines: Record "Student Processing Lines";
    //         BookingEntries: Record "Center Booking Entries";
    //         EntryNo: Integer;
    //         CenterCourse: Record "Center Course Capacity";
    //         TXT001: label 'The examination sitting has to be selected';
    //         BookingEntries1: Record "Center Booking Entries";
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         ExamBookingEntries1: Record "Exam Booking Entries";
    //     begin
    //         //check if center offers that exam
    //         //check if student has any entries
    //         if CenterBookingHeader."Examination Sitting" <> '' then begin
    //             ExamBookingEntries1.Reset;
    //             ExamBookingEntries1.SetRange("Stud. Cust No.", CenterBookingHeader."Student No.");
    //             ExamBookingEntries1.SetRange("Student Reg No.", CenterBookingHeader."Student Reg. No.");
    //             ExamBookingEntries1.SetRange("Exam Sitting", CenterBookingHeader."Examination Sitting");
    //             if ExamBookingEntries1.FindSet then begin

    //                 repeat
    //                     ExamBookingEntries.Reset;
    //                     ExamBookingEntries.SetRange("Entry No.", ExamBookingEntries1."Entry No.");
    //                     if ExamBookingEntries.FindFirst then begin
    //                         ExamBookingEntries.Status := ExamBookingEntries.Status::Cancelled;
    //                         ExamBookingEntries.Modify(true);
    //                     end
    //                 until ExamBookingEntries1.Next = 0;

    //                 BookingEntries1.Reset;
    //                 BookingEntries1.SetRange("Student Reg No.", CenterBookingHeader."Student Reg. No.");
    //                 BookingEntries1.SetRange("Examination Sitting", CenterBookingHeader."Examination Sitting");
    //                 if BookingEntries1.FindSet then begin

    //                     repeat
    //                         BookingEntries.Reset;
    //                         BookingEntries.SetRange("Line No.", BookingEntries1."Line No.");
    //                         if BookingEntries.FindFirst then begin
    //                             BookingEntries.Status := BookingEntries.Status::Cancelled;
    //                             BookingEntries.Modify(true);
    //                         end

    //                     until BookingEntries1.Next = 0
    //                 end;
    //                 CenterBookingHeader.Cancelled := true;
    //                 CenterBookingHeader.Modify(true);
    //                 Message('Booking cancellation done');
    //             end;

    //         end else
    //             Error(TXT001);
    //     end;

    //     procedure PostCenterBookingAllocation(CenterBookingHeader: Record "Student Processing Header")
    //     var
    //         CenterBookingLines: Record "Student Processing Lines";
    //         BookingEntries: Record "Center Booking Entries";
    //         EntryNo: Integer;
    //         CenterCourse: Record "Center Course Capacity";
    //         TXT001: label 'The center %1,does not offer the examination %2';
    //         BookingEntries1: Record "Center Booking Entries";
    //     begin
    //         //check if center offers that exam
    //         //check if student has any entries
    //         BookingEntries1.Reset;
    //         BookingEntries1.SetRange("Student Reg No.", CenterBookingHeader."Student Reg. No.");
    //         BookingEntries1.SetRange("Examination Sitting", CenterBookingHeader."Examination Sitting");
    //         if BookingEntries1.FindSet then begin
    //             exit;
    //         end
    //         else begin
    //             CenterCourse.Reset;
    //             CenterCourse.SetRange("Centre Code", CenterBookingHeader."Examination Center Code");
    //             CenterCourse.SetRange("Course Id", CenterBookingHeader."Examination ID");
    //             if CenterCourse.FindFirst then begin
    //                 BookingEntries.Reset;
    //                 if BookingEntries.FindLast then begin
    //                     EntryNo := BookingEntries."Line No.";
    //                 end;
    //                 CenterBookingLines.Reset;
    //                 CenterBookingLines.SetRange("Booking Header No.", CenterBookingHeader."No.");
    //                 if CenterBookingLines.FindSet then begin
    //                     repeat
    //                         BookingEntries.Init;
    //                         BookingEntries."Line No." := EntryNo + 1;
    //                         BookingEntries.Status := BookingEntries.Status::Allocated;
    //                         BookingEntries."Header No." := CenterBookingHeader."No.";
    //                         BookingEntries."Exam Center Code" := CenterBookingHeader."Examination Center Code";
    //                         BookingEntries."Center Name" := CenterBookingHeader."Examination Center";
    //                         BookingEntries."Student Reg No." := CenterBookingHeader."Student Reg. No.";
    //                         BookingEntries."Student Name" := CenterBookingHeader."Student Name";
    //                         BookingEntries."Examination Id" := CenterBookingHeader."Examination ID";
    //                         BookingEntries."Subject Code" := CenterBookingLines.Paper;
    //                         BookingEntries.Validate("Subject Code");
    //                         BookingEntries.Year := CenterBookingLines.Year;
    //                         BookingEntries."Examination Description" := CenterBookingHeader."Examination Description";
    //                         BookingEntries."Examination Sitting" := CenterBookingHeader."Examination Sitting";
    //                         BookingEntries.Insert;
    //                         EntryNo += 1;
    //                     until CenterBookingLines.Next = 0;
    //                 end;
    //             end else
    //                 Error(TXT001, CenterBookingHeader."Examination Center", CenterBookingHeader."Examination ID");
    //         end
    //     end;

    //     procedure ExaminationSendResults(MarksheetHeader: Record "Marksheet Header")
    //     var
    //         ContactUsers: Record Contact;
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         ExaminationAccount: Record "Examination Account";
    //         MarksheetLines: Record "Exam Marksheet Lines";
    //         FileName: Text;
    //         FileLocation: Text;
    //         MarksheetLines1: Record "Exam Marksheet Lines";
    //         ExaminationResults: Record "Examination Results";
    //         TXT001: label 'The header %1,has no students to send results to';
    //     begin
    //         MarksheetLines.Reset;
    //         MarksheetLines.SetRange("Document No.", MarksheetHeader."Document No.");
    //         if MarksheetLines.FindSet then begin
    //             repeat
    //                 ExaminationAccount.Reset;
    //                 ExaminationAccount.SetRange("Registration No.", MarksheetLines."Student Reg No.");
    //                 if ExaminationAccount.FindFirst then begin
    //                     if ExaminationAccount.Email <> '' then begin
    //                         ExaminationSetup.Get;
    //                         Email2 := ExaminationSetup."Registration Sender Email";
    //                         //SMTP.Create('KASNEB EXAMINATION RESULTS', Email2, ExaminationAccount.Email,
    //                         'KASNEB EXAMINATION RESULTS',
    //                         'Dear ' + ' ' + ExaminationAccount."First Name" + '-' + ExaminationAccount."Registration No." + ',<BR><BR>' +
    //                         'Your results for the examination conducted from <b>' + ' ' + Format(MarksheetHeader."Examination Start Date") + ' ' + 'to' + '</b> <b>' + ' ' + Format(MarksheetHeader."Examination End Date") +
    //                         '' + 'have been processed.<BR>' + 'Find attached the result slip', true);
    //                         //SMTP.AddBCC(Email2);
    //                         //insert code to send results
    //                         FileName := ExaminationAccount."Student Cust No." + '.pdf';
    //                         FileLocation := ExaminationSetup."Examination Path" + FileName;

    //                         ExaminationResults.Reset;
    //                         ExaminationResults.SetRange("Student Reg No.", MarksheetLines."Student Reg No.");
    //                         if ExaminationResults.FindSet then begin
    //                             //Report.SaveAsPdf(85016, FileLocation, ExaminationResults);
    //                             //SMTP.AddAttachment(FileLocation, FileName);
    //                         end;
    //                         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //                         //SMTP.AppendToBody('<BR><BR>KASNEB EXAMINATION Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //                         //SMTP.Send();
    //                     end
    //                 end;


    //             until MarksheetLines.Next = 0;
    //             MarksheetHeader.Posted := true;
    //             MarksheetHeader."Posted By" := UserId;
    //             MarksheetHeader."Posted On" := CurrentDatetime;
    //             MarksheetHeader.Modify(true);
    //         end else
    //             Error(TXT001, MarksheetHeader."Document No.");


    //     end;

    //     procedure SuggestMarkingPapers(TimetablePlanner: Record "Center  Header")
    //     var
    //         Job: Record Job;
    //         PlannerLines: Record "Marking Lines";
    //         LineNo: Integer;
    //         Papers: Record Papers;
    //         JobTask: Record "Job Task";
    //         PlannerLines1: Record "Marking Lines";
    //         TXT001: label 'Papers for the Exams to be offered on %1,have been added';
    //     begin
    //         PlannerLines1.Reset;
    //         PlannerLines1.SetRange("Document No.", TimetablePlanner."Document No.");
    //         if PlannerLines1.FindSet then begin
    //             PlannerLines1.DeleteAll;
    //         end;
    //         //get job first
    //         PlannerLines1.Reset;
    //         if PlannerLines1.FindLast then begin
    //             LineNo := PlannerLines1."Line No.";
    //         end;
    //         Job.Reset;
    //         Job.SetRange("No.", TimetablePlanner."Project No.");
    //         if Job.FindFirst then begin
    //             JobTask.Reset;
    //             JobTask.SetRange("Job No.", Job."No.");
    //             if JobTask.FindSet then begin
    //                 repeat
    //                     Papers.Reset;
    //                     Papers.SetRange(Course, JobTask."Job Task No.");
    //                     if Papers.FindSet then begin
    //                         repeat
    //                             //get papers

    //                             PlannerLines."Line No." := LineNo + 1;
    //                             PlannerLines."Document No." := TimetablePlanner."Document No.";
    //                             PlannerLines.Examination := Papers.Course;
    //                             PlannerLines.Part := Papers.Level;
    //                             PlannerLines.Section := Papers.Section;
    //                             PlannerLines.Paper := Papers.Code;
    //                             PlannerLines.Validate(Paper);
    //                             PlannerLines.Insert;
    //                             LineNo += 1;
    //                         until Papers.Next = 0;

    //                     end;
    //                 until JobTask.Next = 0;
    //                 Message(TXT001, TimetablePlanner."Center Name");
    //             end;
    //         end
    //     end;

    //     procedure BulkAssignRegistrationNo(BulkProcessingHeader: Record "Bulk Processing Lines") RegNo: Code[30]
    //     var
    //         ExaminationAccount: Record "Examination Account";
    //         Courses: Record Courses;
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         ExamAccountNo: Code[30];
    //         NoSeries: Code[30];
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         TXT001: label 'The student account %1, has been created successfully';
    //     begin
    //         ExamAccountNo := '';
    //         Courses.Reset;
    //         Courses.SetRange(Code, BulkProcessingHeader."Course ID");
    //         if Courses.FindFirst then begin
    //             NoSeriesMgt.InitSeries(Courses."No. Series", Courses."No. Series", 0D, ExamAccountNo, Courses."No. Series");
    //             ExaminationAccount.Init;
    //             ExaminationAccount."Registration No." := ExamAccountNo;
    //             ExaminationAccount."Student Cust No." := BulkProcessingHeader."Student No.";
    //             ExaminationAccount.Validate("Student Cust No.");
    //             ExaminationAccount."Course ID" := BulkProcessingHeader."Course ID";
    //             ExaminationAccount."Course Description" := Courses.Description;
    //             ExaminationAccount.Email := BulkProcessingHeader.Email;
    //             ExaminationAccount."Current Examination Sitting" := BulkProcessingHeader."Examination Cyce";
    //             ExaminationAccount.Insert;
    //             RegNo := ExamAccountNo;
    //         end;

    //     end;


    //     procedure EffectCaseVerdict(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         CaseCategories: Record "Case Categories";
    //         Customer: Record Customer;
    //         ExaminationAccount: Record "Examination Account";
    //     begin
    //         CaseCategories.Reset;
    //         CaseCategories.SetRange(Code, StudentProcessingHeader."Case Code");
    //         if CaseCategories.FindFirst then begin
    //             //effect verdict
    //             if Format(CaseCategories."Block Period") <> '' then begin
    //                 Customer.Reset;
    //                 Customer.SetRange("No.", StudentProcessingHeader."Student No.");
    //                 if Customer.FindFirst then begin
    //                     Customer.Blocked := Customer.Blocked::All;
    //                     Customer."Blocked Start Date" := Today;
    //                     Customer."Blocked End Date" := CalcDate(CaseCategories."Block Period", Today);
    //                     Customer.Modify(true);

    //                 end;
    //                 ExaminationAccount.Reset;
    //                 ExaminationAccount.SetRange("Student Cust No.", StudentProcessingHeader."Student No.");
    //                 if ExaminationAccount.FindFirst then begin
    //                     ExaminationAccount."Blocked Start Date" := Today;
    //                     ExaminationAccount."Blocked End Date" := CalcDate(CaseCategories."Block Period", Today);
    //                     ExaminationAccount.Blocked := true;
    //                     ExaminationAccount.Modify(true);
    //                 end;
    //             end;
    //         end;
    //         StudentProcessingHeader.Posted := true;
    //         StudentProcessingHeader."Posted Date" := Today;
    //         StudentProcessingHeader."Posted By" := UserId;
    //         StudentProcessingHeader."Posted On" := CurrentDatetime;
    //         StudentProcessingHeader.Modify(true);
    //     end;

    //     procedure CaseSendVerdictEmail(StudentUser: Record "Student Processing Header")
    //     var
    //         ContactUsers: Record Contact;
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";
    //         //SMTP.Create('KASNEB STUDENT DISCIPLINARY', Email2, StudentUser.Email,
    //         'KASNEB STUDENT DISCIPLINARY',
    //         'Dear ' + StudentUser."Student Name" + ',<BR><BR>' +
    //         'The case referring to <b>' + ' ' + StudentUser."Case Description" + ' ' + 'created on' + ' ' + Format(StudentUser."Created On") + ' ' + '</b> has been decided on.<BR>' +
    //         'The verdict is:' + StudentUser."Verdict Description" + '', true);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>KASNEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();

    //     end;


    //     procedure EffectReinsVerdict(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         CaseCategories: Record "Case Categories";
    //         Customer: Record Customer;
    //         ExaminationAccount: Record "Examination Account";
    //     begin
    //         CaseCategories.Reset;
    //         CaseCategories.SetRange(Code, StudentProcessingHeader."Case Code");
    //         if CaseCategories.FindFirst then begin
    //             //effect verdict
    //             if Format(CaseCategories."Block Period") <> '' then begin
    //                 Customer.Reset;
    //                 Customer.SetRange("No.", StudentProcessingHeader."Student No.");
    //                 if Customer.FindFirst then begin
    //                     Customer.Blocked := Customer.Blocked::" ";
    //                     Customer.Modify(true);

    //                 end;
    //                 ExaminationAccount.Reset;
    //                 ExaminationAccount.SetRange("Student Cust No.", StudentProcessingHeader."Student No.");
    //                 if ExaminationAccount.FindFirst then begin
    //                     ExaminationAccount.Blocked := false;
    //                     ExaminationAccount.Modify(true);
    //                 end;
    //             end;
    //         end;
    //         StudentProcessingHeader."Case Status" := StudentProcessingHeader."case status"::Closed;
    //         StudentProcessingHeader.Posted := true;
    //         StudentProcessingHeader."Posted Date" := Today;
    //         StudentProcessingHeader."Posted By" := UserId;
    //         StudentProcessingHeader."Posted On" := CurrentDatetime;
    //         StudentProcessingHeader.Modify(true);
    //     end;

    //     procedure SuggestHighestScorers(TimetablePlanner: Record "Marksheet Header")
    //     var
    //         Job: Record Job;
    //         PlannerLines: Record "Marksheet Detailed Lines";
    //         LineNo: Integer;
    //         Papers: Record Papers;
    //         JobTask: Record "Job Task";
    //         PlannerLines1: Record "Marksheet Detailed Lines";
    //         TXT001: label 'Top Scorers fro the cycle  %1,have been added';
    //         ExaminationResults: Record "Examination Results";
    //         Results: Record "Examination Results";
    //     begin
    //         PlannerLines1.Reset;
    //         PlannerLines1.SetRange("Document No.", TimetablePlanner."Document No.");
    //         if PlannerLines1.FindSet then begin
    //             PlannerLines1.DeleteAll;
    //         end;
    //         //get job first
    //         PlannerLines1.Reset;
    //         if PlannerLines1.FindLast then begin
    //             LineNo := PlannerLines1."Line No.";
    //         end;
    //         Job.Reset;
    //         Job.SetRange("No.", TimetablePlanner."Examination Project ID");
    //         if Job.FindFirst then begin
    //             JobTask.Reset;
    //             JobTask.SetRange("Job No.", Job."No.");
    //             if JobTask.FindSet then begin
    //                 repeat
    //                     Papers.Reset;
    //                     Papers.SetRange(Course, JobTask."Job Task No.");
    //                     if Papers.FindSet then begin
    //                         repeat
    //                             //get paper highest scorer

    //                             PlannerLines."Line No." := LineNo + 1;
    //                             PlannerLines."Student Reg No." := CalculateHighestScore(Papers.Code);
    //                             //get the results
    //                             Results.Reset;
    //                             Results.SetRange("Student Reg No.", PlannerLines."Student Reg No.");
    //                             Results.SetRange(Paper, Papers.Code);
    //                             if Results.FindFirst then begin
    //                                 PlannerLines.Validate("Student Reg No.");
    //                                 PlannerLines."Document No." := TimetablePlanner."Document No.";
    //                                 PlannerLines.Examination := Papers.Course;
    //                                 PlannerLines.Part := Papers.Level;
    //                                 PlannerLines."Examination Sitting ID" := TimetablePlanner."Examination Sitting ID";
    //                                 PlannerLines.Section := Papers.Section;
    //                                 PlannerLines.Mark := Results.Mark;
    //                                 PlannerLines.Validate(Mark);
    //                                 PlannerLines.Paper := Papers.Code;
    //                                 PlannerLines.Validate(Paper);
    //                                 PlannerLines.Insert;
    //                                 LineNo += 1;
    //                             end;



    //                         until Papers.Next = 0;

    //                     end;
    //                 until JobTask.Next = 0;
    //                 Message(TXT001, TimetablePlanner."Examination Sitting ID");
    //             end;
    //         end
    //     end;

    //     local procedure CalculateHighestScore(PaperCode: Code[30]) StudentNo: Code[30]
    //     var
    //         PaperResults: Record "Examination Results";
    //         ExaminationResults: Record "Examination Results";
    //     begin
    //         ExaminationResults.Reset;
    //         ExaminationResults.SetCurrentkey(Mark);
    //         ExaminationResults.SetAscending(Mark, false);
    //         ExaminationResults.SetRange(Paper, PaperCode);
    //         if ExaminationResults.FindFirst then begin
    //             PaperResults.Reset;
    //             PaperResults.SetRange(Paper, ExaminationResults.Paper);
    //             if PaperResults.FindSet then begin
    //                 repeat
    //                     if PaperResults.Mark > ExaminationResults.Mark then
    //                         StudentNo := PaperResults."Student Reg No."
    //                     else
    //                         StudentNo := ExaminationResults."Student Reg No.";

    //                 until PaperResults.Next = 0;

    //             end;
    //         end
    //     end;

    //     procedure CertificateSendEmail(StudentUser: Record "Student Processing Header")
    //     var
    //         ContactUsers: Record Contact;
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";
    //         //SMTP.Create('KASNEB-CERTIFICATE', Email2, StudentUser.Email,
    //         'KASNEB-CERTIFICATE',
    //         'Dear ' + StudentUser."Student Name" + ',<BR><BR>' +
    //         'This is to notify you that you collected your certificate relating to <b>' + ' ' + StudentUser."Examination Description" + ' ' + 'on' +
    //         ' ' + Format(StudentUser."Collection Date") + ' ' + '</b> .<BR>Certificate No:' +
    //         ' ' + StudentUser."Certificate No." + ' ' + 'Issued By' + ' ' + StudentUser."Issued By Officer Name", true);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AddCC(StudentUser."Collected By Email");
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>KASNEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();

    //     end;


    //     procedure CloseExaminationAccount(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         CaseCategories: Record "Case Categories";
    //         Customer: Record Customer;
    //         ExaminationAccount: Record "Certificate Entry";
    //     begin
    //         ExaminationAccount.Init;
    //         ExaminationAccount."Student Reg No." := StudentProcessingHeader."Student Reg. No.";
    //         ExaminationAccount.Validate("Student Reg No.");
    //         ExaminationAccount."Exam Sitting ID" := StudentProcessingHeader."Examination Sitting";
    //         ExaminationAccount."Exam Center" := StudentProcessingHeader."Examination Center Code";
    //         ExaminationAccount.Type := StudentProcessingHeader."Certificate Type";
    //         ExaminationAccount."Collected By Email" := StudentProcessingHeader."Collected By Email";
    //         ExaminationAccount."Collected By ID Number" := StudentProcessingHeader."Collected By ID No.";
    //         ExaminationAccount."Collected By Name" := StudentProcessingHeader."Collected By Name";
    //         ExaminationAccount."Collection Date" := StudentProcessingHeader."Collection Date";
    //         ExaminationAccount."Issued  By" := StudentProcessingHeader."Issued By Officer";
    //         ExaminationAccount."Issued Date" := Today;
    //         ExaminationAccount."Issued Time" := Time;

    //         ExaminationAccount.Insert(true);

    //         StudentProcessingHeader.Posted := true;
    //         StudentProcessingHeader."Posted Date" := Today;
    //         StudentProcessingHeader."Posted By" := UserId;
    //         StudentProcessingHeader."Posted On" := CurrentDatetime;
    //         StudentProcessingHeader.Modify(true);
    //     end;

    //     procedure RemarkingSendRegretEmail(StudentUser: Record "Student Processing Header")
    //     var
    //         ContactUsers: Record Contact;
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";
    //         //SMTP.Create('KASNEB REMARKING', Email2, StudentUser.Email,
    //         'KASNEB REMARKING',
    //          'Dear ' + StudentUser."Student Name" + ',<BR><BR>' +
    //          'Your remarking request done on <b>' + ' ' + Format(StudentUser."Created On") + ' ' + '</b> relating to the examination' + ' ' + StudentUser."Examination Description" + ' ' + 'has been rejected.<BR>' +
    //          'The following are/is the reason for rejection.' + StudentUser."Reason for Rejection" + '', true);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>KASNEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();

    //     end;

    //     procedure RemarkCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         TXT004: label 'The invoice %1,has been sent to the student succesfuly';
    //         ExaminationSetup: Record "Examination Setup";
    //         AppNo: Code[30];
    //         Cust: Record Customer;
    //         Contact: Record Contact;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         CashMngmntSetup: Record "Cash Management  Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         NoSeries: Code[30];
    //         ExamFee: Record Resource;
    //         ExamFeeCost: Record "Resource Cost";
    //         Amount: Decimal;
    //         WorkType: Record "Work Type";
    //         Existing: Boolean;
    //         ExamAccountNo: Code[30];
    //         ResourcePrice: Record "Resource Price";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         Filelocation: Text;
    //         Filename: Text;
    //         LineNo: Integer;
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         Examination: Codeunit Examination;
    //         TXT001: label 'The invoice %1,has been created succesfully';
    //         SalesHeader: Record "Sales Header";
    //         TXT002: label 'An invoice %1 already exists for the application %2';
    //     begin
    //         SalesInv.Reset;
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if not SalesInv.FindFirst then begin
    //             SalesInv.Init;
    //             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //             SalesInv."No." := '';
    //             SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //             SalesInv."Document Date" := Today;
    //             SalesInv."Order Date" := Today;
    //             SalesInv."Posting Date" := Today;
    //             SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
    //             SalesInv."External Document No." := BulkProcessingHeader."No.";
    //             SalesInv.Type := SalesInv.Type::Normal;
    //             SalesInv."Prepayment %" := 100;//enforce prepayment`
    //             SalesInv.Insert(true);
    //             //get resource entry
    //             ExamFee.Reset;
    //             ExamFee.SetRange("No.", BulkProcessingHeader."Type Code");
    //             if ExamFee.FindSet then begin
    //                 SalesLine.Init;
    //                 SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //                 SalesLine."Document No." := SalesInv."No.";
    //                 SalesLine.Type := SalesLine.Type::Resource;
    //                 SalesLine."No." := ResourcePrice.Code;
    //                 SalesLine.Validate("No.");
    //                 SalesLine.Quantity := 1;
    //                 BulkProcessingHeader.CalcFields("Remark Amount");
    //                 SalesLine."Unit Price" := BulkProcessingHeader."Remark Amount";
    //                 SalesLine.Validate("Unit Price");
    //                 SalesLine.Validate(Quantity);
    //                 SalesLine.Insert(true);
    //             end;

    //             Message(TXT001, SalesInv."No.");
    //         end;
    //         RemarkCreatReceipt(BulkProcessingHeader);
    //     end;

    //     procedure RemarkCreatReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record "Receipts Header1";
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "Receipt Lines1";
    //         ExaminationSetup: Record "Examination Setup";
    //         AppNo: Code[30];
    //         Cust: Record Customer;
    //         Contact: Record Contact;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         NoSeries: Code[30];
    //         ExamFee: Record Resource;
    //         ExamFeeCost: Record "Resource Cost";
    //         Amount: Decimal;
    //         WorkType: Record "Work Type";
    //         Existing: Boolean;
    //         ExamAccountNo: Code[30];
    //         ResourcePrice: Record "Resource Price";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         Filelocation: Text;
    //         Filename: Text;
    //         LineNo: Integer;
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         Examination: Codeunit Examination;
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //     begin
    //         //code to post the created invoice
    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if SalesInv.Find('-') then begin
    //             SalesPostYesNo.Run(SalesInv);
    //             Message('Invoice %1 has been posted Successfully', SalesInv."No.");
    //             CashMngmntSetup.Get();
    //             NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
    //             ReceiptHeader.Init;
    //             ReceiptHeader."No." := NoSeries;
    //             ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
    //             ReceiptHeader.Insert(true);
    //             ReceiptLines.Init;
    //             ReceiptLines."Receipt No." := ReceiptHeader."No.";
    //             ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //             ReceiptLines."Applies to Doc. No" := SalesInv."No.";
    //             ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
    //             ReceiptLines.Validate("Account No.");
    //             //get posted invoice number
    //             CustLedgerEntry.Reset;
    //             CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
    //             CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             if CustLedgerEntry.FindFirst then begin
    //                 ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
    //                 ReceiptLines.Validate("Applies to Doc. No");
    //             end;
    //             ReceiptLines.Insert(true);
    //             Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
    //         end;
    //         BulkProcessingHeader."Exemption Receipt 6No." := ReceiptHeader."No.";
    //         BulkProcessingHeader.Modify;
    //     end;

    //     procedure DefferalCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         FileName: Text;
    //         FileLocation: Text;
    //         SalesHeader: Record "Sales Header";
    //         TXT001: label 'A sales invoice no %1,has already been processed for this application';
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         ExamSittingCycle: Record "Exam Sitting Cycle";
    //         ExamBookingEntries1: Record "Exam Booking Entries";
    //         EntryNo: Integer;
    //     begin
    //         SalesInv.Reset;
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if not SalesInv.FindFirst then begin
    //             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //             SalesInv."No." := '';
    //             SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //             SalesInv."Document Date" := Today;
    //             SalesInv."Order Date" := Today;
    //             SalesInv."Posting Date" := Today;
    //             SalesInv."External Document No." := BulkProcessingHeader."No.";
    //             SalesInv.Type := SalesInv.Type::Normal;
    //             SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
    //             SalesInv."Prepayment %" := 100;//enforce prepayment`
    //             SalesInv.Insert(true);
    //             SalesLine.Init;
    //             SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //             SalesLine."Document No." := SalesInv."No.";
    //             SalesLine.Type := SalesLine.Type::Resource;
    //             SalesLine."No." := BulkProcessingHeader."Fee Type";
    //             SalesLine.Validate("No.");
    //             SalesLine.Quantity := 1;
    //             SalesLine.Validate(Quantity);
    //             SalesLine."Unit Price" := BulkProcessingHeader."Administrative Fees";
    //             SalesLine.Validate("Unit Price");
    //             SalesLine.Insert(true);
    //             BulkProcessingHeader."Application Invoice" := SalesInv."No.";
    //             BulkProcessingHeader.Modify;
    //             DefferalCReceipt(BulkProcessingHeader);
    //             //mark entries as deffered for next period
    //             ExamBookingEntries.Reset;
    //             ExamBookingEntries.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
    //             ExamBookingEntries.SetRange("Exam Sitting", BulkProcessingHeader."Examination Sitting");
    //             ExamBookingEntries.SetRange(Status, ExamBookingEntries.Status::Open);
    //             if ExamBookingEntries.FindSet then begin
    //                 EntryNo := ExamBookingEntries."Entry No." + 100;
    //                 repeat

    //                     //get next cycle
    //                     ExamSittingCycle.Reset;
    //                     ExamSittingCycle.SetRange(Closed, false);
    //                     ExamSittingCycle.SetRange("Sitting Status", ExamSittingCycle."sitting status"::Upcoming);
    //                     if ExamSittingCycle.FindFirst then begin
    //                         if ExamSittingCycle."Exam Sitting Cycle" <> BulkProcessingHeader."Examination Sitting" then
    //                             ExamBookingEntries1.Init;
    //                         ExamBookingEntries1.TransferFields(ExamBookingEntries);
    //                         ExamBookingEntries1."Entry No." := EntryNo + 1;
    //                         ExamBookingEntries1."Exam Sitting" := ExamSittingCycle."Exam Sitting Cycle";

    //                         ExamBookingEntries1.Insert(true);
    //                         ExamBookingEntries.Status := ExamBookingEntries.Status::Defered;
    //                         ExamBookingEntries.Modify(true);
    //                     end;
    //                     EntryNo += 1;
    //                 until ExamBookingEntries.Next = 0;
    //             end;
    //             BulkProcessingHeader.Posted := true;
    //             BulkProcessingHeader."Posted Date" := Today;
    //             BulkProcessingHeader."Posted By" := UserId;
    //             BulkProcessingHeader."Posted On" := CurrentDatetime;
    //             BulkProcessingHeader.Modify(true);
    //         end else
    //             Error(TXT001, SalesInv."No.");
    //     end;

    //     procedure DefferalCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record "Receipts Header1";
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "Receipt Lines1";
    //         NoSeries: Code[30];
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //         TXT001: label 'There is no unposted invoice for the application %1';
    //     begin
    //         //code to post the created invoice
    //         CashMngmntSetup.Get();
    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if SalesInv.FindFirst then begin
    //             SalesPostYesNo.Run(SalesInv);
    //             Message('Invoice %1 has been posted Successfully', SalesInv."No.");

    //             NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
    //             ReceiptHeader.Init;
    //             ReceiptHeader."No." := NoSeries;
    //             ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
    //             ReceiptHeader.Insert(true);
    //             ReceiptLines.Init;
    //             ReceiptLines."Receipt No." := ReceiptHeader."No.";
    //             ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //             ReceiptLines.Description := BulkProcessingHeader."Student Name" + '- Defferal fees';
    //             ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
    //             ReceiptLines.Validate("Account No.");
    //             //get posted invoice number
    //             CustLedgerEntry.Reset;
    //             CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
    //             CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             if CustLedgerEntry.FindFirst then begin
    //                 ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
    //                 ReceiptLines.Validate("Applies to Doc. No");
    //             end;

    //             ReceiptLines.Insert(true);
    //             ApplicationAssignRegistrationNo(BulkProcessingHeader);
    //             //code to assing a unique registration No.]
    //             BulkProcessingHeader."Application Receipt" := ReceiptHeader."No.";
    //             ReceiptHeader.CalcFields(Amount);
    //             BulkProcessingHeader."Application Amount" := ReceiptHeader.Amount;
    //             BulkProcessingHeader.Modify;
    //             //open the receipt card
    //             Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
    //         end else
    //             Error(TXT001, BulkProcessingHeader."No.");

    //         //send email receipt
    //     end;

    //     procedure WithdrawalCreateVoucher(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record Payments;
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "PV Lines";
    //         ExaminationSetup: Record "Examination Setup";
    //         AppNo: Code[30];
    //         Cust: Record Customer;
    //         Contact: Record Contact;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         NoSeries: Code[30];
    //         ExamFee: Record Resource;
    //         ExamFeeCost: Record "Resource Cost";
    //         Amount: Decimal;
    //         WorkType: Record "Work Type";
    //         Existing: Boolean;
    //         ExamAccountNo: Code[30];
    //         ResourcePrice: Record "Resource Price";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         Filelocation: Text;
    //         Filename: Text;
    //         LineNo: Integer;
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         Examination: Codeunit Examination;
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //     begin
    //         CashMngmntSetup.Get();
    //         NoSeriesMgt.InitSeries(CashMngmntSetup."PV Nos", CashMngmntSetup."PV Nos", 0D, NoSeries, CashMngmntSetup."PV Nos");
    //         ReceiptHeader.Init;
    //         ReceiptHeader."No." := NoSeries;
    //         ReceiptHeader.Date := Today;
    //         ReceiptHeader."Payment Narration" := Format(BulkProcessingHeader."Document Type") + ' ' + BulkProcessingHeader."Student Name";
    //         ReceiptHeader.Payee := BulkProcessingHeader."Student Name";
    //         ReceiptHeader.Insert(true);
    //         ReceiptLines.Init;
    //         ReceiptLines.No := ReceiptHeader."No.";
    //         ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //         ReceiptLines."Account No" := BulkProcessingHeader."Student No.";
    //         ReceiptLines.Validate("Account No");
    //         ReceiptLines.Amount := BulkProcessingHeader."Withdrawal Refund Amount";
    //         ReceiptLines.Validate(Amount);
    //         ReceiptLines.Insert(true);
    //         Page.Run(57001, ReceiptHeader, ReceiptHeader."No.");
    //         BulkProcessingHeader."Payment Created" := true;
    //         BulkProcessingHeader.Modify(true);
    //     end;

    //     procedure SendTimetableEmail(TimetablePlanner: Record "Timetable Planner Header")
    //     var
    //         ContactUsers: Record Contact;
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         StudentUser: Record "Examination Account";
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";
    //         StudentUser.Reset;
    //         StudentUser.SetRange(Blocked, false);
    //         if StudentUser.FindSet then begin
    //             repeat
    //                 if StudentUser.Email <> '' then
    //                     //SMTP.Create('KASNEB EXAMINATION TIMETABLE', Email2, StudentUser.Email,
    //                     'KASNEB EXAMINATION TIMETABLE',
    //                     'Dear ' + StudentUser."First Name" + '-' + StudentUser."Registration No." + ',<BR><BR>' +
    //                     'The timetable for the examination cycle' + ' ' + TimetablePlanner."Exam Sitting ID" + ' ' + 'is ready.<BR>' +
    //                     'Find the timetable attached', true);


    //             //SMTP.AddBCC(Email2);
    //             //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //             //SMTP.AppendToBody('<BR><BR>KASNEB EXAMINATION Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //             //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
    //             //SMTP.Send();

    //             until StudentUser.Next = 0
    //         end;


    //     end;

    //     procedure RenewalCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         ResourcePrice: Record "Resource Price";
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Filename: Text;
    //         FileLocation: Text;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         EntryNo: Integer;
    //         SalesHeader: Record "Sales Header";
    //         ReceiptHeader1: Record "Receipts Header1";
    //         TXT001: label 'Invoice %1 sent succesfully';
    //         TXT002: label 'An invoice no %1 for this renewal has already been processed';
    //         ExaminationAccount: Record "Examination Account";
    //         StudentProcessingLines: Record "Student Processing Lines";
    //         Resource: Record Resource;
    //         RenewalAmount: Decimal;
    //         Header: Record "Student Processing Header";
    //     begin
    //         SalesInv.Reset;
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if not SalesInv.FindFirst then begin

    //             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //             SalesInv."No." := '';
    //             SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //             SalesInv."Document Date" := Today;
    //             SalesInv."Order Date" := Today;
    //             SalesInv."Posting Date" := Today;
    //             SalesInv."External Document No." := BulkProcessingHeader."No.";
    //             SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
    //             SalesInv.Type := SalesInv.Type::Normal;
    //             SalesInv."Prepayment %" := 100;//enforce prepayment`
    //             SalesInv.Insert(true);

    //             //insert lines based on lines
    //             ExaminationSetup.Get;
    //             StudentProcessingLines.Reset;
    //             StudentProcessingLines.SetRange("Booking Header No.", BulkProcessingHeader."No.");
    //             if StudentProcessingLines.FindSet then begin
    //                 repeat
    //                     SalesLine.Init;
    //                     SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //                     SalesLine."Document No." := SalesInv."No.";
    //                     Resource.Reset;
    //                     Resource.SetRange("Course ID", StudentProcessingLines."Course Id");
    //                     if Resource.FindSet then begin
    //                         repeat
    //                             ResourcePrice.Reset;
    //                             ResourcePrice.SetRange("Document Type", ResourcePrice."document type"::Renewal);
    //                             ResourcePrice.SetRange("Currency Code", StudentProcessingLines."Currency Code");
    //                             ResourcePrice.SetRange(Code, Resource."No.");
    //                             if ResourcePrice.FindFirst then begin//get the price
    //                                 RenewalAmount := ResourcePrice."Unit Price";
    //                                 SalesLine.Type := SalesLine.Type::Resource;
    //                                 SalesLine."No." := Resource."No.";
    //                                 SalesLine.Validate(SalesLine."No.");
    //                                 SalesLine.Validate(SalesLine.Quantity, 1);
    //                                 SalesLine.Validate(SalesLine."Unit Price", RenewalAmount);
    //                                 SalesLine.Insert(true);
    //                             end;
    //                         until Resource.Next = 0;
    //                     end;

    //                 //get resource based on course and level



    //                 until StudentProcessingLines.Next = 0;
    //             end;


    //             BulkProcessingHeader."Renewal Invoice No." := SalesInv."No.";
    //             BulkProcessingHeader.Modify;
    //             //send email pro-forma
    //             ExaminationSetup.Get;
    //             Email2 := ExaminationSetup."Registration Sender Email";
    //             //SMTP.Create('KASNEB STUDENT RENEWAL', Email2, BulkProcessingHeader.Email,
    //             'KASNEB STUDENT REENWAL',
    //              'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
    //              'Your renewal request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //              'Find attached the invoice for payment', true);
    //             Filename := SalesInv."No." + '.pdf';
    //             FileLocation := ExaminationSetup."Examination Path" + Filename;
    //             Header.Reset;
    //             Header.SetRange("No.", BulkProcessingHeader."No.");
    //             if Header.FindSet then begin
    //                 //Report.SaveAsPdf(85051, FileLocation, Header);
    //             end;
    //             //SMTP.AddAttachment(FileLocation, Filename);
    //             //SMTP.AddBCC(Email2);
    //             //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //             //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>KASNEB STUDENT RENEWAL<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //             //SMTP.Send();
    //             Message(TXT001, SalesInv."No.");
    //             //reduce the renewals to 0


    //         end
    //         else
    //             Error(TXT002, SalesInv."No.")
    //     end;

    //     procedure RenewalCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record "Receipts Header1";
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "Receipt Lines1";
    //         NoSeries: Code[30];
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //         ResourcePrice: Record "Resource Price";
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Filename: Text;
    //         FileLocation: Text;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         EntryNo: Integer;
    //         SalesHeader: Record "Sales Header";
    //         ReceiptHeader1: Record "Receipts Header1";
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         ExaminationAccount: Record "Examination Account";
    //         StudentProcessingLines: Record "Student Processing Lines";
    //         PaymentsPost: Codeunit "Payments-Post";
    //         RenewalAmount: Decimal;
    //         TotalRenewal: Integer;
    //         RemainingAmount: Decimal;
    //     begin
    //         //code to post the created invoice
    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if SalesInv.Find('-') then begin
    //             SalesPostYesNo.Run(SalesInv);
    //             Message('Invoice %1 has been posted Successfully', SalesInv."No.");
    //         end;
    //         ReceiptHeader1.Reset;
    //         ReceiptHeader1.SetRange("Cheque No", BulkProcessingHeader."No.");
    //         ReceiptHeader1.SetRange(Posted, false);
    //         if ReceiptHeader1.FindFirst then begin
    //             StudentManagement.PostReceipt(ReceiptHeader1);
    //         end else begin
    //             CashMngmntSetup.Get();
    //             NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
    //             ReceiptHeader.Init;
    //             ReceiptHeader."No." := NoSeries;
    //             ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
    //             if BulkProcessingHeader."Pay Mode" = '' then
    //                 ReceiptHeader."Pay Mode" := ExaminationSetup."Default Payment Mode" else
    //                 ReceiptHeader."Pay Mode" := BulkProcessingHeader."Pay Mode";
    //             if BulkProcessingHeader."Bank Code" = '' then
    //                 ReceiptHeader."Bank Code" := ExaminationSetup."Payments Bank Code" else
    //                 ReceiptHeader."Bank Code" := BulkProcessingHeader."Bank Code";
    //             ReceiptHeader.Validate("Bank Code");
    //             ReceiptHeader."Received From" := BulkProcessingHeader."Student Name";
    //             ReceiptHeader."On Behalf Of" := BulkProcessingHeader."Student Name";
    //             ReceiptHeader."Posted Date" := Today;
    //             ReceiptHeader."Posting Date" := Today;
    //             ReceiptHeader.Insert(true);
    //             ReceiptLines.Init;
    //             ReceiptLines."Receipt No." := ReceiptHeader."No.";
    //             ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //             ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Renewal amount';
    //             ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
    //             ReceiptLines.Validate("Account No.");
    //             //get posted invoice number
    //             CustLedgerEntry.Reset;
    //             CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
    //             CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             if CustLedgerEntry.FindFirst then begin
    //                 ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
    //                 ReceiptLines.Validate("Applies to Doc. No");
    //             end;
    //             ReceiptLines.Insert(true);
    //             PaymentsPost.PostReceipt(ReceiptHeader);
    //         end;
    //         RenewalUpdateDetails(BulkProcessingHeader);


    //         BulkProcessingHeader."Renewal Receipt No." := ReceiptHeader."No.";
    //         BulkProcessingHeader.Posted := true;
    //         BulkProcessingHeader."Posted By" := UserId;
    //         BulkProcessingHeader."Posted Date" := Today;
    //         BulkProcessingHeader."Posted On" := CurrentDatetime;
    //         BulkProcessingHeader.Modify(true);
    //         RenewalSendReceipt(BulkProcessingHeader);
    //     end;

    //     procedure RenewalSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         FileName: Text;
    //         FileLocation: Text;
    //         ReceiptHeader: Record "Receipts Header1";
    //         ExaminationAccount: Record "Examination Account";
    //         RegistrationNo: Code[30];
    //         ReceiptHeader1: Record "Student Processing Header";
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";

    //         //SMTP.Create('KASNEB:RENEWAL', Email2, StudentProcessingHeader.Email,
    //         'KASNEB STUDENT RENEWAL',
    //         'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
    //         'Your renewal request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //         'Find attached the receipt', true);
    //         FileName := ReceiptHeader."No." + '.pdf';
    //         FileLocation := ExaminationSetup."Examination Path" + FileName;
    //         ReceiptHeader1.Reset;
    //         ReceiptHeader1.SetRange("No.", StudentProcessingHeader."No.");
    //         if ReceiptHeader1.FindSet then begin
    //             //Report.SaveAsPdf(85050, FileLocation, ReceiptHeader1);
    //         end;
    //         //SMTP.AddAttachment(FileLocation, FileName);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>EXAMINATION RENEWAL.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();

    //         //send receipt
    //     end;


    //     procedure RenewalUpdateDetails(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         StudentProcessingLines: Record "Student Processing Lines";
    //         RenewalAmount: Decimal;
    //         ExaminationAccount: Record "Examination Account";
    //         RemainingAmount: Decimal;
    //         TotalRenewal: Integer;
    //     begin
    //         //modify the pending renewals
    //         //for each line modify the pending reenwals based on amount
    //         StudentProcessingLines.Reset;
    //         StudentProcessingLines.SetRange("Booking Header No.", BulkProcessingHeader."No.");
    //         if StudentProcessingLines.FindSet then begin
    //             repeat
    //                 RenewalAmount := StudentProcessingLines."Amount LCY";
    //                 //check exam account
    //                 ExaminationAccount.Reset;
    //                 ExaminationAccount.SetRange("Registration No.", StudentProcessingLines."Registration No.");
    //                 if ExaminationAccount.FindFirst then begin
    //                     if ExaminationAccount."Re-Activation Amount" <> 0 then begin
    //                         if RenewalAmount > ExaminationAccount."Re-Activation Amount" then begin
    //                             ExaminationAccount."Re-Activation Amount" := RenewalAmount - ExaminationAccount."Re-Activation Amount";
    //                             RemainingAmount := RenewalAmount - ExaminationAccount."Re-Activation Amount";
    //                             TotalRenewal := ROUND(ExaminationAccount."Renewal Amount" / RemainingAmount, 1, '<');
    //                             ExaminationAccount."Renewal Pending" := ExaminationAccount."Renewal Pending" - TotalRenewal;
    //                             ExaminationAccount.Modify(true);
    //                         end else
    //                             ExaminationAccount."Re-Activation Amount" := ExaminationAccount."Re-Activation Amount" - RenewalAmount;
    //                         ExaminationAccount.Modify(true);
    //                     end
    //                     else begin
    //                         if ExaminationAccount."Renewal Pending" > 0 then begin
    //                             TotalRenewal := ROUND(ExaminationAccount."Renewal Amount" / RenewalAmount, 1, '<');
    //                             ExaminationAccount."Renewal Pending" := ExaminationAccount."Renewal Pending" - TotalRenewal;
    //                             ExaminationAccount.Modify(true);
    //                         end else begin

    //                         end

    //                     end


    //                 end;
    //             until StudentProcessingLines.Next = 0;
    //         end;
    //     end;

    //     procedure ActivationCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record "Receipts Header1";
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "Receipt Lines1";
    //         NoSeries: Code[30];
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //         ResourcePrice: Record "Resource Price";
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Filename: Text;
    //         FileLocation: Text;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         EntryNo: Integer;
    //         SalesHeader: Record "Sales Header";
    //         ReceiptHeader1: Record "Receipts Header1";
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         ExaminationAccount: Record "Examination Account";
    //         StudentProcessingLines: Record "Student Processing Lines";
    //     begin
    //         //code to post the created invoice
    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if SalesInv.Find('-') then begin
    //             SalesPostYesNo.Run(SalesInv);
    //             Message('Invoice %1 has been posted Successfully', SalesInv."No.");
    //             CashMngmntSetup.Get();
    //             NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
    //             ReceiptHeader.Init;
    //             ReceiptHeader."No." := NoSeries;
    //             ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
    //             ReceiptHeader.Insert(true);
    //             BulkProcessingHeader.CalcFields("Renewal Amount");
    //             ReceiptLines.Init;
    //             ReceiptLines."Receipt No." := ReceiptHeader."No.";
    //             ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //             ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
    //             ReceiptLines.Validate("Account No.");
    //             //get posted invoice number
    //             CustLedgerEntry.Reset;
    //             CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             CustLedgerEntry.SetRange(Amount, BulkProcessingHeader."Renewal Amount");
    //             if CustLedgerEntry.FindFirst then begin
    //                 ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
    //                 ReceiptLines.Validate("Applies to Doc. No");
    //             end;
    //             ReceiptLines.Insert(true);
    //             Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
    //         end;
    //         BulkProcessingHeader."Renewal Receipt No." := ReceiptHeader."No.";
    //         BulkProcessingHeader.Posted := true;
    //         BulkProcessingHeader."Posted By" := UserId;
    //         BulkProcessingHeader."Posted Date" := Today;
    //         BulkProcessingHeader."Posted On" := CurrentDatetime;
    //         BulkProcessingHeader.Modify(true);
    //     end;

    //     procedure ActivationSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         FileName: Text;
    //         FileLocation: Text;
    //         ReceiptHeader: Record "Receipts Header1";
    //         ExaminationAccount: Record "Examination Account";
    //         RegistrationNo: Code[30];
    //         ReceiptHeader1: Record "Receipts Header1";
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";

    //         //SMTP.Create('KASNEB:RENEWAL', Email2, StudentProcessingHeader.Email,
    //         'KASNEB STUDENT RENEWAL',
    //         'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
    //         'Your renewal request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //         'Find attached the receipt', true);
    //         FileName := ReceiptHeader."No." + '.pdf';
    //         FileLocation := ExaminationSetup."Examination Path" + FileName;
    //         ReceiptHeader1.Reset;
    //         ReceiptHeader1.SetRange("No.", StudentProcessingHeader."Renewal Receipt No.");
    //         if ReceiptHeader1.FindSet then begin
    //             //Report.SaveAsPdf(56003, FileLocation, ReceiptHeader1);
    //         end;
    //         //SMTP.AddAttachment(FileLocation, FileName);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>EXAMINATION BOOKING.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();

    //         //send receipt
    //     end;

    //     procedure ConfirmationCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         ResourcePrice: Record "Resource Price";
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Filename: Text;
    //         FileLocation: Text;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         EntryNo: Integer;
    //         SalesHeader: Record "Sales Header";
    //         ReceiptHeader1: Record "Receipts Header1";
    //         TXT001: label 'Invoice %1 sent succesfully';
    //         TXT002: label 'An invoice no %1 for this confirmation has already been processed';
    //         ExaminationAccount: Record "Examination Account";
    //         StudentProcessingLines: Record "Student Processing Lines";
    //     begin

    //         SalesInv.Reset;
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if not SalesInv.FindFirst then begin

    //             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //             SalesInv."No." := '';
    //             SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //             SalesInv."Document Date" := Today;
    //             SalesInv."Order Date" := Today;
    //             SalesInv."Posting Date" := Today;
    //             SalesInv."External Document No." := BulkProcessingHeader."No.";
    //             SalesInv.Type := SalesInv.Type::Normal;
    //             SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
    //             SalesInv."Prepayment %" := 100;//enforce prepayment`
    //             SalesInv.Insert(true);
    //             ExaminationSetup.Get;
    //             SalesLine.Init;
    //             SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //             SalesLine."Document No." := SalesInv."No.";
    //             SalesLine."No." := ExaminationSetup."Re-Activation Resource";
    //             SalesLine.Type := SalesLine.Type::Resource;
    //             SalesLine.Validate(SalesLine."No.");
    //             SalesLine.Validate(SalesLine.Quantity, 1);
    //             BulkProcessingHeader.CalcFields("Activation Amount");
    //             SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Activation Amount");
    //             SalesLine.Insert(true);
    //             BulkProcessingHeader."Activation Invoice No." := SalesInv."No.";
    //             BulkProcessingHeader.Modify;
    //             //send email pro-forma
    //             ExaminationSetup.Get;
    //             Email2 := ExaminationSetup."Registration Sender Email";
    //             //SMTP.Create('KASNEB STUDENT CONFIRMATION', Email2, BulkProcessingHeader.Email,
    //             'KASNEB STUDENT CONFIRMATION',
    //              'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
    //              'Your confirmation request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //              'Find attached the invoice for payment', true);
    //             Filename := SalesInv."No." + '.pdf';
    //             FileLocation := ExaminationSetup."Examination Path" + Filename;
    //             SalesHeader.Reset;
    //             SalesHeader.SetRange("No.", SalesInv."No.");
    //             if SalesHeader.FindSet then begin
    //                 //Report.SaveAsPdf(1302, FileLocation, SalesHeader);
    //             end;
    //             //SMTP.AddAttachment(FileLocation, Filename);
    //             //SMTP.AddBCC(Email2);
    //             //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //             //SMTP.AppendToBody('<BR><BR>KASNEB STUDENT CONFIRMATION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //             //SMTP.Send();
    //             Message(TXT001, SalesInv."No.");

    //         end
    //         else
    //             Error(TXT002, SalesInv."No.")
    //     end;

    //     procedure ConfirmationCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record "Receipts Header1";
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "Receipt Lines1";
    //         NoSeries: Code[30];
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //         ResourcePrice: Record "Resource Price";
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Filename: Text;
    //         FileLocation: Text;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         EntryNo: Integer;
    //         SalesHeader: Record "Sales Header";
    //         ReceiptHeader1: Record "Receipts Header1";
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         ExaminationAccount: Record "Examination Account";
    //         StudentProcessingLines: Record "Student Processing Lines";
    //     begin
    //         //code to post the created invoice
    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if SalesInv.Find('-') then begin
    //             SalesPostYesNo.Run(SalesInv);
    //             Message('Invoice %1 has been posted Successfully', SalesInv."No.");
    //             CashMngmntSetup.Get();
    //             NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
    //             ReceiptHeader.Init;
    //             ReceiptHeader."No." := NoSeries;
    //             ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
    //             ReceiptHeader.Insert(true);
    //             BulkProcessingHeader.CalcFields("Renewal Amount");
    //             ReceiptLines.Init;
    //             ReceiptLines."Receipt No." := ReceiptHeader."No.";
    //             ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //             ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
    //             ReceiptLines.Validate("Account No.");
    //             //get posted invoice number
    //             CustLedgerEntry.Reset;
    //             CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             CustLedgerEntry.SetRange(Amount, BulkProcessingHeader."Renewal Amount");
    //             if CustLedgerEntry.FindFirst then begin
    //                 ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
    //                 ReceiptLines.Validate("Applies to Doc. No");
    //             end;
    //             ReceiptLines.Insert(true);
    //             Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
    //         end;
    //         BulkProcessingHeader."Renewal Receipt No." := ReceiptHeader."No.";
    //         BulkProcessingHeader.Posted := true;
    //         BulkProcessingHeader."Posted By" := UserId;
    //         BulkProcessingHeader."Posted Date" := Today;
    //         BulkProcessingHeader."Posted On" := CurrentDatetime;
    //         BulkProcessingHeader.Modify(true);
    //         ConfirmationSendReceipt(BulkProcessingHeader);
    //     end;

    //     procedure ConfirmationSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         FileName: Text;
    //         FileLocation: Text;
    //         ReceiptHeader: Record "Receipts Header1";
    //         ExaminationAccount: Record "Examination Account";
    //         RegistrationNo: Code[30];
    //         ReceiptHeader1: Record "Receipts Header1";
    //         FileName1: Text;
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";

    //         //SMTP.Create(COMPANYNAME + ' ' + 'STUDENT CONFIRMATION', Email2, StudentProcessingHeader.Email,
    //         COMPANYNAME + ' ' + 'STUDENT CONFIRMATION',
    //         'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
    //         'Your confirmation request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //         'Find attached the receipt and the confirmation letter', true);
    //         FileName := ReceiptHeader."No." + '.pdf';
    //         FileName1 := StudentProcessingHeader."No." + '.pdf';
    //         FileLocation := ExaminationSetup."Examination Path" + FileName;
    //         ReceiptHeader1.Reset;
    //         ReceiptHeader1.SetRange("No.", StudentProcessingHeader."Renewal Receipt No.");
    //         if ReceiptHeader1.FindSet then begin
    //             //Report.SaveAsPdf(56003, FileLocation, ReceiptHeader1);
    //         end;
    //         //Report.SaveAsPdf(85025, FileLocation, StudentProcessingHeader);
    //         //SMTP.AddAttachment(FileLocation + FileName, FileName);
    //         //SMTP.AddAttachment(FileLocation + FileName1, FileName1);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>EXAMINATION CONFIRMATION.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();

    //         //send receipt
    //     end;

    //     procedure ReinstatementCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         FileName: Text;
    //         FileLocation: Text;
    //         SalesHeader: Record "Sales Header";
    //         TXT001: label 'A sales invoice no %1,has already been processed for this application';
    //     begin
    //         SalesInv.Reset;
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if not SalesInv.FindFirst then begin
    //             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //             SalesInv."No." := '';
    //             SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //             SalesInv."Document Date" := Today;
    //             SalesInv."Order Date" := Today;
    //             SalesInv."Posting Date" := Today;
    //             SalesInv."Registration No." := BulkProcessingHeader."Student Reg. No.";
    //             SalesInv."External Document No." := BulkProcessingHeader."No.";
    //             SalesInv.Type := SalesInv.Type::Normal;
    //             SalesInv."Prepayment %" := 100;//enforce prepayment`
    //             SalesInv.Insert(true);
    //             SalesLine.Init;
    //             SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //             SalesLine."Document No." := SalesInv."No.";
    //             SalesLine.Type := SalesLine.Type::Resource;
    //             SalesLine."No." := BulkProcessingHeader."Fee Type";
    //             SalesLine.Validate("No.");
    //             SalesLine.Quantity := 1;
    //             SalesLine.Validate(Quantity);
    //             SalesLine."Unit Price" := BulkProcessingHeader."Reinstatement Amount";
    //             SalesLine.Validate("Unit Price");
    //             SalesLine.Insert(true);
    //             ReinstatementCReceipt(BulkProcessingHeader);
    //             BulkProcessingHeader."Application Invoice" := SalesInv."No.";
    //             BulkProcessingHeader.Modify;
    //         end else
    //             Error(TXT001, SalesInv."No.");
    //     end;

    //     procedure ReinstatementCReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record "Receipts Header1";
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "Receipt Lines1";
    //         NoSeries: Code[30];
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //         TXT001: label 'There is no unposted invoice for the application %1';
    //         ExaminationAccount: Record "Examination Account";
    //     begin
    //         //code to post the created invoice

    //         CashMngmntSetup.Get();
    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if SalesInv.FindFirst then begin
    //             SalesPostYesNo.Run(SalesInv);
    //             Message('Invoice %1 has been posted Successfully', SalesInv."No.");

    //             NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
    //             ReceiptHeader.Init;
    //             ReceiptHeader."No." := NoSeries;
    //             ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
    //             ReceiptHeader.Insert(true);
    //             ReceiptLines.Init;
    //             ReceiptLines."Receipt No." := ReceiptHeader."No.";
    //             ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //             ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Re-instatement amount';
    //             ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
    //             ReceiptLines.Validate("Account No.");
    //             //get posted invoice number
    //             CustLedgerEntry.Reset;
    //             CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
    //             CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             if CustLedgerEntry.FindFirst then begin
    //                 ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
    //                 ReceiptLines.Validate("Applies to Doc. No");
    //             end;
    //             ReceiptLines.Insert(true);

    //             BulkProcessingHeader."Reinstatement Receipt No." := ReceiptHeader."No.";
    //             BulkProcessingHeader.Modify;
    //             //unblock the student
    //             ExaminationAccount.Reset;
    //             ExaminationAccount.SetRange("Registration No.", BulkProcessingHeader."Student Reg. No.");
    //             if ExaminationAccount.FindFirst then begin
    //                 ExaminationAccount.Blocked := false;
    //                 ExaminationAccount.Modify(true);
    //             end;
    //             //open the receipt card
    //             Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
    //         end else
    //             Error(TXT001, BulkProcessingHeader."No.");

    //         //send email receipt
    //     end;

    //     procedure ReinstatementSendReceipt(StudentProcessingHeader: Record "Student Processing Header")
    //     var
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         FileName: Text;
    //         FileLocation: Text;
    //         ReceiptHeader: Record "Receipts Header1";
    //         ExaminationAccount: Record "Examination Account";
    //         RegistrationNo: Code[30];
    //         ReceiptHeader1: Record "Receipts Header1";
    //         FileName1: Text;
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Contact Email";

    //         //SMTP.Create(COMPANYNAME + ' ' + 'STUDENT REINSTATEMENT', Email2, StudentProcessingHeader.Email,
    //         COMPANYNAME + ' ' + 'STUDENT REINSTATEMENT',
    //         'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
    //         'Your reinstatement has been confirmed.<BR>' +
    //         'Find attached the receipt', true);
    //         FileName := ReceiptHeader."No." + '.pdf';
    //         FileLocation := ExaminationSetup."Examination Path" + FileName;
    //         ReceiptHeader1.Reset;
    //         ReceiptHeader1.SetRange("No.", StudentProcessingHeader."Reinstatement Receipt No.");
    //         if ReceiptHeader1.FindSet then begin
    //             //Report.SaveAsPdf(56003, FileLocation, ReceiptHeader1);
    //         end;
    //         //SMTP.AddAttachment(FileLocation + FileName, FileName);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>EXAMINATION DEPARTMENT.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();

    //         //send receipt
    //     end;


    //     procedure StudentPaymentApplication(StudentHeader: Record "Student Application Header")
    //     var
    //         TXT001: label 'Are you sure you want to apply the selected payments';
    //         ApplicationLines: Record "Student Application Lines";
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //         CustLedgerEntry1: Record "Cust. Ledger Entry";
    //         GenJnLine: Record "Gen. Journal Line";
    //         CustEntryApplyPostedEntries: Codeunit "CustEntry-Apply Posted Entries";
    //         Applied: Boolean;
    //     begin
    //         if Confirm(TXT001) then begin
    //             //code to populate to journal
    //             ApplicationLines.Reset;
    //             ApplicationLines.SetRange("Header No.", StudentHeader."No.");
    //             if ApplicationLines.FindSet then begin
    //                 repeat
    //                     //get the positive open entries
    //                     CustLedgerEntry1.Reset;
    //                     CustLedgerEntry1.SetRange("Customer No.", ApplicationLines."Student No.");
    //                     CustLedgerEntry1.SetRange(Open, true);
    //                     CustLedgerEntry1.SetRange(Positive, false);
    //                     if CustLedgerEntry1.FindFirst then begin
    //                         CustLedgerEntry1."Applies-to ID" := UserId;
    //                         CustLedgerEntry1.Validate("Applies-to ID");
    //                         CustLedgerEntry1.CalcFields(Amount);
    //                         CustLedgerEntry1."Amount to Apply" := CustLedgerEntry1.Amount;
    //                         CustLedgerEntry1.Modify(true);

    //                     end;
    //                     CustLedgerEntry.Reset;
    //                     CustLedgerEntry.SetRange("Document No.", ApplicationLines."Applies to Doc. No");
    //                     if CustLedgerEntry.FindFirst then begin
    //                         CustLedgerEntry."Applies-to ID" := UserId;
    //                         CustLedgerEntry.Validate("Applies-to ID");

    //                         CustLedgerEntry.Modify(true);
    //                         CustEntryApplyPostedEntries.Apply(CustLedgerEntry, ApplicationLines."Applies to Doc. No", StudentHeader."Application Date")

    //                     end;

    //                 until ApplicationLines.Next = 0;

    //             end
    //         end
    //         // ////REPEAT
    //         //        MESSAGE('%1',CustLedgerEntry1."Document No.");
    //         //          CustLedgerEntry.RESET;
    //         //          CustLedgerEntry.SETRANGE("Document No.",ApplicationLines."Applies to Doc. No");
    //         //          CustLedgerEntry.LOCKTABLE;
    //         //          IF CustLedgerEntry.FINDSET THEN BEGIN
    //         //          CustLedgerEntry."Applies-to ID":=CustLedgerEntry1."Document No.";
    //         //          //CustLedgerEntry.VALIDATE("Applies-to ID");
    //         //          IF CustLedgerEntry."Currency Code"='' THEN BEGIN
    //         //          CustLedgerEntry."Amount to Apply":=ApplicationLines.Amount;
    //         //          END ELSE BEGIN
    //         //              CustLedgerEntry."Amount to Apply":=ApplicationLines.Amount;
    //         //          END;
    //         //          CustLedgerEntry.VALIDATE("Amount to Apply");
    //         //          CustLedgerEntry.MODIFY;
    //         //          COMMIT;
    //     end;

    //     procedure StudentSittingPapers(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         StudentProcessingLines: Record "Student Processing Lines";
    //         StudentLines: Record "Student Processing Lines";
    //         StudentLines1: Record "Student Processing Lines";
    //         StudentLines2: Record "Student Processing Lines";
    //         BookingEntries: Record "Exam Booking Entries";
    //         Exam: Record Courses;
    //         Level: Record Level;
    //         StartLevel: Integer;
    //         LineNo: Integer;
    //         Papers: Record Papers;
    //         TXT001: label 'Student papers populated succesfully';
    //         ExemptionEntries: Record "Exemption Entries";
    //         ExemptionEntries1: Record "Exemption Entries";
    //         LevelNo: Integer;
    //         LevelNo1: Integer;
    //         ExaminationAccount: Record "Examination Account";
    //         BookingEntries1: Record "Exam Booking Entries";
    //         TotalExemption: Integer;
    //         TotalPapers: Integer;
    //         Window: Dialog;
    //         RegistrationMonth: Integer;
    //         ExamSitting: Record "Exam Sitting Cycle";
    //         SittingMonth: Integer;
    //         PapersInserted: Integer;
    //     begin
    //         //check for reenwal amount and re-activation amount
    //         Window.Open('#Sourcing student papers...');
    //         ExaminationAccount.Reset;
    //         ExaminationAccount.SetRange("Registration No.", BulkProcessingHeader."Student Reg. No.");
    //         if ExaminationAccount.FindFirst then begin
    //             if ExaminationAccount."Renewal Amount" > 0 then begin
    //                 StudentLines.Reset;
    //                 if StudentLines.FindLast then begin
    //                     LineNo := StudentLines."Line No.";
    //                 end;
    //                 StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
    //                 StudentLines1."Line No." := LineNo + 1;
    //                 StudentLines1."Document Type" := StudentLines1."document type"::Renewal;
    //                 StudentLines1."Student No." := BulkProcessingHeader."Student No.";
    //                 StudentLines1.Validate("Student No.");
    //                 StudentLines1.Description := Format(StudentLines1."document type"::Renewal);
    //                 StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
    //                 StudentLines1.Amount := ExaminationAccount."Renewal Amount";
    //                 StudentLines1."Amount LCY" := ExaminationAccount."Renewal Amount";
    //                 StudentLines1.Insert(true);
    //             end;
    //         end;
    //         //check is exam sitting falls ina different financial year
    //         ExamSitting.Reset;
    //         ExamSitting.SetRange("Exam Sitting Cycle", BulkProcessingHeader."Examination Sitting");
    //         if ExamSitting.FindFirst then begin
    //             SittingMonth := Date2dwy(ExamSitting."Exam Start Date", 2);
    //             RegistrationMonth := Date2dwy(Today, 2);
    //             if ((SittingMonth > 7) and (RegistrationMonth < 7)) then begin
    //                 //insert renewal fees
    //                 StudentLines.Reset;
    //                 if StudentLines.FindLast then begin
    //                     LineNo := StudentLines."Line No.";
    //                 end;
    //                 StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
    //                 StudentLines1."Line No." := LineNo + 1;
    //                 StudentLines1."Document Type" := StudentLines1."document type"::Renewal;
    //                 StudentLines1."Student No." := BulkProcessingHeader."Student No.";
    //                 StudentLines1.Validate("Student No.");
    //                 StudentLines1.Description := Format(StudentLines1."document type"::Renewal);
    //                 StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
    //                 // StudentLines1.Amount:=ExaminationAccount."Renewal Amount";
    //                 //StudentLines1."Amount LCY":=ExaminationAccount."Renewal Amount";
    //                 StudentLines1.Insert(true);
    //             end;
    //         end;
    //         //check if any re-activation exists
    //         ExaminationAccount.Reset;
    //         ExaminationAccount.SetRange("Registration No.", BulkProcessingHeader."Student Reg. No.");
    //         if ExaminationAccount.FindFirst then begin
    //             if ExaminationAccount."Re-Activation Amount" > 0 then begin
    //                 StudentLines.Reset;
    //                 if StudentLines.FindLast then begin
    //                     LineNo := StudentLines."Line No.";
    //                 end;
    //                 StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
    //                 StudentLines1."Line No." := LineNo + 1;
    //                 StudentLines1."Document Type" := StudentLines1."document type"::"Re-Activation";
    //                 StudentLines1."Student No." := BulkProcessingHeader."Student No.";
    //                 StudentLines1.Validate("Student No.");
    //                 StudentLines1.Description := Format(StudentLines1."document type"::"Re-Activation");
    //                 StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
    //                 StudentLines1.Amount := ExaminationAccount."Re-Activation Amount";
    //                 StudentLines1."Amount LCY" := ExaminationAccount."Re-Activation Amount";
    //                 StudentLines1.Insert(true);
    //             end;
    //         end;
    //         //check if student has booking entries
    //         StartLevel := 1;
    //         BookingEntries.Reset;
    //         BookingEntries.SetRange(Examination, BulkProcessingHeader."Examination ID");
    //         BookingEntries.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
    //         BookingEntries.SetFilter(Status, '<>%1', BookingEntries.Status::Cancelled);
    //         if not BookingEntries.FindSet then begin

    //             //ensure no exemption entries are present
    //             ExemptionEntries.Reset;
    //             ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
    //             ExemptionEntries.SetRange("Course Id", BulkProcessingHeader."Examination ID");
    //             if not ExemptionEntries.FindSet then begin
    //                 Level.Reset;
    //                 Level.SetRange(Course, BulkProcessingHeader."Examination ID");
    //                 Level.SetRange(Level, StartLevel);
    //                 if Level.FindFirst then begin
    //                     Papers.Reset;
    //                     Papers.SetRange(Level, Level.Code);
    //                     Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
    //                     if Papers.FindSet then begin
    //                         repeat
    //                             //check is paper already inserted
    //                             StudentLines2.Reset;
    //                             StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
    //                             StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
    //                             StudentLines2.SetRange(Paper, Papers.Code);
    //                             if not StudentLines2.FindFirst then begin
    //                                 //check if exempted
    //                                 ExemptionEntries.Reset;
    //                                 ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
    //                                 ExemptionEntries.SetRange("No.", Papers.Code);
    //                                 if not ExemptionEntries.FindFirst then begin
    //                                     //insert all papers
    //                                     StudentLines.Reset;
    //                                     if StudentLines.FindLast then begin
    //                                         LineNo := StudentLines."Line No.";
    //                                     end;
    //                                     StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
    //                                     StudentLines1."Line No." := LineNo + 1;
    //                                     StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
    //                                     StudentLines1."Document Type" := StudentLines1."document type"::Booking;
    //                                     StudentLines1."Student No." := BulkProcessingHeader."Student No.";
    //                                     StudentLines1.Validate("Student No.");
    //                                     StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
    //                                     StudentLines1.Part := Level.Code;
    //                                     StudentLines1.Paper := Papers.Code;
    //                                     StudentLines1.Validate(Paper);
    //                                     StudentLines1.Insert(true);
    //                                     LineNo += 1;
    //                                 end
    //                             end

    //                         until Papers.Next = 0;
    //                     end;//end of papers

    //                 end //end of level
    //             end//end of exemtpion checker

    //             else begin

    //                 Level.Reset;
    //                 Level.SetRange(Course, BulkProcessingHeader."Examination ID");
    //                 Level.SetCurrentkey(Level);
    //                 Level.SetAscending(Level, true);
    //                 if Level.FindSet then begin
    //                     repeat
    //                         PapersInserted := 0;
    //                         LevelNo := Level.Level;
    //                         if LevelNo > LevelNo1 then begin

    //                             ExemptionEntries1.Reset;
    //                             ExemptionEntries1.SetRange("Course Id", ExemptionEntries."Course Id");
    //                             ExemptionEntries1.SetRange("Stud. Reg. No", ExemptionEntries."Stud. Reg. No");
    //                             ExemptionEntries1.SetRange(Level, Level.Code);
    //                             TotalExemption := ExemptionEntries1.Count;

    //                             Papers.Reset;
    //                             Papers.SetRange(Level, Level.Code);
    //                             Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
    //                             TotalPapers := Papers.Count;

    //                             if TotalPapers = TotalExemption then begin

    //                                 LevelNo1 := Level.Level + 1;
    //                                 //insert papers that are in the next level
    //                                 Level.Reset;
    //                                 Level.SetRange(Course, BulkProcessingHeader."Examination ID");
    //                                 Level.SetRange(Level, LevelNo1);
    //                                 if Level.FindFirst then begin
    //                                     Papers.Reset;
    //                                     Papers.SetRange(Level, Level.Code);
    //                                     Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
    //                                     if Papers.FindSet then begin
    //                                         repeat
    //                                             //check is paper already inserted
    //                                             StudentLines2.Reset;
    //                                             StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
    //                                             StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
    //                                             StudentLines2.SetRange(Paper, Papers.Code);
    //                                             if not StudentLines2.FindFirst then begin
    //                                                 //check if exempted
    //                                                 ExemptionEntries.Reset;
    //                                                 ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
    //                                                 ExemptionEntries.SetRange("No.", Papers.Code);
    //                                                 if not ExemptionEntries.FindFirst then begin
    //                                                     //insert all papers
    //                                                     StudentLines.Reset;
    //                                                     if StudentLines.FindLast then begin
    //                                                         LineNo := StudentLines."Line No.";
    //                                                     end;
    //                                                     StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
    //                                                     StudentLines1."Line No." := LineNo + 1;
    //                                                     StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
    //                                                     StudentLines1."Document Type" := StudentLines1."document type"::Booking;
    //                                                     StudentLines1."Student No." := BulkProcessingHeader."Student No.";
    //                                                     StudentLines1.Validate("Student No.");
    //                                                     StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
    //                                                     StudentLines1.Part := Level.Code;
    //                                                     StudentLines1.Paper := Papers.Code;
    //                                                     StudentLines1.Validate(Paper);
    //                                                     StudentLines1.Insert(true);
    //                                                     PapersInserted += 1;
    //                                                     LineNo += 1;
    //                                                 end
    //                                             end;



    //                                         until Papers.Next = 0;
    //                                     end;
    //                                     //EXIT;//end of papers

    //                                 end;//end of level

    //                             end;



    //                             if TotalPapers > TotalExemption then begin

    //                                 LevelNo1 := Level.Level;
    //                                 //insert papers that are in the next level
    //                                 Level.Reset;
    //                                 Level.SetRange(Course, BulkProcessingHeader."Examination ID");
    //                                 Level.SetRange(Level, LevelNo1);
    //                                 if Level.FindFirst then begin
    //                                     Papers.Reset;
    //                                     Papers.SetRange(Level, Level.Code);
    //                                     Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
    //                                     if Papers.FindSet then begin
    //                                         repeat
    //                                             //check is paper already inserted
    //                                             StudentLines2.Reset;
    //                                             StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
    //                                             StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
    //                                             StudentLines2.SetRange(Paper, Papers.Code);
    //                                             if not StudentLines2.FindFirst then begin
    //                                                 //check if exempted
    //                                                 ExemptionEntries.Reset;
    //                                                 ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
    //                                                 ExemptionEntries.SetRange("No.", Papers.Code);
    //                                                 if not ExemptionEntries.FindFirst then begin
    //                                                     //insert all papers
    //                                                     StudentLines.Reset;
    //                                                     if StudentLines.FindLast then begin
    //                                                         LineNo := StudentLines."Line No.";
    //                                                     end;
    //                                                     StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
    //                                                     StudentLines1."Line No." := LineNo + 1;
    //                                                     StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
    //                                                     StudentLines1."Document Type" := StudentLines1."document type"::Booking;
    //                                                     StudentLines1."Student No." := BulkProcessingHeader."Student No.";
    //                                                     StudentLines1.Validate("Student No.");
    //                                                     StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
    //                                                     StudentLines1.Part := Level.Code;
    //                                                     StudentLines1.Paper := Papers.Code;
    //                                                     StudentLines1.Validate(Paper);
    //                                                     StudentLines1.Insert(true);
    //                                                     LineNo += 1;
    //                                                 end
    //                                             end;



    //                                         until Papers.Next = 0;
    //                                     end;
    //                                     exit;//end of papers
    //                                 end;//end of level

    //                             end
    //                         end
    //                     until Level.Next = 0;

    //                 end;


    //             end
    //         end //end of first logic
    //         else begin //start of  other student logic
    //                    //check if any level has failed papers

    //             Level.Reset;
    //             Level.SetRange(Course, BulkProcessingHeader."Examination ID");
    //             Level.SetCurrentkey(Level);
    //             Level.SetAscending(Level, false);
    //             if Level.FindSet then begin
    //                 repeat

    //                     //get the levelno

    //                     LevelNo := Level.Level;
    //                     //check if student has failed any paper on the level
    //                     BookingEntries1.Reset;
    //                     BookingEntries1.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
    //                     BookingEntries1.SetRange(Examination, BulkProcessingHeader."Examination ID");
    //                     BookingEntries1.SetRange(Part, Level.Code);
    //                     BookingEntries1.SetRange(Blocked, false);
    //                     BookingEntries1.SetRange(Status, BookingEntries1.Status::Failed);
    //                     if BookingEntries1.FindSet then begin
    //                         repeat
    //                             StudentLines.Reset;
    //                             if StudentLines.FindLast then begin
    //                                 LineNo := StudentLines."Line No.";
    //                             end;
    //                             StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
    //                             StudentLines1."Line No." := LineNo + 1;
    //                             StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
    //                             StudentLines1."Document Type" := StudentLines1."document type"::Booking;
    //                             StudentLines1."Student No." := BulkProcessingHeader."Student No.";
    //                             StudentLines1.Validate("Student No.");
    //                             StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
    //                             StudentLines1.Part := BookingEntries1.Part;
    //                             StudentLines1.Paper := BookingEntries1.Paper;
    //                             StudentLines1.Validate(Paper);
    //                             StudentLines1.Insert(true);
    //                             LineNo += 1;

    //                         until BookingEntries1.Next = 0;
    //                         exit;
    //                     end;//end of booking entries


    //                     //check if student has attempted the levels
    //                     BookingEntries.Reset;
    //                     BookingEntries.SetRange(Part, Level.Code);
    //                     BookingEntries.SetRange(Examination, BulkProcessingHeader."Examination ID");
    //                     BookingEntries.SetRange("Student Reg No.", BulkProcessingHeader."Student Reg. No.");
    //                     BookingEntries.SetFilter(Status, '<>%1', BookingEntries.Status::Cancelled);
    //                     if not BookingEntries.FindFirst then begin
    //                         //insert papers for the level

    //                         if LevelNo1 < LevelNo then begin
    //                             Papers.Reset;
    //                             Papers.SetRange(Course, BulkProcessingHeader."Examination ID");
    //                             Papers.SetRange(Level, Level.Code);
    //                             if Papers.FindSet then begin
    //                                 repeat
    //                                     //check is papers exist
    //                                     StudentLines2.Reset;
    //                                     StudentLines2.SetRange("Student No.", BulkProcessingHeader."Student No.");
    //                                     StudentLines2.SetRange("Booking Header No.", BulkProcessingHeader."No.");
    //                                     StudentLines2.SetRange(Paper, Papers.Code);
    //                                     if not StudentLines2.FindFirst then begin
    //                                         //check if exempted
    //                                         ExemptionEntries.Reset;
    //                                         ExemptionEntries.SetRange("Stud. Reg. No", BulkProcessingHeader."Student Reg. No.");
    //                                         ExemptionEntries.SetRange("No.", Papers.Code);
    //                                         if not ExemptionEntries.FindFirst then begin
    //                                             LevelNo1 := LevelNo + 1;
    //                                             StudentLines.Reset;
    //                                             if StudentLines.FindLast then begin
    //                                                 LineNo := StudentLines."Line No.";
    //                                             end;
    //                                             StudentLines1."Booking Header No." := BulkProcessingHeader."No.";
    //                                             StudentLines1."Line No." := LineNo + 1;
    //                                             StudentLines1."Booking Type" := StudentLines1."booking type"::Paper;
    //                                             StudentLines1."Document Type" := StudentLines1."document type"::Booking;
    //                                             StudentLines1."Student No." := BulkProcessingHeader."Student No.";
    //                                             StudentLines1.Validate("Student No.");
    //                                             StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
    //                                             StudentLines1.Part := Level.Code;
    //                                             StudentLines1.Paper := Papers.Code;
    //                                             StudentLines1.Validate(Paper);
    //                                             StudentLines1.Insert(true);
    //                                             LineNo += 1;
    //                                         end
    //                                     end
    //                                 until Papers.Next = 0;
    //                             end;//end of papers
    //                             exit;
    //                         end;//end of level checker

    //                     end;//end of booking entries
    //                     LevelNo := Level.Level;
    //                 until Level.Next = 0;
    //             end;//end of level
    //             Sleep(1);
    //             Window.Close;
    //         end//end of other logic
    //     end;


    //     procedure PostBankEntries(BankImportEntries: Record "Bank Import Entries")
    //     var
    //         BankImportEntries1: Record "Bank Import Entries";
    //         GenJnLine: Record "Gen. Journal Line";
    //         LineNo: Integer;
    //         GLAccount: Record "G/L Account";
    //         CMSetup: Record "Examination Setup";
    //         TotalAmount: Decimal;
    //     begin
    //         if Confirm('Post Bank Entries for %1', false, BankImportEntries."Bank Code") = true then begin
    //             CMSetup.Get();
    //             // Delete Lines Present on the General Journal Line
    //             GenJnLine.Reset;
    //             GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Bank Import Template");
    //             GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Bank Import Batch Name");
    //             GenJnLine.DeleteAll;
    //             LineNo := 10;
    //             BankImportEntries1.Reset;
    //             BankImportEntries1.SetRange("Bank Code", BankImportEntries."Bank Code");
    //             BankImportEntries1.SetRange(Posted, false);
    //             if BankImportEntries1.FindSet then begin
    //                 repeat
    //                     TotalAmount := TotalAmount + BankImportEntries1.Amount;
    //                     GenJnLine.Init;
    //                     if CMSetup.Get then
    //                         GenJnLine."Journal Template Name" := CMSetup."Bank Import Template";
    //                     GenJnLine."Journal Batch Name" := CMSetup."Bank Import Batch Name";
    //                     GenJnLine."Line No." := LineNo + 10;
    //                     GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
    //                     GenJnLine."Account No." := BankImportEntries1."Bank Code";
    //                     GenJnLine.Validate(GenJnLine."Account No.");
    //                     GenJnLine."Posting Date" := BankImportEntries1."Transaction Date";
    //                     GenJnLine."Document No." := Format(BankImportEntries."Entry No");
    //                     GenJnLine."External Document No." := BankImportEntries1."Reference No.";
    //                     GenJnLine.Description := BankImportEntries1."Student Name";
    //                     GenJnLine.Amount := BankImportEntries1.Amount;
    //                     GenJnLine.Validate(GenJnLine.Amount);
    //                     if GenJnLine.Amount <> 0 then
    //                         GenJnLine.Insert;
    //                     LineNo += 1;
    //                     BankImportEntries1.Posted := true;
    //                     BankImportEntries1.Modify(true);
    //                 until BankImportEntries1.Next = 0;
    //                 GenJnLine.Init;
    //                 if CMSetup.Get then
    //                     GenJnLine."Journal Template Name" := CMSetup."Bank Import Template";
    //                 GenJnLine."Journal Batch Name" := CMSetup."Bank Import Batch Name";
    //                 GenJnLine."Line No." := LineNo + 10;
    //                 GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
    //                 GenJnLine."Account No." := CMSetup."Unnalocated Account";
    //                 GenJnLine.Validate(GenJnLine."Account No.");
    //                 GenJnLine."Posting Date" := BankImportEntries1."Transaction Date";
    //                 GenJnLine."Document No." := Format(BankImportEntries."Entry No");
    //                 GenJnLine."External Document No." := BankImportEntries1."Reference No.";
    //                 GenJnLine.Description := 'Import on  ' + Format(BankImportEntries1."Transaction Date");
    //                 GenJnLine.Amount := -TotalAmount;
    //                 GenJnLine.Validate(GenJnLine.Amount);
    //                 if GenJnLine.Amount <> 0 then
    //                     GenJnLine.Insert;
    //                 LineNo += 1;

    //                 Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
    //             end;

    //         end
    //     end;


    //     procedure ApplyPaymentEntry(ProcessingHeader: Record "Student Processing Header")
    //     var
    //         BankImportEntries1: Record "Bank Import Entries";
    //         GenJnLine: Record "Gen. Journal Line";
    //         LineNo: Integer;
    //         GLAccount: Record "G/L Account";
    //         CMSetup: Record "Examination Setup";
    //         TotalAmount: Decimal;
    //         ApplicationAmount: Decimal;
    //         ApplicationInvoice: Code[50];
    //         SalesInv: Record "Sales Header";
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         SalesInvoiceHeader: Record "Sales Invoice Header";
    //     begin
    //         if Confirm('Apply payment for application %1', false, ProcessingHeader."No.") = true then begin
    //             //ensure the import entries have a value

    //             //check sales header if not posted
    //             SalesInv.Reset;
    //             SalesInv.SetRange("Sell-to Customer No.", ProcessingHeader."Student No.");
    //             SalesInv.SetRange("External Document No.", ProcessingHeader."No.");
    //             if SalesInv.FindFirst then begin
    //                 SalesPostYesNo.Run(SalesInv);
    //             end;
    //             //get amount by document type
    //             if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Registration then begin
    //                 ApplicationAmount := ProcessingHeader."Application Amount";
    //                 ApplicationInvoice := ProcessingHeader."Application Invoice";
    //             end;
    //             if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Booking then begin
    //                 ProcessingHeader.CalcFields("Booking Amount");
    //                 ApplicationAmount := ProcessingHeader."Booking Amount";
    //                 ApplicationInvoice := ProcessingHeader."Booking Invoice No.";
    //             end;
    //             if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Exemption then begin
    //                 ProcessingHeader.CalcFields("Exemption Amount");
    //                 ApplicationAmount := ProcessingHeader."Exemption Amount";
    //                 ApplicationInvoice := ProcessingHeader."Exemption Invoice No.";
    //             end;
    //             if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Renewal then begin
    //                 ProcessingHeader.CalcFields("Renewal Amount");
    //                 ApplicationAmount := ProcessingHeader."Renewal Amount";
    //                 ApplicationInvoice := ProcessingHeader."Renewal Invoice No.";
    //             end;
    //             CMSetup.Get;
    //             // Delete Lines Present on the General Journal Line
    //             GenJnLine.Reset;
    //             GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Student Allocation Template");
    //             GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Student Allocation Batch Name");
    //             GenJnLine.DeleteAll;
    //             LineNo := 10;
    //             BankImportEntries1.Reset;
    //             BankImportEntries1.SetRange("Reference No.", ProcessingHeader."Payment Reference No.");
    //             if BankImportEntries1.FindFirst then begin
    //                 GenJnLine.Init;
    //                 GenJnLine."Journal Template Name" := CMSetup."Student Allocation Template";
    //                 GenJnLine."Journal Batch Name" := CMSetup."Student Allocation Batch Name";
    //                 GenJnLine."Line No." := LineNo + 10;
    //                 GenJnLine."Account Type" := GenJnLine."account type"::Customer;
    //                 GenJnLine."Account No." := ProcessingHeader."Student No.";
    //                 GenJnLine.Validate(GenJnLine."Account No.");
    //                 GenJnLine."Posting Date" := Today;
    //                 GenJnLine."Document No." := ProcessingHeader."No.";
    //                 ;
    //                 GenJnLine."External Document No." := BankImportEntries1."Reference No.";
    //                 GenJnLine.Description := 'Application for ' + ProcessingHeader."Student Name";
    //                 ;
    //                 GenJnLine.Amount := -ApplicationAmount;
    //                 GenJnLine.Validate(GenJnLine.Amount);
    //                 GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
    //                 //GET THE Invoice posted
    //                 SalesInvoiceHeader.Reset;
    //                 SalesInvoiceHeader.SetRange("Sell-to Customer No.", ProcessingHeader."Student No.");
    //                 SalesInvoiceHeader.SetRange("External Document No.", ProcessingHeader."No.");
    //                 SalesInvoiceHeader.SetRange(Closed, false);
    //                 if SalesInvoiceHeader.FindFirst then begin
    //                     GenJnLine."Applies-to Doc. No." := SalesInvoiceHeader."No.";
    //                     GenJnLine.Validate("Applies-to Doc. No.");
    //                 end;



    //                 GenJnLine."Bal. Account Type" := GenJnLine."account type"::"G/L Account";
    //                 GenJnLine."Bal. Account No." := CMSetup."Unnalocated Account";
    //                 if GenJnLine.Amount <> 0 then
    //                     GenJnLine.Insert;

    //                 Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

    //                 Commit;

    //                 if ((BankImportEntries1.Amount > ApplicationAmount) or (BankImportEntries1.Amount = ApplicationAmount)) then begin
    //                     //registration
    //                     if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Registration then begin
    //                         ApplicationAssignRegistrationNo(ProcessingHeader);
    //                         //mark document as posted
    //                         ProcessingHeader.Posted := true;
    //                         ProcessingHeader."Posted By" := UserId;
    //                         ProcessingHeader."Posted On" := CurrentDatetime;
    //                         ProcessingHeader."Posted Date" := Today;
    //                         ProcessingHeader.Modify(true);
    //                     end;
    //                     //booking
    //                     if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Booking then begin
    //                         BookingSendReceipt(ProcessingHeader);
    //                         PostExaminationVoucher(ProcessingHeader);
    //                     end;
    //                     //renewal
    //                     if ProcessingHeader."Document Type" = ProcessingHeader."document type"::Renewal then begin
    //                         RenewalUpdateDetails(ProcessingHeader);
    //                     end;
    //                     if BankImportEntries1.Amount = ApplicationAmount then
    //                         BankImportEntries1.Closed := true;
    //                     BankImportEntries1."Applied Amount" := ProcessingHeader."Application Amount";
    //                     BankImportEntries1."Remaining Amount" := BankImportEntries1.Amount - ApplicationAmount;
    //                     BankImportEntries1.Modify(true);
    //                 end else begin
    //                     BankImportEntries1.Closed := true;
    //                     BankImportEntries1."Applied Amount" := ApplicationAmount;
    //                     BankImportEntries1."Remaining Amount" := BankImportEntries1.Amount - BankImportEntries1."Applied Amount";
    //                     BankImportEntries1.Modify(true);
    //                     ProcessingHeader."Payment Remaining Amount" := ApplicationAmount - BankImportEntries1.Amount;
    //                     ProcessingHeader.Modify(true);
    //                     //update remaining amount

    //                 end

    //             end;
    //             //find entry and mark as closed

    //         end;
    //     end;


    //     procedure PostStudentReceipt(ReceiptRec: Record "Receipts Header1")
    //     var
    //         RcptLines: Record "Receipt Lines1";
    //         GenJnLine: Record "Gen. Journal Line";
    //         LineNo: Integer;
    //         VATSetup: Record "VAT Posting Setup";
    //         GLAccount: Record "G/L Account";
    //         Customer: Record Customer;
    //         Vendor: Record Vendor;
    //         GLEntry: Record "G/L Entry";
    //         ExaminationSetup: Record "Examination Setup";
    //         TransactionType: Record "Miscellaneous Transaction Type";
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //     begin
    //         if Confirm('Post Receipt', false, ReceiptRec."No.") = true then begin

    //             if ReceiptRec.Posted = true then
    //                 Error('Already Posted', ReceiptRec."No.");
    //             ReceiptRec.TestField(Date);
    //             ReceiptRec.TestField("Bank Code");
    //             ReceiptRec.TestField("Received From");
    //             ReceiptRec.TestField("Pay Mode");

    //             if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
    //                 ReceiptRec.TestField("Cheque No");
    //                 ReceiptRec.TestField("Cheque Date");
    //             end;

    //             ReceiptRec.CalcFields(Amount);
    //             //Check Lines
    //             if ReceiptRec.Amount = 0 then
    //                 Error('Amount cannot be zero');
    //             RcptLines.Reset;
    //             RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
    //             if not RcptLines.FindLast then
    //                 Error('Receipt Lines cannot be empty');

    //             ExaminationSetup.Get;
    //             // Delete Lines Present on the General Journal Line
    //             GenJnLine.Reset;
    //             GenJnLine.SetRange(GenJnLine."Journal Template Name", ExaminationSetup."Student Receipt Template");
    //             GenJnLine.SetRange(GenJnLine."Journal Batch Name", ExaminationSetup."Student Receipt Batch Name");
    //             GenJnLine.DeleteAll;



    //             //Bank Entries
    //             LineNo := LineNo + 10000;

    //             RcptLines.Reset;
    //             RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
    //             RcptLines.Validate(Amount);
    //             RcptLines.CalcSums(Amount);



    //             GenJnLine.Init;
    //             if ExaminationSetup.Get then
    //                 GenJnLine."Journal Template Name" := ExaminationSetup."Student Receipt Template";
    //             GenJnLine."Journal Batch Name" := ExaminationSetup."Student Receipt Batch Name";
    //             GenJnLine."Line No." := LineNo;
    //             GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
    //             GenJnLine."Account No." := ReceiptRec."Bank Code";
    //             GenJnLine.Validate(GenJnLine."Account No.");
    //             if ReceiptRec.Date = 0D then
    //                 Error('You must specify the Receipt date');
    //             GenJnLine."Posting Date" := ReceiptRec."Posted Date";
    //             GenJnLine."Document No." := ReceiptRec."No.";
    //             GenJnLine."External Document No." := ReceiptRec."Cheque No";
    //             GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
    //             GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
    //             GenJnLine.Amount := ReceiptRec.Amount;
    //             GenJnLine."Currency Code" := ReceiptRec."Currency Code";
    //             GenJnLine.Validate("Currency Code");
    //             GenJnLine."Currency Factor" := ReceiptRec."Currency Factor";
    //             GenJnLine.Validate("Currency Factor");
    //             GenJnLine.Validate(GenJnLine.Amount);
    //             GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
    //             GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
    //             GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
    //             GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
    //             GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

    //             if GenJnLine.Amount <> 0 then
    //                 GenJnLine.Insert;

    //             //Receipt Lines Entries
    //             RcptLines.Reset;
    //             RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
    //             if RcptLines.FindSet then begin
    //                 repeat
    //                     //create and post a sales invoice
    //                     TransactionType.Reset;
    //                     TransactionType.SetRange(Code, RcptLines."Transaction Type");
    //                     if TransactionType.FindFirst then begin
    //                         TransactionType.TestField(Resource);
    //                         SalesInv.Reset;
    //                         SalesInv.SetRange("External Document No.", ReceiptRec."No." + ' ' + Format(RcptLines."Line No"));
    //                         if not SalesInv.FindFirst then begin
    //                             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //                             SalesInv."No." := '';
    //                             SalesInv.Validate(SalesInv."Sell-to Customer No.", RcptLines."Account No.");
    //                             SalesInv."Document Date" := Today;
    //                             SalesInv."Order Date" := Today;
    //                             SalesInv."Posting Date" := Today;
    //                             SalesInv."External Document No." := ReceiptRec."No." + ' ' + Format(RcptLines."Line No");
    //                             SalesInv."Registration No." := RcptLines."Registration No.";
    //                             SalesInv.Type := SalesInv.Type::Normal;
    //                             SalesInv."Prepayment %" := 100;//enforce prepayment`
    //                             SalesInv.Insert(true);
    //                             SalesLine.Init;
    //                             SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //                             SalesLine."Document No." := SalesInv."No.";
    //                             SalesLine.Type := SalesLine.Type::Resource;
    //                             SalesLine."No." := TransactionType.Resource;
    //                             SalesLine.Validate("No.");
    //                             SalesLine.Quantity := 1;
    //                             SalesLine.Validate(Quantity);
    //                             SalesLine."Unit Price" := RcptLines."Amount (LCY)";
    //                             SalesLine.Validate("Unit Price");
    //                             SalesLine.Insert(true);
    //                         end;
    //                         SalesPostYesNo.Run(SalesInv);

    //                     end;
    //                     RcptLines.Validate(RcptLines.Amount);
    //                     LineNo := LineNo + 10000;
    //                     GenJnLine.Init;
    //                     if ExaminationSetup.Get then
    //                         GenJnLine."Journal Template Name" := ExaminationSetup."Student Receipt Template";
    //                     GenJnLine."Journal Batch Name" := ExaminationSetup."Student Receipt Batch Name";
    //                     GenJnLine."Line No." := LineNo;
    //                     GenJnLine."Account Type" := RcptLines."Account Type";
    //                     GenJnLine."Account No." := RcptLines."Account No.";
    //                     GenJnLine.Validate(GenJnLine."Account No.");
    //                     GenJnLine."Posting Date" := ReceiptRec."Posted Date";
    //                     GenJnLine."Document No." := ReceiptRec."No.";
    //                     GenJnLine."External Document No." := ReceiptRec."Cheque No";
    //                     GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
    //                     GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
    //                     GenJnLine.Amount := -RcptLines.Amount;
    //                     //get posted invoice number
    //                     CustLedgerEntry.Reset;
    //                     CustLedgerEntry.SetRange("Customer No.", RcptLines."Account No.");
    //                     CustLedgerEntry.SetRange("External Document No.", ReceiptRec."No." + ' ' + Format(RcptLines."Line No"));
    //                     if CustLedgerEntry.FindFirst then begin
    //                         GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
    //                         GenJnLine."Applies-to Doc. No." := CustLedgerEntry."Document No.";
    //                         GenJnLine.Validate("Applies-to Doc. No.");
    //                     end;

    //                     GenJnLine."Currency Code" := ReceiptRec."Currency Code";
    //                     GenJnLine.Validate("Currency Code");
    //                     GenJnLine."Currency Factor" := ReceiptRec."Currency Factor";
    //                     GenJnLine.Validate("Currency Factor");
    //                     GenJnLine.Validate(GenJnLine.Amount);
    //                     GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
    //                     GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
    //                     GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
    //                     GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
    //                     GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
    //                     //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
    //                     //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

    //                     if GenJnLine.Amount <> 0 then
    //                         GenJnLine.Insert;

    //                 until RcptLines.Next = 0;
    //             end;

    //             Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
    //             GLEntry.Reset;
    //             GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
    //             GLEntry.SetRange(GLEntry.Reversed, false);
    //             if GLEntry.FindFirst then begin
    //                 ReceiptRec.Posted := true;
    //                 ReceiptRec."Posted By" := UserId;
    //                 ReceiptRec."Posted Date" := ReceiptRec."Posted Date";
    //                 ReceiptRec."Posted Time" := Time;
    //                 ReceiptRec.Modify;

    //             end;

    //         end;
    //     end;


    //     procedure ApplyMiscPaymentEntry(Receipts: Record "Receipts Header1")
    //     var
    //         BankImportEntries1: Record "Bank Import Entries";
    //         GenJnLine: Record "Gen. Journal Line";
    //         LineNo: Integer;
    //         GLAccount: Record "G/L Account";
    //         CMSetup: Record "Examination Setup";
    //         TotalAmount: Decimal;
    //         ApplicationAmount: Decimal;
    //         ApplicationInvoice: Code[50];
    //         SalesInv: Record "Sales Header";
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         SalesInvoiceHeader: Record "Sales Invoice Header";
    //         Lines: Record "Receipt Lines1";
    //         "CustNo.": Code[30];
    //         TransactionType: Record "Miscellaneous Transaction Type";
    //         SalesLine: Record "Sales Line";
    //     begin
    //         if Confirm('Apply payment for application %1', false, Receipts."No.") = true then begin
    //             //check sales header if not posted
    //             Receipts.CalcFields(Amount);
    //             ApplicationAmount := Receipts.Amount - Receipts."Remaining Amount";
    //             Lines.Reset;
    //             Lines.SetRange("Receipt No.", Receipts."No.");
    //             if Lines.FindSet then begin
    //                 repeat
    //                     "CustNo." := Lines."Account No.";

    //                     //create invoice

    //                     TransactionType.Reset;
    //                     TransactionType.SetRange(Code, Lines."Transaction Type");
    //                     if TransactionType.FindFirst then begin
    //                         TransactionType.TestField(Resource);
    //                         SalesInv.Reset;
    //                         SalesInv.SetRange("External Document No.", Receipts."No." + ' ' + Format(Lines."Line No"));
    //                         if not SalesInv.FindFirst then begin
    //                             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //                             SalesInv."No." := '';
    //                             SalesInv.Validate(SalesInv."Sell-to Customer No.", Lines."Account No.");
    //                             SalesInv."Document Date" := Today;
    //                             SalesInv."Order Date" := Today;
    //                             SalesInv."Posting Date" := Today;
    //                             SalesInv."External Document No." := Receipts."No." + ' ' + Format(Lines."Line No");
    //                             SalesInv."Registration No." := Lines."Registration No.";
    //                             SalesInv.Type := SalesInv.Type::Normal;
    //                             SalesInv."Prepayment %" := 100;//enforce prepayment`
    //                             SalesInv.Insert(true);
    //                             SalesLine.Init;
    //                             SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //                             SalesLine."Document No." := SalesInv."No.";
    //                             SalesLine.Type := SalesLine.Type::Resource;
    //                             SalesLine."No." := TransactionType.Resource;
    //                             SalesLine.Validate("No.");
    //                             SalesLine.Quantity := 1;
    //                             SalesLine.Validate(Quantity);
    //                             SalesLine."Unit Price" := Lines."Amount (LCY)";
    //                             SalesLine.Validate("Unit Price");
    //                             SalesLine.Insert(true);
    //                         end;
    //                         SalesPostYesNo.Run(SalesInv);


    //                         CMSetup.Get;
    //                         // Delete Lines Present on the General Journal Line
    //                         GenJnLine.Reset;
    //                         GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Student Allocation Template");
    //                         GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Student Allocation Batch Name");
    //                         GenJnLine.DeleteAll;
    //                         LineNo := 10;
    //                         BankImportEntries1.Reset;
    //                         BankImportEntries1.SetRange("Reference No.", Receipts."Payment Reference No.");
    //                         if BankImportEntries1.FindFirst then begin
    //                             GenJnLine.Init;
    //                             GenJnLine."Journal Template Name" := CMSetup."Student Allocation Template";
    //                             GenJnLine."Journal Batch Name" := CMSetup."Student Allocation Batch Name";
    //                             GenJnLine."Line No." := LineNo + 10;
    //                             GenJnLine."Account Type" := GenJnLine."account type"::Customer;
    //                             GenJnLine."Account No." := "CustNo.";
    //                             GenJnLine.Validate(GenJnLine."Account No.");
    //                             GenJnLine."Posting Date" := Today;
    //                             GenJnLine."Document No." := Receipts."No.";
    //                             ;
    //                             GenJnLine."External Document No." := BankImportEntries1."Reference No.";
    //                             GenJnLine.Description := Format('Application for ' + Lines.Description, 50);
    //                             GenJnLine.Amount := -ApplicationAmount;
    //                             GenJnLine.Validate(GenJnLine.Amount);
    //                             GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
    //                             //GET THE Invoice posted
    //                             SalesInvoiceHeader.Reset;
    //                             SalesInvoiceHeader.SetRange("Sell-to Customer No.", "CustNo.");
    //                             SalesInvoiceHeader.SetRange("External Document No.", Receipts."No.");
    //                             SalesInvoiceHeader.SetRange(Closed, false);
    //                             if SalesInvoiceHeader.FindFirst then begin
    //                                 GenJnLine."Applies-to Doc. No." := SalesInvoiceHeader."No.";
    //                                 GenJnLine.Validate("Applies-to Doc. No.");
    //                             end;
    //                             GenJnLine."Bal. Account Type" := GenJnLine."account type"::"G/L Account";
    //                             GenJnLine."Bal. Account No." := CMSetup."Unnalocated Account";
    //                             if GenJnLine.Amount <> 0 then
    //                                 GenJnLine.Insert;

    //                             Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

    //                             Commit;
    //                         end
    //                     end
    //                 until Lines.Next = 0;
    //                 if BankImportEntries1.Amount = ApplicationAmount then begin
    //                     BankImportEntries1.Closed := true;
    //                     BankImportEntries1."Applied Amount" := ApplicationAmount;
    //                     BankImportEntries1."Remaining Amount" := BankImportEntries1.Amount - ApplicationAmount;
    //                     BankImportEntries1.Modify(true);
    //                     Receipts.Posted := true;
    //                     Receipts."Posted By" := UserId;
    //                     Receipts."Posted Date" := Today;
    //                     Receipts."Posted Time" := Time;
    //                     Receipts.Modify(true);
    //                 end;
    //                 if BankImportEntries1.Amount > ApplicationAmount then begin

    //                     BankImportEntries1."Applied Amount" := ApplicationAmount;
    //                     BankImportEntries1."Remaining Amount" := BankImportEntries1.Amount - ApplicationAmount;
    //                     BankImportEntries1.Modify(true);
    //                     Receipts.Posted := true;
    //                     Receipts."Posted By" := UserId;
    //                     Receipts."Posted Date" := Today;
    //                     Receipts."Posted Time" := Time;
    //                     Receipts.Modify(true);
    //                 end;
    //                 if BankImportEntries1.Amount < ApplicationAmount then begin
    //                     BankImportEntries1.Closed := true;
    //                     BankImportEntries1."Applied Amount" := ApplicationAmount;
    //                     BankImportEntries1.Modify(true);
    //                     Receipts."Remaining Amount" := Receipts.Amount - BankImportEntries1.Amount;
    //                     Receipts.Modify(true);
    //                 end;




    //             end

    //         end;

    //     end;

    //     local procedure "*************************Curriculum Development*************************"()
    //     begin
    //     end;


    //     procedure CreateSyllabusJob(var SyallabusReview: Record "Syllabus Review") CreatedJob: Boolean
    //     var
    //         JobTask: Record "Job Task";
    //         Job: Record Job;
    //         ProjectReviewTasks: Record "Project Review Tasks";
    //         ExaminationSetup: Record "Examination Setup";
    //     begin
    //         ExaminationSetup.Get;
    //         ExaminationSetup.TestField("Default Bill To Customer");
    //         Job.Reset;
    //         Job."No." := SyallabusReview."Application No.";
    //         Job."Bill-to Customer No." := ExaminationSetup."Default Bill To Customer";
    //         Job.Validate("Bill-to Customer No.");
    //         Job.Validate(Description, SyallabusReview."Syllabus Name" + '-' + SyallabusReview."Syllabus Type Name");
    //         Job."Creation Date" := Today;
    //         Job."Starting Date" := Today;
    //         Job."Document Type" := Job."document type"::"4";
    //         Job."Person Responsible" := SyallabusReview."Person Responsible";
    //         Job.Validate("Person Responsible");
    //         Job.Insert(true);
    //         ProjectReviewTasks.Reset;
    //         ProjectReviewTasks.SetRange("Type of Syllabus", SyallabusReview."Type of Syllabus");
    //         if ProjectReviewTasks.FindSet then begin
    //             repeat
    //                 JobTask."Job Task No." := ProjectReviewTasks.Code;
    //                 JobTask."Job No." := SyallabusReview."Application No.";
    //                 JobTask.Description := ProjectReviewTasks.Description;
    //                 JobTask.Insert(true);
    //             until ProjectReviewTasks.Next = 0;
    //         end;
    //         SyallabusReview.Status := SyallabusReview.Status::"Stakeholder Views";
    //         SyallabusReview."Project No." := Job."No.";
    //         SyallabusReview.Modify(true);
    //         Page.Run(85301, Job, Job."No.");
    //     end;


    //     procedure AppointTaskForce(Header: Record UnknownRecord51263)
    //     var
    //         ResourceLines: Record "Resource Accreditation Lines";
    //         JobPlanningLines: Record "Job Planning Line";
    //         LineNo: Integer;
    //     begin
    //         Header.TestField(Posted, false);
    //         Header.TestField("Start Date");
    //         Header.TestField("Tentative End Date");

    //         JobPlanningLines.Reset;
    //         if JobPlanningLines.FindLast then begin
    //             LineNo := JobPlanningLines."Line No.";
    //         end;
    //         ResourceLines.Reset;
    //         ResourceLines.SetRange("Resource Card No.", Header.Code);
    //         ResourceLines.SetRange("Job No", Header."Job No");
    //         ResourceLines.SetRange(Confirmed, true);
    //         ResourceLines.SetRange(Appoint, false);
    //         if ResourceLines.FindSet then begin

    //             repeat
    //                 JobPlanningLines.Init;
    //                 JobPlanningLines."Line No." := LineNo + 1;
    //                 JobPlanningLines."Job No." := ResourceLines."Job No";
    //                 JobPlanningLines."Job Task No." := ResourceLines."Job Task Code";
    //                 JobPlanningLines.Validate(Type, ResourceLines."Account Type");
    //                 JobPlanningLines.Validate("No.", ResourceLines."Account No");
    //                 JobPlanningLines."Planning Date" := Header."Start Date";
    //                 JobPlanningLines."Planned Delivery Date" := Header."Tentative End Date";
    //                 JobPlanningLines."Document No." := Header.Code;
    //                 JobPlanningLines.Quantity := ResourceLines.Quantity;
    //                 JobPlanningLines."Unit Cost" := ResourceLines.Amount;
    //                 JobPlanningLines."Work Type Code" := ResourceLines."Work Type";
    //                 JobPlanningLines.Validate("Work Type Code");
    //                 JobPlanningLines.Validate(Quantity);
    //                 JobPlanningLines.Validate("Unit Cost");
    //                 JobPlanningLines.Insert(true);
    //                 ResourceLines.Status := ResourceLines.Status::Completed;
    //                 LineNo := LineNo + 1;
    //                 ResourceLines.Appoint := true;
    //                 ResourceLines."Appointed On" := CurrentDatetime;
    //                 TaskForceInvitationEmail(ResourceLines);
    //                 ResourceLines.Notified := true;
    //                 ResourceLines."Notified On" := CurrentDatetime;
    //                 ResourceLines.Modify(true);
    //             until ResourceLines.Next = 0;
    //             Header.Posted := true;
    //             Header."Posted By" := UserId;
    //             Header."Posted Date" := Today;

    //             Message('Resources to the project %1, have been assigned succesfully and email notifications sent', ResourceLines."Job No");
    //         end else
    //             Message('There are no resources to appoint');
    //     end;


    //     procedure CloseSyllabusJob(var SyallabusReview: Record "Syllabus Review") CreatedJob: Boolean
    //     var
    //         JobTask: Record "Job Task";
    //         Job: Record Job;
    //         ProjectReviewTasks: Record "Project Review Tasks";
    //         ExaminationSetup: Record "Examination Setup";
    //         TXT001: label 'The review process %1 has been completed';
    //     begin
    //         Job.Reset;
    //         Job.SetRange("No.", SyallabusReview."Application No.");
    //         if Job.FindFirst then begin
    //             SyallabusReview.Status := SyallabusReview.Status::Completed;
    //             SyallabusReview.Modify(true);
    //             Job.Complete := true;
    //             Job.Status := Job.Status::Completed;
    //             Job.Validate(Status);
    //             Job."Completed (%)" := 100;
    //             Job.Modify(true);
    //             Message(TXT001, SyallabusReview."Syllabus Name");
    //         end;

    //     end;

    //     procedure TaskForceInvitationEmail(ResourceLines: Record "Resource Accreditation Lines")
    //     var
    //         AccreditationSetup: Record "Accreditation Setups";
    //         CompInfo: Record "Company Information";
    //         Window: Dialog;
    //         WindowisOpen: Boolean;
    //         SMTPMailSet: Record "Email Account";
    //         objCustomer: Record Resource;
    //         Customer: Code[30];
    //         Notification1: Codeunit "Email Message";
    //     begin
    //         SMTPMailSet.Get;
    //         objCustomer.Reset;//insert control to find a unique member
    //         objCustomer.Get(ResourceLines."Account No");//<a href="https://imis.cue.or.ke/">imis.cue.or.ke</a>
    //         Customer := ResourceLines."Account No";
    //         Notification1.CreateMessage('KASNEB', SMTPMailSet."Email Sender Address", objCustomer.Address, 'Invitation to Work Order',
    //                 'Dear ' + objCustomer.Name + ',<BR><BR>' +
    //                 ' KASNEB has identified you as a suitable Resource Person for the<B> ' + ' ' + UpperCase(ResourceLines."Job Task Description") + '</b> ' +
    //                 '<BR>' +
    //                 '', true);
    //         //change address to email
    //         Notification1.AppendToBody(
    //         '<BR><BR>SYLLABUS DEVELOPMENT,''<BR>' + CompInfo.Name + '<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
    //         Notification1.AddBCC(SMTPMailSet."Email Sender Address");
    //         Notification1.Send;
    //     end;


    //     procedure CreateSyllabusDraft(var SyallabusReview: Record "Syllabus Review")
    //     var
    //         SyllabusHeader: Record "Syllabus Header";
    //         SyllabusPapers: Record "Syllabus Papers";
    //         SyllabusPaperLine: Record "Syllabus Paper Line";
    //         ExaminationSetup: Record "Examination Setup";
    //         SyllabusRules: Record "Syllabus Rules and Regulations";
    //         SyllabusHeader1: Record "Syllabus Header";
    //         SyllabusPapers1: Record "Syllabus Papers";
    //         SyllabusPaperLine1: Record "Syllabus Paper Line";
    //         ExaminationSetup1: Record "Examination Setup";
    //         SyllabusRules1: Record "Syllabus Rules and Regulations";
    //         DraftNo: Code[30];
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         TXT001: label 'Draft syllabus no. %1 has been created succesfully';
    //     begin
    //         //create a new syllabus
    //         ExaminationSetup.Get;
    //         SyllabusHeader1.Init;
    //         if DraftNo = '' then begin
    //             ExaminationSetup.TestField("Draft Syllabus Nos.");
    //             NoSeriesMgt.InitSeries(ExaminationSetup."Draft Syllabus Nos.", ExaminationSetup."Draft Syllabus Nos.", 0D, DraftNo, ExaminationSetup."Draft Syllabus Nos.");
    //         end;
    //         SyllabusHeader1.Code := DraftNo;
    //         SyllabusHeader1."Original Syllabus No." := SyallabusReview."Syllabus No.";
    //         SyllabusHeader1.Description := SyallabusReview.Description;
    //         SyllabusHeader1."Domain Code" := SyallabusReview."Domain Code";
    //         SyllabusHeader1."Domain Name" := SyallabusReview."Domain Name";
    //         SyllabusHeader1."External Document No." := SyallabusReview."Application No.";
    //         SyllabusHeader1."Project ID" := SyallabusReview."Application No.";
    //         SyllabusHeader1.Status := SyllabusHeader1.Status::"Under Review";
    //         SyllabusHeader1."Created By" := UserId;
    //         SyllabusHeader1."Created On" := CurrentDatetime;
    //         SyllabusHeader1."Document Type" := SyllabusHeader1."document type"::Draft;
    //         SyllabusHeader1.Insert(true);

    //         SyllabusHeader.Reset;
    //         SyllabusHeader.SetRange(Code, SyallabusReview."Syllabus No.");
    //         if SyllabusHeader.FindFirst then begin
    //             //copy papers
    //             SyllabusPapers.Reset;
    //             SyllabusPapers.SetRange("Syllabus No.", SyllabusHeader.Code);
    //             if SyllabusPapers.FindSet then begin
    //                 repeat
    //                     SyllabusPapers1.Init;
    //                     SyllabusPapers1.TransferFields(SyllabusPapers);
    //                     SyllabusPapers1."Document Type" := SyllabusPapers1."document type"::Draft;
    //                     SyllabusPapers1."Syllabus No." := DraftNo;
    //                     SyllabusPapers1.Insert(true);

    //                 until SyllabusPapers.Next = 0;
    //             end;
    //             //COPY Paper details
    //             SyllabusPaperLine.Reset;
    //             SyllabusPaperLine.SetRange("Syllabus No.", SyallabusReview."Syllabus No.");
    //             if SyllabusPaperLine.FindSet then begin
    //                 repeat
    //                     SyllabusPaperLine1.Init;
    //                     SyllabusPaperLine1.TransferFields(SyllabusPaperLine);
    //                     SyllabusPaperLine1."Syllabus No." := DraftNo;
    //                     SyllabusPaperLine1.Insert(true);
    //                 until SyllabusPaperLine.Next = 0;
    //             end;
    //             //COPY Rules
    //             SyllabusRules.Reset;
    //             SyllabusRules.SetRange("Syllabus No.", SyallabusReview."Syllabus No.");
    //             if SyllabusRules.FindSet then begin
    //                 repeat
    //                     SyllabusRules1.Init;
    //                     SyllabusRules1.TransferFields(SyllabusRules);
    //                     SyllabusRules1."Syllabus No." := DraftNo;
    //                     SyllabusRules1.Insert(true);
    //                 until SyllabusRules.Next = 0;
    //             end;
    //             Message(TXT001, DraftNo);
    //         end


    //     end;


    //     procedure CreateSyllabusNew(var SyallabusReview: Record "Syllabus Review"; var VerdictDate: Date)
    //     var
    //         SyllabusHeader: Record "Syllabus Header";
    //         SyllabusPapers: Record "Syllabus Papers";
    //         SyllabusPaperLine: Record "Syllabus Paper Line";
    //         ExaminationSetup: Record "Examination Setup";
    //         SyllabusRules: Record "Syllabus Rules and Regulations";
    //         SyllabusHeader1: Record "Syllabus Header";
    //         SyllabusPapers1: Record "Syllabus Papers";
    //         SyllabusPaperLine1: Record "Syllabus Paper Line";
    //         ExaminationSetup1: Record "Examination Setup";
    //         SyllabusRules1: Record "Syllabus Rules and Regulations";
    //         DraftNo: Code[30];
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         TXT001: label 'The Syllabus no. %1 has been created succesfully and %2 marked as archive';
    //     begin
    //         //create a new syllabus
    //         ExaminationSetup.Get;
    //         SyllabusHeader1.Init;
    //         if DraftNo = '' then begin
    //             ExaminationSetup.TestField("Syllabus Nos.");
    //             NoSeriesMgt.InitSeries(ExaminationSetup."Syllabus Nos.", ExaminationSetup."Syllabus Nos.", 0D, DraftNo, ExaminationSetup."Syllabus Nos.");
    //         end;
    //         SyllabusHeader1.Code := DraftNo;
    //         SyllabusHeader1."Original Syllabus No." := SyallabusReview."Syllabus No.";
    //         SyllabusHeader1.Description := SyallabusReview.Description;
    //         SyllabusHeader1."Domain Code" := SyallabusReview."Domain Code";
    //         SyllabusHeader1."Domain Name" := SyallabusReview."Domain Name";
    //         SyllabusHeader1."External Document No." := SyallabusReview."Application No.";
    //         SyllabusHeader1."Project ID" := SyallabusReview."Application No.";
    //         SyllabusHeader1.Status := SyllabusHeader1.Status::Current;
    //         SyllabusHeader1."Created By" := UserId;
    //         SyllabusHeader1."Created On" := CurrentDatetime;
    //         SyllabusHeader1."Approval Date" := VerdictDate;
    //         SyllabusHeader1."Next Minor Review Date" := CalcDate('+3Y', VerdictDate);
    //         SyllabusHeader1."Next Major Review Date" := CalcDate('+5Y', VerdictDate);
    //         SyllabusHeader1."Document Type" := SyllabusHeader1."document type"::Syllabus;
    //         SyllabusHeader1.Insert(true);

    //         SyllabusHeader.Reset;
    //         SyllabusHeader.SetRange(Code, SyallabusReview."Syllabus No.");
    //         if SyllabusHeader.FindFirst then begin
    //             //copy papers
    //             SyllabusPapers.Reset;
    //             SyllabusPapers.SetRange("Syllabus No.", SyllabusHeader.Code);
    //             if SyllabusPapers.FindSet then begin
    //                 repeat
    //                     SyllabusPapers1.Init;
    //                     SyllabusPapers1.TransferFields(SyllabusPapers);
    //                     SyllabusPapers1."Document Type" := SyllabusPapers1."document type"::Syllabus;
    //                     SyllabusPapers1."Syllabus No." := DraftNo;
    //                     SyllabusPapers1.Insert(true);

    //                 until SyllabusPapers.Next = 0;
    //                 SyllabusHeader1."Course ID" := SyllabusPapers.Course;
    //                 SyllabusHeader1.Validate("Course ID");
    //                 SyllabusHeader1.Modify(true);
    //             end;
    //             //COPY Paper details
    //             SyllabusPaperLine.Reset;
    //             SyllabusPaperLine.SetRange("Syllabus No.", SyallabusReview."Syllabus No.");
    //             if SyllabusPaperLine.FindSet then begin
    //                 repeat
    //                     SyllabusPaperLine1.Init;
    //                     SyllabusPaperLine1.TransferFields(SyllabusPaperLine);
    //                     SyllabusPaperLine1."Syllabus No." := DraftNo;
    //                     SyllabusPaperLine1.Insert(true);
    //                 until SyllabusPaperLine.Next = 0;
    //             end;
    //             //COPY Rules
    //             SyllabusRules.Reset;
    //             SyllabusRules.SetRange("Syllabus No.", SyallabusReview."Syllabus No.");
    //             if SyllabusRules.FindSet then begin
    //                 repeat
    //                     SyllabusRules1.Init;
    //                     SyllabusRules1.TransferFields(SyllabusRules);
    //                     SyllabusRules1."Syllabus No." := DraftNo;
    //                     SyllabusRules1.Insert(true);
    //                 until SyllabusRules.Next = 0;
    //             end;
    //             Message(TXT001, DraftNo, SyallabusReview."Syllabus No.");
    //             SyllabusHeader.Status := SyllabusHeader.Status::Retired;
    //             SyllabusHeader.Modify(true);
    //         end


    //     end;


    //     procedure CreateSyllabusVersion(var SyallabusReview: Record "Syllabus Review"; var VerdictDate: Date)
    //     var
    //         SyllabusHeader: Record "Syllabus Header";
    //         SyllabusPapers: Record "Syllabus Papers";
    //         SyllabusPaperLine: Record "Syllabus Paper Line";
    //         ExaminationSetup: Record "Examination Setup";
    //         SyllabusRules: Record "Syllabus Rules and Regulations";
    //         SyllabusHeader1: Record "Syllabus Header";
    //         SyllabusPapers1: Record "Syllabus Papers";
    //         SyllabusPaperLine1: Record "Syllabus Paper Line";
    //         ExaminationSetup1: Record "Examination Setup";
    //         SyllabusRules1: Record "Syllabus Rules and Regulations";
    //         DraftNo: Code[30];
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         TXT001: label 'The Syllabus no. %1 has been created succesfully and %2 marked as archive';
    //     begin
    //         //create a new syllabus
    //         ExaminationSetup.Get;
    //         SyllabusHeader1.Init;
    //         SyllabusHeader1.Code := SyallabusReview."Syllabus No.";
    //         SyllabusHeader1."Original Syllabus No." := SyallabusReview."Syllabus No.";
    //         SyllabusHeader1.Description := SyallabusReview.Description;
    //         SyllabusHeader1."Domain Code" := SyallabusReview."Domain Code";
    //         SyllabusHeader1."Domain Name" := SyallabusReview."Domain Name";
    //         SyllabusHeader1."External Document No." := SyallabusReview."Application No.";
    //         SyllabusHeader1."Project ID" := SyallabusReview."Application No.";
    //         SyllabusHeader1.Status := SyllabusHeader1.Status::"Under Review";
    //         SyllabusHeader1."Created By" := UserId;
    //         SyllabusHeader1."Created On" := CurrentDatetime;
    //         SyllabusHeader1."Version No." := 1;
    //         SyllabusHeader1."Document Type" := SyllabusHeader1."document type"::Version;
    //         SyllabusHeader1.Insert(true);
    //         /*
    //         SyllabusHeader.RESET;
    //         SyllabusHeader.SETRANGE(Code,SyallabusReview."Syllabus No.");
    //         IF SyllabusHeader.FINDFIRST THEN BEGIN
    //           //copy papers
    //           SyllabusPapers.RESET;
    //           SyllabusPapers.SETRANGE("Syllabus No.",SyllabusHeader.Code);
    //           IF SyllabusPapers.FINDSET THEN BEGIN
    //             REPEAT
    //               SyllabusPapers1.INIT;
    //               SyllabusPapers1.TRANSFERFIELDS(SyllabusPapers);
    //               SyllabusPapers1."Document Type":=SyllabusPapers1."Document Type"::Version;
    //               SyllabusPapers1."Syllabus No.":=SyallabusReview."Syllabus No.";
    //               SyllabusPapers1.INSERT(TRUE);

    //            UNTIL SyllabusPapers.NEXT=0;
    //            SyllabusHeader1."Course ID":=SyllabusPapers.Course;
    //            SyllabusHeader1.VALIDATE("Course ID");
    //            SyllabusHeader1.MODIFY(TRUE);
    //            END;
    //            //COPY Paper details
    //            SyllabusPaperLine.RESET;
    //            SyllabusPaperLine.SETRANGE("Syllabus No.",SyallabusReview."Syllabus No.");
    //            IF SyllabusPaperLine.FINDSET THEN BEGIN
    //              REPEAT
    //                SyllabusPaperLine1.INIT;
    //                SyllabusPaperLine1.TRANSFERFIELDS(SyllabusPaperLine);
    //                SyllabusPaperLine1."Syllabus No.":=SyallabusReview."Syllabus No.";
    //                SyllabusPaperLine1.INSERT(TRUE);
    //              UNTIL SyllabusPaperLine.NEXT=0;
    //            END;
    //            //COPY Rules
    //            SyllabusRules.RESET;
    //            SyllabusRules.SETRANGE("Syllabus No.",SyallabusReview."Syllabus No.");
    //            IF SyllabusRules.FINDSET THEN BEGIN
    //              REPEAT
    //                SyllabusRules1.INIT;
    //                SyllabusRules1.TRANSFERFIELDS(SyllabusRules);
    //                SyllabusRules1."Syllabus No.":=SyallabusReview."Syllabus No.";
    //                SyllabusRules1.INSERT(TRUE);
    //              UNTIL SyllabusRules.NEXT=0;
    //            END;
    //             MESSAGE(TXT001,DraftNo,SyallabusReview."Syllabus No.");
    //             SyllabusHeader.Status:=SyllabusHeader.Status::Retired;
    //             SyllabusHeader.MODIFY(TRUE);
    //         END
    //         */


    //     end;

    //     local procedure "************Accreditation*************"()
    //     begin
    //     end;

    //     procedure AccreditationCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    //     var
    //         SalesInv: Record "Sales Header";
    //         SalesLine: Record "Sales Line";
    //         TXT004: label 'The invoice %1,has been sent to the student succesfuly';
    //         ExaminationSetup: Record "Examination Setup";
    //         AppNo: Code[30];
    //         Cust: Record Customer;
    //         Contact: Record Contact;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         CashMngmntSetup: Record "Cash Management  Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         NoSeries: Code[30];
    //         ExamFee: Record Resource;
    //         ExamFeeCost: Record "Resource Cost";
    //         Amount: Decimal;
    //         WorkType: Record "Work Type";
    //         Existing: Boolean;
    //         ExamAccountNo: Code[30];
    //         ResourcePrice: Record "Resource Price";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         Filelocation: Text;
    //         Filename: Text;
    //         LineNo: Integer;
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         Examination: Codeunit Examination;
    //         TXT001: label 'The invoice %1,has been created succesfully';
    //         SalesHeader: Record "Sales Header";
    //         TXT002: label 'An invoice %1 already exists for the application %2';
    //     begin
    //         SalesInv.Reset;
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if not SalesInv.FindFirst then begin
    //             SalesInv.Init;
    //             SalesInv."Document Type" := SalesInv."document type"::Invoice;
    //             SalesInv."No." := '';
    //             SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //             SalesInv."Document Date" := Today;
    //             SalesInv."Order Date" := Today;
    //             SalesInv."Posting Date" := Today;
    //             SalesInv."External Document No." := BulkProcessingHeader."No.";
    //             SalesInv.Type := SalesInv.Type::Normal;
    //             SalesInv."Prepayment %" := 100;//enforce prepayment`
    //             SalesInv.Insert(true);
    //             //get resource entry
    //             ResourcePrice.Reset;
    //             ResourcePrice.SetRange(Code, BulkProcessingHeader."Fee Type");
    //             if ResourcePrice.FindSet then begin
    //                 SalesLine.Init;
    //                 SalesLine."Document Type" := SalesLine."document type"::Invoice;
    //                 SalesLine."Document No." := SalesInv."No.";
    //                 SalesLine.Type := SalesLine.Type::Resource;
    //                 SalesLine."No." := ResourcePrice.Code;
    //                 SalesLine.Validate("No.");
    //                 SalesLine.Quantity := 1;
    //                 BulkProcessingHeader.CalcFields("Exemption Amount");
    //                 SalesLine."Unit Price" := BulkProcessingHeader."Exemption Amount";
    //                 SalesLine.Validate("Unit Price");
    //                 SalesLine.Validate(Quantity);
    //                 SalesLine.Insert(true);
    //             end;

    //             BulkProcessingHeader."Exemption Invoice No." := SalesInv."No.";
    //             BulkProcessingHeader.Modify;
    //             Message(TXT001, SalesInv."No.");
    //             //send email pro-forma

    //             ExaminationSetup.Get;
    //             Email2 := ExaminationSetup."Registration Sender Email";
    //             //SMTP.Create('KASNEB STUDENT EXEMPTION', Email2, BulkProcessingHeader.Email,
    //             'KASNEB STUDENT EXEMPTION',
    //              'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
    //              'Your exemption request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
    //              'Find attached the invoice for payment', true);
    //             Filename := BulkProcessingHeader."Student No." + '.pdf';
    //             Filelocation := ExaminationSetup."Examination Path" + Filename;
    //             SalesHeader.Reset;
    //             SalesHeader.SetRange("No.", SalesInv."No.");
    //             if SalesHeader.FindFirst then begin
    //                 //Report.SaveAsPdf(1302, Filelocation, SalesHeader);

    //             end;
    //             //SMTP.AddAttachment(Filelocation, Filename);
    //             //SMTP.AddBCC(Email2);
    //             //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //             //SMTP.AppendToBody('<BR><BR>KASNEB STUDENT REGISTRATION<BR><BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
    //             ////SMTP.Send();
    //             Message(TXT004, SalesInv."No.");
    //         end else
    //             Error(TXT002, SalesInv."No.", BulkProcessingHeader."No.");
    //     end;

    //     procedure AccreditationCreatReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    //     var
    //         ReceiptHeader: Record "Receipts Header1";
    //         SalesInv: Record "Sales Header";
    //         ReceiptLines: Record "Receipt Lines1";
    //         ExaminationSetup: Record "Examination Setup";
    //         AppNo: Code[30];
    //         Cust: Record Customer;
    //         Contact: Record Contact;
    //         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    //         CashMngmntSetup: Record "Cash Management Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         NoSeries: Code[30];
    //         ExamFee: Record Resource;
    //         ExamFeeCost: Record "Resource Cost";
    //         Amount: Decimal;
    //         WorkType: Record "Work Type";
    //         Existing: Boolean;
    //         ExamAccountNo: Code[30];
    //         ResourcePrice: Record "Resource Price";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //         Filelocation: Text;
    //         Filename: Text;
    //         LineNo: Integer;
    //         ExamBookingEntries: Record "Exam Booking Entries";
    //         Examination: Codeunit Examination;
    //         CustLedgerEntry: Record "Cust. Ledger Entry";
    //     begin
    //         //code to post the created invoice
    //         SalesInv.Reset;
    //         SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
    //         SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
    //         if SalesInv.Find('-') then begin
    //             SalesPostYesNo.Run(SalesInv);
    //             Message('Invoice %1 has been posted Successfully', SalesInv."No.");
    //             CashMngmntSetup.Get();
    //             NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
    //             ReceiptHeader.Init;
    //             ReceiptHeader."No." := NoSeries;
    //             ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
    //             ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
    //             ReceiptHeader.Insert(true);
    //             ReceiptLines.Init;
    //             ReceiptLines."Receipt No." := ReceiptHeader."No.";
    //             ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
    //             ReceiptLines."Applies to Doc. No" := SalesInv."No.";
    //             ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
    //             ReceiptLines.Validate("Account No.");
    //             //get posted invoice number
    //             CustLedgerEntry.Reset;
    //             CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
    //             CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
    //             if CustLedgerEntry.FindFirst then begin
    //                 ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
    //                 ReceiptLines.Validate("Applies to Doc. No");
    //             end;
    //             ReceiptLines.Insert(true);
    //             Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
    //         end;
    //         BulkProcessingHeader."Exemption Receipt 6No." := ReceiptHeader."No.";
    //         BulkProcessingHeader.Modify;
    //     end;

    //     procedure AccreditationSendRegretEmail(StudentUser: Record "Student Processing Header")
    //     var
    //         ContactUsers: Record Contact;
    //         ExaminationSetup: Record "Examination Setup";
    //         Email2: Text;
    //         SMTP: Codeunit "Email Message";
    //         Body: Text;
    //     begin
    //         ExaminationSetup.Get;
    //         Email2 := ExaminationSetup."Registration Sender Email";
    //         //SMTP.Create('KASNEB STUDENT REGISTRATION', Email2, StudentUser.Email,
    //         'KASNEB STUDENT REGISTRATION',
    //          'Dear ' + StudentUser."Student Name" + ',<BR><BR>' +
    //          'Your registration request done on <b>' + ' ' + Format(StudentUser."Created On") + ' ' + '</b> has been rejected.<BR>' +
    //          'The following are/is the reason for rejection.' + StudentUser."Reason for Rejection" + '', true);
    //         //SMTP.AddBCC(Email2);
    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
    //         //SMTP.AppendToBody('<BR><BR>KASNEB Registration Department.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
    //         //SMTP.Send();

    //     end;
}

