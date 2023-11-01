#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50012 "HRPortal2"
{

    trigger OnRun()
    begin
        //generatePayslip('NCIA00001',20180106D);
        //MESSAGE(generateP9('00034',CURRENTDATETIME,CURRENTDATETIME));
        //MESSAGE( imprestGeneralDetails('004' ,'','subject' ,'objective','estinationNarration',TODAY,10,'','',''));
        //MESSAGE(leaveApplication('','21859','ANNUAL',0, : Integer;daysApplied : Integer;lStartDate : DateTime;phoneNumber : Code[20];emailAddress : Text;examdetails : Text;dateOfExam : DateTime;pre)
        //MESSAGE(updateIctRequest('ICTHELP056','HARDWARE','tested test test'));
        //MESSAGE(getItemsByLocation('NAIROBI','STATIONERY'));
        //MESSAGE(createIctRequest('00034','tested test test','',''));
        // MESSAGE(createPurchaseStoreRequisition('00204','','KASNEB','Request for Stationery',0,'','','',''));
        //test@gmail.com
        //KERRA_1
        //MESSAGE(applyOnline('test@gmail.com','KERRA_1'));
        //MESSAGE(generateEmployeeStatement('00034',CURRENTDATETIME,CURRENTDATETIME));
        //MESSAGE(cancelRecordApproval('00034','TR0023','transport requisition'));
        //MESSAGE(SendStudentTimetable('BK0016039'));
        // MESSAGE(fnGetAnnualWorkplanLines('CSP0001','FY2021/22'));
        // Message(getImprestReceipts('00172'));
    end;

    var
        Employee: Record Employee;
        objMail: Codeunit Mail;
        HRPortalUsers: Record HRPortalUsers;
        leaveApplications: Record "HR Leave Application";
        HrJobsApplicants: Record "Hr Jobs Applicants";
        JobApplicantHobbies: Record "Job Applicant Hobbies";
        JobApplicantReferees: Record "HR Applications Accomplishment";
        JobApplicantsQualifications: Record "Applications Accomplishments";
        CompanyJobs: Record "ManPower Planning Lines";
        JobPositionApplications: Record "HR Professional Qualifications";
        FILESPATH: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\';
        ImprestMemo: Record "Imprest Memo";
        LegInstr: InStream;
        LegOutStr: OutStream;
        LegText: Text;
        Leg: BigText;
        obj: BigText;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Payments: Record Payments;
        Payments1: Record Payments;
        Payments2: Record Payments;
        PurchaseHeader: Record "Purchase Header";
        annual: Option " ","Annual Leave","Emergency Leave";
        FILESPATH1: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\Payslip\';
        FILESPATH2: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\P9\';
        ApplicantEmploymentHistory: Record "Employee History Table";
        jpa: Record "HR Job Applications";
        gender: Option ,Female,Male,Both;
        disabled: Option No,Yes;
        MaritalStatus: Option Single,Married,Separated,Divorced,"Widow(er)",Other;
        applicantQualifications: Record "HR Applicant Qualifications";
        JobApplicants: Record "HR Job Applications";
        professionalQualifications: Record "HR Professional Qualifications";
        attendedTraining: Record "Hr Trainings Attended";
        membershipbody: Record "Hr Proffessional Body";
        applicantAccomplishment: Record "HR Applications Accomplishment";
        referee: Record "HR Applicant Referees";
        externalApplicants: Record "HR Applicant Accounts";
        helpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
        hdesk: Record "ICT Helpdesk";
        item: Record Item;
        applicantBackground: Record "Applicant Background";
        applicantReferee: Record "Applicant Referees";
        jobApplication: Record "Job Application Table";
        jobApp: Record "Job Application Table";
        FILESPATH3: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\EmployeeStatement\';
        FILESPATH8: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\studentTimetable\';
        appNo: Code[50];
        FILESPATH4: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\receipt\';
        StudentProcessingHeader: Record "Student Processing Header";
        SMTP: Codeunit "Email Message";
        SMTPMailSetup: Record "Email Account";
        Email2: Text;
        Body: Text[2048];
        FileName: Text;
        HRSetupNew: Record "Examination Setup";
        FILESPATH5: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\resultslip\';
        FILESPATH14: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\StandardAppraisalReport\';
        FILESPATH15: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\PlogReport\';
        FILESPATH16: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\IndividualPCReport\';
        FILESPATH17: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\CSP\';
        FILESPATH18: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\AWP\';
        FILESPATH19: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\BoardPC\';
        FILESPATH24: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\IndividualSubIndicator\';
        SubPlogLines: Record "Sub Plog Lines";
        SubPCObjective: Record "Sub PC Objective";
        SubJDObjective: Record "Sub JD Objective";
        InnovationLines: Record "Innovation Solicitation Line";
        InnovationHeader: Record "Innovation Solicitation";
        FILESPATH25: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\InnovationReport\';
        Payroll3: Codeunit Payroll3;
        FILESPATH99: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\RiskReport\';
        FILESPATH98: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\RiskManagementPlanDocuments\';
        FILESPATH97: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\StatusReport\';
        FILESPATH96: label 'C:\inetpub\wwwroot\KasnebPortal\downloads\IncidentLogReport\';
        RiskManagement: Codeunit "Risk Management";

    procedure resetPassword("employeeNumber-idNumber": Code[20]) status: Text
    begin
        status := 'danger*Account not found';
        Employee.Reset;
        Employee.SetRange(Employee."No.", "employeeNumber-idNumber");
        if Employee.FindSet then begin
            status := myResetPass(Employee);
        end else begin
            Employee.Reset;
            Employee.SetRange(Employee."ID Number", "employeeNumber-idNumber");
            if Employee.FindSet then begin
                status := myResetPass(Employee);
            end else begin
                if HrJobsApplicants.Get("employeeNumber-idNumber") then begin
                    //reset password for external
                    status := myResetPassExternal(HrJobsApplicants);
                end else begin
                    status := 'danger*Account with the given credentials does not exist';
                end;
            end;
        end;
        /*objMail.Create('CIC Pension','life.pensionws@cic.co.ke', recipient, subject, content, TRUE);
        objMail.Send();*/

    end;

    local procedure myResetPass(Employee: Record Employee) status: Text
    var
        employeeEmail: Text;
        password: Integer;
        passwordOk: Boolean;
        SMTPMailSetup: Record "Email Account";
    begin
        employeeEmail := Employee."Company E-Mail";
        if employeeEmail = '' then begin
            status := 'danger*You have not added company email to the selected employee. Kindly update and try again';
        end else begin
            passwordOk := false;
            repeat
                password := Random(9999);
                if password > 1000 then
                    passwordOk := true;
            until passwordOk = true;
            HRPortalUsers.Reset;
            HRPortalUsers.SetRange(HRPortalUsers.employeeNo, Employee."No.");
            if HRPortalUsers.FindSet then begin
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Modify(true);
            end else begin
                HRPortalUsers.Init;
                HRPortalUsers.employeeNo := Employee."No.";
                HRPortalUsers.IdNo := Employee."ID Number";
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Insert(true);
            end;
            SMTPMailSetup.Get();
            //  objMail.Create(SMTPMailSetup."Email Sender Name", SMTPMailSetup."Email Sender Address", employeeEmail, 'Password Reset', 'Your one time password is <strong>' + Format(password) + '</strong>', true);
            // objMail.Send();
            status := 'success*We have sent a one time password to your email (' + employeeEmail + '). Use it to log in to your account';
        end;
    end;

    local procedure myResetPassExternal(HrJobsApplicants: Record "Hr Jobs Applicants") status: Text
    var
        employeeEmail: Text;
        password: Integer;
        passwordOk: Boolean;
    begin
        employeeEmail := HrJobsApplicants."E-Mail";
        if employeeEmail = '' then begin
            status := 'danger*You have not added an email to you account. ';
        end else begin
            passwordOk := false;
            repeat
                password := Random(9999);
                if password > 1000 then
                    passwordOk := true;
            until passwordOk = true;
            HRPortalUsers.Reset;
            HRPortalUsers.SetRange(HRPortalUsers.IdNo, HrJobsApplicants."ID Number");
            if HRPortalUsers.FindSet then begin
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Modify(true);
            end else begin
                HRPortalUsers.Init;
                HRPortalUsers.employeeNo := Employee."No.";
                HRPortalUsers.IdNo := Employee."ID Number";
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Insert(true);
            end;
            /// objMail.CreateMessage('KEMRI', 'arndegwa@kemri.org', employeeEmail, 'Password Reset', 'Your one time password is <strong>' + Format(password) + '</strong>', true);
            objMail.Send();
            status := 'success*We have sent a on time password to your email (' + employeeEmail + '). Use it to log in to your account';
        end;
    end;

    procedure leaveApplication(leaveNo: Code[50]; employeeNumber: Code[20]; leaveType: Code[20]; annualLeaveType: Option " ","Annual Leave","Emergency Leave"; daysApplied: Integer; lStartDate: DateTime; phoneNumber: Code[20]; emailAddress: Text; examdetails: Text; dateOfExam: DateTime; previousAttempts: Integer; RelieverCode: Code[100]) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Application";
    begin
        status := 'danger*Your leave application failed';
        annualLeaveType := annualLeaveType;
        case annualLeaveType of
            0:
                annualLeaveType := Annual::"Annual Leave";
            1:
                annualLeaveType := Annual::"Emergency Leave";

            else
        end;


        Employee.Reset;
        Employee.SetRange("No.", employeeNumber);
        if Employee.FindSet then begin
            if leaveNo = '' then begin //a new leave
                leaveApplications.Init;
                leaveApplications."Employee No" := employeeNumber;
                leaveApplications.Validate("Employee No");
                leaveApplications."Leave Type" := leaveType;
                leaveApplications.Validate("Leave Type");
                leaveApplications."Annual Leave Type" := annualLeaveType;
                leaveApplications."Days Applied" := daysApplied;
                leaveApplications."Start Date" := Dt2Date(lStartDate);
                leaveApplications."Cell Phone Number" := phoneNumber;
                leaveApplications."E-mail Address" := emailAddress;
                leaveApplications."Details of Examination" := examdetails;
                leaveApplications."Date of Exam" := Dt2Date(dateOfExam);
                leaveApplications."Number of Previous Attempts" := Format(previousAttempts);
                leaveApplications.Validate("Days Applied");
                leaveApplications.Validate("Date of Exam");
                leaveApplications.Reliever := RelieverCode;
                leaveApplications.Validate(Reliever);

                if leaveApplications.Insert(true) then begin
                    leaveApplications."Employee No" := employeeNumber;
                    leaveApplications.Validate("Employee No");
                    leaveApplications.Validate("Start Date");
                    leaveApplications.Modify(true);
                    status := 'success*Your leave application was successfully placed *' + leaveApplications."Application Code";

                end;
            end else begin //existing leave application
                leaveApplications.Reset;
                leaveApplications.SetRange("Employee No", employeeNumber);
                leaveApplications.SetRange("Application Code", leaveNo);
                leaveApplications.SetRange(Status, leaveApplications.Status::Open);
                if leaveApplications.FindSet then begin
                    leaveApplications."Employee No" := employeeNumber;
                    leaveApplications.Validate("Employee No");
                    leaveApplications."Leave Type" := leaveType;
                    leaveApplications.Validate("Leave Type");
                    leaveApplications."Annual Leave Type" := annualLeaveType;
                    leaveApplications."Days Applied" := daysApplied;
                    leaveApplications."Start Date" := Dt2Date(lStartDate);
                    leaveApplications."Cell Phone Number" := phoneNumber;
                    leaveApplications."E-mail Address" := emailAddress;
                    leaveApplications."Details of Examination" := examdetails;
                    leaveApplications."Date of Exam" := Dt2Date(dateOfExam);
                    leaveApplications."Number of Previous Attempts" := Format(previousAttempts);
                    leaveApplications.Validate("Days Applied");
                    leaveApplications.Validate("Date of Exam");
                    leaveApplications.Reliever := RelieverCode;
                    leaveApplications.Validate(Reliever);
                    if leaveApplications.Modify(true) then begin
                        leaveApplications."Employee No" := employeeNumber;
                        leaveApplications.Validate("Employee No");
                        leaveApplications.Validate("Start Date");
                        leaveApplications.Modify(true);
                        status := 'success*Your leave application was successfully updated *' + leaveApplications."Application Code";

                    end;
                end else begin
                    status := 'danger*A leave application with the given code does not exist, you are not the owner or is no longer open';
                end;
            end;
        end else begin
            status := 'danger*The selected employee does not exist';
        end;
    end;

    procedure generatePayslip(employeeNumber: Code[20]; payPeriod: DateTime) status: Text
    var
        PayrollPeriodX: Record "Payroll PeriodX";
    begin
        status := 'danger*could not generate your statement';
        PayrollPeriodX.Reset;
        PayrollPeriodX.SetRange("Starting Date", Dt2Date(payPeriod));
        PayrollPeriodX.SetRange(Closed, true);
        if PayrollPeriodX.FindFirst then begin
            Employee.Reset;
            Employee.SetRange(Employee."No.", employeeNumber);
            if Employee.FindSet then begin
                Employee.Reset;
                Employee.SetRange(Employee."No.", employeeNumber);
                Employee.SetRange("Pay Period Filter", Dt2Date(payPeriod));
                if Employee.FindSet then begin

                    if FILE.Exists(FILESPATH1 + employeeNumber + '.pdf') then begin
                        FILE.Erase(FILESPATH1 + employeeNumber + '.pdf');
                        //Report.SaveAsPdf(89028, FILESPATH1 + employeeNumber + '.pdf', Employee);
                        status := 'success*Generated*Downloads\Payslip\' + employeeNumber + '.pdf';
                    end
                    else begin
                        //Report.SaveAsPdf(89028, FILESPATH1 + employeeNumber + '.pdf', Employee);
                        status := 'success*Generated*Downloads\Payslip\' + employeeNumber + '.pdf';
                    end

                end;
            end
            else begin
                status := 'danger*Employee not found';
            end;
        end else begin
            status := 'danger*The payroll period selected is not yet completed on';
        end
    end;

    procedure generateEmployeeStatement(employeeNumber: Code[20]; startDate: DateTime; endDate: DateTime) status: Text
    begin
        status := 'danger*could not generate your statement';
        Employee.Reset;
        Employee.SetRange(Employee."No.", employeeNumber);
        if Employee.FindSet then begin
            Employee.Reset;
            Employee.SetRange(Employee."No.", employeeNumber);
            Employee.SetFilter("Date Filter", Format(Format(startDate) + '..' + Format(endDate)));

            if Employee.FindSet then begin
                if FILE.Exists(FILESPATH3 + employeeNumber + '.pdf') then
                    FILE.Erase(FILESPATH3 + employeeNumber + '.pdf');
                //Report.SaveAsPdf(57016, FILESPATH3 + employeeNumber + '.pdf', Employee);
                status := 'success*Generated*Downloads\EmployeeStatement\' + employeeNumber + '.pdf';
            end
            else begin
                //Report.SaveAsPdf(57016, FILESPATH3 + employeeNumber + '.pdf', Employee);
                status := 'success*Generated*Downloads\EmployeeStatement\' + employeeNumber + '.pdf';
            end
        end
        else begin
            status := 'danger*Employee not found';
        end;
    end;

    procedure generateP9(employeeNumber: Code[20]; startDate: DateTime; endDate: DateTime) status: Text
    begin
        status := 'danger*could not generate your statement';
        Employee.Reset;
        Employee.SetRange(Employee."No.", employeeNumber);
        if Employee.FindSet then begin
            Employee.Reset;
            Employee.SetRange(Employee."No.", employeeNumber);
            Employee.SetFilter("Date Filter", Format(Format(startDate) + '..' + Format(endDate)));

            if Employee.FindSet then begin
                if FILE.Exists(FILESPATH2 + employeeNumber + '.pdf') then
                    FILE.Erase(FILESPATH2 + employeeNumber + '.pdf');
                //Report.SaveAsPdf(69019, FILESPATH2 + employeeNumber + '.pdf', Employee);
                status := 'success*Generated*Downloads\P9\' + employeeNumber + '.pdf';
            end
            else begin
                //Report.SaveAsPdf(69019, FILESPATH2 + employeeNumber + '.pdf', Employee);
                status := 'success*Generated*Downloads\P9\' + employeeNumber + '.pdf';
            end
        end
        else begin
            status := 'danger*Employee not found';
        end;
    end;

    procedure register("First Name": Text; "Middle Name": Text; "Last name": Text; "Email Address": Text; "Phone Number": Code[20]; "idNumber/Passport": Code[20]; citizenship: Code[20]; gender: Text) status: Text
    var
        password: Integer;
        passwordOk: Boolean;
    begin
        //check that the user does not exist by id
        //check that the user does not exist by email
        status := 'danger*Your account could not be created';
        HrJobsApplicants.Reset;
        HrJobsApplicants.SetRange("ID Number", "idNumber/Passport");
        if HrJobsApplicants.FindSet then begin
            status := 'danger*Another user with the given id number already exists. ';
        end else begin
            HrJobsApplicants.Reset;
            HrJobsApplicants.SetRange("E-Mail", "Email Address");
            if HrJobsApplicants.FindSet then begin
                status := 'danger*Another user with the given email address already exists. ';
            end else begin
                //check employee
                Employee.Reset;
                Employee.SetRange(Employee."ID Number", "idNumber/Passport");
                if Employee.FindSet then begin
                    status := 'danger*Your account could not be created since you have been registered as an employee. ';
                end else begin
                    //create account
                    HrJobsApplicants.Init;
                    HrJobsApplicants."ID Number" := "idNumber/Passport";
                    HrJobsApplicants."First Name" := "First Name";
                    HrJobsApplicants."Middle Name" := "Middle Name";
                    HrJobsApplicants."Last Name" := "Last name";
                    HrJobsApplicants."E-Mail" := "Email Address";
                    HrJobsApplicants."Cell Phone Number" := "Phone Number";
                    HrJobsApplicants.Citizenship := citizenship;
                    HrJobsApplicants.Gender := HrJobsApplicants.Gender::Female;
                    if gender = 'male' then
                        HrJobsApplicants.Gender := HrJobsApplicants.Gender::Male;
                    if HrJobsApplicants.Insert(true) then begin
                        passwordOk := false;
                        repeat
                            password := Random(9999);
                            if password > 1000 then
                                passwordOk := true;
                        until passwordOk = true;
                        //create account
                        HRPortalUsers.Init;
                        HRPortalUsers.IdNo := "idNumber/Passport";
                        HRPortalUsers.password := Format(password);
                        if HRPortalUsers.Insert(true) then begin
                            //  objMail.Create('Kasneb', 'support@kasneb.org', "Email Address", 'One Time Password', 'Your one time password is <strong>' + Format(password) + '</strong>', true);
                            objMail.Send();
                            status := 'success*Your account was successfully created. Please refer to the next instructions sent via email ';
                        end else begin
                            HrJobsApplicants.Delete;
                            status := 'danger*Your account could not be created. Please try again later ';
                        end;
                    end else begin
                        status := 'danger*Your account could not be created. Please try again later ';
                    end;
                end;
            end;
        end;
    end;

    procedure addHobby(idNumber: Code[20]; hobby: Text) status: Text
    begin
        status := 'danger*The hobby could not be added';
        if HrJobsApplicants.Get(idNumber) then begin
            JobApplicantHobbies.Init;
            JobApplicantHobbies."Id No" := idNumber;
            JobApplicantHobbies.Hobby := hobby;
            if JobApplicantHobbies.Insert(true) then begin
                status := 'success*The hobby was successfully added';
            end else begin
                status := 'danger*The hobby could not be added';
            end;
        end else begin
            status := 'danger*The selected employee does not exist';
        end;
        exit(status);
    end;

    procedure updateGeneralDetails(idNumber: Code[20]; firstName: Text; middleName: Text; lastName: Text; initials: Text; firstLanguage: Code[20]; firstLanguageRead: Boolean; firstLanguageWrite: Boolean; firstLanguageSpeak: Boolean; secondLanguage: Code[20]; secondLanguageRead: Boolean; secondLanguageWrite: Boolean; secondLanguageSpeak: Boolean; additionalLanguage: Code[20]; gender: Text; citizenship: Code[20]) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            HrJobsApplicants."First Name" := firstName;
            HrJobsApplicants."Middle Name" := middleName;
            HrJobsApplicants."Last Name" := lastName;
            HrJobsApplicants.Initials := initials;
            HrJobsApplicants."First Language (R/W/S)" := firstLanguage;
            HrJobsApplicants."First Language Read" := firstLanguageRead;
            HrJobsApplicants."First Language Write" := firstLanguageWrite;
            HrJobsApplicants."First Language Speak" := firstLanguageSpeak;
            HrJobsApplicants."Second Language (R/W/S)" := secondLanguage;
            HrJobsApplicants."Second Language Read" := secondLanguageRead;
            HrJobsApplicants."Second Language Write" := secondLanguageWrite;
            HrJobsApplicants."Second Language Speak" := secondLanguageSpeak;
            HrJobsApplicants."Additional Language" := additionalLanguage;
            if gender = 'Female' then
                HrJobsApplicants.Gender := HrJobsApplicants.Gender::Female;
            if gender = 'Male' then
                HrJobsApplicants.Gender := HrJobsApplicants.Gender::Male;
            HrJobsApplicants.Citizenship := citizenship;
            if HrJobsApplicants.Modify(true) then begin
                status := 'success*Your profile was successfully updated';
            end else begin
                status := 'danger*Your profile could not be updated. Please try again later';
            end;

        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure updatePersonalDetails(idNumber: Code[20]; maritalStatus: Text; ethnicOrigin: Text; disabled: Text; healthAssessment: Boolean; healthAssessmentDate: Date; dateOfBirth: Date) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            if maritalStatus = '' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::" ";
            if maritalStatus = 'Single' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Single;
            if maritalStatus = 'Married' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Married;
            if maritalStatus = 'Separated' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Separated;
            if maritalStatus = 'Divorced' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Divorced;
            if maritalStatus = 'Widow(er)' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::"Widow(er)";
            if maritalStatus = 'Other' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Other;
            if ethnicOrigin = 'African' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::African;
            if ethnicOrigin = 'Indian' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::Indian;
            if ethnicOrigin = 'White' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::White;
            if ethnicOrigin = 'Coloured' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::Coloured;
            if disabled = '' then
                HrJobsApplicants.Disabled := HrJobsApplicants.Disabled::" ";
            if disabled = 'No' then
                HrJobsApplicants.Disabled := HrJobsApplicants.Disabled::No;
            if disabled = 'Yes' then
                HrJobsApplicants.Disabled := HrJobsApplicants.Disabled::Yes;
            HrJobsApplicants."Health Assesment?" := healthAssessment;
            HrJobsApplicants."Health Assesment Date" := healthAssessmentDate;
            HrJobsApplicants."Date Of Birth" := dateOfBirth;
            if HrJobsApplicants.Modify(true) then begin
                status := 'success*Your profile was successfully updated' + Format(healthAssessmentDate);
            end else begin
                status := 'danger*Your profile could not be updated. Please try again later';
            end;
        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure updateCommunicationDetails(idNumber: Code[20]; homePhoneNumber: Text; postalAddress: Text; postalAddress2: Text; postalAddress3: Text; residentialAddress: Text; residentialAddress2: Text; residentialAddress3: Text; cellPhoneNumber: Text; workPhoneNumber: Text; extension: Text; fax: Text; postCode: Code[20]; postCode2: Code[20]) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            HrJobsApplicants."Home Phone Number" := homePhoneNumber;
            HrJobsApplicants."Postal Address" := postalAddress;
            HrJobsApplicants."Postal Address2" := postalAddress2;
            HrJobsApplicants."Postal Address3" := postalAddress3;
            HrJobsApplicants."Residential Address" := residentialAddress;
            HrJobsApplicants."Residential Address2" := residentialAddress2;
            HrJobsApplicants."Residential Address3" := residentialAddress3;
            HrJobsApplicants."Cell Phone Number" := cellPhoneNumber;
            HrJobsApplicants."Work Phone Number" := workPhoneNumber;
            HrJobsApplicants."Ext." := extension;
            HrJobsApplicants."Fax Number" := fax;
            HrJobsApplicants."Post Code" := postCode;
            HrJobsApplicants."Post Code2" := postCode2;
            if HrJobsApplicants.Modify(true) then begin
                status := 'success*Your profile was successfully updated';
            end else begin
                status := 'danger*Your profile could not be updated. Please try again later';
            end;
        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure addReferee(idNumber: Code[20]; refName: Text; refDesignation: Text; refInstitution: Text; refAddress: Text; refTelephone: Text; refEmail: Text) status: Text
    begin
        //JobApplicantReferees
        /*IF HrJobsApplicants.GET(idNumber) THEN BEGIN
          JobApplicantReferees.INIT;
          JobApplicantReferees.Code:=idNumber;
          JobApplicantReferees."Job Application No":= refName;
          JobApplicantReferees."Job Indicator Code":=refDesignation;
          JobApplicantReferees."Indicator Description":=refInstitution;
          JobApplicantReferees.Number:=refAddress;
          JobApplicantReferees."Additional Comments":=refTelephone;
          JobApplicantReferees."Job ID":=refEmail;
          IF JobApplicantReferees.INSERT(TRUE) THEN BEGIN
            status:='success*The referee was successfully added';
            END ELSE BEGIN
              status:='danger*The referee could not be added';
              END;
          END ELSE BEGIN
            status:='danger*A user with the given ID Number does not exist';
            END;*/

    end;

    procedure addQualification(idNumber: Code[20]; qualificationType: Text; qualificationCode: Code[20]; qualificationFrom: Date; qualificationTo: Date; institution: Text) status: Text
    begin
        /*
        IF HrJobsApplicants.GET(idNumber) THEN BEGIN
          JobApplicantsQualifications.INIT;
          JobApplicantsQualifications.Code:= idNumber;
         JobApplicantsQualifications."Qualification Type":=qualificationType ;
          JobApplicantsQualifications."Qualification Code":= qualificationCode;
          JobApplicantsQualifications.VALIDATE("Qualification Code");
          JobApplicantsQualifications."Indicator Description":=qualificationFrom;
          JobApplicantsQualifications.Number:=qualificationTo;
          JobApplicantsQualifications."Institution/Company":=institution;
          IF JobApplicantsQualifications.INSERT(TRUE) THEN BEGIN
            status:='success*The qualification was successfully added';
            END ELSE BEGIN
              status:='danger*The qualification could not be added';
              END;
          END ELSE BEGIN
            status:='danger*A user with the given ID Number does not exist';
            END;
            */

    end;

    procedure apply(idNumber: Code[20]; jobId: Code[20]) status: Text
    begin
        /*
        IF HrJobsApplicants.GET(idNumber) THEN BEGIN
          CompanyJobs.RESET;
          CompanyJobs.SETRANGE("Job ID", jobId);
          CompanyJobs.SETRANGE(Advertised, TRUE);
          IF CompanyJobs.FINDSET THEN BEGIN
            IF CompanyJobs."Vacant Positions">0 THEN BEGIN
              //apply for job
              //check if user has already applied for the job
              JobPositionApplications.RESET;
              JobPositionApplications.SETRANGE(JobPositionApplications."Job Applied For", jobId);
              JobPositionApplications.SETRANGE(JobPositionApplications."ID Number", idNumber);
              IF JobPositionApplications.FINDSET THEN BEGIN
                status:='danger*It seems you have already applied for this position. Please try another position';
                END ELSE BEGIN
                  JobPositionApplications.INIT;
                  JobPositionApplications."Job ID":= HrJobsApplicants."First Name";
                  JobPositionApplications."From Date":= HrJobsApplicants."Middle Name";
                  JobPositionApplications."To Date":= HrJobsApplicants."Last Name";
                  JobPositionApplications.Institution:= HrJobsApplicants.Initials;
                  JobPositionApplications."First Language (R/W/S)":= HrJobsApplicants."First Language (R/W/S)";
                  JobPositionApplications."First Language (R/W/S)":= HrJobsApplicants."First Language (R/W/S)";
                  JobPositionApplications."ID Number":= HrJobsApplicants."ID Number";
                  JobPositionApplications."Job Applied For":= jobId;
                  JobPositionApplications."Second Language (R/W/S)":= HrJobsApplicants."Second Language (R/W/S)";
                  JobPositionApplications."Second Language Read":= HrJobsApplicants."Second Language Read";
                  JobPositionApplications."Second Language Speak":= HrJobsApplicants."Second Language Speak";
                  JobPositionApplications."Second Language Write":= HrJobsApplicants."Second Language Write";
                  JobPositionApplications."Additional Language":= HrJobsApplicants."Additional Language";
                  JobPositionApplications."Applicant Type":= JobPositionApplications."Applicant Type"::"0";
                  JobPositionApplications.Gender:= HrJobsApplicants.Gender;
                  JobPositionApplications.Citizenship:= HrJobsApplicants.Citizenship;
                  JobPositionApplications.VALIDATE(Citizenship);
                  JobPositionApplications."Marital Status":= HrJobsApplicants."Marital Status";
                  JobPositionApplications."Ethnic Origin":= HrJobsApplicants."Ethnic Origin";
                  JobPositionApplications.Disabled:= HrJobsApplicants.Disabled;
                  JobPositionApplications."Health Assesment?":= HrJobsApplicants."Health Assesment?";
                  JobPositionApplications."Health Assesment Date":= HrJobsApplicants."Health Assesment Date";
                  JobPositionApplications."Date Of Birth":= HrJobsApplicants."Date Of Birth";
                  JobPositionApplications.Age:= HrJobsApplicants.Age;
                  JobPositionApplications."Home Phone Number":= HrJobsApplicants."Home Phone Number";
                  JobPositionApplications.Grade:= HrJobsApplicants."Postal Address";
                  JobPositionApplications."Postal Address2":= HrJobsApplicants."Postal Address2";
                  JobPositionApplications."Postal Address3":= HrJobsApplicants."Postal Address3";
                  JobPositionApplications.Code:= HrJobsApplicants."Post Code";
                  JobPositionApplications."Post Code2":= HrJobsApplicants."Post Code2";
                  JobPositionApplications."Cell Phone Number":= HrJobsApplicants."Cell Phone Number";
                  JobPositionApplications."Work Phone Number":= HrJobsApplicants."Work Phone Number";
                  JobPositionApplications."Ext.":= HrJobsApplicants."Ext.";
                  JobPositionApplications."E-Mail":= HrJobsApplicants."E-Mail";
                  JobPositionApplications."Fax Number":= HrJobsApplicants."Fax Number";
                      IF JobPositionApplications.INSERT(TRUE) THEN BEGIN
                        status:='success*You job application was successfully captured. Thank you';
                        END ELSE BEGIN
                          status:='danger*You application could not be captured. Please try again later';
                          END;
                  END;
              END ELSE BEGIN
                status:='danger*The selected job does not have any open position';
                END;
            END ELSE BEGIN
                 status:='danger*The selected job is no longer available';
              END;
           END ELSE BEGIN
            status:='danger*A user with the given ID Number does not exist';
            END;
            */

    end;

    procedure imprestGeneralDetails(employeeNo: Code[50]; imprestNo: Code[20]; subject: Text; objective: Text; destinationNarration: Text; travelDate: Date; numberOfDays: Decimal; job: Code[50]; jobTaskNo: Code[50]; fundCode: Code[100]) status: Text
    var
        ObjNoSeriesMgt: Codeunit NoSeriesManagement;
        ObjCashMgtSetup: Record "Cash Management Setup";
    begin
        status := 'danger*Your imprest requisition could not be captured';
        if imprestNo = '' then begin
            //ObjCashMgtSetup.GET;
            ImprestMemo.Init;
            ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
            //ImprestMemo."No.":=ObjNoSeriesMgt.GetNextNo(ObjCashMgtSetup."Imprest Memo Nos",TODAY,TRUE);

            ImprestMemo.Subject := subject;
            ImprestMemo.Validate(Subject);
            //ImprestMemo.Objective:= objective;
            ImprestMemo."Imprest Naration" := destinationNarration;
            ImprestMemo.Validate("Imprest Naration");
            ImprestMemo."Start Date" := travelDate;
            ImprestMemo.Validate("Start Date");
            ImprestMemo."No. of days" := numberOfDays;
            ImprestMemo.Validate("No. of days");
            ImprestMemo.Job := job;
            ImprestMemo.Validate(Job);
            ImprestMemo."Job  Task" := jobTaskNo;
            ImprestMemo.Validate("Job  Task");
            ImprestMemo.Requestor := employeeNo;
            ImprestMemo.Validate(Requestor);
            //
            if ImprestMemo.Insert(true) then begin
                ImprestMemo.Validate("No. of days");
                ImprestMemo.Requestor := employeeNo;
                //  ImprestMemo.VALIDATE(Requestor);
                ImprestMemo.Validate("Shortcut Dimension 2 Code", fundCode);
                ImprestMemo.Modify(true);
                //try updating the blob field
                ImprestMemo.CalcFields(Objective);
                ImprestMemo.Objective.CreateInstream(LegInstr);
                Leg.Read(LegInstr);
                LegText := objective;
                if LegText <> Format(Leg) then begin
                    Clear(ImprestMemo.Objective);
                    Clear(Leg);
                    Leg.AddText(LegText);
                    ImprestMemo.Objective.CreateOutstream(LegOutStr);
                    Leg.Write(LegOutStr);
                    ImprestMemo.Modify;
                end;

                status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
            end else begin
                status := 'danger*Your imprest requisition could not be created';
            end;
        end else begin
            ImprestMemo.Reset;
            ImprestMemo.SetRange(Requestor, employeeNo);
            ImprestMemo.SetRange("No.", imprestNo);
            ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
            ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
            if ImprestMemo.FindSet then begin
                ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
                ImprestMemo.Subject := subject;
                ImprestMemo.Validate(Subject);
                //ImprestMemo.Objective:= objective;
                ImprestMemo."Imprest Naration" := destinationNarration;
                ImprestMemo.Validate("Imprest Naration");
                ImprestMemo."Start Date" := travelDate;
                ImprestMemo.Validate("Start Date");
                ImprestMemo."No. of days" := numberOfDays;
                //ImprestMemo.VALIDATE("No. of days");
                ImprestMemo.Job := job;
                ImprestMemo.Validate(Job);
                ImprestMemo."Job  Task" := jobTaskNo;
                ImprestMemo.Validate("Job  Task");
                ImprestMemo.Requestor := employeeNo;
                ImprestMemo.Validate(Requestor);
                if ImprestMemo.Modify(true) then begin
                    ImprestMemo.Validate("No. of days");
                    ImprestMemo.Requestor := employeeNo;
                    ImprestMemo.Validate(Requestor);
                    ImprestMemo.Validate("Shortcut Dimension 2 Code", fundCode);
                    ImprestMemo.Modify(true);
                    //try updating the blob field
                    ImprestMemo.CalcFields(Objective);
                    ImprestMemo.Objective.CreateInstream(LegInstr);
                    Leg.Read(LegInstr);
                    LegText := objective;
                    if LegText <> Format(Leg) then begin
                        Clear(ImprestMemo.Objective);
                        Clear(Leg);
                        Leg.AddText(LegText);
                        ImprestMemo.Objective.CreateOutstream(LegOutStr);
                        Leg.Write(LegOutStr);
                        ImprestMemo.Modify;
                    end;

                    status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
                end else begin
                    status := 'danger*Your imprest requisition could not be created';
                end;

            end else begin
                status := 'danger*You are not the requester of the specified imprest memo. Please create a new imprest memo';
            end;


        end;


        exit(status);
    end;

    procedure getImprestObjective(imprestNo: Code[50]; employeeNo: Code[50]) objective: Text
    begin
        objective := '';
        ImprestMemo.Reset;
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Requestor, employeeNo);
        if ImprestMemo.FindSet then begin
            ImprestMemo.CalcFields(Objective);
            ImprestMemo.Objective.CreateInstream(LegInstr);
            Leg.Read(LegInstr);
            LegText := Format(Leg);

            //Convert Project Legectives from BLOB to TXT
            ImprestMemo.CalcFields(Objective);
            ImprestMemo.Objective.CreateInstream(LegInstr);
            Leg.Read(LegInstr);

            if LegText <> Format(obj) then begin
                Clear(ImprestMemo.Objective);
                Clear(Leg);
                Leg.AddText(LegText);
                ImprestMemo.Objective.CreateOutstream(LegOutStr);
                Leg.Write(LegOutStr);
            end;
            objective := Format(Leg);
        end;
        exit(objective);
    end;

    procedure addTeamMember(employeeNo: Code[50]; imprestNo: Code[50]; destinationTown: Text; voteItem: Text; teamMember: Text; noOfDays: Decimal) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The team member could not be added';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", teamMember);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", destinationTown);
            if ProjectMembers.FindSet then begin
                status := 'danger*The given team member has already been added to the selected imprest';
            end else begin
                ProjectMembers.Init;
                ProjectMembers.Type := ProjectMembers.Type::Person;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := destinationTown;
                ProjectMembers.Validate("Work Type");
                ProjectMembers."Type of Expense" := voteItem;
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := teamMember;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := noOfDays;
                ProjectMembers.Validate("Time Period");
                if ProjectMembers.Insert(true) then begin
                    status := 'success*The team member was successfully added';
                end else begin
                    status := 'danger*The team member could not be added';
                end;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure addFuel(employeeNo: Code[50]; imprestNo: Code[50]; workType: Text; resource: Text; mileage: Decimal) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The fuel could not be added';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", resource);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", workType);
            if ProjectMembers.FindSet then begin
                status := 'danger*The given fuel has already been added to the selected imprest';
            end else begin
                ProjectMembers.Init;
                ProjectMembers.Type := ProjectMembers.Type::Machine;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := workType;
                ProjectMembers.Validate("Work Type");
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := resource;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := mileage;
                ProjectMembers.Validate("Time Period");
                if ProjectMembers.Insert(true) then begin
                    status := 'success*The fuel was successfully added';
                end else begin
                    status := 'danger*The fuel could not be added';
                end;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure addCasuals(employeeNo: Code[50]; imprestNo: Code[50]; type: Integer; resource: Text; workType: Text; noRequired: Decimal; noOfDays: Decimal) status: Text
    var
        Casuals: Record Casuals;
    begin
        //Casuals
        status := 'danger*The casual could not be added';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", imprestNo);
            Casuals.SetRange(Type, type);
            Casuals.SetRange("Resource No.", resource);
            if Casuals.FindSet then begin
                status := 'danger*The casual has already been added to the selected imprest';
            end else begin
                //imprestNo : Code[50];type : Integer;resource : Text;workType : Text;noRequired : Decimal;noOfDays : Decimal
                Casuals.Init;
                Casuals.Type := type;
                Casuals."Imprest Memo No." := imprestNo;
                Casuals."Resource No." := resource;
                Casuals.Validate("Resource No.");
                Casuals.Validate("Imprest Memo No.");
                Casuals.Validate(Type);

                Casuals."Work Type" := workType;
                Casuals.Validate("Work Type");
                Casuals."No. Required" := noRequired;
                Casuals.Validate("No. Required");
                Casuals."No. of Days" := noOfDays;
                Casuals.Validate("No. of Days");
                if Casuals.Insert(true) then begin
                    status := 'success*The casual was successfully added';
                end else begin
                    status := 'danger*The casual could not be added';
                end;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure addOtherCosts(employeeNo: Code[50]; imprestNo: Code[50]; voteItem: Text; requiredFor: Text; quantityRequired: Decimal; noOfDays: Decimal; unitCost: Decimal) status: Text
    var
        OtherCosts: Record "Other Costs";
    begin
        //Casuals
        status := 'danger*The cost could not be added';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin

            // voteItem : Text;requiredFor : Text;quantityRequired : Decimal;noOfDays : Decimal;unitCost : Decimal
            OtherCosts.Init;
            OtherCosts."Line No." := getLineNo(imprestNo);
            ;
            OtherCosts."Imprest Memo No." := imprestNo;
            OtherCosts.Validate("Imprest Memo No.");
            OtherCosts."Type of Expense" := voteItem;
            OtherCosts.Validate("Type of Expense");
            OtherCosts."Required For" := requiredFor;
            OtherCosts.Validate("Required For");
            OtherCosts."Quantity Required" := quantityRequired;
            OtherCosts.Validate("Quantity Required");
            OtherCosts."No. of Days" := noOfDays;
            OtherCosts.Validate("No. of Days");
            OtherCosts."Unit Cost" := unitCost;
            OtherCosts.Validate("Unit Cost");
            if OtherCosts.Insert(true) then begin
                status := 'success*The cost was successfully added';
            end else begin
                status := 'danger*The cost could not be added';
            end;

        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    local procedure getLineNo(imprestNo: Code[50]): Integer
    var
        OtherCosts: Record "Other Costs";
        lineNo: Integer;
    begin
        lineNo := 0;
        OtherCosts.Reset;
        OtherCosts.SetRange("Imprest Memo No.", imprestNo);
        if OtherCosts.FindSet then begin
            repeat
                if OtherCosts."Line No." > lineNo then begin
                    lineNo := OtherCosts."Line No.";
                end;
            until OtherCosts.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure sendImprestMemoApproval(employeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
    begin
        status := 'danger*The imprest memo could not be sent for approval';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin

            ImprestMemo.TestField(Status, ImprestMemo.Status::Open);//status must be open.
                                                                    //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
            ImprestMemo.TestField(Objective);
            ImprestMemo.TestField(Subject);
            ImprestMemo.TestField(Date);
            ImprestMemo.TestField("Imprest Naration");
            //IF "Vote Amount"<"Total Subsistence Allowance" THEN
            //ERROR('Budgeted Amount is less than the Amount requested');

            //check if the requester is part of the team
            ProjectTeam.Reset;
            ProjectTeam.SetRange(ProjectTeam."No.", ImprestMemo.Requestor);
            if ProjectTeam.FindFirst = false then
                Error(TEXT012);

            //if //ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(ImprestMemo) then
            //ApprovalsMgmt.OnSendImpMemoForApproval(ImprestMemo);

            ImprestMemo1.Reset;
            ImprestMemo1.SetRange(Requestor, employeeNo);
            ImprestMemo1.SetRange("No.", imprestNo);
            if ImprestMemo1.FindSet then begin
                if ImprestMemo1.Status = ImprestMemo1.Status::"Pending Approval" then begin
                    status := 'success*The imprest memo was successfully sent for approval';
                end;
            end;

        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure createImprestSurrender(employeeNo: Code[50]; imprestNo: Code[50]; SurrenderNo: Code[50]) status: Text
    begin
        status := 'danger*Your imprest surrender could not be captured';
        if SurrenderNo = '' then begin //new imprest surrender
            Payments.Init;
            Payments."Document Type" := Payments."document type"::Surrender;
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::Surrender;
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Account No." := employeeNo;
            Payments.Validate("Account No.");
            Payments."Imprest Issue Doc. No" := imprestNo;
            Payments.Validate("Imprest Issue Doc. No");
            if Payments.Insert(true) then begin
                Payments.Validate("Imprest Issue Doc. No");
                Payments.Modify(true);
                status := 'success*Your imprest surrender was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your imprest surrender could not be captured';
            end;

        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", SurrenderNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindSet then begin
                if not (Payments."Imprest Issue Doc. No" = imprestNo) then begin
                    Payments."Imprest Issue Doc. No" := imprestNo;
                    Payments.Validate("Imprest Issue Doc. No");
                    if Payments.Modify(true) then begin
                        status := 'success*Your imprest surrender was successfully updated';
                    end else begin
                        status := 'danger*Your imprest surrender could not be updated';
                    end;
                end else begin
                    status := 'success*No changes to be done';
                end;
            end else begin
                status := 'danger*An imprest surrender with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;

    procedure sendImprestSurrenderApproval(employeeNo: Code[50]; imprestSurrenderNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
    begin
        status := 'danger*The imprest surrender could not be sent for approval';

        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", imprestSurrenderNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
        Payments.SetRange("Document Type", Payments."document type"::Surrender);
        if Payments.FindSet then begin
            Payments.TestField("Shortcut Dimension 1 Code");
            Payments.TestField("Shortcut Dimension 2 Code");
            //TESTFIELD("Shortcut Dimension 3 Code");
            //Payments.TESTFIELD("Imprest Issue Doc. No");
            //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
            //ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
            if Payments1.Get(Payments."Imprest Issue Doc. No") then begin
                Payments1.Selected := true;
                Payments1.Modify;
            end;
            if Payments2.Get(imprestSurrenderNo) then begin
                if Payments2.Status = Payments2.Status::"Pending Approval" then begin
                    status := 'success*The imprest Surrender was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure updateSurrenderLine(employeeNo: Code[50]; imprestSurrenderNo: Code[50]; lineNo: Integer; amountSpent: Decimal; receipt: Text; branchCode: Code[50]; DepartmentCode: Code[50]) status: Text
    var
        ImprestLines: Record "Imprest Lines";
    begin
        status := 'danger*The imprest line could not be updated';
        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", imprestSurrenderNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
        Payments.SetRange("Document Type", Payments."document type"::Surrender);
        if Payments.FindSet then begin

            Payments."Shortcut Dimension 1 Code" := branchCode;
            Payments."Shortcut Dimension 2 Code" := DepartmentCode;
            Payments.Validate("Currency Code", ImprestLines."Currency Code");

            if Payments.Modify(true) then begin
                ImprestLines.Reset;
                ImprestLines.SetRange(No, imprestSurrenderNo);
                ImprestLines.SetRange("Line No", lineNo);
                if ImprestLines.FindSet then begin
                    // ImprestLines.VALIDATE("Currency Code",ImprestLines."Currency Code");
                    ImprestLines.Validate("Actual Spent", amountSpent);
                    ImprestLines.Validate("Receipt No.", receipt);
                    if ImprestLines.Modify(true) then begin
                        status := 'success*The imprest line was successfully updated';//+FORMAT(lineNo);
                    end else begin
                        status := 'danger*The imprest line could not be updated';
                    end;
                end else begin
                    status := 'danger*The imprest line does not exist' + Format(lineNo);
                end;
            end;
        end else begin
            status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure createPurchaseStoreRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; location: Code[50]; description: Text; type: Integer; fundCode: Code[100]; branch: Code[10]; jobNo: Text; jobTask: Text) status: Text
    var
        myType: Text;
    begin
        myType := 'Store Requisition';
        if type = 0 then
            myType := 'Purchase Requisition';
        status := 'danger*Your ' + myType + ' could not be captured';
        if requisitionNo = '' then begin //new  requisition
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Store Requisition";
            if type = 0 then
                PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
            PurchaseHeader.Validate("Document Type");
            PurchaseHeader."Assigned User ID" := '';
            if type = 0 then begin
                PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::Project;
                PurchaseHeader.Validate("Requisition Type");
            end else
                PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::"Internal Use";
            PurchaseHeader."Requester ID" := UserId;
            PurchaseHeader."Request-By No." := employeeNo;
            PurchaseHeader.Validate("Request-By No.");
            PurchaseHeader."Location Code" := location;
            PurchaseHeader.Validate("Location Code");
            PurchaseHeader.Description := description;
            PurchaseHeader.Validate(Description);
            PurchaseHeader.Validate("Order Date", Today);
            PurchaseHeader."Responsibility Center" := location;

            if PurchaseHeader.Insert(true) then begin
                PurchaseHeader.Validate("Request-By No.", employeeNo);
                // PurchaseHeader.VALIDATE(Description,description);
                //PurchaseHeader.VALIDATE("Request-By No.");
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader.Validate("Shortcut Dimension 2 Code", fundCode);
                PurchaseHeader.Validate("Shortcut Dimension 1 Code", branch);
                PurchaseHeader.Validate(Job, jobNo);
                PurchaseHeader.Validate("Job Task No.", jobTask);
                PurchaseHeader.Modify(true);
                status := 'success*Your ' + myType + ' was successfully created*' + PurchaseHeader."No.";
            end else begin
                status := 'danger*Your ' + myType + ' could not be captured';
            end;

        end else begin //existing
            PurchaseHeader.Reset;
            if type = 0 then begin
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            end else begin
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
            end;
            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            PurchaseHeader.SetRange("No.", requisitionNo);
            if PurchaseHeader.FindSet then begin
                PurchaseHeader."Responsibility Center" := location;
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate(Description, description);
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader.Validate(Job, jobNo);
                PurchaseHeader.Validate("Job Task No.", jobTask);

                PurchaseHeader.Validate("Shortcut Dimension 2 Code", fundCode);
                PurchaseHeader.Validate("Shortcut Dimension 1 Code", branch);
                if PurchaseHeader.Modify(true) then begin
                    status := 'success*Your ' + myType + ' was successfully updated';
                end else begin
                    status := 'danger*Your ' + myType + ' could not be updated';
                end;

            end else begin
                status := 'danger*A ' + myType + ' with the given number does not exist, you are not the owner or is no longer open' + requisitionNo;
            end;

        end;
        exit(status);
    end;

    procedure createRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; budget: Code[250]; procurementPlan: Code[250]; itemCategory: Code[250]; item: Code[250]; quantity: Decimal; directUnitCost: Decimal) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        status := 'danger*Your Requisition Line could not be added';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            if (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition") then begin
                //add line
                PurchaseLine.Init;
                //Document Type,Document No.,Line No.
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Store Requisition";
                end;
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Purchase Requisition";
                end;
                PurchaseLine."Document No." := requisitionNo;
                PurchaseLine.Validate("Document No.");
                PurchaseLine."Line No." := getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
                PurchaseLine.Validate("Line No.");
                PurchaseLine."Procurement Plan" := budget;
                PurchaseLine.Validate("Procurement Plan");
                PurchaseLine."Procurement Plan Item" := procurementPlan;
                PurchaseLine.Validate("Procurement Plan Item");
                PurchaseLine."Item Category" := itemCategory;
                PurchaseLine.Validate("Item Category");
                PurchaseLine."Service/Item Code" := item;
                PurchaseLine.Validate("Service/Item Code");
                PurchaseLine."Location Code" := 'KASNEB';
                PurchaseLine."Qty. Requested" := quantity;
                PurchaseLine.Validate("Qty. Requested");
                PurchaseLine.Validate("Direct Unit Cost", directUnitCost);


                if PurchaseLine.Insert(true) then begin
                    PurchaseLine.Validate("Qty. Requested", quantity);
                    PurchaseLine.Validate("Direct Unit Cost", directUnitCost);
                    PurchaseLine.Validate("Unit Cost", directUnitCost);
                    //PurchaseLine.VALIDATE("Procurement Plan");

                    PurchaseLine.Modify(true);
                    status := 'success*The Requisition Line was successfully added';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Requisition Line could not be added';
                end;
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    local procedure getPurchaseLineNo(requisitionNo: Code[50]; requisitionType: Option): Integer
    var
        purchaseLine: Record "Purchase Line";
        lineNo: Integer;
    begin
        lineNo := 0;
        purchaseLine.Reset;
        purchaseLine.SetRange("Document No.", requisitionNo);
        purchaseLine.SetRange("Document Type", requisitionType);
        if purchaseLine.FindSet then begin
            repeat
                if purchaseLine."Line No." > lineNo then begin
                    lineNo := purchaseLine."Line No.";
                end;
            until purchaseLine.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure sendPurchaseRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        PurchaseHeader1: Record "Purchase Header";
    begin
        status := 'danger*The Purchase Requisition could not be sent for approval';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
        if PurchaseHeader.FindSet then begin
            PurchaseHeader.TestField("Shortcut Dimension 1 Code");
            PurchaseHeader.TestField("Shortcut Dimension 2 Code");
            PurchaseHeader.TestField(Description);
            //TESTFIELD("Requester ID",USERID);
            PurchaseHeader.CalcFields("Requisition Amount");
            PurchaseHeader.TestField("Requisition Amount");
            //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) then
            //ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);

            PurchaseHeader1.Reset;
            PurchaseHeader1.SetRange("Request-By No.", employeeNo);
            PurchaseHeader1.SetRange("No.", requisitionNo);
            PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            if PurchaseHeader1.FindSet then begin
                if PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval" then begin
                    status := 'success*The Purchase Requisition was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure createFleetRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; from: Text; destination: Text; dateOfTrip: Date; timeOut: DateTime; journeyRoute: Text; noOfDaysRequested: Decimal; purposeOfTrip: Text; comments: Text) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin
        status := 'danger*Your Fleet Requisition could not be created';
        if requisitionNo = '' then begin //a new record
            TransportRequisition.Init;
            TransportRequisition.Commencement := from;
            TransportRequisition.Validate(Commencement);
            TransportRequisition.Destination := destination;
            TransportRequisition.Validate(Destination);
            TransportRequisition."Date of Trip" := dateOfTrip;
            TransportRequisition.Validate("Date of Trip");
            TransportRequisition."Time out" := Dt2Time(timeOut);
            TransportRequisition.Validate("Time out");
            TransportRequisition."Journey Route" := journeyRoute;
            TransportRequisition.Validate("Journey Route");
            TransportRequisition."No of Days Requested" := noOfDaysRequested;
            TransportRequisition.Validate("No of Days Requested");
            TransportRequisition."Purpose of Trip" := purposeOfTrip;
            TransportRequisition.Validate("Purpose of Trip");
            TransportRequisition.Comments := comments;
            TransportRequisition.Validate(Comments);
            TransportRequisition."Employee No" := employeeNo;
            TransportRequisition.Validate("Employee No");
            TransportRequisition."Date of Request" := Today;
            if TransportRequisition.Insert(true) then begin
                status := 'success*Your Fleet Requisition was successfully created*' + TransportRequisition."Transport Requisition No";
            end;

        end else begin //update existing record
            TransportRequisition.Reset;
            TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
            TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
            TransportRequisition.SetRange("Employee No", employeeNo);
            if TransportRequisition.FindSet then begin
                TransportRequisition.Commencement := from;
                TransportRequisition.Validate(Commencement);
                TransportRequisition.Destination := destination;
                TransportRequisition.Validate(Destination);
                TransportRequisition."Date of Trip" := dateOfTrip;
                TransportRequisition.Validate("Date of Trip");
                TransportRequisition."Time out" := Dt2Time(timeOut);
                TransportRequisition.Validate("Time out");
                TransportRequisition."Journey Route" := journeyRoute;
                TransportRequisition.Validate("Journey Route");
                TransportRequisition."No of Days Requested" := noOfDaysRequested;
                TransportRequisition.Validate("No of Days Requested");
                // TransportRequisition."Purpose of Trip":=purposeOfTrip;
                TransportRequisition.Validate("Purpose of Trip");
                TransportRequisition.Comments := comments;
                TransportRequisition.Validate(Comments);
                if TransportRequisition.Modify(true) then begin
                    status := 'success*Your Fleet Requisition was successfully updated';
                end else begin
                    status := 'danger*Your Fleet Requisition could not be updated';
                end;
            end else begin
                status := 'danger*A Fleet Requisition with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        //
        exit(status);
    end;

    procedure addFleetRequisitionStaff(employeeNo: Code[50]; requisitionNo: Code[50]; staffNo: Code[50]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
    begin
        status := 'danger*The Staff member could not be added to your Fleet Requisition';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionStaff.Init;
            TravelRequisitionStaff."Req No" := requisitionNo;
            TravelRequisitionStaff.Validate("Req No");
            TravelRequisitionStaff."Employee No" := staffNo;
            TravelRequisitionStaff.Validate("Employee No");
            if TravelRequisitionStaff.Insert(true) then begin
                status := 'success*The Staff member was successfully added to your Fleet Requisition';
            end else begin
                status := 'danger*The Staff member could not be added to your Fleet Requisition';
            end;

        end else begin
            status := 'danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;

    procedure addFleetRequisitionNonStaff(employeeNo: Code[50]; requisitionNo: Code[50]; IdNumber: Integer; PhoneNumber: Integer; OrganizationName: Code[50]; Name: Code[50]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
        TravelRequisitionNonStaff: Record "Travel Requisition Non Staff";
    begin

        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionNonStaff.Init;
            TravelRequisitionNonStaff."Req No" := requisitionNo;
            TravelRequisitionNonStaff.Validate("Req No");
            // TravelRequisitionNonStaff."ID No" := IdNumber;
            TravelRequisitionNonStaff."Allocated Vehicle Reg No" := OrganizationName;
            TravelRequisitionNonStaff.Name := Name;
            //TravelRequisitionNonStaff."Phone Number" := PhoneNumber;
            if TravelRequisitionNonStaff.Insert(true) then begin
                status := 'success*The Staff member was successfully added to your Fleet Requisition';
            end else begin
                status := 'danger*The Staff member could not be added to your Fleet Requisition';
            end;
        end else begin
            status := 'danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);

    end;

    procedure sendFleetRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin
        status := 'danger*The fleet requisition could not be sent for approval';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Employee No", employeeNo);
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        if TransportRequisition.FindSet then begin
            TransportRequisition.TestField(Status, TransportRequisition.Status::Open);
            TransportRequisition.TestField(Commencement);
            TransportRequisition.TestField(Destination);
            TransportRequisition.TestField("Date of Trip");
            TransportRequisition.TestField("Purpose of Trip");


            //if //ApprovalsMgmt.CheckFleetApprovalsWorkflowEnabled(TransportRequisition) then
            //ApprovalsMgmt.OnSendFleetForApproval(TransportRequisition);

        end else begin
            status := 'danger*A fleet requisition with the given number does not exist, is no longer open or you are not the owner';
        end;
        exit(status);
    end;

    procedure removeStaffFromTravelRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; entryNo: Integer) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
    begin
        //status:='danger*The Staff member could not be removed from your Fleet Requisition';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionStaff.Reset;
            TravelRequisitionStaff.SetRange(EntryNo, entryNo);
            TravelRequisitionStaff.SetRange("Req No", requisitionNo);
            if TravelRequisitionStaff.FindSet then begin
                if TravelRequisitionStaff.Delete(true) then begin
                    status := 'success*The Staff member was successfully removed from your Fleet Requisition';
                end;

            end;


        end else begin
            // status:='danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;

    procedure removeMemberFromImprestMemo(number: Code[50]; workType: Code[50]; mEmployeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The team member could not be removed';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, mEmployeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            //Imprest Memo No.,No.,Work Type
            ProjectMembers.SetRange("No.", number);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", workType);
            if ProjectMembers.FindSet then begin
                if ProjectMembers.Delete(true) then begin
                    status := 'success*The team member was successfully removed from the imprest memo';
                end else begin
                    status := 'danger*The team member could not be removed';
                end;
            end else begin
                status := 'danger*The given team member has not been added to the selected imprest';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure editTeamMember(employeeNo: Code[50]; imprestNo: Code[50]; destinationTown: Text; voteItem: Text; teamMember: Text; noOfDays: Decimal; originalNumber: Code[50]; originalWorkType: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The team member could not be edited';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            //Imprest Memo No.,No.,Work Type
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", originalNumber);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", originalWorkType);
            if ProjectMembers.FindSet then begin
                ProjectMembers.Type := ProjectMembers.Type::Person;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := destinationTown;
                ProjectMembers.Validate("Work Type");
                ProjectMembers."Type of Expense" := voteItem;
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := teamMember;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := noOfDays;
                ProjectMembers.Validate("Time Period");
                if ProjectMembers.Modify(true) then begin
                    status := 'success*The team member was successfully edited';
                end else begin
                    status := 'danger*The team member could not be edited';
                end;

            end else begin
                status := 'danger*The given team member has not been added to the selected imprest' + originalWorkType;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure removeFuelFromImprestMemo(number: Code[50]; workType: Code[50]; mEmployeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The fuel could not be removed';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, mEmployeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin

            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", number);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", workType);
            if ProjectMembers.FindSet then begin
                if ProjectMembers.Delete(true) then begin
                    status := 'success*The fuel was successfully removed from the imprest memo';
                end else begin
                    status := 'danger*The fuel could not be removed';
                end;
            end else begin
                status := 'danger*The given fuel has not been added to the selected imprest';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure editFuel(employeeNo: Code[50]; imprestNo: Code[50]; workType: Text; resource: Text; mileage: Decimal; originalNo: Code[50]; originalWorkType: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The fuel could not be added';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", originalNo);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", originalWorkType);
            if ProjectMembers.FindSet then begin
                ProjectMembers.Type := ProjectMembers.Type::Machine;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := workType;
                ProjectMembers.Validate("Work Type");
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := resource;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := mileage;
                if ProjectMembers.Modify(true) then begin
                    status := 'success*The fuel was successfully updated';
                end else begin
                    status := 'danger*The fuel could not be added';
                end;

            end else begin
                status := 'danger*The given fuel has not been added to the selected imprest';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure removeCasuals(employeeNo: Code[50]; imprestNo: Code[50]; resourceType: Text; resourceNo: Code[50]) status: Text
    var
        Casuals: Record Casuals;
    begin
        //Casuals
        status := 'danger*The casual could not be removed';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", imprestNo);
            if Lowercase(resourceType) = 'skilled' then begin
                Casuals.SetRange(Type, Casuals.Type::Skilled);
            end else begin
                Casuals.SetRange(Type, Casuals.Type::Unskilled);
            end;

            Casuals.SetRange("Resource No.", resourceNo);
            if Casuals.FindSet then begin

                if Casuals.Delete(true) then begin
                    status := 'success*The casual was successfully removed from the imprest';
                end else begin
                    status := 'danger*The casual could not be removed from the imprest';
                end;

            end else begin
                //imprestNo : Code[50];type : Integer;resource : Text;workType : Text;noRequired : Decimal;noOfDays : Decimal
                status := 'danger*The casual has not been added to the selected imprest' + resourceNo;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure editCasuals(employeeNo: Code[50]; imprestNo: Code[50]; type: Integer; resource: Text; workType: Text; noRequired: Decimal; noOfDays: Decimal; originalResourceType: Code[50]; originalResourceNo: Code[50]) status: Text
    var
        Casuals: Record Casuals;
    begin
        //Casuals
        status := 'danger*The casual could not be edited';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", imprestNo);
            if Lowercase(originalResourceType) = 'skilled' then begin
                Casuals.SetRange(Type, Casuals.Type::Skilled);
            end else begin
                Casuals.SetRange(Type, Casuals.Type::Unskilled);
            end;
            Casuals.SetRange("Resource No.", originalResourceNo);
            if Casuals.FindSet then begin
                Casuals.Type := type;
                Casuals."Imprest Memo No." := imprestNo;
                Casuals."Resource No." := resource;
                Casuals.Validate("Resource No.");
                Casuals.Validate("Imprest Memo No.");
                Casuals.Validate(Type);

                Casuals."Work Type" := workType;
                Casuals.Validate("Work Type");
                Casuals."No. Required" := noRequired;
                Casuals.Validate("No. Required");
                Casuals."No. of Days" := noOfDays;
                Casuals.Validate("No. of Days");
                if Casuals.Modify(true) then begin
                    status := 'success*The casual was successfully updated';
                end else begin
                    status := 'danger*The casual could not be updated';
                end;
            end else begin
                status := 'danger*The casual has not been added to the selected imprest';

            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure removeOtherCosts(imprestNo: Code[50]; employeeNo: Code[50]; lineNo: Integer) status: Text
    var
        OtherCosts: Record "Other Costs";
    begin
        status := 'danger*The cost could not be removed';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            OtherCosts.Reset;
            OtherCosts.SetRange("Line No.", lineNo);
            OtherCosts.SetRange("Imprest Memo No.", imprestNo);
            if OtherCosts.FindSet then begin
                if OtherCosts.Delete(true) then begin
                    status := 'success*The cost was successfully removed';
                end else begin
                    status := 'danger*The cost could not be removed';
                end;
            end else begin
                status := 'danger*The cost does not exists in the selected imprest memo';
            end;

        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;

        exit(status);
    end;

    procedure editOtherCosts(employeeNo: Code[50]; imprestNo: Code[50]; voteItem: Text; requiredFor: Text; quantityRequired: Decimal; noOfDays: Decimal; unitCost: Decimal; originalLineNo: Integer) status: Text
    var
        OtherCosts: Record "Other Costs";
    begin
        //Casuals
        status := 'danger*The cost could not be updated';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", imprestNo);
            OtherCosts.SetRange("Line No.", originalLineNo);
            if OtherCosts.FindSet then begin
                OtherCosts."Imprest Memo No." := imprestNo;
                OtherCosts.Validate("Imprest Memo No.");
                OtherCosts."Type of Expense" := voteItem;
                OtherCosts.Validate("Type of Expense");
                OtherCosts."Required For" := requiredFor;
                OtherCosts.Validate("Required For");
                OtherCosts."Quantity Required" := quantityRequired;
                OtherCosts.Validate("Quantity Required");
                OtherCosts."No. of Days" := noOfDays;
                OtherCosts.Validate("No. of Days");
                OtherCosts."Unit Cost" := unitCost;
                OtherCosts.Validate("Unit Cost");
                if OtherCosts.Modify(true) then begin
                    status := 'success*The cost was successfully updated';
                end else begin
                    status := 'danger*The cost could not be updated';
                end;
            end else begin
                status := 'danger*The cost has not been added to the selected imprest memo';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure generateLeaveForm(employeeNo: Code[50]; leaveNo: Code[50]) status: Text
    var
        leaveFileName: Text;
    begin
        status := 'danger*The leave form could not be generated';
        leaveApplications.Reset;
        leaveApplications.SetRange("Application Code", leaveNo);
        leaveApplications.SetRange("Employee No", employeeNo);
        if leaveApplications.FindSet then begin
            leaveFileName := FILESPATH + 'leave' + leaveNo + '.pdf';
            if FILE.Exists(leaveFileName) then begin
                FILE.Erase(leaveFileName);
            end;
            //Report.SaveAsPdf(69005, leaveFileName, leaveApplications);
            if FILE.Exists(leaveFileName) then begin
                status := 'success*' + 'Downloads\leave' + leaveNo + '.pdf';
            end;
        end else begin
            status := 'danger*The leave does not exist or you are not the requester';
        end;
        exit(status);
    end;

    procedure sendRecordForApproval(employeeNo: Code[50]; recordNo: Code[50]; recordType: Text) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Application";
    begin
        status := 'danger*The record could not be sent for approval';
        recordType := Lowercase(recordType);
        if recordType = 'leave' then begin
            status := 'danger*The leave could not be sent for approval';
            leaveApplications.Reset;
            leaveApplications.SetRange("Application Code", recordNo);
            leaveApplications.SetRange("Employee No", employeeNo);
            if leaveApplications.FindSet then begin
                //if //ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(leaveApplications) then
                //ApprovalsMgmt.OnSendLeaveAppForApproval(leaveApplications);
                if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
                    if HRLeaveApplication1.Status = HRLeaveApplication1.Status::Open then begin
                        status := 'warning*Your leave application  could not be sent for approval';
                    end else begin
                        status := 'success*Your leave application was successfully  sent for approval';
                    end;
                end;
            end else begin
                status := 'danger*The leave does not exist or you are not the requester';
            end;
        end;
        exit(status);
    end;

    procedure cancelRecordApproval(employeeNo: Code[50]; recordNo: Code[50]; recordType: Text) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Application";
        ImprestMemo1: Record "Imprest Memo";
        Payments2: Record Payments;
        ImprestHeader: Record Payments;
        PurchaseHeader1: Record "Purchase Header";
        TransportRequisition: Record "Transport Requisition";
        TransportRequisition1: Record "Transport Requisition";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        status := 'danger*The record approval could not be cancelled';
        recordType := Lowercase(recordType);
        if recordType = 'leave' then begin
            status := 'danger*The leave approval could not be cancelled';
            leaveApplications.Reset;
            leaveApplications.SetRange("Application Code", recordNo);
            leaveApplications.SetRange("Employee No", employeeNo);
            if leaveApplications.FindSet then begin
                ////if //ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(leaveApplications) THEN
                //ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(leaveApplications);
                if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
                    if HRLeaveApplication1.Status = leaveApplications.Status then begin
                        status := 'warning*Your leave application  approval could not be cancelled';
                    end else begin
                        status := 'success*Your leave application approval was successfully cancelled';
                    end;
                end;
            end else begin
                status := 'danger*The leave does not exist or you are not the requester';

            end;
        end else
            if recordType = 'imprest memo' then begin
                status := 'danger*The imprest memo approval could not be cancelled';

                ImprestMemo.Reset;
                ImprestMemo.SetRange(Requestor, employeeNo);
                ImprestMemo.SetRange("No.", recordNo);
                ImprestMemo.SetRange(Status, ImprestMemo.Status::"Pending Approval");
                if ImprestMemo.FindSet then begin

                    //ApprovalsMgmt.OnCancelImpMemoApprovalRequest(ImprestMemo);

                    ImprestMemo1.Reset;
                    ImprestMemo1.SetRange(Requestor, employeeNo);
                    ImprestMemo1.SetRange("No.", recordNo);
                    if ImprestMemo1.FindSet then begin
                        if not (ImprestMemo1.Status = ImprestMemo1.Status::"Pending Approval") then begin
                            status := 'success*The imprest memo approval was successfully cancelled';
                        end;
                    end;

                end else begin
                    status := 'danger*An imprest with the given number does not exist, you are not the requestor or has not been sent for approval';
                end;
                exit(status);
            end else
                if recordType = 'imprest surrender' then begin
                    status := 'danger*The imprest surrender could not be sent for approval';

                    Payments.Reset;
                    Payments.SetRange("Account No.", employeeNo);
                    Payments.SetRange("No.", recordNo);
                    Payments.SetRange(Status, Payments.Status::"Pending Approval");
                    Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
                    Payments.SetRange("Document Type", Payments."document type"::Surrender);
                    if Payments.FindSet then begin
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

                        if Payments2.Get(recordNo) then begin
                            if not (Payments2.Status = Payments2.Status::"Pending Approval") then begin
                                status := 'success*The imprest Surrender approval was successfully cancelled';
                                if ImprestHeader.Get(Payments2."Imprest Issue Doc. No") then begin
                                    ImprestHeader.Selected := false;
                                    ImprestHeader.Modify;
                                end;
                            end;
                        end;
                    end else begin
                        status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or has not been sent for approval';
                    end;
                end else
                    if recordType = 'purchase requisition' then begin
                        status := 'danger*The Purchase Requisition approval could not be cancelled';
                        PurchaseHeader.Reset;
                        PurchaseHeader.SetRange("Request-By No.", employeeNo);
                        PurchaseHeader.SetRange("No.", recordNo);
                        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
                        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
                        if PurchaseHeader.FindSet then begin

                            //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);
                            WorkflowWebhookMgt.FindAndCancel(PurchaseHeader.RecordId);
                            //PurchaseHeader.Status:=PurchaseHeader.Status::Open;
                            //PurchaseHeader.MODIFY();

                            PurchaseHeader1.Reset;
                            PurchaseHeader1.SetRange("Request-By No.", employeeNo);
                            PurchaseHeader1.SetRange("No.", recordNo);
                            PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
                            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
                            if PurchaseHeader1.FindSet then begin
                                if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
                                    status := 'success*The Purchase Requisition approval was successfully cancelled';
                                end;
                            end;
                        end else begin
                            status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
                        end;
                    end else
                        if recordType = 'store requisition' then begin
                            status := 'danger*The Store Requisition approval could not be cancelled';
                            PurchaseHeader.Reset;
                            PurchaseHeader.SetRange("Request-By No.", employeeNo);
                            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
                            PurchaseHeader.SetRange("No.", recordNo);
                            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
                            if PurchaseHeader.FindSet then begin

                                //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);
                                ////ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);
                                WorkflowWebhookMgt.FindAndCancel(PurchaseHeader.RecordId);

                                PurchaseHeader1.Reset;
                                PurchaseHeader1.SetRange("Request-By No.", employeeNo);
                                PurchaseHeader1.SetRange("No.", recordNo);
                                PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
                                if PurchaseHeader1.FindSet then begin
                                    if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
                                        status := 'success*The Store Requisition approval was successfully cancelled';
                                    end;
                                end;
                            end else begin
                                status := 'danger*A Store Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
                            end;
                        end else
                            if recordType = 'transport requisition' then begin
                                status := 'danger*The fleet requisition approval could not be cancelled';
                                TransportRequisition.Reset;
                                TransportRequisition.SetRange("Employee No", employeeNo);
                                TransportRequisition.SetRange("Transport Requisition No", recordNo);
                                if TransportRequisition.FindSet then begin
                                    TransportRequisition.TestField(Status, TransportRequisition.Status::"Pending Approval");
                                    //ApprovalsMgmt.OnCancelFleetApprovalRequest(TransportRequisition);
                                    if TransportRequisition1.Get(recordNo) then begin
                                        if not (TransportRequisition1.Status = TransportRequisition1.Status::"Pending Approval") then begin
                                            status := 'success*The fleet requisition approval was successfully cancelled';
                                        end;
                                    end;
                                end else begin
                                    status := 'danger*A fleet requisition with the given number does not exist, has not been sent for approval or you are not the owner';
                                end;
                            end else
                                if recordType = 'staff claim' then begin
                                    status := 'danger*The Staff claim approval could not be cancelled';
                                    Payments.Reset;
                                    Payments.SetRange("Account No.", employeeNo);
                                    Payments.SetRange("No.", recordNo);
                                    Payments.SetRange(Status, Payments.Status::"Pending Approval");
                                    Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
                                    Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
                                    if Payments.FindSet then begin
                                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

                                        if Payments2.Get(recordNo) then begin
                                            if not (Payments2.Status = Payments2.Status::"Pending Approval") then begin
                                                status := 'success*The staff claim approval was successfully cancelled';
                                            end;
                                        end;
                                    end else begin
                                        status := 'danger*A Staff Claim with the given number does not exist, you are not the requestor or has not been sent for approval';
                                    end;
                                end else
                                    if recordType = 'salary advance' then begin
                                        status := 'danger*The Salary Advance approval could not be cancelled';
                                        Payments.Reset;
                                        Payments.SetRange("Account No.", employeeNo);
                                        Payments.SetRange("No.", recordNo);
                                        Payments.SetRange(Status, Payments.Status::"Pending Approval");
                                        Payments.SetRange("Payment Type", Payments."payment type"::"Salary Advance");
                                        Payments.SetRange("Document Type", Payments."document type"::"Salary Advance");
                                        if Payments.FindSet then begin
                                            //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

                                            if Payments2.Get(recordNo) then begin
                                                if not (Payments2.Status = Payments2.Status::"Pending Approval") then begin
                                                    status := 'success*The Salary Advance approval was successfully cancelled';
                                                end;
                                            end;
                                        end else begin
                                            status := 'danger*A salary advance application with the given number does not exist, you are not the requestor or has not been sent for approval';
                                        end;
                                    end else
                                        if recordType = 'car loan' then begin
                                            status := 'danger*The Car Loan approval could not be cancelled';
                                            Payments.Reset;
                                            Payments.SetRange("Account No.", employeeNo);
                                            Payments.SetRange("No.", recordNo);
                                            Payments.SetRange(Status, Payments.Status::"Pending Approval");
                                            Payments.SetRange("Payment Type", Payments."payment type"::"Car Loan");
                                            //Payments.SETRANGE("Document Type", Payments."Document Type"::ca);
                                            if Payments.FindSet then begin
                                                //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

                                                if Payments2.Get(recordNo) then begin
                                                    if not (Payments2.Status = Payments2.Status::"Pending Approval") then begin
                                                        status := 'success*The Car Loan approval was successfully cancelled';
                                                    end;
                                                end;
                                            end else begin
                                                status := 'danger*A Car Loan application with the given number does not exist, you are not the requestor or has not been sent for approval';
                                            end;
                                        end;
        exit(status);
    end;

    procedure changePassword(employeeNo: Code[50]; currentPassword: Text; newPassword: Text; confirmPassword: Text) status: Text
    var
        HRPortalUsers: Record HRPortalUsers;
    begin
        status := 'danger*Your password could not be changed. Please try again';
        HRPortalUsers.Reset;
        HRPortalUsers.SetRange(employeeNo, employeeNo);
        HRPortalUsers.SetRange(password, currentPassword);
        if HRPortalUsers.FindSet then begin
            if StrLen(newPassword) > 3 then begin
                if newPassword = confirmPassword then begin
                    HRPortalUsers.password := newPassword;
                    HRPortalUsers.changedPassword := true;
                    if HRPortalUsers.Modify(true) then begin
                        status := 'success*Your password was successfully updated';
                    end else begin
                        status := 'danger*Your password could not be changed. Please try again';
                    end;
                end else begin
                    status := 'danger*New Password and confirm new password do not match!!!';
                end;
            end else begin
                status := 'danger*The password you entered as your new password is too short. It should be atleast 4 characters';
            end;
        end else begin
            status := 'danger*The password you entered as your current password is wrong. Please try again';
        end;
        exit(status);
    end;

    procedure deleteRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; lineNo: Integer; documentType: Integer) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        status := 'danger*Your Requisition Line could not be deleted';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            PurchaseLine.Reset;
            PurchaseLine.SetRange("Document Type", documentType);
            PurchaseLine.SetRange("Document No.", requisitionNo);
            PurchaseLine.SetRange("Line No.", lineNo);
            if PurchaseLine.FindSet then begin
                if PurchaseLine.Delete(true) then begin
                    status := 'success*The Requisition Line was successfully deleted';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Requisition Line could not be deleted';
                end;
            end else begin
                status := 'danger*The Requisition Line does not exist' + Format(lineNo);
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    procedure sendStaffClaimApproval(employeeNo: Code[50]; staffClaim: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
    begin
        status := 'danger*The staff claim could not be sent for approval';

        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", staffClaim);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
        Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
        if Payments.FindSet then begin
            Payments.TestField("Account No.");
            Payments.TestField("Account Name");
            Payments.TestField("Shortcut Dimension 1 Code");
            Payments.TestField(Job);
            Payments.CalcFields("Total Amount LCY");
            Payments.TestField("Total Amount LCY");
            // Payments.TESTFIELD("Job Task No");
            //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
            //ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
            if Payments2.Get(staffClaim) then begin
                if Payments2.Status = Payments2.Status::"Pending Approval" then begin
                    status := 'success*The staff claim was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure createStaffClaim(employeeNo: Code[50]; claimNo: Code[50]; paymentNarration: Text; fundCode: Code[100]; job: Code[100]; jobTask: Code[100]) status: Text
    begin
        status := 'danger*Your staff claim could not be captured';
        if claimNo = '' then begin //new imprest surrender
            Payments.Init;
            Payments."Document Type" := Payments."document type"::"Staff Claims";
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::"Staff Claim";
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Account No." := employeeNo;
            Payments.Validate("Account No.");
            Payments."Payment Narration" := paymentNarration;
            Payments.Validate("Payment Narration");
            Payments."Shortcut Dimension 2 Code" := fundCode;
            Payments.Validate("Shortcut Dimension 2 Code");
            Payments.Job := job;
            Payments.Validate(Job);
            Payments."Job Task No" := jobTask;
            Payments.Validate("Job Task No");
            Payments."Job Task No." := jobTask;
            Payments.Validate("Job Task No.");
            if Payments.Insert(true) then begin
                status := 'success*Your staff claim was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your staff claim could not be captured';
            end;

        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", claimNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindSet then begin
                Payments."Payment Narration" := paymentNarration;
                Payments.Validate("Payment Narration");
                Payments."Shortcut Dimension 2 Code" := fundCode;
                Payments.Validate("Shortcut Dimension 2 Code");
                Payments.Job := job;
                Payments.Validate(Job);
                Payments."Job Task No" := jobTask;
                Payments.Validate("Job Task No");
                Payments."Job Task No." := jobTask;
                Payments.Validate("Job Task No.");

                if Payments.Modify(true) then begin
                    status := 'success*Your staff claim was successfully updated';
                end else begin
                    status := 'danger*Your staff claim could not be updated';
                end;

            end else begin
                status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;

    procedure deleteStaffClaimLine(employeeNo: Code[100]; claimNo: Code[100]; lineNo: Integer) status: Text
    var
        PVLines: Record "PV Lines";
    begin
        status := 'danger*The staff claim line could not be deleted';
        Payments.Reset;
        Payments.SetRange("No.", claimNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.FindSet then begin
            PVLines.Reset;
            PVLines.SetRange(No, claimNo);
            PVLines.SetRange("Line No", lineNo);
            if PVLines.FindSet then begin
                if PVLines.Delete(true) then begin
                    status := 'success*The staff claim line was successfully deleted';
                end else begin
                    status := 'danger*The staff claim line could not be deleted'
                end;
            end else begin
                status := 'danger*The staff claim line could not be deleted';
            end;
        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
        end;
    end;

    procedure createStaffClaimLine(employeeNo: Code[100]; claimNo: Code[100]; voteItem: Code[100]; description: Text; amount: Decimal) status: Text
    var
        PVLines: Record "PV Lines";
    begin
        status := 'danger*The staff claim line could not be deleted';
        Payments.Reset;
        Payments.SetRange("No.", claimNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.FindSet then begin
            PVLines.Init;
            PVLines.No := claimNo;
            PVLines.Validate(No);
            PVLines."Type of Expense" := voteItem;
            PVLines.Validate("Type of Expense");
            PVLines.Description := description;
            PVLines.Validate(Description);
            PVLines.Amount := amount;
            PVLines.Validate(Amount);
            if PVLines.Insert(true) then begin
                status := 'success*The staff claim line was successfully added';
            end else begin
                status := 'danger*The staff claim line could not be added'
            end;

        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
        end;
    end;

    procedure editStaffClaimLine(lineNo: Integer; employeeNo: Code[100]; claimNo: Code[100]; voteItem: Code[100]; description: Text; amount: Decimal) status: Text
    var
        PVLines: Record "PV Lines";
    begin
        status := 'danger*The staff claim line could not be deleted';
        Payments.Reset;
        Payments.SetRange("No.", claimNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.FindSet then begin
            PVLines.Reset;
            PVLines.SetRange("Line No", lineNo);
            PVLines.SetRange(No, claimNo);
            if PVLines.FindSet then begin
                PVLines.Validate(No);
                PVLines."Type of Expense" := voteItem;
                PVLines.Validate("Type of Expense");
                PVLines.Description := description;
                PVLines.Validate(Description);
                PVLines.Amount := amount;
                PVLines.Validate(Amount);
                if PVLines.Modify(true) then begin
                    status := 'success*The staff claim line was successfully updated';
                end else begin
                    status := 'danger*The staff claim line could not be updated'
                end;
            end else begin
                status := 'danger*The staff claim line does not exist';
            end;
        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
        end;
    end;

    procedure sendStoreRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        PurchaseHeader1: Record "Purchase Header";
    begin
        status := 'danger*The Store Requisition could not be sent for approval';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
        if PurchaseHeader.FindSet then begin
            PurchaseHeader.TestField("Shortcut Dimension 1 Code");
            PurchaseHeader.TestField("Shortcut Dimension 2 Code");
            PurchaseHeader.TestField(Description);
            //TESTFIELD("Requester ID",USERID);
            /*
            TESTFIELD(Description);
       TESTFIELD("Shortcut Dimension 1 Code");
       TESTFIELD("Shortcut Dimension 2 Code");
       //TESTFIELD("Shortcut Dimension 3 Code");
       //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
         //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);*/
            //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) then
            //ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);

            PurchaseHeader1.Reset;
            PurchaseHeader1.SetRange("Request-By No.", employeeNo);
            PurchaseHeader1.SetRange("No.", requisitionNo);
            PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
            if PurchaseHeader1.FindSet then begin
                if PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval" then begin
                    status := 'success*The Store Requisition was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*A Store Requisition with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);

    end;

    procedure createStoreRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; itemCategory: Code[250]; item: Code[250]; quantity: Decimal) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        status := 'danger*Your Requisition Line could not be added';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            if (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition") then begin
                //add line
                PurchaseLine.Init;
                //Document Type,Document No.,Line No.
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Store Requisition";
                end;
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Purchase Requisition";
                end;
                PurchaseLine."Document No." := requisitionNo;
                PurchaseLine.Validate("Document No.");
                PurchaseLine."Line No." := getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
                PurchaseLine.Validate("Line No.");
                PurchaseLine."Item Category" := itemCategory;
                PurchaseLine.Validate("Item Category");
                PurchaseLine."Service/Item Code" := item;
                PurchaseLine.Validate("Service/Item Code");
                PurchaseLine."Qty. Requested" := quantity;
                PurchaseLine.Validate("Qty. Requested");

                if PurchaseLine.Insert(true) then begin
                    PurchaseLine.Validate("Qty. Requested", quantity);

                    PurchaseLine.Modify(true);
                    status := 'success*The Requisition Line was successfully added';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Requisition Line could not be added';
                end;
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    procedure applyexternalHrJobs(jobId: Text[20]; surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; religion: Text[50]; idNumber: Text[50]; phoneNo: Text[30]; email: Text[50]; ethinc: Text[30]; postalAddress: Text[50]; postalAddressCode: Text[50]; city: Text[50]; "expected salary": Decimal; registrationDetails: Text[250]) status: Text
    begin
        JobApplicants.Reset;
        JobApplicants.SetRange("Job Applied For", jobId);
        JobApplicants.SetRange("ID Number", idNumber);

        if JobApplicants.FindSet then begin
            status := 'error';
            /*CASE gender OF
                  0:
                    gender:=gender::Male;
                  1:
                    gender:=gender::Female;
                  2:gender:=gender::Both;

                  ELSE
                    END;

              CASE disabled OF
                0:
                  disabled:=disabled::Yes;
                1:
                  disabled:=disabled::No;
                  ELSE
                  END;

           CASE maritalStatus OF
             0:
               maritalStatus:=maritalStatus::Married;

             1:
               maritalStatus:=maritalStatus::Single;
             2:
               maritalStatus:=maritalStatus::Divorced;

             3:
              maritalStatus:=maritalStatus::Separated;
             4:
                maritalStatus:=maritalStatus::"Widow(er)";
             5:
               maritalStatus:=maritalStatus::Other;

               ELSE
               END;
               JobApplicants."Application No":='';
                JobApplicants."Job Applied For":=jobId;
                JobApplicants."First Name":=firstname;
                JobApplicants."Middle Name":=lastname;
                JobApplicants."Last Name":=surname;
                JobApplicants.Initials:=title;
                JobApplicants."Date Applied":=TODAY();
                JobApplicants."Date Of Birth":=DOB;
                JobApplicants.Gender:=gender;
                JobApplicants.Disabled:=disabled;
                JobApplicants."Disability Details":= disabilityDetails;
                JobApplicants.County:=county;
                JobApplicants.Citizenship:=nationality;
                JobApplicants."Marital Status":=maritalStatus;
                JobApplicants.Religion:=religion;
                JobApplicants."ID Number":=idNumber;
                JobApplicants."Ethnic Origin":=ethinc;
                JobApplicants."E-Mail":=email;
                JobApplicants."Cell Phone Number":=phoneNo;
                JobApplicants."Postal Address":= postalAddress;
                JobApplicants."Post Code":= postalAddressCode;
                JobApplicants.City:=city;
                JobApplicants."Expected Salary":="expected salary";


               IF  JobApplicants.MODIFY(TRUE) THEN BEGIN

                    jpa.RESET;
                  jpa.SETRANGE("ID Number",idNumber);
                  jpa.SETRANGE("Job Applied For",jobId);
                  IF jpa.FINDSET THEN BEGIN
                    status:=jpa."Application No";
                    END
                   END
                   ELSE
                   BEGIN
                      status:='error*It seems you have not applied for this position. Please try another position';
                     END
               */
        end
        else begin

            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;
            JobApplicants.Init;
            JobApplicants."Application No" := '';
            JobApplicants."Job Applied For" := jobId;

            JobApplicants."First Name" := firstname;
            JobApplicants."Middle Name" := lastname;
            JobApplicants."Last Name" := surname;
            JobApplicants.Initials := title;
            JobApplicants."Date Applied" := Today();
            JobApplicants."Date Of Birth" := DOB;
            JobApplicants.Gender := gender;
            JobApplicants.Disabled := disabled;
            JobApplicants."Disability Details" := disabilityDetails;
            JobApplicants.County := county;
            JobApplicants.Citizenship := nationality;
            JobApplicants."Marital Status" := maritalStatus;
            JobApplicants.Religion := religion;
            JobApplicants."ID Number" := idNumber;
            JobApplicants."Ethnic Origin" := ethinc;
            JobApplicants."E-Mail" := email;
            JobApplicants."Cell Phone Number" := phoneNo;
            JobApplicants."Details of Disability regist" := registrationDetails;

            JobApplicants."Postal Address" := postalAddress;
            JobApplicants."Post Code" := postalAddressCode;
            JobApplicants.City := city;
            JobApplicants."Expected Salary" := "expected salary";

            if JobApplicants.Insert(true) then begin
                jpa.Reset;
                jpa.SetRange("ID Number", idNumber);
                jpa.SetRange("Job Applied For", jobId);
                if jpa.FindLast then begin
                    status := jpa."Application No";
                end

            end
            else begin
                status := 'error*an error occured during the process of insertion';
            end;

        end;



    end;

    procedure applyinternalHrJobs(docNo: Text[30]; jobId: Text[20]; surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; religion: Text[50]; idNumber: Text[50]; NhifNo: Text[30]; NssfNo: Text[30]; pinNo: Text[30]; phoneNo: Text[30]; altPhoneNo: Text[30]; email: Text[50]; altEmail: Text[50]; empNo: Text[20]; dpt: Text[100]; currentPosition: Text[150]; jobGroup: Text[50]; dateOfFirstAppointment: Date; lastPromotionDate: Date; ethinc: Text[30]) status: Text
    begin
        JobApplicants.Reset;
        JobApplicants.SetRange("Job Applied For", jobId);
        JobApplicants.SetRange("ID Number", idNumber);

        if JobApplicants.FindSet then begin
            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;
            JobApplicants."Application No" := docNo;
            JobApplicants."Job Applied For" := jobId;
            JobApplicants."Employee No" := empNo;
            JobApplicants."First Name" := firstname;
            JobApplicants."Middle Name" := lastname;
            JobApplicants."Last Name" := surname;
            JobApplicants.Initials := title;
            JobApplicants."Date Applied" := Today();
            JobApplicants."Date Of Birth" := DOB;
            JobApplicants.Gender := gender;
            JobApplicants.Disabled := disabled;
            JobApplicants."Disability Details" := disabilityDetails;
            JobApplicants.County := county;
            JobApplicants.Citizenship := nationality;
            JobApplicants."Marital Status" := maritalStatus;
            JobApplicants.Religion := religion;
            JobApplicants."ID Number" := idNumber;
            JobApplicants.NHIF := NhifNo;
            JobApplicants.NSSF := NssfNo;
            JobApplicants."Ethnic Origin" := ethinc;
            JobApplicants."Position held" := currentPosition;
            JobApplicants."Job Group" := jobGroup;
            JobApplicants."First Appointment Date" := dateOfFirstAppointment;
            JobApplicants."Last Appointment Date" := lastPromotionDate;
            JobApplicants."Department Code" := dpt;
            JobApplicants."PIN Number" := pinNo;
            JobApplicants."E-Mail" := email;
            JobApplicants."Alternative Email" := altEmail;
            JobApplicants."Cell Phone Number" := phoneNo;
            JobApplicants."Altenative Phone Number" := altPhoneNo;
            if JobApplicants.Modify(true) then begin

                status := 'success';
            end
            else begin
                status := 'danger*It seems you have not applied for this position. Please try another position';
            end

        end
        else begin

            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;
            //Single,Married,Separated,Divorced,Widow(er),Other

            JobApplicants.Init;
            JobApplicants."Application No" := docNo;
            JobApplicants."Job Applied For" := jobId;
            JobApplicants."Employee No" := empNo;

            JobApplicants."First Name" := firstname;
            JobApplicants."Middle Name" := lastname;
            JobApplicants."Last Name" := surname;
            JobApplicants.Initials := title;
            JobApplicants."Date Applied" := Today();
            JobApplicants."Date Of Birth" := DOB;
            JobApplicants.Gender := gender;
            JobApplicants.Disabled := disabled;
            JobApplicants."Disability Details" := disabilityDetails;
            JobApplicants.County := county;
            JobApplicants.Citizenship := nationality;
            JobApplicants."Marital Status" := maritalStatus;
            JobApplicants.Religion := religion;
            JobApplicants."ID Number" := idNumber;
            JobApplicants.NHIF := NhifNo;
            JobApplicants.NSSF := NssfNo;
            JobApplicants."Ethnic Origin" := ethinc;
            JobApplicants."Position held" := currentPosition;
            JobApplicants."Job Group" := jobGroup;
            JobApplicants."First Appointment Date" := dateOfFirstAppointment;
            JobApplicants."Last Appointment Date" := lastPromotionDate;
            JobApplicants."Department Code" := dpt;




            JobApplicants."PIN Number" := pinNo;
            JobApplicants."E-Mail" := email;
            JobApplicants."Alternative Email" := altEmail;
            JobApplicants."Cell Phone Number" := phoneNo;
            JobApplicants."Altenative Phone Number" := altPhoneNo;
            if JobApplicants.Insert(true) then begin
                jpa.Reset;
                jpa.SetRange("ID Number", idNumber);
                jpa.SetRange("Job Applied For", jobId);
                if jpa.FindLast then begin
                    status := jpa."Application No";
                end

            end
            else begin
                status := 'error*an error occured during the process of insertion';
            end;

        end;


    end;

    procedure updateEmploymentHistory(id: Integer; startDate: Date; endDate: Date; company: Text[150]; designation: Text[150]; JobGrade: Text[100]; appNo: Text[30]; empNo: Text[30]; JobId: Text[30]) status: Text
    begin
        if JobApplicants.Get(id) then begin
            /* ApplicantEmploymentHistory.INIT;
             //ApplicantEmploymentHistory."Entry No.":= appNo;
            // ApplicantEmploymentHistory."Document Type":=company;
             ApplicantEmploymentHistory."Employee No.":=startDate;
             ApplicantEmploymentHistory."Posting Date":=endDate;
             ApplicantEmploymentHistory."User ID":= designation;
             ApplicantEmploymentHistory."Job Grade":=JobGrade;
             ApplicantEmploymentHistory."Entry No.":=appNo;
             ApplicantEmploymentHistory."Employee No":=empNo;
             ApplicantEmploymentHistory."Job Id" := JobId;
             ApplicantEmploymentHistory.MODIFY(TRUE);*/

            status := 'success';

        end
        else
            status := 'error*You seem to have not applied for this position';
        begin
        end

    end;

    procedure addEmploymentHistory(idNumber: Text[30]; startDate: Date; endDate: Date; company: Text[150]; designation: Text[150]; JobGrade: Text[100]; appNo: Text[30]; empNo: Text[30]; JobId: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin
            /* ApplicantEmploymentHistory.INIT;
             ApplicantEmploymentHistory."Entry No.":= appNo;
             ApplicantEmploymentHistory."Document Type":=company;
             ApplicantEmploymentHistory."Employee No.":=startDate;
             ApplicantEmploymentHistory."Posting Date":=endDate;
             ApplicantEmploymentHistory."User ID":= designation;
             ApplicantEmploymentHistory."Job Grade":=JobGrade;
             ApplicantEmploymentHistory."Id Number":=idNumber;
             ApplicantEmploymentHistory."Entry No.":=appNo;
             ApplicantEmploymentHistory."Employee No":=empNo;
             ApplicantEmploymentHistory."Job Id" := JobId;
             ApplicantEmploymentHistory.INSERT(TRUE);

             status:='success';*/

        end
        else
            status := 'error*You seem to have not applied for this position';
        begin
        end

    end;

    procedure addAcademicQualifications(appNo: Code[20]; institution: Text[200]; awardAttainment: Text[150]; specialization: Text[150]; gradeAttained: Text[150]; empNo: Text[30]; jobId: Text[30]; FromDate: Date; ToDate: Date) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            applicantQualifications.Init;

            applicantQualifications."Employee No." := empNo;
            applicantQualifications."Job ID" := jobId;
            applicantQualifications."Institution/Company" := institution;
            applicantQualifications."From Date" := FromDate;
            applicantQualifications."To Date" := ToDate;
            applicantQualifications."Qualification Description" := awardAttainment;
            applicantQualifications.Specialization := specialization;
            applicantQualifications."Course Grade" := gradeAttained;
            applicantQualifications."Application No" := appNo;
            applicantQualifications.Insert(true);

            status := 'success';


        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addProffessionalQualifications(appNo: Code[20]; institution: Text[150]; awardAttainment: Text[100]; specialization: Text[100]; gradeAttained: Text[100]; empNo: Text[20]; jobId: Text[20]; FromDate: Date; ToDate: Date) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            professionalQualifications.Init;
            professionalQualifications."Employee No" := empNo;
            professionalQualifications."Job ID" := jobId;
            professionalQualifications.Institution := institution;
            professionalQualifications."From Date" := FromDate;
            professionalQualifications."To Date" := ToDate;
            professionalQualifications.Attainment := awardAttainment;
            professionalQualifications.Specialization := specialization;
            professionalQualifications."Application No" := appNo;
            professionalQualifications.Grade := gradeAttained;
            professionalQualifications.Insert(true);
            status := 'success';
        end
        else begin
            status := 'You seem to have applied for this position';

        end
    end;

    procedure addTrainingAttended(fromDate: Date; ToDate: Date; JobId: Text[30]; EmployeeNo: Text[30]; Institution: Text[150]; courseName: Text[150]; appNo: Text[30]; attained: Text[100]) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            attendedTraining.Init;
            attendedTraining."Employee No" := EmployeeNo;
            attendedTraining."Application No" := appNo;
            attendedTraining."From Date" := fromDate;
            attendedTraining."To Date" := ToDate;
            attendedTraining."Job ID" := JobId;
            attendedTraining.Institution := Institution;
            attendedTraining."Course Name" := courseName;
            attendedTraining.Attained := attained;
            attendedTraining.Insert(true);
            status := 'success';

        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addProfessionalBody(appNo: Text[30]; jobId: Text[30]; empNo: Text[30]; pBody: Text[100]; mNo: Text[100]; mType: Text[50]; rDate: Date) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            membershipbody.Init;
            membershipbody."Application No" := appNo;
            membershipbody."Employee No" := empNo;
            membershipbody."Job ID" := jobId;
            membershipbody.Institution := pBody;
            membershipbody."Membership Type" := mType;
            membershipbody."Membership No" := mNo;
            membershipbody."Renewal Date" := rDate;

            membershipbody.Insert(true);

            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addApplicantAccomplishment(appNo: Text[30]; empNo: Text[30]; description: Text[500]; number: Integer; jobId: Text[30]; amt: Text[50]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin
            applicantAccomplishment.Reset;
            applicantAccomplishment.SetRange("Job Application No", appNo);
            applicantAccomplishment.SetRange("Indicator Description", description);
            if applicantAccomplishment.FindSet then begin
                applicantAccomplishment.Number := number;
                applicantAccomplishment.Amount := amt;
                applicantAccomplishment.Modify(true);
                status := 'success*Accomplishment updated successfully';

            end
            else begin

                applicantAccomplishment.Init;
                applicantAccomplishment."Job Application No" := appNo;
                applicantAccomplishment."Employee No" := empNo;
                applicantAccomplishment."Job ID" := jobId;
                applicantAccomplishment.Number := number;
                applicantAccomplishment."Id Number" := JobApplicants."ID Number";
                applicantAccomplishment."Indicator Description" := description;
                applicantAccomplishment.Amount := amt;

                applicantAccomplishment.Insert(true);
                status := 'success';
            end
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addAbilityDetails(description: Text[300]; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants."Abilites,Skills" := description;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure createReferee(appNo: Text[30]; empNo: Text[30]; name: Text[100]; occupation: Text[50]; address: Text[50]; postCode: Text[50]; phone: Text[30]; email: Text[40]; knownPeriod: Text[50]; jobId: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin
            referee.Init;
            referee."Job Application No" := appNo;
            referee."Employee No" := empNo;
            referee.Names := name;
            referee.Occupation := occupation;
            referee.Address := address;
            referee."Post Code" := postCode;
            referee."Telephone No" := phone;
            referee."E-Mail" := email;
            referee."Period Known" := knownPeriod;
            referee."Job ID" := jobId;
            referee.Insert(true);
            status := 'success';

        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addCurrentDutiesSkills(abilities: Text[250]; currentDuties: Text[300]; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants."Current Duties" := currentDuties;
            JobApplicants."Abilites,Skills" := abilities;

            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addOtherPersonalDetails(appNo: Text[30]; convicted: Boolean; convictionDesc: Text[30]; dismissal: Boolean; dismissalDesc: Text[100]; highestLevel: Text[100]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants.Convicted := convicted;
            JobApplicants."Conviction Description" := convictionDesc;
            JobApplicants.Dismissal := dismissal;
            JobApplicants."Dismissal Description" := dismissalDesc;
            JobApplicants."Highest Education Level" := highestLevel;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';
        end
    end;

    procedure addDutiesDetails(description: Text[300]; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants."Current Duties" := description;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure deleteAcademicLine(id: Integer; appNo: Text[30]) status: Text
    begin
        applicantQualifications.Reset;
        applicantQualifications.SetRange(Code, id);
        applicantQualifications.SetRange("Application No", appNo);
        if (applicantQualifications.FindSet) then begin
            applicantQualifications.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProfessionalLine(id: Integer; appNo: Text[30]) status: Text
    begin
        professionalQualifications.Reset;
        professionalQualifications.SetRange(Code, id);
        professionalQualifications.SetRange("Application No", appNo);
        if (professionalQualifications.FindSet) then begin
            professionalQualifications.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteTrainingLine(id: Integer; appNo: Text[30]) status: Text
    begin
        attendedTraining.Reset;
        attendedTraining.SetRange(Code, id);
        attendedTraining.SetRange("Application No", appNo);
        if (attendedTraining.FindSet) then begin
            attendedTraining.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProffessionalBodyLine(id: Integer; appNo: Text[30]) status: Text
    begin
        membershipbody.Reset;
        membershipbody.SetRange(Code, id);
        membershipbody.SetRange("Application No", appNo);
        if (membershipbody.FindSet) then begin
            membershipbody.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteEmploymentHistoryLine(id: Integer; appNo: Text[30]) status: Text
    begin
        /*ApplicantEmploymentHistory.RESET;
        ApplicantEmploymentHistory.SETRANGE(Code,id);
        ApplicantEmploymentHistory.SETRANGE("Entry No.",appNo);
        IF(ApplicantEmploymentHistory.FINDSET) THEN BEGIN
          ApplicantEmploymentHistory.DELETE(TRUE);
          status:='success*Record Successfully deleted';
        
          END
          ELSE BEGIN
            status:='error*The record does not exist';
            END
            */

    end;

    procedure deleteRefereeLine(id: Integer; appNo: Text[30]) status: Text
    begin

        referee.Reset;
        referee.SetRange(Code, id);
        referee.SetRange("Job Application No", appNo);
        if (referee.FindSet) then begin
            referee.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure addDeclaration(declaration: Boolean; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants.Declaralation := declaration;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure createProfileForExternalApplicants(surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; email: Text[100]; religion: Text[50]; idNumber: Text[100]; phoneNo: Text[30]; ethinc: Text[30]; postalAddress: Text[50]; postalAddressCode: Text[50]; city: Text[50]; "expected salary": Decimal; registrationDetails: Text[250]; NhifNo: Text[30]; NssfNo: Text[30]; pinNo: Text[30]; altPhoneNo: Text[30]; altEmail: Text[50]; positionHeld: Text[50]; currentEmployer: Text[100]; GrossSalary: Decimal; effectiveDate: Date) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);

        if externalApplicants.FindSet then begin
            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;

            /*externalApplicants.FirstName:=firstname;
            //externalApplicants."Middle Name":=lastname;
            externalApplicants.LastName:=surname;
           // externalApplicants.Initials:=title;
            externalApplicants."Date Applied":=TODAY();
            externalApplicants."Date Of Birth":=DOB;
            externalApplicants.Gender:=gender;
            externalApplicants.Disabled:=disabled;
            externalApplicants."Disability Details":=disabilityDetails;
            externalApplicants.County:=county;
            externalApplicants.Citizenship:=nationality;
            externalApplicants."Marital Status":=maritalStatus;
            externalApplicants.Religion:=religion;
            externalApplicants."ID Number":=idNumber;
            externalApplicants."Ethnic Origin":=ethinc;
            externalApplicants."Cell Phone Number":=phoneNo;
            externalApplicants."Details of Disability regist":=registrationDetails;
            externalApplicants."Postal Address":= postalAddress;
            externalApplicants."Post Code":= postalAddressCode;
            externalApplicants.City:=city;
            externalApplicants."Expected Salary":="expected salary";
            externalApplicants.NHIF:= NhifNo;
            externalApplicants.NSSF :=NssfNo;
            externalApplicants."PIN Number":=pinNo;
            externalApplicants."Altenative Phone Number":=altPhoneNo;
            externalApplicants."Alternative Email":=altEmail;
            externalApplicants."Current Employer":=currentEmployer;
            externalApplicants."Gross Salary":=GrossSalary;
            externalApplicants."Position held":=positionHeld;
            externalApplicants."Effective Date":=effectiveDate;*/

            if externalApplicants.Modify(true) then begin
                status := 'success';
            end
            else begin
                status := 'error*It seems you have not applied for this position. Please try another position';
            end

        end



    end;

    procedure CreateAccountForExtenalApplicants(fname: Text[100]; lname: Text[100]; email: Text[100]; password: Text[100]; salt: Text[100]) status: Text
    begin
        externalApplicants.Init;
        externalApplicants.FirstName := fname;
        externalApplicants.LastName := lname;
        externalApplicants.Email := email;
        externalApplicants.Password := password;
        externalApplicants.Salt := salt;
        externalApplicants.Insert(true);
        status := 'success';
    end;

    procedure forgotPasswordtForExtenalApplicants(email: Text[100]; password: Text[100]; salt: Text[100]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            externalApplicants.Password := password;
            externalApplicants.Salt := salt;
            externalApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error';

        end
    end;

    procedure createIctRequest(empNo: Text; description: Text[2048]; category: Code[50]; asset: Code[50]; subcategory: Code[50]) status: Text
    var
        Body: Text[250];
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CInfo: Record "Company Information";
        Category1: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
        SetUp: Record "ICT Helpdesk Global Parameters";
        Email: Text[250];
        empName: Text[250];
        UserEmail: Text;
        ICTHelpdeskCategory: Record "ICT Helpdesk Category";
        UserSetup3: Record "User Setup";
        AssignEmail: Text;
    begin
        // Employee.RESET;
        // Employee.SETRANGE("No.",empNo);
        // IF Employee.FINDSET THEN BEGIN
        //
        //    helpdesk.INIT;
        //    helpdesk."Job No.":='';
        //    helpdesk."Description of the issue":=description;
        //    helpdesk."ICT Issue Category":=category;
        //    helpdesk."Request Date":=TODAY();
        //    helpdesk."Request Time":=TIME;
        //    helpdesk."Employee No":= empNo;
        //    helpdesk."Requesting Officer Name":= Employee."First Name"+' '+Employee."Last Name";
        //    helpdesk.Status := helpdesk.Status::Assigned;
        //
        //   IF helpdesk.INSERT(TRUE) THEN BEGIN
        //   MESSAGE(FORMAT( helpdesk));
        //    hdesk.SETRANGE("Employee No",empNo);
        //    IF hdesk.FINDLAST THEN BEGIN
        //      CInfo.GET;
        //
        //  Mapping.RESET;
        //  Mapping.SETRANGE("Help Desk Category",category);
        //  IF Mapping.FIND('-') THEN BEGIN
        //     UserSetup.RESET;
        //     UserSetup.SETRANGE("User ID",Mapping.UserName);
        //     IF UserSetup.FINDFIRST THEN BEGIN
        //         Email:=UserSetup."E-Mail";
        //        Email2:=Email;
        //        helpdesk."Assigned To":=Mapping.UserName;
        //        helpdesk."Assigned To EmpNo":=UserSetup."Employee No.";
        //        helpdesk.MODIFY;
        //    // END
        //
        //
        //
        //      Body:='<br>Kindly login to the ERP System and attend to the ICT Issue No. '+hdesk."Job No."+' from '+hdesk."Requesting Officer Name"+'.'+'</br>';
        //      Body:='<br>'+Body+' '+ 'Best Regards,'+'</br>';
        //      Body:= Body+' '+'ERP AUTOMATIC MAILS';
        //      //SMTP.Create(COMPANYNAME,Email2,Email,'ICT Heldesk Notification',Body,TRUE);
        //      MESSAGE(Email);
        //      //SMTP.Send();
        //      MESSAGE('ICT Issue notification sent successfully.');
        //       Employee.RESET;
        //  Employee.SETRANGE("No.",empNo);
        //  IF Employee.FIND('-')THEN
        //    Email:=Employee."E-Mail";
        //    empName:=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
        //     Email2:=CInfo."Administrator Email";
        //  Body:='<br>Your issue has been received by ICT department Issue No. '+hdesk."Job No."+' from '+empName+'.'+'</br>';
        //  Body:='<br>'+Body+' '+ 'Best Regards,'+'</br>';
        //  Body:= Body+' '+'ERP AUTOMATIC MAILS';
        //  //SMTP.Create(COMPANYNAME,Email2,Email,'ICT Heldesk Notification',Body,TRUE);
        //  MESSAGE(Email);
        //  //SMTP.Send();
        //  MESSAGE('ICT Issue notification sent successfully.');
        //
        //
        // status:='success*Your request sent successfully';
        // END
        //    END
        //
        //
        //      END
        //
        //
        //  END
        //
        //
        //   END
        //
        //    ELSE
        //    BEGIN
        //      status:= 'error*Employee does not exist';
        //      END
        UserSetup.Reset;
        UserSetup.SetRange("Portal User", true);
        if UserSetup.FindFirst then
            Employee.Reset;
        Employee.SetRange("No.", empNo);
        if Employee.FindSet then begin

            helpdesk.Init;
            helpdesk."Job No." := '';
            helpdesk."Employee No" := empNo;
            helpdesk.Email := Employee."Company E-Mail";
            helpdesk.Validate("Employee No");
            helpdesk."Requesting Officer" := UserSetup."User ID";
            helpdesk."Description of the issue" := description;
            helpdesk."ICT Issue Category" := category;
            helpdesk.Validate("ICT Issue Category");
            helpdesk."HelpDesk Category" := category;
            helpdesk.Validate("HelpDesk Category");
            helpdesk."ICT Inventory" := asset;
            helpdesk."Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
            helpdesk."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
            helpdesk.Validate("ICT Inventory");
            helpdesk."Request Date" := Today();
            helpdesk."Request Time" := Time;
            helpdesk."Helpdesk subcategory" := subcategory;
            ICTHelpdeskCategory.Reset;
            ICTHelpdeskCategory.SetRange(Code, category);
            if ICTHelpdeskCategory.FindSet then
                helpdesk."Assigned To" := ICTHelpdeskCategory."Category Head";
            helpdesk.Validate("Assigned To");
            helpdesk."Assigned Date" := Today;
            helpdesk."Assigned Time" := Time;
            helpdesk.Phone := Employee."Phone No.";
            helpdesk."Department Name" := Employee.Department;
            //helpdesk."Global Dimension 1 Code":=region;
            //helpdesk.VALIDATE("Global Dimension 1 Code");
            helpdesk.Status := helpdesk.Status::Open;

            if helpdesk.Insert(true) then begin
                helpdesk.Validate("Employee No");
                helpdesk.Validate("Global Dimension 1 Code");
                // MESSAGE(FORMAT( helpdesk));
                hdesk.SetRange("Employee No", empNo);
                if hdesk.FindLast then begin
                    CInfo.Get;

                    UserSetup3.Reset;
                    UserSetup3.SetRange("User ID", helpdesk."Assigned To");
                    if UserSetup3.FindSet then
                        AssignEmail := UserSetup3."E-Mail";
                    SetUp.Get();
                    Email2 := CInfo."Administrator Email";
                    Email := SetUp."ICT Email";
                    Body := '<br>Kindly login to the ERP System and attend to the ICT Issue No. ' + hdesk."Job No." + ' :- ' + helpdesk."Description of the issue" + ' from ' + Employee."First Name" + ' ' + Employee."Last Name" + '.' + '</br><BR/>';
                    Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br><BR/>';
                    Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                    //SMTP.Create(COMPANYNAME, Email2, Email, 'ICT Heldesk Notification', Body, true);
                    // MESSAGE(Email);
                    //SMTP.AddBCC(Email);
                    //SMTP.Send();
                    Message('ICT Issue notification sent successfully.');
                    Employee.Reset;
                    Employee.SetRange("No.", empNo);
                    if Employee.Find('-') then begin
                        UserEmail := Employee."E-Mail";
                        empName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";

                        Email2 := CInfo."Administrator Email";
                        Body := '<br>Your issue has been received by ICT department Issue No. ' + hdesk."Job No." + ' from ' + empName + '.' + '</br>';
                        Body := '<br>' + Body + ' ' + 'You will be contacted by ICT team' + '</br>';
                        Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                        Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                        //SMTP.Create(COMPANYNAME, Email2, UserEmail, 'ICT Heldesk Notification', Body, true);
                        //MESSAGE(UserEmail);
                        //SMTP.AddBCC(Email);
                        //SMTP.Send();
                        Message('ICT Issue notification sent successfully.');

                        status := 'success*Your request sent successfully*' + helpdesk."Job No.";
                    end


                end


            end


        end

        else begin
            status := 'error*Employee does not exist';
        end
    end;

    procedure ProvideIctfeedback(appNo: Text; description: Text[250]) status: Text
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", appNo);
        if helpdesk.FindSet then begin
            helpdesk."Requester Feedback" := description;
            helpdesk.Status := helpdesk.Status::Closed;
            if helpdesk.Modify(true) then begin
                status := 'success*Request successfully updated';
            end


        end

        else begin
            status := 'error*Job No does not exist';
        end
    end;

    procedure updateIctRequest(appNo: Text; description: Text[2048]) status: Text
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", appNo);
        if helpdesk.FindSet then begin
            helpdesk."Description of the issue" := description;
            helpdesk."Request Date" := Today();
            helpdesk."Request Time" := Time;
            if helpdesk.Modify(true) then begin
                status := 'success*Request successfully updated';
            end


        end

        else begin
            status := 'error*Job No does not exist';
        end
    end;

    procedure applyexternalJob(jobId: Text[20]; surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; religion: Text[50]; idNumber: Text[50]; phoneNo: Text[30]; email: Text[50]; ethinc: Text[30]; postalAddress: Text[50]; postalAddressCode: Text[50]; city: Text[50]; "expected salary": Decimal; registrationDetails: Text[250]) status: Text
    begin
        JobApplicants.Reset;
        JobApplicants.SetRange("Job Applied For", jobId);
        JobApplicants.SetRange("ID Number", idNumber);
        JobApplicants.SetRange("Application Status", JobApplicants."application status"::Submitted);

        if JobApplicants.FindSet then begin
            status := 'error*You seem to have applied for this position.Please try again';

        end
        else begin
            externalApplicants.Reset;
            externalApplicants.SetRange(Email, email);
            if externalApplicants.FindSet then begin
            end else begin

                JobApplicants.Init;
                JobApplicants."Application No" := '';
                JobApplicants."Job Applied For" := jobId;

                JobApplicants."First Name" := externalApplicants.FirstName;
                JobApplicants."Middle Name" := lastname;
                JobApplicants."Last Name" := surname;
                JobApplicants.Initials := title;
                JobApplicants."Date Applied" := Today();
                JobApplicants."Date Of Birth" := DOB;
                JobApplicants.Gender := gender;
                JobApplicants.Disabled := disabled;
                JobApplicants."Disability Details" := disabilityDetails;
                JobApplicants.County := county;
                JobApplicants.Citizenship := nationality;
                JobApplicants."Marital Status" := maritalStatus;
                JobApplicants.Religion := religion;
                JobApplicants."ID Number" := idNumber;
                JobApplicants."Ethnic Origin" := ethinc;
                JobApplicants."E-Mail" := email;
                JobApplicants."Cell Phone Number" := phoneNo;
                JobApplicants."Details of Disability regist" := registrationDetails;

                JobApplicants."Postal Address" := postalAddress;
                JobApplicants."Post Code" := postalAddressCode;
                JobApplicants.City := city;
                JobApplicants."Expected Salary" := "expected salary";

                if JobApplicants.Insert(true) then begin
                    jpa.Reset;
                    jpa.SetRange("ID Number", idNumber);
                    jpa.SetRange("Job Applied For", jobId);
                    if jpa.FindLast then begin
                        status := jpa."Application No";
                    end

                end
                else begin
                    status := 'error*an error occured during the process of insertion';
                end;



            end




        end;


    end;

    procedure getItemsByLocation(location: Text[100]; category: Text[100]) status: Text
    var
        Loc: Text[100];
    begin
        status := '';
        item.Reset;
        item.SetFilter("Item Category Code", category);
        item.SetFilter("Location Filter", location);
        if item.FindSet then begin
            repeat
                item.CalcFields("Location Code", Inventory);
                status += item."No." + '*';
            until item.Next = 0;
        end



    end;

    procedure getItemDescByLocation(location: Text[100]; category: Text[100]) status: Text
    var
        Loc: Text[100];
    begin
        status := '';
        item.Reset;
        item.SetFilter("Item Category Code", category);
        item.SetFilter("Location Filter", location);
        item.SetFilter(Inventory, '>%1', 0);
        item.SetRange(Blocked, false);

        if item.FindSet then begin
            repeat
                item.CalcFields("Location Code", Inventory);
                status += item."No." + '_' + item.Description + '*';
            //status +=item."No."+'-';
            until item.Next = 0;
        end



    end;

    procedure AssignHelpdeskRequest(jobNo: Text[100]; assignee: Text[100]) status: Text
    var
        ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            UserSetup.Reset;
            UserSetup.SetRange("User ID", assignee);
            if UserSetup.FindSet then begin
                helpdesk."Assigned To" := assignee;
                helpdesk.Validate("Assigned To");
                helpdesk."Assigned Date" := Today();
                helpdesk."Assigned Time" := Time;
                helpdesk.Status := helpdesk.Status::Assigned;
                helpdesk."Assigned To EmpNo" := UserSetup."Employee No.";


                if helpdesk.Modify(true) then begin
                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if Employee.Get(helpdesk."Employee No") then
                        Recipient := Employee."E-Mail";
                    Subject := 'ISSUE ASSIGNED' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been assigned to ' + '  ' + assignee;
                    ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(helpdesk."Assigned To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ASSIGNED' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been assigned to you';
                    ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);



                    status := 'success*Request assigned successfully';
                end


            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end
    end;

    procedure EscalatedHelpdeskRequest(jobNo: Text[100]; assignee: Text[100]; description: Text[300]) status: Text
    var
        ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            UserSetup.Reset;
            UserSetup.SetRange("User ID", assignee);

            if UserSetup.FindSet then begin
                helpdesk."Escalated To" := assignee;
                helpdesk."Escalated Date" := Today();
                helpdesk."Escalated Time" := Time;
                helpdesk.Status := helpdesk.Status::Escalated;
                helpdesk."Escalated By" := helpdesk."Assigned To";
                helpdesk."Ascalation Details" := description;
                helpdesk."Escalated To EmpNo" := UserSetup."Employee No.";
                if helpdesk.Modify(true) then begin
                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if Employee.Get(helpdesk."Employee No") then
                        Recipient := Employee."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been escalatd to ' + '  ' + helpdesk."Escalated To";
                    ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    //Notify the Escalted To that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(helpdesk."Escalated To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been escalatd to you by' + ' ' + helpdesk."Assigned To";
                    ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                    status := 'success*Request assigned successfully';


                end




            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end
    end;

    procedure ResolveHelpdeskRequest(jobNo: Text[100]; description: Text[300]) status: Text
    var
        ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            helpdesk."Action Taken" := description;
            helpdesk."Attended By" := helpdesk."Assigned To";
            helpdesk."Attended Date" := Today;
            helpdesk.Status := helpdesk.Status::Resolved;
            if helpdesk.Modify(true) then begin
                ObjComInfo.Get;
                SenderEmailAddress := ObjComInfo."Administrator Email";
                SenderName := COMPANYNAME;
                if Employee.Get(helpdesk."Employee No") then
                    Recipient := Employee."E-Mail";
                Subject := 'ISSUE CLOSURE' + ' ' + jobNo;
                Body := 'Please note that the issue on the subject above has been resolved by' + '  ' + helpdesk."Attended By"
                 + ' ' + 'Kindly login to the system and confirm.Request will be closed after 24 hours.';
                ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                status := 'success*Request has been resolved successfully ';
            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end
    end;

    procedure ReopenHelpdeskRequest(jobNo: Text[50]; description: Text[250]) status: Text
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            helpdesk.Status := helpdesk.Status::Open;
            helpdesk.Reopened := true;
            //helpdesk."Reopened By":=helpdesk.;
            helpdesk."Assigned To" := '';
            helpdesk."Attended By" := '';
            helpdesk."Assigned Date" := 0D;
            helpdesk."Assigned Time" := 0T;
            helpdesk."Attended by Name" := '';
            helpdesk."Attended Date" := 0D;
            helpdesk."Attended Time" := 0T;
            helpdesk.Modify;

            status := 'success*Request successfully reopened';
        end
        else begin
            status := 'error*job no does not exist';
        end
    end;

    procedure addEmploymentHistoryForExternalApplcants(startDate: Date; endDate: Date; company: Text[150]; designation: Text[150]; JobGrade: Text[100]; email: Text[50]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            /* applicantBackground.INIT;
             applicantBackground.Institution:=company;
             applicantBackground."From Date":=startDate;
             applicantBackground."To Date":=endDate;
             //applicantBackground."Job Title":= designation;
             applicantBackground.Grade:=JobGrade;
             applicantBackground.Email:=email;
             applicantBackground.Type:=applicantBackground.Type::Employment;*/

            applicantBackground.Insert(true);

            status := 'success';

        end
        else
            status := 'error*You seem to have not applied for this position';
        begin
        end

    end;

    procedure addAcademicQualificationsForExternalApplcants(email: Text; institution: Text[200]; awardAttainment: Text[150]; specialization: Text[150]; gradeAttained: Text[150]; FromDate: Date; ToDate: Date) status: Text
    begin

        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            /* applicantBackground.INIT;
             applicantBackground.Institution:=institution;
             applicantBackground."From Date":=FromDate;
             applicantBackground."To Date":=ToDate;
             applicantBackground.Attainment:=awardAttainment;
             applicantBackground.Specialization:=specialization;
             applicantBackground.Grade:=gradeAttained;
             applicantBackground.Email:=email;
             applicantBackground.Type:= applicantBackground.Type::Education;*/
            applicantBackground.Insert(true);

            status := 'success';


        end
        else begin
            status := 'error*That email does not exist';

        end

    end;

    procedure addProffessionalQualificationsForExternalApplcants(email: Text[100]; institution: Text[150]; awardAttainment: Text[100]; specialization: Text[100]; gradeAttained: Text[100]; FromDate: Date; ToDate: Date) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            /* applicantBackground.INIT;
             applicantBackground.Institution:=institution;
             applicantBackground."From Date":=FromDate;
             applicantBackground."To Date":=ToDate;
             applicantBackground.Attainment:=awardAttainment;
             applicantBackground.Specialization:=specialization;
             applicantBackground.Grade:= gradeAttained;
             applicantBackground.Email:=email;
             applicantBackground.Type:= applicantBackground.Type::"Professional Qualification";
             applicantBackground.INSERT(TRUE);*/

            status := 'success';
        end
        else begin
            status := 'You seem to have applied for this position';

        end

    end;

    procedure addTrainingAttendedForExternalApplcants(fromDate: Date; ToDate: Date; Institution: Text[150]; courseName: Text[150]; email: Text[50]; attained: Text[100]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            /*applicantBackground.INIT;
            applicantBackground."From Date":=fromDate;
            applicantBackground."To Date":=ToDate;
            applicantBackground.Institution:=Institution;
            applicantBackground."Course Name":=courseName;
            applicantBackground.Attainment:=attained;
            applicantBackground.Email:= email;
            applicantBackground.Type:= applicantBackground.Type::Training;
            applicantBackground.INSERT(TRUE);*/
            status := 'success';


        end
        else begin
            status := 'error*That application does not exist';

        end

    end;

    procedure addProfessionalBodyForExternalApplcants(email: Text[50]; pBody: Text[100]; mNo: Text[100]; mType: Text[50]; rDate: Date) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            /* applicantBackground.INIT;
               applicantBackground."Application No":= '';
               applicantBackground."From Date":=0D;
             applicantBackground.Institution:=pBody;
             applicantBackground."Membership Type":=mType;
             applicantBackground."Membership No":=mNo;
             applicantBackground."Date of renewal":=rDate;
             applicantBackground.Email:=email;
             applicantBackground.Type:=applicantBackground.Type::"Professional Body";
             applicantBackground.INSERT(TRUE);*/

            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end

    end;

    procedure createRefereeForExternalApplcants(email: Text[50]; name: Text[100]; occupation: Text[50]; address: Text[50]; postCode: Text[50]; phone: Text[30]; applicantEmail: Text[100]; knownPeriod: Text[50]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, applicantEmail);
        if externalApplicants.FindSet then begin
            /* applicantReferee.INIT;
             applicantReferee.Names:=name;
             applicantReferee.Occupation:=occupation;
             applicantReferee.Address:=address;
             applicantReferee."Post Code":=postCode;
             applicantReferee."Telephone No":=phone;
             applicantReferee.RefereeEmail:=email;
             applicantReferee."Period Known":=knownPeriod;
             applicantReferee."E-Mail":=applicantEmail;*/
            applicantReferee.Insert(true);
            status := 'success';

        end
        else begin
            status := 'error*That application does not exist';

        end

    end;

    procedure deleteAcademicLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        //applicantBackground.SETRANGE(Email,email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProfessionalLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        //applicantBackground.SETRANGE(Email,email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteTrainingLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        //applicantBackground.SETRANGE(Email,email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProffessionalBodyLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        //applicantBackground.SETRANGE(Email,email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteEmploymentHistoryLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        //applicantBackground.SETRANGE(Email,email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteRefereeLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin

        applicantReferee.Reset;
        applicantReferee.SetRange(Code, id);
        applicantReferee.SetRange("E-Mail", email);
        if (applicantReferee.FindSet) then begin
            applicantReferee.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure applyOnline(email: Text[100]; jobId: Text[30]) status: Text
    begin
        jobApplication.Reset;
        jobApplication.SetRange(jobApplication.Email, email);
        jobApplication.SetRange(jobApplication."Job Id", jobId);
        //jobApplication.SETRANGE(jobApplication."Application Status",jobApplication."Application Status"::"0");
        if jobApplication.FindSet then begin
            status := 'error*You seem to have applied for this position.Please try another position.';
        end
        else begin
            externalApplicants.Reset;
            externalApplicants.SetRange(Email, email);
            if externalApplicants.FindSet then begin
                /* jobApplication.INIT;
                 jobApplication."Application No":='';
                 jobApplication."First Name" := externalApplicants.FirstName;
                 jobApplication."Middle Name":= externalApplicants."Middle Name";
                 jobApplication.Surname:= externalApplicants.LastName;
                 jobApplication.Gender:= externalApplicants.Gender;
                 jobApplication."Marital Status":=externalApplicants."Marital Status";
                 jobApplication."Date of Birth":= externalApplicants."Date Of Birth";
                 jobApplication."Job Id":= jobId;
                 jobApplication."Ethnic Origin":=externalApplicants."Ethnic Origin";
                 jobApplication."ID/Passport":=externalApplicants."ID Number";
                 jobApplication."Home Phone No.":= externalApplicants."Cell Phone Number";
                 jobApplication."Postal Address":= externalApplicants."Postal Address";
                 jobApplication."Postal Code.":= externalApplicants."Post Code";
                 jobApplication.County:= externalApplicants.County;
                 jobApplication."Application Date":=TODAY;
                 jobApplication.Email:= email;*/

                if jobApplication.Insert(true) then begin
                    jobApp.Reset;
                    jobApp.SetRange(Email, email);
                    jobApp.SetRange("Job Id", jobId);
                    //jobApp.SETRANGE("Application Status",jobApp."Application Status"::"0");
                    if jobApp.FindLast then begin
                        status := jobApp."Application No";

                    end




                end
                else begin
                    status := 'error*An unknown errror occured';
                end
                //jobApplication.Salutation:= externalApplicants.Initials;

            end



        end

    end;

    procedure addFavouriteJobs(email: Text[100]; jobId: Text[30]; jobDesc: Text[100]) Status: Text
    begin
        /*favouriteJob.RESET;
        favouriteJob.SETRANGE(Email,email);
        favouriteJob.SETRANGE("Job Id",jobId);
        IF favouriteJob.FINDSET THEN BEGIN
          Status:= 'error*This job seem to be in your favourite list.Please try another job.';
          END
          ELSE
          BEGIN
            favouriteJob.INIT;
            favouriteJob.Email:=email;
            favouriteJob."Job Description":= jobDesc;
            favouriteJob."Job Id":=jobId;
            favouriteJob.INSERT(TRUE);
            Status:='success*Job successfully saved.';
        
            END
            */

    end;

    procedure deleteFavouriteJobs(id: Integer; JobId: Text[100]) status: Text
    begin
        /*favouriteJob.RESET;
        favouriteJob.SETRANGE(Id,id);
        favouriteJob.SETRANGE("Job Id",JobId);
        IF favouriteJob.FINDSET THEN
          BEGIN
            favouriteJob.DELETE(TRUE);
            status:='success*Job successfully deleted.';
            END
            ELSE
            BEGIN
              status:='error';
              END
              */

    end;

    procedure addImprestSharepointLinks(imprestno: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        imprest: Record "Imprest Memo";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            ImprestMemo.Reset;
            ImprestMemo."No." := imprestno;
            if ImprestMemo.Find('=') then
                RecordIDNumber := ImprestMemo.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure addStoreRequsitionSharepointLinks(storerequsitionnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        PurchaseHeader: Record "Purchase Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            PurchaseHeader.Reset;
            //PurchaseHeader."No.":=storerequsitionnumber;
            PurchaseHeader.SetRange("No.", storerequsitionnumber);
            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
            if PurchaseHeader.FindSet then
                RecordLink."Record ID" := PurchaseHeader.RecordId;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure addStaffClaimSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record Payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            staffclaim.Reset;
            staffclaim."No." := staffclaimnumber;
            if staffclaim.Find('=') then
                RecordIDNumber := staffclaim.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure addLeaveSharepointLinks(leaveno: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        leaveapplication: Record "HR Leave Application";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            leaveapplication.Reset;
            leaveapplication."Application Code" := leaveno;
            if leaveapplication.Find('=') then
                RecordIDNumber := leaveapplication.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure addImprestSurrenderSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record Payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            Payments.Reset;
            Payments."No." := staffclaimnumber;
            if Payments.Find('=') then
                RecordIDNumber := Payments.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure addPurchaseRequisitionSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record Payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            PurchaseHeader.Reset;
            //PurchaseHeader."No.":=staffclaimnumber;
            PurchaseHeader.SetRange("No.", staffclaimnumber);
            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            if PurchaseHeader.FindSet then
                RecordIDNumber := PurchaseHeader.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure addFleetRequisitionSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record Payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
        TransportRequisition: Record "Transport Requisition";
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            TransportRequisition.Reset;
            TransportRequisition."Transport Requisition No" := staffclaimnumber;
            if TransportRequisition.Find('=') then
                RecordIDNumber := TransportRequisition.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure SendSpecialImprestApproval(employeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        pvline: Record "PV Lines";
    begin
        status := 'danger*The Special imprest could not be sent for approval';

        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", imprestNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash");
        Payments.SetRange("Document Type", Payments."document type"::"Petty Cash");
        if Payments.FindSet then begin
            Payments.TestField("Account No.");
            Payments.TestField("Account Name");
            Payments.TestField("Shortcut Dimension 1 Code");
            Payments.TestField(Job);
            Payments.CalcFields("Total Amount LCY");
            Payments.TestField("Total Amount LCY");
            // Payments.TESTFIELD("Job Task No");
            //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
            //ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
            if Payments2.Get(imprestNo) then begin
                if Payments2.Status = Payments2.Status::"Pending Approval" then begin
                    status := 'success*The Special imprest was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*A Special imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure CancelPettyCashRequestApproval(employeeNo: Code[50]; imprestNo: Code[10]) status: Text
    var
        Payments2: Record Payments;
    begin

        Payments.Reset;
        Payments.SetRange("No.", imprestNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::"Pending Approval");
        if Payments.FindSet then begin

            //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);
            if Payments1.Get(Payments."No.") then begin
                if Payments1.Status = Payments.Status then begin
                    status := 'warning*Your Special Imprest requisition  approval could not be cancelled';
                end else begin
                    status := 'success*Your Special Imprest requisition  approval was successfully cancelled';
                end;
            end;
        end else begin
            status := 'danger*The Special Imprest requisition does not exist or you are not the requester or status is not pending';



        end;
        exit(status);
    end;

    procedure PopulatePettyCashSurrender(employeeNo: Code[10]; SurrenderNo: Code[10]; imprestNo: Code[10]; region: Code[10]) status: Text
    begin
        if SurrenderNo = '' then begin //new petty surrender
            Payments.Init;
            Payments."Document Type" := Payments."document type"::"Petty Cash";
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::"Petty Cash Surrender";
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Account No." := employeeNo;
            Payments."Responsibility Center" := region;
            Payments.Validate("Responsibility Center");
            //Added By Fred
            Employee.Reset;
            Employee.SetRange("No.", employeeNo);
            if Employee.FindSet then
                ImprestMemo."Responsibility Center" := Employee."Global Dimension 1 Code";
            //Added By Fred
            Payments.Validate("Account No.");
            Payments."Imprest Issue Doc. No" := imprestNo;
            Payments.Validate("Imprest Issue Doc. No");
            if Payments.Insert(true) then begin
                Payments.Validate("Imprest Issue Doc. No");
                Payments.Modify(true);
                status := 'success*Your Special Imprest surrender was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your Special Imprest  surrender could not be captured';
            end;

        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", SurrenderNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindSet then begin
                if not (Payments."Imprest Issue Doc. No" = imprestNo) then begin
                    Payments."Imprest Issue Doc. No" := imprestNo;
                    Payments.Validate("Imprest Issue Doc. No");
                    if Payments.Modify(true) then begin
                        status := 'success*Your Special Imprest surrender was successfully updated' + Payments."No.";
                    end else begin
                        status := 'danger*Your Special Imprest could not be updated';
                    end;
                end else begin
                    status := 'success*No changes to be done';
                end;
            end else begin
                status := 'danger*A Special Imprest with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;

    procedure UpdatePettyCashSurrenderLine(employeeNo: Code[10]; pettyCashNo: Code[10]; lineNo: Integer; amountSpent: Decimal; receipt: Text) status: Text
    var
        ImprestLines: Record "Imprest Lines";
        pvLines: Record "CRM Vacancies";
    begin
        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", pettyCashNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
        if Payments.FindSet then begin
            pvLines.Reset;
            pvLines.SetRange("Vacancy No", pettyCashNo);
            pvLines.SetRange("No of Openings", lineNo);
            if pvLines.FindSet then begin

                // pvLines.VALIDATE(Published,amountSpent);
                //pvLines.VALIDATE(Amount, receipt);
                if pvLines.Modify(true) then begin
                    status := 'success*The special imprest line was successfully updated';
                end else begin
                    status := 'danger*The special imprest line could not be updated';
                end;
            end else begin
                status := 'danger*The special imprest line does not exist' + Format(lineNo);
            end;
        end else begin
            status := 'danger*A special imprest surrender with the given number does not exist, you are not the requestor or is no longer released';
        end;
        exit(status);
    end;

    procedure SendPettyCashSurrenderApproval(employee: Code[50]; surrenderNo: Code[50]) status: Text
    begin
        Payments.Reset;
        Payments.SetRange("Account No.", employee);
        Payments.SetRange("No.", surrenderNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
        if Payments.FindSet then begin
            //Payments.TESTFIELD(Job);
            //Payments.TESTFIELD("Job Task No");
            //Payments.TESTFIELD("Actual Amount Spent");
            //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
            //ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
            if Payments1.Get(Payments."No.") then begin
                Payments1.Selected := true;
                Payments1.Modify;
            end;
            if Payments2.Get(surrenderNo) then begin
                if Payments2.Status = Payments2.Status::"Pending Approval" then begin
                    status := 'success*The special imprest Surrender was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*A special imprest surrender with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure CancelPettyCashSurrenderApproval(employeeNo: Code[10]; SurrenderNo: Code[10]) status: Text
    begin
        Payments.Reset;
        Payments.SetRange("No.", SurrenderNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::"Pending Approval");
        Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
        if Payments.FindSet then begin
            //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);
            Payments1.Reset;
            Payments1.SetRange("No.", SurrenderNo);
            if Payments1.FindSet then begin

                if Payments1.Status = Payments.Status then begin
                    Message(Format(Payments1.Status));
                    status := 'warning*Your special imprest surrender  approval could not be cancelled';
                end else begin
                    status := 'success*Your special imprest surrender approval was successfully cancelled';
                end;
            end;
        end else begin
            status := 'danger*The special imprest surrender does not exist or you are not the requester or status is not pending';



        end;
        exit(status);
    end;

    procedure addPettyCashSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record Payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            Payments.Reset;
            Payments."No." := staffclaimnumber;
            if Payments.Find('=') then
                RecordIDNumber := Payments.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure fngetImprestLineNo(surrenderNo: Code[100]) LineNo: Text
    var
        ImprestLines: Record "Imprest Lines";
        MemoWriterDecimal: Integer;
        ImprestSurrender: Record Payments;
    begin
        ImprestSurrender.Reset;
        ImprestSurrender.SetRange("No.", surrenderNo);
        if ImprestSurrender.FindSet then begin
            ImprestLines.Reset;
            ImprestLines.SetRange(No, ImprestSurrender."No.");
            if ImprestLines.FindSet then begin
                repeat
                    MemoWriterDecimal := ImprestLines."Line No";
                    LineNo := LineNo + Format(MemoWriterDecimal) + '*' + Format(ImprestLines.Amount) + '*' + Format(ImprestLines."Actual Spent") + ':';
                until ImprestLines.Next = 0;
            end else begin
            end;
        end;
        exit(LineNo);
    end;

    procedure StudentTimetable("code": Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", code);
        StudentProcessingHeader.SetFilter(StudentProcessingHeader."No.", '%1', code);
        if StudentProcessingHeader.FindSet then begin
            appNo := ConvertStr(code, '-', '_');
            appNo := ConvertStr(code, ':', '_');



            if FILE.Exists(FILESPATH8 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH8 + appNo + '.pdf');


                //Report.SaveAsPdf(85026, FILESPATH8 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\studentTimetable\' + appNo + '.pdf';

            end else begin

                //Report.SaveAsPdf(85026, FILESPATH8 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\studentTimetable\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The Timetable could not be generated';
        end;
    end;

    procedure PrintReceipt(receiptNoFilter: Code[10]) status: Text
    var
        ReceiptHeader: Record "Receipts Header1";
        repSalesInvoice: Report Receipt;
        printed: Boolean;
    begin

        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", receiptNoFilter);
        // StudentProcessingHeader.SETFILTER(StudentProcessingHeader."No.",'%1',StudentProcessingHeader);
        if StudentProcessingHeader.FindSet then begin
            appNo := ConvertStr(receiptNoFilter, '-', '_');
            appNo := ConvertStr(receiptNoFilter, ':', '_');



            if FILE.Exists(FILESPATH4 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH4 + appNo + '.pdf');


                //Report.SaveAsPdf(85049, FILESPATH4 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';

            end else begin

                //Report.SaveAsPdf(85049, FILESPATH4 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The receipt Report could not be generated';
        end;
    end;

    procedure PrintReceiptBookin(receiptNoFilter: Code[10]) status: Text
    var
        ReceiptHeader: Record "Receipts Header1";
        repSalesInvoice: Report Receipt;
        printed: Boolean;
    begin

        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", receiptNoFilter);
        // StudentProcessingHeader.SETFILTER(StudentProcessingHeader."No.",'%1',StudentProcessingHeader);
        if StudentProcessingHeader.FindSet then begin
            appNo := ConvertStr(receiptNoFilter, '-', '_');
            appNo := ConvertStr(receiptNoFilter, ':', '_');



            if FILE.Exists(FILESPATH4 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH4 + appNo + '.pdf');


                //Report.SaveAsPdf(85047, FILESPATH4 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';

            end else begin

                //Report.SaveAsPdf(85047, FILESPATH4 + appNo + '.pdf', StudentProcessingHeader);
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

        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", receiptNoFilter);
        // StudentProcessingHeader.SETFILTER(StudentProcessingHeader."No.",'%1',StudentProcessingHeader);
        if StudentProcessingHeader.FindSet then begin
            appNo := ConvertStr(receiptNoFilter, '-', '_');
            appNo := ConvertStr(receiptNoFilter, ':', '_');



            if FILE.Exists(FILESPATH4 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH4 + appNo + '.pdf');


                //Report.SaveAsPdf(85048, FILESPATH4 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';

            end else begin

                //Report.SaveAsPdf(85048, FILESPATH4 + appNo + '.pdf', StudentProcessingHeader);
                status := 'success*downloads\receipt\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The receipt Report could not be generated';
        end;
    end;

    procedure SendStudentTimetable("code": Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", code);
        StudentProcessingHeader.SetFilter(StudentProcessingHeader."No.", '%1', code);
        if StudentProcessingHeader.FindSet then begin
            appNo := ConvertStr(code, '-', '_');
            appNo := ConvertStr(code, ':', '_');



            if FILE.Exists(FILESPATH8 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH8 + appNo + '.pdf');


                //Report.SaveAsPdf(85026, FILESPATH8 + appNo + '.pdf', StudentProcessingHeader);
                FileName := 'Timetable' + '.pdf';
                SMTPMailSetup.Get;
                // Email2 := SMTPMailSetup."Email Sender Address";
                Body := 'Examination Timetable';
                //SMTP.Create('Examination Timetable', Email2, StudentProcessingHeader.Email,
                //'Student Timetable',
                // 'Dear ' + StudentProcessingHeader."First Name" + ',<BR><BR>' +
                // 'Please find Attached your Examination Timetable.<b>' + '</b><BR>' +
                // 'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="https://online.kasneb.or.ke/">Student Portal</a></b><BR>'
                //  + '<BR>'
                //, true);
                ////SMTP.AddBCC(HRSetupNew."Student Module EMail BCC");
                //SMTP.AddAttachment(FILESPATH8 + appNo + '.pdf', FileName);
                //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examination <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
                //SMTP.Send();

                status := 'success* The Student Timetable has been sent successfully';

            end else begin

                //Report.SaveAsPdf(85026, FILESPATH8 + appNo + '.pdf', StudentProcessingHeader);
                FileName := 'Timetable' + '.pdf';
                SMTPMailSetup.Get;
                //Email2 := SMTPMailSetup."Email Sender Address";
                Body := 'Examination Timetable';
                //SMTP.Create('Examination Timetable', Email2, StudentProcessingHeader.Email,
                // 'Student Timetable',
                //  'Dear ' + StudentProcessingHeader."First Name" + ',<BR><BR>' +
                //'Please find Attached your Examination Timetable.<b>' + '</b><BR>' +
                // 'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="https://online.kasneb.or.ke/">Student Portal</a></b><BR>'
                //   + '<BR>'
                //  , true);
                ////SMTP.AddBCC(HRSetupNew."Student Module EMail BCC");
                //SMTP.AddAttachment(FILESPATH8 + appNo + '.pdf', FileName);
                //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examination <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
                //SMTP.Send();
                status := 'success* The Student Timetable has been sent successfully';
            end
        end else begin
            status := 'danger*The Timetable could not be generated';
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

            if FILE.Exists(FILESPATH5 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH5 + appNo + '.pdf');

                //Report.SaveAsPdf(85016, FILESPATH5 + appNo + '.pdf', ExaminationResults);
                status := 'success*downloads\resultslip\' + appNo + '.pdf';

            end else begin
                //Report.SaveAsPdf(85016, FILESPATH5 + appNo + '.pdf', ExaminationResults);
                status := 'success*downloads\resultslip\' + appNo + '.pdf';
            end
        end else begin
            status := 'danger*The Result Slip could not be generated';
        end;
        //END;


    end;

    procedure fnNewStaffPerformanceContract(contractNo: Code[100]; employeeNo: Code[100]; description: Text; seniorOfficerPC: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange("Responsible Employee No.", employeeNo);
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Open);
        PerfomanceContractHeader.SetRange("Score Card Type", PerfomanceContractHeader."score card type"::Staff);
        PerfomanceContractHeader.SetRange("Document Type", PerfomanceContractHeader."document type"::"Individual Scorecard");
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader.Description := description;
            PerfomanceContractHeader."Directors PC ID" := seniorOfficerPC;
            PerfomanceContractHeader.Validate("Directors PC ID");
            if PerfomanceContractHeader.Modify(true) then begin
                //FnSuggestJD(PerfomanceContractHeader.No);
                status := 'success*Your staff perfomance contract was successfully created*' + PerfomanceContractHeader.No + '*' + PerfomanceContractHeader."Strategy Plan ID" + '*' + seniorOfficerPC + '*' + PerfomanceContractHeader."Annual Reporting Code";
            end else begin
                status := 'danger*Your staff perfomance contract was not created, kindly try again!';
            end;
        end else begin
            //  PerfomanceContractHeader.RESET;
            //  PerfomanceContractHeader.SETRANGE("Responsible Employee No.",employeeNo);
            //  PerfomanceContractHeader.SETRANGE("Approval Status",PerfomanceContractHeader."Approval Status"::Open);
            //  IF PerfomanceContractHeader.FINDSET THEN BEGIN
            //    ERROR:='You have an open individual performance contract, kindly re-use it!';
            //  END;
            PerfomanceContractHeader.Init;
            PerfomanceContractHeader."Document Type" := PerfomanceContractHeader."document type"::"Individual Scorecard";
            PerfomanceContractHeader."Evaluation Type" := PerfomanceContractHeader."evaluation type"::"Standard Appraisal/Supervisor Score Only";
            PerfomanceContractHeader."Score Card Type" := PerfomanceContractHeader."score card type"::Staff;
            PerfomanceContractHeader."Responsible Employee No." := employeeNo;
            PerfomanceContractHeader.Validate("Responsible Employee No.");
            PerfomanceContractHeader.Description := description;
            PerfomanceContractHeader."Directors PC ID" := seniorOfficerPC;
            PerfomanceContractHeader.Validate("Directors PC ID");
            if PerfomanceContractHeader.Insert(true) then begin
                FnSuggestJD(PerfomanceContractHeader.No);
                status := 'success*Your staff perfomance contract was successfully created*' + PerfomanceContractHeader.No + '*' + PerfomanceContractHeader."Strategy Plan ID" + '*' + seniorOfficerPC + '*' + PerfomanceContractHeader."Annual Reporting Code";
            end else begin
                status := 'danger*Your staff perfomance contract was not created, kindly try again!';
            end;
        end;
    end;

    procedure FnSubmitSelectedCoreInitiatives(strategyid: Code[100]; personalscorecardid: Code[100]; workplanNumber: Code[50]; initiativeNumber: Code[50]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PerformanceContract: Record "Perfomance Contract Header";
        PcObjective1: Record "PC Objective";
        OriginalSubActivities: Record "Sub PC Objective";
        PCSubActivities: Record "Sub PC Objective";
    begin
        PerformanceContract.Reset;
        PerformanceContract.SetRange(No, personalscorecardid);
        if PerformanceContract.FindSet then begin
            PcObjective1.Reset;
            PcObjective1.SetRange("Strategy Plan ID", strategyid);
            PcObjective1.SetRange("Workplan No.", workplanNumber);
            PcObjective1.SetRange("Initiative No.", initiativeNumber);
            if PcObjective1.FindSet then begin
                PCObjective.Reset;
                PCObjective.SetRange("Strategy Plan ID", strategyid);
                PCObjective.SetRange("Workplan No.", personalscorecardid);
                PCObjective.SetRange("Initiative No.", initiativeNumber);
                if PCObjective.FindSet then begin
                    Error('The selected activity already exists, kindly select another activity!');
                end;
                repeat
                    PCObjective.Init;
                    PCObjective."Workplan No." := personalscorecardid;
                    PCObjective."Strategy Plan ID" := PcObjective1."Strategy Plan ID";
                    PCObjective."Initiative Type" := PcObjective1."Initiative Type";
                    PCObjective."Initiative No." := initiativeNumber;
                    PCObjective.Validate("Initiative No.");
                    PCObjective."Goal Template ID" := PcObjective1."Goal Template ID";
                    PCObjective."Objective/Initiative" := PcObjective1."Objective/Initiative";
                    PCObjective."Year Reporting Code" := PcObjective1."Year Reporting Code";
                    PCObjective."Primary Directorate" := PcObjective1."Primary Directorate";
                    PCObjective."Primary Department" := PcObjective1."Primary Department";
                    PCObjective."Outcome Perfomance Indicator" := PcObjective1."Outcome Perfomance Indicator";
                    PCObjective."Unit of Measure" := PcObjective1."Unit of Measure";
                    PCObjective."Imported Annual Target Qty" := PcObjective1."Imported Annual Target Qty";
                    PCObjective."Q1 Target Qty" := PcObjective1."Q1 Target Qty";
                    PCObjective."Q2 Target Qty" := PcObjective1."Q2 Target Qty";
                    PCObjective."Q3 Target Qty" := PcObjective1."Q3 Target Qty";
                    PCObjective."Q4 Target Qty" := PcObjective1."Q4 Target Qty";
                    PCObjective."Start Date" := PerformanceContract."Start Date";
                    PCObjective."Due Date" := PerformanceContract."End Date";
                    if PCObjective.Insert(true) then begin
                        Fnsuggestsubindicators(PcObjective1."Strategy Plan ID", PcObjective1."Workplan No.", PcObjective1."Initiative No.", personalscorecardid);
                        status := 'success*success';
                    end else begin
                        status := 'danger*failed';
                    end;
                until PcObjective1.Next = 0;
            end;
        end;
    end;

    procedure Fnsuggestsubindicators(strategyid: Code[100]; docNo: Code[100]; initiativeNumber: Code[50]; No: Code[100]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PerformanceContract: Record "Perfomance Contract Header";
        PcObjective1: Record "PC Objective";
        OriginalSubActivities: Record "Sub PC Objective";
        PCSubActivities: Record "Sub PC Objective";
    begin
        OriginalSubActivities.Reset;
        OriginalSubActivities.SetRange("Workplan No.", docNo);
        OriginalSubActivities.SetRange("Initiative No.", initiativeNumber);
        OriginalSubActivities.SetRange("Strategy Plan ID", strategyid);
        if OriginalSubActivities.FindSet then begin
            Message(strategyid, docNo, initiativeNumber);
            repeat
                PCSubActivities.Init;
                PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                PCSubActivities."Workplan No." := No;
                PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                PCSubActivities.TransferFields(OriginalSubActivities, false);
                if PCSubActivities.Insert(true) then begin
                    status := 'success*success';
                end else begin
                    status := 'danger*failed';
                end;
            until OriginalSubActivities.Next = 0;
        end;
    end;

    procedure FnSaveCoreInitiatives(entryNumber: Integer; startdate: Date; enddate: Date; agreedTarget: Decimal; assignedweight: Decimal; comments: Text) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
    begin
        PCObjective.Reset;
        PCObjective.SetRange(EntryNo, entryNumber);
        if PCObjective.FindSet then begin
            repeat
                PCObjective."Start Date" := startdate;
                PCObjective."Due Date" := enddate;
                PCObjective."Imported Annual Target Qty" := agreedTarget;
                PCObjective."Assigned Weight (%)" := assignedweight;
                PCObjective."Additional Comments" := comments;
                if PCObjective.Modify(true) then begin
                    status := 'success*Core Initiatives Details was successfully saved';
                end else begin
                    status := 'danger*Core Initiatives Details Was not successfully saved';
                end;
            until PCObjective.Next = 0;
        end;
    end;

    procedure FnRemoveCoreInitiatives(docNo: Code[100]; entryNumber: Integer) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
    begin
        PCObjective.Reset;
        PCObjective.SetRange("Workplan No.", docNo);
        PCObjective.SetRange(EntryNo, entryNumber);
        if PCObjective.FindSet then begin
            if PCObjective.Delete(true) then begin
                status := 'success*Core Initiative was successfully removed';
            end else begin
                status := 'danger*Core Initiative could not be removed, kindly try again!';
            end;
        end;
    end;

    procedure fnSaveAditionalInitiatives(entryno: Integer; agreedtarget: Decimal; annualtarget: Decimal; startdate: Date; enddate: Date; comments: Text) status: Text
    var
        SecondaryPCObjective: Record "Secondary PC Objective";
    begin
        SecondaryPCObjective.Reset;
        SecondaryPCObjective.SetRange(EntryNo, entryno);
        if SecondaryPCObjective.FindSet then begin
            repeat
                SecondaryPCObjective."Imported Annual Target Qty" := agreedtarget;
                SecondaryPCObjective."Assigned Weight (%)" := annualtarget;
                SecondaryPCObjective."Start Date" := startdate;
                SecondaryPCObjective."Due Date" := enddate;
                //SecondaryPCObjective.Comments:=comments;
                if SecondaryPCObjective.Modify(true) then begin
                    status := 'success*Additional Initiatives were successfully  submitted';
                end else begin
                    status := 'danger*Additional Initiatives were not successfully  submitted';
                end;
            until SecondaryPCObjective.Next = 0;
        end;
    end;

    procedure fnRemoveAditionalInitiative(docNo: Code[100]; entryno: Integer) status: Text
    var
        SecondaryPCObjective: Record "Secondary PC Objective";
    begin
        SecondaryPCObjective.Reset;
        SecondaryPCObjective.SetRange("Workplan No.", docNo);
        SecondaryPCObjective.SetRange(EntryNo, entryno);
        if SecondaryPCObjective.FindSet then begin
            if SecondaryPCObjective.Delete(true) then begin
                status := 'success*Additional Initiative was successfully removed';
            end else begin
                status := 'danger*Additional Initiative could not be removed, kindly try again!';
            end;
        end;
    end;

    procedure FnDeleteIndividualCardSubActivities(empNo: Text[30]; scorecardNumber: Code[100]; ActivityNo: Text; EntryNumber: Integer) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SubPCObjective: Record "Sub PC Objective";
    begin
        SubPCObjective.Reset;
        SubPCObjective.SetRange("Workplan No.", scorecardNumber);
        SubPCObjective.SetRange("Initiative No.", ActivityNo);
        SubPCObjective.SetRange("Entry Number", EntryNumber);
        if SubPCObjective.FindSet then begin
            if SubPCObjective.Delete(true) then begin
                status := 'success* Individual Score Card Sub Activities was successfully Removed';
            end else begin
                status := 'danger* Individual Score Card Sub Activities was not  Removed';
            end;
        end;
    end;

    procedure FnNewIndividualCardSubActivities(scorecardNumber: Code[100]; ActivityNo: Text; subinitiative: Text; subindicator: Text; uom: Text; targets: Integer; completiondate: Date; assweight: Decimal) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SubPCObjective: Record "Sub PC Objective";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, scorecardNumber);
        if PerfomanceContractHeader.FindSet then begin
            SubPCObjective.Init;
            SubPCObjective."Workplan No." := scorecardNumber;
            SubPCObjective."Initiative No." := ActivityNo;
            SubPCObjective."Objective/Initiative" := subinitiative;
            SubPCObjective."Outcome Perfomance Indicator" := subindicator;
            SubPCObjective."Unit of Measure" := uom;
            SubPCObjective."Imported Annual Target Qty" := targets;
            SubPCObjective."Due Date" := completiondate;
            //SubPCObjective."Assigned Weight (%)":=assweight;
            SubPCObjective."Strategy Plan ID" := PerfomanceContractHeader."Strategy Plan ID";
            SubPCObjective."Year Reporting Code" := PerfomanceContractHeader."Annual Reporting Code";
            if SubPCObjective.Insert(true) then begin
                status := 'success* Individual Score Card Sub Activities was successfully  submitted';
            end else begin
                status := 'danger* Individual Score Card Sub Activities was not  submitted';
            end;
        end;
    end;

    procedure FnEditIndividualCardSubActivities(scorecardNumber: Code[100]; ActivityNo: Text; lineno: Integer; subinitiative: Text; subindicator: Text; uom: Text; targets: Integer; completiondate: Date; agreedweight: Decimal) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SubPCObjective: Record "Sub PC Objective";
    begin
        SubPCObjective.Reset;
        SubPCObjective.SetRange("Workplan No.", scorecardNumber);
        SubPCObjective.SetRange("Initiative No.", ActivityNo);
        SubPCObjective.SetRange("Entry Number", lineno);
        if SubPCObjective.FindSet then begin
            SubPCObjective."Objective/Initiative" := subinitiative;
            SubPCObjective."Outcome Perfomance Indicator" := subindicator;
            SubPCObjective."Unit of Measure" := uom;
            SubPCObjective."Imported Annual Target Qty" := targets;
            SubPCObjective."Due Date" := completiondate;
            //SubPCObjective."Assigned Weight (%)":=agreedweight;
            if SubPCObjective.Modify(true) then begin
                status := 'success* Individual Score Card Sub Activities was successfully updated';
            end else begin
                status := 'danger* Individual Score Card Sub Activities was not updated';
            end;
        end;
    end;

    procedure fnSendStaffPerformanceContractApproval(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Open);
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader."Approval Status" := PerfomanceContractHeader."approval status"::"Pending Approval";
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*Your staff perfomance contract was successfully send for approval*';
            end else begin
                status := 'danger*Your staff perfomance contract was not send for approval, kindly try again!';
            end;
        end;
    end;

    procedure fnCancelStaffPerformanceContract(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::"Pending Approval");
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader."Approval Status" := PerfomanceContractHeader."approval status"::Open;
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*Approval for staff perfomance contract was successfully cancelled*';
            end else begin
                status := 'danger*Approval for staff perfomance contract was not cancelled, kindly try again!';
            end;
        end;
    end;

    procedure fnLockStaffPerformanceContract(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Released);
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader."Change Status" := PerfomanceContractHeader."change status"::Locked;
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*The perfomance contract was successfully locked, kindy proceed to sign*';
            end else begin
                status := 'danger*The perfomance contract was not locked, kindly try again!';
            end;
        end;
    end;

    procedure fnSignStaffPerformanceContract(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Released);
        PerfomanceContractHeader.SetRange("Change Status", PerfomanceContractHeader."change status"::Locked);
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader.Status := PerfomanceContractHeader.Status::Signed;
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*The perfomance contract was successfully signed*';
            end else begin
                status := 'danger*The perfomance contract was not signed, kindly try again!';
            end;
        end else begin
            status := 'danger*You must lock the performance contract before signing!!';
        end;
        exit(status)
    end;

    procedure fnGenerateIndividualPcReport(docNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, docNo);
        if PerfomanceContractHeader.FindSet then begin
            if FILE.Exists(FILESPATH16 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH16 + docNo + '.pdf');
                //Report.SaveAsPdf(80007, FILESPATH16 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*Downloads\IndividualPCReport\' + docNo + '.pdf';
            end else begin
                //Report.SaveAsPdf(80007, FILESPATH16 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*Downloads\IndividualPCReport\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateIndividualPcSubIndicatorReport(docNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, docNo);
        if PerfomanceContractHeader.FindSet then begin
            if FILE.Exists(FILESPATH24 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH24 + docNo + '.pdf');
                //Report.SaveAsPdf(80024, FILESPATH24 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*Downloads\IndividualSubIndicator\' + docNo + '.pdf';
            end else begin
                //Report.SaveAsPdf(80024, FILESPATH24 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*Downloads\IndividualSubIndicator\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnInsertJDTargets(lineno: Code[100]; workplanno: Code[100]; annualtarget: Integer; assignedtarget: Integer) status: Text
    var
        PCJobDescription: Record "PC Job Description";
    begin
        PCJobDescription.Reset;
        PCJobDescription.SetRange("Line Number", lineno);
        PCJobDescription.SetRange("Workplan No.", workplanno);
        if PCJobDescription.FindSet then begin
            PCJobDescription."Start Date" := Today;
            PCJobDescription."Due Date" := Today;
            PCJobDescription."Imported Annual Target Qty" := annualtarget;
            PCJobDescription."Assigned Weight (%)" := assignedtarget;
            if PCJobDescription.Modify(true) then begin
                status := 'success*Your Plog target were submitted successfully!*';
            end else begin
                status := 'danger*Your Plog target were not saved successfully, kindly try again!*';
            end;
        end;
    end;

    procedure FnSuggestJD(workplan: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        SpmGeneralSetup: Record "SPM General Setup";
        JobResponsibilities: Record "Positions Responsibility";
        PCJobDescription: Record "PC Job Description";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, workplan);
        if PerfomanceContractHeader.FindSet then begin
            JobResponsibilities.Reset;
            JobResponsibilities.SetRange("Position ID", PerfomanceContractHeader.Position);
            if JobResponsibilities.Find('-') then begin
                repeat
                    PCJobDescription.Init;
                    PCJobDescription."Workplan No." := PerfomanceContractHeader.No;
                    PCJobDescription."Line Number" := Format(JobResponsibilities."Line No");
                    PCJobDescription.Validate("Line Number");
                    PCJobDescription.Description := JobResponsibilities.Description;
                    PCJobDescription."Primary Department" := PerfomanceContractHeader."Responsibility Center";
                    PCJobDescription.Validate("Primary Department");
                    PCJobDescription."Start Date" := PerfomanceContractHeader."Start Date";
                    PCJobDescription."Due Date" := PerfomanceContractHeader."End Date";
                    PCJobDescription.Insert(true);
                until JobResponsibilities.Next = 0;
            end;
        end;
    end;

    procedure fnGetAnnualWorkplanLines(csp: Code[100]; annualcode: Code[100]) AnnualLines: Text
    var
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
    begin
        StrategyWorkplanLines.Reset;
        StrategyWorkplanLines.SetRange("Strategy Plan ID", csp);
        StrategyWorkplanLines.SetRange("Year Reporting Code", annualcode);
        if StrategyWorkplanLines.FindSet then begin
            repeat
                AnnualLines := AnnualLines + '*' + StrategyWorkplanLines."Activity ID" + '*' + StrategyWorkplanLines.Description + '*' + StrategyWorkplanLines."Primary Directorate" + ':';
            until StrategyWorkplanLines.Next = 0;
        end;
        exit(AnnualLines);
    end;

    procedure fnInsertSelectedAdditionalActivities(csp: Code[100]; annualcode: Code[100]; personalPc: Code[100]; activityID: Code[100]) status: Text
    var
        SecondaryPCObjective: Record "Secondary PC Objective";
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        StrategyWorkplanLines.Reset;
        StrategyWorkplanLines.SetRange("Activity ID", activityID);
        StrategyWorkplanLines.SetRange("Strategy Plan ID", csp);
        StrategyWorkplanLines.SetRange("Year Reporting Code", annualcode);
        if StrategyWorkplanLines.FindSet then begin
            PerfomanceContractHeader.Reset;
            PerfomanceContractHeader.SetRange(No, personalPc);
            if PerfomanceContractHeader.FindSet then begin
                SecondaryPCObjective.Init;
                SecondaryPCObjective."Workplan No." := personalPc;
                SecondaryPCObjective."Initiative No." := activityID;
                SecondaryPCObjective."Strategy Plan ID" := StrategyWorkplanLines."Strategy Plan ID";
                SecondaryPCObjective."Year Reporting Code" := StrategyWorkplanLines."Year Reporting Code";
                SecondaryPCObjective."Primary Directorate" := StrategyWorkplanLines."Primary Directorate";
                SecondaryPCObjective."Unit of Measure" := StrategyWorkplanLines."Unit of Measure";
                SecondaryPCObjective."Outcome Perfomance Indicator" := StrategyWorkplanLines."Perfomance Indicator";
                SecondaryPCObjective."Objective/Initiative" := StrategyWorkplanLines.Description;
                SecondaryPCObjective."Start Date" := PerfomanceContractHeader."Start Date";
                SecondaryPCObjective."Due Date" := PerfomanceContractHeader."End Date";
                if SecondaryPCObjective.Insert(true) then begin
                    status := 'success*Inserted';
                end else begin
                    status := 'danger*Inserted';
                end;
            end;
        end;
    end;

    procedure fnGenerateCSPReport(docNo: Code[100]) status: Text
    var
        CorporateStrategicPlans: Record "Corporate Strategic Plans";
    begin
        CorporateStrategicPlans.Reset;
        CorporateStrategicPlans.SetRange(Code, docNo);
        if CorporateStrategicPlans.FindSet then begin
            if FILE.Exists(FILESPATH17 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH17 + docNo + '.pdf');
                //Report.SaveAsPdf(80001, FILESPATH17 + docNo + '.pdf', CorporateStrategicPlans);
                status := 'success*Generated*Downloads\CSP\' + docNo + '.pdf';
            end else begin
                //Report.SaveAsPdf(80001, FILESPATH17 + docNo + '.pdf', CorporateStrategicPlans);
                status := 'success*Generated*Downloads\CSP\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateAWPReport(docNo: Code[100]) status: Text
    var
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
    begin
        AnnualStrategyWorkplan.Reset;
        AnnualStrategyWorkplan.SetRange(No, docNo);
        if AnnualStrategyWorkplan.FindSet then begin
            if FILE.Exists(FILESPATH18 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH18 + docNo + '.pdf');
                //Report.SaveAsPdf(80002, FILESPATH18 + docNo + '.pdf', AnnualStrategyWorkplan);
                status := 'success*Generated*Downloads\AWP\' + docNo + '.pdf';
            end else begin
                //Report.SaveAsPdf(80002, FILESPATH18 + docNo + '.pdf', AnnualStrategyWorkplan);
                status := 'success*Generated*Downloads\AWP\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateBoardPCReport(docNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, docNo);
        if PerfomanceContractHeader.FindSet then begin
            if FILE.Exists(FILESPATH19 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH19 + docNo + '.pdf');
                //Report.SaveAsPdf(80019, FILESPATH19 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*Downloads\BoardPC\' + docNo + '.pdf';
            end else begin
                //Report.SaveAsPdf(80019, FILESPATH19 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*Downloads\BoardPC\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure FnSubmitSelectedPLogCategories2(strategyid: Code[100]; personalscorecardid: Code[100]; plogNumber: Code[50]; initiativeNumber: Code[50]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, plogNumber);
        if PerformanceDiaryLog.FindSet then begin
            PCObjective.Reset;
            PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCObjective.SetRange("Initiative No.", initiativeNumber);
            if PCObjective.FindSet then begin
                repeat
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := PCObjective."Initiative No.";
                    PlogLines.Validate("Initiative No.");
                    PlogLines."Sub Intiative No" := PCObjective."Objective/Initiative";
                    PlogLines.Description := PCObjective."Objective/Initiative";
                    if PlogLines.Insert(true) then begin
                        status := 'success*The PlogLines was successfully submitted';
                    end else begin
                        status := 'danger*The PlogLines was successfully submitted';
                    end;
                until PCObjective.Next = 0;
            end;
        end;
    end;

    procedure FnNewPerformanceLogEntry2(docNo: Code[100]; empNo: Text[30]; scorecardNumber: Code[100]; description: Text) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange("Employee No.", empNo);
        PerformanceDiaryLog.SetRange(No, docNo);
        PerformanceDiaryLog.SetRange("Approval Status", PerformanceDiaryLog."approval status"::Open);
        PerformanceDiaryLog.SetRange(Posted, false);
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog."Personal Scorecard ID" := scorecardNumber;
            PerformanceDiaryLog.Validate("Personal Scorecard ID");
            PerformanceDiaryLog.Description := description;
            if PerformanceDiaryLog.Modify(true) then begin
                ;
                //FnSuggestPlogLines(PerformanceDiaryLog.No,PerformanceDiaryLog."CSP ID",scorecardNumber,empNo);
                //fnSuggestPlogandSubPlogData(PerformanceDiaryLog.No);
                status := 'success* Performance Diary Logs was successfully updated*' + PerformanceDiaryLog.No + '*' + PerformanceDiaryLog."CSP ID" + '*' + PerformanceDiaryLog."Personal Scorecard ID";
            end else begin
                status := 'danger* Performance Diary Logs Was not successfully updated*' + PerformanceDiaryLog.No;
            end;
        end else begin
            //---//
            //  PerformanceDiaryLog.RESET;
            //  PerformanceDiaryLog.SETRANGE("Employee No.",empNo);
            //  PerformanceDiaryLog.SETRANGE("Approval Status",PerformanceDiaryLog."Approval Status"::Open);
            //  IF PerformanceDiaryLog.FINDSET THEN BEGIN
            //    ERROR:='You have an open performance log, kindly re-use it!';
            //  END;
            PerformanceDiaryLog.Init;
            PerformanceDiaryLog."Employee No." := empNo;
            PerformanceDiaryLog.Validate("Employee No.");
            PerformanceDiaryLog."Personal Scorecard ID" := scorecardNumber;
            PerformanceDiaryLog.Validate("Personal Scorecard ID");
            PerformanceDiaryLog.Description := description;
            PerformanceDiaryLog."Approval Status" := PerformanceDiaryLog."approval status"::Open;
            if PerformanceDiaryLog.Insert(true) then begin
                //fnSuggestPlogandSubPlogData2(PerformanceDiaryLog.No);

                status := 'success* Performance Diary Logs was successfully submitted*' + PerformanceDiaryLog.No;
            end else begin
                status := 'danger* Performance Diary Logs was not successfully submitted*';
            end;
        end;
    end;

    procedure fnGetPlogLines2(docNo: Code[100]; empNo: Code[100]) PlogData: Text
    var
        PlogLines: Record "Plog Lines";
    begin
        PlogLines.Reset;
        PlogLines.SetRange("PLog No.", docNo);
        PlogLines.SetRange("Employee No.", empNo);
        if PlogLines.FindSet then begin
            //  REPEAT
            //    PlogData := PlogData +FORMAT(PlogLines.EntryNo)+'*'+FORMAT(PlogLines."PLog No.")+'*'+FORMAT(PlogLines."Initiative No.")+'*'+FORMAT(PlogLines."Personal Scorecard ID")+'*'+FORMAT(PlogLines."Sub Intiative No")+'*'+
            //    FORMAT(PlogLines."Due Date")+'*'+FORMAT(PlogLines."Achieved Date")+'*'+FORMAT(PlogLines."Target Qty")+'*'+FORMAT(PlogLines."Q1 Achieved Target")+'*'+FORMAT(PlogLines."Q2 Achieved Target")+'*'+
            //    FORMAT(PlogLines."Q3 AchievedTarget")+'*'+FORMAT(PlogLines."Q4 Achieved Target")+'*'+FORMAT(PlogLines."Achieved Target")+'*'+FORMAT(PlogLines.Comments)+'*'+FORMAT(PlogLines."Achieved Weight(%)")+':';
            //  UNTIL PlogLines.NEXT=0;
        end;
        exit(PlogData)
    end;

    procedure fnGetSubPlogLines2(plogNo: Code[100]; initiativeNo: Code[100]; pcNo: Code[100]) PlogData: Text
    var
        SubPlogLines: Record "Sub Plog Lines";
    begin
        SubPlogLines.Reset;
        SubPlogLines.SetRange("PLog No.", plogNo);
        SubPlogLines.SetRange("Initiative No.", initiativeNo);
        SubPlogLines.SetRange("Personal Scorecard ID", pcNo);
        if SubPlogLines.FindSet then begin
            repeat
                PlogData := PlogData + Format(SubPlogLines.EntryNo) + '*' + Format(SubPlogLines.Description) + '*' + Format(SubPlogLines."Achieved Date") + '*' + Format(SubPlogLines."Target Qty") + '*' + Format(SubPlogLines."Achieved Target") + '*' +
                Format(SubPlogLines.Comments) + '*' + Format(SubPlogLines."Weight %") + ':';
            until SubPlogLines.Next = 0;
        end;
        exit(PlogData)
    end;

    procedure FnSuggestPlogLines2(docNo: Code[100]; strategyid: Code[100]; personalscorecardid: Code[100]; empNumber: Code[100]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        StrategicInitiative: Record "PC Objective";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetFilter(No, '<>%1', '');
        PerformanceDiaryLog.SetRange(No, docNo);
        PerformanceDiaryLog.SetRange("Employee No.", empNumber);
        PerformanceDiaryLog.SetRange("Personal Scorecard ID", personalscorecardid);
        PerformanceDiaryLog.SetRange("CSP ID", strategyid);
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog.TestField("Employee No.");
            PerformanceDiaryLog.TestField("Personal Scorecard ID");
            PerformanceDiaryLog.TestField("Activity Start Date");
            PerformanceDiaryLog.TestField("Activity End Date");
            PCObjective.Reset;
            PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            if PCObjective.FindSet then begin
                repeat
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Initiative No." := PCObjective."Initiative No.";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                    PlogLines.Validate("Initiative No.");
                    if PlogLines.Insert(true) then begin
                        status := 'success*The PlogLines was successfully submitted';
                    end else begin
                        status := 'danger*The PlogLines was not successfully submitted';
                    end;
                until PCObjective.Next = 0;
            end;
        end;
        SecondaryPCObjective.Reset;
        SecondaryPCObjective.SetRange("Strategy Plan ID", strategyid);
        SecondaryPCObjective.SetRange("Workplan No.", personalscorecardid);
        if SecondaryPCObjective.FindFirst then begin
            repeat
                PlogLines.Init;
                PlogLines."PLog No." := PerformanceDiaryLog.No;
                PlogLines."Activity Type" := PlogLines."activity type"::"Secondary Activity";
                PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                PlogLines."Initiative No." := SecondaryPCObjective."Initiative No.";
                PlogLines.Validate("Initiative No.");
                if PlogLines.Insert(true) then begin
                    status := 'success*The PlogLines was successfully submitted';
                end else begin
                    status := 'danger*The PlogLines was not successfully submitted';
                end;
            until SecondaryPCObjective.Next = 0;
        end;
    end;

    procedure fnSuggestPlogandSubPlogData2(docNo: Code[100])
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
        PlogLines: Record "Plog Lines";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        SubPlogLines: Record "Sub Plog Lines";
        SubPCObjective: Record "Sub PC Objective";
        SPMGeneralSetup: Record "SPM General Setup";
        PCJobDescription: Record "PC Job Description";
        SubJDObjective: Record "Sub JD Objective";
    begin
        // PerformanceDiaryLog.TESTFIELD("Employee No.");
        // PerformanceDiaryLog.TESTFIELD("Personal Scorecard ID");
        // PerformanceDiaryLog.TESTFIELD("Activity Start Date");
        // PerformanceDiaryLog.TESTFIELD("Activity End Date");
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, docNo);
        if PerformanceDiaryLog.FindSet then begin
            /*
              SPMGeneralSetup.GET();
              IF (SPMGeneralSetup."Allow Loading of  CSP"=TRUE) THEN BEGIN
                PCObjective.RESET;
                PCObjective.SETRANGE("Strategy Plan ID",PerformanceDiaryLog."CSP ID");
                PCObjective.SETRANGE("Workplan No.",PerformanceDiaryLog."Personal Scorecard ID");
                PCObjective.SETRANGE("Due Date",PerformanceDiaryLog."Activity Start Date",PerformanceDiaryLog."Activity End Date");//Commented for Kerra
                IF PCObjective.FINDSET THEN BEGIN
                  REPEAT
                    PCObjective.CALCFIELDS("Individual Achieved Targets");
                    PCObjective.TESTFIELD("Due Date");
                    //PCObjective.TESTFIELD("Imported Annual Target Qty");
                    PlogLines.INIT;
                    PlogLines."PLog No.":=PerformanceDiaryLog.No;
                    PlogLines."Activity Type":= PlogLines."Activity Type"::"Primary Activity";
                    PlogLines."Strategy Plan ID":=PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID":=PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No.":=PerformanceDiaryLog."Employee No.";
                    //PlogLines."Key Performance Indicator":=PCObjective."Key Performance Indicator";
                    //PlogLines."Key Performance Indicator":=PCObjective."Outcome Perfomance Indicator";
                    PlogLines."Initiative No.":=PCObjective."Initiative No.";
                    PlogLines."Unit of Measure":=PCObjective."Unit of Measure";
                    //MESSAGE('PCObjective."Assigned Weight (%)" is %1',PCObjective."Assigned Weight (%)");
                    PlogLines."Weight %":=PCObjective."Assigned Weight (%)";
                    PlogLines.VALIDATE("Initiative No.");
                    PlogLines."Remaining Targets":=PCObjective."Imported Annual Target Qty"-PCObjective."Individual Achieved Targets";
                    PlogLines.INSERT;

                   //Sub Activities
                    SubPCObjective.RESET;
                    SubPCObjective.SETRANGE("Workplan No.",PerformanceDiaryLog."Personal Scorecard ID");
                    SubPCObjective.SETRANGE("Initiative No.",PCObjective."Initiative No.");
                    IF SubPCObjective.FINDSET THEN BEGIN
                       REPEAT
                          SubPlogLines.INIT;
                          SubPlogLines."PLog No.":=PerformanceDiaryLog.No;
                          SubPlogLines."Activity Type":= SubPlogLines."Activity Type"::"Primary Activity";
                          SubPlogLines."Strategy Plan ID":=PerformanceDiaryLog."CSP ID";
                          SubPlogLines."Personal Scorecard ID":=PerformanceDiaryLog."Personal Scorecard ID";
                          SubPlogLines."Employee No.":=PerformanceDiaryLog."Employee No.";
                          SubPlogLines."Initiative No.":=SubPCObjective."Initiative No.";
                          //SubPlogLines."Sub Activity No.":=SubPCObjective."Outcome Perfomance Indicator";
                          SubPlogLines.Description:=SubPCObjective."Objective/Initiative";
                          //SubPlogLines."Sub Activity No.":=SubPCObjective."Sub Initiative No.";
                          SubPlogLines."Unit of Measure":=SubPCObjective."Unit of Measure";
                          SubPlogLines."Planned Date":=SubPCObjective."Due Date";
                          SubPlogLines."Target Qty":=SubPCObjective."Imported Annual Target Qty";
                          //SubPlogLines."Weight %":=SubPCObjective."Assigned Weight (%)";
                          //SubPlogLines.VALIDATE("Initiative No.");
                          //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                          //IF NOT SubPlogLines.GET(SubPlogLines."PLog No.",SubPlogLines."Initiative No.",SubPlogLines."Sub Activity No.",SubPlogLines."Personal Scorecard ID") THEN
                          SubPlogLines.INSERT(TRUE);
                       UNTIL SubPCObjective.NEXT=0;
                    END;

                  UNTIL PCObjective.NEXT=0;
                END;

                SecondaryPCObjective.RESET;
                SecondaryPCObjective.SETRANGE("Strategy Plan ID",PerformanceDiaryLog."CSP ID");
                SecondaryPCObjective.SETRANGE("Workplan No.",PerformanceDiaryLog."Personal Scorecard ID");
                SecondaryPCObjective.SETRANGE("Due Date",PerformanceDiaryLog."Activity Start Date",PerformanceDiaryLog."Activity End Date");
                IF SecondaryPCObjective.FINDFIRST THEN BEGIN
                  REPEAT
                    SecondaryPCObjective.CALCFIELDS("Individual Achieved Targets");
                    SecondaryPCObjective.TESTFIELD("Due Date");
                    //SecondaryPCObjective.TESTFIELD("Imported Annual Target Qty");
                    PlogLines.INIT;
                    PlogLines."PLog No.":=PerformanceDiaryLog.No;
                    PlogLines."Activity Type":= PlogLines."Activity Type"::"Secondary Activity";
                    PlogLines."Strategy Plan ID":=PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID":=PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No.":=PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No.":=SecondaryPCObjective."Initiative No.";
                    //MESSAGE('SecondaryPCObjective."Assigned Weight (%)" is %1',SecondaryPCObjective."Assigned Weight (%)");
                    PlogLines."Weight %":=SecondaryPCObjective."Assigned Weight (%)";
                    PlogLines.VALIDATE("Initiative No.");
                    PlogLines."Remaining Targets":=PCObjective."Imported Annual Target Qty"-PCObjective."Individual Achieved Targets";
                    PlogLines.INSERT;

                   //Sub Activities
                    SubPCObjective.RESET;
                    SubPCObjective.SETRANGE("Workplan No.",PerformanceDiaryLog."Personal Scorecard ID");
                    SubPCObjective.SETRANGE("Initiative No.",SecondaryPCObjective."Initiative No.");
                    IF SubPCObjective.FINDSET THEN BEGIN
                       REPEAT
                          SubPlogLines.INIT;
                          SubPlogLines."PLog No.":=PerformanceDiaryLog.No;
                          SubPlogLines."Activity Type":= SubPlogLines."Activity Type"::"Primary Activity";
                          SubPlogLines."Strategy Plan ID":=PerformanceDiaryLog."CSP ID";
                          SubPlogLines."Personal Scorecard ID":=PerformanceDiaryLog."Personal Scorecard ID";
                          SubPlogLines."Employee No.":=PerformanceDiaryLog."Employee No.";
                          SubPlogLines."Initiative No.":=SubPCObjective."Initiative No.";
                          //SubPlogLines."Sub Activity No.":=SubPCObjective."Outcome Perfomance Indicator";
                          SubPlogLines.Description:=SubPCObjective."Objective/Initiative";
                          //SubPlogLines."Sub Activity No.":=SubPCObjective."Sub Initiative No.";
                          SubPlogLines."Unit of Measure":=SubPCObjective."Unit of Measure";
                          SubPlogLines."Planned Date":=SubPCObjective."Due Date";
                          SubPlogLines."Target Qty":=SubPCObjective."Imported Annual Target Qty";
                          //SubPlogLines."Weight %":=SubPCObjective."Assigned Weight (%)";
                          //SubPlogLines.VALIDATE("Initiative No.");
                          //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                          IF NOT SubPlogLines.GET(SubPlogLines."PLog No.",SubPlogLines."Initiative No.",SubPlogLines."Sub Activity No.",SubPlogLines."Personal Scorecard ID") THEN
                          SubPlogLines.INSERT(TRUE);
                       UNTIL SubPCObjective.NEXT=0;
                    END;
                  UNTIL SecondaryPCObjective.NEXT=0;
                END;
              END;

              IF (SPMGeneralSetup."Allow Loading of JD"=TRUE) THEN BEGIN
            */
            PCJobDescription.Reset;
            PCJobDescription.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCJobDescription.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
            if PCJobDescription.FindFirst then begin
                repeat
                    // PCJobDescription.CALCFIELDS("Individual Achieved Targets");
                    PCJobDescription.TestField("Due Date");
                    PCJobDescription.TestField("Imported Annual Target Qty");
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"JD Activity";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := Format(PCJobDescription."Line Number");
                    PlogLines."Sub Intiative No" := PCJobDescription.Description;
                    PlogLines."Planned Date" := PCJobDescription."Start Date";
                    PlogLines."Achieved Date" := PerformanceDiaryLog."Document Date";
                    PlogLines."Due Date" := PCJobDescription."Due Date";
                    PlogLines."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                    PlogLines."Weight %" := PCJobDescription."Assigned Weight (%)";
                    PlogLines."Remaining Targets" := PCJobDescription."Imported Annual Target Qty" - PCJobDescription."Individual Achieved Targets";
                    PlogLines.Insert;
                    //Sub JD Plog Lines
                    SubJDObjective.Reset;
                    SubJDObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                    SubJDObjective.SetRange("Line Number", PCJobDescription."Line Number");
                    if SubJDObjective.FindSet then begin
                        repeat
                            SubPlogLines.Init;
                            SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                            SubPlogLines."Activity Type" := SubPlogLines."activity type"::"JD Activity";
                            SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                            SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                            SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                            SubPlogLines."Initiative No." := SubJDObjective."Line Number";
                            //SubPlogLines."Sub Activity No.":=SubJDObjective."Sub Initiative No.";
                            SubPlogLines.Description := SubJDObjective.Description;
                            SubPlogLines."Unit of Measure" := SubJDObjective."Unit of Measure";
                            SubPlogLines."Planned Date" := SubJDObjective."Due Date";
                            SubPlogLines."Target Qty" := SubJDObjective."Imported Annual Target Qty";
                            SubPlogLines."Due Date" := SubJDObjective."Due Date";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubJDObjective.Next = 0;
                    end;
                until PCJobDescription.Next = 0;
            end;
        end;
        //END;

    end;

    /// <summary>
    /// FnUpdatePerformanceTargetLinesDetails2.
    /// </summary>
    /// <param name="docNo">Code[100].</param>
    /// <param name="entryNumber">Integer.</param>
    /// <param name="agreedTarget">Decimal.</param>
    /// <param name="comments">Text.</param>
    /// <returns>Return variable status of type Text.</returns>
    procedure FnUpdatePerformanceTargetLinesDetails2(docNo: Code[100]; entryNumber: Integer; agreedTarget: Decimal; comments: Text) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PlogLines.Reset;
        PlogLines.SetRange(EntryNo, entryNumber);
        PlogLines.SetRange("PLog No.", docNo);
        if PlogLines.FindSet then begin
            PlogLines."Achieved Target" := agreedTarget;
            PlogLines.Comments := comments;
            if PlogLines.Modify(true) then begin
                status := 'success*Performance Target Details was successfully updated';
            end else begin
                status := 'danger*Performance Target Details Was not successfully updated';
            end;
        end;
    end;

    procedure FnRemovePerformanceLogSubLine2(docNo: Code[100]; entryNumber: Code[100]) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
        PlogLines: Record "Plog Lines";
    begin

        SubPlogLines.Reset;
        SubPlogLines.SetRange("Initiative No.", entryNumber);
        SubPlogLines.SetRange("PLog No.", docNo);
        if SubPlogLines.FindFirst then begin
            repeat
                SubPlogLines.Delete(true);
            until SubPlogLines.Next = 0;
        end;
    end;

    procedure FnRemovePerformanceLogLine2(docNo: Code[100]; entryNumber: Integer) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
        PlogLines: Record "Plog Lines";
    begin
        PlogLines.Reset;
        PlogLines.SetRange(EntryNo, entryNumber);
        PlogLines.SetRange("PLog No.", docNo);
        if PlogLines.FindSet then begin
            FnRemovePerformanceLogSubLine2(docNo, PlogLines."Initiative No.");
            if PlogLines.Delete(true) then begin
                status := 'success*Performance update line was successfully removed';
            end else begin
                status := 'danger*Performance update line was not removed, kindly try again!!';
            end;
        end;
    end;

    procedure fnInsertPlogSubActivities2(entryNo: Integer; plogno: Code[100]; initiativeno: Code[100]; pcid: Code[100]; achievedtarget: Decimal; comments: Text) status: Text
    var
        SubPlogLines: Record "Sub Plog Lines";
        PlogLines: Record "Plog Lines";
        SubPlogLines1: Record "Sub Plog Lines";
        TotalTarget: Decimal;
        TotalWeight: Decimal;
    begin
        SubPlogLines.Reset;
        SubPlogLines.SetRange(EntryNo, entryNo);
        SubPlogLines.SetRange("PLog No.", plogno);
        SubPlogLines.SetRange("Initiative No.", initiativeno);
        SubPlogLines.SetRange("Personal Scorecard ID", pcid);
        if SubPlogLines.FindSet then begin
            SubPlogLines."Achieved Target" := achievedtarget;
            SubPlogLines.Comments := comments;
            if SubPlogLines.Modify(true) then begin
                //    PlogLines.RESET;
                //    PlogLines.SETRANGE("PLog No.",plogno);
                //    PlogLines.SETRANGE("Initiative No.",initiativeno);
                //    IF PlogLines.FINDSET THEN BEGIN
                //      SubPlogLines1.RESET;
                //      SubPlogLines1.SETRANGE("PLog No.",PlogLines."PLog No.");
                //      SubPlogLines1.SETRANGE("Initiative No.",initiativeno);
                //      IF SubPlogLines1.FINDSET THEN BEGIN
                //        SubPlogLines1.CALCSUMS("Achieved Target");
                //        PlogLines."Achieved Target":=SubPlogLines1."Achieved Target";
                //        //calculate weight
                //        TotalWeight:=((PlogLines."Achieved Target"/PlogLines."Target Qty")*100)*PlogLines."Weight %";
                //        IF TotalWeight>PlogLines."Weight %" THEN
                //          TotalWeight:=PlogLines."Weight %";
                //          //PlogLines."Achieved Weight(%)":=TotalWeight;
                //          PlogLines.MODIFY(TRUE);
                //      END;
                //    END;
                status := 'success*The plog sub activity has been saved successfully';
            end else begin
                status := 'danger*The plog sub activity was not saved successfully, kindly try again!';
            end;
        end;
    end;

    procedure fnSendPlogApproval2(contractNo: Code[100]) status: Text
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, contractNo);
        PerformanceDiaryLog.SetRange("Approval Status", PerformanceDiaryLog."approval status"::Open);
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog."Approval Status" := PerformanceDiaryLog."approval status"::"Pending Approval";
            if PerformanceDiaryLog.Modify(true) then begin
                status := 'success*Your performance update was successfully send for approval*';
            end else begin
                status := 'danger*Your performance update was not send for approval, kindly try again!';
            end;
        end;
    end;

    procedure fnCancelPlogApproval2(contractNo: Code[100]) status: Text
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, contractNo);
        PerformanceDiaryLog.SetRange("Approval Status", PerformanceDiaryLog."approval status"::"Pending Approval");
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog."Approval Status" := PerformanceDiaryLog."approval status"::Open;
            if PerformanceDiaryLog.Modify(true) then begin
                status := 'success*Approval for performance update was successfully cancelled*';
            end else begin
                status := 'danger*Approval for performance update was not cancelled, kindly try again!';
            end;
        end;
    end;

    procedure fnGeneratePlogReport2(docNo: Code[100]) status: Text
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, docNo);
        if PerformanceDiaryLog.FindSet then begin
            if FILE.Exists(FILESPATH15 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH15 + docNo + '.pdf');
                //Report.SaveAsPdf(80011, FILESPATH15 + docNo + '.pdf', PerformanceDiaryLog);
                status := 'success*Generated*Downloads\PlogReport\' + docNo + '.pdf';
            end else begin
                //Report.SaveAsPdf(80011, FILESPATH15 + docNo + '.pdf', PerformanceDiaryLog);
                status := 'success*Generated*Downloads\PlogReport\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure FnSubmitSelectedAddPLogCategories(plogNumber: Code[50]; initiativeNumber: Code[50]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SecondaryPCObjective: Record "Secondary PC Objective";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, plogNumber);
        if PerformanceDiaryLog.FindSet then begin
            SecondaryPCObjective.Reset;
            SecondaryPCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            SecondaryPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            SecondaryPCObjective.SetRange("Initiative No.", initiativeNumber);
            if SecondaryPCObjective.FindSet then begin
                PlogLines.Init;

                PlogLines."PLog No." := PerformanceDiaryLog.No;
                PlogLines."Activity Type" := PlogLines."activity type"::"Secondary Activity";
                PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                PlogLines."AWP ID" := PerformanceDiaryLog."AWP ID";
                PlogLines."Board PC ID" := PerformanceDiaryLog."Board PC ID";
                PlogLines."Year Reporting Code" := PerformanceDiaryLog."Year Reporting Code";
                PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                PlogLines."Planned Date" := SecondaryPCObjective."Start Date";
                PlogLines."Due Date" := SecondaryPCObjective."Due Date";
                PlogLines."Achieved Date" := Today;
                PlogLines."Unit of Measure" := SecondaryPCObjective."Unit of Measure";
                //PlogLines."Outcome Perfomance Indicator":=SecondaryPCObjective."Outcome Perfomance Indicator";
                PlogLines."Initiative No." := SecondaryPCObjective."Initiative No.";
                PlogLines.Validate("Initiative No.");
                PlogLines."Sub Intiative No" := SecondaryPCObjective."Objective/Initiative";
                PlogLines."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                //PlogLines."Remaining Targets":=PCObjective."Imported Annual Target Qty"-PCObjective."Individual Achieved Targets";
                if PlogLines.Insert(true) then begin

                    //Sub Activities
                    SubPCObjective.Reset;
                    SubPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                    SubPCObjective.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                    if SubPCObjective.FindSet then begin
                        repeat
                            SubPlogLines.Init;
                            SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                            SubPlogLines."Activity Type" := SubPlogLines."activity type"::"Secondary Activity";
                            SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                            SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                            SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                            SubPlogLines."Initiative No." := SubPCObjective."Initiative No.";
                            SubPlogLines."Sub Initiative No." := SubPCObjective."Outcome Perfomance Indicator";
                            SubPlogLines.Description := SubPCObjective."Objective/Initiative";
                            SubPlogLines."Sub Initiative No." := SubPCObjective."Sub Initiative No.";
                            SubPlogLines."Unit of Measure" := SubPCObjective."Unit of Measure";
                            SubPlogLines."Planned Date" := SubPCObjective."Due Date";
                            SubPlogLines."Target Qty" := SubPCObjective."Sub Targets";
                            SubPlogLines.Validate("Initiative No.");
                            //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubPCObjective.Next = 0;
                    end;

                    status := 'success*The PlogLines was successfully submitted';
                end else begin
                    status := 'danger*The PlogLines were not successfully submitted, kindly try again!';
                end;
            end;
        end;
    end;

    procedure FnSubmitSelectedJDPLogCategories(plogNumber: Code[50]; initiativeNumber: Code[50]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCJobDescription: Record "PC Job Description";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, plogNumber);
        if PerformanceDiaryLog.FindSet then begin
            PCJobDescription.Reset;
            //PCJobDescription.SETRANGE("Strategy Plan ID",PerformanceDiaryLog."CSP ID");
            PCJobDescription.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCJobDescription.SetRange("Line Number", initiativeNumber);
            if PCJobDescription.FindSet then begin

                PlogLines.Init;
                PlogLines."PLog No." := PerformanceDiaryLog.No;
                PlogLines."Activity Type" := PlogLines."activity type"::"JD Activity";
                PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                PlogLines."AWP ID" := PerformanceDiaryLog."AWP ID";
                PlogLines."Board PC ID" := PerformanceDiaryLog."Board PC ID";
                PlogLines."Year Reporting Code" := PerformanceDiaryLog."Year Reporting Code";
                PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                PlogLines."Planned Date" := PCJobDescription."Start Date";
                PlogLines."Due Date" := PCJobDescription."Due Date";
                PlogLines."Achieved Date" := Today;
                PlogLines."Unit of Measure" := PCJobDescription."Unit of Measure";
                //PlogLines."Outcome Perfomance Indicator":=PCJobDescription."Outcome Perfomance Indicator";
                PlogLines."Initiative No." := Format(PCJobDescription."Line Number");
                PlogLines.Validate("Initiative No.");
                PlogLines."Sub Intiative No" := PCJobDescription.Description;
                if PlogLines.Insert(true) then begin



                    //Sub JD Plog Lines... Kisavi
                    SubJDObjective.Reset;
                    SubJDObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                    SubJDObjective.SetRange("Line Number", PCJobDescription."Line Number");
                    if SubJDObjective.FindSet then begin
                        repeat
                            SubPlogLines.Init;
                            SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                            SubPlogLines."Activity Type" := SubPlogLines."activity type"::"JD Activity";
                            SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                            SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                            SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                            SubPlogLines."Initiative No." := SubJDObjective."Line Number";
                            SubPlogLines."Sub Initiative No." := SubJDObjective."Sub Initiative No.";
                            SubPlogLines.Description := SubJDObjective.Description;
                            SubPlogLines."Unit of Measure" := SubJDObjective."Unit of Measure";
                            SubPlogLines."Planned Date" := SubJDObjective."Due Date";
                            SubPlogLines."Target Qty" := SubJDObjective."Sub Targets";
                            SubPlogLines."Due Date" := SubJDObjective."Due Date";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubJDObjective.Next = 0;
                    end;


                    status := 'success*The PlogLines was successfully submitted';
                end else begin
                    status := 'danger*The PlogLines were not successfully submitted, kindly try again!';
                end;
            end;
        end;
    end;

    procedure FnSubmitSelectedPLogCategories(plogNumber: Code[50]; initiativeNumber: Code[50]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        SubPCObjective: Record "Sub PC Objective";
        SubPlogLines: Record "Sub Plog Lines";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, plogNumber);
        if PerformanceDiaryLog.FindSet then begin
            PCObjective.Reset;
            PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCObjective.SetRange("Initiative No.", initiativeNumber);
            if PCObjective.FindSet then begin
                PlogLines.Init;
                PlogLines."PLog No." := PerformanceDiaryLog.No;
                PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                PlogLines."Initiative No." := PCObjective."Initiative No.";
                PlogLines."Unit of Measure" := PCObjective."Unit of Measure";
                //PlogLines."Outcome Perfomance Indicator":=PCObjective."Outcome Perfomance Indicator";
                PlogLines."Weight %" := PCObjective."Assigned Weight (%)";
                PlogLines.Validate("Initiative No.");
                PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                if PlogLines.Insert then begin

                    //Sub Activities
                    SubPCObjective.Reset;
                    SubPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                    SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                    if SubPCObjective.FindSet then begin
                        repeat
                            SubPlogLines.Init;
                            SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                            SubPlogLines."Activity Type" := SubPlogLines."activity type"::"Primary Activity";
                            SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                            SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                            SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                            SubPlogLines."Initiative No." := SubPCObjective."Initiative No.";
                            SubPlogLines."Sub Initiative No." := SubPCObjective."Outcome Perfomance Indicator";
                            SubPlogLines.Description := SubPCObjective."Objective/Initiative";
                            SubPlogLines."Sub Initiative No." := SubPCObjective."Sub Initiative No.";
                            SubPlogLines."Unit of Measure" := SubPCObjective."Unit of Measure";
                            SubPlogLines."Planned Date" := SubPCObjective."Due Date";
                            SubPlogLines."Target Qty" := SubPCObjective."Sub Targets";
                            SubPlogLines.Validate("Initiative No.");
                            //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubPCObjective.Next = 0;
                    end;

                    status := 'success*The PlogLines was successfully submitted';
                end else begin
                    status := 'danger*The PlogLines were not successfully submitted, kindly try again!';
                end;
            end;
        end;

    end;

    procedure FnNewStandardAppraisal(docNo: Code[100]; empNo: Code[100]; strategicPlan: Code[100]; Pmp: Code[100]; Tasks: Code[100]; supervisor: Code[100]; description: Text; personalSC: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        PerfomanceEvaluation.SetRange("Employee No.", empNo);
        PerfomanceEvaluation.SetRange("Approval Status", PerfomanceEvaluation."approval status"::Open);
        if PerfomanceEvaluation.FindSet then begin
            PerfomanceEvaluation."Strategy Plan ID" := strategicPlan;
            PerfomanceEvaluation.Validate("Strategy Plan ID");
            PerfomanceEvaluation."Performance Mgt Plan ID" := Pmp;
            PerfomanceEvaluation.Validate("Performance Mgt Plan ID");
            PerfomanceEvaluation."Performance Task ID" := Tasks;
            PerfomanceEvaluation.Validate("Performance Task ID");
            PerfomanceEvaluation."Personal Scorecard ID" := personalSC;
            PerfomanceEvaluation.Validate("Personal Scorecard ID");
            PerfomanceEvaluation."Supervisor Staff No." := supervisor;
            PerfomanceEvaluation.Validate("Supervisor Staff No.");
            PerfomanceEvaluation.Description := description;
            if PerfomanceEvaluation.Modify(true) then begin
                FnLoadCompetencies(PerfomanceEvaluation.No);
                FnAppraisalSuggestObjectivesOutcomes(PerfomanceEvaluation.No);
                status := 'success*New appraisal created*' + PerfomanceEvaluation.No;
            end else begin
                status := 'danger*New appraisal was not created*';
            end;
        end else begin
            PerfomanceEvaluation.Init;
            PerfomanceEvaluation."Employee No." := empNo;
            PerfomanceEvaluation.Validate("Employee No.");
            PerfomanceEvaluation."Strategy Plan ID" := strategicPlan;
            PerfomanceEvaluation.Validate("Strategy Plan ID");
            PerfomanceEvaluation."Performance Mgt Plan ID" := Pmp;
            PerfomanceEvaluation.Validate("Performance Mgt Plan ID");
            PerfomanceEvaluation."Performance Task ID" := Tasks;
            PerfomanceEvaluation.Validate("Performance Task ID");
            PerfomanceEvaluation."Personal Scorecard ID" := personalSC;
            PerfomanceEvaluation.Validate("Personal Scorecard ID");
            PerfomanceEvaluation."Supervisor Staff No." := supervisor;
            PerfomanceEvaluation.Validate("Supervisor Staff No.");
            PerfomanceEvaluation.Description := description;
            if PerfomanceEvaluation.Insert(true) then begin
                FnLoadCompetencies(PerfomanceEvaluation.No);
                FnAppraisalSuggestObjectivesOutcomes(PerfomanceEvaluation.No);
                status := 'success*New appraisal created*' + PerfomanceEvaluation.No;
            end else begin
                status := 'danger*New appraisal was not created*';
            end;
        end;
    end;

    procedure FnLoadCompetencies(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        SPMGeneralSetup: Record "SPM General Setup";
        AchievedTarget: Decimal;
        PlogLines: Record "Plog Lines";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PCJobDescription: Record "PC Job Description";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            CompetencyLines.SetRange("Competency Template ID", PerfomanceEvaluation."Competency Template ID");
            if CompetencyLines.FindSet then begin
                repeat
                    ProEvaluation.Init;
                    ProEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                    ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                    ProEvaluation."Competency Template ID" := PerfomanceEvaluation."Competency Template ID";
                    ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                    ProEvaluation.Validate("Competency Code");
                    ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                    ProEvaluation.Description := CompetencyLines.Description;
                    ProEvaluation."Profiency Rating Scale" := PerfomanceEvaluation."Proficiency Rating Scale";
                    ProEvaluation."Target Qty" := CompetencyLines."Weight %";
                    ProEvaluation."Weight %" := CompetencyLines."Weight %";
                    ProEvaluation.Insert(true);
                until CompetencyLines.Next = 0;
            end;
        end;

    end;

    procedure fnSubmitStandardAppraisal(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            PerfomanceEvaluation."Document Status" := PerfomanceEvaluation."document status"::Evaluation;
            PerfomanceEvaluation."Approval Status" := PerfomanceEvaluation."approval status"::Released;
            if PerfomanceEvaluation.Modify(true) then begin
                status := 'success*Your appraisal has been sent to your supervisor for review';
            end else begin
                status := 'danger*Your appraisal could not be sent to your supervisor for review, kindy try again!';
            end;
        end;
    end;

    procedure FnAppraisalSuggestObjectivesOutcomes(docNo: Code[100]) status: Text
    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        SPMGeneralSetup: Record "SPM General Setup";
        AchievedTarget: Decimal;
        PlogLines: Record "Plog Lines";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PCJobDescription: Record "PC Job Description";
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            SPMGeneralSetup.Get;
            SPMGeneralSetup.TestField("Appraisal Based On");

            if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Direct Input" then begin
                SPMGeneralSetup.Get();
                if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if PCObjective.FindFirst then begin
                        repeat
                            PCObjective.TestField("Due Date");
                        until PCObjective.Next = 0;
                    end;

                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    PCObjective.TestField("Due Date");
                    PCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCObjective.FindFirst then begin
                        repeat
                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                        until PCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                            SecondaryPCObjective.TestField("Due Date");
                        until SecondaryPCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    SecondaryPCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                        until SecondaryPCObjective.Next = 0;
                    end;
                end;

                if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                    PCJobDescription.Reset;
                    PCJobDescription.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    PCJobDescription.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCJobDescription.FindFirst then begin
                        repeat
                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                            ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                            ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                        until PCJobDescription.Next = 0;
                    end;
                end;
            end;

            if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Plog Input" then begin
                SPMGeneralSetup.Get();
                if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if PCObjective.FindFirst then begin
                        repeat
                            PCObjective.TestField("Due Date");
                        until PCObjective.Next = 0;
                    end;

                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    //PCObjective.TESTFIELD("Due Date");
                    PCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCObjective.FindFirst then begin
                        repeat
                            AchievedTarget := 0;
                            PlogLines.Reset;
                            PlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
                            PlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
                            PlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            PlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            if AchievedTarget = 0 then
                                Error('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first', PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");

                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                            ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                            ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                            ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                            ObjectiveOutcome.Validate("Final/Actual Qty");
                            ObjectiveOutcome.Insert;
                        until PCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                            SecondaryPCObjective.TestField("Due Date");
                        until SecondaryPCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    SecondaryPCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                            AchievedTarget := 0;
                            PlogLines.Reset;
                            PlogLines.SetRange("Personal Scorecard ID", SecondaryPCObjective."Workplan No.");
                            PlogLines.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                            PlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            PlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            if AchievedTarget = 0 then
                                Error('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first', PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");


                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                            ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                            ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                            ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                        until SecondaryPCObjective.Next = 0;
                    end;
                end;
                if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                    PCJobDescription.Reset;
                    PCJobDescription.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    PCJobDescription.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCJobDescription.FindFirst then begin
                        repeat
                            AchievedTarget := 0;
                            PlogLines.Reset;
                            PlogLines.SetRange("Personal Scorecard ID", PCJobDescription."Workplan No.");
                            PlogLines.SetRange("Initiative No.", Format(PCJobDescription."Line Number"));
                            PlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            PlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            if AchievedTarget = 0 then
                                Error('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first', PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");

                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                            ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                            ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
                            ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                            ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                            ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                            ObjectiveOutcome.Validate("Final/Actual Qty");
                            ObjectiveOutcome.Insert(true);
                        until PCJobDescription.Next = 0;
                    end;
                end;
            end;
        end;
    end;

    local procedure FnGetLastLineNo() LineNumber: Integer
    var
        Billable: Record "Objective Evaluation Result";
    begin
        Billable.Reset;
        if Billable.Find('+') then
            LineNumber := Billable."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoB() LineNumber: Integer
    var
        ProEvalution: Record "Proficiency Evaluation Result";
    begin
        ProEvalution.Reset;
        if ProEvalution.Find('+') then
            LineNumber := ProEvalution."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    procedure fnGenerateStandardAppraisalReport(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            if FILE.Exists(FILESPATH14 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH14 + docNo + '.pdf');
                //Report.SaveAsPdf(80016, FILESPATH14 + docNo + '.pdf', PerfomanceEvaluation);
                status := 'success*Generated*Downloads\StandardAppraisalReport\' + docNo + '.pdf';
            end else begin
                //Report.SaveAsPdf(80016, FILESPATH14 + docNo + '.pdf', PerfomanceEvaluation);
                status := 'success*Generated*Downloads\StandardAppraisalReport\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure FnAddInnovationResponse(applicationNo: Code[50]; InnovationNo: Code[50]; Category: Code[50]; department: Code[50]; description: Text; ExecutiveSummery: Text; employeeNo: Code[50]) status: Text
    var
        InnovationResponseHeader: Record "Innovation Solicitation";
        InnovationResponseLine: Record "Innovation Solicitation Line";
    begin

        status := 'danger*Your Innovation Idea could not be captured';
        if applicationNo = '' then begin //new imprest surrender
            InnovationResponseHeader.Init;
            InnovationResponseHeader."Document Type" := InnovationResponseHeader."document type"::"Idea Response";
            InnovationResponseHeader."Invitation ID" := InnovationNo;
            InnovationResponseHeader."Innovation Category" := Category;
            InnovationResponseHeader."Department ID" := department;
            InnovationResponseHeader.Validate("Department ID");
            InnovationResponseHeader.Description := description;
            InnovationResponseHeader."Executive Summary" := ExecutiveSummery;
            InnovationResponseHeader."Idea Originator" := employeeNo;
            InnovationResponseHeader.Validate("Idea Originator");
            //  InnovationResponseHeader."Innovation Lead":=employeeNo;
            //  InnovationResponseHeader.VALIDATE("Innovation Lead");
            InnovationResponseHeader."Document Date" := Today;
            InnovationResponseHeader."Portal Status" := InnovationResponseHeader."portal status"::Draft;

            if InnovationResponseHeader.Insert(true) then begin

                InnovationResponseHeader.Modify(true);
                status := 'success*Your Innovation Idea was successfully captured*' + InnovationResponseHeader."Document No";

            end;
        end else begin //existing
            InnovationResponseHeader.Reset;
            InnovationResponseHeader.SetRange("Document No", applicationNo);
            InnovationResponseHeader.SetRange("Idea Originator", employeeNo);
            InnovationResponseHeader.SetRange("Portal Status", InnovationResponseHeader."portal status"::Draft);
            if InnovationResponseHeader.FindSet then begin
                InnovationResponseHeader."Document Type" := InnovationResponseHeader."document type"::"Idea Response";
                //  InnovationResponseHeader."Invitation ID":=InnovationNo;
                //  InnovationResponseHeader."Innovation Category":=Category;
                InnovationResponseHeader."Department ID" := department;
                InnovationResponseHeader.Validate("Department ID");
                InnovationResponseHeader.Description := description;
                InnovationResponseHeader."Executive Summary" := ExecutiveSummery;
                //InnovationResponseHeader."Idea Originator":=employeeNo;
                //InnovationResponseHeader.VALIDATE("Idea Originator");
                //InnovationResponseHeader."Innovation Lead":=employeeNo;
                //InnovationResponseHeader.VALIDATE("Innovation Lead");
                InnovationResponseHeader."Document Date" := Today;
                InnovationResponseHeader."Portal Status" := InnovationResponseHeader."portal status"::Draft;
                if InnovationResponseHeader.Modify(true) then begin

                    InnovationResponseHeader.Modify(true);
                    status := 'success*Your Innovation Idea was successfully updated *' + InnovationResponseHeader."Document No";
                end;
            end else begin
                status := 'danger*An Innovation Idea with the given code does not exist, you are not the owner or is no longer open';
            end;
        end;
    end;

    procedure FnAddInnovationResponseLines(ApplicationNo: Code[50]; Description: Text; employeeNo: Code[50]) status: Text
    var
        InnovationHeader: Record "Innovation Solicitation";
        InnovationLine: Record "Innovation Solicitation Line";
    begin
        status := 'danger*Your Innovation Response Line could not be added';
        InnovationHeader.Reset;
        InnovationHeader.SetRange("Document No", ApplicationNo);
        InnovationHeader.SetRange(Status, InnovationHeader.Status::Open);
        InnovationHeader.SetRange("Portal Status", InnovationHeader."portal status"::Draft);
        InnovationHeader.SetRange("Idea Originator", employeeNo);
        if InnovationHeader.FindSet then begin
            if (InnovationHeader."Document Type" = InnovationHeader."document type"::"Idea Response") then begin
                //add line
                InnovationLine.Init;
                //Document Type,Document No.,Line No.

                InnovationLine."Document Type" := InnovationLine."document type"::"Idea Response";
                InnovationLine."Record Type" := InnovationLine."record type"::Overview;
                InnovationLine."Document No" := ApplicationNo;
                InnovationLine.Validate("Document No");
                InnovationLine."Line No." := getInnovationLineNo(ApplicationNo, InnovationLine."Document Type");
                InnovationLine.Validate("Line No.");
                InnovationLine.Description := Description;


                if InnovationLine.Insert(true) then begin

                    InnovationLine.Modify(true);
                    status := 'success*The Idea Overview was successfully added';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Idea Overview could not be added';
                end;
            end;
        end else begin
            status := 'danger*An Innovation Idea with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    local procedure getInnovationLineNo(applicationNo: Code[50]; DocumentType: Option): Integer
    var
        InnovationLine: Record "Innovation Solicitation Line";
        lineNo: Integer;
    begin
        lineNo := 0;
        InnovationLine.Reset;
        InnovationLine.SetRange("Document No", applicationNo);
        InnovationLine.SetRange("Document Type", DocumentType);
        if InnovationLine.FindSet then begin
            repeat
                if InnovationLine."Line No." > lineNo then begin
                    lineNo := InnovationLine."Line No.";
                end;
            until InnovationLine.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure FnAddInnovationObjectiveResponseLines(ApplicationNo: Code[50]; Description: Text; employeeNo: Code[50]) status: Text
    var
        InnovationHeader: Record "Innovation Solicitation";
        InnovationLine: Record "Innovation Solicitation Line";
    begin
        status := 'danger*Your Innovation Response Line could not be added';
        InnovationHeader.Reset;
        InnovationHeader.SetRange("Document No", ApplicationNo);
        InnovationHeader.SetRange(Status, InnovationHeader.Status::Open);
        InnovationHeader.SetRange("Portal Status", InnovationHeader."portal status"::Draft);
        InnovationHeader.SetRange("Idea Originator", employeeNo);
        if InnovationHeader.FindSet then begin
            if (InnovationHeader."Document Type" = InnovationHeader."document type"::"Idea Response") then begin
                //add line
                InnovationLine.Init;
                //Document Type,Document No.,Line No.

                InnovationLine."Document Type" := InnovationLine."document type"::"Idea Response";
                InnovationLine."Record Type" := InnovationLine."record type"::Objective;
                InnovationLine."Document No" := ApplicationNo;
                InnovationLine.Validate("Document No");
                InnovationLine."Line No." := getInnovationLineNo(ApplicationNo, InnovationLine."Document Type");
                InnovationLine.Validate("Line No.");
                InnovationLine.Description := Description;


                if InnovationLine.Insert(true) then begin

                    InnovationLine.Modify(true);
                    status := 'success*The Idea Objective was successfully added';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Idea Objective could not be added';
                end;
            end;
        end else begin
            status := 'danger*An Innovation Idea with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    procedure FnAddInnovationAdditionalResponseLines(ApplicationNo: Code[50]; Description: Text; employeeNo: Code[50]) status: Text
    var
        InnovationHeader: Record "Innovation Solicitation";
        InnovationLine: Record "Innovation Solicitation Line";
    begin
        status := 'danger*Your Innovation Response Line could not be added';
        InnovationHeader.Reset;
        InnovationHeader.SetRange("Document No", ApplicationNo);
        InnovationHeader.SetRange(Status, InnovationHeader.Status::Open);
        InnovationHeader.SetRange("Portal Status", InnovationHeader."portal status"::Draft);
        InnovationHeader.SetRange("Idea Originator", employeeNo);
        if InnovationHeader.FindSet then begin
            if (InnovationHeader."Document Type" = InnovationHeader."document type"::"Idea Response") then begin
                //add line
                InnovationLine.Init;
                //Document Type,Document No.,Line No.

                InnovationLine."Document Type" := InnovationLine."document type"::"Idea Response";
                InnovationLine."Record Type" := InnovationLine."record type"::"Additional Notes";
                InnovationLine."Document No" := ApplicationNo;
                InnovationLine.Validate("Document No");
                InnovationLine."Line No." := getInnovationLineNo(ApplicationNo, InnovationLine."Document Type");
                InnovationLine.Validate("Line No.");
                InnovationLine.Description := Description;


                if InnovationLine.Insert(true) then begin

                    InnovationLine.Modify(true);
                    status := 'success*The Idea Additional Response was successfully added';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Idea Additional Response could not be added';
                end;
            end;
        end else begin
            status := 'danger*An Innovation Idea with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    procedure editInnovationOverview(ApplicationNo: Code[50]; Description: Text; employeeNo: Code[50]; lineNo: Integer) status: Text
    var
        InnovationLines: Record "Innovation Solicitation Line";
        InnovationHeader: Record "Innovation Solicitation";
    begin
        status := 'danger*The Idea Overview could not be added';
        InnovationHeader.Reset;
        InnovationHeader.SetRange("Document No", ApplicationNo);
        InnovationHeader.SetRange("Portal Status", InnovationHeader."portal status"::Draft);
        InnovationHeader.SetRange(Status, InnovationHeader.Status::Open);
        InnovationHeader.SetRange("Idea Originator", employeeNo);

        if InnovationHeader.FindSet then begin
            InnovationLines.Reset;
            InnovationLines.SetRange("Document Type", InnovationLines."document type"::"Idea Response");
            InnovationLines.SetRange("Document No", ApplicationNo);
            InnovationLines.SetRange("Line No.", lineNo);
            if InnovationLines.FindSet then begin
                InnovationLines.Description := Description;
                if InnovationLines.Modify(true) then begin
                    status := 'success*The Idea description was successfully updated';
                end else begin
                    status := 'danger*The Idea Overview could not be added';
                end;
            end;

        end;
    end;

    procedure editInnovationObjective(ApplicationNo: Code[50]; Description: Text; employeeNo: Code[50]) status: Text
    var
        InnovationLines: Record "Innovation Solicitation Line";
        InnovationHeader: Record "Innovation Solicitation";
    begin
        status := 'danger*The Idea Overview could not be added';
        InnovationHeader.Reset;
        InnovationHeader.SetRange("Document No", ApplicationNo);
        InnovationHeader.SetRange("Portal Status", InnovationHeader."portal status"::Draft);
        InnovationHeader.SetRange(Status, InnovationHeader.Status::Open);

        if InnovationHeader.FindSet then begin
            InnovationLines."Document Type" := InnovationLines."document type"::"Idea Response";
            InnovationLines."Record Type" := InnovationLines."record type"::Objective;
            InnovationLines.Description := InnovationLines.Description;

            if InnovationLines.Modify(true) then begin
                status := 'success*The Idea Overview was successfully updated';
            end else begin
                status := 'danger*The Idea Overview could not be added';
            end;

        end;
    end;

    procedure editInnovationAdditionNotes(ApplicationNo: Code[50]; Description: Text; employeeNo: Code[50]; lineNo: Integer) status: Text
    var
        InnovationLines: Record "Innovation Solicitation Line";
        InnovationHeader: Record "Innovation Solicitation";
    begin
        status := 'danger*The Idea Overview could not be added';
        InnovationHeader.Reset;
        InnovationHeader.SetRange("Document No", ApplicationNo);
        InnovationHeader.SetRange("Portal Status", InnovationHeader."portal status"::Draft);
        InnovationHeader.SetRange(Status, InnovationHeader.Status::Open);

        if InnovationHeader.FindSet then begin
            InnovationLines."Document Type" := InnovationLines."document type"::"Idea Response";
            InnovationLines."Record Type" := InnovationLines."record type"::"Additional Notes";
            InnovationLines.Description := InnovationLines.Description;

            if InnovationLines.Modify(true) then begin
                status := 'success*The Idea Overview was successfully updated';
            end else begin
                status := 'danger*The Idea Overview could not be added';
            end;

        end;
    end;

    procedure deleteInnovationResponseLine(employeeNo: Code[250]; applicationNo: Code[250]; lineNo: Integer) status: Text
    begin
        status := 'danger*Your Requisition Line could not be deleted';
        InnovationHeader.Reset;
        InnovationHeader.SetRange("Idea Originator", employeeNo);
        InnovationHeader.SetRange(Status, InnovationHeader.Status::Open);
        InnovationHeader.SetRange("Portal Status", InnovationHeader."portal status"::Draft);
        InnovationHeader.SetRange("Document No", applicationNo);
        if InnovationHeader.FindSet then begin
            InnovationLines.Reset;
            InnovationLines.SetRange("Document Type", InnovationLines."document type"::"Idea Response");
            InnovationLines.SetRange("Document No", applicationNo);
            InnovationLines.SetRange("Line No.", lineNo);
            if InnovationLines.FindSet then begin
                if InnovationLines.Delete(true) then begin
                    status := 'success*The Idea Response Line was successfully deleted';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Idea Response Line could not be deleted';
                end;
            end else begin
                status := 'danger*The idea Response Line does not exist' + Format(lineNo);
            end;
        end else begin
            status := 'danger*An Idea Response with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    procedure GenerateInnovationReport(applicationNo: Code[50]) status: Text
    begin
        status := 'danger*could not generate your Innovation Response Report';
        InnovationHeader.Reset;
        InnovationHeader.SetRange("Document No", applicationNo);
        if InnovationHeader.FindSet then begin
            InnovationHeader.Reset;
            InnovationHeader.SetRange(InnovationHeader."Document No", applicationNo);

            if InnovationHeader.FindSet then begin

                if FILE.Exists(FILESPATH25 + applicationNo + '.pdf') then begin
                    FILE.Erase(FILESPATH25 + applicationNo + '.pdf');
                    //Report.SaveAsPdf(89028, FILESPATH25 + applicationNo + '.pdf', InnovationHeader);
                    status := 'success*Generated*downloads\InnovationReport\' + applicationNo + '.pdf';
                end
                else begin
                    //Report.SaveAsPdf(89028, FILESPATH25 + applicationNo + '.pdf', InnovationHeader);
                    status := 'success*Generated*downloads\InnovationReport\' + applicationNo + '.pdf';
                end

            end;
        end
        else begin
            status := 'danger*Innvation Report not found';
        end;
    end;

    procedure FnSubmitResponse(applicationNo: Code[50]) status: Text
    begin
        status := 'danger*The Innovation idea could not be added';
        InnovationHeader.Reset;
        InnovationHeader.SetRange("Document No", applicationNo);
        InnovationHeader.SetRange("Portal Status", InnovationHeader."portal status"::Draft);
        InnovationHeader.SetRange(Status, InnovationHeader.Status::Open);

        if InnovationHeader.FindSet then begin
            //InnovationHeader."Document Type":= InnovationHeader."Document Type"::"Idea Response";
            InnovationHeader."Portal Status" := InnovationHeader."portal status"::Submitted;

            if InnovationHeader.Modify(true) then begin
                status := 'success*The Innovation idea was successfully Submitted';
            end else begin
                status := 'danger*The Innovation Idea could not be submitted';
            end;

        end;
    end;

    procedure SalaryAdvanceApplication(applicationNo: Code[50]; EmployeeNo: Code[50]; divisionCode: Code[50]; branchCode: Code[50]; salaryAdvanceAmount: Decimal; monthsDeducted: Integer; purpose: Text; recoveryStartmonth: Code[50]; recoveryStartDate: Date) status: Text
    var
        salaryAdvance: Record Payments;
    begin
        status := 'danger*Your Salary Advance application failed';
        Employee.Reset;
        Employee.SetRange("No.", EmployeeNo);
        if Employee.FindSet then begin

            if applicationNo = '' then begin //a new leave
                salaryAdvance.Init;
                salaryAdvance."Payment Type" := salaryAdvance."payment type"::"Salary Advance";
                salaryAdvance."Document Type" := salaryAdvance."document type"::"Salary Advance";
                salaryAdvance."Account Type" := salaryAdvance."account type"::Employee;
                salaryAdvance."Account No." := EmployeeNo;
                salaryAdvance.Validate("Account No.");
                salaryAdvance."Shortcut Dimension 1 Code" := branchCode;
                salaryAdvance.Validate("Shortcut Dimension 1 Code");
                salaryAdvance."Shortcut Dimension 2 Code" := divisionCode;
                salaryAdvance.Validate("Shortcut Dimension 2 Code");
                salaryAdvance."Salary Advance" := salaryAdvanceAmount;
                salaryAdvance.Purpose := purpose;
                salaryAdvance."No of months deducted" := monthsDeducted;
                salaryAdvance.Validate("No of months deducted");
                salaryAdvance."Recovery Start Month" := recoveryStartmonth;
                salaryAdvance."Recovery From" := recoveryStartDate;
                salaryAdvance.Date := Today;
                salaryAdvance."Payroll Deduction Code" := 'D23';

                if salaryAdvance.Insert(true) then begin

                    status := 'success*Your Salary Advance Application was successfully placed *' + salaryAdvance."No.";

                end;
            end else begin //existing leave application
                salaryAdvance.Reset;
                salaryAdvance.SetRange("Account No.", EmployeeNo);
                salaryAdvance.SetRange("No.", applicationNo);
                salaryAdvance.SetRange(Status, salaryAdvance.Status::Open);
                if salaryAdvance.FindSet then begin
                    salaryAdvance."Salary Advance" := salaryAdvanceAmount;
                    salaryAdvance.Purpose := purpose;
                    salaryAdvance."No of months deducted" := monthsDeducted;
                    salaryAdvance.Validate("No of months deducted");
                    salaryAdvance."Recovery Start Month" := recoveryStartmonth;
                    salaryAdvance."Recovery From" := recoveryStartDate;
                    if salaryAdvance.Modify(true) then begin

                        status := 'success*Your Salary Advance Application was successfully placed *' + salaryAdvance."No.";

                    end;
                end else begin
                    status := 'danger*A Salary Advance Application with the given code does not exist, you are not the owner or is no longer open';
                end;
            end;
        end else begin
            status := 'danger*The selected employee does not exist';
        end;
    end;

    procedure SendSalaryAdvanceApproval(employeeNo: Code[50]; applicationNo: Code[50]) status: Text
    var
        salaryAdvance: Record Payments;
    begin
        status := 'danger*The Salary Advance could not be sent for approval';
        salaryAdvance.Reset;
        salaryAdvance.SetRange("Account No.", employeeNo);
        salaryAdvance.SetRange("No.", applicationNo);
        if salaryAdvance.FindSet then begin
            salaryAdvance.TestField(Status, salaryAdvance.Status::Open);
            salaryAdvance.TestField("Salary Advance");
            salaryAdvance.TestField(Purpose);
            salaryAdvance.TestField("No of months deducted");
            salaryAdvance.TestField("Recovery Start Month");

            Payroll3.FnCheckAthirdRule(salaryAdvance);
            //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(salaryAdvance) then
            //ApprovalsMgmt.OnSendPaymentsForApproval(salaryAdvance);

            salaryAdvance.Reset;
            salaryAdvance.SetRange("Account No.", employeeNo);
            salaryAdvance.SetRange("No.", applicationNo);
            if salaryAdvance.FindSet then begin
                if salaryAdvance.Status = salaryAdvance.Status::"Pending Approval" then begin
                    status := 'success*The salary Advance was successfully sent for approval';
                end;
            end;

        end else begin
            status := 'danger*A Salary Advance with the given number does not exist, is no longer open or you are not the owner';
        end;
        exit(status);
    end;

    procedure CarLoanApplication(applicationNo: Code[50]; EmployeeNo: Code[50]; divisionCode: Code[50]; branchCode: Code[50]; carloanAmount: Decimal; monthsDeducted: Integer; purpose: Text; recoveryStartmonth: Date; loanVendor: Code[50]) status: Text
    var
        CarLoanApp: Record Payments;
    begin
        status := 'danger*Your Car Loan Application failed';
        Employee.Reset;
        Employee.SetRange("No.", EmployeeNo);
        if Employee.FindSet then begin

            if applicationNo = '' then begin //a new leave
                CarLoanApp.Init;
                CarLoanApp."Payment Type" := CarLoanApp."payment type"::"Car Loan";
                //CarLoanApp."Document Type":=CarLoanApp."Document Type"::
                CarLoanApp."Account Type" := CarLoanApp."account type"::Employee;
                CarLoanApp."Account No." := EmployeeNo;
                CarLoanApp.Validate("Account No.");
                CarLoanApp."Shortcut Dimension 1 Code" := branchCode;
                CarLoanApp.Validate("Shortcut Dimension 1 Code");
                CarLoanApp."Shortcut Dimension 2 Code" := divisionCode;
                CarLoanApp.Validate("Shortcut Dimension 2 Code");
                CarLoanApp."Salary Advance" := carloanAmount;
                CarLoanApp.Purpose := purpose;
                CarLoanApp."No of months deducted" := monthsDeducted;
                CarLoanApp.Validate("No of months deducted");
                CarLoanApp."Recovery Month" := recoveryStartmonth;
                CarLoanApp.Validate("Recovery Month");
                //CarLoanApp."Recovery From":=recoveryStartDate;
                CarLoanApp."Loan Vendor" := loanVendor;
                CarLoanApp.Validate("Loan Vendor");
                CarLoanApp.Date := Today;
                CarLoanApp."Payroll Deduction Code" := 'D22';

                if CarLoanApp.Insert(true) then begin

                    status := 'success*Your Car Loan Application was successfully placed *' + CarLoanApp."No.";

                end;
            end else begin //existing leave application
                CarLoanApp.Reset;
                CarLoanApp.SetRange("Account No.", EmployeeNo);
                CarLoanApp.SetRange("No.", applicationNo);
                CarLoanApp.SetRange(Status, CarLoanApp.Status::Open);
                if CarLoanApp.FindSet then begin
                    CarLoanApp."Salary Advance" := carloanAmount;
                    CarLoanApp.Purpose := purpose;
                    CarLoanApp."No of months deducted" := monthsDeducted;
                    CarLoanApp.Validate("No of months deducted");
                    CarLoanApp."Recovery Month" := recoveryStartmonth;
                    CarLoanApp.Validate("Recovery Month");
                    // CarLoanApp."Recovery From":=recoveryStartDate;
                    CarLoanApp."Loan Vendor" := loanVendor;
                    CarLoanApp.Validate("Loan Vendor");
                    if CarLoanApp.Modify(true) then begin

                        status := 'success*Your Car Loan Application was successfully placed *' + CarLoanApp."No.";

                    end;
                end else begin
                    status := 'danger*A Car Loan Application with the given code does not exist, you are not the owner or is no longer open';
                end;
            end;
        end else begin
            status := 'danger*The selected employee does not exist';
        end;
    end;

    procedure SendCarLoanApproval(employeeNo: Code[50]; applicationNo: Code[50]) status: Text
    var
        CarLoanApp: Record Payments;
    begin
        status := 'danger*The Salary Advance could not be sent for approval';
        CarLoanApp.Reset;
        CarLoanApp.SetRange("Account No.", employeeNo);
        CarLoanApp.SetRange("No.", applicationNo);
        if CarLoanApp.FindSet then begin
            CarLoanApp.TestField(Status, CarLoanApp.Status::Open);
            CarLoanApp.TestField("Salary Advance");
            CarLoanApp.TestField(Purpose);
            CarLoanApp.TestField("No of months deducted");
            CarLoanApp.TestField("Recovery Start Month");

            Payroll3.FnCheckAthirdRule(CarLoanApp);

            //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(CarLoanApp) then
            //ApprovalsMgmt.OnSendPaymentsForApproval(CarLoanApp);

            CarLoanApp.Reset;
            CarLoanApp.SetRange("Account No.", employeeNo);
            CarLoanApp.SetRange("No.", applicationNo);
            if CarLoanApp.FindSet then begin
                if CarLoanApp.Status = CarLoanApp.Status::"Pending Approval" then begin
                    status := 'success*The Car Loan was successfully sent for approval';
                end;
            end;

        end else begin
            status := 'danger*A Car Loan with the given number does not exist, is no longer open or you are not the owner';
        end;
        exit(status);
    end;

    procedure SendStudentResultSlip(StudentRegNo: Code[50]; ExamSittingId: Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
        Cust: Record Customer;
        ExaminationResults: Record "Examination Results";
        ResultSlipReport: Report "Result Slip";
        ExaminationAcounts: Record "Examination Account";
    begin
        ExaminationResults.Reset;
        ExaminationResults.SetRange("Student Reg No.", StudentRegNo);
        ExaminationResults.SetRange("Examination Sitting ID", ExamSittingId);
        if ExaminationResults.FindSet then begin

            appNo := ConvertStr(StudentRegNo, '-', '_');
            appNo := ConvertStr(StudentRegNo, ':', '_');
            appNo := ConvertStr(StudentRegNo, '/', '_');

            if FILE.Exists(FILESPATH5 + appNo + '.pdf') then begin
                FILE.Erase(FILESPATH5 + appNo + '.pdf');

                //Report.SaveAsPdf(85016, FILESPATH5 + appNo + '.pdf', ExaminationResults);
                FileName := 'ResultSlip' + '.pdf';
                SMTPMailSetup.Get;
                //Email2 := SMTPMailSetup."Email Sender Address";
                Body := 'Result Slip';
                //SMTP.Create('Result Slip', Email2, ExaminationResults.Email,
                // 'Result Slip',
                //'Dear ' + ExaminationResults."Student Name" + ',<BR><BR>' +
                //'Please find Attached your Result Slip.<b>' + '</b><BR>' +
                //'Use the following link to access the Student Portal.' + ' ' + '<b><a href="https://online.kasneb.or.ke/">Student Portal</a></b><BR>'
                // + '<BR>'
                // , true);
                //SMTP.AddAttachment(FILESPATH5 + appNo + '.pdf', FileName);
                //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examination <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
                //SMTP.Send();

                status := 'success* The Student Result Slip has been sent successfully';

            end else begin
                //Report.SaveAsPdf(85016, FILESPATH5 + appNo + '.pdf', ExaminationResults);
                FileName := 'ResultSlip' + '.pdf';
                SMTPMailSetup.Get;
                //Email2 := SMTPMailSetup."Email Sender Address";
                Body := 'Result Slip';
                //SMTP.Create('Result Slip', Email2, ExaminationResults.Email,
                // 'Result Slip',
                //'Dear ' + ExaminationResults."Student Name" + ',<BR><BR>' +
                //'Please find Attached your Result Slip.<b>' + '</b><BR>' +
                //'Use the following link to access the Student Portal.' + ' ' + '<b><a href="https://online.kasneb.or.ke/">Student Portal</a></b><BR>'
                // + '<BR>'
                // , true);
                ////SMTP.AddBCC(HRSetupNew."Student Module EMail BCC");
                //SMTP.AddAttachment(FILESPATH5 + appNo + '.pdf', FileName);
                //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examination <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
                //SMTP.Send();
                status := 'success*The Student Result Slip has been sent successfully';
            end
        end else begin
            status := 'danger*The Result Slip could not be generated';
        end;

    end;

    local procedure fnPaperFailed(stNo: Text) papers: Text
    var
        bookingEntries: Record "Exam Booking Entries";
    begin
        bookingEntries.Reset;
        bookingEntries.SetRange("Student Reg No.", stNo);
        //IF bookingEntries.Status::Failed
    end;

    procedure FnAddSetterQuestionLine(appNo: Code[50]; topic: Code[30]; reference: Text) status: Text
    var
        SetterHeader: Record "Setter Header";
        ExaminationReviewLines: Record "Examination Review Lines";
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", appNo);
        if SetterHeader.FindSet then begin
            ExaminationReviewLines.Reset;
            ExaminationReviewLines.SetRange("Document No.", appNo);
            if ExaminationReviewLines.FindSet then begin
                ExaminationReviewLines."Topic Code" := topic;
                ExaminationReviewLines.References := reference;
                if ExaminationReviewLines.Modify(true) then begin
                    status := 'success*References added successfully';
                end
            end else begin
                status := 'danger*Paper not found!!';
            end
        end else begin
            status := 'danger*Question not found!!';
        end
    end;

    procedure GenerateRMReport() status: Text
    begin
        if FILE.Exists(FILESPATH99 + 'risk_report' + '.pdf') then begin
            FILE.Erase(FILESPATH99 + 'risk_report' + '.pdf');
            //Report.SaveAsPdf(95000, FILESPATH99 + 'risk_report' + '.pdf');
            status := 'success*Generated*Downloads\RiskReport\' + 'risk_report' + '.pdf';
        end else begin
            //Report.SaveAsPdf(95000, FILESPATH99 + 'risk_report' + '.pdf');
            status := 'success*Generated*Downloads\RiskReport\' + 'risk_report' + '.pdf';
        end
    end;

    procedure GenerateManagementPlanSummery(docno: Code[50]) status: Text
    var
        riskManagement: Record "Risk Management Plan";
    begin
        riskManagement.Reset;
        riskManagement.SetRange("Document No", docno);
        //riskManagement.SETRANGE("Document Type",riskManagement."Document Type"::Corporate);
        if riskManagement.FindSet then begin
            if FILE.Exists(FILESPATH98 + docno + '.pdf') then begin
                FILE.Erase(FILESPATH98 + docno + '.pdf');
                //Report.SaveAsPdf(95002, FILESPATH98 + docno + '.pdf', riskManagement);
                status := 'success*Generated*Downloads\RiskManagementPlanDocuments\' + docno + '.pdf';
            end else begin
                //Report.SaveAsPdf(95002, FILESPATH98 + docno + '.pdf', riskManagement);
                status := 'success*Generated*Downloads\RiskManagementPlanDocuments\' + docno + '.pdf';
            end
        end else begin
            status := 'danger*Document not found';
        end
    end;

    procedure FnAddRiskOwnership(requisitionNo: Text; riskId: Integer; responsibilityCenter: Text; Officer: Text) status: Text
    var
        riskOwnershipLine: Record "RMP Line Risk Ownership";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        RiskManagementPlan.Reset;
        //FnAddRiskOwnership('CRMP0021',125,'EXAM','00073')
        RiskManagementPlan.SetRange("Document No", requisitionNo);
        if RiskManagementPlan.FindSet then begin
            RiskManagementPlanLine.Reset;
            RiskManagementPlanLine.SetRange("Document No", requisitionNo);
            RiskManagementPlanLine.SetRange("Risk ID", riskId);
            if RiskManagementPlanLine.FindSet then begin
                riskOwnershipLine.Init;
                riskOwnershipLine."Risk Title" := RiskManagementPlanLine."Risk Title";
                riskOwnershipLine."Document Type" := RiskManagementPlan."Document Type";
                riskOwnershipLine."Document No" := requisitionNo;
                riskOwnershipLine."Risk ID" := riskId;
                riskOwnershipLine."Responsibility Center ID" := responsibilityCenter;
                riskOwnershipLine.Validate("Responsibility Center ID");
                riskOwnershipLine."Responsible Officer No." := Officer;
                riskOwnershipLine.Validate("Responsible Officer No.");
                if riskOwnershipLine.Insert(true) then begin
                    status := 'success*Officer added successfully';
                end else begin
                    status := 'danger*The operation was unsuccessful';
                end
            end else begin
                status := 'danger*Risk Not Found';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnAddRiskMitigation(requisitionNo: Code[10]; riskId: Integer; mitigationStrat: Text; riskAction: Text; Officer: Text; actionStatus: Text; docType: Integer; ttimeLine: Date) status: Text
    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        RiskManagementPlan.Reset;
        RiskManagementPlan.SetRange("Document No", requisitionNo);
        if RiskManagementPlan.FindSet then begin
            RMPLineResponseAction.Init;
            RMPLineResponseAction."Risk ID" := riskId;
            RMPLineResponseAction."Document No" := requisitionNo;
            if docType = 1 then
                RMPLineResponseAction."Document Type" := RMPLineResponseAction."document type"::Corporate;
            if docType = 2 then
                RMPLineResponseAction."Document Type" := RMPLineResponseAction."document type"::"Functional (Department)";
            RMPLineResponseAction."Risk Title" := RiskManagementPlanLine."Risk Title";
            RMPLineResponseAction."Responsible Officer No." := Officer;
            RMPLineResponseAction.Validate("Responsible Officer No.");
            RMPLineResponseAction."Risk Response Action Taken" := riskAction;
            RMPLineResponseAction."Activity Description" := mitigationStrat;
            //RMPLineResponseAction."Risk Response Action Taken" := riskAction ;
            Message(actionStatus);
            if actionStatus = 'Planned' then
                RMPLineResponseAction."Action Status" := RMPLineResponseAction."action status"::Planned;
            if actionStatus = 'Completed' then
                RMPLineResponseAction."Action Status" := RMPLineResponseAction."action status"::Completed;
            if actionStatus = 'Ongoing'
              then
                RMPLineResponseAction."Action Status" := RMPLineResponseAction."action status"::Ongoing;
            RMPLineResponseAction.Validate("Risk Response Action Taken");
            //  RMPLineResponseAction."Planned Due Date" := dueDate;
            RMPLineResponseAction.Timeline := ttimeLine;
            if RMPLineResponseAction.Insert(true) then begin
                status := 'success*The operation was successful';
            end else begin
                status := 'danger*The operation was unsuccessful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnAddRiskRegister(applicationNo: Code[10]; riskCat: Text; startPillars: Text; riskDesc: Text; risklikelihoodCode: Code[10]; riskActual: Decimal; timpactType: Code[30]; timpactRating: Decimal; RiskImpactTyp: Integer; riskappetite: Text; GenRiskStrat: Text) status: Text
    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        RiskManagementPlan.Reset;
        RiskManagementPlan.SetRange("Document No", applicationNo);
        if RiskManagementPlan.FindSet then begin
            RiskManagementPlanLine.Init;
            RiskManagementPlanLine."Document No" := applicationNo;
            RiskManagementPlanLine."Document Type" := RiskManagementPlan."Document Type";
            RiskManagementPlanLine."Risk Category" := riskCat;
            RiskManagementPlanLine.Validate("Risk Category");
            RiskManagementPlanLine."Risk Source ID" := startPillars;
            RiskManagementPlanLine.Validate("Risk Source ID");
            RiskManagementPlanLine."Risk Title" := riskDesc;
            RiskManagementPlanLine."Risk Appetite" := riskappetite;
            RiskManagementPlanLine."Gen. Risk Response Strategy" := GenRiskStrat;
            if RiskManagementPlanLine.Insert(true) then begin
                RiskManagementPlanLine."Risk Likelihood Code" := risklikelihoodCode;
                RiskManagementPlanLine.Validate("Risk Likelihood Code");
                RiskManagementPlanLine."Risk Impact Code" := timpactType;
                RiskManagementPlanLine.Validate("Risk Impact Code");
                RiskManagementPlanLine."Risk Likelihood Actual Rating" := riskActual;
                RiskManagementPlanLine.Validate("Risk Likelihood Actual Rating");
                RiskManagementPlanLine."Risk Impact Actual Rating" := timpactRating;
                RiskManagementPlanLine.Validate("Risk Impact Actual Rating");
                RiskManagementPlanLine."Risk Impact Type" := RiskImpactTyp;
                RiskManagementPlanLine.Modify;

                status := 'success*The operation was successful';
            end else begin
                status := 'danger*The operation was not successful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure CreateRiskRegisterDivision(requisitionNo: Code[10]; DivisionCode: Code[10]; csp: Code[10]; consolidated: Code[10]; yearCode: Code[10]; Officer: Code[10]; detailedNarration: Text) status: Text
    var
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        // RiskManagementPlan.RESET;
        // RiskManagementPlan.SETRANGE("Document No",requisitionNo);
        // IF RiskManagementPlan.FINDSET THEN BEGIN
        //  RiskManagementPlan."Department ID" := DivisionCode;
        //  RiskManagementPlan."Corporate Strategic Plan ID" := csp;
        //  RiskManagementPlan."Consolidated Risk Mgt Plan No" := consolidated;
        //  RiskManagementPlan."Year Code" := yearCode;
        //  RiskManagementPlan."Responsible Officer No." := Officer;
        //  RiskManagementPlan.VALIDATE("Responsible Officer No.");
        //  IF RiskManagementPlan.MODIFY(true) THEN BEGIN
        //    status := 'success*Risk edited successfully';
        //  END
        //  END ELSE BEGIN
        RiskManagementPlan.Init;
        //RiskManagementPlan."Document No" := requisitionNo;
        RiskManagementPlan."Document Type" := RiskManagementPlan."document type"::"Functional (Department)";
        RiskManagementPlan."Department ID" := DivisionCode;
        RiskManagementPlan."Corporate Strategic Plan ID" := csp;
        RiskManagementPlan.Validate("Corporate Strategic Plan ID");
        RiskManagementPlan."Consolidated Risk Mgt Plan No" := consolidated;
        RiskManagementPlan."Year Code" := yearCode;
        RiskManagementPlan."Responsible Officer No." := Officer;
        RiskManagementPlan."Detailed Naration" := detailedNarration;
        RiskManagementPlan.Validate("Responsible Officer No.");

        if RiskManagementPlan.Insert(true) then begin
            status := 'success*The operation was successful*' + RiskManagementPlan."Document No";
        end else begin
            status := 'danger*The operation was not successful'
            //  END
        end;
    end;

    procedure CreateRiskStatusReport(requisitionNo: Text; empNo: Code[10]; riskRegisterType: Integer; RiskMngt: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
        RiskManagement: Codeunit "Risk Management";
        RiskStatusReportLine: Record "Risk Status Report Line";
        RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action";
    begin
        RiskMEHeader.Init;
        //RiskMEHeader."Document No" := requisitionNo;
        RiskMEHeader."Document Type" := RiskMEHeader."document type"::"Risk Status Report";
        RiskMEHeader.Status := RiskMEHeader.Status::Open;
        RiskMEHeader."Responsible Officer No." := empNo;
        if riskRegisterType = 1 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::Corporate;
        if riskRegisterType = 2 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::"Functional (Directorate)";
        if riskRegisterType = 3 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::"Functional (Department)";
        if riskRegisterType = 4 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::Project;
        RiskMEHeader."Risk Management Plan ID" := RiskMngt;
        if RiskMEHeader.Insert(true) then begin
            RiskManagement.FnSuggestOpenRisks(RiskStatusReportLine, RiskMEHeader);
            RiskManagement.FnSuggestOpenRSRRiskResponseActionStatus(RiskStatusReportLine, RiskMEHeader, RiskStatusRptRespAction);
            status := 'success*Risk added successfully*' + RiskMEHeader."Document No";
        end else begin
            status := 'danger* The operation was unsuccessful';
        end

    end;

    procedure CreateNewIncodentLog(empNo: Code[50]; requisitionNo: Code[50]; strategicplanno: Integer; funcionalworkplan: Code[10]; RiskId: Integer; RiskDescription: Text; riskVategory: Text; severityLevel: Code[10]; dateIncident: Date; timeIncident: Time; OccurrenceType: Integer; incidentLocations: Text; rootCauseSumm: Text; categoryOfPerson: Integer; reportedBy: Code[50]; responsibilityCenter: Code[10]; EscalationOfficer: Code[10]) status: Text
    var
        RiskIncidentLog: Record "Risk Incident Log";
        RiskManagementPlan: Record "Risk Management Plan";
        RiskManagement: Codeunit "Risk Management";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", requisitionNo);
        if RiskIncidentLog.FindSet then begin
            RiskIncidentLog.Reset;
            if strategicplanno = 1 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::Corporate;
            if strategicplanno = 2 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::"Functional (CEO)";
            if strategicplanno = 3 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::"Functional (Department)";
            if strategicplanno = 4 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::Project;
            RiskIncidentLog.Status := RiskIncidentLog.Status::Open;
            RiskIncidentLog."Risk Management Plan ID" := funcionalworkplan;
            RiskIncidentLog.DocumentCreator := empNo;
            RiskIncidentLog."Risk ID" := RiskId;
            RiskIncidentLog."Incident Description" := RiskDescription;
            RiskIncidentLog."Risk Incident Category" := riskVategory;
            RiskIncidentLog."Severity Level" := severityLevel;
            RiskIncidentLog."Incident Date" := dateIncident;
            RiskIncidentLog."Incident Time" := timeIncident;
            if OccurrenceType = 1 then
                RiskIncidentLog."Occurrence Type" := RiskIncidentLog."occurrence type"::Occurred;
            if OccurrenceType = 2 then
                RiskIncidentLog."Occurrence Type" := RiskIncidentLog."occurrence type"::"Near-Miss";
            RiskIncidentLog."Incident Location Details" := incidentLocations;
            //RiskIncidentLog."Primary Trigger ID" := primTrigger ;
            RiskIncidentLog."Root Cause Summary" := rootCauseSumm;
            if categoryOfPerson = 6 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Anonymous;
            if categoryOfPerson = 2 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Contractor Employee";
            if categoryOfPerson = 1 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Internal Employee";
            if categoryOfPerson = 7 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Other;
            if categoryOfPerson = 5 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Public;
            if categoryOfPerson = 3 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Subcontractor Employee";
            if categoryOfPerson = 4 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Visitor;
            RiskIncidentLog."Reported By (Name)" := reportedBy;
            RiskIncidentLog."Department ID" := responsibilityCenter;
            if (EscalationOfficer <> '') then begin
                RiskIncidentLog."Escalate to Officer No" := EscalationOfficer;
                RiskIncidentLog.Validate("Escalate to Officer No");
                RiskIncidentLog."Escalated?" := true;
                RiskManagement.FNnotifyEscalator(RiskIncidentLog);
            end;

            if RiskIncidentLog.Modify(true) then begin
                status := 'success*The incident ' + RiskIncidentLog."Incident ID" + 'was successfully edited*';
            end else begin
                status := 'danger*The operation was not successful'
            end

        end else begin

            RiskIncidentLog.Init;
            RiskIncidentLog."Document Type" := RiskIncidentLog."document type"::"Risk Incident Report";
            if strategicplanno = 1 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::Corporate;
            if strategicplanno = 2 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::"Functional (CEO)";
            if strategicplanno = 3 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::"Functional (Department)";
            if strategicplanno = 4 then
                RiskIncidentLog."Risk Register Type" := RiskIncidentLog."risk register type"::Project;
            RiskIncidentLog.Status := RiskIncidentLog.Status::Open;
            RiskIncidentLog."Risk Management Plan ID" := funcionalworkplan;
            RiskIncidentLog.DocumentCreator := empNo;
            RiskIncidentLog."Risk ID" := RiskId;
            RiskIncidentLog."Risk Description" := RiskDescription;
            RiskIncidentLog."Risk Incident Category" := riskVategory;
            RiskIncidentLog."Severity Level" := severityLevel;
            RiskIncidentLog."Incident Date" := dateIncident;
            RiskIncidentLog."Incident Time" := timeIncident;
            if OccurrenceType = 1 then
                RiskIncidentLog."Occurrence Type" := RiskIncidentLog."occurrence type"::Occurred;
            if OccurrenceType = 2 then
                RiskIncidentLog."Occurrence Type" := RiskIncidentLog."occurrence type"::"Near-Miss";
            RiskIncidentLog."Incident Location Details" := incidentLocations;
            //RiskIncidentLog."Primary Trigger ID" := primTrigger ;
            RiskIncidentLog."Root Cause Summary" := rootCauseSumm;
            if categoryOfPerson = 6 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Anonymous;
            if categoryOfPerson = 2 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Contractor Employee";
            if categoryOfPerson = 1 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Internal Employee";
            if categoryOfPerson = 7 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Other;
            if categoryOfPerson = 5 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Public;
            if categoryOfPerson = 3 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::"Subcontractor Employee";
            if categoryOfPerson = 4 then
                RiskIncidentLog."Category of Person Reporting" := RiskIncidentLog."category of person reporting"::Visitor;
            RiskIncidentLog."Reported By (Name)" := reportedBy;
            RiskIncidentLog."Department ID" := responsibilityCenter;
            RiskIncidentLog."Document Status" := RiskIncidentLog."document status"::Escalated;

            if RiskIncidentLog.Insert(true) then begin
                if (EscalationOfficer <> '') then begin
                    RiskIncidentLog."Escalate to Officer No" := EscalationOfficer;
                    RiskIncidentLog.Validate("Escalate to Officer No");
                    RiskIncidentLog."Escalated?" := true;
                    RiskManagement.FNnotifyEscalator(RiskIncidentLog);
                end;
                RiskIncidentLog.Modify(true);
                status := 'success*Risk Incident log ' + RiskIncidentLog."Incident ID" + ' has been created successfully.*' + RiskIncidentLog."Incident ID";
            end else begin
                status := 'danger*The operation was not successful'
            end
        end
    end;

    procedure PostDivisionRegister(applicationNo: Code[10]) status: Text
    var
        RMPLine: Record "Risk Management Plan Line";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RMPLineResponse: Record "RMP Line Response Action";
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAct: Record "RMP Line Response Action";
        RMPLineRisk: Record "RMP Line Risk Ownership";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        RiskManagementPlan.Reset;
        RiskManagementPlan.SetRange("Document No", applicationNo);
        RMPLine.Reset;
        RMPLine.SetRange(RMPLine."Document No", applicationNo);
        if RMPLine.FindSet then begin
            repeat
                RiskManagementPlanLine.Init;
                RiskManagementPlanLine.TransferFields(RMPLine);
                RiskManagementPlanLine."Document Type" := RiskManagementPlanLine."document type"::Corporate;
                RiskManagementPlanLine."Document No" := RiskManagementPlan."Consolidated Risk Mgt Plan No";
                if not RiskManagementPlanLine.Insert(true) then
                    RiskManagementPlanLine.Modify(true);
            until RMPLine.Next = 0;
        end;

        RMPLineResponse.Reset;
        RMPLineResponse.SetRange(RMPLineResponse."Document No", applicationNo);
        if RMPLineResponse.FindSet then begin
            repeat
                RMPLineResponseAct.Init;
                RMPLineResponseAct.TransferFields(RMPLineResponse);
                RMPLineResponseAct."Document Type" := RMPLineResponseAct."document type"::Corporate;
                RMPLineResponseAct."Document No" := RiskManagementPlan."Consolidated Risk Mgt Plan No";
                if not RMPLineResponseAct.Insert(true) then
                    RMPLineResponseAct.Modify(true);
            until RMPLineResponse.Next = 0;
        end;

        RMPLineRisk.Reset;
        RMPLineRisk.SetRange(RMPLineRisk."Document No", applicationNo);
        if RMPLineRisk.FindSet then begin
            repeat
                RMPLineRiskOwnership.Init;
                RMPLineRiskOwnership.TransferFields(RMPLineRisk);
                RMPLineRiskOwnership."Document Type" := RMPLineRiskOwnership."document type"::Corporate;
                RMPLineRiskOwnership."Document No" := RiskManagementPlan."Consolidated Risk Mgt Plan No";
                if not RMPLineRiskOwnership.Insert(true) then
                    RMPLineRiskOwnership.Modify(true);
            until RMPLineRisk.Next = 0;
        end;
        status := 'success*Register consolidated successfully';
    end;

    procedure DeleteRisk(requisitionNo: Code[10]; LineNo: Integer) status: Text
    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAction: Record "RMP Line Response Action";
    begin
        RiskManagementPlanLine.Reset;
        RiskManagementPlanLine.SetRange("Document No", requisitionNo);
        RiskManagementPlanLine.SetRange("Risk ID", LineNo);
        //RiskManagementPlanLine.SETRANGE("Document Type",RiskManagementPlanLine."Document Type"::"Functional (Department)");
        if RiskManagementPlanLine.FindSet then begin
            if RiskManagementPlanLine.Delete(true) then begin
                //  RMPLineRiskOwnership.RESET;
                //  RMPLineRiskOwnership.SETRANGE("Document No",requisitionNo);
                //  RMPLineRiskOwnership.SETRANGE("Risk ID",LineNo);
                //  RMPLineRiskOwnership.DELETE;
                //  RMPLineResponseAction.RESET;
                //  RMPLineRiskOwnership.SETRANGE("Document No",requisitionNo);
                //  RMPLineRiskOwnership.SETRANGE("Risk ID",LineNo);
                //  RMPLineRiskOwnership.DELETE;
                status := 'success*The risk was deleted successfully';
            end else begin
                status := 'danger*Operation was unsuccessful';
            end
        end else begin
            status := 'danger*Risk was not found!!';
        end
    end;

    procedure AddEscalatedRiskResponse(riskID: Code[10]; response: Text) status: Text
    var
        RiskIncidentLog: Record "Risk Incident Log";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", riskID);
        if RiskIncidentLog.FindSet then begin
            RiskIncidentLog.Response := response;
            RiskIncidentLog.Posted := true;
            if RiskIncidentLog.Modify(true) then begin
                status := 'success*Response has been added successfully';
            end else begin
                status := 'danger*Response addition was unsuccessful';
            end
        end else begin
            status := 'danger*Risk could not be found';
        end
    end;

    procedure CreateNewRiskVoucher(requisitionNo: Text; empNo: Code[10]; riskRegisterType: Integer; RiskMngt: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
    begin
        RiskMEHeader.Init;
        RiskMEHeader.DocumentCreator := empNo;
        RiskMEHeader."Document Type" := RiskMEHeader."document type"::"New Risk Voucher";
        if riskRegisterType = 1 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::Corporate;
        if riskRegisterType = 2 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::"Functional (Directorate)";
        if riskRegisterType = 3 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::"Functional (Department)";
        if riskRegisterType = 4 then
            RiskMEHeader."Risk Register Type" := RiskMEHeader."risk register type"::Project;
        //RiskMEHeader."Responsible Officer No." := empNo;
        RiskMEHeader."Risk Management Plan ID" := RiskMngt;
        RiskMEHeader.Validate("Risk Management Plan ID");


        if RiskMEHeader.Insert(true) then begin
            status := 'success*The operation was successful*' + RiskMEHeader."Document No";
        end else begin
            status := 'danger*The operation was unsuccessful';
        end
    end;

    procedure GeneratenewVoucher(docNo: Code[30]) status: Text
    begin
    end;

    procedure FnAddemergingRisk(applicationNo: Text; riskCat: Text; startPillars: Text; riskDesc: Text; risklikelihoodCode: Code[10]; riskActual: Decimal; impactType: Code[10]; impactRating: Decimal; RiskImpactTyp: Integer; riskappetite: Text; GenRiskStrat: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
    begin
        RiskMEHeader.Reset;
        RiskMEHeader.SetRange("Document No", applicationNo);
        if RiskMEHeader.FindSet then begin

            NewRiskVoucherLine.Init;
            NewRiskVoucherLine."Document No" := applicationNo;
            NewRiskVoucherLine."Document Type" := NewRiskVoucherLine."document type"::"New Risk Voucher";
            NewRiskVoucherLine."Risk Category" := riskCat;
            NewRiskVoucherLine.Validate("Risk Category");
            NewRiskVoucherLine."Risk Source ID" := startPillars;
            NewRiskVoucherLine.Validate("Risk Source ID");
            NewRiskVoucherLine."Risk Title" := riskDesc;
            //NewRiskVoucherLine."Risk Appetite":= riskappetite;
            NewRiskVoucherLine."Gen. Risk Response Strategy" := GenRiskStrat;
            NewRiskVoucherLine."Risk Status" := NewRiskVoucherLine."risk status"::Open;
            if NewRiskVoucherLine.Insert(true) then begin
                NewRiskVoucherLine."Risk Likelihood Code" := risklikelihoodCode;
                NewRiskVoucherLine.Validate("Risk Likelihood Code");
                NewRiskVoucherLine."Risk Impact Code" := impactType;
                NewRiskVoucherLine.Validate("Risk Impact Code");
                NewRiskVoucherLine."Risk Likelihood Actual Rating" := riskActual;
                NewRiskVoucherLine.Validate("Risk Likelihood Actual Rating");
                NewRiskVoucherLine."Risk Impact Actual Rating" := impactRating;
                NewRiskVoucherLine.Validate("Risk Impact Actual Rating");
                NewRiskVoucherLine."Risk Impact Type" := RiskImpactTyp;
                NewRiskVoucherLine.Modify();
                //IF NewRiskVoucherLine.INSERT(TRUE) THEN BEGINRiskVoucherLine.MODIFY;
                status := 'success*The operation was successful';
            end else begin
                status := 'danger*The operation was not successful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure CreateIncidentSummery(empNo: Code[10]; requisitionNo: Code[10]; timpactType: Integer; tdescription: Text; tpersonAffected: Integer; tOfficer: Text; tcontactDetails: Text; tadditionalComments: Text; tpoliceReport: Text; treportDate: Date; tpoliceStation: Text; tReportingOfficer: Text) status: Text
    var
        RiskIncidentLogImpactR: Record "Risk Incident Log Impact R";
        RiskIncidentLog: Record "Risk Incident Log";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", requisitionNo);
        if RiskIncidentLog.FindSet then begin
            RiskIncidentLogImpactR.Init;
            RiskIncidentLogImpactR."Incident No" := requisitionNo;
            RiskIncidentLogImpactR."Impact Type" := timpactType;
            RiskIncidentLogImpactR.Description := tdescription;
            RiskIncidentLogImpactR."Internal Employee No." := tOfficer;
            RiskIncidentLogImpactR.Validate("Internal Employee No.");
            RiskIncidentLogImpactR."Contact Details" := tcontactDetails;
            RiskIncidentLogImpactR."Additional Comments" := tadditionalComments;
            RiskIncidentLogImpactR."Police Report Reference No." := tpoliceReport;
            RiskIncidentLogImpactR."Police Station" := tpoliceStation;
            RiskIncidentLogImpactR."Police Report Date" := treportDate;
            RiskIncidentLogImpactR."Reporting Officer" := tReportingOfficer;
            if tpersonAffected = 1 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::"Internal Employee";
            if tpersonAffected = 2 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::"Contractor Employee";
            if tpersonAffected = 3 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::"Subcontractor Employee";
            if tpersonAffected = 4 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::Visitor;
            if tpersonAffected = 5 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::Public;
            if tpersonAffected = 6 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::Anonymous;
            if tpersonAffected = 7 then
                RiskIncidentLogImpactR."Category of Party Affected" := RiskIncidentLogImpactR."category of party affected"::Other;
            //RiskIncidentLogImpactR."Internal Employee No." := empNo ;

            if RiskIncidentLogImpactR.Insert(true) then begin
                status := 'success*Incident Summary added successfully';
            end else begin
                status := 'danger*Incident was not added successfully';
            end

        end else begin
            status := 'danger*Incident was not found';
        end
    end;

    procedure GenerateStatusPeriod(docno: Text) status: Text
    var
        RiskIncidentLog: Record "Risk Incident Log";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", docno);
        if RiskIncidentLog.FindSet then begin
            if FILE.Exists(FILESPATH96 + docno + '.pdf') then begin
                FILE.Erase(FILESPATH96 + docno + '.pdf');
                //Report.SaveAsPdf(95025, FILESPATH96 + docno + '.pdf', RiskIncidentLog);
                status := 'success*Generated*Downloads\IncidentLogReport\' + docno + '.pdf';
            end else begin
                //Report.SaveAsPdf(95025, FILESPATH96 + docno + '.pdf', RiskIncidentLog);
                status := 'success*Generated*Downloads\IncidentLogReport\' + docno + '.pdf';
            end
        end else begin
            status := 'danger*Document not found';
        end;
    end;

    procedure GeneratePeriodicPrintout(docno: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
    begin
        RiskMEHeader.Reset;
        RiskMEHeader.SetRange("Document No", docno);
        if RiskMEHeader.FindSet then begin
            if FILE.Exists(FILESPATH97 + docno + '.pdf') then begin
                FILE.Erase(FILESPATH97 + docno + '.pdf');
                //Report.SaveAsPdf(95007, FILESPATH97 + docno + '.pdf', RiskMEHeader);
                status := 'success*Generated*Downloads\StatusReport\' + docno + '.pdf';
            end else begin
                //Report.SaveAsPdf(95007, FILESPATH97 + docno + '.pdf', RiskMEHeader);
                status := 'success*Generated*Downloads\StatusReport\' + docno + '.pdf';
            end
        end else begin
            status := 'danger*Document not found';
        end;
    end;

    procedure FnPostRiskStatusReport(docno: Text) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
        RiskManagement: Codeunit "Risk Management";
    begin
        RiskMEHeader.Reset;
        RiskMEHeader.SetRange("Document No", docno);
        if RiskMEHeader.FindSet then begin
            RiskManagement.FnUpdateRMPFromRSR(RiskMEHeader);
            RiskManagement.FnUpdateRiskOwnership(RiskMEHeader);
            RiskManagement.FnUpdateRiskResponseActionsRSR(RiskMEHeader);
            RiskMEHeader.Posted := true;
            RiskMEHeader."Posting Date" := Today;

            if RiskMEHeader.Modify(true) then begin
                status := 'success*Submitted Successfully'
            end else begin
                status := 'danger*An error occured while submitting';
            end
        end else begin
            status := 'danger*Document Not found';
        end
    end;

    procedure FnAddNewRiskAction(docno: Text; "action": Text; requisitionNo: Text; tactionID: Integer; triskID: Integer; ttimeLine: Date) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RMPLineResponseAction2: Record "RMP Line Response Action";
    begin
        RMPLineResponseAction.Reset;
        RMPLineResponseAction.SetRange("Document No", requisitionNo);
        RMPLineResponseAction.SetRange("Action ID", tactionID);
        RMPLineResponseAction.SetRange("Risk ID", triskID);
        if RMPLineResponseAction.FindSet then begin
            //    RMPLineResponseAction2.INIT;
            //    RMPLineResponseAction2."Document Type" := RMPLineResponseAction."Document Type";
            //    RMPLineResponseAction2."Document No" := RMPLineResponseAction."Document No";
            //    RMPLineResponseAction2."Risk Response Action Taken" := action ;
            //    RMPLineResponseAction2.VALIDATE("Risk Response Action Taken");
            //    RMPLineResponseAction2."Risk ID" := RMPLineResponseAction."Risk ID" ;
            //    RMPLineResponseAction2."Risk Title" := RMPLineResponseAction."Risk Title";
            //    RMPLineResponseAction2."Activity Description" := RMPLineResponseAction."Activity Description";
            //    RMPLineResponseAction2."Responsible Officer No." := RMPLineResponseAction."Responsible Officer No." ;
            //    RMPLineResponseAction2.VALIDATE("Responsible Officer No.");
            //    RMPLineResponseAction2."Planned Due Date" := RMPLineResponseAction."Planned Due Date";
            //    RMPLineResponseAction2."Action Status":=  RMPLineResponseAction."Action Status"::Ongoing;
            RMPLineResponseAction."Risk Response Action Taken" := action;
            RMPLineResponseAction.Validate("Risk Response Action Taken");
            RMPLineResponseAction.Timeline := ttimeLine;
            if RMPLineResponseAction.Modify(true) then begin
                status := 'success*Action response edited succcessfully';

                //    IF RMPLineResponseAction2.INSERT(TRUE) THEN BEGIN
                //      status := 'success*Action response added succcessfully';
            end else begin
                status := 'danger*An error occured when adding response';
            end
        end else begin
            status := 'danger*Response could not be found';
        end;
    end;

    procedure CloseRisk(employeeName: Text; requisitionNo: Text; tLineNo: Integer; tplanID: Text) status: Text
    var
        RiskStatusReportLine: Record "Risk Status Report Line";
    begin
        RiskStatusReportLine.Reset;
        RiskStatusReportLine.SetRange("Document No", requisitionNo);
        RiskStatusReportLine.SetRange("Risk ID", tLineNo);
        RiskStatusReportLine.SetRange("Risk Management Plan ID", tplanID);
        if RiskStatusReportLine.FindSet then begin
            RiskStatusReportLine."Risk Status" := RiskStatusReportLine."risk status"::Closed;
            RiskStatusReportLine."Date Closed" := Today;
            if RiskStatusReportLine.Modify(true) then begin
                status := 'success*The risk was closed successfully';
            end else begin
                status := 'danger*An error occured while closing the risk';
            end
        end else begin
            status := 'danger*Document not found';
        end
    end;

    procedure DeleteIncidentLine(requisitionNo: Text; tLineNo: Integer) status: Text
    var
        RiskIncidentLogImpactR: Record "Risk Incident Log Impact R";
    begin
        RiskIncidentLogImpactR.Reset;
        RiskIncidentLogImpactR.SetRange("Incident No", requisitionNo);
        RiskIncidentLogImpactR.SetRange("Line No", tLineNo);
        if RiskIncidentLogImpactR.FindSet then begin
            if RiskIncidentLogImpactR.Delete(true) then begin
                status := 'success*The incident was deleted successfully';
            end else begin
                status := 'danger*AN error occured while deleting the incident';
            end
        end else begin
            status := 'danger*The incident was no found';
        end
    end;

    procedure FnAddPeriodicStatusOwnership(requisitionNo: Text; riskId: Integer; responsibilityCenter: Text; Officer: Text; docType: Code[10]) status: Text
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RiskMEHeader: Record "Risk M&E Header";
        RiskStatusReportLine: Record "Risk Status Report Line";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        if docType = '2' then begin
            RiskMEHeader.Reset;
            RiskMEHeader.SetRange("Document No", requisitionNo);
            if RiskMEHeader.FindSet then begin
                RiskStatusReportLine.Reset;
                RiskStatusReportLine.SetRange("Document No", requisitionNo);
                RiskStatusReportLine.SetRange("Risk ID", riskId);
                RiskStatusReportLine.SetRange("Document Type", RiskMEHeader."Document Type");
                if RiskStatusReportLine.FindSet then begin
                    RMPLineRiskOwnership.Init;
                    RMPLineRiskOwnership."Risk Title" := RiskStatusReportLine."Risk Title";
                    RMPLineRiskOwnership."Document Type" := RMPLineRiskOwnership."document type"::"Functional (Directorate)";
                    RMPLineRiskOwnership."Document No" := requisitionNo;
                    RMPLineRiskOwnership."Risk ID" := riskId;
                    RMPLineRiskOwnership."Responsibility Center ID" := responsibilityCenter;
                    RMPLineRiskOwnership.Validate("Responsibility Center ID");
                    RMPLineRiskOwnership."Responsible Officer No." := Officer;
                    RMPLineRiskOwnership.Validate("Responsible Officer No.");
                    if RMPLineRiskOwnership.Insert(true) then begin
                        status := 'success*Officer added successfully';
                    end else begin
                        status := 'danger*The operation was unsuccessful';
                    end
                end else begin
                    status := 'danger*Risk Not Found';
                end;
            end else begin
                status := 'danger*The document could not be found';
            end;

        end else begin
            RiskManagementPlan.Reset;
            RiskManagementPlan.SetRange("Document No", requisitionNo);
            if RiskManagementPlan.FindSet then begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange("Document No", requisitionNo);
                RiskManagementPlanLine.SetRange("Risk ID", riskId);
                RiskManagementPlanLine.SetRange("Document Type", RiskManagementPlan."Document Type");
                if RiskStatusReportLine.FindSet then begin
                    RMPLineRiskOwnership.Init;
                    RMPLineRiskOwnership."Risk Title" := RiskStatusReportLine."Risk Title";
                    RMPLineRiskOwnership."Document Type" := RMPLineRiskOwnership."document type"::"Functional (Department)";
                    RMPLineRiskOwnership."Document No" := requisitionNo;
                    RMPLineRiskOwnership."Risk ID" := riskId;
                    RMPLineRiskOwnership."Responsibility Center ID" := responsibilityCenter;
                    RMPLineRiskOwnership.Validate("Responsibility Center ID");
                    RMPLineRiskOwnership."Responsible Officer No." := Officer;
                    RMPLineRiskOwnership.Validate("Responsible Officer No.");
                    if RMPLineRiskOwnership.Insert(true) then begin
                        status := 'success*Officer added successfully';
                    end else begin
                        status := 'danger*The operation was unsuccessful';
                    end
                end else begin
                    status := 'danger*Risk Not Found';
                end
            end else begin
                status := 'danger*The document could not be found';
            end;

        end
    end;

    procedure PostRiskVoucher(appNo: Code[50]) status: Text
    var
        rec: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskStatusReportLine: Record "Risk Status Report Line";
        NewRiskLineJobTask: Record "New Risk Line Job Task";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        NewRiskLineResponseAction: Record "New Risk Line Resp. Action";
    begin
        rec.Reset;
        rec.SetRange("Document No", appNo);
        if rec.FindSet then begin
            RiskManagement.FnUpdateRMPFromNRV(RiskManagementPlanLine, rec, NewRiskVoucherLine, RiskStatusReportLine);
            //RiskManagement.FnUpdateRiskOwnership(Rec,NewRiskVoucherLine,RiskStatusReportLine,NewRiskLineOwnership);
            RiskManagement.FnUpdateRiskOwnership(rec);
            RiskManagement.FnUpdateRiskResponseActions(rec, NewRiskVoucherLine, RiskStatusReportLine, NewRiskLineResponseAction);
            RiskManagement.FnUpdateJobTasks(rec, NewRiskVoucherLine, RiskStatusReportLine, NewRiskLineJobTask);
            rec.Posted := true;
            rec.Modify(true);
            status := 'success*The Risk was posted successfully';
        end else begin
            status := 'danger*The risk was not found';
        end
    end;

    procedure DeleteRiskVoucher(requisitionNo: Code[50]; LineNo: Integer) Status: Text
    var
        NewRiskVoucherLine: Record "New Risk Voucher Line";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange("Document No", requisitionNo);
        NewRiskVoucherLine.SetRange("Risk ID", LineNo);
        if NewRiskVoucherLine.FindSet then begin
            if NewRiskVoucherLine.Delete(true) then begin
                Status := 'success*The risk was deleted successfully';
            end else begin
                Status := 'danger*the risk could not be deleted';
            end

        end else begin
            Status := 'danger*The risk could not be found';
        end
    end;

    procedure fnSaveSurveyOpenEndedQuestion(docno: Code[100]; sectioncode: Code[100]; questionId: Code[100]; answer: Text) status: Text
    var
        BRResponseQuestion: Record "BR Response Question";
    begin
        BRResponseQuestion.Reset;
        BRResponseQuestion.SetRange("Survey Response ID", docno);
        BRResponseQuestion.SetRange("Section Code", sectioncode);
        BRResponseQuestion.SetRange("Question ID", questionId);
        if BRResponseQuestion.FindSet then begin
            BRResponseQuestion."General Response Statement" := answer;
            if BRResponseQuestion.Modify(true) then begin
                status := 'success*Your response has been successfully saved.';
            end else begin
                status := 'danger*Your response was not saved, please try again!';
            end;
        end;
    end;

    procedure fnSaveSurveyClosedEndedQuestion(docno: Code[100]; sectioncode: Code[100]; questionId: Code[100]; answer: Text) status: Text
    var
        BRResponseQuestion: Record "BR Response Question";
    begin
        BRResponseQuestion.Reset;
        BRResponseQuestion.SetRange("Survey Response ID", docno);
        BRResponseQuestion.SetRange("Section Code", sectioncode);
        BRResponseQuestion.SetRange("Question ID", questionId);
        if BRResponseQuestion.FindSet then begin
            BRResponseQuestion."Response Value" := answer;
            BRResponseQuestion."General Response Statement" := answer;
            if BRResponseQuestion.Modify(true) then begin
                status := 'success*Your response has been successfully saved.';
            end else begin
                status := 'danger*Your response was not saved, please try again!';
            end;
        end;
    end;

    procedure fnSubmitSurvey(docNo: Code[100]) status: Text
    var
        BusinessResearchResponse: Record "Business Research Response";
    begin
        BusinessResearchResponse.Reset;
        BusinessResearchResponse.SetRange("Document No.", docNo);
        if BusinessResearchResponse.FindSet then begin
            BusinessResearchResponse.Status := BusinessResearchResponse.Status::Submitted;
            if BusinessResearchResponse.Modify(true) then begin
                status := 'success*The survey has been successfully submitted to CUE.';
            end else begin
                status := 'danger*The survey would not be submitted to CUE, kindly try again.';
            end;
        end;
    end;

    procedure PostIncidentLogs(appNo: Code[50]) status: Text
    var
        RiskIncidentLog: Record "Risk Incident Log";
        RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry";
        RiskIncidentLogImpactR: Record "Risk Incident Log Impact R";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", appNo);
        if RiskIncidentLog.FindSet then begin
            RiskManagement.FnPostRiskIncidentLogs(RiskIncidentLog, RiskIncidentLedgerEntry, RiskIncidentLogImpactR);
            RiskIncidentLog.Posted := true;
            RiskIncidentLog.Status := RiskIncidentLog.Status::Released;
            RiskIncidentLog.Modify(true);
            status := 'success*The incident log was posted successfully';
        end else begin
            status := 'danger*The incident log was not found';
        end
    end;

    procedure FnAddFileRequisition(respCenter: Code[10]; days: Date) status: Text
    var
        FileMovementHeader: Record "File Movement Header";
    begin
        FileMovementHeader.Init;
        FileMovementHeader."Responsiblity Center" := respCenter;
        FileMovementHeader.Validate("Responsiblity Center");
        FileMovementHeader."Date Requested" := days;
        FileMovementHeader.Validate("Date Requested");
        if FileMovementHeader.Insert(true) then begin
            status := 'success*File requisition was created successfully*' + FileMovementHeader."No.";
        end else begin
            status := 'danger*Error. File Requisition was not successful';
        end
    end;

    procedure FnAddFileRequisitionLines() status: Text
    var
        FileMovementLine: Record "File Movement Line";
    begin
        FileMovementLine.Init;
    end;

    procedure FnAddMedicalClaim(claimType: Code[30]; documentNumber: Text; dVisit: Date; dependant: Code[30]; medCenter: Text; amountCharged: Decimal; amountClaimed: Decimal; empNo: Code[30]; claimNo: Code[50]; variationReason: Text) status: Text
    var
        HRMedicalClaims: Record "HR Medical Claims";
    begin
        HRMedicalClaims.Reset;
        HRMedicalClaims.SetRange("Claim No", claimNo);
        HRMedicalClaims.SetRange("Member No", empNo);
        if HRMedicalClaims.FindSet then begin
            HRMedicalClaims."Member No" := empNo;
            HRMedicalClaims.Validate("Member No");
            if claimType = '1' then
                HRMedicalClaims."Claim Type" := HRMedicalClaims."claim type"::Inpatient;
            if claimType = '2' then
                HRMedicalClaims."Claim Type" := HRMedicalClaims."claim type"::Outpatient;
            HRMedicalClaims."Document Ref" := documentNumber;
            HRMedicalClaims.Dependants := dependant;
            HRMedicalClaims."Hospital/Medical Centre" := medCenter;
            HRMedicalClaims."Amount Charged" := amountCharged;
            HRMedicalClaims."Amount Claimed" := amountClaimed;
            HRMedicalClaims."Date of Service" := dVisit;
            HRMedicalClaims."Reason for Variance" := variationReason;
            //HRMedicalClaims."Dependant DoB" := dptDOB;
            if HRMedicalClaims.Modify(true) then begin
                status := 'success*Medical Claim edited successfully';
            end else begin
                status := 'danger*An error occured while editing medical claim';
            end
        end else begin
            HRMedicalClaims.Init;
            HRMedicalClaims."Member No" := empNo;
            HRMedicalClaims.Validate("Member No");
            if claimType = '1' then
                HRMedicalClaims."Claim Type" := HRMedicalClaims."claim type"::Inpatient;
            if claimType = '2' then
                HRMedicalClaims."Claim Type" := HRMedicalClaims."claim type"::Outpatient;
            HRMedicalClaims."Document Ref" := documentNumber;
            HRMedicalClaims.Dependants := dependant;
            HRMedicalClaims."Hospital/Medical Centre" := medCenter;
            HRMedicalClaims."Amount Charged" := amountCharged;
            HRMedicalClaims."Amount Claimed" := amountClaimed;
            HRMedicalClaims."Date of Service" := dVisit;
            HRMedicalClaims."Reason for Variance" := variationReason;
            //HRMedicalClaims."Dependant DoB" := dptDOB;
            if HRMedicalClaims.Insert(true) then begin
                status := 'success*Medical Claim submitted successfully';
            end else begin
                status := 'danger*An error occured while adding medical claim';
            end
        end
    end;

    procedure FnEditRiskRegister(applicationNo: Code[10]; riskCat: Text; startPillars: Text; riskDesc: Text; risklikelihoodCode: Code[10]; riskActual: Decimal; timpactType: Code[30]; timpactRating: Decimal; RiskImpactTyp: Integer; riskappetite: Text; GenRiskStrat: Text; riskId: Integer; docType: Code[50]) status: Text
    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        RiskManagementPlanLine.Reset;
        RiskManagementPlanLine.SetRange("Document No", applicationNo);
        RiskManagementPlanLine.SetRange("Risk ID", riskId);
        if docType = '1' then
            RiskManagementPlanLine.SetRange("Document Type", RiskManagementPlanLine."document type"::"Functional (Department)");
        if docType = '2' then
            RiskManagementPlanLine.SetRange("Document Type", RiskManagementPlanLine."document type"::"Functional (Directorate)");
        if RiskManagementPlanLine.FindSet then begin
            RiskManagementPlanLine."Risk Category" := riskCat;
            RiskManagementPlanLine.Validate("Risk Category");
            RiskManagementPlanLine."Risk Source ID" := startPillars;
            RiskManagementPlanLine.Validate("Risk Source ID");
            RiskManagementPlanLine."Risk Title" := riskDesc;
            RiskManagementPlanLine."Risk Appetite" := riskappetite;
            RiskManagementPlanLine."Gen. Risk Response Strategy" := GenRiskStrat;
            if RiskManagementPlanLine.Modify(true) then begin
                RiskManagementPlanLine."Risk Likelihood Code" := risklikelihoodCode;
                RiskManagementPlanLine.Validate("Risk Likelihood Code");
                RiskManagementPlanLine."Risk Impact Code" := timpactType;
                RiskManagementPlanLine.Validate("Risk Impact Code");
                RiskManagementPlanLine."Risk Likelihood Actual Rating" := riskActual;
                RiskManagementPlanLine.Validate("Risk Likelihood Actual Rating");
                RiskManagementPlanLine."Risk Impact Actual Rating" := timpactRating;
                RiskManagementPlanLine.Validate("Risk Impact Actual Rating");
                RiskManagementPlanLine."Risk Impact Type" := RiskImpactTyp;
                RiskManagementPlanLine.Modify;
                status := 'success*Risk was modified successfully';
            end else begin
                status := 'danger*The operation was not successfully';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnEditemergingRisk(applicationNo: Text; riskCat: Text; startPillars: Text; riskDesc: Text; risklikelihoodCode: Code[10]; riskActual: Decimal; impactType: Code[10]; impactRating: Decimal; RiskImpactTyp: Integer; riskappetite: Text; GenRiskStrat: Text; riskId: Integer) status: Text
    var
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange("Document No", applicationNo);
        NewRiskVoucherLine.SetRange("Risk ID", riskId);
        if NewRiskVoucherLine.FindSet then begin
            NewRiskVoucherLine."Risk Category" := riskCat;
            NewRiskVoucherLine.Validate("Risk Category");
            NewRiskVoucherLine."Risk Source ID" := startPillars;
            NewRiskVoucherLine.Validate("Risk Source ID");
            NewRiskVoucherLine."Risk Title" := riskDesc;
            //NewRiskVoucherLine."Risk Appetite":= riskappetite;
            NewRiskVoucherLine."Gen. Risk Response Strategy" := GenRiskStrat;
            if NewRiskVoucherLine.Modify(true) then begin
                NewRiskVoucherLine."Risk Likelihood Code" := risklikelihoodCode;
                NewRiskVoucherLine.Validate("Risk Likelihood Code");
                NewRiskVoucherLine."Risk Impact Code" := impactType;
                NewRiskVoucherLine.Validate("Risk Impact Code");
                NewRiskVoucherLine."Risk Likelihood Actual Rating" := riskActual;
                NewRiskVoucherLine.Validate("Risk Likelihood Actual Rating");
                NewRiskVoucherLine."Risk Impact Actual Rating" := impactRating;
                NewRiskVoucherLine.Validate("Risk Impact Actual Rating");
                NewRiskVoucherLine."Risk Impact Type" := RiskImpactTyp;
                NewRiskVoucherLine.Modify();
                //IF NewRiskVoucherLine.INSERT(TRUE) THEN BEGINRiskVoucherLine.MODIFY;
                status := 'success*The Risk Voucher was edited successfully';
            end else begin
                status := 'danger*The operation was not successful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnRemoveRiskOwnership(empNo: Code[50]; docNo: Code[50]; riskId: Integer) status: Text
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
    begin
        RMPLineRiskOwnership.Reset;
        RMPLineRiskOwnership.SetRange("Document No", docNo);
        RMPLineRiskOwnership.SetRange("Risk ID", riskId);
        RMPLineRiskOwnership.SetRange("Responsible Officer No.", empNo);
        if RMPLineRiskOwnership.FindSet then begin
            if RMPLineRiskOwnership.Delete(true) then begin
                status := 'success*Risk ownership was deleted successfully';
            end else begin
                status := 'danger*The operation was not successful';
            end
        end else begin
            status := 'danger*Document not found';
        end
    end;

    procedure FnRemoveRiskResponse(docNo: Code[50]; riskId: Integer; actionId: Integer) status: Text
    var
        RMPLineResponseAction: Record "RMP Line Response Action";
    begin
        RMPLineResponseAction.Reset;
        RMPLineResponseAction.SetRange("Document No", docNo);
        RMPLineResponseAction.SetRange("Risk ID", riskId);
        RMPLineResponseAction.SetRange("Action ID", actionId);
        if RMPLineResponseAction.FindSet then begin
            if RMPLineResponseAction.Delete(true) then begin
                status := 'success*Response was deleted successfully';
            end else begin
                status := 'danger*The operation was not successful';
            end;
        end else begin
            status := 'danger*risk response could not be found';
        end;
    end;

    procedure FnEditPeriodicStatusOwnership(empNo: Code[50]; RespCenter: Code[50]; docNo: Code[50]; riskId: Integer; originalempNo: Code[50]; originalRespCenter: Code[50]) status: Text
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RiskMEHeader: Record "Risk M&E Header";
        RiskStatusReportLine: Record "Risk Status Report Line";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskManagementPlan: Record "Risk Management Plan";
    begin
        RMPLineRiskOwnership.Reset;
        RMPLineRiskOwnership.SetRange("Document No", docNo);
        RMPLineRiskOwnership.SetRange("Risk ID", riskId);
        RMPLineRiskOwnership.SetRange("Responsible Officer No.", originalempNo);
        if RMPLineRiskOwnership.FindSet then begin
            RMPLineRiskOwnership."Responsible Officer No." := empNo;
            RMPLineRiskOwnership.Validate("Responsible Officer No.");
            //  RMPLineRiskOwnership."Responsibility Center ID" := RespCenter;
            //  RMPLineRiskOwnership.VALIDATE("Responsibility Center ID");
            if RMPLineRiskOwnership.Modify(true) then begin
                status := 'success*Risk ownership was edited successfully';
            end else begin
                status := 'danger*The risk ownership could not be edited';
            end
        end else begin
            status := 'danger*Document not found';
        end
    end;

    procedure FnEditRiskResponse(docNo: Code[50]; riskId: Integer; actionId: Integer; mitigationStrat: Text; riskAction: Text; Officer: Code[50]; actionStatus: Code[50]; timeLine: Date) status: Text
    var
        RMPLineResponseAction: Record "RMP Line Response Action";
    begin
        RMPLineResponseAction.Reset;
        RMPLineResponseAction.SetRange("Document No", docNo);
        RMPLineResponseAction.SetRange("Risk ID", riskId);
        RMPLineResponseAction.SetRange("Action ID", actionId);
        if RMPLineResponseAction.FindSet then begin
            RMPLineResponseAction."Responsible Officer No." := Officer;
            RMPLineResponseAction.Validate("Responsible Officer No.");
            RMPLineResponseAction."Risk Response Action Taken" := riskAction;
            RMPLineResponseAction."Activity Description" := mitigationStrat;
            RMPLineResponseAction."Risk Response Action Taken" := riskAction;
            if actionStatus = 'Planned' then
                RMPLineResponseAction."Action Status" := RMPLineResponseAction."action status"::Planned;
            if actionStatus = 'Completed' then
                RMPLineResponseAction."Action Status" := RMPLineResponseAction."action status"::Completed;
            if actionStatus = 'Ongoing' then
                RMPLineResponseAction."Action Status" := RMPLineResponseAction."action status"::Ongoing;
            RMPLineResponseAction.Validate("Risk Response Action Taken");
            RMPLineResponseAction.Timeline := timeLine;
            if RMPLineResponseAction.Modify(true) then begin

                status := 'success*Response was edited successfully';
            end else begin
                status := 'danger*The operation was not successful';
            end;
        end else begin
            status := 'danger*risk response could not be found';
        end;
    end;

    procedure FnAddRiskOwnershipVoucher(requisitionNo: Code[50]; riskId: Integer; tresponsibilityCenter: Code[50]; tOfficer: Code[50]) status: Text
    var
        NewRiskLineOwnership: Record "New Risk Line Ownership";
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange("Document No", requisitionNo);
        NewRiskVoucherLine.SetRange("Risk ID", riskId);
        if NewRiskVoucherLine.FindSet then begin
            NewRiskLineOwnership.Init;
            NewRiskLineOwnership."Document Type" := NewRiskLineOwnership."document type"::"New Risk Voucher";
            NewRiskLineOwnership."Document No" := requisitionNo;
            Message('%1', tOfficer);
            NewRiskLineOwnership."Risk ID" := riskId;
            NewRiskLineOwnership."Responsibility Center ID" := tresponsibilityCenter;
            NewRiskLineOwnership.Validate("Responsibility Center ID");
            NewRiskLineOwnership."Responsible Officer No." := tOfficer;
            NewRiskLineOwnership.Validate("Responsible Officer No.");
            if NewRiskLineOwnership.Insert(true) then begin
                status := 'success*Officer added successfully';
            end else begin
                status := 'danger*The operation was unsuccessful';
            end
        end else begin
            status := 'danger*Risk Not Found';
        end
    end;

    procedure FnEditRiskResponseVoucher(requisitionNo: Text; riskId: Integer; actionId: Integer; mitigationStrat: Text; riskAction: Text; Officer: Text; actionStatus: Code[10]; ttimelines: Date) status: Text
    var
        NewRiskLineRespAction: Record "New Risk Line Resp. Action";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskMEHeader: Record "Risk M&E Header";
    begin
        NewRiskLineRespAction.Reset;
        NewRiskLineRespAction.SetRange("Document No", requisitionNo);
        NewRiskLineRespAction.SetRange("Risk ID", riskId);
        NewRiskLineRespAction.SetRange("Action ID", actionId);
        if NewRiskLineRespAction.FindSet then begin
            //NewRiskLineRespAction.Risk := NewRiskVoucherLine."Risk Title";
            NewRiskLineRespAction."Responsible Officer No." := Officer;
            NewRiskLineRespAction.Validate("Responsible Officer No.");
            NewRiskLineRespAction."Risk Response Action Taken" := riskAction;
            NewRiskLineRespAction."Activity Description" := mitigationStrat;
            //NewRiskLineRespAction."Risk Response Action Taken" := riskAction;
            if Lowercase(actionStatus) = 'planned' then
                NewRiskLineRespAction."Action Status" := NewRiskLineRespAction."action status"::Planned;
            if Lowercase(actionStatus) = 'completed' then
                NewRiskLineRespAction."Action Status" := NewRiskLineRespAction."action status"::Completed;
            if Lowercase(actionStatus) = 'ongoing' then
                NewRiskLineRespAction."Action Status" := NewRiskLineRespAction."action status"::Ongoing;
            // NewRiskLineRespAction."Planned Due Date" := dueDate;
            NewRiskLineRespAction.Timeline := ttimelines;
            if NewRiskLineRespAction.Modify(true) then begin
                status := 'success*Response Action Edited successfully';
            end else begin
                status := 'danger*The operation was unsuccessful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnEditRiskOwnershipVoucher(requisitionNo: Code[50]; riskId: Integer; tresponsibilityCenter: Code[50]; tOfficer: Code[50]) status: Text
    var
        NewRiskLineOwnership: Record "New Risk Line Ownership";
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
    begin
    end;

    procedure FnAddRiskResponseVoucher(requisitionNo: Text; riskId: Integer; mitigationStrat: Text; riskAction: Text; Officer: Text; actionStatus: Code[50]; ttimelines: Date) status: Text
    var
        NewRiskLineRespAction: Record "New Risk Line Resp. Action";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskMEHeader: Record "Risk M&E Header";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange("Document No", requisitionNo);
        if NewRiskVoucherLine.FindSet then begin
            NewRiskLineRespAction.Init;
            NewRiskLineRespAction."Risk ID" := riskId;
            NewRiskLineRespAction."Document No" := requisitionNo;
            NewRiskLineRespAction."Document Type" := NewRiskLineRespAction."document type"::"Functional (Department)";
            //NewRiskLineRespAction.Risk := NewRiskVoucherLine."Risk Title";
            NewRiskLineRespAction."Responsible Officer No." := Officer;
            NewRiskLineRespAction.Validate("Responsible Officer No.");
            NewRiskLineRespAction."Risk Response Action Taken" := riskAction;
            NewRiskLineRespAction."Activity Description" := mitigationStrat;
            NewRiskLineRespAction."Risk Response Action Taken" := riskAction;
            if Lowercase(actionStatus) = 'planned' then
                NewRiskLineRespAction."Action Status" := NewRiskLineRespAction."action status"::Planned;
            if Lowercase(actionStatus) = 'completed' then
                NewRiskLineRespAction."Action Status" := NewRiskLineRespAction."action status"::Completed;
            if Lowercase(actionStatus) = 'ongoing' then
                NewRiskLineRespAction."Action Status" := NewRiskLineRespAction."action status"::Ongoing;
            NewRiskLineRespAction.Validate("Risk Response Action Taken");
            // NewRiskLineRespAction."Planned Due Date" := dueDate;
            NewRiskLineRespAction.Timeline := ttimelines;
            if NewRiskLineRespAction.Insert(true) then begin
                status := 'success*The operation was successful';
            end else begin
                status := 'danger*The operation was unsuccessful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnRemoveRiskResponseVoucher(requisitionNo: Text; riskId: Integer; actionId: Integer) status: Text
    var
        NewRiskLineRespAction: Record "New Risk Line Resp. Action";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskMEHeader: Record "Risk M&E Header";
    begin
        NewRiskLineRespAction.Reset;
        NewRiskLineRespAction.SetRange("Document No", requisitionNo);
        NewRiskLineRespAction.SetRange("Risk ID", riskId);
        NewRiskLineRespAction.SetRange("Action ID", actionId);
        if NewRiskLineRespAction.FindSet then begin
            if NewRiskLineRespAction.Delete(true) then begin
                status := 'success*Response Action Deleted successfully';
            end else begin
                status := 'danger*The operation was unsuccessful';
            end
        end else begin
            status := 'danger*The document could not be found';
        end
    end;

    procedure FnRemoveRiskOwnershipVoucher(requisitionNo: Code[50]; riskId: Integer; tOfficer: Code[50]) status: Text
    var
        NewRiskLineOwnership: Record "New Risk Line Ownership";
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
    begin
        NewRiskLineOwnership.Reset;
        NewRiskLineOwnership.SetRange("Document No", requisitionNo);
        NewRiskLineOwnership.SetRange("Risk ID", riskId);
        NewRiskLineOwnership.SetRange("Responsible Officer No.", tOfficer);
        if NewRiskLineOwnership.FindSet then begin
            if NewRiskLineOwnership.Delete(true) then begin
                status := 'success*Responsible Officer Deleted successfully';
            end else begin
                status := 'danger*The operation was unsuccessful';
            end
        end else begin
            status := 'danger*Risk Not Found';
        end
    end;

    procedure addLogActions(tdesc: Text; tactionType: Option; ttaskPriority: Option; tresponsibleOfficer: Code[50]; tplannedStartDate: Date; tplannedEndDate: Date; tIncidentID: Code[50]) status: Text
    var
        RiskIncidentLogAction: Record "Risk Incident Log Action";
        RiskIncidentLog: Record "Risk Incident Log";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", tIncidentID);
        if RiskIncidentLog.FindSet then begin
            RiskIncidentLogAction.Init;
            RiskIncidentLogAction."Incident ID" := tIncidentID;
            RiskIncidentLogAction.Description := tdesc;
            RiskIncidentLogAction."Action Type" := tactionType;
            RiskIncidentLogAction."Task Priority" := ttaskPriority;
            RiskIncidentLogAction."Responsible Officer No." := tresponsibleOfficer;
            RiskIncidentLogAction."Planned Start Date" := tplannedStartDate;
            RiskIncidentLogAction."Planned Due Date" := tplannedEndDate;

            if RiskIncidentLogAction.Insert(true) then begin

                status := 'success*Risk IncidentLog Action has been added successfully';
            end else begin
                status := 'danger* Risk IncidentLog action has not been added';
            end

        end else begin
            status := 'danger* Risk Incident Log could not be found';
        end
    end;

    procedure CreateIncidentFollowUp(incidentId: Code[10]) status: Text
    var
        RiskIncidentLog: Record "Risk Incident Log";
        RiskIncidentLog1: Record "Risk Incident Log";
        RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry";
        RiskIncidentLogImpactR: Record "Risk Incident Log Impact R";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", incidentId);
        if RiskIncidentLog.FindSet then begin
            RiskIncidentLog1.Reset;
            RiskIncidentLog1.SetRange("Document Type", RiskIncidentLog."document type"::"Risk Incident Follow-up");
            RiskIncidentLog1.SetRange("Risk Incident No.", incidentId);
            if RiskIncidentLog1.FindSet then begin
                status := 'success*You have an existing follow up for the same incident *' + RiskIncidentLog1."Incident ID";
            end else begin
                RiskIncidentLog1.Init;
                RiskIncidentLog1."Document Type" := RiskIncidentLog1."document type"::"Risk Incident Follow-up";
                RiskIncidentLog1."Risk Incident No." := incidentId;
                RiskIncidentLog1.Validate("Risk Incident No.");
                RiskManagement.FnSuggestFollowUp(RiskIncidentLog1, RiskIncidentLedgerEntry, RiskIncidentLogImpactR);
                if RiskIncidentLog1.Insert(true) then begin
                    status := 'success*Operation was successful*' + RiskIncidentLog1."Incident ID";
                end else begin
                    status := 'danger*FollowUp could not be added';
                end
            end

        end else begin
            status := 'danger* Incident with Id' + incidentId + ' could not be found';
        end
    end;

    procedure getImprestReceipts(empNo: Code[50]) receipts: Text
    var
        ReceiptsHeader1: Record "Receipts Header1";
        ReceiptLines1: Record "Receipt Lines1";
        receiptsQuery: Query receipts;
    begin
        /*// Sets a filter to display only sales quantities greater than 20.
        MESSAGE('1');
        receiptsQuery.SETFILTER(receiptsQuery.Account_No, empNo);
        MESSAGE('11');
        // Runs the query.
        receiptsQuery.OPEN;
        // Reads each row in the dataset and displays message with column values.
        // Stops reading when there are no more rows remaining in the dataset (READ is FALSE).
        WHILE receiptsQuery.READ DO
          MESSAGE('2');
        BEGIN
          MESSAGE(receiptsQuery.Account_No, receiptsQuery.Allocated_Amount);
        END;
        // Closes the query.
        receiptsQuery.CLOSE;
        MESSAGE('12')
        
        {receiptsQuery.rea
        receiptsQuery.SETRANGE(Account_No,empNo);
        IF receiptsQuery.FINDSET THEN BEGIN
        
        REPEAT
          UNTIL receiptsQuery.Next := 0;
          END ELSE BEGIN
            END
            }
            */

    end;

    procedure addLogActionDetails(requisitionNo: Code[50]; lineNo: Integer; percCompleted: Integer; comment: Text) status: Text
    var
        RiskIncidentLogAction: Record "Risk Incident Log Action";
    begin
        RiskIncidentLogAction.Reset;
        RiskIncidentLogAction.SetRange("Incident ID", requisitionNo);
        RiskIncidentLogAction.SetRange("Action Line No.", lineNo);
        if RiskIncidentLogAction.FindSet then begin
            RiskIncidentLogAction."% Complete" := percCompleted;
            RiskIncidentLogAction.Comments := comment;
            if RiskIncidentLogAction.Modify(true) then begin
                status := 'success* Follow up details were added successfully';
            end else begin
                status := 'danger* An error occured while adding follow up details';
            end
        end else begin
            status := 'danger* Follow up with Id ' + requisitionNo + ' could not be found';
        end
    end;

    procedure CreateImplementationStatusFollowUp(incidentId: Code[50]) status: Text
    var
        RiskIncidentLog: Record "Risk Incident Log";
        RiskIncidentLog1: Record "Risk Incident Log";
        RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry";
        RiskIncidentLogImpactR: Record "Risk Incident Log Impact R";
    begin
        RiskIncidentLog.Reset;
        RiskIncidentLog.SetRange("Incident ID", incidentId);
        if RiskIncidentLog.FindSet then begin
            RiskIncidentLog1.Reset;
            RiskIncidentLog1.SetRange("Document Type", RiskIncidentLog."document type"::"Implementation Status");
            RiskIncidentLog1.SetRange("Risk Incident No.", incidentId);
            if RiskIncidentLog1.FindSet then begin
                status := 'success*You have an existing iplementation follow up for the same incident *' + RiskIncidentLog1."Incident ID";
            end else begin
                RiskIncidentLog1.Init;
                RiskIncidentLog1."Document Type" := RiskIncidentLog1."document type"::"Implementation Status";
                RiskIncidentLog1."Risk Incident No." := incidentId;
                RiskIncidentLog1.Validate("Risk Incident No.");
                RiskManagement.FnSuggestFollowUp(RiskIncidentLog1, RiskIncidentLedgerEntry, RiskIncidentLogImpactR);
                if RiskIncidentLog1.Insert(true) then begin
                    status := 'success*Operation was successful*' + RiskIncidentLog1."Incident ID";
                end else begin
                    status := 'danger*FollowUp could not be added';
                end
            end

        end else begin
            status := 'danger* Incident with Id' + incidentId + ' could not be found';
        end
    end;

    local procedure FNnotifyEscalator(RiskIncidentLogAction: Record "Risk Incident Log Action")
    var
        CompInfo: Record "Company Information";
        HRSetup: Record "Human Resources Setup";
        RequesterEmail: Text;
        RequesterName: Text;
        SenderAddress: Text;
        CustEmail: Text;
        CompanyDetails: Text;
        SenderMessage: Text;
    begin
        //cc Send Escalation Notification
        CompInfo.Get;
        HRSetup.Get;
        // Window.OPEN('Sending...');
        // WindowisOpen := TRUE;

        //cc
        RequesterEmail := RiskIncidentLogAction."Responsible Officer Email";
        RequesterName := RiskIncidentLogAction."Responsible Officer Email";
        //Create message
        if RequesterEmail = '' then
            Error('Kindly Ensure the Escalator Has a valid E-Mail Address');
        SenderAddress := HRSetup."HR E-mail Address";
        CustEmail := RequesterEmail;
        CompanyDetails := 'Dear ' + Employee.FullName;
        SenderMessage := '<BR>This is to Notify of an Escalation of Incident ID :' + RiskIncidentLogAction."Incident ID" + ' :'
        + RiskIncidentLogAction.Description + ' ,Kindly log in and update. </BR>';

        //MESSAGE('%1',CustEmail);
        if CustEmail = '' then
            exit;
        //SMTP.Create(CompInfo.Name, SenderAddress,
        //CustEmail, RiskIncidentLogAction."Incident ID" + '-' + RiskIncidentLogAction.Description,
        //'Dear ' + 'Sir/Madam' + ',<BR><BR>' +
        //'Please Login to the ERP to update implementation status of the action taken', true);

        //SMTP.AppendToBody(
        // '<BR><BR>Kind Regards,');
        //SMTP.AppendToBody('<BR>' + CompInfo.Name);
        ////SMTP.AddAttachment(FileDirectory+FileName,FileName);
        //SMTP.Send;
        //SLEEP(1000);
        ///Window.CLOSE;
        Message('Escalation Notification Has Been Forwarded.');
        // UNTIL InsuranceReg.NEXT=0;
    end;
}

