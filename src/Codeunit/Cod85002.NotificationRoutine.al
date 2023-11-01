#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 85002 "Notification Routine"
{

    trigger OnRun()
    begin
        PortalUser.Reset;
        PortalUser.SetRange("Record Type", PortalUser."record type"::Customer);
        if PortalUser.FindFirst then begin
            repeat
            // IF PortalUser."Entry No">9018 THEN
            // Studentmanagement.FnSendEmaiNotificationOnApplicantAccountActivation(PortalUser);

            until PortalUser.Next = 0;
        end
    end;

    var
        PortalUser: Record "Dynasoft Portal User";
        Studentmanagement: Codeunit "Student management";

    procedure FnSendEmaiNotificationOnApplicantAccountActivation(ApplicantRequest: Record "Dynasoft Portal User")
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
    begin
        HRSetupNew.Get;
        RequesterEmail := ApplicantRequest."Authentication Email";
        RequesterName := ApplicantRequest."Full Name";
        Counter := Counter + 1;
        PortalUser.Reset;
        PortalUser.SetRange("Authentication Email", ApplicantRequest."Authentication Email");
        if PortalUser.FindSet then begin
            Password := PortalUser."Password Value";
            SenderAddress := HRSetupNew."Student Module EMail BCC";

            CompanyDetails := 'Dear' + ApplicantRequest."Full Name" + ',' + '<BR>';
            SenderMessage := 'Your student account has been created on the e-kasneb portal. Your registration details are as follows:</BR>' + '</BR></BR>';
            SupplierDetails := '</BR>' + '<BR></BR> Name:</>' + ApplicantRequest."Full Name" + '</BR>' +
            '<BR>Mobile Phone No:' + ApplicantRequest."Mobile Phone No." + '</BR>' + '</BR></BR>';
            LoginDetails := '</BR>' + '<BR></BR>We have also created your portal access account with the following login credentials:' + '<BR></BR>' +
            'User Name: ' + ApplicantRequest."Authentication Email" + '<BR></BR>' + 'Password: ' + ApplicantRequest."Password Value";
            ActivationDetails := '<BR></BR>To access the kasneb services, login to the ekasneb portal.</BR></BR>.' + ' Use this e-kasneb link .' + ' ' + '<b><a href="https://online.kasneb.or.ke/">to access the portal and login</a></b><BR>';


            emailhdr := 'Student Account Activation (Applicant Id No:' + ApplicantRequest."Id Number" + ')';

            // cu400.Create(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
            // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
            // cu400.AddBCC(HRSetupNew."Student Module EMail BCC");
            // cu400.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examinations <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');

            // cu400.Send;

            PortalUser.Notified := true;
            PortalUser.Modify(true);
        end
    end;
}

