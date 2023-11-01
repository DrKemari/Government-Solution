#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50016 "Accreditation-Quality Audit"
{

    trigger OnRun()
    begin
    end;

    var
        ProgrammeHeader: Record "Acc Fee Schedules";
        EntryNo: Integer;
        PeerReviewerUsers: Record "Library Accounts";
        RandomDigit: Text;
        LineNo: Integer;
        Window: Guid;
        DocLog: Record "Document E-mail Log";
        Counter: Integer;

    local procedure "***********Quality Audit*************"()
    begin
    end;


    procedure CreatePeerReviewerAccount(ContactVar: Record Contact) Created: Boolean
    var
        Contact: Record Contact;
        UniversityUsers: Record UniversityUsers;
        AccountErr: label 'The Account with an email %1,already exists';
        Customer: Record Customer;
        TXT001: label 'Kindly onboard the customer before you create an account for the email';
    begin
        //  if ContactVar.Type = ContactVar.Type::"2" then begin
        PeerReviewerUsers.Reset;
        if PeerReviewerUsers.FindLast then begin
            EntryNo := PeerReviewerUsers."Entry No";
        end;
        PeerReviewerUsers.Reset;
        PeerReviewerUsers.SetRange("Authentication Email", ContactVar."E-Mail");
        if PeerReviewerUsers.FindSet then begin
            Error(AccountErr, PeerReviewerUsers."Authentication Email");
        end else begin
            PeerReviewerUsers.Init;
            PeerReviewerUsers."Entry No" := EntryNo + 1;
            //PeerReviewerUsers.UserType:=ContactVar."User Roles";
            PeerReviewerUsers."Authentication Email" := ContactVar."E-Mail";
            PeerReviewerUsers."Mobile Phone No." := ContactVar."Phone No.";
            PeerReviewerUsers."User Name" := ContactVar."First Name" + '  ' + ContactVar.Surname;
            PeerReviewerUsers."Full Name" := ContactVar."First Name" + '  ' + ContactVar."Middle Name" + '  ' + ContactVar.Surname;
            //PeerReviewerUsers.PeerCode:=ContactVar."No.";
            //PeerReviewerUsers.UniversityCode:=ContactVar."University Code";
            //PeerReviewerUsers.VALIDATE(UniversityCode);
            PeerReviewerUsers."Last Modified Date" := Today;

            RandomDigit := CreateGuid;
            RandomDigit := DelChr(RandomDigit, '=', '{}-01');
            RandomDigit := CopyStr(RandomDigit, 1, 8);
            PeerReviewerUsers."Password Value" := RandomDigit;
            PeerReviewerUsers.Insert;
            SendEmail1(PeerReviewerUsers);

            //   end;
        end;
        //Institutions
        if ContactVar.Type = ContactVar.Type::Company then begin
            UniversityUsers.Reset;
            if UniversityUsers.FindLast then begin
                EntryNo := UniversityUsers."Entry No";
            end;
            UniversityUsers.Reset;
            UniversityUsers.SetRange("Authentication Email", ContactVar."E-Mail");
            if UniversityUsers.FindSet then begin
                Error(AccountErr, UniversityUsers."Authentication Email");
            end else begin
                UniversityUsers.Init;
                UniversityUsers."Entry No" := EntryNo + 1;
                //PeerReviewerUsers.UserType:=ContactVar."User Roles";
                UniversityUsers."Authentication Email" := ContactVar."E-Mail";
                UniversityUsers."Mobile Phone No." := ContactVar."Phone No.";
                UniversityUsers."User Name" := ContactVar."First Name" + '  ' + ContactVar.Surname;
                UniversityUsers."Record Type" := UniversityUsers."record type"::Vendor;
                UniversityUsers."User Name" := ContactVar."E-Mail";
                UniversityUsers."Full Name" := ContactVar.Name;
                //get the cutomer no.
                Customer.Reset;
                Customer.SetRange("E-Mail", ContactVar."E-Mail");
                Customer.SetRange("Customer Type", Customer."customer type"::Funder);
                if Customer.FindFirst then begin
                    UniversityUsers.UniversityCode := Customer."No.";
                    UniversityUsers.Validate(UniversityCode);
                end else
                    Error(TXT001);
                //PeerReviewerUsers.PeerCode:=ContactVar."No.";
                //PeerReviewerUsers.UniversityCode:=ContactVar."University Code";
                //PeerReviewerUsers.VALIDATE(UniversityCode);
                UniversityUsers."Last Modified Date" := Today;

                RandomDigit := CreateGuid;
                RandomDigit := DelChr(RandomDigit, '=', '{}-01');
                RandomDigit := CopyStr(RandomDigit, 1, 8);
                UniversityUsers."Password Value" := RandomDigit;
                UniversityUsers.Insert;
                SendEmailAcc(UniversityUsers);

            end
        end
    end;


    procedure SendEmail1(PeerReviewerPortalusers: Record "Library Accounts")
    var
        UniversityUsers: Record UniversityUsers;
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        ExaminationSetup: Record "Examination Setup";
    begin
        PeerReviewerUsers.SetRange("Authentication Email", PeerReviewerPortalusers."Authentication Email");
        if PeerReviewerUsers.FindSet then begin
            //code to send email and link to universities
            //send notification email

            ExaminationSetup.Get;
            ExaminationSetup.TestField("Library SignUp Email");
            Email2 := ExaminationSetup."Library SignUp Email";

            //     //SMTP.Create('ACCOUNT CREATION', Email2, PeerReviewerUsers."Authentication Email",
            //     ' ACCOUNT CREATION',
            //      'Dear ' + PeerReviewerUsers."Full Name" + ',<BR><BR>' +
            //      'Your Library account has been created in the System.<BR>' +
            //      'Use the following link to acess the system.' + ' ' + '<b><a href="https://kasneb.or.ke/reading-list/">kasneb koha system</a></b><BR>The credentials are:'
            //      + '<BR>'
            //      + 'Username:' + ' <b>' + PeerReviewerUsers."Authentication Email" + '</b><BR>Password:' + ' <b>' + PeerReviewerUsers."Password Value" + '</b>'
            //   , true);
            //     //SMTP.AddBCC(Email2);
            //     //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>' + COMPANYNAME + '.<BR>');
            //     //SMTP.Send();

            DocLog.Reset;
            if DocLog.FindLast then begin
                Counter := DocLog."Entry No";
            end;           //record sending details
            DocLog.Init;
            DocLog."Entry No" := Counter + 1;
            //DocLog."Customer No":=UniversityUser.UniversityCode;
            //DocLog."Customer Name":=UniversityUser."University Name";
            DocLog."Document Type" := DocLog."document type"::" ";
            DocLog."E-mailed To" := PeerReviewerPortalusers."Authentication Email";
            DocLog.Date := Today;
            DocLog.Time := Time;
            DocLog."Sender ID" := UserId;
            DocLog.Insert(true);
            Message('Notification successfully sent to %1', PeerReviewerUsers."User Name");
        end
    end;

    local procedure "********Accreditation********"()
    begin
    end;


    procedure SendEmailAcc(UniversityUsers: Record UniversityUsers)
    var
        UniversityUsers1: Record UniversityUsers;
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        ExaminationSetup: Record "Examination Setup";
    begin
        UniversityUsers.SetRange("Authentication Email", UniversityUsers."Authentication Email");
        if UniversityUsers.FindSet then begin
            //code to send email and link to universities
            //send notification email

            ExaminationSetup.Get;
            ExaminationSetup.TestField("Library SignUp Email");
            Email2 := ExaminationSetup."Library SignUp Email";

            //     //SMTP.Create('ACCOUNT CREATION', Email2, UniversityUsers."Authentication Email",
            //     ' ACCOUNT CREATION',
            //      'Dear ' + UniversityUsers."Full Name" + ',<BR><BR>' +
            //      'Your Accreditation login account has been created in the System.<BR>' +
            //      'Use the following link to acess the system.' + ' ' + '<b><a href="http://192.168.0.95:8097/">KASNEB ACCREDITATION PORTAL</a></b><BR>The credentials are:'
            //      + '<BR>'
            //      + 'Username:' + ' <b>' + UniversityUsers."Authentication Email" + '</b><BR>Password:' + ' <b>' + UniversityUsers."Password Value" + '</b>'
            //   , true);
            //     //SMTP.AddBCC(Email2);
            //     //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>' + COMPANYNAME + '.<BR>');
            //     //SMTP.Send();

            DocLog.Reset;
            if DocLog.FindLast then begin
                Counter := DocLog."Entry No";
            end;           //record sending details
            DocLog.Init;
            DocLog."Entry No" := Counter + 1;
            //DocLog."Customer No":=UniversityUser.UniversityCode;
            //DocLog."Customer Name":=UniversityUser."University Name";
            DocLog."Document Type" := DocLog."document type"::" ";
            DocLog."E-mailed To" := UniversityUsers."Authentication Email";
            DocLog.Date := Today;
            DocLog.Time := Time;
            DocLog."Sender ID" := UserId;
            DocLog.Insert(true);
            Message('Notification successfully sent to %1', UniversityUsers."User Name");
        end
    end;
}

