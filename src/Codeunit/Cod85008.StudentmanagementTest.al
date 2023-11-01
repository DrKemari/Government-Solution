#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 85008 StudentmanagementTest
{

    trigger OnRun()
    begin

        // MESSAGE(PrintWithdrawalSummery('WDR00207'));
        // MESSAGE(FORMAT(fnGetCustomerPicture('ST00351098')));
        // ExaminationResults.RESET;
        // ExaminationResults.SETRANGE("Student Reg No.", 'ATD/163');
        // ExaminationResults.SETRANGE("Examination Sitting ID", 'DECEMBER 2021');
        // IF ExaminationResults.FINDSET THEN BEGIN

        //     REPORT.RUN(85016, TRUE, FALSE, ExaminationResults);
        // END;
        // MESSAGE(ResultSlip('ATD/163', 'DECEMBER 2021'));
        // MESSAGE(FnCenterRecollocate('BK0004959', 'NAC/316493', '16', '45', '453', '411'));
        // MESSAGE(fnGetExaminationResults('26764900'));
        // MESSAGE(FnGetStudentUser('abdikadirmunira3@gmail.com', 'tesd'));
        // MESSAGE(FnConfirmation('ST00351098', 'ATD/26010', '', ''));
        // MESSAGE(GenerateTimetable('TT0000008'));
    end;

    var
        Text000: label 'An image with the following ID has been imported on item %1: %2';
        FILESPATH2: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\invoice\';
        FILESPATH: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\receipt\';
        FILESPATH4: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\Rename\';
        FILESPATH3: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\proforma\';
        FILESPATH6: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\test\';
        FILESPATH1: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\withdrawal\';
        FILESPATH7: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\timetable\';
        FILESPATH8: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\studentTimetable\';
        FILESPATH9: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\SubmitInvoice\';
        FILESPATH10: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\ExemptionLetter\';
        FILESPATH11: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\BooingInvoice\';
        FILESPATH12: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\RenewalInvoice\';
        studentProcessingHeader: Record "Student Processing Header";
        studentprocessingLines: Record "Student Processing Lines";
        ReportSelections: Record "Report Selections";
        appNo: Code[50];
        ExceptionQualification: Record "Exemption Qualifications";
        ExaminationCodeunit: Codeunit Examination;
        SMTP: Codeunit "Email Message";
        SMTPMailSetup: Record "Examination Setup";
        Email2: Text;
        Body: Text;
        FileName: Text;
        FILESPATH13: label 'C:\inetpub\wwwroot\StudentPortalTest\downloads\ResultSlip\';
        ExaminationResults: Record "Examination Results";
        DynasoftPortalUser: Record "Dynasoft Portal User";
        FILESPATH14: label 'C:\inetpub\wwwroot\StudentPortalTest\DeffermentInvoice\';
        ExamBookingEntries: Record "Exam Booking Entries";
        StudentBookingLines: Record "Student Processing Lines";
        Examination: Codeunit Examination;
        EntryNo: Integer;

    procedure FnRegistration(firstname: Text; middlename: Text; lastname: Text; address: Text; postcode: Text; city: Text; phoneNumber: Text; email: Text; country: Text) status: Text
    var
        ApplicantProfile: Record Customer;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", email);
        if Contact.FindSet then begin
            status := 'found*Another Applicant with the given email address exists!';
        end else begin
            MarketingSetup.Get;
            Contact.Init;
            Contact."No." := NoSeriesManagement.GetNextNo(MarketingSetup."Contact Nos.", Today, true);
            Contact.Name := firstname + ' ' + lastname + ' ' + middlename;
            Contact."Post Code" := postcode;
            Contact.Address := address;
            Contact.City := city;
            Contact."Country/Region Code" := country;
            Contact.Type := Contact.Type::Person;
            Contact."Record Type" := Contact."record type"::Student;
            Contact.Student := Contact.Student::New;
            Contact."Phone No." := phoneNumber;
            Contact."E-Mail" := email;
            if Contact.Insert(true) then begin
                FnCreateApplicantAccountRequest(email);
                FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(Contact);
                //FnSendEmaiNotificationOnApplicantAccountActivation(Contact);
                status := 'success*Your Aplicant account was successfully created. Please log in to complete your profile!';
            end else begin
                status := 'danger*Your Aplicant account was not created successfully.Kindly Contact System Administrator';
            end;
        end;
        exit(status);
    end;

    procedure FnCreateApplicantAccountRequest(emailaddress: Text) status: Text
    var
        PortalUSer: Record "Dynasoft Portal User";
        RandomDigit: Text[50];
        entryno: Integer;
        ApplicantProfile: Record Customer;
        HumanResourcesSetup: Record "Examination Setup";
        Contact: Record Contact;
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        /*Contact.RESET;
        Contact.SETRANGE("E-Mail",emailaddress);
        IF Contact.FINDSET THEN BEGIN
        HumanResourcesSetup.GET;
       ApplicantProfile.RESET;
       ApplicantProfile.SETRANGE("E-Mail",emailaddress);
       IF NOT ApplicantProfile.FINDSET THEN BEGIN
        ApplicantProfile.INIT;
        ApplicantProfile."No.":=NoSeriesMgt.GetNextNo(HumanResourcesSetup."Student Nos.",TODAY,TRUE);
        ApplicantProfile.Name:=Contact.Name;
        ApplicantProfile."Customer Type":=ApplicantProfile."Customer Type"::Student;
        ApplicantProfile."Funding Class":=ApplicantProfile."Funding Class"::Student;

        ApplicantProfile."E-Mail":=Contact."E-Mail";
        ApplicantProfile."Post Code":=Contact."Post Code";
        ApplicantProfile.City:=Contact.City;
        ApplicantProfile.Address:=Contact.Address;
        ApplicantProfile."Phone No.":=Contact."Phone No.";
        IF ApplicantProfile.INSERT(TRUE) THEN BEGIN*/
        // Update Dynasoft Portal user;
        PortalUSer.Reset;
        PortalUSer.SetRange("Authentication Email", emailaddress);
        if not PortalUSer.FindSet then begin
            PortalUSer.Init;
            PortalUSer."User Name" := Contact.Name;
            PortalUSer."Full Name" := Contact.Name;
            PortalUSer."Authentication Email" := Contact."E-Mail";
            PortalUSer."Mobile Phone No." := Contact."Phone No.";
            PortalUSer.State := PortalUSer.State::Enabled;
            PortalUSer."Record Type" := PortalUSer."record type"::Customer;
            PortalUSer."Record ID" := ApplicantProfile."No.";
            RandomDigit := CreateGuid;
            RandomDigit := DelChr(RandomDigit, '=', '{}-01');
            RandomDigit := CopyStr(RandomDigit, 1, 8);
            PortalUSer."Password Value" := RandomDigit;
            PortalUSer."Last Modified Date" := Today;
            PortalUSer.Insert;
            // END;
            //IF PortalUSer.INSERT(TRUE) THEN BEGIN;
            //END;
        end;
        /*END;
        END;
        END;*/

    end;

    procedure FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(ApplicantRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // "Object": Record "Object";
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
        SupplierDetails: Text[250];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[250];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        HRSetupNew: Record "Examination Setup";
    begin
        CompInfo.Get;
        HRSetup.Get;
        HRSetupNew.Get;
        RequesterEmail := ApplicantRequest."E-Mail";
        RequesterName := ApplicantRequest.Name;
        Counter := Counter + 1;
        if HRSetup."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := HRSetupNew."Registration Sender Email";
        if HRSetupNew."Registration Sender Email" = '' then
            Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
        CustEmail := HRSetupNew."Registration Sender Email";
        CompanyDetails := 'Dear,' + ApplicantRequest.Name + '<BR>';
        SenderMessage := '<BR>Thank you for using our e-student Portal which has been established to provide you with easy access to our online student services such as e-registration.' +
        'This email is to acknowledge that your Request for registration as a student, done on: ' + Format(ApplicantRequest."Last Date Modified") +
        'has been received, summarized as follows:' + '<BR></BR>';
        SupplierDetails := 'Registration Request Reference No:' + ApplicantRequest."No." + '<BR></BR>' + '<b>Full Names:</b>' + ApplicantRequest.Name + '<BR></BR>' +
        '<b>KRA Registration (PIN) No:</b>' + ApplicantRequest."VAT Registration No." + '<BR></BR>' + '<b>Primary Email Address<b>:' + ApplicantRequest."E-Mail" + '<BR></BR>' +
        '<b>Mobile Phone No:<b>' + ApplicantRequest."Phone No." + '<BR></BR>';
        if CustEmail = '' then
            exit;
        emailhdr := 'e-registration Acknowledgment (Reference No:' + ApplicantRequest."No." + ')';
        // cu400.Create(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
        // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
        // cu400.AddBCC(HRSetupNew."Student Module EMail BCC");
        // cu400.AppendToBody(CompanyDetails);
        // cu400.Send;
        SendingDate := Today;
        SendingTime := Time;
        Sleep(1000);
        Window.Close;
    end;

    procedure FnSendEmaiNotificationOnApplicantAccountActivation(ApplicantRequest: Record "Dynasoft Portal User")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        "Object": Record "Object";
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
        emailBody1: Text;
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
        SenderAddress := HRSetupNew."Registration Sender Email";
        if HRSetupNew."Registration Sender Email" = '' then
            Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
        CustEmail := HRSetupNew."Registration Sender Email";
        CompanyDetails := 'Dear ' + ApplicantRequest."Full Name" + ',' + '<BR>';
        SenderMessage := 'Your student account has been created on the e-HRMPEB portal. Your registration details are as follows:</BR>' + '</BR></BR>';
        SupplierDetails := '</BR>' + '<BR></BR> Name:</>' + ApplicantRequest."Full Name" + '</BR>' +
        '<BR>Mobile Phone No:' + ApplicantRequest."Mobile Phone No." + '</BR>' + '</BR></BR>';
        LoginDetails := '</BR>' + '<BR></BR>We have also created your portal access account with the following login credentials:' + '<BR></BR>' +
        'User Name: ' + ApplicantRequest."Authentication Email" + '<BR></BR>' + 'Password: ' + ApplicantRequest."Password Value";
        ActivationDetails := '<BR></BR>To access the HRMPEB services, login to the e-HRMPEB portal.</BR></BR>.' + ' Use this e-HRMPEB link .' + ' ' + '<b><a href="online.hrmpeb/ ">to access the portal and login</a></b><BR>';

        if CustEmail = '' then
            exit;
        emailhdr := 'Student Account Activation (Applicant Id No:' + ApplicantRequest."Id Number" + ')';
        // cu400.Create(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
        // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
        // //cu400.AddCC(RequesterEmail);
        // // cu400.AddBCC(HRSetupNew."Student Module EMail BCC");
        // cu400.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examinations <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
        // cu400.Send;
        //emailBody := CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails;
        emailBody1 := CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails;
        SendEmailNotification(RequesterEmail, emailhdr, emailBody1);
        //SendEmailNotification(RequesterEmail, emailhdr, CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails);

        SendingDate := Today;
        SendingTime := Time;
        // SLEEP(1000);
        // Window.CLOSE;
        /*CompInfo.GET;
       HRSetup.GET;
       HRSetupNew.GET;
       RequesterEmail:=ApplicantRequest."E-Mail";
       RequesterName:=ApplicantRequest.Name;
       Counter:=Counter+1;
       PortalUser.RESET;
       PortalUser.SETRANGE("Authentication Email",ApplicantRequest."E-Mail");
       IF PortalUser.FINDSET THEN
         Password:=PortalUser."Password Value";
       IF HRSetup."E-Mail"='' THEN
         ERROR('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
       SenderAddress:=HRSetup."E-Mail";
       IF HRSetupNew."HR E-mail Address" = '' THEN
         ERROR('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
         CustEmail:=HRSetupNew."HR E-mail Address";
       CompanyDetails:='Dear,'+ApplicantRequest.Name+'<BR>';
       SenderMessage:='<BR>Please note that your Applicant account has been created on our System, with the following key registration details:</BR>'+'<BR></BR>';
       SupplierDetails:*/

    end;

    procedure FnResetPassword(emailaddress: Text) passChangestatus: Text
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        RandomDigit: Text;
        Body: Text;
    begin
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        DynasoftPortalUser.SetRange(DynasoftPortalUser.State, DynasoftPortalUser.State::Enabled);
        if DynasoftPortalUser.FindSet then begin
            RandomDigit := CreateGuid;
            RandomDigit := DelChr(RandomDigit, '=', '{}-01');
            RandomDigit := CopyStr(RandomDigit, 1, 8);
            DynasoftPortalUser."Password Value" := RandomDigit;
            DynasoftPortalUser."Last Modified Date" := Today;
            DynasoftPortalUser."Change Password" := false;
            DynasoftPortalUser."Record Type" := DynasoftPortalUser."record type"::Customer;
            if DynasoftPortalUser.Modify(true) then begin
                passChangestatus := 'success*Password Reset Successfully';
                ResetSendEmail(emailaddress);
            end else begin
                passChangestatus := 'danger*The Password was Not Modified';
            end;
        end else begin
            passChangestatus := 'emailnotfound*Email Address is Missing';
        end;
    end;

    procedure ResetSendEmail(emailaddress: Text)
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        SMTPMailSetup: Record "Email Account";
        Email2: Text;
        Body: Text;
        SMTP: Codeunit "Email Message";
        HRSetupNew: Record "Examination Setup";
        emailhdr: Text;
        emailBody: Text;
    begin
        HRSetupNew.Get;
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        if DynasoftPortalUser.FindSet then begin
            //SMTPMailSetup.Get;
            // Email2:= SMTPMailSetup."Email Sender Address";
            //Email2 := HRSetupNew."Registration Sender Email";
            //Body := 'Student Password Reset';
            //SMTP.Create('Student Password Reset', Email2, emailaddress,
            //    'Student Password Reset',
            //    'Dear ' + DynasoftPortalUser."Full Name" + ',<BR><BR>' +
            //    'Your Password for the account <b>' + ' ' + Format(DynasoftPortalUser."Authentication Email") + ' ' + '</b> has been Reset Successfully.Kindly Change your Password on Login<BR>' +
            //    'Use the following link to acess the student Portal.' + ' ' + '<b><a href="http://online.hrmpeb.or.ke/">Student Portal</a></b><BR>Your New Credentials are:'
            //    + '<BR>'
            //    + 'Username:' + ' <b>' + DynasoftPortalUser."Authentication Email" + '</b><BR>Password:' + ' <b>' + DynasoftPortalUser."Password Value" + '</b>'
            //  , true);
            //     //SMTP.AddBCC(HRSetupNew."Student Module EMail BCC");
            //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examinations <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
            //SMTP.Send();           

            emailBody := 'Dear ' + DynasoftPortalUser."Full Name" + ',<BR><BR>' +
               'Your Password for the account <b>' + ' ' + Format(DynasoftPortalUser."Authentication Email") + ' ' + '</b> has been Reset Successfully.Kindly Change your Password on Login<BR>' +
               'Use the following link to acess the student Portal.' + ' ' + '<b><a href="http://online.hrmpeb.or.ke/">Student Portal</a></b><BR>Your New Credentials are:'
               + '<BR>'
               + 'Username:' + ' <b>' + DynasoftPortalUser."Authentication Email" + '</b><BR>Password:' + ' <b>' + DynasoftPortalUser."Password Value" + '</b>';

            emailhdr := 'Student Password Reset';

            SendEmailNotification(emailaddress, emailhdr, emailBody);

        end;
    end;

    procedure FnChangeStudentPassword(emailaddress: Text; currentPassword: Text; newPassword: Text; confirmNewPassword: Text) status: Text
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
    begin

        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        DynasoftPortalUser.SetRange(DynasoftPortalUser.State, DynasoftPortalUser.State::Enabled);
        if DynasoftPortalUser.FindSet then begin
            if DynasoftPortalUser."Password Value" = currentPassword then begin
                if newPassword = confirmNewPassword then begin
                    DynasoftPortalUser."Password Value" := newPassword;
                    DynasoftPortalUser."Change Password" := true;
                    DynasoftPortalUser."Last Modified Date" := Today;
                    if DynasoftPortalUser.Modify(true) then begin
                        status := 'success*Your password was successfully changed';
                    end else begin
                        status := 'danger*Your password could not be reset';
                    end;
                end else begin
                    status := 'password mismatch*New password and Confirmed new password do not match';
                end;
            end else begin
                status := 'worng current password*Wrong current password.Kindly Ensure that the Current Password is Correct';
            end;
        end else begin
            status := 'no student found*The specified Email Address does not exist';
        end;
    end;

    procedure FnApplicantProfileRegistration(applicantNumber: Text; surname: Text; firstname: Text; othernames: Text; gender: Integer; idnumber: Code[25]; dateofbirth: Date; county: Text; address: Code[50]; postalcodes: Code[50]; email: Text; city: Text; phoneNumber: Text; fileName: Text; project: Code[50]; courseId: Code[50]; countryId: Code[50]; address2: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        Applicant: Record "Student Processing Header";
        importFile: File;
        imageInstream: InStream;
        imageID: Guid;
        Header: Record "Student Processing Header";
    begin
        Applicant.Reset;
        Applicant.SetRange("No.", applicantNumber);
        if Applicant.FindSet then begin
            Applicant."Document Type" := Applicant."document type"::Registration;
            Applicant."First Name" := UpperCase(firstname);
            Applicant.Validate("First Name");
            Applicant."Middle Name" := UpperCase(othernames);
            Applicant.Validate("Middle Name");
            Applicant.Surname := UpperCase(surname);
            Applicant.Validate(Surname);
            Applicant.Email := email;
            Applicant."Student Name" := UpperCase(firstname) + ' ' + UpperCase(othernames) + ' ' + UpperCase(surname);
            Applicant.Validate("Student Name");
            Applicant.Gender := gender;
            Applicant."Document Type" := Applicant."document type"::Registration;
            Applicant."ID Number/Passport No." := idnumber;
            Applicant."Date of Birth" := dateofbirth;
            Applicant.County := county;
            Applicant.Address := address;
            Applicant."Address 2" := address2;
            Applicant.Type := Applicant.Type::New;
            Applicant.City := city;
            Applicant."Post Code" := postalcodes;
            Applicant."Country/Region Code" := countryId;
            Applicant."Phone No." := phoneNumber;
            Applicant.Validate("Country/Region Code");
            //Applicant."Address 2":=postalAddress;
            Applicant."Examination Project Code" := project;
            Applicant.Validate("Examination Project Code");

            Applicant."Examination ID" := courseId;
            Applicant.Validate("Examination ID");
            Applicant."Fee Type" := GetWorkType(courseId);
            Applicant.Validate("Fee Type");

            Applicant.Date := Today;
            Applicant."Registration Date" := Today;

            if Applicant.Modify(true) then begin

                status := 'success*Your Registration  was successfully modified. Please proceed!*' + Applicant."No.";
                FnUploadProfilePhoto(idnumber);
            end
            else begin
                status := 'danger*Your Registration account was not created successfully.Kindly Contact System Administrator';
            end;
        end else begin
            Applicant.Reset;
            Applicant.SetRange("No.", applicantNumber);
            Applicant.SetRange("Approval Status", Header."approval status"::Rejected);
            if Applicant.FindSet then begin
                Applicant.Date := Today;
                if Applicant.Modify(true) then begin

                    status := 'success*Your Registration  was successfully captured. Please proceed!*' + Applicant."No.";
                    FnUploadProfilePhoto(idnumber);
                end
                else begin
                    status := 'danger*Your Registration account was not created successfully.Kindly Contact System Administrator';
                end;

            end else begin
                //check for an existing application
                Header.Reset;
                Header.SetRange("Document Type", Header."document type"::Registration);
                Header.SetRange("ID Number/Passport No.", idnumber);
                Header.SetRange("Approval Status", Header."approval status"::Open);
                if not Header.FindSet then begin
                    Applicant."Document Type" := Applicant."document type"::Registration;
                    Applicant."First Name" := UpperCase(firstname);
                    Applicant.Validate("First Name");
                    Applicant."Middle Name" := UpperCase(othernames);
                    Applicant.Validate("Middle Name");
                    Applicant.Surname := UpperCase(surname);
                    Applicant.Validate(Surname);
                    /*
                    Applicant."First Name":=firstname;
                    Applicant."Middle Name" := othernames;
                    Applicant.Surname:=surname;*/
                    Applicant."Student Name" := UpperCase(firstname) + ' ' + UpperCase(othernames) + ' ' + UpperCase(surname);
                    //Applicant."Student Name":=firstname +' '+ othernames +' '+surname;
                    Applicant.Gender := gender;
                    Applicant."ID Number/Passport No." := idnumber;
                    Applicant."Date of Birth" := dateofbirth;
                    Applicant.County := county;
                    Applicant.Address := address;
                    Applicant."Address 2" := address2;
                    Applicant.City := city;
                    Applicant.Email := email;
                    Applicant."Examination Project Code" := project;
                    Applicant.Validate("Examination Project Code");
                    Applicant."Examination ID" := courseId;
                    Applicant.Validate("Examination ID");
                    Applicant."Fee Type" := GetWorkType(courseId);
                    Applicant."Post Code" := postalcodes;
                    Applicant."Registration Date" := Today;
                    Applicant.Date := Today;
                    Applicant.Portal := true;
                    Applicant."Country/Region Code" := countryId;
                    Applicant."Phone No." := phoneNumber;
                    Applicant.Validate("Country/Region Code");
                    Applicant.Validate("Fee Type");

                    if Applicant.Insert(true) then begin

                        status := 'success*Your Registration  was successfully captured. Please proceed to complete your profile!*' + Applicant."No.";

                        FnUploadProfilePhoto(idnumber);

                    end else begin
                        status := 'danger*Your Registration  was not successfully captured.Kindly Contact System Administrator';
                    end;
                end else
                    //status := 'danger*You have an existing application for the selected examination';
                    status := 'danger*You have an existing new student application that is pending approval. Kindly wait for feedback before proceeding. Thank you.  ';
            end;
        end;
        exit(status);

    end;

    procedure FnExistingStudent(applicantNumber: Code[50]; examCode: Code[50]; StudentNo: Code[50]; Project: Code[50]) status: Text
    var
        Applicant: Record "Student Processing Header";
        Header: Record "Student Processing Header";
    begin
        Applicant.Reset;
        Applicant.SetRange("No.", applicantNumber);

        if Applicant.FindSet then begin
            Applicant."No." := applicantNumber;
            //          Applicant."Document Type":=Applicant."Document Type"::Registration;
            //          Applicant.Type:=Applicant.Type::Existing;
            //          Applicant."Student No.":=StudentNo;
            //          Applicant.VALIDATE("Student No.");
            //          Applicant."Examination Project Code":=Project;
            //          Applicant.VALIDATE("Examination Project Code");
            //Applicant."Examination ID":=examCode;
            // Applicant.VALIDATE("Examination ID");
            //           Applicant."Fee Type":= GetWorkType(examCode);
            //          Applicant.VALIDATE("Fee Type");
            //Applicant."Examination Center Code":=examcenter;
            //Applicant.VALIDATE("Examination Center Code");
            // Applicant."Training Institution Code" := trainingInst;
            // Applicant.Validate("Training Institution Code");
            Applicant.Date := Today;
            Applicant."Registration Date" := Today;

            if Applicant.Modify(true) then begin
                status := 'success*Your registration for ' + examCode + 'was successfully modified. Please proceed. !*' + Applicant."No.";
                FnUploadProfilePhoto(Applicant."ID Number/Passport No.");

            end else begin
                status := 'danger*Your registration for ' + examCode + 'was was not modified successfully.Kindly Contact System Administrator';
            end;
        end else begin
            Header.Reset;
            Header.SetRange("Document Type", Header."document type"::Registration);
            Header.SetRange("Student No.", StudentNo);
            Header.SetRange("Examination ID", examCode);
            if Applicant.FindSet then begin
                status := 'danger*You have an existing application for the selected examination';
            end
            else begin
                Header.Reset;
                Header.SetRange("Document Type", Header."document type"::Registration);
                Header.SetRange(Type, Header.Type::Existing);
                Header.SetRange("Student No.", StudentNo);
                if Applicant.FindSet then begin
                    status := 'danger*You have an existing application for the selected examination';
                end
                else begin
                    Applicant.Init;
                    Applicant."Document Type" := Applicant."document type"::Registration;
                    Applicant.Type := Applicant.Type::Existing;
                    Applicant."Student No." := StudentNo;
                    Applicant.Validate("Student No.");
                    //Applicant."Examination Project Code":=Project;
                    //Applicant.VALIDATE("Examination Project Code");
                    Applicant."Examination Sitting" := Project;
                    Applicant.Validate("Examination Sitting");
                    Applicant."Examination ID" := examCode;
                    Applicant.Validate("Examination ID");
                    Applicant."Fee Type" := GetWorkType(examCode);
                    Applicant.Validate("Fee Type");
                    //Applicant."Examination Center Code":=examcenter;
                    //Applicant.VALIDATE("Examination Center Code");
                    // Applicant."Training Institution Code" := trainingInst;
                    // Applicant.Validate("Training Institution Code");
                    Applicant.Date := Today;
                    Applicant."Registration Date" := Today;


                    if Applicant.Insert(true) then begin
                        status := 'success*Your registration for ' + examCode + ' was successfully created. Please proceed to payment!*' + Applicant."No.";
                        FnUploadProfilePhoto(Applicant."ID Number/Passport No.");
                    end else begin
                        status := 'danger*Your registration for ' + examCode + ' was not created successfully.Kindly Contact System Administrator';
                    end;
                end;
            end;
        end;
        exit(status);
    end;

    local procedure getExemptionLineNo(applicationNo: Code[50]): Integer
    var
        lineNo: Integer;
        exemptionLine: Record "Exemption Lines";
    begin
        lineNo := 0;
        exemptionLine.Reset;
        exemptionLine.SetRange("Header No.", applicationNo);

        if exemptionLine.FindSet then begin
            repeat
                if exemptionLine."Line No." > lineNo then begin
                    lineNo := exemptionLine."Line No.";
                end;
            until exemptionLine.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure CreateDeffermentLine(bookingtype: Option; "part": Code[50]; section: Code[50]; paper: Code[50]; currency: Code[50]; applicationNo: Code[50]) status: Text
    begin
        status := 'danger*Your Defferment Line could not be added';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."approval status"::Open);
        studentProcessingHeader.SetRange("No.", applicationNo);


        if studentProcessingHeader.FindSet then begin
            if (studentProcessingHeader."Document Type" = studentProcessingHeader."document type"::Defferment) then begin
                if studentProcessingHeader."Document Type" = studentProcessingHeader."document type"::Defferment then begin
                    studentprocessingLines."Document Type" := studentprocessingLines."document type"::Defferment
                end;
                studentprocessingLines.Init;
                //Document Type,Document No.,Line No.
                studentprocessingLines."Course Id" := studentProcessingHeader."Examination ID";
                studentprocessingLines."Booking Type" := bookingtype;
                // studentprocessingLines."Booking Type":=studentprocessingLines."Booking Type"::Section;
                //studentprocessingLines.VALIDATE("Booking Type");
                studentprocessingLines."Line No." := getDeffermentLineNo(studentprocessingLines."Document Type", studentProcessingHeader."No.");
                studentprocessingLines.Validate("Line No.");
                studentprocessingLines.Part := part;
                //studentprocessingLines.VALIDATE(Part);
                studentprocessingLines.Section := section;
                // studentprocessingLines.VALIDATE(Section);
                studentprocessingLines.Paper := paper;
                studentprocessingLines.Validate(Paper);
                studentprocessingLines."Currency Code" := currency;
                studentprocessingLines.Validate("Currency Code");

                studentprocessingLines."Booking Header No." := studentProcessingHeader."No.";
                studentprocessingLines.Validate("Booking Header No.");

                if studentprocessingLines.Insert(true) then begin

                    studentprocessingLines.Modify(true);
                    status := 'success*The Defferment was successfully added';
                end else begin
                    status := 'danger*Your Defferment details could not be added';
                end;
            end;
        end else begin
            status := 'danger*A Defferment with the given number does not exist,';
        end;
        exit(status);
    end;

    procedure CreateDefferment(applicationNo: Code[250]; studentNo: Code[50]; regNo: Text; withdrawalReason: Text; examCycle: Code[50]; preferedExamCenter: Code[50]) status: Text
    var
        myType: Text;
    begin
        status := 'danger*Your Defferemnt Application could not be made';
        if applicationNo = '' then begin
            //       studentProcessingHeader.RESET;
            //       studentProcessingHeader.SETRANGE("Student No.",studentNo);
            //       studentProcessingHeader.SETRANGE(studentProcessingHeader."Document Type",studentProcessingHeader."Document Type"::Defferment);
            //       IF studentProcessingHeader.FINDSET THEN BEGIN
            //         status:='danger*You have an existing Deferment Application';
            //      END ELSE BEGIN
            studentProcessingHeader.Init;
            studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::Defferment;
            studentProcessingHeader.Validate("Document Type");
            studentProcessingHeader."Examination Sitting" := examCycle;
            studentProcessingHeader.Validate("Examination Sitting");
            studentProcessingHeader."Student No." := studentNo;
            studentProcessingHeader.Validate("Student No.");
            studentProcessingHeader."Student Reg. No." := regNo;
            studentProcessingHeader.Validate("Student Reg. No.");
            studentProcessingHeader.Date := Today;
            studentProcessingHeader.Validate(Date);
            studentProcessingHeader."Withdrawal Code" := withdrawalReason;
            studentProcessingHeader."Prefered Examination Sitting" := preferedExamCenter;
            studentProcessingHeader.Validate("Prefered Examination Sitting");
            studentProcessingHeader.Portal := true;
            studentProcessingHeader."Fee Type" := GetWorkTypeDefferment(studentProcessingHeader."Examination ID");
            studentProcessingHeader.Validate("Fee Type");
            if studentProcessingHeader.Insert(true) then begin


                FetchPapers(studentProcessingHeader);
                studentProcessingHeader.Validate("Withdrawal Code");
                status := 'success*Your Defferment was successfully made*' + studentProcessingHeader."No." + '*' + studentProcessingHeader."Examination ID";
            end else begin
                status := 'danger*Your Defferment could not be made';
            end;
            //END;
        end else begin
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("No.", applicationNo);
            if studentProcessingHeader.FindSet then begin
                studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::Defferment;
                studentProcessingHeader.Validate("Document Type");
                studentProcessingHeader.Date := Today;
                studentProcessingHeader."Withdrawal Code" := withdrawalReason;
                studentProcessingHeader."Examination Sitting" := examCycle;
                studentProcessingHeader.Validate("Examination Sitting");
                studentProcessingHeader."Prefered Examination Sitting" := preferedExamCenter;
                studentProcessingHeader.Validate("Prefered Examination Sitting");
                studentProcessingHeader.Portal := true;
                studentProcessingHeader."Fee Type" := GetWorkTypeDefferment(studentProcessingHeader."Examination ID");
                studentProcessingHeader.Validate("Fee Type");

                if studentProcessingHeader.Modify(true) then begin
                    //FetchPapers(studentProcessingHeader);
                    studentProcessingHeader.Validate("Withdrawal Code");

                    status := 'success*Your Defferment was successfully captured*' + studentProcessingHeader."No." + '*' + studentProcessingHeader."Examination ID";
                end else begin
                    status := 'danger*Your Defferment could not be captured';
                end;
            end;
        end;
    end;

    local procedure getDeffermentLineNo(itemType: Option; orderNo: Code[50]): Integer
    var
        SalesLine: Record "Sales Line";
        lineNo: Integer;
    begin
        lineNo := 0;
        studentprocessingLines.Reset;
        studentprocessingLines.SetRange("Booking Header No.", orderNo);
        studentprocessingLines.SetRange("Document Type", itemType);
        if studentprocessingLines.FindSet then begin
            repeat
                if studentprocessingLines."Line No." > lineNo then begin
                    lineNo := studentprocessingLines."Line No.";
                end;
            until studentprocessingLines.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure CreateWithdrawalLine(bookingtype: Option; "part": Code[50]; section: Code[10]; paper: Code[50]; currency: Code[10]; applicationNo: Code[10]) status: Text
    begin
        status := 'danger*Your Withdrawal Line could not be added';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."approval status"::Open);
        studentProcessingHeader.SetRange("No.", applicationNo);


        if studentProcessingHeader.FindSet then begin
            if (studentProcessingHeader."Document Type" = studentProcessingHeader."document type"::Withdrawal) then begin
                if studentProcessingHeader."Document Type" = studentProcessingHeader."document type"::Withdrawal then begin
                    studentprocessingLines."Document Type" := studentprocessingLines."document type"::Withdrawal;
                end;
                studentprocessingLines.Init;
                //Document Type,Document No.,Line No.
                studentprocessingLines."Course Id" := studentProcessingHeader."Examination ID";
                studentprocessingLines."Booking Type" := bookingtype;
                // studentprocessingLines."Booking Type":=studentprocessingLines."Booking Type"::Section;
                //studentprocessingLines.VALIDATE("Booking Type");
                studentprocessingLines."Line No." := getDeffermentLineNo(studentprocessingLines."Document Type", studentProcessingHeader."No.");
                studentprocessingLines.Validate("Line No.");
                studentprocessingLines.Part := part;
                //studentprocessingLines.VALIDATE(Part);
                studentprocessingLines.Section := section;
                // studentprocessingLines.VALIDATE(Section);
                studentprocessingLines.Paper := paper;
                studentprocessingLines.Validate(Paper);
                studentprocessingLines."Currency Code" := currency;
                studentprocessingLines.Validate("Currency Code");
                studentprocessingLines."Booking Header No." := studentProcessingHeader."No.";
                studentprocessingLines.Validate("Booking Header No.");

                if studentprocessingLines.Insert(true) then begin

                    studentprocessingLines.Modify(true);
                    status := 'success*The Withdrawal was successfully added';
                end else begin
                    status := 'danger*Your Withdrawal details could not be added';
                end;
            end;
        end else begin
            status := 'danger*A Withdrawal with the given number does not exist,';
        end;
        exit(status);
    end;

    procedure CreateStudentBookingLine(bookingtype: Option; "part": Code[50]; section: Code[50]; paper: Code[50]; currency: Code[50]; applicationNo: Code[50]) status: Text
    begin
        status := 'danger*Examination Booking could not be added';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."approval status"::Open);
        studentProcessingHeader.SetRange("No.", applicationNo);


        if studentProcessingHeader.FindSet then begin
            if (studentProcessingHeader."Document Type" = studentProcessingHeader."document type"::Booking) then begin
                if studentProcessingHeader."Document Type" = studentProcessingHeader."document type"::Booking then begin
                    studentprocessingLines."Document Type" := studentprocessingLines."document type"::Booking;
                end;
                studentprocessingLines.Init;
                //Document Type,Document No.,Line No.
                studentprocessingLines."Course Id" := studentProcessingHeader."Examination ID";
                studentprocessingLines."Booking Type" := bookingtype;
                // studentprocessingLines."Booking Type":=studentprocessingLines."Booking Type"::Section;
                //studentprocessingLines.VALIDATE("Booking Type");
                studentprocessingLines."Line No." := getDeffermentLineNo(studentprocessingLines."Document Type", studentProcessingHeader."No.");
                studentprocessingLines.Validate("Line No.");
                studentprocessingLines.Part := part;
                //studentprocessingLines.VALIDATE(Part);
                studentprocessingLines.Section := section;
                // studentprocessingLines.VALIDATE(Section);
                studentprocessingLines.Paper := paper;
                studentprocessingLines.Validate(Paper);
                studentprocessingLines."Currency Code" := currency;
                studentprocessingLines.Validate("Currency Code");
                studentprocessingLines."Booking Header No." := studentProcessingHeader."No.";
                studentprocessingLines.Validate("Booking Header No.");




                if studentprocessingLines.Insert(true) then begin

                    studentprocessingLines.Modify(true);
                    status := 'success*Examination Booking was successfully added ' + studentProcessingHeader."No.";
                end else begin
                    status := 'danger*Examination Booking details could not be added';
                end;
            end;
        end else begin
            status := 'danger*Examination Booking with the given number does not exist,';
        end;
        exit(status);
    end;

    procedure CreateStudentBooking(applicationNo: Code[250]; studentNo: Code[50]; regNo: Text; examCenters: Text; examCycle: Text; currency: Code[100]; trainingInst: Code[50]) status: Text
    var
        myType: Text;
    begin
        status := 'danger*Examination Booking could not be made';
        if applicationNo = '' then begin

            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("Document Type", studentProcessingHeader."document type"::Booking);
            studentProcessingHeader.SetRange("Student No.", studentNo);
            studentProcessingHeader.SetRange("Student Reg. No.", regNo);
            studentProcessingHeader.SetRange(Posted, false);
            studentProcessingHeader.SetRange(Cancelled, false);
            studentProcessingHeader."Training Institution Code" := trainingInst;
            studentProcessingHeader.Validate("Training Institution Code");
            if studentProcessingHeader.FindSet then begin
                status := 'danger*You have an existing Booking Application. On the sidebar under Examination Booking, locate drafts';

            end else begin

                studentProcessingHeader.Init;
                //FnUploadProfilePhotoprofile(studentProcessingHeader."ID Number/Passport No.");
                studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::Booking;
                //studentProcessingHeader."No.":=studentProcessingHeader."No.";
                //studentProcessingHeader.VALIDATE("No.");
                //studentProcessingHeader.VALIDATE("Document Type");
                studentProcessingHeader."Student No." := studentNo;
                studentProcessingHeader.Validate("Student No.");
                studentProcessingHeader."Student Reg. No." := regNo;
                studentProcessingHeader.Validate("Student Reg. No.");
                //studentProcessingHeader."Currency Code":=currency;
                //studentProcessingHeader.VALIDATE("Currency Code");
                //studentProcessingHeader."Examination Center":=examCenters;
                //studentProcessingHeader.VALIDATE("Examination Center");
                studentProcessingHeader."Examination Sitting" := examCycle;
                studentProcessingHeader.Validate("Examination Sitting");
                studentProcessingHeader."Fee Type" := GetWorkTypeBooking(studentProcessingHeader."Examination ID", studentProcessingHeader."Currency Code");
                studentProcessingHeader.Validate("Fee Type");
                studentProcessingHeader.Portal := true;


                if studentProcessingHeader.Insert(true) then begin

                    status := 'success*Examination Booking was successfully made*' + studentProcessingHeader."No.";

                    // FnsuggestPapers(studentProcessingHeader."No.");
                end else begin
                    status := 'danger*An existing Application Exists';
                end;
            end;



        end else begin
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("No.", applicationNo);
            if studentProcessingHeader.FindSet then begin
                //FnUploadProfilePhotoprofile(studentProcessingHeader."ID Number/Passport No.");
                //  studentProcessingHeader."Document Type":= studentProcessingHeader."Document Type"::Booking;
                //  studentProcessingHeader.VALIDATE("Document Type");
                //studentProcessingHeader."Student No.":= studentNo;
                //studentProcessingHeader.VALIDATE("Student No.");
                //studentProcessingHeader."Student Reg. No.":= regNo;
                // studentProcessingHeader.VALIDATE("Student Reg. No.");
                //  studentProcessingHeader."Currency Code":=currency;
                //  studentProcessingHeader.VALIDATE("Currency Code");
                //  studentProcessingHeader."Examination Center":=examCenters;
                // studentProcessingHeader.VALIDATE("Examination Center");
                studentProcessingHeader."Examination Sitting" := examCycle;
                studentProcessingHeader.Validate("Examination Sitting");

                studentProcessingHeader."Fee Type" := GetWorkTypeBooking(studentProcessingHeader."Examination ID", studentProcessingHeader."Currency Code");
                studentProcessingHeader.Portal := true;

                if studentProcessingHeader.Modify(true) then begin
                    status := 'success*Examination Booking was successfully captured*' + studentProcessingHeader."No.";

                    //FnsuggestPapers(studentProcessingHeader."No.");
                end else begin
                    status := 'danger*Examination Booking could not be captured';
                end;
            end;
        end;
    end;

    procedure InstitutionBookingLine(bookingtype: Option; "part": Code[50]; section: Code[10]; paper: Code[50]; project: Code[10]; applicationNo: Code[10]; registrationNo: Code[10]) status: Text
    var
        BulkExamBookingHeader: Record "Bulk Processing Header";
        BulkExamBookingLines: Record "Bulk Processing Lines";
    begin
        status := 'danger*Examination Booking could not be added';
        BulkExamBookingHeader.Reset;
        BulkExamBookingHeader.SetRange("Approval Status", BulkExamBookingHeader."approval status"::Open);
        BulkExamBookingHeader.SetRange("No.", applicationNo);


        if BulkExamBookingHeader.FindSet then begin
            if (BulkExamBookingHeader."Document Type" = BulkExamBookingHeader."document type"::Booking) then begin

                BulkExamBookingLines.Init;
                //Document Type,Document No.,Line No.

                BulkExamBookingLines."Booking Type" := bookingtype;
                BulkExamBookingLines.Validate("Booking Type");
                BulkExamBookingLines."Examination Project Code" := project;
                BulkExamBookingLines.Validate("Examination Project Code");
                BulkExamBookingLines."Bulk Header No." := BulkExamBookingHeader."No.";
                BulkExamBookingLines.Validate("Bulk Header No.");
                BulkExamBookingLines."Line No." := getDeffermentLineNo(BulkExamBookingLines."Document Type", BulkExamBookingLines."Bulk Header No.");
                BulkExamBookingLines.Validate("Line No.");
                BulkExamBookingLines.Part := part;
                BulkExamBookingLines.Validate(Part);
                BulkExamBookingLines.Section := section;
                BulkExamBookingLines.Validate(Section);
                BulkExamBookingLines.Paper := paper;
                BulkExamBookingLines.Validate(Paper);
                BulkExamBookingLines."Registration No." := registrationNo;
                BulkExamBookingLines.Validate("Registration No.");

                if BulkExamBookingLines.Insert(true) then begin

                    BulkExamBookingLines.Modify(true);
                    status := 'success*Examination Booking was successfully added';
                end else begin
                    status := 'danger*Examination Booking details could not be added';
                end;
            end;
        end else begin
            status := 'danger*Examination Booking with the given number does not exist,';
        end;
        exit(status);
    end;

    procedure FnRegistrationStudent(firstname: Text; middlename: Text; lastname: Text; phoneNumber: Text; email: Text; idNumber: Text) status: Text
    var
        ApplicantProfile: Record Customer;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        PortalUSer: Record "Dynasoft Portal User";
        RandomDigit: Text[50];
    begin
        PortalUSer.Reset;
        PortalUSer.SetRange("Id Number", idNumber);
        if PortalUSer.FindSet then begin
            status := 'danger*The Id number already exists.Your account already exist proceed and login or reset password if forgotten your credentials';
        end else begin
            PortalUSer.Reset;
            PortalUSer.SetRange("Authentication Email", email);
            if PortalUSer.FindSet then begin
                status := 'danger*The Email Account already exists.Your account already exist proceed and login or reset password if forgotten your credentials';

            end else begin

                PortalUSer.Init;
                PortalUSer."User Name" := Lowercase(email);
                PortalUSer."Full Name" := UpperCase(firstname) + '  ' + UpperCase(middlename) + ' ' + UpperCase(lastname);
                PortalUSer.FirstName := UpperCase(firstname);
                PortalUSer.LastName := UpperCase(lastname);
                PortalUSer.MiddleName := UpperCase(middlename);
                PortalUSer."Authentication Email" := Lowercase(email);
                PortalUSer."Mobile Phone No." := phoneNumber;
                PortalUSer.State := PortalUSer.State::Enabled;
                PortalUSer."Record Type" := PortalUSer."record type"::Customer;
                PortalUSer."Record ID" := ApplicantProfile."No.";
                PortalUSer."Id Number" := idNumber;
                RandomDigit := CreateGuid;
                RandomDigit := DelChr(RandomDigit, '=', '{}-01');
                RandomDigit := CopyStr(RandomDigit, 1, 8);
                PortalUSer."Password Value" := RandomDigit;
                PortalUSer."Last Modified Date" := Today;
                if PortalUSer.Insert(true) then begin
                    ;
                    FnSendEmaiNotificationOnApplicantAccountActivation(PortalUSer);
                    status := 'success*Your student account was successfully created. Please Check your email to get your login credentials!';

                end else begin
                    status := 'danger*Your student account was not created successfully.Kindly Contact System Administrator';
                end;
            end;
            //  END ELSE IF(Ttype='Institution')THEN BEGIN
            //          MarketingSetup.GET;
            //          Contact.INIT;
            //          Contact."No.":=NoSeriesManagement.GetNextNo(MarketingSetup."Contact Nos.",TODAY,TRUE);
            //          Contact.Name := firstname+' '+lastname+' '+middlename;
            //          Contact."Post Code":=postcode;
            //          Contact.Address:=address;
            //          Contact.City:=city;
            //          Contact."Country/Region Code":=country;
            //          Contact.Type:=Contact.Type::Company;
            //          Contact."Record Type":=Contact."Record Type"::Contact;
            //          Contact."Phone No." :=phoneNumber;
            //          Contact."E-Mail":= email;
            //          IF Contact.INSERT(TRUE) THEN BEGIN
            //            FnCreateApplicantAccountRequest(email);
            //            FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(Contact);
            //          END;
            //          END;
            /*IF Contact.INSERT(TRUE) THEN BEGIN
              FnCreateApplicantAccountRequest(email);
              FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(Contact);
              FnSendEmaiNotificationOnApplicantAccountActivation(Contact);
              status:='success*Your Aplicant account was successfully created. Please log in to complete your profile!';
               END ELSE BEGIN
              status:='danger*Your Aplicant account was not created successfully.Kindly Contact System Administrator';
            END;
            END;*/
        end;
        exit(status);

    end;

    procedure FnUploadImage(mytext: Text; StudentRec: Record "Student Processing Header")
    var
        StudentProcessingHeader: Record "Student Processing Header";
        fileName: Text;
        importFile: File;
        imageInStream: InStream;
        imageID: Guid;
        FileMgt: Codeunit "File Management";
        //TempBlob: Record TempBlob;
        ServerFileNameTxt: Text;
        ClientFileNameTxt: Text;
        Imageoutsteram: OutStream;
        MEDIA: File;
    begin
        //
        // StudentRec.Image.IMPORTFILE('Filename',mytext);
        // IF NOT StudentRec.MODIFY(TRUE) THEN
        //  StudentRec.INSERT(TRUE);
        //
        // IF FileMgt.DeleteServerFile(mytext) THEN;
        //
        if StudentRec.FindFirst() then begin
            repeat
                fileName := mytext + Format(StudentRec."No.") + '.jpg';
                if FILE.Exists(fileName) then begin
                    StudentRec.Image.ImportFile(fileName, Format(StudentRec."No."));
                    StudentRec.Modify;
                end;
            until StudentRec.Next < 1;
        end;
    end;

    procedure FnUploadProfilePhoto(studentNo: Code[100]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        fileName: Text;
        importFile: File;
        imageInStream: InStream;
        imageID: Guid;
        FileMgt: Codeunit "File Management";
        //  TempBlob: Record TempBlob;
        ServerFileNameTxt: Text;
        ClientFileNameTxt: Text;
        Imageoutsteram: OutStream;
        MEDIA: File;
        ExaminationSetup: Record "Examination Setup";
        FileManagement: Codeunit "File Management";
    begin
        ExaminationSetup.GET;
        IF ExaminationSetup."Image File Path" = '' THEN
            status := 'danger*Kindly consult the system administrator to configure the Image Path'
        ELSE
            StudentProcessingHeader.RESET;
        StudentProcessingHeader.SETRANGE("No.", studentNo);
        IF StudentProcessingHeader.FINDFIRST THEN BEGIN
            fileName := ExaminationSetup."Image File Path" + studentNo + '\' + studentNo + '.jpeg';
            IF fileName = '' THEN
                EXIT;
            CLEAR(StudentProcessingHeader.Image);
            StudentProcessingHeader.Image.IMPORTFILE(fileName, fileName);
            StudentProcessingHeader.MODIFY(TRUE);

        END;

        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange("ID Number/Passport No.", studentNo);
        if StudentProcessingHeader.FindFirst then begin
            repeat
                fileName := '\\184.174.39.195\HRMPEBTest\Student Processing Header\' + studentNo + '\' + studentNo + '.jpg';
                if FILE.Exists(fileName) then begin
                    importFile.Open(fileName);
                    importFile.CreateInstream(imageInStream);
                    imageID := StudentProcessingHeader.Image.ImportStream(imageInStream, 'student Profile photo ' + Format(studentNo));
                    StudentProcessingHeader.Modify;
                    //MESSAGE(Text000, studentNo, imageID);
                    importFile.Close;
                end;
            //MESSAGE('SUCCESS' + studentNo);
            until StudentProcessingHeader.Next < 1;
        end;
    end;

    procedure printInvoice(studentNoFilter: Code[50]; invoicenumber: Code[50]) status: Text
    var
        SalesInvoiceHeader: Record "Sales Header";
        repSalesInvoice: Report "Standard Sales - Pro Forma Inv";
        printed: Boolean;
    begin
        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange(SalesInvoiceHeader."Sell-to Customer No.", studentNoFilter);
        SalesInvoiceHeader.SetFilter(SalesInvoiceHeader."No.", '%1', invoicenumber);
        if SalesInvoiceHeader.FindSet then begin
            if FILE.Exists(FILESPATH2 + invoicenumber + '.pdf') then begin
                FILE.Erase(FILESPATH2 + invoicenumber + '.pdf');
                Report.SaveAsPdf(1302, FILESPATH2 + invoicenumber + '.pdf', SalesInvoiceHeader);
                status := 'success*downloads\invoice\' + invoicenumber + '.pdf';
            end else begin
                Report.SaveAsPdf(1302, FILESPATH2 + invoicenumber + '.pdf', SalesInvoiceHeader);
                status := 'success*downloads\invoice\' + invoicenumber + '.pdf';
            end
        end else begin
            status := 'danger*The Proforma Report could not be generated';
        end;
        // status:='danger*could not generate your statement';
        // SalesInvoiceHeader.RESET;
        // SalesInvoiceHeader.SETRANGE("Bill-to Customer No.",studentNoFilter);
        // IF SalesInvoiceHeader.FINDSET THEN
        //  BEGIN
        //  SalesInvoiceHeader.RESET;
        //  SalesInvoiceHeader.SETRANGE(SalesInvoiceHeader."Document Type",SalesInvoiceHeader."Document Type"::Invoice);
        //  SalesInvoiceHeader.SETRANGE("Bill-to Customer No.",studentNoFilter);
        //  SalesInvoiceHeader.SETFILTER("No.",'%1',applicationNo);
        //
        //  IF SalesInvoiceHeader.FINDSET THEN
        //    BEGIN
        //       IF FILE.EXISTS(FILESPATH2+studentNoFilter+'.pdf') THEN
        //         FILE.ERASE(FILESPATH2+studentNoFilter+'.pdf');
        //      repSalesInvoice.SAVEASPDF(FILESPATH2+studentNoFilter+'.pdf');
        //      status:='success*downloads\invoice\'+studentNoFilter+'.pdf';
        //
        //  END
        //  ELSE
        //  BEGIN
        //    status:='danger*Invoice  not found';
        //    END;
        //
        //
        // END;
    end;

    procedure ConfirmPaymentsStudent(applicationNo: Code[100]; paymentDocument: Boolean; paymentRef: Text; studentNo: Code[10]; mode: Code[10]) status: Text
    var
        studentProcessing: Record "Student Processing Header";
    begin


        studentProcessing.Reset;
        studentProcessing.SetRange("Student No.", studentNo);
        studentProcessing.SetRange("No.", applicationNo);
        /// studentProcessing.SetRange("Approval Status", studentProcessing."approval status"::"2");
        if studentProcessing.FindSet then begin
            studentProcessing."Payment Evidence" := true;
            studentProcessing."Payment Reference No." := paymentRef;
            studentProcessing."Pay Mode" := mode;
            //  ProgramAccreditationTable.Status:=ProgramAccreditationTable.Status::"HOD Pending";
            if studentProcessing.Modify(true) then begin
                status := 'success* The Payments Details for the Application No.' + applicationNo + 'was successfully submitted';
            end;
        end else begin
            status := 'danger*The Application Details for' + ' ' + applicationNo + ' ' + 'has not been Approved.';
        end;
    end;

    procedure PrintReceipt(receiptNoFilter: Code[10]) status: Text
    var
        ReceiptHeader: Record "Receipts Header1";
        // repSalesInvoice: Report Receipt;
        printed: Boolean;
    begin
        // status:='danger*could not generate your statement';
        //
        //  ReceiptHeader.RESET;
        //  //SalesInvoiceHeader.SETRANGE(SalesInvoiceHeader."Sell-to Customer No.", studentNo);
        //  ReceiptHeader.SETFILTER(ReceiptHeader."No.",'%1',receiptNoFilter);
        //  IF ReceiptHeader.FINDSET THEN BEGIN
        //    studentProcessingHeader.RESET;
        //    studentProcessingHeader.SETRANGE("No.",ReceiptHeader."Cheque No");
        //   IF FILE.EXISTS(FILESPATH+receiptNoFilter+'.pdf') THEN BEGIN
        //       FILE.ERASE(FILESPATH+receiptNoFilter+'.pdf');
        //      //Report.SaveAsPdf(85047, FILESPATH+receiptNoFilter+'.pdf',studentProcessingHeader);
        //      status:='success*downloads\receipt\'+receiptNoFilter+'.pdf';
        //      END ELSE BEGIN
        //        studentProcessingHeader.RESET;
        //    studentProcessingHeader.SETRANGE("No.",ReceiptHeader."Cheque No");
        //        //Report.SaveAsPdf(85047, FILESPATH+receiptNoFilter+'.pdf',studentProcessingHeader);
        //      status:='success*downloads\receipt\'+receiptNoFilter+'.pdf';
        //      END
        //    END ELSE BEGIN
        //    status:='danger*The receipt Report could not be generated';
        //    END;
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange(studentProcessingHeader."No.", receiptNoFilter);
        // StudentProcessingHeader.SETFILTER(StudentProcessingHeader."No.",'%1',StudentProcessingHeader);
        if studentProcessingHeader.FindSet then begin
            appNo := ConvertStr(receiptNoFilter, '-', '_');
            appNo := ConvertStr(receiptNoFilter, ':', '_');



            if FILE.Exists(FILESPATH + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH + appNo + '.pdf');


                Report.SaveAsPdf(85049, FILESPATH + appNo + '.pdf', studentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';

            end else begin

                Report.SaveAsPdf(85049, FILESPATH + appNo + '.pdf', studentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The receipt Report could not be generated';
        end;
    end;

    procedure PrintDeffermentSummery(ApplicationNo: Code[50]) status: Text
    var
        studentprocessing: Record "Student Processing Header";
        //  deffermentSummery: Report "Student Defferal Summary";
        printed: Boolean;
    begin
        // studentProcessingHeader.RESET;
        // studentProcessingHeader.SETRANGE("No.",ApplicationNo);
        // IF studentProcessingHeader.FINDSET THEN   BEGIN
        //
        //
        //  IF studentProcessingHeader.FINDSET THEN
        //    BEGIN
        //    appNo := CONVERTSTR(ApplicationNo,'-','_');
        //    appNo := CONVERTSTR(ApplicationNo,':','_');
        //       IF FILE.EXISTS(FILESPATH4+appNo+'.pdf') THEN
        //         FILE.ERASE(FILESPATH4+appNo+'.pdf');
        //      deffermentSummery.SAVEASPDF(FILESPATH4+appNo+'.pdf');
        //      status:='success*\downloads\Rename\'+appNo+'.pdf';
        //
        //  END
        //  ELSE
        //  BEGIN
        //    status:='danger*defferment summery  not found';
        //    END;
        //
        //
        // END;**commented on 28/02/2022


        //rrstatus:='danger*could not generate your statement';
        // studentProcessingHeader.RESET;
        // studentProcessingHeader.SETRANGE("No.",ApplicationNo);
        // IF studentProcessingHeader.FINDSET THEN
        //  BEGIN
        //  studentProcessingHeader.RESET;
        //  studentProcessingHeader.SETRANGE("No.",ApplicationNo);
        // studentProcessingHeader.SETFILTER("No.", ApplicationNo);
        //
        //  IF studentProcessingHeader.FINDSET THEN
        //    BEGIN
        //       IF FILE.EXISTS(FILESPATH4+ApplicationNo+'.pdf') THEN
        //         FILE.ERASE(FILESPATH4+ApplicationNo+'.pdf');
        //     deffermentSummery.SAVEASPDF(FILESPATH4+ApplicationNo+'.pdf');
        //      status:='success*downloads\defferment\'+ApplicationNo+'.pdf';
        //
        //  END
        //  ELSE
        //  BEGIN
        //    status:='danger*receipt  not found';
        //    END;
        //
        //
        // END;
    end;

    procedure PrintInvoiceExemption(studentNoFilter: Code[10]; invoiceNo: Code[10]) status: Text
    var
        SalesInvoiceHeader: Record "Sales Header";
        repSalesInvoice: Report "Standard Sales - Invoice";
        printed: Boolean;
    begin

        // status:='danger*could not generate your statement';
        // SalesInvoiceHeader.RESET;
        // SalesInvoiceHeader.SETRANGE("Sell-to Customer No.",studentNoFilter);
        // IF SalesInvoiceHeader.FINDSET THEN
        //  BEGIN
        //  SalesInvoiceHeader.RESET;
        //  SalesInvoiceHeader.SETRANGE("Sell-to Customer No.",studentNoFilter);
        // SalesInvoiceHeader.SETFILTER("No.", invoiceNo);
        //
        //  IF SalesInvoiceHeader.FINDSET THEN
        //    BEGIN
        //       IF FILE.EXISTS(FILESPATH2+studentNoFilter+'.pdf') THEN
        //         FILE.ERASE(FILESPATH2+studentNoFilter+'.pdf');
        //      repSalesInvoice.SAVEASPDF(FILESPATH2+studentNoFilter+'.pdf');
        //      status:='success*downloads\invoice\'+studentNoFilter+'.pdf';
        //
        //  END
        //  ELSE
        //  BEGIN
        //    status:='danger*Invoice  not found';
        //    END;
        //
        //
        // END;
        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange(SalesInvoiceHeader."No.", invoiceNo);
        SalesInvoiceHeader.SetFilter(SalesInvoiceHeader."No.", '%1', invoiceNo);
        if SalesInvoiceHeader.FindSet then begin
            appNo := ConvertStr(invoiceNo, '-', '_');
            appNo := ConvertStr(invoiceNo, ':', '_');



            if FILE.Exists(FILESPATH2 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH2 + appNo + '.pdf');


                Report.SaveAsPdf(1302, FILESPATH2 + appNo + '.pdf', SalesInvoiceHeader);

                status := 'success*downloads\invoice\' + appNo + '.pdf';

            end else begin

                Report.SaveAsPdf(1302, FILESPATH2 + appNo + '.pdf', SalesInvoiceHeader);
                status := 'success*downloads\invoice\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The Invoice could not be generated';
        end;
    end;

    procedure ConfirmPaymentStudentRegistration(applicationNo: Code[100]; paymentDocument: Boolean; paymentRef: Text; studentNo: Code[10]; mode: Code[10]) status: Text
    var
        studentProcessing: Record "Student Processing Header";
    begin


        studentProcessing.Reset;
        studentProcessing.SetRange("Student No.", studentNo);
        studentProcessing.SetRange("No.", applicationNo);
        //studentProcessing.SETRANGE("Approval Status",studentProcessing."Approval Status"::Released);
        if studentProcessing.FindSet then begin
            studentProcessing."Document Type" := studentProcessing."document type"::Registration;
            studentProcessing."Payment Evidence" := true;
            studentProcessing."Payment Reference No." := paymentRef;
            studentProcessing."Pay Mode" := mode;
            //   studentProcessing.Submitted:=TRUE;
            //  ProgramAccreditationTable.Status:=ProgramAccreditationTable.Status::"HOD Pending";
            if studentProcessing.Modify(true) then begin
                status := 'success* The Payments Details for the Application No.' + applicationNo + 'was successfully submitted';
            end;
        end else begin
            status := 'danger*The Application Details for' + ' ' + applicationNo + ' ' + 'has not been Approved.';
        end;
    end;

    procedure ConfirmPaymentsStudentBooking(applicationNo: Code[100]; paymentDocument: Boolean; paymentRef: Text; studentNo: Code[10]; mode: Code[10]) status: Text
    var
        studentProcessing: Record "Student Processing Header";
    begin


        studentProcessing.Reset;
        studentProcessing.SetRange("Student No.", studentNo);
        studentProcessing.SetRange("No.", applicationNo);
        //studentProcessing.SETRANGE("Approval Status",studentProcessing."Approval Status"::Released);
        if studentProcessing.FindSet then begin
            studentProcessing."Document Type" := studentProcessing."document type"::Booking;
            studentProcessing."Payment Evidence" := true;
            studentProcessing."Payment Reference No." := paymentRef;
            studentProcessing."Pay Mode" := mode;
            //  ProgramAccreditationTable.Status:=ProgramAccreditationTable.Status::"HOD Pending";
            if studentProcessing.Modify(true) then begin
                status := 'success* The Payments Details for the Application No.' + applicationNo + 'was successfully submitted';
            end;
        end else begin
            status := 'danger*The Application Details for' + ' ' + applicationNo + ' ' + 'has not been Approved.';
        end;
    end;

    procedure printInvoiceBooking(invoicenumber: Code[10]; studentNo: Code[10]) status: Text
    var
        SalesInvoiceHeader: Record "Sales Header";
        repSalesInvoice: Report "Standard Sales - Pro Forma Inv";
        printed: Boolean;
    begin


        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange(SalesInvoiceHeader."Sell-to Customer No.", studentNo);
        SalesInvoiceHeader.SetFilter(SalesInvoiceHeader."No.", '%1', invoicenumber);
        if SalesInvoiceHeader.FindSet then begin
            if FILE.Exists(FILESPATH3 + invoicenumber + '.pdf') then begin
                FILE.Erase(FILESPATH3 + invoicenumber + '.pdf');
                Report.SaveAsPdf(1302, FILESPATH3 + invoicenumber + '.pdf', SalesInvoiceHeader);
                status := 'success*downloads\proforma\' + invoicenumber + '.pdf';
            end else begin
                Report.SaveAsPdf(1302, FILESPATH3 + invoicenumber + '.pdf', SalesInvoiceHeader);
                status := 'success*downloads\proforma\' + invoicenumber + '.pdf';
            end
        end else begin
            status := 'danger*The Proforma Report could not be generated';
        end;
    end;

    procedure FnApplicantProfileRegistrationLines(applicantNumber: Text; isdisable: Text; examination: Code[10]; HighestAcademicQualification: Text; information: Text; kinRelationship: Integer; kinname: Text; kinemail: Text; kinphone: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        Applicant: Record "Student Processing Header";
    begin
        Applicant.Init;
        Applicant.SetRange("No.", applicantNumber);
        //Applicant.SETRANGE("Examination ID",examination);
        if Applicant.FindSet then begin
            Applicant."Highest Academic QCode" := HighestAcademicQualification;
            Applicant.Validate("Highest Academic QCode");

            Applicant."Source of Information" := information;
            Applicant.Validate("Source of Information");
            Applicant."Contact Relationship" := kinRelationship;
            Applicant."Contact Full Name" := kinname;
            Applicant."Contact Email" := kinemail;
            Applicant."Contact Phone No." := kinphone;
            // Applicant."Training Institution Code" := trainingInst;
            // Applicant.Validate("Training Institution Code");

            if (isdisable = '2') then begin
                Applicant.Disabled := true;
            end else begin
                if (isdisable = '1') then begin
                    Applicant.Disabled := false;
                end;
            end;
            if Applicant.Modify(true) then begin
                status := 'success*Details successfully saved. Please proceed to Attach the mandatory documents!*' + Applicant."Examination ID";
            end else begin
                status := 'danger* details not saved successfully.Kindly Contact System Administrator';
            end;
        end;



        exit(status);
    end;

    procedure printInvoiceInstReg(invoicenumber: Code[10]; custNo: Code[10]) status: Text
    var
        SalesInvoiceHeader: Record "Sales Header";
        repSalesInvoice: Report "Standard Sales - Draft Invoice";
        printed: Boolean;
    begin

        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetRange(SalesInvoiceHeader."Bill-to Customer No.", custNo);
        SalesInvoiceHeader.SetFilter(SalesInvoiceHeader."No.", '%1', invoicenumber);
        if SalesInvoiceHeader.FindSet then begin
            if FILE.Exists(FILESPATH6 + custNo + '.pdf') then begin
                FILE.Erase(FILESPATH6 + custNo + '.pdf');
                Report.SaveAsPdf(1302, FILESPATH6 + custNo + '.pdf', SalesInvoiceHeader);
                status := 'success*downloads\test\' + custNo + '.pdf';
            end else begin
                Report.SaveAsPdf(1302, FILESPATH6 + custNo + '.pdf', SalesInvoiceHeader);
                status := 'success*downloads\test\' + custNo + '.pdf';
            end
        end else begin
            status := 'danger*The invoice could not be generated';
        end;
    end;

    procedure PrintWithdrawalSummery(applicationNo: Code[50]) status: Text
    var
        studentHeader: Record "Student Processing Header";
        //   repSalesInvoice: Report "Student Withdrawal Summary";
        printed: Boolean;
    begin
        ////Report.SaveAsPdf(85016,FILESPATH13+appNo+'.pdf',ExaminationResults);
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);

        if studentProcessingHeader.FindSet then begin
            studentProcessingHeader.Submitted := true;
            studentProcessingHeader.Portal := true;
            studentProcessingHeader.Modify();

            //REPORT.RUN(85016,TRUE,FALSE,ExaminationResults);
            appNo := ConvertStr(applicationNo, '-', '_');
            appNo := ConvertStr(applicationNo, ':', '_');
            appNo := ConvertStr(applicationNo, '/', '_');

            if FILE.Exists(FILESPATH1 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH1 + appNo + '.pdf');

                Report.SaveAsPdf(85010, FILESPATH1 + appNo + '.pdf', studentProcessingHeader);
                status := 'success*downloads\withdrawal\' + appNo + '.pdf';

            end else begin
                Report.SaveAsPdf(85010, FILESPATH1 + appNo + '.pdf', studentProcessingHeader);
                status := 'success*downloads\withdrawal\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The report could not be generated';
        end;
        //END;
    end;

    procedure FnInstitutionStudentRegistration(applicantNumber: Text; surname: Text; firstname: Text; othernames: Text; gender: Integer; idnumber: Code[10]; dateofbirth: Date; county: Text; address: Code[50]; isdisable: Text; postalcodes: Code[50]; email: Text; city: Text; examcenters: Text; examination: Text; phoneNumber: Text; HighestAcademicQualification: Text; examCycle: Text; currency: Code[10]) status: Text
    var
        BulkExamBookingHeader: Record "Bulk Processing Header";
        BulkExamBookingLines: Record "Bulk Processing Lines";
    begin
        status := 'danger*Examination Booking could not be added';
        BulkExamBookingHeader.Reset;
        BulkExamBookingHeader.SetRange("Approval Status", BulkExamBookingHeader."approval status"::Open);
        BulkExamBookingHeader.SetRange("No.", applicantNumber);


        if BulkExamBookingHeader.FindSet then begin
            if (BulkExamBookingHeader."Document Type" = BulkExamBookingHeader."document type"::Registration) then begin

                BulkExamBookingLines.Init;

                if BulkExamBookingHeader."Document Type" = BulkExamBookingHeader."document type"::Registration then begin
                    BulkExamBookingLines."Document Type" := BulkExamBookingLines."document type"::Registration;
                end;
                BulkExamBookingLines."First Name" := firstname;
                BulkExamBookingLines."Middle Name" := othernames;
                BulkExamBookingLines.Surname := surname;
                BulkExamBookingLines."Student Name" := firstname + ' ' + othernames + ' ' + surname;
                BulkExamBookingLines.Gender := gender;
                BulkExamBookingLines."Document Type" := BulkExamBookingLines."document type"::Registration;
                BulkExamBookingLines.Validate("Document Type");
                BulkExamBookingLines."Bulk Header No." := BulkExamBookingHeader."No.";
                BulkExamBookingLines.Validate("Bulk Header No.");
                BulkExamBookingLines."Line No." := getBulkBookingLineNo(BulkExamBookingLines."Document Type", BulkExamBookingLines."Bulk Header No.");
                BulkExamBookingLines.Validate("Line No.");
                BulkExamBookingLines."ID Number" := idnumber;
                BulkExamBookingLines."Date of Birth" := dateofbirth;
                BulkExamBookingLines.County := county;
                BulkExamBookingLines."Phone No." := phoneNumber;
                BulkExamBookingLines.Address := address;
                BulkExamBookingLines.City := city;
                BulkExamBookingLines."Currency Code" := currency;
                BulkExamBookingLines."Course ID" := examination;
                BulkExamBookingLines.Validate("Course ID");
                BulkExamBookingLines."Training Institution Code" := examcenters;
                BulkExamBookingLines.Validate("Training Institution Code");
                BulkExamBookingLines."Examination Cyce" := examCycle;
                BulkExamBookingLines."Highest Academic QCode" := HighestAcademicQualification;
                BulkExamBookingLines.Validate("Highest Academic QCode");

                if (isdisable = 'True') then begin
                    BulkExamBookingLines.Disabled := true;
                end;
                BulkExamBookingLines."Post Code" := postalcodes;

                if BulkExamBookingLines.Insert(true) then begin

                    BulkExamBookingLines.Modify(true);
                    status := 'success*Examination Booking was successfully added';
                end else begin
                    status := 'danger*Examination Booking details could not be added';
                end;
            end;
        end else begin
            status := 'danger*Examination Booking with the given number does not exist,';
        end;
        exit(status);
    end;

    local procedure getBulkBookingLineNo(itemType: Option; orderNo: Code[50]): Integer
    var
        BulkLine: Record "Bulk Processing Lines";
        lineNo: Integer;
    begin
        lineNo := 0;
        BulkLine.Reset;
        BulkLine.SetRange("Bulk Header No.", orderNo);
        BulkLine.SetRange("Document Type", itemType);
        if BulkLine.FindSet then begin
            repeat
                if BulkLine."Line No." > lineNo then begin
                    lineNo := BulkLine."Line No.";
                end;
            until BulkLine.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure InstitutionRegistartionHeader(DocType: Option; InstitutionNo: Code[50]; CurrencyCode: Code[50]; applicationNo: Code[50]) status: Text
    var
        BulkHeader: Record "Bulk Processing Header";
    begin
        status := 'danger*Registration could not be made';
        if applicationNo = '' then begin
            BulkHeader.Init;
            BulkHeader."Document Type" := DocType;
            BulkHeader.Validate("Document Type");
            BulkHeader.Date := Today;
            BulkHeader.Validate(Date);

            BulkHeader."Institution No." := InstitutionNo;
            BulkHeader.Validate("Institution No.");


            if BulkHeader.Insert(true) then begin
                status := 'success*Registration was successfully made*' + BulkHeader."No.";
            end else begin
                status := 'danger*Registration Booking could not be made';
            end;


        end else begin
            BulkHeader.Reset;
            BulkHeader.SetRange("No.", applicationNo);
            if BulkHeader.FindSet then begin

                BulkHeader."Document Type" := DocType;
                BulkHeader.Validate("Document Type");
                BulkHeader.Date := Today;
                BulkHeader.Validate(Date);

                BulkHeader."Institution No." := InstitutionNo;
                BulkHeader.Validate("Institution No.");

                if BulkHeader.Modify(true) then begin
                    status := 'success*Registration was successfully captured*' + BulkHeader."No.";
                end else begin
                    status := 'danger*Registration Booking could not be captured';
                end;
            end;
        end;
    end;

    procedure InstitutionExamBooking(applicationNo: Code[250]; institutionNo: Code[50]; date: Date) status: Text
    var
        myType: Text;
        BulkExamBookingHeader: Record "Bulk Processing Header";
        BulkExamBookingLines: Record "Bulk Processing Lines";
    begin
        status := 'danger*Examination Booking could not be made';
        if applicationNo = '' then begin
            BulkExamBookingHeader.Init;
            BulkExamBookingHeader."Document Type" := BulkExamBookingHeader."document type"::Booking;
            BulkExamBookingHeader.Validate("Document Type");


            BulkExamBookingHeader."Institution No." := institutionNo;
            BulkExamBookingHeader.Validate("Institution No.");
            BulkExamBookingHeader.Date := date;
            BulkExamBookingHeader.Validate(Date);



            if BulkExamBookingHeader.Insert(true) then begin
                status := 'success*Examination Booking was successfully made*' + BulkExamBookingHeader."No.";
            end else begin
                status := 'danger*Examination Booking could not be made';
            end;


        end else begin
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("No.", applicationNo);
            if studentProcessingHeader.FindSet then begin

                BulkExamBookingHeader."Document Type" := studentProcessingHeader."document type"::Booking;
                BulkExamBookingHeader.Validate("Document Type");



                BulkExamBookingHeader."Institution No." := institutionNo;
                BulkExamBookingHeader.Validate("Institution No.");
                BulkExamBookingHeader.Date := date;
                BulkExamBookingHeader.Validate(Date);

                if BulkExamBookingHeader.Modify(true) then begin
                    status := 'success*Examination Booking was successfully captured*' + BulkExamBookingHeader."No.";
                end else begin
                    status := 'danger*Examination Booking could not be captured';
                end;
            end;
        end;
    end;

    procedure CreateExemptionLine(itmType: Option; item: Code[50]; currency: Code[10]; apllicationNo: Code[50]) status: Text
    var
        exemptionLine: Record "Exemption Lines";
    begin
        status := 'danger*Your Exemption Line could not be added';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."approval status"::Open);
        studentProcessingHeader.SetRange("No.", apllicationNo);


        if studentProcessingHeader.FindSet then begin
            if (studentProcessingHeader."Document Type" = studentProcessingHeader."document type"::Exemption) then begin

                exemptionLine.Init;


                exemptionLine.Type := itmType;
                exemptionLine.Validate(Type);
                exemptionLine."Course Id" := currency;
                exemptionLine.Validate("Course Id");
                exemptionLine."No." := item;
                exemptionLine.Validate("No.");
                exemptionLine."Header No." := studentProcessingHeader."No.";
                exemptionLine.Validate("Header No.");
                exemptionLine."Line No." := getExemptionLineNo(studentProcessingHeader."No.");
                exemptionLine.Validate("Line No.");


                if exemptionLine.Insert(true) then begin

                    exemptionLine.Modify(true);
                    status := 'success*The Exemption was successfully added';
                end else begin
                    status := 'danger*Your Exemption details could not be added';
                end;
            end;
        end else begin
            status := 'danger*An Exemption with the given number does not exist,';
        end;
        exit(status);
    end;

    procedure CreateExemption(applicationNo: Code[250]; studentNo: Code[50]; regNo: Text) status: Text
    var
        myType: Text;
        exemptionHeader: Record "Exemption Entries";
        exemptionLine: Record "Exemption Lines";
    begin
        status := 'danger*Your Sales Order could not be captured';
        if applicationNo = '' then begin
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("Document Type", studentProcessingHeader."document type"::Exemption);
            studentProcessingHeader.SetRange("Student Reg. No.", regNo);
            if studentProcessingHeader.FindSet then begin
                status := 'danger*You have an existing Exemption Application';

            end else begin
                studentProcessingHeader.Init;
                studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::Exemption;
                studentProcessingHeader.Validate("Document Type");
                studentProcessingHeader."Student No." := studentNo;
                studentProcessingHeader.Validate("Student No.");
                studentProcessingHeader."Student Reg. No." := regNo;
                studentProcessingHeader.Validate("Student Reg. No.");
                studentProcessingHeader.Date := Today;
                studentProcessingHeader."Fee Type" := GetWorkTypeException(studentProcessingHeader."Examination ID");
                studentProcessingHeader.Validate("Fee Type");
                studentProcessingHeader.Portal := true;
                studentProcessingHeader.Validate(Portal);
                if studentProcessingHeader.Insert(true) then begin
                    status := 'success*Your Exemption was successfully captured*' + studentProcessingHeader."No.";
                end else begin
                    status := 'danger*Your Exemption could not be captured';
                end;
            end;
        end else begin
            studentProcessingHeader.Init;
            studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::Exemption;
            studentProcessingHeader.Validate("Document Type");
            studentProcessingHeader."Student No." := studentNo;
            studentProcessingHeader.Validate("Student No.");
            studentProcessingHeader."Student Reg. No." := regNo;
            studentProcessingHeader.Validate("Student Reg. No.");
            studentProcessingHeader.Date := Today;
            studentProcessingHeader."Fee Type" := GetWorkTypeException(studentProcessingHeader."Examination ID");
            studentProcessingHeader.Validate("Fee Type");
            studentProcessingHeader.Portal := true;
            studentProcessingHeader.Validate(Portal);
            if studentProcessingHeader.Insert(true) then begin
                status := 'success*Your Exemption was successfully captured*' + studentProcessingHeader."No.";
            end else begin
                status := 'danger*Your Exemption could not be captured';
            end;
        end;
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);
        if studentProcessingHeader.FindSet then begin

            studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::Exemption;
            studentProcessingHeader.Validate("Document Type");
            studentProcessingHeader."Student No." := studentNo;
            studentProcessingHeader.Validate("Student No.");
            studentProcessingHeader."Student Reg. No." := regNo;
            studentProcessingHeader.Validate("Student Reg. No.");
            studentProcessingHeader.Date := Today;
            studentProcessingHeader."Fee Type" := GetWorkTypeException(studentProcessingHeader."Examination ID");
            studentProcessingHeader.Validate("Fee Type");
            studentProcessingHeader.Portal := true;
            studentProcessingHeader.Validate(Portal);
            if studentProcessingHeader.Modify(true) then begin
                status := 'success*Your Exemption was successfully captured*' + studentProcessingHeader."No.";
            end else begin
                status := 'danger*Your Exemption could not be captured';
            end;
        end;

    end;

    procedure CreateWithdrawal(applicationNo: Code[250]; studentNo: Code[50]; regNo: Text; withdrawalReason: Text; examCycle: Code[50]) status: Text
    var
        myType: Text;
    begin
        status := 'danger*Your Withdrawal Application could not be made';
        if applicationNo = '' then begin
            //
            //       studentProcessingHeader.RESET;
            //       studentProcessingHeader.SETRANGE("Document Type",studentProcessingHeader."Document Type"::Withdrawal);
            //       studentProcessingHeader.SETRANGE("Student No.",studentNo);
            //       IF studentProcessingHeader.FINDSET THEN BEGIN
            //         status:='danger*You have an existing Withdrawal Application';
            //     END ELSE BEGIN
            studentProcessingHeader.Init;
            studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::Withdrawal;
            studentProcessingHeader.Validate("Document Type");
            studentProcessingHeader."Student No." := studentNo;
            studentProcessingHeader.Validate("Student No.");
            studentProcessingHeader."Student Reg. No." := regNo;
            studentProcessingHeader.Validate("Student Reg. No.");
            studentProcessingHeader.Date := Today;
            studentProcessingHeader.Validate(Date);
            studentProcessingHeader."Examination Sitting" := examCycle;
            studentProcessingHeader.Validate("Examination Sitting");
            studentProcessingHeader."Withdrawal Code" := withdrawalReason;

            studentProcessingHeader."Fee Type" := GetWorkTypewithdrawal(studentProcessingHeader."Examination ID");
            studentProcessingHeader.Validate("Fee Type");
            if studentProcessingHeader.Insert(true) then begin
                FetchPapers(studentProcessingHeader);
                studentProcessingHeader.Validate("Withdrawal Code");
                status := 'success*Your Withdrawal was successfully made*' + studentProcessingHeader."No." + '*' + studentProcessingHeader."Examination ID";

            end else begin
                status := 'danger*Your Withdrawal could not be made';
            end;
        end else begin
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("No.", applicationNo);
            if studentProcessingHeader.FindSet then begin
                studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::Withdrawal;
                studentProcessingHeader.Validate("Document Type");
                studentProcessingHeader.Date := Today;
                //studentProcessingHeader.VALIDATE(Date);
                studentProcessingHeader."Examination Sitting" := examCycle;
                studentProcessingHeader.Validate("Examination Sitting");
                studentProcessingHeader."Withdrawal Code" := withdrawalReason;
                //studentProcessingHeader.VALIDATE("Withdrawal Code");
                studentProcessingHeader."Fee Type" := GetWorkTypewithdrawal(studentProcessingHeader."Examination ID");
                studentProcessingHeader.Validate("Fee Type");
                if studentProcessingHeader.Modify(true) then begin
                    FetchPapers(studentProcessingHeader);
                    studentProcessingHeader.Validate("Withdrawal Code");
                    status := 'success*Your Withdrawal was successfully made*' + studentProcessingHeader."No." + '*' + studentProcessingHeader."Examination ID";
                end else begin
                    status := 'danger*Your Withdrawal could not be captured';
                end;
            end;
        end;
    end;

    procedure fnInsertMultipleSurveys(surveyno: Code[100]; sectioncode: Code[100]; questionid: Code[100]; responsevalue: Text) status: Text
    var
        BRMultipleResponse: Record "BR Multiple Response";
    begin
        BRMultipleResponse.Init;
        BRMultipleResponse."Survey Response ID" := surveyno;
        BRMultipleResponse."Section Code" := sectioncode;
        BRMultipleResponse."Question ID" := questionid;
        BRMultipleResponse."Question ID" := questionid;
        BRMultipleResponse."Response Value" := responsevalue;
        if BRMultipleResponse.Insert(true) then begin
            status := 'success*multiple response added successfully';
        end else begin
            status := 'danger*multiple response not added!';
        end;
    end;

    procedure fnInsertBranchingResponses(surveyno: Code[100]; sectioncode: Code[100]; parentquestionid: Code[100]; parentresponse: Code[100]; questionid: Code[100]; question: Text; generalresponse: Text) status: Text
    var
        BranchingResponse: Record "BR Branch Response Question";
    begin
        BranchingResponse.Reset;
        BranchingResponse.SetRange("Response ID", surveyno);
        BranchingResponse.SetRange("Section Code", sectioncode);
        BranchingResponse.SetRange("Parent Question ID", parentquestionid);
        BranchingResponse.SetRange("Parent Response", parentresponse);
        BranchingResponse.SetRange("Question ID", questionid);
        BranchingResponse.SetRange(Question, question);
        if BranchingResponse.FindSet then begin
            BranchingResponse."General Response Statement" := generalresponse;
            if BranchingResponse.Modify(true) then begin
                status := 'success*branching response added';
            end else begin
                status := 'danger*branching response not added';
            end;
        end;
    end;

    procedure fnSubmitSurvey(surveyno: Code[100]) status: Text
    var
        BusinessResearchResponse: Record "Business Research Response";
    begin
        BusinessResearchResponse.Reset;
        BusinessResearchResponse.SetRange("Document No.", surveyno);
        if BusinessResearchResponse.FindSet then begin
            BusinessResearchResponse.Status := BusinessResearchResponse.Status::Submitted;
            if BusinessResearchResponse.Modify(true) then begin
                status := 'success*Your survey response was successfully submitted, thank You for the response.';
            end else begin
                status := 'danger*The survey could not be submitted, kindly try again later!';
            end;
        end;
    end;

    procedure fnCreateBRResponseQuestions(surveyno: Code[100]; scectioncode: Code[100]; question: Code[100]; ratingoption: Text; generalresponse: Text) status: Text
    var
        ResponseQuestion: Record "BR Response Question";
        ResponseSection: Record "Business Research Response";
    begin
        ResponseQuestion.Reset;
        ResponseQuestion.SetRange("Survey Response ID", surveyno);
        ResponseQuestion.SetRange("Section Code", scectioncode);
        ResponseQuestion.SetRange("Question ID", question);
        if ResponseQuestion.FindSet then begin
            ResponseQuestion."Response Value" := ratingoption;
            ResponseQuestion."General Response Statement" := generalresponse;
            if ResponseQuestion.Modify(true) then begin
                //ResponseSection.RESET;
                //ResponseSection.SETRANGE("Document No.",surveyno);
                //IF ResponseSection.FINDSET THEN BEGIN
                // ResponseSection.Status:=ResponseSection.Status::Submitted;
                //IF ResponseSection.MODIFY(TRUE) THEN BEGIN
                status := 'success*Your response was submitted successfully*';
            end else begin
                status := 'danger*Your response could not be submitted please try again!*';
            end;
            //END;
            //END;
        end;
    end;

    procedure CreateRenewal(applicationNo: Code[250]; studentNo: Code[50]; regNos: Code[50]; amount: Decimal) status: Text
    var
        myType: Text;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ExaminationSetup: Record "Examination Setup";
    begin
        status := 'danger*Your Renewal application could not be made';
        if applicationNo = '' then begin

            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("Document Type", studentProcessingHeader."document type"::Renewal);
            studentProcessingHeader.SetRange("Student No.", studentNo);
            if studentProcessingHeader.FindSet then begin
                status := 'danger*You have an existing Renewal Application';

            end else begin

                studentProcessingHeader.Init;
                studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::Renewal;
                studentProcessingHeader."Student No." := studentNo;
                studentProcessingHeader.Validate("Student No.");
                studentProcessingHeader.Portal := true;
                studentProcessingHeader.Validate(Portal);
                if studentProcessingHeader.Insert(true) then begin
                    status := 'success*Your Renewal was successfully made*' + studentProcessingHeader."No.";
                    CreateRenewalLine(studentNo, regNos, studentProcessingHeader."No.", amount);
                end else begin
                    status := 'danger*Your Renewal could not be made';
                end;
            end;


        end else begin
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("No.", applicationNo);
            if studentProcessingHeader.FindSet then begin

                studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::Renewal;
                studentProcessingHeader.Validate("Document Type");

                studentProcessingHeader."Student No." := studentNo;
                studentProcessingHeader.Validate("Student No.");
                studentProcessingHeader.Portal := true;
                studentProcessingHeader.Validate(Portal);

                if studentProcessingHeader.Modify(true) then begin
                    status := 'success*Your Withdrawal was successfully captured*' + studentProcessingHeader."No.";
                end else begin
                    status := 'danger*Your Withdrawal could not be captured';
                end;
            end;
        end;
    end;

    procedure CreateReactivation(applicationNo: Code[250]; studentNo: Code[50]) status: Text
    var
        myType: Text;
    begin
        status := 'danger*Your Reactivation Application could not be made';
        if applicationNo = '' then begin



            studentProcessingHeader.Init;
            studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::"Re-Activation";
            studentProcessingHeader.Validate("Document Type");
            studentProcessingHeader."Student No." := studentNo;
            studentProcessingHeader.Validate("Student No.");


            if studentProcessingHeader.Insert(true) then begin
                status := 'success*Your Reactivation application was successfully made*' + studentProcessingHeader."No.";
            end else begin
                status := 'danger*Your Reactivation application could not be made';
            end;


        end else begin
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("No.", applicationNo);
            if studentProcessingHeader.FindSet then begin

                studentProcessingHeader."Document Type" := studentProcessingHeader."document type"::"Re-Activation";
                studentProcessingHeader.Validate("Document Type");

                studentProcessingHeader."Student No." := studentNo;
                studentProcessingHeader.Validate("Student No.");

                if studentProcessingHeader.Modify(true) then begin
                    status := 'success*Your Reactivation application was successfully captured*' + studentProcessingHeader."No.";
                end else begin
                    status := 'danger*Your reactivation application could not be captured';
                end;
            end;
        end;
    end;

    procedure CreateRenewalLine(studentNo: Code[50]; RegNo: Code[50]; ApplicationNo: Code[50]; amount: Decimal) status: Text
    begin

        studentprocessingLines.Init;
        studentprocessingLines."Booking Header No." := ApplicationNo;
        studentprocessingLines."Document Type" := studentprocessingLines."document type"::Renewal;
        studentprocessingLines."Student No." := studentNo;
        studentprocessingLines.Validate("Student No.");


        studentprocessingLines."Registration No." := RegNo;
        studentprocessingLines.Validate("Registration No.");

        studentprocessingLines."Line No." := getDeffermentLineNo(studentprocessingLines."Document Type", studentProcessingHeader."No.");
        studentprocessingLines.Validate("Line No.");
        studentprocessingLines.Amount := amount;
        studentprocessingLines.Validate(Amount);
        studentprocessingLines."Amount LCY" := amount;
        studentprocessingLines.Validate("Amount LCY");
        studentprocessingLines.Description := 'Renewal Application';
        if studentprocessingLines.Insert(true) then begin

            studentprocessingLines.Modify(true);
            status := 'success*The renewal was successfully added';
        end else begin
            status := 'danger*Your renewal details could not be added';
        end;

        exit(status);
    end;

    procedure CreateReactivationLine(applicationNo: Code[50]; regNumber: Code[50]; amt: Decimal; studentNo: Code[50]) status: Text
    begin
        status := 'danger*Your Re-Activation Line could not be added';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."approval status"::Open);
        studentProcessingHeader.SetRange("No.", applicationNo);


        if studentProcessingHeader.FindSet then begin
            if (studentProcessingHeader."Document Type" = studentProcessingHeader."document type"::"Re-Activation") then begin
                if studentProcessingHeader."Document Type" = studentProcessingHeader."document type"::"Re-Activation" then begin
                    studentprocessingLines."Document Type" := studentprocessingLines."document type"::"Re-Activation";
                end;
                studentprocessingLines.Init;
                //Document Type,Document No.,Line No.

                studentprocessingLines."Student No." := studentNo;
                studentprocessingLines.Validate("Student No.");
                studentprocessingLines."Booking Header No." := applicationNo;
                studentprocessingLines.Validate("Booking Header No.");
                studentprocessingLines."Registration No." := regNumber;
                studentprocessingLines.Validate("Registration No.");

                studentprocessingLines."Line No." := getDeffermentLineNo(studentprocessingLines."Document Type", studentProcessingHeader."No.");
                studentprocessingLines.Validate("Line No.");


                studentprocessingLines.Amount := amt;
                studentprocessingLines.Validate(Amount);

                if studentprocessingLines.Insert(true) then begin

                    studentprocessingLines.Modify(true);
                    status := 'success*The Re-Activation was successfully added';
                end else begin
                    status := 'danger*Your Re-Activation details could not be added';
                end;
            end;
        end else begin
            status := 'danger*A Re-Activation with the given number does not exist,';
        end;
        exit(status);
    end;

    procedure FnAddDisability(applicationNo: Code[50]; disatilityType: Code[50]; description: Text) status: Text
    var
        studentsDisability: Record "Student Disability";
    begin
        status := 'danger*The details could not be added';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);

        //studentProcessingHeader.SETRANGE("Approval Status",studentProcessingHeader."Approval Status"::Open);
        if studentProcessingHeader.FindSet then begin
            //studentsDisability.SETRANGE("Student No.", applicationNo);
            studentsDisability.Init;

            studentsDisability."Student No." := applicationNo;
            studentsDisability.Validate("Student No.");
            studentsDisability."Disability Type" := disatilityType;
            studentsDisability.Validate("Disability Type");
            studentsDisability."Disability Name" := description;



            if studentsDisability.Insert(true) then begin
                studentProcessingHeader.Disabled := true;


                studentProcessingHeader.Modify(true);
                status := 'success*The details was successfully added';
            end else begin
                status := 'danger*The details could not be added';
            end;
        end else begin
            status := 'danger*The application No given does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure GenerateTimetable("code": Code[50]) status: Text
    var
        TimetablePlanner: Record "Timetable Planner Header";
    begin
        TimetablePlanner.Reset;
        TimetablePlanner.SetRange(TimetablePlanner.Code, code);
        TimetablePlanner.SetFilter(TimetablePlanner.Code, '%1', code);
        if TimetablePlanner.FindSet then begin
            if FILE.Exists(FILESPATH7 + code + '.pdf') then begin
                FILE.Erase(FILESPATH7 + code + '.pdf');
                //Report.SaveAsPdf(85012, FILESPATH7 + code + '.pdf', TimetablePlanner);
                status := 'success*downloads\timetable\' + code + '.pdf';
            end else begin
                //Report.SaveAsPdf(85012, FILESPATH7 + code + '.pdf', TimetablePlanner);
                status := 'success*downloads\timetable\' + code + '.pdf';
            end
        end else begin
            status := 'danger*The Timetable could not be generated';
        end;
    end;

    procedure FnSubmitApplication(applicationNo: Code[50]) status: Text
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);
        if studentProcessingHeader.FindSet then begin
            studentProcessingHeader."Last Modified Date Time" := CurrentDatetime;
            //studentProcessingHeader."Document Type":=studentProcessingHeader."Document Type"::Registration;

            studentProcessingHeader."Approval Status" := studentProcessingHeader."approval status"::Open;
            studentProcessingHeader.Portal := true;
            studentProcessingHeader.Submitted := true;
            if studentProcessingHeader.Modify(true) then begin
                status := 'success*Your Application was successfully submitted.';
            end else begin
                status := 'danger*The Application could not be submitted, kindly try again later!';
            end;
        end;
    end;

    procedure StudentTimetable("code": Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        Cust: Record Customer;
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", code);
        StudentProcessingHeader.SetFilter(StudentProcessingHeader."No.", '%1', code);
        if StudentProcessingHeader.FindSet then begin
            //added to modify the Booking image
            if StudentProcessingHeader.Image.Hasvalue = false then begin
                Cust.Reset;
                Cust.SetRange("No.", StudentProcessingHeader."Student No.");
                if Cust.FindSet then begin
                    if (Cust.Image.Hasvalue = true) and StudentProcessingHeader.Image.Hasvalue = false then begin
                        StudentProcessingHeader.Image := Cust.Image;
                        StudentProcessingHeader.Modify;
                    end;
                end;
            end;

            appNo := ConvertStr(code, '-', '_');
            appNo := ConvertStr(code, ':', '_');



            if FILE.Exists(FILESPATH8 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH8 + appNo + '.pdf');


                Report.SaveAsPdf(85026, FILESPATH8 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\studentTimetable\' + appNo + '.pdf';

            end else begin

                Report.SaveAsPdf(85026, FILESPATH8 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\studentTimetable\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The Timetable could not be generated';
        end;
    end;

    procedure Invoice("code": Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        HRSetupNew: Record "Examination Setup";
        emailBody: Text;
        emailhdr: Text;
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
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", code);
        StudentProcessingHeader.SetFilter(StudentProcessingHeader."No.", '%1', code);
        if StudentProcessingHeader.FindSet then begin
            appNo := ConvertStr(code, '-', '_');
            appNo := ConvertStr(code, ':', '_');



            if FILE.Exists(FILESPATH9 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH9 + appNo + '.pdf');


                Report.SaveAsPdf(85042, FILESPATH9 + appNo + '.pdf', StudentProcessingHeader);
                FileName := FILESPATH9 + appNo + '.pdf';
                //SMTPMailSetup.GET;
                //     Email2 := SMTPMailSetup."Email Sender Address";
                //     Body := 'Registration Invoice';
                //     SMTP.Create('Invoice', Email2, StudentProcessingHeader.Email,
                //      'Invoice',
                //     'Dear ' + StudentProcessingHeader."First Name" + ',<BR><BR>' +
                //     'Please find Attached Invoice For the registration of <b>' + '</b><BR>' +
                //    'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="184.174.39.195:8090/">Student Portal</a></b><BR>'
                //     + '<BR>'
                //    , TRUE);
                //     SMTP.AddBCC(HRSetupNew."Student Module EMail BCC");
                //     SMTP.AddAttachment(FILESPATH9 + appNo + '.pdf', FileName);
                //     SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examination <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
                //     SMTP.Send();

                emailBody := 'Dear ' + StudentProcessingHeader."First Name" + ',<BR><BR>' +
                    'Please find Attached Invoice For the registration of <b>' + '</b><BR>' +
                   'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="online.hrmpeb.or.ke/">Student Portal</a></b><BR>'
                    + '<BR>';

                emailhdr := 'Registration Invoice';

                //  SendEmailNotification(StudentProcessingHeader.Email, emailhdr, emailBody);
                //SendEmailNotification(StudentProcessingHeader.Email, 'Registration Invoice', Body);
                //-----------------------------------------------------Matara...............................
                //  Recipients.Add('edwinmatara@dynasoft.co.ke');

                // get the customer record and save the report to outstream then do instream and wrtie it to text
                BulkProcessingHead.reset();
                BulkProcessingHead.SetRange("No.", code);
                RecRef.GetTable(BulkProcessingHead);
                TempBlob.CreateOutStream(OutStr);
                Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
                TempBlob.CreateInStream(InStr);
                InStr.ReadText(BodyTxt);

                EmailMessage.Create(StudentProcessingHeader.Email, 'Registration Invoice', 'Dear ' + StudentProcessingHeader."First Name" + ' ' + StudentProcessingHeader."Middle Name" + ' ' + StudentProcessingHeader.Surname + ',<BR></BR>' +
                    'Please find Attached Invoice For the registration.<BR></BR>' +
                   'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="https://online.hrmpeb.or.ke/">Student Portal</a></b><BR>'
                    + '</BR>', true);

                // add attachment for with pdf
                TempBlob.CreateOutStream(OutStr2);
                Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
                TempBlob.CreateInStream(InStr2);
                // EmailMessage.AddAttachmentStream(InStr2, 'attachment.pdf');
                // EmailMessage.add
                EmailMessage.AddAttachment('Registration_Invoice.pdf', 'PDF', InStr2);
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

                //------------------------------------------------------Matara Email----------------------------------

                status := 'success*downloads\SubmitInvoice\' + appNo + '.pdf';

            end else begin

                Report.SaveAsPdf(85042, FILESPATH9 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\SubmitInvoice\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The Proforma Invoice could not be generated';
        end;
    end;

    procedure AddRegistrationSharepointLinks(applicationNo: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        studentProcessingHeader: Record "Student Processing Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **************************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("No.", applicationNo);
            studentProcessingHeader.SetRange("Document Type", studentProcessingHeader."document type"::Registration);
            if studentProcessingHeader.FindSet then
                RecordIDNumber := studentProcessingHeader.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*The document was successfully attached';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;

        // //test
        // IF integration.insert=TRUE THEN BEGIN
        // studentProcessingHeader.RESET;
        //  studentProcessingHeader.SETRANGE("No.",integration.accountno);
        //  IF studentProcessingHeader.FINDFIRST THEN BEGIN
        //    examination.applicationcreateinvoice(studentProcessingHeader);
        //  examination.applicationcreatereceipt(studentprocessinghaeder)
        //   END
        // END
        // //end test
    end;

    procedure FnConfirmPayment(ApplicationNo: Code[50]; PhoneNumber: Code[50]; Amount: Decimal) status: Text
    var
        MpesaIntegration: Record "MPESA Integration Table";
    begin
        status := 'danger*Your Payment Application could not be made';
        MpesaIntegration.Init;
        MpesaIntegration.MPESA_TXN_ID := ApplicationNo;
        MpesaIntegration.ACCOUNT_NUMBER := ApplicationNo;
        MpesaIntegration.MSISDN_CUSTOMER := PhoneNumber;
        MpesaIntegration.MPESA_AMOUNT := Amount;
        if MpesaIntegration.Insert(true) then begin
            //      studentProcessingHeader.RESET;
            //      studentProcessingHeader.SETRANGE(studentProcessingHeader."No.",ApplicationNo);
            //      IF studentProcessingHeader.FINDFIRST THEN BEGIN
            //         IF studentProcessingHeader."Student No."='' THEN BEGIN
            //                ApplicationOnboardCustomer(studentProcessingHeader);
            //
            //          END ELSE BEGIN
            //               ApplicationCreateInvoice(studentProcessingHeader);
            //
            //          END;
            //
            //      END
            status := 'success*Payment Made Successfully.A receipt has been sent to your Email. Please wait for the processing of your application';
        end else
            status := 'danger*Payment Failed. Please try again.';
    end;

    local procedure GetWorkType(Header: Code[30]) WorkType: Code[30]
    var
        Resource: Record Resource;
        ResourcePrice: Record "Resource Price";
    begin
        Resource.Reset;
        Resource.SetRange("Course ID", Header);

        Resource.SetRange(Blocked, false);
        if Resource.FindSet then begin
            repeat
                ResourcePrice.Reset;
                ResourcePrice.SetRange("Currency Code", '');
                ResourcePrice.SetRange("Work Type Code", Resource."No.");
                if ResourcePrice.FindFirst then begin
                    if ResourcePrice."Document Type" = ResourcePrice."document type"::Registration then
                        WorkType := ResourcePrice."Work Type Code";

                    //ERROR('');
                end;

            until Resource.Next = 0;
        end;
        exit(WorkType);
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
            Commit;
            Cust."Bill-to Customer No." := AppNo;
            Cust.Validate("Bill-to Customer No.");
            Cust.Modify(true);
            BulkProcessingHeader.Created := true;
            BulkProcessingHeader."Student No." := Cust."No.";
            BulkProcessingHeader."Student Name" := Cust.Name;
            BulkProcessingHeader.Modify;
            IF BulkProcessingHeader."Application Invoice" = '' THEN BEGIN
                ApplicationCreateInvoice(BulkProcessingHeader);
            END;
        end
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
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        ExaminationSetup.Get;
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
                BulkProcessingHeader."Application Invoice" := SalesInv."No.";
                BulkProcessingHeader.Modify;
                Commit;
                ApplicationCReceipt(BulkProcessingHeader);
            end else begin
                //process the receipt
                ApplicationCReceipt(BulkProcessingHeader);
            end
        end
        else begin
            //process the receipt
            ApplicationCReceipt(BulkProcessingHeader);
        end
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
        IntegrationTable: Record "MPESA Integration Table";
    begin
        //code to post the created invoice
        ExaminationSetup.Get;
        ExaminationSetup.TestField("Payments Bank Code");
        CashMngmntSetup.Get();
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.FindFirst then begin
            SalesPostYesNo.Run(SalesInv);
        end;
        IntegrationTable.Reset;
        IntegrationTable.SetRange(ACCOUNT_NUMBER, BulkProcessingHeader."No.");
        IntegrationTable.SetRange(Fetch, false);
        if IntegrationTable.FindFirst then begin
            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := IntegrationTable.MPESA_TXN_ID;
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
            ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Paid amount';
            ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
            ReceiptLines.Validate("Account No.");
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.VALIDATE("Applies to Doc. No");
            end;
            ReceiptLines.Amount := IntegrationTable."Remaining Amount";
            ReceiptLines."Amount (LCY)" := IntegrationTable."Remaining Amount";

            ReceiptLines.Insert(true);
            ReceiptHeader.CalcFields(Amount);
            if ReceiptHeader.Amount > 0 then begin
                PostReceipt(ReceiptHeader);
                BulkProcessingHeader."Application Receipt" := ReceiptHeader."No.";
                BulkProcessingHeader.Modify(true);
            end;
        end else begin
            ReceiptHeader.Reset;
            ReceiptHeader.SetRange("Cheque No", BulkProcessingHeader."No.");
            ReceiptHeader.SetRange(Posted, false);
            if ReceiptHeader.FindFirst then begin
                PostReceipt(ReceiptHeader);
                BulkProcessingHeader."Application Receipt" := ReceiptHeader."No.";
                BulkProcessingHeader.Modify(true);
            end;
        end;

        if BulkProcessingHeader.Portal = false then begin

            BulkProcessingHeader."Application Receipt" := ReceiptHeader."No.";
            BulkProcessingHeader.Posted := true;
            BulkProcessingHeader."Posted By" := UserId;
            BulkProcessingHeader."Posted On" := CurrentDatetime;
            BulkProcessingHeader.Modify;
        end
        //END

        //send email receipt
    end;


    procedure PostReceipt(ReceiptRec: Record "Receipts Header1")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        Batch: Record "Gen. Journal Batch";
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.Reset;
        CustLedgerEntry.SetRange("Document No.", ReceiptRec."No.");
        if not CustLedgerEntry.FindFirst then begin

            ReceiptRec.TestField(Date);
            ReceiptRec.TestField("Bank Code");
            ReceiptRec.TestField("Received From");
            ReceiptRec.TestField("Pay Mode");

            if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
                ReceiptRec.TestField("Cheque No");
                ReceiptRec.TestField("Cheque Date");
            end;

            ReceiptRec.CalcFields(Amount);

            if ReceiptRec.Amount = 0 then
                Error('Amount for the receipt %1 cannot be zero', ReceiptRec."No.");
            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            if not RcptLines.FindLast then
                Error('Receipt Lines for receipt %1 cannot be empty', ReceiptRec."No.");

            CMSetup.Get();
            //Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
            GenJnLine.DeleteAll;


            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Receipt Template";
            Batch.Name := CMSetup."Receipt Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            //Bank Entries
            LineNo := LineNo + 10000;

            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            RcptLines.Validate(Amount);
            RcptLines.CalcSums(Amount);



            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
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
            if RcptLines.FindFirst then begin
                repeat
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
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
                    GenJnLine."Shortcut Dimension 3 Code" := RcptLines."Shortcut Dimension 3 Code";
                    GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

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
                Commit;
            end;
        end else begin
            ReceiptRec.Posted := true;
            ReceiptRec."Posted By" := UserId;
            ReceiptRec."Posted Date" := ReceiptRec."Posted Date";
            ReceiptRec."Posted Time" := Time;
            ReceiptRec.Modify;
            Commit;
        end
    end;


    procedure FnUploadStudentPhoto(applicationNo: Code[20]; path: Text[250]; fileName: Text[100])
    var
        _record: Record "Student Processing Header";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."No.", applicationNo);
        if (_record.Find('-')) then begin
            //_record.ADDLINK(path,fileName);
            fileName := path + Format(_record."No.") + '.jpg';
            if _record.Image.Hasvalue then Clear(_record.Image);

            if FILE.Exists(path) then begin
                InputFile.Open(path);
                // InputFile.CREATEINSTREAM(InPutStream);
                _record.Image.ImportFile(fileName, Format(_record."No.") + '.jpg');
                // COPYSTREAM(OutPutStream,InPutStream);
                _record.Modify;
                InputFile.Close;
            end;


        end;
    end;

    local procedure GetWorkTypeException(Header: Code[30]) WorkType: Code[30]
    var
        Resource: Record Resource;
        ResourcePrice: Record "Resource Price";
    begin
        Resource.Reset;
        Resource.SetRange("Course ID", Header);
        //Resource.SETRANGE("Part ID",);
        Resource.SetRange(Blocked, false);
        if Resource.FindSet then begin
            repeat
                ResourcePrice.Reset;
                ResourcePrice.SetRange("Currency Code", '');
                ResourcePrice.SetRange("Work Type Code", Resource."No.");
                if ResourcePrice.FindFirst then begin
                    if ResourcePrice."Document Type" = ResourcePrice."document type"::Exemption then
                        WorkType := ResourcePrice."Work Type Code";

                    //ERROR('');
                end;

            until Resource.Next = 0;
        end;
        exit(WorkType);
    end;

    procedure CreateExemptionQualifications(applicationNo: Code[50]; QualificationType: Option; QulificatioCode: Code[50]) status: Text
    var
        ExemptionQualifications: Record "Exemption Qualifications";
    begin
        status := 'danger*The details could not be added';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);

        //studentProcessingHeader.SETRANGE("Approval Status",studentProcessingHeader."Approval Status"::Open);
        if studentProcessingHeader.FindSet then begin
            ExemptionQualifications.Reset;
            ExemptionQualifications.SetRange("Document No.", applicationNo);
            ExemptionQualifications.SetRange("Qualification Code", QulificatioCode);
            if ExemptionQualifications.FindSet then begin
                status := 'danger*The Qualification already exists';
            end else begin
                ExemptionQualifications.Init;
                ExemptionQualifications."Document No." := applicationNo;
                ExemptionQualifications."Qualification Type" := QualificationType;
                ExemptionQualifications.Validate("Qualification Type");
                ExemptionQualifications."Qualification Code" := QulificatioCode;
                ExemptionQualifications.Validate("Qualification Code");

                if ExemptionQualifications.Insert(true) then begin

                    status := 'success*Your qualifications were successfully added';
                end else begin
                    status := 'danger*Your qualifications could not be added';
                end;
            end;
        end else begin
            status := 'danger*The application No given does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
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
        emailBody: Text;
        emailhdr: Text;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        // //GET Assigned registration number
        // ExaminationAccount.RESET;
        // ExaminationAccount.SETRANGE("Student Cust No.",StudentProcessingHeader."Student No.");
        // IF ExaminationAccount.FINDFIRST THEN BEGIN
        //  RegistrationNo:=ExaminationAccount."Registration No.";
        // END;
        // SMTP.Create('HRMPEB STUDENT REGISTRATION', Email2, StudentProcessingHeader.Email,
        // 'HRMPEB STUDENT REGISTRATION',
        // 'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        // 'Your application for registration has been received <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' +
        // 'Find attached the receipt:' + StudentProcessingHeader."Application Receipt" + ' as you await approval of the registration request', true);

        // FileName := StudentProcessingHeader."Application Receipt" + '.pdf';
        // FileLocation := ExaminationSetup."Examination Path" + FileName;

        // ReceiptsHeader1.Reset;
        // ReceiptsHeader1.SetRange("No.", StudentProcessingHeader."No.");
        // if ReceiptsHeader1.FindFirst then begin
        //     Report.SaveAsPdf(85049, FileLocation, ReceiptsHeader1);
        //     SMTP.AddAttachment(FileLocation, FileName);
        // end;


        // SMTP.AddBCC(Email2);
        // SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
        // SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        // SMTP.AppendToBody('<BR><BR>HRMPEB Registration Department<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
        // SMTP.Send();
        emailBody := 'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        'Your application for registration has been received <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' +
        'Find attached the receipt:' + StudentProcessingHeader."Application Receipt" + ' as you await approval of the registration request' +
        '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' + '<BR><BR>HRMPEB Registration Department<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>';

        emailhdr := 'HRMPEB STUDENT REGISTRATION';
        SendEmailNotification(StudentProcessingHeader.Email, emailhdr, emailBody);
        //SendEmailNotification(, 'HRMPEB STUDENT REGISTRATION', Body);

    end;

    procedure ExemptionLetter("code": Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", code);
        StudentProcessingHeader.SetFilter(StudentProcessingHeader."No.", '%1', code);
        if StudentProcessingHeader.FindSet then begin
            appNo := ConvertStr(code, '-', '_');
            appNo := ConvertStr(code, ':', '_');



            if FILE.Exists(FILESPATH10 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH10 + appNo + '.pdf');


                Report.SaveAsPdf(85022, FILESPATH10 + appNo + '.pdf', StudentProcessingHeader);

                status := 'success*downloads\ExemptionLetter\' + appNo + '.pdf';

            end else begin

                Report.SaveAsPdf(85022, FILESPATH10 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\ExemptionLetter\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The Exemption Letter could not be generated';
        end;
    end;

    procedure FnSubmitExeptionApplication(applicationNo: Code[50]) status: Text
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);
        if studentProcessingHeader.FindSet then begin
            studentProcessingHeader."Approval Status" := studentProcessingHeader."approval status"::Open;
            studentProcessingHeader."Last Modified Date Time" := CurrentDatetime;
            studentProcessingHeader.Submitted := true;
            if studentProcessingHeader.Modify(true) then begin
                ExaminationCodeunit.RunAutoExemptSingle(studentProcessingHeader);
                status := 'success*Your Exemption Application was successfully submitted. Please wait while your applicaton is being processed.';
            end else begin
                status := 'danger*The Application could not be submitted, kindly try again later!';
            end;
        end;
    end;

    procedure EditRegistrationApplication(ApplicationNo: Code[50]; Gender: Option; Dob: Date; address: Text; PhoneNumber: Text) status: Text
    var
        studentProcessiingHeader: Record "Student Processing Header";
    begin

        status := 'danger*The Application could not be edited';
        studentProcessiingHeader.Reset;
        studentProcessiingHeader.SetRange("No.", ApplicationNo);
        if studentProcessiingHeader.FindSet then begin
            studentProcessiingHeader."Phone No." := PhoneNumber;
            studentProcessiingHeader.Gender := Gender;
            studentProcessiingHeader.Validate(Gender);
            studentProcessiingHeader."Date of Birth" := Dob;
            studentProcessiingHeader.Address := address;


            if studentProcessiingHeader.Modify(true) then begin
                status := 'success*The Registration application was successfully modified';
            end else begin
                status := 'danger*The Registration application could not be edited';
            end;
        end;
    end;

    procedure FnConfirmAttendance(applicantNumber: Text; studentNo: Code[10]; TrainingNo: Code[10]) status: Text
    var
        TrainingResponce: Record "CRM Student Applications";
    begin
        TrainingResponce.Reset;
        TrainingResponce.SetRange("Application No.", applicantNumber);

        if TrainingResponce.FindSet then begin
            TrainingResponce."Document Type" := TrainingResponce."document type"::Training;
            TrainingResponce.Validate("Document Type");
            TrainingResponce."Student No." := studentNo;
            TrainingResponce.Validate("Student No.");
            TrainingResponce."Document ID" := TrainingNo;

            if TrainingResponce.Modify(true) then begin
                status := 'success*Confirmed!.*' + TrainingResponce."Application No.";

            end
            else begin
                status := 'danger*Could Not confirm attendance.Kindly Contact System Administrator';
            end;
        end;


        TrainingResponce.Init;



        TrainingResponce."Document Type" := TrainingResponce."document type"::Training;
        TrainingResponce.Validate("Document Type");
        TrainingResponce."Student No." := studentNo;
        TrainingResponce.Validate("Student No.");
        TrainingResponce."Document ID" := TrainingNo;
        if TrainingResponce.Insert(true) then begin

            status := 'success*Your Attendance has been confirmed.Thank you.!*' + TrainingResponce."Application No.";


        end else begin
            status := 'danger*Your Attendance has been confirmed.Kindly Contact System Administrator';
        end;



        exit(status);
    end;

    procedure FnApplyJob(applicantNumber: Text; studentNo: Code[10]; TrainingNo: Code[10]) status: Text
    var
        Vacancy: Record "CRM Student Applications";
    begin
        Vacancy.Reset;
        Vacancy.SetRange("Application No.", applicantNumber);

        if Vacancy.FindSet then begin
            Vacancy."Document Type" := Vacancy."document type"::"Job Application";
            Vacancy.Validate("Document Type");
            Vacancy."Student No." := studentNo;
            Vacancy.Validate("Student No.");
            Vacancy."Document ID" := TrainingNo;

            if Vacancy.Modify(true) then begin
                status := 'success*Confirmed!.*' + Vacancy."Application No.";

            end
            else begin
                status := 'danger*Could Not Apply for a job.Kindly Contact System Administrator';
            end;
        end;


        Vacancy.Init;



        Vacancy."Document Type" := Vacancy."document type"::"Job Application";
        Vacancy.Validate("Document Type");
        Vacancy."Student No." := studentNo;
        Vacancy.Validate("Student No.");
        Vacancy."Document ID" := TrainingNo;
        if Vacancy.Insert(true) then begin

            status := 'success*Your Job application has been confirmed.Thank you.!*' + Vacancy."Application No.";


        end else begin
            status := 'danger*Your Job application has been confirmed.Kindly Contact System Administrator';
        end;



        exit(status);
    end;

    procedure AddExemptionSharepointLinks(applicationNo: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        studentProcessingHeader: Record "Student Processing Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **************************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("No.", applicationNo);
            studentProcessingHeader.SetRange("Document Type", studentProcessingHeader."document type"::Exemption);
            if studentProcessingHeader.FindSet then
                RecordIDNumber := studentProcessingHeader.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*The document was successfully attached';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;

        // //test
        // IF integration.insert=TRUE THEN BEGIN
        // studentProcessingHeader.RESET;
        //  studentProcessingHeader.SETRANGE("No.",integration.accountno);
        //  IF studentProcessingHeader.FINDFIRST THEN BEGIN
        //    examination.applicationcreateinvoice(studentProcessingHeader);
        //  examination.applicationcreatereceipt(studentprocessinghaeder)
        //   END
        // END
        // //end test
    end;

    local procedure GetWorkTypeBooking(Header: Code[30]; currency: Code[50]) WorkType: Code[30]
    var
        Resource: Record Resource;
        ResourcePrice: Record "Resource Price";
    begin
        Resource.Reset;
        Resource.SetRange("Course ID", Header);
        Resource.SetRange(Blocked, false);
        if Resource.FindSet then begin
            repeat
                ResourcePrice.Reset;
                ResourcePrice.SetRange("Currency Code", '');
                ResourcePrice.SetRange("Work Type Code", Resource."No.");
                if ResourcePrice.FindFirst then begin
                    if ResourcePrice."Document Type" = ResourcePrice."document type"::Booking then
                        WorkType := ResourcePrice."Work Type Code";

                    //ERROR('');
                end;

            until Resource.Next = 0;
        end;
        exit(WorkType);
    end;

    procedure FnInsertBookingLines("part": Code[50]; paper: Code[50]; applicationNo: Code[50]) status: Text
    var
        ExamPapersCounter: Integer;
        StudentProcessingLines1: Record "Student Processing Lines";
    begin
        status := 'danger*Examination Booking could not be added';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."approval status"::Open);
        studentProcessingHeader.SetRange("No.", applicationNo);
        studentProcessingHeader.SetRange("Document Type", studentProcessingHeader."document type"::Booking);

        if studentProcessingHeader.FindSet then begin
            // IF (studentProcessingHeader."Document Type"=studentProcessingHeader."Document Type"::Booking)THEN BEGIN
            //       IF studentProcessingHeader."Document Type"= studentProcessingHeader."Document Type"::Booking THEN BEGIN
            //        studentprocessingLines."Document Type":= studentprocessingLines."Document Type"::Booking;
            //        END;
            //        studentprocessingLines.RESET;
            //        studentprocessingLines.SETRANGE("Booking Header No.",applicationNo);
            //        IF studentprocessingLines.FINDSET THEN BEGIN
            //          ExamPapersCounter:=studentprocessingLines.COUNT;
            //          IF ExamPapersCounter > 3 THEN BEGIN
            //            status:='danger*you can only select three papers';
            //            END;
            //        END;
            StudentProcessingLines1.Reset;
            StudentProcessingLines1.SetRange("Booking Header No.", applicationNo);
            StudentProcessingLines1.SetRange(Paper, paper);
            if StudentProcessingLines1.FindFirst then begin
                status := 'danger*There already Exists an entry for Paper No ' + StudentProcessingLines1.Paper;
            end else begin
                studentprocessingLines.Init;
                studentprocessingLines."Document Type" := studentprocessingLines."document type"::Booking;
                studentprocessingLines."Booking Header No." := studentProcessingHeader."No.";
                studentprocessingLines.Validate("Booking Header No.");
                studentprocessingLines."Course Id" := studentProcessingHeader."Examination ID";
                studentprocessingLines.Validate("Course Id");
                studentprocessingLines."Booking Type" := studentprocessingLines."booking type"::Paper;
                studentprocessingLines."Line No." := getDeffermentLineNo(studentprocessingLines."Document Type", studentProcessingHeader."No.");
                studentprocessingLines.Validate("Line No.");
                studentprocessingLines.Part := part;
                studentprocessingLines.Validate(Part);
                studentprocessingLines.Paper := paper;
                studentprocessingLines.Validate(Paper);


                if studentprocessingLines.Insert(true) then begin

                    //studentprocessingLines.MODIFY(TRUE);
                    status := 'success*Examination Booking was successfully added ' + studentProcessingHeader."No.";
                    //          END ELSE BEGIN
                    //            status:='danger*Examination Booking details could not be added';
                    //            END;
                end;
            end
            //        ELSE BEGIN
            //         status:='danger*The selected paper already exist';
            //         END;

        end else begin
            status := 'danger*Examination Booking with the given number does not exist,';
        end;
        // END;
        exit(status);
    end;

    procedure RemoveExaminationPaper(applicationNo: Code[50]; EntryNo: Code[10]) status: Text
    var
        BookingLine: Record "Student Processing Lines";
    begin
        status := 'danger*The fuel could not be removed';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."approval status"::Open);
        if studentProcessingHeader.FindSet then begin

            BookingLine.Reset;
            BookingLine.SetRange("Booking Header No.", applicationNo);
            BookingLine.SetRange(Paper, EntryNo);
            if BookingLine.FindSet then begin
                if BookingLine.Delete(true) then begin
                    status := 'success*The Examination Paper was successfully removed from the Booking';
                end else begin
                    status := 'danger*The Examination Paper could not be removed';
                end;
            end else begin
                status := 'danger*The Examination Paper has not been added to the Booking';
            end;
        end else begin
            status := 'danger*The given application does not exist';
        end;
        exit(status);
    end;

    procedure FnConfirmExamCenter(ApplicationNo: Code[30]; examCenter: Code[10]) statusConfirmed: Text
    begin
        //Find the member first
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", ApplicationNo);
        if studentProcessingHeader.FindSet then begin
            studentProcessingHeader."Examination Center Code" := examCenter;
            studentProcessingHeader.Validate("Examination Center Code");
            ExaminationCodeunit.CheckSlotAvailabilityV1(studentProcessingHeader);
            if studentProcessingHeader.Modify then begin
                statusConfirmed := 'success*You have successfully selected ' + studentProcessingHeader."Examination Center" + ' as your preferred examination centre';
            end
            else begin
                statusConfirmed := 'danger*Unknown error occured, could not save your preferred examination centre!';
            end
        end
        else begin
            statusConfirmed := 'danger*the given application number does not exist!';
        end;
    end;

    procedure FnConfirmBookingPayment(ApplicationNo: Code[50]; PhoneNumber: Code[50]; Amount: Decimal) status: Text
    var
        MpesaIntegration: Record "MPESA Integration Table";
    begin
        status := 'danger*Your Payment Application could not be made';
        MpesaIntegration.Init;
        MpesaIntegration.MPESA_TXN_ID := ApplicationNo;
        MpesaIntegration.ACCOUNT_NUMBER := ApplicationNo;
        MpesaIntegration.MSISDN_CUSTOMER := PhoneNumber;
        MpesaIntegration.MPESA_AMOUNT := Amount;
        if MpesaIntegration.Insert(true) then begin
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange(studentProcessingHeader."No.", ApplicationNo);
            if studentProcessingHeader.FindFirst then begin
                //BookingCreateInvoice(studentProcessingHeader);
                //BookingCReceipt(studentProcessingHeader);
                status := 'success*Payment Made Successfully.A receipt has been sent to your Email.';
            end;



        end else
            status := 'danger*Payment Failed. Please try again.';
    end;

    procedure FnBookingCreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
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
        SalesInvoiceHeader: Record "Sales Invoice Header";
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
                SalesInv."Prepayment %" := 100;//enforce prepayment`
                SalesInv.Insert(true);

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
                    BulkProcessingHeader.CalcFields("Booking Amount");
                    SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Booking Amount");
                    SalesLine.Insert(true);
                end;

                BulkProcessingHeader."Booking Invoice No." := SalesInv."No.";
                BulkProcessingHeader.Modify;

            end
            else begin
                BulkProcessingHeader."Booking Invoice No." := SalesInv."No.";
                BulkProcessingHeader.Modify;
            end;
        end
        else begin
            BulkProcessingHeader."Booking Invoice No." := SalesInvoiceHeader."Pre-Assigned No.";
            BulkProcessingHeader.Modify;
        end;
        // BookingCReceipt(BulkProcessingHeader);
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
        SalesInvoiceHeader: Record "Sales Invoice Header";
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
                SalesInv."Prepayment %" := 100;//enforce prepayment`
                SalesInv.Insert(true);

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
                    BulkProcessingHeader.CalcFields("Booking Amount");
                    SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Booking Amount");
                    SalesLine.Insert(true);
                end;

                BulkProcessingHeader."Booking Invoice No." := SalesInv."No.";
                BulkProcessingHeader.Modify;

            end
            else begin
                BulkProcessingHeader."Booking Invoice No." := SalesInv."No.";
                BulkProcessingHeader.Modify;
            end;
        end
        else begin
            BulkProcessingHeader."Booking Invoice No." := SalesInvoiceHeader."Pre-Assigned No.";
            BulkProcessingHeader.Modify;
        end;
        BookingCReceipt(BulkProcessingHeader);
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
        ReceiptHeader2: Record "Receipts Header1";
        MPESAIntegrationTable: Record "MPESA Integration Table";
    begin
        //code to post the created invoice
        if BulkProcessingHeader."Booking Invoice No." <> '' then begin
            SalesInv.Reset;
            SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if SalesInv.FindFirst then begin
                SalesPostYesNo.Run(SalesInv);
            end;

            MPESAIntegrationTable.Reset;
            MPESAIntegrationTable.SetRange(ACCOUNT_NUMBER, BulkProcessingHeader."No.");
            MPESAIntegrationTable.SetRange(Fetch, false);
            if MPESAIntegrationTable.FindFirst then begin
                ExaminationSetup.Get();
                CashMngmntSetup.Get();
                NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
                ReceiptHeader2.Reset;
                ReceiptHeader2.SetRange("Payment Reference", MPESAIntegrationTable.MPESA_TXN_ID);
                ReceiptHeader2.SetRange("Document Type", ReceiptHeader2."document type"::"Payment Voucher");
                if not ReceiptHeader2.FindFirst then begin
                    ReceiptHeader.Init;
                    ReceiptHeader."No." := NoSeries;
                    ReceiptHeader."Payment Reference" := MPESAIntegrationTable.MPESA_TXN_ID;
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
                    ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Paid amount';
                    ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
                    ReceiptLines.Validate("Account No.");
                    //get posted invoice number
                    CustLedgerEntry.Reset;
                    CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
                    CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
                    if CustLedgerEntry.FindFirst then begin
                        ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                        ReceiptLines.VALIDATE("Applies to Doc. No");
                    end;
                    ReceiptLines.Amount := MPESAIntegrationTable."Remaining Amount";
                    ReceiptLines."Amount (LCY)" := MPESAIntegrationTable."Remaining Amount";
                    ReceiptLines.Insert(true);
                    PostReceipt(ReceiptHeader);
                    BulkProcessingHeader."Booking Receipt No." := ReceiptHeader."No.";
                    BulkProcessingHeader.Modify(true);
                end else begin
                    ReceiptHeader2.Reset;
                    ReceiptHeader2.SetRange("Payment Reference", BulkProcessingHeader."Payment Reference No.");
                    ReceiptHeader2.SetRange("Document Type", ReceiptHeader2."document type"::"Payment Voucher");
                    if ReceiptHeader2.FindFirst then begin
                        if ReceiptHeader2.Posted = false then begin
                            PostReceipt(ReceiptHeader2);
                        end;
                        BulkProcessingHeader."Booking Receipt No." := ReceiptHeader2."No.";
                        BulkProcessingHeader.Modify(true);
                    end;
                end
            end;
        end
        //BookingSendReceipt(BulkProcessingHeader);
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
        ReceiptHeader2: Record "Receipts Header1";
        MPESAIntegrationTable: Record "MPESA Integration Table";
    begin
        //code to post the created invoice
        if BulkProcessingHeader."Booking Invoice No." <> '' then begin
            SalesInv.Reset;
            SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
            SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
            if SalesInv.FindFirst then begin
                SalesPostYesNo.Run(SalesInv);
            end;

            MPESAIntegrationTable.Reset;
            MPESAIntegrationTable.SetRange(ACCOUNT_NUMBER, BulkProcessingHeader."No.");
            MPESAIntegrationTable.SetRange(Fetch, false);
            if MPESAIntegrationTable.FindFirst then begin
                ExaminationSetup.Get();
                CashMngmntSetup.Get();
                NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
                ReceiptHeader2.Reset;
                ReceiptHeader2.SetRange("Payment Reference", MPESAIntegrationTable.MPESA_TXN_ID);
                ReceiptHeader2.SetRange("Document Type", ReceiptHeader2."document type"::"Payment Voucher");
                if not ReceiptHeader2.FindFirst then begin
                    ReceiptHeader.Init;
                    ReceiptHeader."No." := NoSeries;
                    ReceiptHeader."Payment Reference" := MPESAIntegrationTable.MPESA_TXN_ID;
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
                    ReceiptLines.Description := BulkProcessingHeader."Student Name" + '-Paid amount';
                    ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
                    ReceiptLines.Validate("Account No.");
                    //get posted invoice number
                    CustLedgerEntry.Reset;
                    CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Student No.");
                    CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
                    if CustLedgerEntry.FindFirst then begin
                        ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                        //ReceiptLines.VALIDATE("Applies to Doc. No");
                    end;
                    ReceiptLines.Amount := MPESAIntegrationTable."Remaining Amount";
                    ReceiptLines."Amount (LCY)" := MPESAIntegrationTable."Remaining Amount";
                    ReceiptLines.Insert(true);
                    PostReceipt(ReceiptHeader);
                    BulkProcessingHeader."Activation Receipt No." := ReceiptHeader."No.";
                    BulkProcessingHeader.Modify(true);
                end else begin
                    ReceiptHeader2.Reset;
                    ReceiptHeader2.SetRange("Payment Reference", BulkProcessingHeader."Payment Reference No.");
                    ReceiptHeader2.SetRange("Document Type", ReceiptHeader2."document type"::"Payment Voucher");
                    if ReceiptHeader2.FindFirst then begin
                        if ReceiptHeader2.Posted = false then begin
                            PostReceipt(ReceiptHeader2);
                        end;
                        BulkProcessingHeader."Activation Receipt No." := ReceiptHeader2."No.";
                        BulkProcessingHeader.Modify(true);
                    end;
                end
            end;
        end
        // BookingSendReceipt(BulkProcessingHeader);
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
        ProcessingHeader: Record "Student Processing Header";
        FileName1: Text;
        FileLocation1: Text;
        emailBody: Text;
        emailhdr: Text;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";

        // SMTP.Create('HRMPEB:EXAM BOOKING', Email2, StudentProcessingHeader.Email,
        // 'HRMPEB:EXAM BOOKING',
        // 'Dear ' + StudentProcessingHeader."Student Name" + ',<BR><BR>' +
        // 'Your booking request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        // 'Find attached the  provisional timetable which you should check for an updated one <b>21 Days</b> before the examination. ', true);
        //receipt and a
        FileName := StudentProcessingHeader."Booking Invoice No." + '.pdf';
        FileLocation := ExaminationSetup."Examination Path" + FileName;

        ReceiptHeader1.Reset;
        ReceiptHeader1.SetRange("No.", StudentProcessingHeader."No.");
        if ReceiptHeader1.FindFirst then begin
            Report.SaveAsPdf(85047, FileLocation, ReceiptHeader1);
            ////SMTP.AddAttachment(FileLocation,FileName);
        end;
        //Attach timetable
        FileName1 := StudentProcessingHeader."No." + '.pdf';
        FileLocation1 := ExaminationSetup."Examination Path" + FileName1;
        ProcessingHeader.Reset;
        ProcessingHeader.SetRange("No.", StudentProcessingHeader."No.");
        if ProcessingHeader.FindFirst then begin
            //Report.SaveAsPdf(85026, FileLocation1, ProcessingHeader);
            //SMTP.AddAttachment(FileLocation1, FileName1);
        end;
        //SMTP.AddBCC(Email2);
        //SMTP.AddBCC(ExaminationSetup."Student Module EMail BCC");
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>EXAMINATION BOOKING<BR>');
        //SMTP.Send();

        emailBody := ',<BR><BR>' +
        'Your booking request done on <b>' + ' ' + Format(StudentProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        'Find attached the  provisional timetable which you should check for an updated one <b>21 Days</b> before the examination. ' +
        '<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>' + '<BR><BR>EXAMINATION BOOKING<BR>';

        emailhdr := 'HRMPEB:EXAM BOOKING';
        SendEmailNotification(StudentProcessingHeader.Email, emailhdr, emailBody);
        //SendEmailNotification(StudentProcessingHeader.Email, 'HRMPEB:EXAM BOOKING', Body);



        //send receipt
    end;

    procedure AddVacancySharepointLinks(applicationNo: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        crmStudentApplicants: Record "CRM Student Applications";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **************************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            crmStudentApplicants.Reset;
            crmStudentApplicants.SetRange("Document ID", applicationNo);
            crmStudentApplicants.SetRange("Document Type", crmStudentApplicants."document type"::"Job Application");
            if crmStudentApplicants.FindSet then
                RecordIDNumber := crmStudentApplicants.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*The document was successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;

        // //test
        // IF integration.insert=TRUE THEN BEGIN
        // studentProcessingHeader.RESET;
        //  studentProcessingHeader.SETRANGE("No.",integration.accountno);
        //  IF studentProcessingHeader.FINDFIRST THEN BEGIN
        //    examination.applicationcreateinvoice(studentProcessingHeader);
        //  examination.applicationcreatereceipt(studentprocessinghaeder)
        //   END
        // END
        // //end test
    end;

    procedure BookingInvoice("code": Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        emailBody: Text;
        emailhdr: Text;
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
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", code);
        StudentProcessingHeader.SetFilter(StudentProcessingHeader."No.", '%1', code);
        if StudentProcessingHeader.FindSet then begin
            appNo := ConvertStr(code, '-', '_');
            appNo := ConvertStr(code, ':', '_');



            if FILE.Exists(FILESPATH11 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH11 + appNo + '.pdf');


                Report.SaveAsPdf(85044, FILESPATH11 + appNo + '.pdf', StudentProcessingHeader);
                FileName := appNo + ' invoice';
                SMTPMailSetup.Get;
                Email2 := SMTPMailSetup."Registration Sender Email";
                Body := 'Booking Invoice';
                // SMTP.Create('Invoice', Email2, StudentProcessingHeader.Email,
                //   'Invoice',
                //  'Dear ' + StudentProcessingHeader."First Name" + ',<BR><BR>' +
                //  'Please find Attached Invoice For the examination Booking of <b>' + '</b><BR>' +
                // 'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="184.174.39.195:8090/">Student Portal</a></b><BR>'
                //  + '<BR>'
                // , true);
                // SMTP.AddAttachment(FILESPATH11 + appNo + '.pdf', FileName);
                // SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examination <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
                // SMTP.Send();
                // emailBody := 'Dear ' + StudentProcessingHeader."First Name" + ',<BR><BR>' +
                //  'Please find Attached Invoice For the examination Booking of <b>' + '</b><BR>' +
                // 'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="184.174.39.195:8090/">Student Portal</a></b><BR>'
                //  + '<BR>' + '<BR><BR>Kind Regards,' + '<BR><BR>Examination <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>';
                //Matara begin
                emailhdr := 'HRMPEB:EXAM BOOKING';
                BulkProcessingHead.reset();
                BulkProcessingHead.SetRange("No.", code);
                RecRef.GetTable(BulkProcessingHead);
                TempBlob.CreateOutStream(OutStr);
                Report.SaveAs(Report::"Booking Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
                TempBlob.CreateInStream(InStr);
                InStr.ReadText(BodyTxt);

                EmailMessage.Create(StudentProcessingHeader.Email, 'HRMPEB:EXAM BOOKING', 'Dear ' + StudentProcessingHeader."First Name" + ' ' + StudentProcessingHeader."Middle Name" + ' ' + StudentProcessingHeader.Surname + ',<BR></BR>' +
                    'Please find Attached Invoice For the examination Booking.<BR></BR>' +
                   'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="https://online.hrmpeb.or.ke/">Student Portal</a></b><BR>'
                    + '</BR>', true);
                TempBlob.CreateOutStream(OutStr2);
                Report.SaveAs(Report::"Booking Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
                TempBlob.CreateInStream(InStr2);
                EmailMessage.AddAttachment('Booking_Invoice.pdf', 'PDF', InStr2);
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

                //Matara End




                // SendEmailNotification(StudentProcessingHeader.Email, emailhdr, emailBody);
                //SendEmailNotification(StudentProcessingHeader.Email, 'HRMPEB:EXAM BOOKING', Body);
                status := 'success*downloads\BooingInvoice\' + appNo + '.pdf';

            end else begin

                Report.SaveAsPdf(85044, FILESPATH11 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\BooingInvoice\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The Proforma Invoice could not be generated';
        end;
    end;

    procedure FnCaseManagement(applicantNumber: Code[50]; casetype: Option; subject: Code[100]; description: Text; studentNo: Code[50]) status: Text
    var
        CrmCases: Record "Student Enquiry";
    begin
        CrmCases.Reset;
        CrmCases.SetRange("Document No.", applicantNumber);

        if CrmCases.FindSet then begin
            CrmCases."Case Type" := casetype;
            CrmCases.Validate("Case Type");
            CrmCases.Subject := subject;
            CrmCases.Validate(Subject);
            CrmCases.Description := description;
            CrmCases.Status := CrmCases.Status::Draft;
            CrmCases."Customer No." := studentNo;
            CrmCases.Validate("Customer No.");
            CrmCases."Created On" := CurrentDatetime;

            if CrmCases.Modify(true) then begin
                status := 'success*Your Case Has been received successfully. Your case Number is: *' + CrmCases."Document No.";

            end
            else begin
                status := 'danger*Could Not Modify your case.Kindly Contact System Administrator';
            end;
        end;

        CrmCases.SetRange(Subject, subject);
        if CrmCases.FindSet then begin
            status := 'danger*Could Not Make an Application With the same subject.';
        end
        else begin
            CrmCases.Init;

            CrmCases."Case Type" := casetype;
            CrmCases.Validate("Case Type");
            CrmCases.Subject := subject;
            CrmCases.Validate(Subject);
            CrmCases.Description := description;
            CrmCases.Status := CrmCases.Status::Draft;
            CrmCases."Customer No." := studentNo;
            CrmCases.Validate("Customer No.");
            CrmCases."Created On" := CurrentDatetime;
            if CrmCases.Insert(true) then begin

                status := 'success*Your Case Has been received successfully. Your case Number is: *' + CrmCases."Document No.";


            end else begin
                status := 'danger*Could Not Modify your case.Kindly Contact System Administrator';
            end;
        end;



        exit(status);
    end;

    procedure FnCenterRecollocate(applicationNo: Code[250]; regNo: Code[50]; region: Code[50]; zone: Code[50]; examcenter: Code[100]; newexamcenter: Code[100]) status: Text
    var
        centerbookingHeader: Record "Center Booking Header";
        centerbookinglines: Record "Center Booking Lines";
        exambookingentries: Record "Exam Booking Entries";
    begin
        Message(regNo);
        status := 'danger*Your Application could not be made';
        centerbookinglines.Reset;
        centerbookinglines.SetRange("Student Reg No.", regNo);
        if centerbookinglines.FindSet then begin
            status := 'danger*You have an existing request for the application.Please wait while your request is being processed';

        end else begin

            centerbookingHeader.Init;
            centerbookingHeader.Type := centerbookingHeader.Type::"Re-Allocation";
            centerbookingHeader.Validate(Type);
            centerbookingHeader.Region := region;
            centerbookingHeader.Validate(Region);
            centerbookingHeader.Zone := zone;
            centerbookingHeader.Validate(Zone);
            centerbookingHeader."Initial Center Code" := examcenter;
            centerbookingHeader.Validate("Initial Center Code");
            centerbookingHeader."Exam Center Code" := newexamcenter;
            centerbookingHeader.Validate("Exam Center Code");
            if centerbookingHeader.Insert(true) then begin
                exambookingentries.Reset;
                exambookingentries.SetRange(Code, applicationNo);
                if exambookingentries.FindFirst then begin
                    centerbookinglines.Init;
                    centerbookinglines."Header No." := centerbookingHeader."Header No.";
                    centerbookinglines."Student Reg No." := regNo;
                    centerbookinglines.Validate("Student Reg No.");
                    centerbookinglines.Type := centerbookinglines.Type::"Re-Allocation";
                    centerbookinglines.Validate(Type);


                    if centerbookinglines.Insert(true) then begin
                        status := 'success*You have successfully applied for a center Reallocation from ' + centerbookingHeader."Initial Center Name" + ' to ' + centerbookingHeader."Center Name" + ' Please wait for the processing of your request.';
                    end;
                end;



            end else
                status := 'danger*Examination request for center reallocation failed. Please try again.';
        end;
    end;

    procedure FnEditProfile(IDNumber: Code[50]; address: Code[50]; address2: Code[50]; city: Code[50]; postcode: Code[50]; country: Code[50]; phoneNumber: Code[50]; email: Text; county: Code[50]) status: Text
    var
        customer: Record Customer;
        dynasoftPortalUsers: Record "Dynasoft Portal User";
    begin

        status := 'danger*The Profile could not be edited';
        customer.Reset;
        customer.SetRange("ID. No.", IDNumber);
        if customer.FindSet then begin
            customer.Address := address;
            customer."Address 2" := address2;
            customer.City := city;
            customer."Post Code" := postcode;
            customer.Validate("Post Code");
            customer."Country/Region Code" := country;
            customer.Validate("Country/Region Code");
            customer."Phone No." := phoneNumber;
            customer.County := county;
            customer.Validate(County);
            customer."E-Mail" := email;


            if customer.Modify(true) then begin
                /* dynasoftPortalUsers.RESET;
                dynasoftPortalUsers.SETRANGE("Id Number",IDNumber);
                IF dynasoftPortalUsers.FINDSET THEN BEGIN
                  dynasoftPortalUsers."Authentication Email":=email;

                   IF dynasoftPortalUsers.MODIFY(TRUE) THEN BEGIN*/
                status := 'success*The Profile has been updated successfully';
                //FnUploadProfilePhotoprofile(IDNumber);
                // END;
                // END;



            end else begin
                status := 'danger*The profile could not be updated';
            end;
        end;

    end;

    procedure FnEditstudentEMAIL(IdNumber: Code[50]; PhoneNumber: Code[50]; Email: Code[50]) status: Text
    var
        customer: Record Customer;
        ExaminationAccounts: Record "Examination Account";
    begin

        status := 'danger*The Profile could not be edited';
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Id Number", IdNumber);
        DynasoftPortalUser.SetRange(State, DynasoftPortalUser.State::Enabled);
        if DynasoftPortalUser.FindSet then begin
            DynasoftPortalUser."Authentication Email" := Email;
            DynasoftPortalUser.Modify(true);
        end else begin
            DynasoftPortalUser.Reset;
            DynasoftPortalUser.SetRange("Authentication Email", Email);
            DynasoftPortalUser.SetRange(State, DynasoftPortalUser.State::Enabled);
            if DynasoftPortalUser.FindSet then begin
                DynasoftPortalUser."Id Number" := IdNumber;
                DynasoftPortalUser.Modify(true);
            end else begin
                status := 'danger*The Your A could not be edited';
            end;
        end;


    end;

    procedure FnEditstudent(IdNumber: Code[50]; PhoneNumber: Code[50]; Email: Code[50]; RegNo: Code[50]) status: Text
    var
        customer: Record Customer;
        ExaminationAccounts: Record "Examination Account";
    begin

        status := 'danger*The Profile could not be edited';
        ExaminationAccounts.Reset;
        ExaminationAccounts.SetRange("Registration No.", RegNo);
        if ExaminationAccounts.FindSet then begin
            ExaminationAccounts."ID No." := IdNumber;
            ExaminationAccounts."Phone No." := PhoneNumber;
            ExaminationAccounts.Email := Email;


            if ExaminationAccounts.Modify(true) then begin
                customer.Reset;
                customer.SetRange("No.", ExaminationAccounts."Student Cust No.");
                if customer.FindSet then begin
                    customer."E-Mail" := Email;
                    customer."Phone No." := PhoneNumber;
                    customer."ID. No." := IdNumber;
                    customer."Customer Type" := customer."customer type"::Student;

                    if customer.Modify(true) then begin
                        status := 'success*The Profile has been updated successfully';
                    end;
                end;



            end else begin
                status := 'danger*The profile could not be updated';
            end;
        end;
    end;

    procedure FnUploadProfilePhotoprofile(studentNo: Code[100]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        fileName: Text;
        importFile: File;
        imageInStream: InStream;
        imageID: Guid;
        FileMgt: Codeunit "File Management";
        // TempBlob: Record TempBlob;
        ServerFileNameTxt: Text;
        ClientFileNameTxt: Text;
        Imageoutsteram: OutStream;
        MEDIA: File;
        ExaminationSetup: Record "Examination Setup";
        FileManagement: Codeunit "File Management";
        customer: Record Customer;
    begin

        customer.Reset;
        customer.SetRange("ID. No.", studentNo);
        if customer.FindFirst then begin
            repeat
                fileName := '\\184.174.39.195\HRMPEBTest\Student Processing Header\' + studentNo + '\' + studentNo + '.jpg';
                if FILE.Exists(fileName) then begin
                    importFile.Open(fileName);
                    importFile.CreateInstream(imageInStream);
                    imageID := customer.Image.ImportStream(imageInStream, 'student Profile photo ' + Format(studentNo));
                    customer.Modify;
                    //MESSAGE(Text000, studentNo, imageID);
                    importFile.Close;
                end;
                status := 'success*The Profile has been updated successfully';
            until customer.Next < 1;
        end;
    end;

    procedure FnDisplayPapers(applicationNo: Code[50]) status: Text
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);
        if studentProcessingHeader.FindSet then begin
            // MESSAGE('%1' ,studentProcessingHeader."No.");
            ExaminationCodeunit.RunAutoExemptSingle(studentProcessingHeader);
            ExaminationCodeunit.FnClearAttemptedPapers(studentProcessingHeader."No.");
            ExaminationCodeunit.FNClearExemptedPpaers2(studentProcessingHeader."No.");

        end;
    end;

    procedure RemoveExemptionPaper(applicationNo: Code[50]; EntryNo: Integer) status: Text
    var
        ExemptionLines: Record "Exemption Lines";
    begin
        status := 'danger*The fuel could not be removed';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."approval status"::Open);
        if studentProcessingHeader.FindSet then begin

            ExemptionLines.Reset;
            ExemptionLines.SetRange("Header No.", applicationNo);
            ExemptionLines.SetRange("Line No.", EntryNo);
            if ExemptionLines.FindSet then begin
                if ExemptionLines.Delete(true) then begin
                    status := 'success*The Examination Paper was successfully removed from the list of papers to be exempted';
                end else begin
                    status := 'danger*The Examination Paper could not be removed';
                end;
            end else begin
                status := 'danger*The Examination Paper has not been added to the list of papers to be exempted';
            end;
        end else begin
            status := 'danger*The given application does not exist';
        end;
        exit(status);
    end;

    procedure RemoveQualificationPaper(applicationNo: Code[50]; EntryNo: Integer) status: Text
    var
        ExemptionQualification: Record "Exemption Qualifications";
    begin
        status := 'danger*The fuel could not be removed';
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."approval status"::Open);
        if studentProcessingHeader.FindSet then begin

            ExemptionQualification.Reset;
            ExemptionQualification.SetRange("Document No.", applicationNo);
            ExemptionQualification.SetRange("Entry No", EntryNo);
            if ExemptionQualification.FindSet then begin
                if ExemptionQualification.Delete(true) then begin
                    status := 'success*The Qualification was successfully removed from the list of Qualifications';
                end else begin
                    status := 'success*The Qualification was successfully removed from the list of Qualifications';
                end;
            end else begin
                status := 'danger*The Qualification has not been added to the list of Qualifications';
            end;
        end else begin
            status := 'danger*The given application does not exist';
        end;
        exit(status);
    end;

    procedure FnConfirmPayments(applicationNo: Code[100]) status: Text
    var
        studentProcessing: Record "Student Processing Header";
    begin


        studentProcessing.Reset;
        studentProcessing.SetRange("No.", applicationNo);

        if studentProcessing.FindSet then begin

            studentProcessing."Payment Created" := true;

            if studentProcessing.Modify(true) then begin
                status := 'success* The Payments Details for the Application No.' + applicationNo + 'was successfully submitted';
            end;
        end else begin
            status := 'danger*The Application Details for' + ' ' + applicationNo + ' ' + 'has not been Approved.';
        end;
    end;

    procedure FnsuggestPapers(applicationNo: Code[50]) status: Text
    begin
        Message(applicationNo);
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", applicationNo);
        if studentProcessingHeader.FindSet then begin
            studentprocessingLines."Transaction Type" := studentprocessingLines."transaction type"::Booking;
            ExaminationCodeunit.StudentSuggestFunction(studentProcessingHeader);

        end;
    end;

    procedure RenewalInvoice("code": Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", code);
        StudentProcessingHeader.SetFilter(StudentProcessingHeader."No.", '%1', code);
        if StudentProcessingHeader.FindSet then begin
            appNo := ConvertStr(code, '-', '_');
            appNo := ConvertStr(code, ':', '_');



            if FILE.Exists(FILESPATH12 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH12 + appNo + '.pdf');


                //Report.SaveAsPdf(85051, FILESPATH12 + appNo + '.pdf', StudentProcessingHeader);

                status := 'success*downloads\RenewalInvoice\' + appNo + '.pdf';

            end else begin

                //Report.SaveAsPdf(85051, FILESPATH12 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\RenewalInvoice\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The Invoice could not be generated';
        end;
    end;

    procedure AddWithdrawalSharepointLinks(applicationNo: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        studentProcessingHeader: Record "Student Processing Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **************************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("No.", applicationNo);
            studentProcessingHeader.SetRange("Document Type", studentProcessingHeader."document type"::Withdrawal);
            if studentProcessingHeader.FindSet then
                RecordIDNumber := studentProcessingHeader.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*The document was successfully attached';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;

        // //test
        // IF integration.insert=TRUE THEN BEGIN
        // studentProcessingHeader.RESET;
        //  studentProcessingHeader.SETRANGE("No.",integration.accountno);
        //  IF studentProcessingHeader.FINDFIRST THEN BEGIN
        //    examination.applicationcreateinvoice(studentProcessingHeader);
        //  examination.applicationcreatereceipt(studentprocessinghaeder)
        //   END
        // END
        // //end test
    end;

    procedure AddDefermentSharepointLinks(applicationNo: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        studentProcessingHeader: Record "Student Processing Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **************************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            studentProcessingHeader.Reset;
            studentProcessingHeader.SetRange("No.", applicationNo);
            studentProcessingHeader.SetRange("Document Type", studentProcessingHeader."document type"::Defferment);
            if studentProcessingHeader.FindSet then
                RecordIDNumber := studentProcessingHeader.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*The document was successfully attached';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;

        // //test
        // IF integration.insert=TRUE THEN BEGIN
        // studentProcessingHeader.RESET;
        //  studentProcessingHeader.SETRANGE("No.",integration.accountno);
        //  IF studentProcessingHeader.FINDFIRST THEN BEGIN
        //    examination.applicationcreateinvoice(studentProcessingHeader);
        //  examination.applicationcreatereceipt(studentprocessinghaeder)
        //   END
        // END
        // //end test
    end;

    procedure PrintReceiptBookin(receiptNoFilter: Code[10]) status: Text
    var
        ReceiptHeader: Record "Receipts Header1";
        repSalesInvoice: Report Receipt;
        printed: Boolean;
    begin

        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange(studentProcessingHeader."No.", receiptNoFilter);
        // StudentProcessingHeader.SETFILTER(StudentProcessingHeader."No.",'%1',StudentProcessingHeader);
        if studentProcessingHeader.FindSet then begin
            appNo := ConvertStr(receiptNoFilter, '-', '_');
            appNo := ConvertStr(receiptNoFilter, ':', '_');



            if FILE.Exists(FILESPATH + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH + appNo + '.pdf');


                //Report.SaveAsPdf(85047, FILESPATH + appNo + '.pdf', studentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';

            end else begin

                //Report.SaveAsPdf(85047, FILESPATH + appNo + '.pdf', studentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The receipt Report could not be generated';
        end;
    end;

    procedure PrintReceiptExemption(receiptNoFilter: Code[10]) status: Text
    var
        ReceiptHeader: Record "Receipts Header1";
        repSalesInvoice: Report Receipt;
        printed: Boolean;
    begin

        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange(studentProcessingHeader."No.", receiptNoFilter);
        // StudentProcessingHeader.SETFILTER(StudentProcessingHeader."No.",'%1',StudentProcessingHeader);
        if studentProcessingHeader.FindSet then begin
            appNo := ConvertStr(receiptNoFilter, '-', '_');
            appNo := ConvertStr(receiptNoFilter, ':', '_');



            if FILE.Exists(FILESPATH + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH + appNo + '.pdf');


                //Report.SaveAsPdf(85048, FILESPATH + appNo + '.pdf', studentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';

            end else begin

                //Report.SaveAsPdf(85048, FILESPATH + appNo + '.pdf', studentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The receipt Report could not be generated';
        end;
    end;

    procedure fnGetCustomerPicture(custNo: Code[50]) pictureData: Text
    var
        Customer: Record Customer;
        pictureOustream: OutStream;
        pictureInstream: InStream;
        TenantMedia: Record "Tenant Media";
    // TempBlob: Record TempBlob;
    begin
        Customer.Reset;
        Customer.SetRange("No.", custNo);
        if Customer.FindSet then begin
            //  IF NOT Customer.Picture.HASVALUE THEN BEGIN
            //    ERROR:='The customer picture could not be found, kindly upload to proceed!';
            //  END;
            TenantMedia.Reset;
            // TenantMedia.SetRange(Content, Customer.Picture);
            if TenantMedia.FindSet then begin
                // TenantMedia.GET(Customer.Picture);
                TenantMedia.CalcFields(Content);
                if TenantMedia.Content.Hasvalue then begin
                    Message('found');
                    Clear(pictureData);
                    Clear(pictureInstream);
                    TenantMedia.Content.CreateInstream(pictureInstream);
                    // TempBlob.DeleteAll;
                    // TempBlob.Init;
                    // TempBlob.Blob.CreateOutstream(pictureOustream);
                    // CopyStream(pictureOustream, pictureInstream);
                    // TempBlob.Insert;
                    // TempBlob.CalcFields(Blob);
                    // pictureData := pictureData + Format(TempBlob.ToBase64String);
                    Message(pictureData);
                end;
            end;
        end;
        exit(pictureData);
    end;

    procedure GetStudentsImages(IdNumber: Code[50]) status: Text
    var
        "count": Integer;
        fileName: Text;
        Text001: label '%1 media files were exported.';
        customer: Record Customer;
    begin

        customer.Reset;
        customer.SetRange("ID. No.", IdNumber);
        if customer.FindFirst() then begin

            repeat
                fileName := '\\192.168.0.38\StudentPortal\images\' + IdNumber + '.jpg';
                if customer.Image.ExportFile(fileName) then
                    count := count + 1
            until customer.Next < 1;

        end;
    end;

    procedure ResultSlip(StudentRegNo: Code[50]; ExamSittingId: Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        Cust: Record Customer;
        ExaminationResults: Record "Examination Results";
        ResultSlipReport: Report "Result Slip";
        ExaminationAcounts: Record "Examination Account";
    begin
        ////Report.SaveAsPdf(85016,FILESPATH13+appNo+'.pdf',ExaminationResults);
        ExaminationResults.Reset;
        ExaminationResults.SetRange("Student Reg No.", StudentRegNo);
        ExaminationResults.SetRange("Examination Sitting ID", ExamSittingId);
        if ExaminationResults.FindSet then begin

            //REPORT.RUN(85016,TRUE,FALSE,ExaminationResults);
            appNo := ConvertStr(StudentRegNo, '-', '_');
            appNo := ConvertStr(StudentRegNo, ':', '_');
            appNo := ConvertStr(StudentRegNo, '/', '_');

            if FILE.Exists(FILESPATH13 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH13 + appNo + '.pdf');

                Report.SaveAsPdf(85016, FILESPATH13 + appNo + '.pdf', ExaminationResults);
                status := 'success*downloads\ResultSlip\' + appNo + '.pdf';

            end else begin
                Report.SaveAsPdf(85016, FILESPATH13 + appNo + '.pdf', ExaminationResults);
                status := 'success*downloads\ResultSlip\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The Result Slip could not be generated';
        end;
        //END;


    end;

    procedure ResultSlip2(IdNo: Code[50]; ExamSittingId: Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        Cust: Record Customer;
        ExaminationResults: Record "Examination Results";
        ResultSlipReport: Report "Result Slip";
        ExaminationAcounts: Record "Examination Account";
    begin
        ////Report.SaveAsPdf(85016,FILESPATH13+appNo+'.pdf',ExaminationResults);
        ExaminationResults.Reset;
        ExaminationResults.SetRange("National ID No.", IdNo);
        ExaminationResults.SetRange("Examination Sitting ID", ExamSittingId);
        if ExaminationResults.FindSet then begin

            //REPORT.RUN(85016,TRUE,FALSE,ExaminationResults);
            appNo := ConvertStr(ExaminationResults."Student Reg No.", '-', '_');
            appNo := ConvertStr(ExaminationResults."Student Reg No.", ':', '_');
            appNo := ConvertStr(ExaminationResults."Student Reg No.", '/', '_');

            if FILE.Exists(FILESPATH13 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH13 + appNo + '.pdf');

                Report.SaveAsPdf(85016, FILESPATH13 + appNo + '.pdf', ExaminationResults);
                status := 'success*downloads\ResultSlip\' + appNo + '.pdf';

            end else begin
                Report.SaveAsPdf(85016, FILESPATH13 + appNo + '.pdf', ExaminationResults);
                status := 'success*downloads\ResultSlip\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The Result Slip could not be generated';
        end;
        //END;


    end;

    procedure fnGetExaminationResults(IdNumber: Text) AllData: Text
    var
        ExaminationResults: Record "Examination Results";
        date: Text;
        grade: Text;
        papername: Text;
        regno: Text;
        examcenter: Text;
    begin
        ExaminationResults.Reset;
        ExaminationResults.SetRange("National ID No.", IdNumber);

        if ExaminationResults.FindSet then begin
            repeat
                date := Format(ExaminationResults."Issue Date");
                grade := Format(ExaminationResults.Grade);
                papername := Format(ExaminationResults."Paper Name");
                regno := Format(ExaminationResults."Student Reg No.");
                examcenter := Format(ExaminationResults."Examination Center");

                AllData := AllData + ExaminationResults."Student Name" + '*' + ExaminationResults.Paper + '*' + papername + '*' + grade + '*' + ExaminationResults."Examination Sitting ID" + '*' + ExaminationResults."Financial Year" + '*'
                + date + '*' + regno + '*' + examcenter + '::::';
            until ExaminationResults.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnGetStudentProcessingHeader(ApplicationNo: Text; studentNo: Text; ExamId: Text) AllData: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        date: Text;
        grade: Text;
        bookingamount: Text;
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange("No.", ApplicationNo);
        StudentProcessingHeader.SetRange("Student No.", studentNo);
        StudentProcessingHeader.SetRange("Examination ID", ExamId);
        if StudentProcessingHeader.FindSet then begin
            repeat
                //date:=FORMAT(ExaminationResults."Issue Date");
                //grade:=FORMAT(ExaminationResults.Grade);
                bookingamount := Format(StudentProcessingHeader."Booking Amount");
                AllData := AllData + StudentProcessingHeader."Examination Center Code" + '*' + bookingamount + '*' + StudentProcessingHeader."Examination Sitting" + '::::';
            until ExaminationResults.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnGetStudentProcessingHeaderReg(ApplicationNo: Text; IdNumber: Text; ExamId: Text) AllData: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        gender: Text;
        disabilitystatus: Text;
        amount: Text;
        date: Text;
        contactRel: Text;
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange("No.", ApplicationNo);
        StudentProcessingHeader.SetRange("ID Number/Passport No.", IdNumber);
        StudentProcessingHeader.SetRange("Examination ID", ExamId);
        if StudentProcessingHeader.FindSet then begin
            repeat
                date := Format(StudentProcessingHeader."Date of Birth");
                gender := Format(StudentProcessingHeader.Gender);
                contactRel := Format(StudentProcessingHeader."Contact Relationship");
                disabilitystatus := Format(StudentProcessingHeader.Disabled);
                amount := Format(StudentProcessingHeader."Application Amount");
                AllData := AllData + StudentProcessingHeader."Country/Region Code" + '*' + amount + '*' + StudentProcessingHeader.County + '*' + StudentProcessingHeader."Post Code" + '*' + StudentProcessingHeader.City + '*' + StudentProcessingHeader.Address
                + '*' + StudentProcessingHeader."Examination Sitting" + '*' + StudentProcessingHeader."Highest Academic QCode" + '*' + StudentProcessingHeader."Training Institution Code" + '*' + StudentProcessingHeader."Source of Information"
                + '*' + StudentProcessingHeader."Examination Center Code" + '*' + StudentProcessingHeader."Fee Type" + '*' + StudentProcessingHeader."Contact Full Name" + '*' + StudentProcessingHeader."Contact Email"
                + '*' + StudentProcessingHeader."Contact Phone No." + '*' + disabilitystatus + '*' + date + '*' + gender + '*' + contactRel + '::::';
            until StudentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnGetExamBookingEntries(StudentNo: Text; txtstatus: Option) AllData: Text
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        feeamount: Text;
        status: Text;
    begin
        ExamBookingEntries.Reset;
        ExamBookingEntries.SetRange("Stud. Cust No.", StudentNo);
        ExamBookingEntries.SetRange(Blocked, false);
        ExamBookingEntries.SetRange(ExamBookingEntries.Status, ExamBookingEntries.Status::Open);
        if ExamBookingEntries.FindSet then begin
            repeat
                feeamount := Format(ExamBookingEntries."Fee Amount LCY");
                status := Format(ExamBookingEntries.Status);
                AllData := AllData + ExamBookingEntries."Student Reg No." + '*' + ExamBookingEntries."Student Name" + '*' + ExamBookingEntries.Examination + '*' + ExamBookingEntries.Part + '*' + ExamBookingEntries.Description + '*' + feeamount + '*'
                + status + '*' + ExamBookingEntries.Paper + '::::';
            until ExamBookingEntries.Next = 0;
        end;
        exit(AllData);
    end;

    procedure DeffermentInvoice(applicationNo: Code[10]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        Cust: Record Customer;
        ExaminationResults: Record "Examination Results";
        ResultSlipReport: Report "Result Slip";
        ExaminationAcounts: Record "Examination Account";
    begin
        ////Report.SaveAsPdf(85016,FILESPATH13+appNo+'.pdf',ExaminationResults);
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange("No.", applicationNo);

        if StudentProcessingHeader.FindSet then begin

            //REPORT.RUN(85016,TRUE,FALSE,ExaminationResults);
            appNo := ConvertStr(applicationNo, '-', '_');
            appNo := ConvertStr(applicationNo, ':', '_');
            appNo := ConvertStr(applicationNo, '/', '_');

            if FILE.Exists(FILESPATH14 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH14 + appNo + '.pdf');

                //Report.SaveAsPdf(85102, FILESPATH14 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\DeffermentInvoice\' + appNo + '.pdf';

            end else begin
                //Report.SaveAsPdf(85102, FILESPATH14 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\DeffermentInvoice\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The report could not be generated';
        end;
        //END;


    end;

    local procedure FetchPapers(StudentProcessingHeader: Record "Student Processing Header")
    begin
        //TESTFIELD(StudentProcessingHeader."Student Reg. No.");
        //VALIDATE("Student Reg. No.");
        if (StudentProcessingHeader."Document Type" = StudentProcessingHeader."document type"::Withdrawal) or (StudentProcessingHeader."Document Type" = StudentProcessingHeader."document type"::Defferment) then begin
            ExamBookingEntries.Reset;
            ExamBookingEntries.SetRange("Student Reg No.", StudentProcessingHeader."Student Reg. No.");
            ExamBookingEntries.SetRange("Exam Sitting", StudentProcessingHeader."Examination Sitting");

            EntryNo := 0;
            StudentBookingLines.Reset;
            if StudentBookingLines.FindLast then begin
                EntryNo := StudentBookingLines."Line No.";
            end;
            if ExamBookingEntries.FindSet then begin

                repeat

                    StudentBookingLines.Init;
                    StudentBookingLines."Line No." := EntryNo + 1;
                    StudentBookingLines."Document Type" := StudentProcessingHeader."Document Type";
                    StudentBookingLines."Booking Header No." := StudentProcessingHeader."No.";
                    if StudentProcessingHeader."Document Type" = StudentProcessingHeader."document type"::Withdrawal then begin
                        StudentBookingLines.Type := StudentBookingLines.Type::Withdrawal;
                    end;
                    StudentBookingLines."Course Id" := ExamBookingEntries.Examination;
                    StudentBookingLines.Part := ExamBookingEntries.Part;
                    StudentBookingLines.Validate(Part);
                    StudentBookingLines.Section := ExamBookingEntries.Section;
                    StudentBookingLines.Validate(Section);
                    StudentBookingLines.Paper := ExamBookingEntries.Paper;
                    StudentBookingLines.Validate(Paper);
                    StudentBookingLines.Amount := ExamBookingEntries."Fee Amount";
                    StudentBookingLines."Amount LCY" := ExamBookingEntries."Fee Amount";
                    StudentBookingLines.Description := ExamBookingEntries.Description;
                    StudentBookingLines.Insert;

                    //insert into withdrawal entries
                    EntryNo := EntryNo + 1;
                until ExamBookingEntries.Next = 0;
            end;
        end;
    end;

    local procedure GetWorkTypewithdrawal(Header: Code[30]) WorkType: Code[30]
    var
        Resource: Record Resource;
        ResourcePrice: Record "Resource Price";
    begin
        Resource.Reset;
        Resource.SetRange("Course ID", Header);

        Resource.SetRange(Blocked, false);
        if Resource.FindSet then begin
            repeat
                ResourcePrice.Reset;
                ResourcePrice.SetRange("Currency Code", '');
                ResourcePrice.SetRange("Work Type Code", Resource."No.");
                if ResourcePrice.FindFirst then begin
                    if ResourcePrice."Document Type" = ResourcePrice."document type"::Withdrawal then
                        WorkType := ResourcePrice."Work Type Code";

                    //ERROR('');
                end;

            until Resource.Next = 0;
        end;
        exit(WorkType);
    end;

    local procedure GetWorkTypeDefferment(Header: Code[30]) WorkType: Code[30]
    var
        Resource: Record Resource;
        ResourcePrice: Record "Resource Price";
    begin
        Resource.Reset;
        Resource.SetRange("Course ID", Header);

        Resource.SetRange(Blocked, false);
        if Resource.FindSet then begin
            repeat
                ResourcePrice.Reset;
                ResourcePrice.SetRange("Currency Code", '');
                ResourcePrice.SetRange("Work Type Code", Resource."No.");
                if ResourcePrice.FindFirst then begin
                    if ResourcePrice."Document Type" = ResourcePrice."document type"::Defferment then
                        WorkType := ResourcePrice."Work Type Code";

                    //ERROR('');
                end;

            until Resource.Next = 0;
        end;
        exit(WorkType);
    end;

    procedure FnConfirmation(studentNo: Code[50]; RegNo: Code[50]; trequesterName: Text; trequesterEmail: Text) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        StudentProcessingLines: Record "Student Processing Lines";
        Customer: Record Customer;
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange("Document Type", StudentProcessingHeader."document type"::Confirmation);
        StudentProcessingHeader.SetRange("Student No.", studentNo);
        StudentProcessingHeader.SetRange("Student Reg. No.", RegNo);
        if StudentProcessingHeader.FindSet then begin
            status := 'danger*The document was successfully attached';
        end else begin
            Customer.Reset;
            //    Customer.SETRANGE("No.",'CUST00022');
            StudentProcessingHeader.Init;
            StudentProcessingHeader."Document Type" := StudentProcessingHeader."document type"::Confirmation;
            StudentProcessingHeader."Requested By Name" := trequesterName;
            StudentProcessingHeader."Requested By E-Mail" := trequesterEmail;
            StudentProcessingHeader."Requestor No." := Customer."No.";
            StudentProcessingHeader."Student No." := studentNo;
            StudentProcessingHeader.Validate("Student No.");
            StudentProcessingHeader.Date := Today;
            StudentProcessingHeader.Portal := true;
            StudentProcessingHeader.Submitted := true;
            if StudentProcessingHeader.Insert then begin

                StudentProcessingLines.Init;
                StudentProcessingLines."Booking Header No." := StudentProcessingHeader."No.";
                StudentProcessingLines."Document Type" := StudentProcessingLines."document type"::Confirmation;
                StudentProcessingLines."Student No." := studentNo;
                StudentProcessingLines."Registration No." := RegNo;
                StudentProcessingLines.Validate("Registration No.");
                StudentProcessingLines.Insert();

                status := 'success*Your Application for Confirmation of Examination Account ' + RegNo + ' of examination ' +
                StudentProcessingLines."Course Id" + ' was successfully Placed. Please wait for HRMPEB to process your request';
            end else begin
                status := 'danger*The document was successfully attached';
            end;
        end;
    end;

    procedure FnGetStudentUser(email: Text; password: Text) AllData: Text
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        found: Boolean;
        changepass: Text;
        Customer: Record Customer;
        entryno: Text;
        status: Text;
    begin
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", email);
        DynasoftPortalUser.SetRange("Password Value", password);
        DynasoftPortalUser.SetRange(State, DynasoftPortalUser.State::Enabled);
        if DynasoftPortalUser.FindSet then begin

            Customer.Reset;
            Customer.SetRange("ID. No.", DynasoftPortalUser."Id Number");
            if Customer.FindSet then begin
                repeat
                    entryno := Format(DynasoftPortalUser."Entry No");
                    status := Format(DynasoftPortalUser."Change Password");
                    AllData := AllData + DynasoftPortalUser."User Name" + '*' + DynasoftPortalUser."Authentication Email" + '*' + entryno + '*' + DynasoftPortalUser."Password Value" + '*' + DynasoftPortalUser."Mobile Phone No." + '*' + Customer."No." + '*'
                    + DynasoftPortalUser."Full Name" + '*' + DynasoftPortalUser."Id Number" + '*' + DynasoftPortalUser.FirstName + '*' + DynasoftPortalUser.MiddleName + '*' + DynasoftPortalUser.LastName + '*' + DynasoftPortalUser."Record ID" +
                    '*' + status + '::::';
                until Customer.Next = 0;
                exit(AllData);
            end else begin
                repeat
                    entryno := Format(DynasoftPortalUser."Entry No");
                    status := Format(DynasoftPortalUser."Change Password");
                    AllData := AllData + DynasoftPortalUser."User Name" + '*' + DynasoftPortalUser."Authentication Email" + '*' + entryno + '*' + DynasoftPortalUser."Password Value" + '*' + DynasoftPortalUser."Mobile Phone No." + '*' + DynasoftPortalUser."Record ID" + '*'
                    + DynasoftPortalUser."Full Name" + '*' + DynasoftPortalUser."Id Number" + '*' + DynasoftPortalUser.FirstName + '*' + DynasoftPortalUser.MiddleName + '*' + DynasoftPortalUser.LastName + '*' + DynasoftPortalUser."Record ID" +
                    '*' + status + '::::';
                until DynasoftPortalUser.Next = 0;
            end;
        end else begin
            DynasoftPortalUser.Reset;
            DynasoftPortalUser.SetRange("Authentication Email", email);
            if not DynasoftPortalUser.FindSet then begin
                AllData := 'danger*The email is Incorrect or you have not registered' + '::::';
            end else begin
                DynasoftPortalUser.Reset;
                DynasoftPortalUser.SetRange("Authentication Email", email);
                DynasoftPortalUser.SetRange("Password Value", password);
                if not DynasoftPortalUser.FindSet then begin
                    AllData := 'danger*Wrong Password' + '::::';
                end else begin
                    DynasoftPortalUser.Reset;
                    DynasoftPortalUser.SetRange("Authentication Email", email);
                    DynasoftPortalUser.SetRange("Password Value", password);
                    DynasoftPortalUser.SetRange(State, DynasoftPortalUser.State::Disabled);
                    if DynasoftPortalUser.FindSet then begin
                        AllData := 'danger*Your Account is Disabled. Please use an enabled Account' + '::::';
                    end;
                end;
            end;
        end;


        exit(AllData);
    end;

    procedure CreateRemarking(applicationNo: Code[50]; studentNo: Code[50]; RegNo: Code[50]; examCycle: Code[50]; examcenter: Code[50]; reasonForRemarking: Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        StudentProcessingLines: Record "Student Processing Lines";
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange("Document Type", StudentProcessingHeader."document type"::Remarking);
        StudentProcessingHeader.SetRange("Student No.", studentNo);
        StudentProcessingHeader.SetRange("Student Reg. No.", RegNo);
        if StudentProcessingHeader.FindSet then begin
            status := 'danger*You have an existing application for remarking';
        end else begin
            StudentProcessingHeader.Init;
            StudentProcessingHeader."Document Type" := StudentProcessingHeader."document type"::Remarking;
            StudentProcessingHeader."Student No." := studentNo;
            StudentProcessingHeader.Validate("Student No.");
            StudentProcessingHeader."Student Reg. No." := RegNo;
            StudentProcessingHeader.Validate("Student Reg. No.");
            StudentProcessingHeader."Examination Sitting" := examCycle;
            StudentProcessingHeader.Validate("Examination Sitting");
            StudentProcessingHeader."Examination Center Code" := examcenter;
            StudentProcessingHeader.Validate("Examination Center Code");
            StudentProcessingHeader.Date := Today;
            StudentProcessingHeader.Portal := true;
            StudentProcessingHeader.Submitted := true;
            if StudentProcessingHeader.Insert then begin

                status := 'success*Your Application for Remarking was successfully received.';
            end else begin
                status := 'danger*The Application for Remarking was not successfully received';
            end;
        end;
    end;

    procedure FnGetExaminationAccounts(studentNumber: Code[10]) AllData: Text
    var
        ExaminationAccount: Record "Examination Account";
        name: Text;
    begin
        ExaminationAccount.Reset;
        ExaminationAccount.SetRange("Student Cust No.", studentNumber);
        ExaminationAccount.SetRange(Blocked, false);
        if ExaminationAccount.FindSet() then begin
            repeat
                name := ExaminationAccount.Name;

                AllData := AllData + ExaminationAccount."Registration No." + '*' + ExaminationAccount."Course ID" + '*' + ExaminationAccount."Course Description"
                 + '*' + name + '*' + ExaminationAccount."ID No." + '*' + Format(ExaminationAccount.Status) + '*' + Format(ExaminationAccount."Registration Date") + '::::';
            until ExaminationAccount.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnInsertStudentQualification(ApplicationNo: Text; idNo: code[50]; fromDate: Date; toDate: Date; Inst: Text; qualif: Text; mainStudy: Text) Status: Text
    var
        StudentReegistrationQualif: Record "Student Registration Qualifi";

    begin
        StudentReegistrationQualif.Init();
        StudentReegistrationQualif."Application No" := ApplicationNo;
        StudentReegistrationQualif.From := fromDate;
        StudentReegistrationQualif."To" := toDate;
        StudentReegistrationQualif.Institution := Inst;
        StudentReegistrationQualif."Id Number" := idNo;
        StudentReegistrationQualif."Qualification Earned" := qualif;
        StudentReegistrationQualif."Main Field of Study" := mainStudy;

        If StudentReegistrationQualif.Insert(true) THEN begin
            Status := 'success*Qualification details added successfully.';
        end else begin
            Status := 'danger*An error occured while addid qualification details.';
        end;

    end;


    procedure SendEmailNotification(recepient: Text; emailSubject: Text; emailBody: Text)
    var
        Customer: Record Customer;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Body: Text;
    begin
        EmailMessage.Create(recepient, emailSubject, emailBody, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure DeleteRegistrationSharepointLinks(filename: Text; sharepointlink: Text) status: Text
    var
        studentProcessingHeader: Record "Student Processing Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **************************
        RecordLink.Reset;
        RecordLink.SetRange(Description, filename);
        RecordLink.setrange(url1, sharepointlink);
        RecordLink.setrange(Type, RecordLink.Type::Link);
        If RecordLink.findset then begin
            if RecordLink.Delete THEN BEGIN
                status := 'success*The document was successfully deleted';
            END ELSE BEGIN
                status := 'error*An error occured during the process of deleting link';
            END;
        END ELSE begin
            status := 'error*An error occured . Link not found';
        END;

    end;

    procedure DeleteStudentQualification(lineNo: integer; IdNo: Code[30]) status: Text
    var
        qualifi: Record "Student Registration Qualifi";
    begin

        qualifi.Reset;
        qualifi.setrange("Line No", lineNo);
        qualifi.setrange("Id Number", IdNo);
        If qualifi.findset then begin
            if qualifi.Delete THEN BEGIN
                status := 'success*The qualification was successfully deleted';
            END ELSE BEGIN
                status := 'error*An error occured during the process of deleting qualification';
            END;
        END ELSE begin
            status := 'error*An error occured . Qualification not found';
        END;

    end;

    procedure FnInsertExemptionSections(applicationNo: Code[50]) status: Text
    var
        exemptionLines: Record "Exemption Lines";
        levelTable: Record Level;
        courseCount: integer;
        levelCount: integer;
        StudentLines: Record "Student Processing Lines";
        StudentLines1: Record "Student Processing Lines";
        StudentLines2: Record "Student Processing Lines";
        LineNo: Integer;
        BulkProcessingHeader: Record "Student Processing Header";
        courseId: Code[50];

    begin
        status := 'success*Successfully handled section booking';
        BulkProcessingHeader.SetRange("No.", applicationNo);
        if BulkProcessingHeader.FindFirst then begin
            status := 'success*Test Primary';
            courseId := BulkProcessingHeader."Examination ID";

            levelTable.reset;
            levelTable.SetRange(Course, courseId);
            If levelTable.findset THEN BEGIN
                status := 'success*Test 1';
                courseCount := 0;
                //levelTable.Calcfields(levelTable."No. of Papers");
                repeat
                    levelTable.Calcfields(levelTable."No. of Papers");
                    levelCount := levelTable."No. of Papers";
                    StudentLines2.SetRange("Booking Header No.", applicationNo);
                    //StudentLines2.SetRange("Course Id", levelTable.Course);
                    StudentLines2.SetRange(Part, levelTable.Code);
                    if StudentLines2.findset THEN BEGIN
                        status := 'success*Test 2';
                        repeat
                            courseCount := courseCount + 1;
                        until StudentLines2.Next = 0;
                    END;

                    //courseCount := 0;

                    status := 'success*CourseCount=' + Format(courseCount) + Format(StudentLines2.Part) + 'levelCount=' + Format(levelCount) + levelTable.Code;

                    if courseCount = levelCount THEN BEGIN
                        StudentLines.Reset;
                        if StudentLines.FindLast then begin
                            LineNo := StudentLines."Line No.";
                        end;
                        status := 'success*Test 3';
                        StudentLines2.DeleteAll;
                        StudentLines1.init;
                        StudentLines1."Booking Header No." := applicationNo;
                        StudentLines1."Line No." := LineNo + 1;
                        StudentLines1."Booking Type" := StudentLines1."booking type"::Part;
                        StudentLines1."Document Type" := StudentLines1."document type"::Booking;
                        StudentLines1."Student No." := BulkProcessingHeader."Student No.";
                        StudentLines1.Validate("Student No.");
                        StudentLines1."Course Id" := BulkProcessingHeader."Examination ID";
                        StudentLines1.Part := levelTable.Code;
                        // StudentLines1.Paper := Papers.Code;
                        StudentLines1."Transaction Type" := StudentLines1."transaction type"::Booking;
                        StudentLines1.Validate(Part);
                        StudentLines1.Insert(true);
                        LineNo += 1;
                        //FoundValue := true;

                    END;

                until levelTable.Next = 0;

                //levelCount := 0;

            END

        END
    end;




}



