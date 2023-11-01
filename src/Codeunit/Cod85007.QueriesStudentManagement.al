codeunit 85007 QueriesStudentManagement
{
    var
        ExaminationResults: Record "Examination Results";
        DynasoftPortalUser: Record "Dynasoft Portal User";
        ExamBookingEntries: Record "Exam Booking Entries";
        StudentBookingLines: Record "Student Processing Lines";
        Examination: Codeunit Examination;
        EntryNo: Integer;
        studentProcessingHeader: Record "Student Processing Header";
        studentProcessingLines: Record "Student Processing Lines";
        examinationAccounts: Record "Examination Account";
        exemptionEntries: Record "Exemption Entries";
        exemptionLines: Record "Exemption Lines";
        exemptionQualifications: Record "Exemption Qualifications";
        attachDocuments: Record "Examination Document Line";
        documentTemplate: Record "Document Template";
        mpesaTransaction: Record "MPESA Integration Table";
        brResponseSection: Record "BR Response Section";
        brResponseQuestion: Record "BR Response Question";
        brResponseScoreGuide: Record "BR Response Score Guide";
        examCenters: Record "Examination Centres";
        examZones: Record "Exam Zones";
        examRegions: Record "Exam Regions";
        examcourses: Record "Job Task";
        centerCourseCapacity: record "Center Course Capacity";
        papers: Record Papers;
        crmCases: Record "CRM Cases";
        bookingEntries: Record "Exam Booking Entries";
        examSittingcycle: record "Exam Sitting Cycle";
        courses: Record Courses;
        withdrawalReasons: Record "Withdrawal Reasons";
        parts: Record Level;
        payMode: Record "Pay Mode";
        intCustomers: Record Customer;
        county: Record County1;
        currency: Record Currency;
        postCodes: record "Post Code";
        qualification: Record Qualification;
        paymentMode: Record "Payment Modes";
        examjob: Record Job;
        disabilityEntries: Record "Student Disability";
        studentQualifications: Record "Student Qualifications";
        sourceCategories: Record "Source Categories";
        crmTraining: Record "CRM Training";
        innovationSolicitationLines: Record "Innovation Solicitation Line";
        timePlanners: Record "Timetable Planner Header";
        crmVacancies: Record "CRM Vacancies";
        crmVacancancyRequirement: Record "CRM Vacancy Requirement";
        crmVacancyResponsibility: Record "CRM Vacancy Responsibility";
        bulkProcessingHeader: Record "Bulk Processing Header";
        bulkProcessingLines: Record "Bulk Processing Lines";
        studentDisability: Record "Disability Code";
        countries: Record "Country/Region";
        sitting: Record "Exam Sitting Cycle";
        level: Record Level;
        centerBookingEntries: Record "Center Booking Entries";
        ExaminationSetup: Record "Examination Setup";
        jobTask: Record "Job Task";
        StudentReegistrationQualif: Record "Student Registration Qualifi";


    procedure getStudentProcessing(studentNo: Code[10]; docType: Option; posted: Boolean; cancelled: Boolean) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        no: text;
        idNo: Text;
        studRegNo: Text;
        posted2: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetRange(posted, posted);
        studentProcessingHeader.SetRange(Cancelled, cancelled);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                no := Format(studentProcessingHeader."No.");
                idNo := Format(studentProcessingHeader."ID Number/Passport No.");
                studRegNo := Format(studentProcessingHeader."Student Reg. No.");
                posted2 := Format(studentProcessingHeader.Posted);



                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting + '*' + bookingAmount +
                '*' + no + '*' + idNo + '*' + studRegNo + '*' + posted2 + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing2(IdNo: Code[30]) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("ID Number/Passport No.", IdNo);
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."Approval Status"::Open);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting + '*' + bookingAmount + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing3(IdNo: Code[30]) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("ID Number/Passport No.", IdNo);
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."Approval Status"::Open);
        studentProcessingHeader.SetFilter("Examination ID", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting + '*' + bookingAmount + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing4(studentNo: Code[10]; docType: Option) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        datee: Text;
        approvalstatus: Text;
        no: Text;
        Id: Text;
        studNo: Text;
        remarkInvoiceNo: Text;
        regNo: text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                datee := Format(studentProcessingHeader.Date);
                approvalstatus := Format(studentProcessingHeader."Approval Status");
                no := Format(studentProcessingHeader."No.");
                Id := Format(studentProcessingHeader."ID Number/Passport No.");
                studNo := Format(studentProcessingHeader."Student No.");
                remarkInvoiceNo := Format(studentProcessingHeader."Remark Invoice No.");
                regNo := Format(studentProcessingHeader."Student Reg. No.");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting
                + '*' + bookingAmount + '*' + datee + '*' + approvalstatus + '*' + no + '*' + Id + '*' + studNo + '*' + remarkInvoiceNo + '*' + regNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing5(appNo: Code[10]) AllData: Text
    var
        studentName: Text;
        examId: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", appNo);
        studentProcessingHeader.SetFilter("Highest Academic Qualification", '<>%1', '');
        studentProcessingHeader.SetFilter("Contact Full Name", '<>%1', '');
        studentProcessingHeader.SetFilter("Examination ID", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");

                AllData := AllData + studentName + '*' + examId + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing6(appNo: Code[10]) AllData: Text
    var
        studentName: Text;
        examId: Text;
        disabled: Text;
        exemptionAmount: Text;
        activationAmount: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", appNo);
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                disabled := Format(studentProcessingHeader.Disabled);
                exemptionAmount := Format(studentProcessingHeader."Exemption Amount");
                activationAmount := Format(studentProcessingHeader."Activation Amount");

                AllData := AllData + studentName + '*' + examId + '*' + disabled +
                '*' + exemptionAmount + '*' + activationAmount + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing7(appNo: Code[10]; studentNo: Code[30]; examIDD: code[30]) AllData: Text
    var
        studentName: Text;
        examId: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", appNo);
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Examination ID", examIDD);
        studentProcessingHeader.SetFilter("Examination Center Code", '<>%1', '');
        studentProcessingHeader.SetFilter("Examination Center", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");

                AllData := AllData + studentName + '*' + examId + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing8(appNo: Code[10]; studentNo: Code[30]; examIDD: code[30]) AllData: Text
    var
        studentName: Text;
        examId: Text;
        countyRegionCode: Text;
        county: Text;
        postCode: Text;
        city: Text;
        address: Text;
        examSitting: Text;
        highestAcademicQualification: Text;
        trainingInstitutionCode: Text;
        sourceOfInformation: Text;
        examCenterCode: Text;
        feeType: Text;
        contactFullName: Text;
        contactEmail: Text;
        contactPhoneNo: Text;
        examinationDescription: Text;
        disabled: Text;
        dateOfBirth: Text;
        gender: Text;
        contactRelationship: Text;
        applicationAmount: Text;
        examProjectCode: Text;
        bookingAmount: Text;


    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", appNo);
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Examination ID", examIDD);
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                countyRegionCode := Format(studentProcessingHeader."Country/Region Code");
                county := Format(studentProcessingHeader.County);
                postCode := Format(studentProcessingHeader."Post Code");
                city := Format(studentProcessingHeader.City);
                address := Format(studentProcessingHeader.Address);
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                highestAcademicQualification := Format(studentProcessingHeader."Highest Academic QCode");
                trainingInstitutionCode := Format(studentProcessingHeader."Training Institution Code");
                sourceOfInformation := Format(studentProcessingHeader."Source of Information");
                examCenterCode := Format(studentProcessingHeader."Examination Center Code");
                feeType := Format(studentProcessingHeader."Fee Type");
                contactFullName := Format(studentProcessingHeader."Contact Full Name");
                contactEmail := Format(studentProcessingHeader."Contact Email");
                contactPhoneNo := Format(studentProcessingHeader."Contact Phone No.");
                examinationDescription := Format(studentProcessingHeader."Examination Description");
                disabled := Format(studentProcessingHeader.Disabled);
                dateOfBirth := Format(studentProcessingHeader."Date of Birth");
                gender := Format(studentProcessingHeader.Gender);
                contactRelationship := Format(studentProcessingHeader."Contact Relationship");
                applicationAmount := Format(studentProcessingHeader."Application Amount");
                examProjectCode := Format(studentProcessingHeader."Examination Project Code");

                AllData := AllData + studentName + '*' + examId + '*' + applicationAmount + '*' + countyRegionCode + '*' + county + '*' + postCode + '*'
                + city + '*' + address + '*' + examSitting + '*' + highestAcademicQualification + '*' + trainingInstitutionCode + '*' + sourceOfInformation
                 + '*' + examCenterCode + '*' + feeType + '*' + contactFullName + '*' + contactPhoneNo + '*' + examinationDescription + '*' + disabled + '*'
                 + dateOfBirth + '*' + gender + '*' + contactRelationship + '*' + examProjectCode + '*' + bookingAmount + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing9(appNo: Code[10]; studentNo: Code[30]; docType: Option) AllData: Text
    var
        studentName: Text;
        examId: Text;
        renewalAmount: Text;
        paymentReferenceNo: Text;
        payMode: Text;
        ApplicationReceipt: Text;
        no: Text;
        studNo: Text;
        examCenter: Text;
        examCenterDesc: Text;
        studRegNo: Text;


    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", appNo);
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                renewalAmount := Format(studentProcessingHeader."Renewal Amount");
                paymentReferenceNo := Format(studentProcessingHeader."Payment Reference No.");
                payMode := Format(studentProcessingHeader."Pay Mode");
                ApplicationReceipt := Format(studentProcessingHeader."Application Receipt");
                studNo := Format(studentProcessingHeader."Student No.");
                examCenter := Format(studentProcessingHeader."Examination Center Code");
                examCenterDesc := Format(studentProcessingHeader."Examination Center");
                studRegNo := Format(studentProcessingHeader."Student Reg. No.");


                AllData := AllData + studentName + '*' + examId + '*' + renewalAmount + '*' + renewalAmount +
                '*' + paymentReferenceNo + '*' + payMode + '*' + ApplicationReceipt + '*' + studNo + '*' +
                 examCenter + '*' + studRegNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing10(studentNo: Code[30]; docType: Option; submitted: Boolean) AllData: Text
    var
        studentName: Text;
        examId: Text;
        no: Text;
        idNo: Text;
        address: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange(Submitted, submitted);
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                no := Format(studentProcessingHeader."No.");
                idNo := Format(studentProcessingHeader."ID Number/Passport No.");
                address := Format(studentProcessingHeader.Address);

                AllData := AllData + studentName + '*' + examId + '*' + no + '*' + idNo + '*' + address + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing11(appNo: Code[10]; studentNo: Code[30]) AllData: Text
    var
        studentName: Text;
        examId: Text;
        regNo: Text;
        withdrawalCode: Text;
        examSitting: Text;
        preferedExaminationSitting: Text;
        adminFees: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", appNo);
        studentProcessingHeader.SetRange("Student No.", studentNo);

        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                regNo := Format(studentProcessingHeader."Student Reg. No.");
                withdrawalCode := Format(studentProcessingHeader."Withdrawal Code");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                preferedExaminationSitting := Format(studentProcessingHeader."Prefered Examination Sitting");
                adminFees := Format(studentProcessingHeader."Administrative Fees");


                AllData := AllData + studentName + '*' + examId + '*' + regNo + '*' + withdrawalCode + '*' + examSitting
                + '*' + preferedExaminationSitting + '*' + adminFees + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getStudentProcessing12(idNo: Code[10]; docType: option) AllData: Text
    var
        studentName: Text;
        examId: Text;
        ID: Text;
        withdralReason: Text;
        approvalStatus: Text;
        reasonForRejection: Text;
        posted: Text;
        datee: Text;
        no: Text;
        applicationInvoice: Text;
        examDesc: Text;
        studNo: Text;



    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("ID Number/Passport No.", idNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetRange(Posted, false);
        studentProcessingHeader.SetRange(Submitted, true);
        studentProcessingHeader.SetFilter("Application Invoice", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                withdralReason := Format(studentProcessingHeader."Withdrawal Reason");
                approvalStatus := Format(studentProcessingHeader."Approval Status");
                reasonForRejection := Format(studentProcessingHeader."Reason for Rejection");
                posted := Format(studentProcessingHeader.Posted);
                ID := Format(studentProcessingHeader."ID Number/Passport No.");
                no := Format(studentProcessingHeader."No.");
                applicationInvoice := Format(studentProcessingHeader."Application Invoice");
                examDesc := Format(studentProcessingHeader."Examination Description");
                studNo := Format(studentProcessingHeader."Student No.");


                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + withdralReason + '*' + approvalStatus + '*' + reasonForRejection + '*'
                + posted + '*' + ID + '*' + no + '*' + applicationInvoice + '*' + posted + '*' + studNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing13(studNo: Code[10]; docType: option) AllData: Text
    var
        studentName: Text;
        examId: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student Reg. No.", studNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetRange(posted, true);
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");

                AllData := AllData + studentName + '*' + examId + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing14(idNo: Code[10]; docType: option) AllData: Text
    var
        studentName: Text;
        examId: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("ID Number/Passport No.", idNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetFilter("Exemption Invoice No.", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");

                AllData := AllData + studentName + '*' + examId + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getStudentProcessing15(studNo: code[30]) AllData: Text
    var
        studentName: Text;
        examId: Text;
        no: Text;
        courseDescription: Text;
        studentNo: Text;


    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student Reg. No.", studNo);
        studentProcessingHeader.SetRange(Created, true);
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");

                AllData := AllData + studentName + '*' + examId + '*' + no + '*' + courseDescription + '*' + studentNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getStudentProcessing16(IdNo: Code[30]) AllData: Text
    var
        studentNo: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("ID Number/Passport No.", IdNo);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentNo := Format(studentProcessingHeader."Student No.");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");

                AllData := AllData + studentNo + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting + '*' + bookingAmount + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing17(appNo: Code[10]; docType: option; studNo: code[30]) AllData: Text
    var
        studentName: Text;
        examId: Text;
        no: Text;
        studNo1: Text;
        trainingInstitution: Text;
        examinationCenter: Text;
        bookingReceiptNo: Text;
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", appNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetRange("Student Reg. No.", studNo);
        studentProcessingHeader.SetRange(Submitted, true);
        studentProcessingHeader.SetFilter("Booking Invoice No.", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                no := Format(studentProcessingHeader."No.");
                studNo1 := Format(studentProcessingHeader."Student No.");
                trainingInstitution := Format(studentProcessingHeader."Training Institution");
                examinationCenter := Format(studentProcessingHeader."Examination Center");
                bookingReceiptNo := Format(studentProcessingHeader."Booking Receipt No.");

                AllData := AllData + studentName + '*' + examId + '*' + no + '*' + studNo1 + '*' + trainingInstitution +
                '*' + examinationCenter + '*' + bookingReceiptNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing18(studentNo: Code[10]; docType: Option; submitted: Boolean) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        no: Text;
        studNo: Text;
        studRegNo: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetRange(Submitted, submitted);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                no := Format(studentProcessingHeader."No.");
                studNo := Format(studentProcessingHeader."Student No.");
                studRegNo := format(studentProcessingHeader."Student Reg. No.");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting + '*' + bookingAmount + '*'
                + no + '*' + studNo + '*' + studRegNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing19(studentNo: Code[10]; docType: Option; posted: Boolean; submitted: Boolean) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        no: Text;
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetRange(posted, posted);
        studentProcessingHeader.SetRange(Submitted, submitted);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                no := Format(studentProcessingHeader."No.");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting + '*' + bookingAmount + '*' + no + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing20(studentNo: Code[10]; docType: Option; submitted: Boolean) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetRange(Submitted, submitted);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting + '*' + bookingAmount + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing21(IdNo: Code[30]; docType: Option) AllData: Text
    var
        studentNo: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        projCode: text;
        no: Text;
        approvalStatus: Text;
        submitted: Text;
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("ID Number/Passport No.", IdNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentNo := Format(studentProcessingHeader."Student No.");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                projCode := Format(studentProcessingHeader."Examination Project Code");
                no := Format((studentProcessingHeader."No."));
                approvalStatus := Format(studentProcessingHeader."Approval Status");
                submitted := Format(studentProcessingHeader.Submitted);


                AllData := AllData + studentNo + '*' + examId + '*' + examDesc + '*' + examCenter +
                '*' + examSitting + '*' + bookingAmount + '*' + no + '*' + projCode + '*' + approvalStatus + '*' + submitted + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing22(appNo: Code[10]; ididNNo: Code[30]; examIDD: code[30]) AllData: Text
    var
        studentName: Text;
        examId: Text;
        countyRegionCode: Text;
        county: Text;
        postCode: Text;
        city: Text;
        address: Text;
        examSitting: Text;
        highestAcademicQualification: Text;
        trainingInstitutionCode: Text;
        sourceOfInformation: Text;
        examCenterCode: Text;
        feeType: Text;
        contactFullName: Text;
        contactEmail: Text;
        contactPhoneNo: Text;
        examinationDescription: Text;
        disabled: Text;
        dateOfBirth: Text;
        gender: Text;
        contactRelationship: Text;
        applicationAmount: Text;
        examProjectCode: Text;
        bookingAmount: Text;
        phoneNo: Text;
        lastName: Text;
        middleName: Text;
        address2: Text;
        trainingInst: Text;


    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", appNo);
        studentProcessingHeader.SetRange("ID Number/Passport No.", ididNNo);
        studentProcessingHeader.SetRange("Examination ID", examIDD);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                countyRegionCode := Format(studentProcessingHeader."Country/Region Code");
                county := Format(studentProcessingHeader.County);
                postCode := Format(studentProcessingHeader."Post Code");
                city := Format(studentProcessingHeader.City);
                address := Format(studentProcessingHeader.Address);
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                highestAcademicQualification := Format(studentProcessingHeader."Highest Academic QCode");
                trainingInstitutionCode := Format(studentProcessingHeader."Training Institution Code");
                sourceOfInformation := Format(studentProcessingHeader."Source of Information");
                examCenterCode := Format(studentProcessingHeader."Examination Center Code");
                feeType := Format(studentProcessingHeader."Fee Type");
                contactFullName := Format(studentProcessingHeader."Contact Full Name");
                contactEmail := Format(studentProcessingHeader."Contact Email");
                contactPhoneNo := Format(studentProcessingHeader."Contact Phone No.");
                examinationDescription := Format(studentProcessingHeader."Examination Description");
                disabled := Format(studentProcessingHeader.Disabled);
                dateOfBirth := Format(studentProcessingHeader."Date of Birth");
                gender := Format(studentProcessingHeader.Gender);
                contactRelationship := Format(studentProcessingHeader."Contact Relationship");
                applicationAmount := Format(studentProcessingHeader."Application Amount");
                examProjectCode := Format(studentProcessingHeader."Examination Project Code");
                phoneNo := Format(studentProcessingHeader."Phone No.");
                middleName := Format(studentProcessingHeader."Middle Name");
                lastName := Format(studentProcessingHeader.Surname);
                address2 := Format(studentProcessingHeader."Address 2");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                trainingInst := Format(studentProcessingHeader."Training Institution Code");

                AllData := AllData + studentName + '*' + examId + '*' + applicationAmount + '*' + countyRegionCode + '*' + county + '*' + postCode + '*'
                + city + '*' + address + '*' + examSitting + '*' + highestAcademicQualification + '*' + trainingInstitutionCode + '*' + sourceOfInformation
                 + '*' + examCenterCode + '*' + feeType + '*' + contactFullName + '*' + contactPhoneNo + '*' + examinationDescription + '*' + disabled + '*'
                 + dateOfBirth + '*' + gender + '*' + contactRelationship + '*' + examProjectCode + '*' + bookingAmount + '*' + contactEmail +
                 '*' + phoneNo + '*' + middleName + '*' + lastName + '*' + address2 + '*' + trainingInst + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getStudentProcessing23(appNo: Code[10]; submitted: Boolean; paymentCreated: boolean) AllData: Text
    var
        studentName: Text;
        examId: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", appNo);
        studentProcessingHeader.SetRange(Submitted, submitted);
        studentProcessingHeader.SetRange("Payment Created", paymentCreated);

        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");

                AllData := AllData + studentName + '*' + examId + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing24(idNo: Code[10]; docType: option) AllData: Text
    var
        studentName: Text;
        examId: Text;
        no: Text;
        Id: Text;
        withdralReason: Text;
        approvalStatus: Text;
        reasonForRejection: Text;
        posted: Text;
        datee: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("ID Number/Passport No.", idNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                no := Format(studentProcessingHeader."No.");
                Id := Format(studentProcessingHeader."ID Number/Passport No.");
                withdralReason := Format(studentProcessingHeader."Withdrawal Reason");
                approvalStatus := Format(studentProcessingHeader."Approval Status");
                reasonForRejection := Format(studentProcessingHeader."Reason for Rejection");
                posted := Format(studentProcessingHeader.Posted);
                datee := Format(studentProcessingHeader.Date);

                AllData := AllData + studentName + '*' + examId + '*' + no + '*' + Id + '*' + withdralReason + '*' + approvalStatus +
                 '*' + reasonForRejection + '*' + posted + '*' + datee + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing25(studentNo: Code[10]; docType: Option; posted: Boolean; submitted: Boolean) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        no: Text;
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetRange(posted, posted);
        studentProcessingHeader.SetRange(Submitted, submitted);
        studentProcessingHeader.setfilter("Application Invoice", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                no := Format(studentProcessingHeader."No.");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting + '*' + bookingAmount + '*' + no + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing26(IdNo: Code[30]; docType: Option) AllData: Text
    var
        studentName: Text;
        studName: Text;
        examDesc: Text;
        Id: Text;
        reasonForRej: Text;
        posted: Text;
        no: Text;
        examId: Text;
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("ID Number/Passport No.", IdNo);
        studentProcessingHeader.SetRange("Approval Status", studentProcessingHeader."Approval Status"::Rejected);
        studentProcessingHeader.SetRange("Document Type", docType);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                Id := Format(studentProcessingHeader."ID Number/Passport No.");
                examDesc := Format(studentProcessingHeader."Examination Description");
                reasonForRej := Format(studentProcessingHeader."Reason for Rejection");
                posted := Format(studentProcessingHeader.Posted);
                no := Format(studentProcessingHeader."No.");
                examId := Format(studentProcessingHeader."Examination ID");

                AllData := AllData + studentName + '*' + no + '*' + examDesc + '*' + Id + '*' + reasonForRej
                + '*' + posted + '*' + examId + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing27(studNo: code[30]) AllData: Text
    var
        studentNo: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        projCode: text;
        no: Text;
        ApplicationAmount: Text;
        exemptionAmloutn: text;
        docType: text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studNo);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentNo := Format(studentProcessingHeader."Student No.");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                projCode := Format(studentProcessingHeader."Examination Project Code");
                no := Format(studentProcessingHeader."No.");
                ApplicationAmount := Format(studentProcessingHeader."Application Amount");
                exemptionAmloutn := Format(studentProcessingHeader."Exemption Amount");
                docType := Format(studentProcessingHeader."Document Type");

                AllData := AllData + studentNo + '*' + examId + '*' + examDesc + '*' + examCenter +
                '*' + examSitting + '*' + bookingAmount + '*' + no + '*' + projCode + '*' + ApplicationAmount + '*' + exemptionAmloutn + '*' + docType + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing28(studentNo: Code[10]; docType: Option; posted: Boolean) AllData: Text
    var
        studentNo1: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        projCode: text;
        no: Text;
        ApplicationAmount: Text;
        exemptionAmloutn: text;
        highestAcademicApplication: text;
        studentName: Text;
        IdNo: Text;
        regNo: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange(Posted, posted);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentNo1 := Format(studentProcessingHeader."Student No.");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                projCode := Format(studentProcessingHeader."Examination Project Code");
                no := Format(studentProcessingHeader."No.");
                ApplicationAmount := Format(studentProcessingHeader."Application Amount");
                exemptionAmloutn := Format(studentProcessingHeader."Exemption Amount");
                highestAcademicApplication := Format(studentProcessingHeader."Highest Academic Qualification");
                studentName := Format(studentProcessingHeader."Student Name");
                IdNo := Format(studentProcessingHeader."ID Number/Passport No.");
                regNo := Format(studentProcessingHeader."Student Reg. No.");


                AllData := AllData + studentNo1 + '*' + examId + '*' + examDesc + '*' + examCenter +
                '*' + highestAcademicApplication + '*' + no + '*' + studentName + '*' + IdNo + '*' + exemptionAmloutn + '*' + regNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing29(appNo: Code[10]; studN: code[30]) AllData: Text
    var
        studentNo1: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        projCode: text;
        no: Text;
        ApplicationAmount: Text;
        exemptionAmloutn: text;
        highestAcademicApplication: text;
        studentName: Text;
        IdNo: Text;
        regNo: Text;
        AppInvoice: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studN);
        studentProcessingHeader.SetRange("No.", appNo);
        studentProcessingHeader.SetFilter("Application Invoice", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentNo1 := Format(studentProcessingHeader."Student No.");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                projCode := Format(studentProcessingHeader."Examination Project Code");
                no := Format(studentProcessingHeader."No.");
                ApplicationAmount := Format(studentProcessingHeader."Application Amount");
                exemptionAmloutn := Format(studentProcessingHeader."Exemption Amount");
                highestAcademicApplication := Format(studentProcessingHeader."Highest Academic Qualification");
                studentName := Format(studentProcessingHeader."Student Name");
                IdNo := Format(studentProcessingHeader."ID Number/Passport No.");
                regNo := Format(studentProcessingHeader."Student Reg. No.");
                AppInvoice := Format(studentProcessingHeader."Application Invoice");


                AllData := AllData + studentNo1 + '*' + examId + '*' + examDesc + '*' + examCenter +
                '*' + highestAcademicApplication + '*' + no + '*' + studentName + '*' + IdNo + '*' + exemptionAmloutn + '*' + regNo + '*' + AppInvoice + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing30(studentNo: Code[30]; docType: Option) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        datee: Text;
        approvalstatus: Text;
        no: Text;
        Id: Text;
        studNo: Text;
        exemptionInvoiceNo: Text;
        regNo: text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetFilter("Exemption Invoice No.", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                datee := Format(studentProcessingHeader.Date);
                approvalstatus := Format(studentProcessingHeader."Approval Status");
                no := Format(studentProcessingHeader."No.");
                Id := Format(studentProcessingHeader."ID Number/Passport No.");
                studNo := Format(studentProcessingHeader."Student No.");
                exemptionInvoiceNo := Format(studentProcessingHeader."Exemption Invoice No.");
                regNo := Format(studentProcessingHeader."Student Reg. No.");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting
                + '*' + bookingAmount + '*' + datee + '*' + approvalstatus + '*' + no + '*' + Id + '*' + studNo + '*' + exemptionInvoiceNo + '*' + regNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing31(appNo: code[30]; studentNo: Code[30]; docType: Option) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        datee: Text;
        approvalstatus: Text;
        no: Text;
        Id: Text;
        studNo: Text;
        bookingInvoiceNo: Text;
        regNo: text;
        bookingReceiptNo: Text;
        payMode: Text;
        applicationReceipt: Text;
        paymentReferenceNo: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetFilter("Booking Invoice No.", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                datee := Format(studentProcessingHeader.Date);
                approvalstatus := Format(studentProcessingHeader."Approval Status");
                no := Format(studentProcessingHeader."No.");
                Id := Format(studentProcessingHeader."ID Number/Passport No.");
                studNo := Format(studentProcessingHeader."Student No.");
                bookingInvoiceNo := Format(studentProcessingHeader."Booking Invoice No.");
                regNo := Format(studentProcessingHeader."Student Reg. No.");
                bookingReceiptNo := Format(studentProcessingHeader."Booking Receipt No.");
                payMode := Format(studentProcessingHeader."Pay Mode");
                applicationReceipt := Format(studentProcessingHeader."Application Receipt");
                applicationReceipt := Format(studentProcessingHeader."Payment Reference No.");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting
                + '*' + bookingAmount + '*' + datee + '*' + approvalstatus + '*' + no + '*' + Id + '*' + studNo + '*' + bookingInvoiceNo +
                '*' + regNo + '*' + bookingReceiptNo + '*' + payMode + '*' + applicationReceipt + '*' + paymentReferenceNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing32(appNo: code[30]; studentNo: Code[30]; docType: Option) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        datee: Text;
        approvalstatus: Text;
        no: Text;
        Id: Text;
        studNo: Text;
        bookingInvoiceNo: Text;
        regNo: text;
        bookingReceiptNo: Text;
        payMode: Text;
        applicationReceipt: Text;
        paymentReferenceNo: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("No.", appNo);
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetFilter("Renewal Invoice No.", '<>%1', '');
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                datee := Format(studentProcessingHeader.Date);
                approvalstatus := Format(studentProcessingHeader."Approval Status");
                no := Format(studentProcessingHeader."No.");
                Id := Format(studentProcessingHeader."ID Number/Passport No.");
                studNo := Format(studentProcessingHeader."Student No.");
                bookingInvoiceNo := Format(studentProcessingHeader."Booking Invoice No.");
                regNo := Format(studentProcessingHeader."Student Reg. No.");
                bookingReceiptNo := Format(studentProcessingHeader."Booking Receipt No.");
                payMode := Format(studentProcessingHeader."Pay Mode");
                applicationReceipt := Format(studentProcessingHeader."Application Receipt");
                applicationReceipt := Format(studentProcessingHeader."Payment Reference No.");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting
                + '*' + bookingAmount + '*' + datee + '*' + approvalstatus + '*' + no + '*' + Id + '*' + studNo + '*' + bookingInvoiceNo +
                '*' + regNo + '*' + bookingReceiptNo + '*' + payMode + '*' + applicationReceipt + '*' + paymentReferenceNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing33(studentNo: Code[30]; docType: Option) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        datee: Text;
        approvalstatus: Text;
        no: Text;
        Id: Text;
        studNo: Text;
        bookingInvoiceNo: Text;
        regNo: text;
        bookingReceiptNo: Text;
        payMode: Text;
        applicationReceipt: Text;
        paymentReferenceNo: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studentNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                datee := Format(studentProcessingHeader.Date);
                approvalstatus := Format(studentProcessingHeader."Approval Status");
                no := Format(studentProcessingHeader."No.");
                Id := Format(studentProcessingHeader."ID Number/Passport No.");
                studNo := Format(studentProcessingHeader."Student No.");
                bookingInvoiceNo := Format(studentProcessingHeader."Booking Invoice No.");
                regNo := Format(studentProcessingHeader."Student Reg. No.");
                bookingReceiptNo := Format(studentProcessingHeader."Booking Receipt No.");
                payMode := Format(studentProcessingHeader."Pay Mode");
                applicationReceipt := Format(studentProcessingHeader."Application Receipt");
                applicationReceipt := Format(studentProcessingHeader."Payment Reference No.");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter + '*' + examSitting
                + '*' + bookingAmount + '*' + datee + '*' + approvalstatus + '*' + no + '*' + Id + '*' + studNo + '*' + bookingInvoiceNo +
                '*' + regNo + '*' + bookingReceiptNo + '*' + payMode + '*' + applicationReceipt + '*' + paymentReferenceNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing34(studNo: Code[30]; docType: option; approvStatus: Option) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        no: Text;
        Idno: Text;
        studRegNo: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetRange("Approval Status", approvStatus);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                no := Format(studentProcessingHeader."No.");
                Idno := Format(studentProcessingHeader."ID Number/Passport No.");
                studRegNo := Format(studentProcessingHeader."Student Reg. No.");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter
                + '*' + examSitting + '*' + bookingAmount + '*' + no + '*' + Idno + '*' + studRegNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing35(id: Code[30]; docType: Option; submitted: Boolean) AllData: Text
    var
        studentName: Text;
        examId: Text;
        no: Text;
        idNo: Text;
        address: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange(Submitted, submitted);
        studentProcessingHeader.SetRange("ID Number/Passport No.", id);
        studentProcessingHeader.SetRange("Document Type", docType);
        if studentProcessingHeader.FindSet() then begin
            repeat

                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                no := Format(studentProcessingHeader."No.");
                idNo := Format(studentProcessingHeader."ID Number/Passport No.");
                address := Format(studentProcessingHeader.Address);

                AllData := AllData + studentName + '*' + examId + '*' + no + '*' + idNo + '*' + address + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessing36(studNo: Code[30]; docType: option; approvStatus: Option; posted: boolean) AllData: Text
    var
        studentName: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        no: Text;
        Idno: Text;
        studRegNo: Text;

    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("Student No.", studNo);
        studentProcessingHeader.SetRange("Document Type", docType);
        studentProcessingHeader.SetRange("Approval Status", approvStatus);
        studentProcessingHeader.SetRange(Posted, posted);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentName := Format(studentProcessingHeader."Student Name");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                no := Format(studentProcessingHeader."No.");
                Idno := Format(studentProcessingHeader."ID Number/Passport No.");
                studRegNo := Format(studentProcessingHeader."Student Reg. No.");

                AllData := AllData + studentName + '*' + examId + '*' + examDesc + '*' + examCenter
                + '*' + examSitting + '*' + bookingAmount + '*' + no + '*' + Idno + '*' + studRegNo + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getStudentProcessing37(IdNo: Code[30]; posted: boolean) AllData: Text
    var
        studentNo: Text;
        examId: Text;
        examDesc: Text;
        examCenter: Text;
        examSitting: Text;
        bookingAmount: Text;
        projCode: text;
        no: Text;
        ApplicationAmount: Text;
        exemptionAmloutn: text;
        docType: text;
    begin
        studentProcessingHeader.Reset;
        studentProcessingHeader.SetRange("ID Number/Passport No.", IdNo);
        studentProcessingHeader.SetRange(Posted, posted);
        if studentProcessingHeader.FindSet() then begin
            repeat
                studentNo := Format(studentProcessingHeader."Student No.");
                examId := Format(studentProcessingHeader."Examination ID");
                examDesc := Format(studentProcessingHeader."Examination Description");
                examSitting := Format(studentProcessingHeader."Examination Sitting");
                bookingAmount := Format(studentProcessingHeader."Booking Amount");
                projCode := Format(studentProcessingHeader."Examination Project Code");
                no := Format(studentProcessingHeader."No.");
                ApplicationAmount := Format(studentProcessingHeader."Application Amount");
                exemptionAmloutn := Format(studentProcessingHeader."Exemption Amount");
                docType := Format(studentProcessingHeader."Document Type");

                AllData := AllData + studentNo + '*' + examId + '*' + examDesc + '*' + examCenter +
                '*' + examSitting + '*' + bookingAmount + '*' + no + '*' + projCode + '*' + ApplicationAmount + '*' + exemptionAmloutn + '*' + docType + '::::';

            until studentProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;



    procedure getStudentProcessingLines(applicationNo: Code[30]; docType: option) AllData: Text
    var
        bookingHeaderNo: Text;
        courseId: Code[30];
        partId: Text;
        paper: Text;
        description: Text;
        amount: Text;
        partt: Text;
        lineNo: Text;
        studNo: Text;
        name: Text;
        regNo: Text;

    begin
        studentProcessingLines.Reset;
        studentProcessingLines.SetRange("Booking Header No.", applicationNo);
        studentProcessingLines.SetRange(Type, docType);
        if studentProcessingLines.FindSet() then begin
            repeat
                bookingHeaderNo := Format(studentProcessingLines."Booking Header No.");
                courseId := Format(studentProcessingLines."Course Id");
                paper := Format(studentProcessingLines.Paper);
                description := Format(studentProcessingLines.Description);
                amount := Format(studentProcessingLines.Amount);
                partt := Format(StudentBookingLines.Part);
                lineNo := Format(studentProcessingLines."Line No.");
                studNo := Format(StudentBookingLines."Student No.");
                name := Format(studentProcessingLines.Name);
                regNo := Format(studentProcessingLines."Registration No.");

                AllData := AllData + bookingHeaderNo + '*' + courseId + '*' + paper + '*' + description + '*' + amount +
                 '*' + partt + '*' + lineNo + '*' + studNo + '*' + name + '*' + regNo + '::::';

            until studentProcessingLines.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessingLines2(applicationNo: Code[30]) AllData: Text
    var
        bookingHeaderNo: Text;
        courseId: Code[30];
        partId: Text;
        paper: Text;
        description: Text;
        amount: Text;
        partt: Text;

    begin
        studentProcessingLines.Reset;
        studentProcessingLines.SetRange("Booking Header No.", applicationNo);
        if studentProcessingLines.FindSet() then begin
            repeat
                bookingHeaderNo := Format(studentProcessingLines."Booking Header No.");
                courseId := Format(studentProcessingLines."Course Id");
                paper := Format(studentProcessingLines.Paper);
                description := Format(studentProcessingLines.Description);
                amount := Format(studentProcessingLines.Amount);
                partt := Format(StudentBookingLines.Part);

                AllData := AllData + bookingHeaderNo + '*' + courseId + '*' + paper + '*' + description + '*' + amount + '*' + partt + '::::';

            until studentProcessingLines.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getStudentProcessingLines3(applicationNo: Code[30]; typee: option) AllData: Text
    var
        bookingHeaderNo: Text;
        courseId: Code[30];
        partId: Text;
        paper: Text;
        description: Text;
        amount: Text;
        partt: Text;

    begin
        studentProcessingLines.Reset;
        studentProcessingLines.SetRange("Booking Header No.", applicationNo);
        studentProcessingLines.SetRange(Type, typee);
        if studentProcessingLines.FindSet() then begin
            repeat
                bookingHeaderNo := Format(studentProcessingLines."Booking Header No.");
                courseId := Format(studentProcessingLines."Course Id");
                paper := Format(studentProcessingLines.Paper);
                description := Format(studentProcessingLines.Description);
                amount := Format(studentProcessingLines.Amount);
                partt := Format(StudentBookingLines.Part);

                AllData := AllData + bookingHeaderNo + '*' + courseId + '*' + paper + '*' + description + '*' + amount + '*' + partt + '::::';

            until studentProcessingLines.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentProcessingLines4(applicationNo: Code[30]; docType: option) AllData: Text
    var
        bookingHeaderNo: Text;
        courseId: Code[30];
        partId: Text;
        paper: Text;
        description: Text;
        amount: Text;
        partt: Text;
        lineNo: Text;
        studNo: Text;

    begin
        studentProcessingLines.Reset;
        studentProcessingLines.SetRange("Booking Header No.", applicationNo);
        studentProcessingLines.SetRange("Document Type", docType);
        if studentProcessingLines.FindSet() then begin
            repeat
                bookingHeaderNo := Format(studentProcessingLines."Booking Header No.");
                courseId := Format(studentProcessingLines."Course Id");
                paper := Format(studentProcessingLines.Paper);
                description := Format(studentProcessingLines.Description);
                amount := Format(studentProcessingLines.Amount);
                partt := Format(StudentBookingLines.Part);
                lineNo := Format(studentProcessingLines."Line No.");
                studNo := Format(StudentBookingLines."Student No.");

                AllData := AllData + bookingHeaderNo + '*' + courseId + '*' + paper + '*' + description + '*' + amount +
                 '*' + partt + '*' + lineNo + '*' + studNo + '::::';

            until studentProcessingLines.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getExaminationAccounts(studentCustomerNo: Code[30]) AllData: Text
    var
        name: Text;
        registrationNo: Text;
        courseId: Text;
        courseDesc: Text;
        idNo: Text;
        status: Text;
        registrationDate: text;

    begin
        examinationAccounts.Reset;
        examinationAccounts.SetRange("Student Cust No.", studentCustomerNo);
        examinationAccounts.SetRange(Blocked, false);
        if examinationAccounts.FindSet() then begin
            repeat
                name := examinationAccounts."First Name" + examinationAccounts."Middle Name" + examinationAccounts.Surname;
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");
                courseDesc := Format(examinationAccounts."Course Description");
                idNo := Format(examinationAccounts."ID No.");
                status := Format(examinationAccounts.Status);
                registrationDate := Format(examinationAccounts."Registration Date");


                AllData := AllData + registrationNo + '*' + courseId + '*' + courseDesc + '*' + name + '*' + idNo + '*' + status + '*' + registrationDate + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getExaminationAccounts1(course: Code[30]; regNo: Code[30]) AllData: Text
    var
        name: Text;
        registrationNo: Text;
        courseId: Text;
        courseDesc: Text;
        idNo: Text;
        status: Text;
        registrationDate: text;
        firstName: Text;
        middleName: Text;
        surname: Text;

    begin
        examinationAccounts.Reset;
        examinationAccounts.SetRange("Course ID", course);
        examinationAccounts.SetRange("Registration No.", regNo);
        if examinationAccounts.FindSet() then begin
            repeat
                firstName := Format(examinationAccounts."First Name");
                middleName := Format(examinationAccounts."Middle Name");
                surname := Format(examinationAccounts.Surname);
                registrationNo := Format(examinationAccounts."Student Cust No.");
                courseId := Format(examinationAccounts."Course ID");
                courseDesc := Format(examinationAccounts."Course Description");


                AllData := AllData + registrationNo + '*' + firstName + '*' + middleName + '*' + surname + '*' + courseId + '*' + courseDesc + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExaminationAccounts2(studentCustomerNo: Code[30]) AllData: Text
    var
        name: Text;
        registrationNo: Text;
        registrationdate: Text;
        courseId: Text;
        courseDesc: Text;
        idNo: Text;
        status: Text;

    begin
        examinationAccounts.Reset;
        examinationAccounts.SetRange("Student Cust No.", studentCustomerNo);
        examinationAccounts.SetRange(Status, examinationAccounts.Status::Active);
        if examinationAccounts.FindSet() then begin
            repeat
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");
                courseDesc := Format(examinationAccounts."Course Description");
                idNo := Format(examinationAccounts."ID No.");
                name := Format(examinationAccounts.Name);
                registrationDate := Format(examinationAccounts."Registration Date");


                AllData := AllData + registrationNo + '*' + courseId + '*' + courseDesc + '*' + registrationDate + '*' + name + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExaminationAccounts3(studentCustomerNo: Code[30]) AllData: Text
    var
        name: Text;
        registrationNo: Text;
        courseId: Text;
        courseDesc: Text;
        idNo: Text;
        status: Text;
        registrationDate: text;

    begin
        examinationAccounts.Reset;
        examinationAccounts.SetRange("Student Cust No.", studentCustomerNo);
        examinationAccounts.SetRange(status, examinationAccounts.Status::Active);
        if examinationAccounts.FindSet() then begin
            repeat
                name := examinationAccounts."First Name" + examinationAccounts."Middle Name" + examinationAccounts.Surname;
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");
                courseDesc := Format(examinationAccounts."Course Description");
                idNo := Format(examinationAccounts."ID No.");
                status := Format(examinationAccounts.Status);
                registrationDate := Format(examinationAccounts."Registration Date");


                AllData := AllData + registrationNo + '*' + courseId + '*' + courseDesc + '*' + name + '*' + idNo + '*' + status + '*' + registrationDate + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExaminationAccount4(studentCustomerNo: Code[30]; courseId: Code[30]) AllData: Text
    var
        name: Text;
        registrationNo: Text;
        courseDesc: Text;
        idNo: Text;
        status: Text;
        registrationDate: text;

    begin
        examinationAccounts.Reset;
        examinationAccounts.SetRange("Student Cust No.", studentCustomerNo);
        examinationAccounts.SetRange("Course ID", courseId);
        examinationAccounts.SetFilter(Status, '<>%1', examinationAccounts.Status::Active);
        if examinationAccounts.FindSet() then begin
            repeat
                name := examinationAccounts."First Name" + examinationAccounts."Middle Name" + examinationAccounts.Surname;
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");
                courseDesc := Format(examinationAccounts."Course Description");
                idNo := Format(examinationAccounts."ID No.");
                status := Format(examinationAccounts.Status);
                registrationDate := Format(examinationAccounts."Registration Date");


                AllData := AllData + registrationNo + '*' + courseId + '*' + courseDesc + '*' + name + '*' + idNo + '*' + status + '*' + registrationDate + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExaminationAccount5(regNo: Code[30]; activeStatus: Option) AllData: Text
    var
        name: Text;
        registrationNo: Text;
        courseDesc: Text;
        idNo: Text;
        status: Text;
        registrationDate: text;
        renewalAmount: Text;
        reActivationAnmount: Text;
        courseId: Text;

    begin
        examinationAccounts.Reset;
        examinationAccounts.SetRange("Registration No.", regNo);
        examinationAccounts.SetRange(Status, activeStatus);
        if examinationAccounts.FindSet() then begin
            repeat
                name := examinationAccounts."First Name" + examinationAccounts."Middle Name" + examinationAccounts.Surname;
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");
                courseDesc := Format(examinationAccounts."Course Description");
                idNo := Format(examinationAccounts."ID No.");
                status := Format(examinationAccounts.Status);
                registrationDate := Format(examinationAccounts."Registration Date");
                renewalAmount := Format(examinationAccounts."Renewal Amount");
                reActivationAnmount := Format(examinationAccounts."Re-Activation Amount");


                AllData := AllData + registrationNo + '*' + courseId + '*' + courseDesc + '*' + name + '*' + idNo + '*' +
                 status + '*' + registrationDate + '*' + renewalAmount + '*' + reActivationAnmount + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getExaminationAccount6(studentCustomerNo: Code[30]) AllData: Text
    var
        name: Text;
        registrationNo: Text;
        registrationdate: Text;
        courseId: Text;
        courseDesc: Text;
        idNo: Text;
        status: Text;
        renewalAmount: Text;
        reActivationAnmount: Text;

    begin
        examinationAccounts.Reset;
        examinationAccounts.SetRange("Student Cust No.", studentCustomerNo);
        examinationAccounts.SetRange(Status, examinationAccounts.Status::Active);
        if examinationAccounts.FindSet() then begin
            repeat
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");
                courseDesc := Format(examinationAccounts."Course Description");
                idNo := Format(examinationAccounts."ID No.");
                name := Format(examinationAccounts.Name);
                registrationDate := Format(examinationAccounts."Registration Date");
                renewalAmount := Format(examinationAccounts."Renewal Amount");
                reActivationAnmount := Format(examinationAccounts."Re-Activation Amount");


                AllData := AllData + registrationNo + '*' + courseId + '*' + courseDesc + '*' + registrationDate + '*' + name +
                '*' + renewalAmount + '*' + reActivationAnmount + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getExaminationAccounts7(regNo: Code[30]; renewalCash: Decimal) AllData: Text
    var
        name: Text;
        registrationNo: Text;
        courseDesc: Text;
        idNo: Text;
        status: Text;
        registrationDate: text;
        renewalAmount: Text;
        reActivationAnmount: Text;
        courseId: Text;
        renewalPending: Text;


    begin
        examinationAccounts.Reset;
        examinationAccounts.SetRange("Registration No.", regNo);
        examinationAccounts.SetFilter("Renewal Amount", '>%1', renewalCash);

        if examinationAccounts.FindSet() then begin
            repeat
                name := examinationAccounts."First Name" + examinationAccounts."Middle Name" + examinationAccounts.Surname;
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");
                courseDesc := Format(examinationAccounts."Course Description");
                idNo := Format(examinationAccounts."ID No.");
                status := Format(examinationAccounts.Status);
                registrationDate := Format(examinationAccounts."Registration Date");
                renewalAmount := Format(examinationAccounts."Renewal Amount");
                reActivationAnmount := Format(examinationAccounts."Re-Activation Amount");
                renewalPending := Format(examinationAccounts."Renewal Pending");


                AllData := AllData + registrationNo + '*' + courseId + '*' + courseDesc + '*' + name + '*' + idNo + '*' +
           status + '*' + registrationDate + '*' + renewalAmount + '*' + reActivationAnmount + '*' + renewalPending + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExaminationAccounts8(studentCustomerNo: Code[30]; amount: Decimal) AllData: Text
    var
        name: Text;
        registrationNo: Text;
        courseId: Text;
        courseDesc: Text;
        idNo: Text;
        status: Text;
        registrationDate: text;
        renewalPending: Text;
        renewalAmount: Text;
        reActivationAmount: Text;

    begin
        examinationAccounts.Reset;
        examinationAccounts.SetFilter("Re-Activation Amount", '>', amount);
        if examinationAccounts.FindSet() then begin
            repeat
                name := examinationAccounts."First Name" + examinationAccounts."Middle Name" + examinationAccounts.Surname;
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");
                courseDesc := Format(examinationAccounts."Course Description");
                idNo := Format(examinationAccounts."ID No.");
                status := Format(examinationAccounts.Status);
                registrationDate := Format(examinationAccounts."Registration Date");
                renewalPending := Format(examinationAccounts."Renewal Pending");
                renewalAmount := Format(examinationAccounts."Renewal Amount");
                reActivationAmount := Format(examinationAccounts."Re-Activation Amount");


                AllData := AllData + registrationNo + '*' + courseId + '*' + courseDesc + '*' + name + '*' + idNo + '*' + status +
                '*' + registrationDate + '*' + renewalPending + '*' + renewalAmount + '*' + reActivationAmount + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExaminationAccounts9(studentCustomerNo: Code[30]) AllData: Text
    var
        registrationNo: Text;
        courseId: Text;


    begin
        examinationAccounts.Reset;
        examinationAccounts.SetRange("Student Cust No.", studentCustomerNo);
        if examinationAccounts.FindSet() then begin
            repeat
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");


                AllData := AllData + registrationNo + '*' + courseId + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExaminationAccounts10() AllData: Text
    var
        registrationNo: Text;
        courseId: Text;
        studName: Text;


    begin
        examinationAccounts.Reset;
        if examinationAccounts.FindSet() then begin
            repeat
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");


                AllData := AllData + registrationNo + '*' + courseId + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExaminationAccounts11(regNo: Code[30]) AllData: Text
    var
        registrationNo: Text;
        courseId: Text;
        studName: Text;


    begin
        examinationAccounts.Reset;
        examinationAccounts.setrange("Registration No.", regNo);
        if examinationAccounts.FindSet() then begin
            repeat
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");


                AllData := AllData + registrationNo + '*' + courseId + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExaminationAccount13(regNo: Code[30]) AllData: Text
    var
        name: Text;
        registrationNo: Text;
        registrationdate: Text;
        courseId: Text;
        courseDesc: Text;
        idNo: Text;
        status: Text;
        renewalAmount: Text;
        reActivationAnmount: Text;

    begin
        examinationAccounts.Reset;
        examinationAccounts.SetRange("Registration No.", regNo);
        examinationAccounts.SetRange(Status, examinationAccounts.Status::Active);
        if examinationAccounts.FindSet() then begin
            repeat
                registrationNo := Format(examinationAccounts."Registration No.");
                courseId := Format(examinationAccounts."Course ID");
                courseDesc := Format(examinationAccounts."Course Description");
                idNo := Format(examinationAccounts."ID No.");
                name := Format(examinationAccounts.Name);
                registrationDate := Format(examinationAccounts."Registration Date");
                renewalAmount := Format(examinationAccounts."Renewal Amount");
                reActivationAnmount := Format(examinationAccounts."Re-Activation Amount");


                AllData := AllData + registrationNo + '*' + courseId + '*' + courseDesc + '*' + registrationDate + '*' + name +
                '*' + renewalAmount + '*' + reActivationAnmount + '::::';
            until examinationAccounts.Next = 0;
        end;
        exit(AllData);
    end;



    procedure fnGetExaminationResults(IdNumber: Text) AllData: Text
    var
        ExaminationResults: Record "Examination Results";
        issueDate: Text;
        grade: Text;
        papername: Text;
        regno: Text;
        examcenter: Text;
        studentName: Text;
        paper: Text;
        examinnationSittingId: Text;
        financialYear: Text;
    begin
        ExaminationResults.Reset;
        ExaminationResults.SetRange("National ID No.", IdNumber);

        if ExaminationResults.FindSet then begin
            repeat
                issueDate := Format(ExaminationResults."Issue Date");
                grade := Format(ExaminationResults.Grade);
                papername := Format(ExaminationResults."Paper Name");
                regno := Format(ExaminationResults."Student Reg No.");
                examcenter := Format(ExaminationResults."Examination Center");
                studentName := Format(ExaminationResults."Student Name");
                paper := Format(ExaminationResults.Paper);
                examinnationSittingId := Format(ExaminationResults."Examination Sitting ID");
                financialYear := Format(ExaminationResults."Financial Year");

                AllData := AllData + studentName + '*' + paper + '*' + papername + '*' + grade + '*' + examinnationSittingId + '*' + financialYear + '*' + issueDate + '*' + regno + '*' + examcenter + '::::';
            until ExaminationResults.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnGetExaminationResultsFail(IdNumber: Text; cycle: Code[30]) AllData: Text
    var
        ExaminationResults: Record "Examination Results";
        issueDate: Text;
        grade: Text;
        papername: Text;
        regno: Text;
        examcenter: Text;
        studentName: Text;
        paper: Text;
        examinnationSittingId: Text;
        financialYear: Text;
        partt: Text;
    begin
        ExaminationResults.Reset;
        ExaminationResults.SetRange("National ID No.", IdNumber);
        ExaminationResults.SetRange("Examination Sitting ID", cycle);
        ExaminationResults.SetRange(Grade, '*FAIL*');
        if ExaminationResults.FindSet then begin
            repeat
                issueDate := Format(ExaminationResults."Issue Date");
                grade := Format(ExaminationResults.Grade);
                papername := Format(ExaminationResults."Paper Name");
                regno := Format(ExaminationResults."Student Reg No.");
                examcenter := Format(ExaminationResults."Examination Center");
                studentName := Format(ExaminationResults."Student Name");
                paper := Format(ExaminationResults.Paper);
                examinnationSittingId := Format(ExaminationResults."Examination Sitting ID");
                financialYear := Format(ExaminationResults."Financial Year");
                partt := Format(ExaminationResults.Part);

                AllData := AllData + studentName + '*' + paper + '*' + papername + '*' + grade + '*' +
                 examinnationSittingId + '*' + financialYear + '*' + issueDate + '*' + regno + '*' + examcenter + '*' + partt + '::::';

            until ExaminationResults.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnGetExaminationResults2(IdNumber: Text; sitting: code[30]) AllData: Text
    var
        ExaminationResults: Record "Examination Results";
        issueDate: Text;
        grade: Text;
        papername: Text;
        regno: Text;
        examcenter: Text;
        studentName: Text;
        paper: Text;
        examinnationSittingId: Text;
        financialYear: Text;
    begin
        ExaminationResults.Reset;
        ExaminationResults.SetRange("National ID No.", IdNumber);
        ExaminationResults.SetRange("Examination Sitting ID", sitting);
        if ExaminationResults.FindSet then begin
            repeat
                issueDate := Format(ExaminationResults."Issue Date");
                grade := Format(ExaminationResults.Grade);
                papername := Format(ExaminationResults."Paper Name");
                regno := Format(ExaminationResults."Student Reg No.");
                examcenter := Format(ExaminationResults."Examination Center");
                studentName := Format(ExaminationResults."Student Name");
                paper := Format(ExaminationResults.Paper);
                examinnationSittingId := Format(ExaminationResults."Examination Sitting ID");
                financialYear := Format(ExaminationResults."Financial Year");

                AllData := AllData + studentName + '*' + paper + '*' + papername + '*' + grade + '*' + examinnationSittingId +
                '*' + financialYear + '*' + issueDate + '*' + regno + '*' + examcenter + '::::';
            until ExaminationResults.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnGetExaminationResults3(regNo1: Text; sitting: code[30]) AllData: Text
    var
        ExaminationResults: Record "Examination Results";
        issueDate: Text;
        grade: Text;
        papername: Text;
        regno: Text;
        examcenter: Text;
        studentName: Text;
        paper: Text;
        examinnationSittingId: Text;
        financialYear: Text;
    begin
        ExaminationResults.Reset;
        ExaminationResults.SetRange("Student Reg No.", regNo1);
        ExaminationResults.SetRange("Examination Sitting ID", sitting);
        if ExaminationResults.FindSet then begin
            repeat
                issueDate := Format(ExaminationResults."Issue Date");
                grade := Format(ExaminationResults.Grade);
                papername := Format(ExaminationResults."Paper Name");
                regno := Format(ExaminationResults."Student Reg No.");
                examcenter := Format(ExaminationResults."Examination Center");
                studentName := Format(ExaminationResults."Student Name");
                paper := Format(ExaminationResults.Paper);
                examinnationSittingId := Format(ExaminationResults."Examination Sitting ID");
                financialYear := Format(ExaminationResults."Financial Year");

                AllData := AllData + studentName + '*' + paper + '*' + papername + grade + examinnationSittingId + '*' + financialYear + '*' + issueDate + '*' + regno + '*' + examcenter + '::::';
            until ExaminationResults.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnGetExaminationResults4(reg: Text) AllData: Text
    var
        ExaminationResults: Record "Examination Results";
        issueDate: Text;
        grade: Text;
        papername: Text;
        regno: Text;
        examcenter: Text;
        studentName: Text;
        paper: Text;
        examinnationSittingId: Text;
        financialYear: Text;
    begin
        ExaminationResults.Reset;
        ExaminationResults.SetRange("Student Reg No.", reg);

        if ExaminationResults.FindSet then begin
            repeat
                issueDate := Format(ExaminationResults."Issue Date");
                grade := Format(ExaminationResults.Grade);
                papername := Format(ExaminationResults."Paper Name");
                regno := Format(ExaminationResults."Student Reg No.");
                examcenter := Format(ExaminationResults."Examination Center");
                studentName := Format(ExaminationResults."Student Name");
                paper := Format(ExaminationResults.Paper);
                examinnationSittingId := Format(ExaminationResults."Examination Sitting ID");
                financialYear := Format(ExaminationResults."Financial Year");

                AllData := AllData + studentName + '*' + paper + '*' + papername + grade + examinnationSittingId + '*' + financialYear + '*' + issueDate + '*' + regno + '*' + examcenter + '::::';
            until ExaminationResults.Next = 0;
        end;
        exit(AllData);
    end;


    procedure fnGetExaminationCourses(jobNo: Text) AllData: Text
    var
        jobTaskNo: Text;
        description: Text;

    begin
        examcourses.Reset;
        examcourses.SetRange("Job No.", jobNo);

        if examcourses.FindSet then begin
            repeat
                jobTaskNo := Format(examcourses."Job Task No.");
                description := Format(examcourses.Description);

                AllData := AllData + jobTaskNo + '*' + description + '::::';
            until examcourses.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnGetExaminationCourses2(jobNo: Text; examType: Option) AllData: Text
    var
        jobTaskNo: Text;
        description: Text;

    begin
        examcourses.Reset;
        examcourses.SetRange("Job No.", jobNo);
        examcourses.SetRange("Examination Type", examType);

        if examcourses.FindSet then begin
            repeat
                jobTaskNo := Format(examcourses."Job Task No.");
                description := Format(examcourses.Description);

                AllData := AllData + jobTaskNo + '*' + description + '::::';
            until examcourses.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnGetExaminationCourses3(examCodee: code[30]) AllData: Text
    var
        jobTaskNo: Text;
        description: Text;

    begin
        examcourses.Reset;
        examcourses.SetRange("Examination Code", examCodee);

        if examcourses.FindSet then begin
            repeat
                jobTaskNo := Format(examcourses."Job Task No.");
                description := Format(examcourses.Description);

                AllData := AllData + jobTaskNo + '*' + description + '::::';
            until examcourses.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getExemptionEntries(studentCustomerNo: Code[30]) AllData: Text
    var
        custNo: Text;
        name: Text;
        registrationNo: Text;
        courseId: Text;
        no: Text;
        amount: text;

    begin
        exemptionEntries.Reset;
        exemptionEntries.SetRange("Stud. Cust No.", studentCustomerNo);
        if exemptionEntries.FindSet() then begin
            repeat
                custNo := Format(exemptionEntries."Stud. Cust No.");
                name := Format(exemptionEntries.Name);
                registrationNo := Format(exemptionEntries."Stud. Reg. No");
                courseId := Format(exemptionEntries."Course ID");
                no := Format(exemptionEntries."No.");
                amount := Format(exemptionEntries.Amount);


                AllData := AllData + custNo + '*' + courseId + '*' + name + '*' + no + '*' + amount + '::::';
            until exemptionEntries.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExemptionEntries2(studentCustomerNo: Code[30]; courseIdd: Code[30]) AllData: Text
    var
        custNo: Text;
        name: Text;
        registrationNo: Text;
        courseId: Text;
        no: Text;
        amount: text;

    begin
        exemptionEntries.Reset;
        exemptionEntries.SetRange("Stud. Cust No.", studentCustomerNo);
        exemptionEntries.SetRange("Course Id", courseIdd);
        if exemptionEntries.FindSet() then begin
            repeat
                custNo := Format(exemptionEntries."Stud. Cust No.");
                name := Format(exemptionEntries.Name);
                registrationNo := Format(exemptionEntries."Stud. Reg. No");
                courseId := Format(exemptionEntries."Course ID");
                no := Format(exemptionEntries."No.");
                amount := Format(exemptionEntries.Amount);


                AllData := AllData + custNo + '*' + courseId + '*' + name + '*' + no + '*' + amount + '::::';
            until exemptionEntries.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExemptionQualifications(docNo: Code[30]) AllData: Text
    var
        qualificationType: Text;
        qualificationCode: Text;
        qualification: Text;
        entryNo: Text;

    begin
        exemptionQualifications.Reset;
        exemptionQualifications.SetRange("Document No.", docNo);
        if exemptionQualifications.FindSet() then begin
            repeat
                qualificationType := Format(exemptionQualifications."Qualification Type");
                qualificationCode := Format(exemptionQualifications."Qualification Code");
                qualification := Format(exemptionQualifications.Qualification);
                entryNo := Format(exemptionQualifications."Entry No");


                AllData := AllData + qualificationType + '*' + qualificationCode + '*' + qualification + '*' + entryNo + '::::';
            until exemptionQualifications.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExemptionQualifications1(qualificationType: Option) AllData: Text
    var
        qualificationCode: Text;
        qualification: Text;
        entryNo: Text;

    begin
        exemptionQualifications.Reset;
        exemptionQualifications.SetRange("Qualification Type", qualificationType);
        if exemptionQualifications.FindSet() then begin
            repeat
                qualificationCode := Format(exemptionQualifications."Qualification Code");
                qualification := Format(exemptionQualifications.Qualification);
                entryNo := Format(exemptionQualifications."Entry No");


                AllData := AllData + qualificationCode + '*' + qualification + '*' + entryNo + '::::';
            until exemptionQualifications.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExemptionLines(headerNo: Code[30]) AllData: Text
    var
        no: Text;
        name: Text;
        amount: Text;
        lineNo: Text;

    begin
        exemptionLines.Reset;
        exemptionLines.SetRange("Header No.", headerNo);
        if exemptionLines.FindSet() then begin
            repeat
                no := Format(exemptionLines."No.");
                name := Format(exemptionLines.Name);
                amount := Format(exemptionLines.Amount);
                lineNo := Format(exemptionLines."Line No.");


                AllData := AllData + no + '*' + name + '*' + amount + '*' + lineNo + '::::';
            until exemptionLines.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamSittingCycle() AllData: Text
    var
        sittingCycle: Text;
        projectId: Text;
        desc: Text;


    begin
        examSittingcycle.Reset;
        examSittingcycle.SetRange("Sitting Status", examSittingcycle."Sitting Status"::Active);
        examSittingcycle.SetRange(Closed, false);
        if examSittingcycle.FindSet() then begin
            repeat
                sittingCycle := Format(examSittingcycle."Exam Sitting Cycle");
                projectId := Format(examSittingcycle."Examination Project ID");
                desc := Format(examSittingcycle."Project Description");

                AllData := AllData + sittingCycle + '*' + projectId + '*' + desc + '::::';
            until examSittingcycle.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamSittingCycle2(activeStatus: Option) AllData: Text
    var
        sittingCycle: Text;
        projectId: Text;


    begin
        examSittingcycle.Reset;
        examSittingcycle.SetFilter("Exam End Date", '>%1', Today);
        examSittingcycle.SetRange("Sitting Status", activeStatus);
        if examSittingcycle.FindSet() then begin
            repeat
                sittingCycle := Format(examSittingcycle."Exam Sitting Cycle");
                projectId := Format(examSittingcycle."Examination Project ID");


                AllData := AllData + sittingCycle + '*' + projectId + '::::';
            until examSittingcycle.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamSittingCycle3() AllData: Text
    var
        sittingCycle: Text;
        projectId: Text;


    begin
        examSittingcycle.Reset;
        examSittingcycle.SetFilter("Exam End Date", '>%1', Today);
        if examSittingcycle.FindSet() then begin
            repeat
                sittingCycle := Format(examSittingcycle."Exam Sitting Cycle");
                projectId := Format(examSittingcycle."Examination Project ID");


                AllData := AllData + sittingCycle + '*' + projectId + '::::';
            until examSittingcycle.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamSittingCycle4() AllData: Text
    var
        sittingCycle: Text;
        projectId: Text;
        desc: Text;


    begin
        examSittingcycle.Reset;
        if examSittingcycle.FindSet() then begin
            repeat
                sittingCycle := Format(examSittingcycle."Exam Sitting Cycle");
                projectId := Format(examSittingcycle."Examination Project ID");
                desc := Format(examSittingcycle."Project Description");

                AllData := AllData + sittingCycle + '*' + projectId + '*' + desc + '::::';
            until examSittingcycle.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamCycle(sittingStatus: Option) AllData: Text
    var
        sittingCycle: Text;

    begin
        examSittingcycle.Reset;
        examSittingcycle.SetRange("Sitting Status", sittingStatus);
        if examSittingcycle.FindSet() then begin
            repeat
                sittingCycle := Format(examSittingcycle."Exam Sitting Cycle");

                AllData := AllData + sittingCycle + '::::';
            until examSittingcycle.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamCycle1(examCycle: code[30]) AllData: Text
    var
        sittingCycle: Text;

    begin
        examSittingcycle.Reset;
        examSittingcycle.SetRange("Exam Sitting Cycle", examCycle);
        examSittingcycle.SetFilter("Exam End Date", '>%1', Today);
        if examSittingcycle.FindSet() then begin
            repeat
                sittingCycle := Format(examSittingcycle."Exam Sitting Cycle");

                AllData := AllData + sittingCycle + '::::';
            until examSittingcycle.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCourses() AllData: Text
    var
        codee: Text;
        noSeries: Text;
        desc: Text;
        desc1: Text;


    begin
        courses.Reset;
        if courses.FindSet() then begin
            repeat
                codee := Format(courses.Code);
                noSeries := Format(courses."No. Series");
                desc := Format(courses.Description);
                desc1 := Format(courses."Description 2");

                AllData := AllData + codee + '*' + noSeries + '*' + desc + '*' + desc1 + '::::';
            until courses.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCourses1() AllData: Text
    var
        codee: Text;
        noSeries: Text;


    begin
        courses.Reset;
        if courses.FindSet() then begin
            repeat
                codee := Format(courses.Code);
                noSeries := Format(courses."No. Series");


                AllData := AllData + codee + '*' + noSeries + '::::';
            until courses.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getPapers() AllData: Text
    var
        level: Text;
        description: Text;


    begin
        papers.Reset;
        if papers.FindSet() then begin
            repeat
                level := Format(papers.Level);
                description := Format(papers.Description);


                AllData := AllData + level + '*' + description + '::::';
            until papers.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getPapers1(course: code[30]; levell: code[30]) AllData: Text
    var
        level: Text;
        description: Text;
        codee: Text;

    begin
        papers.Reset;
        papers.SetRange(Course, course);
        papers.SetRange(Level, levell);
        if papers.FindSet() then begin
            repeat
                level := Format(papers.Level);
                description := Format(papers.Description);
                codee := Format(papers.Code);

                AllData := AllData + level + '*' + description + '*' + codee + '::::';
            until papers.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getPapers2(codeParam: code[30]; status: option) AllData: Text
    var
        level: Text;
        description: Text;
        codee: Text;

    begin
        papers.Reset;
        papers.SetRange(Code, codeParam);
        papers.SetRange(Status, status);
        if papers.FindSet() then begin
            repeat
                level := Format(papers.Level);
                description := Format(papers.Description);
                codee := Format(papers.Code);

                AllData := AllData + level + '*' + description + '*' + codee + '::::';
            until papers.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getPapersz(courseId: Text; levelz: Integer) AllData: Text
    var
        levelCourse: Text;
        description: Text;


    begin
        papers.Reset;
        level.Reset;
        papers.setrange(Course, courseId);
        level.setrange(Level, levelz);
        papers.setrange(papers.Code, level.Course);
        if papers.FindSet(true) and level.findset(true) then begin
            repeat
                levelCourse := Format(papers.Level);
                description := Format(papers.Description);


                AllData := AllData + levelCourse + '*' + description + '::::';
            until papers.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getPapers3(course: code[30]; levell: code[30]; section: code[30]) AllData: Text
    var
        level: Text;
        description: Text;
        codee: Text;

    begin
        papers.Reset;
        papers.SetRange(Course, course);
        papers.SetRange(Level, levell);
        papers.SetRange(Section, section);
        if papers.FindSet() then begin
            repeat
                level := Format(papers.Level);
                description := Format(papers.Description);
                codee := Format(papers.Code);

                AllData := AllData + level + '*' + description + '*' + codee + '::::';
            until papers.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getPapers4(course: code[30]) AllData: Text
    var
        level: Text;
        description: Text;
        codee: Text;

    begin
        papers.Reset;
        papers.SetRange(Course, course);
        if papers.FindSet() then begin
            repeat
                level := Format(papers.Level);
                description := Format(papers.Description);
                codee := Format(papers.Code);

                AllData := AllData + level + '*' + description + '*' + codee + '::::';
            until papers.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getPart() AllData: Text
    var
        codee: Text;


    begin
        parts.Reset;
        if parts.FindSet() then begin
            repeat
                codee := Format(parts.Code);



                AllData := AllData + codee + '::::';
            until parts.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getPart2(courseId: code[30]) AllData: Text
    var
        codee: Text;


    begin
        parts.Reset;
        parts.SetRange(Course, courseId);
        if parts.FindSet() then begin
            repeat
                codee := Format(parts.Code);



                AllData := AllData + codee + '::::';
            until parts.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getExamCenters() AllData: Text
    var
        examZone: Text;
        examDescription: Text;
        name: Text;
        Codee: Text;


    begin
        examCenters.Reset;
        if examCenters.FindSet() then begin
            repeat
                examZone := Format(examCenters."Exam Zone");
                examDescription := Format(examCenters."Exam Region");
                name := Format(examCenters.Name);
                codee := Format(examCenters.Code);


                AllData := AllData + name + '*' + codee + '*' + examZone + '*' + examDescription + '::::';
            until examCenters.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamCenters2(codee: Code[30]; total: Decimal; blocked: Boolean) AllData: Text
    var
        examZone: Text;
        examDescription: Text;
        name: Text;


    begin
        examCenters.Reset;
        examCenters.SetRange(Code, codee);
        examCenters.SetFilter("Maximum Capacity Per Session", '>%1', total);
        examCenters.setrange(Blocked, blocked);
        if examCenters.FindSet() then begin
            repeat
                examZone := Format(examCenters."Exam Zone");
                examDescription := Format(examCenters."Exam Region");
                name := Format(examCenters.Name);
                codee := Format(examCenters.Code);

                AllData := AllData + name + '*' + codee + '*' + examZone + '*' + examDescription + '::::';
            until examCenters.Next = 0;
        end;
        exit(AllData);
    end;



    procedure getExamCenters3(codee: Code[30]) AllData: Text
    var
        examZone: Text;
        examDescription: Text;
        name: Text;
        examRegion: Text;


    begin
        examCenters.Reset;
        examCenters.SetRange(Code, codee);
        if examCenters.FindSet() then begin
            repeat
                examZone := Format(examCenters."Exam Zone");
                examDescription := Format(examCenters."Exam Region");
                name := Format(examCenters.Name);
                codee := Format(examCenters.Code);
                examRegion := Format(examCenters."Exam Region");

                AllData := AllData + name + '*' + codee + '*' + examZone + '*' + examDescription + '*' + examRegion + '::::';
            until examCenters.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamCenters4(region: text; zone: code[50]) AllData: Text
    var
        examZone: Text;
        examDescription: Text;
        name: Text;
        codee: Text;


    begin
        examCenters.Reset;
        examCenters.SetRange("Exam Region", region);
        examCenters.SetFilter("Exam Zone", zone);
        examCenters.setrange(Blocked, false);
        if examCenters.FindSet() then begin
            repeat
                examZone := Format(examCenters."Exam Zone");
                examDescription := Format(examCenters."Exam Region");
                name := Format(examCenters.Name);
                codee := Format(examCenters.Code);

                AllData := AllData + name + '*' + codee + '*' + examZone + '*' + examDescription + '::::';
            until examCenters.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamZones() AllData: Text
    var
        zoneName: Text;
        codee: Text;


    begin
        examZones.Reset;
        if examZones.FindSet() then begin
            repeat
                zoneName := Format(examZones."Zone Name");
                codee := Format(examZones.Code);


                AllData := AllData + codee + '*' + zoneName + '::::';
            until examZones.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamZones1(regionCode: Code[30]) AllData: Text
    var
        zoneName: Text;
        codee: Text;


    begin
        examZones.Reset;
        examZones.SetRange("Region Code", regionCode);
        if examZones.FindSet() then begin
            repeat
                zoneName := Format(examZones."Zone Name");
                codee := Format(examZones.Code);



                AllData := AllData + codee + '*' + zoneName + '::::';
            until examZones.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamZones2(regionCode: Code[30]) AllData: Text
    var
        zoneName: Text;
        codee: Text;


    begin
        examZones.Reset;
        examZones.SetRange(code, regionCode);
        if examZones.FindSet() then begin
            repeat
                zoneName := Format(examZones."Zone Name");
                codee := Format(examZones.Code);



                AllData := AllData + codee + '*' + zoneName + '::::';
            until examZones.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getRegions() AllData: Text
    var
        description: Text;
        codee: Text;

    begin
        examRegions.Reset;
        if examRegions.FindSet() then begin
            repeat
                description := Format(examRegions.Description);
                codee := Format(examRegions.Code);



                AllData := AllData + codee + '*' + description + '::::';
            until examRegions.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getRegions1(regionCode: Code[30]) AllData: Text
    var
        description: Text;
        codee: Text;

    begin
        examRegions.Reset;
        examRegions.SetRange(Code, regionCode);
        if examRegions.FindSet() then begin
            repeat
                description := Format(examRegions.Description);
                codee := Format(examRegions.Code);



                AllData := AllData + codee + '*' + description + '::::';
            until examRegions.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCurrency() AllData: Text
    var

        codee: Text;

    begin
        currency.Reset;
        if currency.FindSet() then begin
            repeat
                codee := Format(currency.Code);

                AllData := AllData + codee + '::::';
            until currency.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCounty() AllData: Text
    var
        description: Text;
        codee: Text;

    begin
        county.Reset;
        if county.FindSet() then begin
            repeat
                description := Format(county.Description);
                codee := Format(county.Code);

                AllData := AllData + codee + '*' + description + '::::';
            until county.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getPostCodes() AllData: Text
    var

        codee: Text;

    begin
        postCodes.Reset;
        if postCodes.FindSet() then begin
            repeat
                codee := Format(postCodes.Code);

                AllData := AllData + codee + '::::';
            until postCodes.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getPostCodes2(postCode: Code[30]) AllData: Text
    var

        codee: Text;
        city: Text;

    begin
        postCodes.Reset;
        postCodes.SetRange(code, postCode);
        if postCodes.FindSet() then begin
            repeat
                codee := Format(postCodes.Code);
                city := Format(postCodes.City);

                AllData := AllData + codee + '*' + city + '::::';
            until postCodes.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getQualifications() AllData: Text
    var

        codee: Text;

    begin
        qualification.Reset;
        if qualification.FindSet() then begin
            repeat
                codee := Format(qualification.Code);

                AllData := AllData + codee + '::::';
            until qualification.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getPaymentModes() AllData: Text
    var

        codee: Text;

    begin
        paymentMode.Reset;
        if paymentMode.FindSet() then begin
            repeat
                codee := Format(paymentMode.Code);

                AllData := AllData + codee + '::::';
            until paymentMode.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamJob() AllData: Text
    var
        description: Text;
        codee: Text;

    begin
        examjob.Reset;
        if examjob.FindSet() then begin
            repeat
                description := Format(examjob.Description);
                codee := Format(examjob."No.");



                AllData := AllData + codee + '*' + description + '::::';
            until examjob.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getSourceCategories() AllData: Text
    var
        description: Text;
        codee: Text;

    begin
        sourceCategories.Reset;
        if sourceCategories.FindSet() then begin
            repeat
                description := Format(sourceCategories.Description);
                codee := Format(sourceCategories.Code);


                AllData := AllData + codee + '*' + description + '::::';
            until sourceCategories.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentQualifications() AllData: Text
    var
        description: Text;
        codee: Text;

    begin
        studentQualifications.Reset;
        if studentQualifications.FindSet() then begin
            repeat
                description := Format(studentQualifications."Qualification Description");
                codee := Format(studentQualifications.Code);


                AllData := AllData + codee + '*' + description + '::::';
            until studentQualifications.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getBulkProcessingHeader(instNo: Code[30]; docType: Option) AllData: Text
    var
        no: Text;
        instituteName: Text;
        documentType: Text;

    begin
        bulkProcessingHeader.Reset;
        bulkProcessingHeader.SetRange("Institution No.", instNo);
        bulkProcessingHeader.SetRange("Document Type", docType);
        if bulkProcessingHeader.FindSet() then begin
            repeat
                no := Format(bulkProcessingHeader."No.");
                instituteName := Format(bulkProcessingHeader."Institution Name");
                documentType := Format(bulkProcessingHeader."Document Type");


                AllData := AllData + no + '*' + instituteName + '*' + documentType + '::::';
            until bulkProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getBulkProcessingHeader1(no: code[30]) AllData: Text
    var
        no1: Text;
        instituteName: Text;
        documentType: Text;
        institutionNo: Text;

    begin
        bulkProcessingHeader.Reset;
        bulkProcessingHeader.SetRange("No.", no);
        if bulkProcessingHeader.FindSet() then begin
            repeat
                no1 := Format(bulkProcessingHeader."No.");
                instituteName := Format(bulkProcessingHeader."Institution Name");
                documentType := Format(bulkProcessingHeader."Document Type");
                institutionNo := Format(bulkProcessingHeader."No.");

                AllData := AllData + no1 + '*' + instituteName +
                 '*' + documentType + '*' + institutionNo + '::::';
            until bulkProcessingHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getBulkProcessingLines(bulkHeaderNo: Code[30]; docType: Option) AllData: Text
    var
        bulkHeader: Text;
        studentName: Text;
        courseDescription: Text;
        description: Text;
        courseId: Text;
        section: Text;
        partt: Text;
        paper: Text;
        amount: Text;
        lineNo: Text;



    begin
        bulkProcessingLines.Reset;
        bulkProcessingLines.SetRange("Bulk Header No.", bulkHeaderNo);
        bulkProcessingLines.SetRange("Document Type", docType);
        if bulkProcessingLines.FindSet() then begin
            repeat
                bulkHeader := Format(bulkProcessingLines."Bulk Header No.");
                studentName := Format(bulkProcessingLines."Student Name");
                courseDescription := Format(bulkProcessingLines."Course Description");
                description := Format(bulkProcessingLines.Description);
                courseId := Format(bulkProcessingLines."Course ID");
                section := Format(bulkProcessingLines.Section);
                partt := Format(bulkProcessingLines.Part);
                paper := Format(bulkProcessingLines.paper);
                amount := Format(bulkProcessingLines.Amount);
                lineNo := Format(bulkProcessingLines."Line No.");

                AllData := AllData + bulkHeader + '*' + studentName + '*' + courseDescription + '*' + description +
                '*' + courseId + '*' + section + '*' + partt + '*' + paper + '*' + amount + '*' + lineNo + '::::';
            until bulkProcessingLines.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getBulkProcessingLines1(regNo: Code[30]) AllData: Text
    var
        bulkHeader: Text;
        studentName: Text;
        courseDescription: Text;
        description: Text;
        courseId: Text;
        section: Text;
        partt: Text;
        paper: Text;
        amount: Text;
        lineNo: Text;



    begin
        bulkProcessingLines.Reset;
        bulkProcessingLines.SetRange("Registration No.", regNo);
        if bulkProcessingLines.FindSet() then begin
            repeat
                bulkHeader := Format(bulkProcessingLines."Bulk Header No.");
                studentName := Format(bulkProcessingLines."Student Name");
                courseDescription := Format(bulkProcessingLines."Course Description");
                description := Format(bulkProcessingLines.Description);
                courseId := Format(bulkProcessingLines."Course ID");
                section := Format(bulkProcessingLines.Section);
                partt := Format(bulkProcessingLines.Part);
                paper := Format(bulkProcessingLines.paper);
                amount := Format(bulkProcessingLines.Amount);
                lineNo := Format(bulkProcessingLines."Line No.");

                AllData := AllData + bulkHeader + '*' + studentName + '*' + courseDescription + '*' + description +
                '*' + courseId + '*' + section + '*' + partt + '*' + paper + '*' + amount + '*' + lineNo + '::::';
            until bulkProcessingLines.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getAttachDocuments(templateNo: code[30]; examinationProcess: option; examinationId: code[30]; examinationDocumentType: Text) AllData: Text
    var
        examinationDocumentTyp: Text;
        requirementType: Text;
        description: Text;
        entryNo: Text;
        examDoc: Text;

    begin
        attachDocuments.Reset;
        attachDocuments.SetRange("Examination Process", examinationProcess);
        attachDocuments.SetRange("Template No.", templateNo);
        attachDocuments.SetRange("Examiantion ID", examinationId);
        attachDocuments.SetRange("Examination Document Type", examinationDocumentType);
        if attachDocuments.FindSet() then begin
            repeat
                examinationDocumentTyp := Format(attachDocuments."Examination Document Type");
                requirementType := Format(attachDocuments."Requirement Type");
                description := Format(attachDocuments.Description);
                entryNo := Format(attachDocuments."Entry No.");
                examDoc := Format(attachDocuments."Examination Document");


                AllData := AllData + examinationDocumentTyp + '*' + requirementType +
                '*' + description + '*' + entryNo + '*' + examDoc + '::::';
            until attachDocuments.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getAttachDocuments1(templateNo: code[30]; examinationProcess: option; examinationId: code[30]) AllData: Text
    var
        examinationDocumentTyp: Text;
        requirementType: Text;
        description: Text;
        entryNo: Text;

    begin
        attachDocuments.Reset;
        attachDocuments.SetRange("Examination Process", examinationProcess);
        attachDocuments.SetRange("Template No.", templateNo);
        attachDocuments.SetRange("Examiantion ID", examinationId);
        if attachDocuments.FindSet() then begin
            repeat
                examinationDocumentTyp := Format(attachDocuments."Examination Document Type");
                requirementType := Format(attachDocuments."Requirement Type");
                description := Format(attachDocuments.Description);
                entryNo := Format(attachDocuments."Entry No.");


                AllData := AllData + examinationDocumentTyp + '*' + requirementType + '*' + description + '*' + entryNo + '::::';
            until attachDocuments.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getDocumentTemplate(courseId: Code[30]) AllData: Text
    var
        codee: Text;
        description: Text;

    begin
        documentTemplate.Reset;
        documentTemplate.SetRange(Blocked, false);
        documentTemplate.SetRange("Examination ID", courseId);

        if documentTemplate.FindSet() then begin
            repeat

                codee := Format(documentTemplate.Code);
                description := Format(documentTemplate.Description);


                AllData := AllData + codee + '*' + description + '::::';
            until documentTemplate.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getDocumentTemplate1(blocked: Boolean) AllData: Text
    var
        codee: Text;
        description: Text;


    begin
        documentTemplate.Reset;
        documentTemplate.SetRange(Blocked, blocked);

        if documentTemplate.FindSet() then begin
            repeat

                codee := Format(documentTemplate.Code);
                description := Format(documentTemplate.Description);


                AllData := AllData + codee + '*' + description + '::::';
            until documentTemplate.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getWithdrawalReasons(reasoncategory: Option) AllData: Text
    var
        codee: Text;
        description: Text;

    begin
        withdrawalReasons.Reset;
        withdrawalReasons.SetRange("Reason Category", reasoncategory);

        if withdrawalReasons.FindSet() then begin
            repeat

                codee := Format(withdrawalReasons.Code);
                description := Format(withdrawalReasons.Description);

                AllData := AllData + codee + '*' + description + '::::';
            until withdrawalReasons.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamBookingEntries(StudentNo: Text; txtstatus: Option) AllData: Text
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        feeamount: Text;
        status: Text;
        studentRegNo: text;
        studentName: Text;
        examination: Text;
        paart: Text;
        description: text;
        paper: Text;


    begin
        ExamBookingEntries.Reset;
        ExamBookingEntries.SetRange("Stud. Cust No.", StudentNo);
        ExamBookingEntries.SetRange(Blocked, false);
        ExamBookingEntries.SetRange(ExamBookingEntries.Status, ExamBookingEntries.Status::Open);
        if ExamBookingEntries.FindSet then begin
            repeat
                feeamount := Format(ExamBookingEntries."Fee Amount LCY");
                status := Format(ExamBookingEntries.Status);
                studentRegNo := Format(ExamBookingEntries."Student Reg No.");
                studentName := Format(ExamBookingEntries."Student Name");
                examination := Format(ExamBookingEntries.Examination);
                paart := Format(ExamBookingEntries.Part);
                description := Format(ExamBookingEntries.Description);
                paper := Format(ExamBookingEntries.Paper);

                AllData := AllData + studentRegNo + '*' + studentName + '*' + examination + '*' + paart + '*' + description + '*' + feeamount + '*' + status + '*' + paper + '::::';
            until ExamBookingEntries.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamBookingEntries1(StudentNo: Text; partt: code[30]) AllData: Text
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        feeamount: Text;
        status: Text;
        studentRegNo: text;
        studentName: Text;
        examination: Text;
        paart: Text;
        description: text;
        paper: Text;
        no: Text;


    begin
        ExamBookingEntries.Reset;
        ExamBookingEntries.SetRange("Stud. Cust No.", StudentNo);
        ExamBookingEntries.SetRange(Part, partt);
        if ExamBookingEntries.FindSet then begin
            repeat
                feeamount := Format(ExamBookingEntries."Fee Amount LCY");
                status := Format(ExamBookingEntries.Status);
                studentRegNo := Format(ExamBookingEntries."Student Reg No.");
                studentName := Format(ExamBookingEntries."Student Name");
                examination := Format(ExamBookingEntries.Examination);
                paart := Format(ExamBookingEntries.Part);
                description := Format(ExamBookingEntries.Description);
                paper := Format(ExamBookingEntries.Paper);


                AllData := AllData + studentRegNo + '*' + studentName + '*' + examination + '*' + paart + '*' + description + '*' + feeamount + '*' + status + '*' + paper + '::::';
            until ExamBookingEntries.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamBookingEntries2(StudentNo: Text; blocked: boolean) AllData: Text
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        feeamount: Text;
        status: Text;
        studentRegNo: text;
        studentName: Text;
        examination: Text;
        paart: Text;
        description: text;
        paper: Text;


    begin
        ExamBookingEntries.Reset;
        ExamBookingEntries.SetRange("Stud. Cust No.", StudentNo);
        ExamBookingEntries.SetRange(Blocked, blocked);
        if ExamBookingEntries.FindSet then begin
            repeat
                feeamount := Format(ExamBookingEntries."Fee Amount LCY");
                status := Format(ExamBookingEntries.Status);
                studentRegNo := Format(ExamBookingEntries."Student Reg No.");
                studentName := Format(ExamBookingEntries."Student Name");
                examination := Format(ExamBookingEntries.Examination);
                paart := Format(ExamBookingEntries.Part);
                description := Format(ExamBookingEntries.Description);
                paper := Format(ExamBookingEntries.Paper);

                AllData := AllData + studentRegNo + '*' + studentName + '*' + examination + '*' + paart + '*' + description + '*' + feeamount + '*' + status + '*' + paper + '::::';
            until ExamBookingEntries.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getCenterCourseCapacity(courseId: code[30]; blocked: Boolean) AllData: Text
    var
        centerName: Text;
        centerCode: Text;

    begin
        centerCourseCapacity.Reset;
        centerCourseCapacity.SetRange("Course Id", courseId);
        centerCourseCapacity.SetRange(Blocked, blocked);

        if centerCourseCapacity.FindSet() then begin
            repeat

                centerCode := Format(centerCourseCapacity."Centre Code");
                centerName := Format(centerCourseCapacity."Centre Name");

                AllData := AllData + centerName + '*' + centerCode + '::::';
            until centerCourseCapacity.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCenterCourseCapacity1(examzone: Code[30]; courseId: code[30]) AllData: Text
    var
        centerName: Text;
        centerCode: Text;

    begin
        centerCourseCapacity.Reset;
        centerCourseCapacity.SetRange("Course Id", courseId);
        centerCourseCapacity.SetRange("Zone Code", examzone);
        if centerCourseCapacity.FindSet() then begin
            repeat

                centerCode := Format(centerCourseCapacity."Centre Code");
                centerName := Format(centerCourseCapacity."Centre Name");

                AllData := AllData + centerCode + '*' + centerName + '::::';
            until centerCourseCapacity.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCRMCases() AllData: Text;
    var
        description: Text;
        codee: Text;
        caseType: Text;

    begin
        crmCases.Reset;

        if crmCases.FindSet() then begin
            repeat
                codee := Format(crmCases.Code);
                description := Format(crmCases.Description);
                caseType := Format(crmCases."Case Type");

                AllData := AllData + codee + '*' + description + '*' + caseType + '::::';
            until crmCases.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCRMCases1(caseTyp: Option) AllData: Text
    var
        description: Text;
        codee: Text;
        caseType: Text;

    begin
        crmCases.Reset;
        crmCases.setrange("Case Type", caseTyp);
        if crmCases.FindSet() then begin
            repeat
                codee := Format(crmCases.Code);
                description := Format(crmCases.Description);
                caseType := Format(crmCases."Case Type");

                AllData := AllData + codee + '*' + description + '*' + caseType + '::::';
            until crmCases.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getDisabilityEntries(appNo: Code[30]) AllData: Text
    var
        studentNo: Text;
        disabilityType: Text;
        disabilityName: Text;

    begin
        disabilityEntries.Reset;
        disabilityEntries.SetRange("Student No.", appNo);

        if disabilityEntries.FindSet() then begin
            repeat
                studentNo := Format(disabilityEntries."Student No.");
                disabilityType := Format(disabilityEntries."Disability Type");
                disabilityName := Format(disabilityEntries."Disability Name");

                AllData := AllData + studentNo + '*' + disabilityType + '*' + disabilityName + '::::';
            until disabilityEntries.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getDisabilityEntries2(appNo: Code[30]) AllData: Text
    var
        studentNo: Text;
        disabilityType: Text;
        disabilityName: Text;

    begin
        disabilityEntries.Reset;
        disabilityEntries.SetRange("Student No.", appNo);

        if disabilityEntries.FindSet() then begin
            repeat
                studentNo := Format(disabilityEntries."Student No.");
                disabilityType := Format(disabilityEntries."Disability Type");
                disabilityName := Format(disabilityEntries."Disability Name");

                AllData := AllData + studentNo + '*' + disabilityType + '*' + disabilityName + '::::';
            until disabilityEntries.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getMpesaTransaction(accountNumber: code[50]) AllData: Text
    var
        cust: Text;
        mpesaAmmount: text;

    begin
        mpesaTransaction.Reset;
        mpesaTransaction.SetRange(ACCOUNT_NUMBER, accountNumber);

        if mpesaTransaction.FindSet() then begin
            repeat
                cust := Format(mpesaTransaction.MSISDN_CUSTOMER);
                mpesaAmmount := Format((mpesaTransaction.MPESA_AMOUNT));


                AllData := AllData + cust + '*' + mpesaAmmount + '::::';
            until mpesaTransaction.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCRMTraining(published: Boolean) AllData: Text
    var
        location: Text;
        providername: Text;
        costOfTraining: Text;
        innovationStartDate: Text;
        innovationEndDate: Text;
        documentNo: Text;
        desc: Text;

    begin
        crmTraining.Reset;
        crmTraining.SetFilter("End Date", '>%1', Today);
        crmTraining.SetRange(published, published);
        if crmTraining.FindSet() then begin
            repeat
                location := Format(crmTraining.Location);
                providername := Format(crmTraining.Provider);
                costOfTraining := Format(crmTraining."Cost Of Training");
                innovationStartDate := Format(crmTraining."Start Date");
                innovationEndDate := Format(crmTraining."End Date");
                documentNo := Format(crmTraining."Document No.");
                desc := Format(crmTraining.Description);

                AllData := AllData + location + '*' + providername + '*' + costOfTraining + '*' + innovationStartDate +
                '*' + innovationEndDate + '*' + documentNo + '*' + desc + '::::';
            until crmTraining.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCRMTraining2(vacId: code[30]; published: Boolean) AllData: Text
    var
        location: Text;
        providername: Text;
        costOfTraining: Text;
        innovationStartDate: Text;
        innovationEndDate: Text;
        documentNo: Text;
        duration: Text;
        durationUnits: Text;
        attendees: Text;
        innovationDesc: Text;

    begin
        crmTraining.Reset;
        crmTraining.SetFilter("End Date", '>%1', Today);
        crmTraining.SetRange(published, published);
        crmTraining.SetRange("Document No.", vacId);
        if crmTraining.FindSet() then begin
            repeat
                location := Format(crmTraining.Location);
                providername := Format(crmTraining.Provider);
                costOfTraining := Format(crmTraining."Cost Of Training");
                innovationStartDate := Format(crmTraining."Start Date");
                innovationEndDate := Format(crmTraining."End Date");
                documentNo := Format(crmTraining."Document No.");
                duration := Format(crmTraining.Duration);
                durationUnits := Format(crmTraining."Duration Units");
                attendees := Format(crmTraining.Attendees);
                innovationDesc := Format(crmTraining.Description);

                AllData := AllData + location + '*' + providername + '*' + costOfTraining + '*' + innovationStartDate + '*' + innovationEndDate +
                '*' + documentNo + '*' + duration + '*' + durationUnits + '*' + attendees + '*' + innovationDesc + '::::';
            until crmTraining.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getInnovationSolicitationsLines(docNo: Code[30]; recordType: Option; docType: option) AllData: Text
    var
        documentNo: Text;
        description: Text;

    begin
        innovationSolicitationLines.Reset;
        innovationSolicitationLines.SetRange("Document No", docNo);
        innovationSolicitationLines.SetRange("Record Type", recordType);
        innovationSolicitationLines.SetRange("Document Type", docType);

        if innovationSolicitationLines.FindSet() then begin
            repeat
                documentNo := Format(innovationSolicitationLines."Document No");
                description := Format(innovationSolicitationLines.Description);

                AllData := AllData + documentNo + '*' + description + '::::';
            until innovationSolicitationLines.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getTimePlanners(approvalStatus: Option; posted: Boolean; published: Boolean) AllData: Text
    var
        codee: Text;
        examinationSittingId: Text;
        description: Text;

    begin
        timePlanners.Reset;
        timePlanners.SetRange("Approval Status", approvalStatus);
        timePlanners.SetRange(Posted, posted);
        timePlanners.SetRange(Published, published);

        if timePlanners.FindSet() then begin
            repeat
                codee := Format(timePlanners.Code);
                description := Format(timePlanners.Description);
                examinationSittingId := Format(timePlanners."Exam Sitting ID");

                AllData := AllData + codee + '*' + examinationSittingId + '*' + description + '::::';
            until timePlanners.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCRMVacancies(published: Boolean) AllData: Text
    var
        applicationEndDatee: Text;
        position: Text;
        comments: Text;
        noOfOpenings: Text;
        employer: Text;
        vacancyNo: Text;
        estAnualSalary: Text;
        empType: Text;
        region: Text;


    begin
        crmVacancies.Reset;
        crmVacancies.SetFilter("Application End Date", '>%1', Today);
        crmVacancies.SetRange(Published, published);

        if crmVacancies.FindSet() then begin
            repeat
                applicationEndDatee := Format(crmVacancies."Application End Date");
                position := Format(crmVacancies.Position);
                comments := Format(crmVacancies.Comments);
                noOfOpenings := Format(crmVacancies."No of Openings");
                employer := Format(crmVacancies.Employer);
                vacancyNo := Format(crmVacancies."Vacancy No");
                estAnualSalary := Format(crmVacancies."Estimate Annual Salary");
                region := Format(crmVacancies.Region);

                AllData := AllData + position + '*' + noOfOpenings + '*' + employer + applicationEndDatee + '*' + comments + '*' + vacancyNo
                + '*' + estAnualSalary + '*' + region + '::::';
            until crmVacancies.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCRMVacancies2(vacNo: Code[30]) AllData: Text
    var
        applicationEndDatee: Text;
        position: Text;
        comments: Text;
        noOfOpenings: Text;
        employer: Text;
        vacancyNo: Text;
        estAnualSalary: Text;
        empType: Text;
        region: Text;


    begin
        crmVacancies.Reset;
        crmVacancies.SetFilter("Application End Date", '>%1', Today);
        crmVacancies.SetRange("Vacancy No", vacNo);

        if crmVacancies.FindSet() then begin
            repeat
                applicationEndDatee := Format(crmVacancies."Application End Date");
                position := Format(crmVacancies.Position);
                comments := Format(crmVacancies.Comments);
                noOfOpenings := Format(crmVacancies."No of Openings");
                employer := Format(crmVacancies.Employer);
                vacancyNo := Format(crmVacancies."Vacancy No");
                estAnualSalary := Format(crmVacancies."Estimate Annual Salary");
                region := Format(crmVacancies.Region);
                empType := Format(crmVacancies."Employment Type");

                AllData := AllData + position + '*' + noOfOpenings + '*' + employer + '*' + applicationEndDatee + '*' + comments + '*' + vacancyNo
                + '*' + estAnualSalary + '*' + region + '*' + empType + '::::';
            until crmVacancies.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCRMVacancyRequirement(vacancyId: Code[30]) AllData: Text
    var
        qualificationCategory: Text;
        requirementType: Text;
        description: Text;

    begin
        crmVacancancyRequirement.Reset;
        crmVacancancyRequirement.SetRange("Vacancy ID", vacancyId);

        if crmVacancancyRequirement.FindSet() then begin
            repeat
                qualificationCategory := Format(crmVacancancyRequirement."Qualification Category");
                description := Format(crmVacancancyRequirement.Description);
                requirementType := Format(crmVacancancyRequirement."Requirement Type");

                AllData := AllData + qualificationCategory + '*' + description + '*' + requirementType + '::::';
            until crmVacancancyRequirement.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getCRMVacancyResponsibility(vacancyId: Code[30]) AllData: Text
    var
        vacId: Text;
        description: Text;

    begin
        crmVacancyResponsibility.Reset;
        crmVacancyResponsibility.SetRange("Vacancy ID", vacancyId);

        if crmVacancyResponsibility.FindSet() then begin
            repeat
                vacId := Format(crmVacancyResponsibility."Vacancy ID");
                description := Format(crmVacancyResponsibility.Description);


                AllData := AllData + vacId + '*' + description + '::::';
            until crmVacancyResponsibility.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getBRResponseSection() AllData: Text
    var
        description: Text;
        surveyResponseId: Text;
        sectionId: Text;
        sectionCode: Text;
        sectionCompleteInstruction: Text;
        noOfQuestions: Text;
        totalWeightPerc: Text;

    begin
        brResponseSection.Reset;


        if brResponseSection.FindSet() then begin
            repeat
                description := Format(brResponseSection.Description);
                surveyResponseId := Format(brResponseSection."Survey Response ID");
                //sectionId := Format(brResponseSection.sectio);
                sectionCode := Format(brResponseSection."Section Code");
                sectionCompleteInstruction := Format(brResponseSection."Section Completion Instruction");
                noOfQuestions := Format(brResponseSection."No. of Questions");
                totalWeightPerc := Format(brResponseSection."Total Weight %");

                AllData := AllData + surveyResponseId + '*' + description + '*' + sectionCode + '*' + sectionCompleteInstruction + '*' + noOfQuestions + '*' + totalWeightPerc + '::::';
            until brResponseSection.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getBRResponseSection1(surveyNo: Code[30]) AllData: Text
    var
        description: Text;
        surveyResponseId: Text;
        sectionId: Text;
        sectionCode: Text;
        sectionCompleteInstruction: Text;
        noOfQuestions: Text;
        totalWeightPerc: Text;

    begin
        brResponseSection.Reset;
        brResponseSection.SetRange("Survey Response ID", surveyNo);

        if brResponseSection.FindSet() then begin
            repeat
                description := Format(brResponseSection.Description);
                surveyResponseId := Format(brResponseSection."Survey Response ID");
                //sectionId := Format(brResponseSection.sectio);
                sectionCode := Format(brResponseSection."Section Code");
                sectionCompleteInstruction := Format(brResponseSection."Section Completion Instruction");
                noOfQuestions := Format(brResponseSection."No. of Questions");
                totalWeightPerc := Format(brResponseSection."Total Weight %");

                AllData := AllData + surveyResponseId + '*' + description + '*' + sectionCode + '*' + sectionCompleteInstruction + '*' + noOfQuestions + '*' + totalWeightPerc + '::::';
            until brResponseSection.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getBRResponseQuestion() AllData: Text
    var
        parentQuestionId: Text;
        questionType: Text;
        responseType: Text;
        noOfBranchLogic: Text;
        branchLogicQuestion: Text;
        mandatory: Text;
        surveyResponseId: Text;
        sectionCode: Text;
        questionId: Text;
        question: Text;
        ratingType: Text;
        responseValue: Text;
        generalResponseStatement: Text;
        assignedWeight: Text;
        desiredPerformanceDirection: Text;
        optionTextResponseType: Text;


    begin

        brResponseQuestion.Reset();

        if brResponseQuestion.FindSet() then begin
            repeat
                surveyResponseId := Format(brResponseQuestion."Survey Response ID");
                sectionCode := Format(brResponseQuestion."Section Code");
                surveyResponseId := Format(brResponseQuestion."Survey Response ID");
                questionId := Format(brResponseQuestion."Question ID");
                question := Format(brResponseQuestion.Question);
                ratingType := Format(brResponseQuestion."Rating Type");
                responseValue := Format(brResponseQuestion."Response Value");
                generalResponseStatement := Format(brResponseQuestion."General Response Statement");
                assignedWeight := Format(brResponseQuestion."Assigned Weight %");
                desiredPerformanceDirection := Format(brResponseQuestion."Desired Perfomance Direction");
                optionTextResponseType := Format(brResponseQuestion."Option Text Response Type");
                parentQuestionId := Format(brResponseQuestion."Parent Question ID");
                questionType := Format(brResponseQuestion."Question Type");
                responseType := Format(brResponseQuestion."Response Type");
                noOfBranchLogic := Format(brResponseQuestion."No. of Branch Logic Conditions");
                branchLogicQuestion := Format(brResponseQuestion."Branch Logic Question");
                mandatory := Format(brResponseQuestion.Mandatory);

                AllData := AllData + surveyResponseId + '*' + surveyResponseId + '*' + sectionCode + '*' + surveyResponseId + '*' + question + '*' + ratingType + '*' + responseValue + '*' + generalResponseStatement + '*' + assignedWeight + '*' + desiredPerformanceDirection + '*' + parentQuestionId + '*' + questionType + '*' + responseType + '*' + noOfBranchLogic + '*' + mandatory + '::::';
            until brResponseQuestion.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getBRResponseScoreGuide() AllData: Text
    var

        surveyResponseId: Text;
        sectionCode: Text;
        questionId: Text;
        lineNo: Text;
        desiredPerformanceDirection: Text;
        ratingType: Text;
        responseValue: Text;
        scorePerc: Text;

    begin

        brResponseScoreGuide.Reset();

        if brResponseScoreGuide.FindSet() then begin
            repeat
                surveyResponseId := Format(brResponseScoreGuide."Survey Response ID");
                sectionCode := Format(brResponseScoreGuide."Section Code");
                questionId := Format(brResponseScoreGuide."Question ID");
                lineNo := Format(brResponseScoreGuide."Line No");
                desiredPerformanceDirection := Format(brResponseScoreGuide."Desired Perfomance Direction");
                ratingType := Format(brResponseScoreGuide."Rating Type");
                responseValue := Format(brResponseScoreGuide."Response Value");
                scorePerc := Format(brResponseScoreGuide."Score %");

                AllData := AllData + surveyResponseId + '*' + surveyResponseId + '*' + sectionCode + '*' + surveyResponseId + '*' + ratingType + '*' + responseValue + '*' + desiredPerformanceDirection + '::::';
            until brResponseScoreGuide.Next = 0;

        end;
        exit(AllData);
    end;

    procedure getIntCustomers(custType: Option) AllData: Text
    var
        name: Text;
        no: Text;
        balanceLCY: Text;

    begin
        intCustomers.Reset;
        intCustomers.setrange("Customer Type", custType);

        if intCustomers.FindSet() then begin
            repeat
                name := Format(intCustomers.Name);
                no := Format(intCustomers."No.");
                balanceLCY := Format(intCustomers."Balance (LCY)");


                AllData := AllData + name + '*' + no + '::::';
            until intCustomers.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getIntCustomers1(IdNo: code[30]) AllData: Text
    var
        name: Text;
        no: Text;
        balanceLCY: Text;
        address: Text;
        address2: Text;
        county: Text;
        postalCode: Text;
        city: Text;
        countryCode: Text;


    begin
        intCustomers.Reset;
        intCustomers.setrange("ID. No.", IdNo);

        if intCustomers.FindSet() then begin
            repeat
                name := Format(intCustomers.Name);
                no := Format(intCustomers."No.");
                balanceLCY := Format(intCustomers."Balance (LCY)");
                address := Format(intCustomers.Address);
                address2 := Format(intCustomers."Address 2");
                county := Format(intCustomers.County);
                postalCode := Format(intCustomers."Position code");
                city := Format(intCustomers.City);
                countryCode := Format(intCustomers."Country/Region Code");


                AllData := AllData + balanceLCY + '*' + no + '*' + address + '*'
                + address2 + '*' + county + '*' + postalCode + '*' + city + '*' + countryCode + '::::';
            until intCustomers.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getIntCustomers2() AllData: Text
    var
        name: Text;
        no: Text;
        balanceLCY: Text;

    begin
        intCustomers.Reset;
        if intCustomers.FindSet() then begin
            repeat
                name := Format(intCustomers.Name);
                no := Format(intCustomers."No.");
                balanceLCY := Format(intCustomers."Balance (LCY)");


                AllData := AllData + balanceLCY + '*' + no + '::::';
            until intCustomers.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentDisability() AllData: Text
    var
        codee: Text;
        description: Text;

    begin
        studentDisability.Reset;

        if studentDisability.FindSet() then begin
            repeat
                codee := Format(studentDisability.Code);
                description := Format(studentDisability.Description);

                AllData := AllData + codee + '*' + description + '::::';
            until studentDisability.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentDisability1(codeee: code[30]) AllData: Text
    var
        codee: Text;
        description: Text;

    begin
        studentDisability.Reset;
        studentDisability.SetRange(Code, codeee);
        if studentDisability.FindSet() then begin
            repeat
                codee := Format(studentDisability.Code);
                description := Format(studentDisability.Description);

                AllData := AllData + codee + '*' + description + '::::';
            until studentDisability.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getGetCountries() AllData: Text
    var
        codee: Text;
        name: Text;

    begin
        countries.Reset;

        if countries.FindSet() then begin
            repeat
                codee := Format(countries.Code);
                name := Format(countries.Name);

                AllData := AllData + codee + '*' + name + '::::';
            until countries.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getGetCenterBookingEntries(examCenterCode: Code[30]; status: option; subjectCode: Code[30]) AllData: Text
    var
        examDesc: Text;
        examId: Text;

    begin
        centerBookingEntries.Reset;
        centerBookingEntries.setrange("Exam Center Code", examCenterCode);
        centerBookingEntries.SetRange(Status, status);
        centerBookingEntries.SetRange("Subject Code", subjectCode);
        if centerBookingEntries.FindSet() then begin
            repeat
                examDesc := Format(centerBookingEntries."Examination Description");
                examId := Format(centerBookingEntries."Examination Id");
                AllData := AllData + examId + '*' + examDesc + '::::';
            until centerBookingEntries.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamininationsetup() AllData: Text
    var
        allocNos: Text;

    begin
        ExaminationSetup.Reset;
        if ExaminationSetup.FindSet() then begin
            repeat
                allocNos := Format(ExaminationSetup."Allocation Nos.");

                AllData := AllData + allocNos + '::::';
            until ExaminationSetup.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getJobTask(jobNo: Text) AllData: Text
    var
        jobTaskNo: Text;
        description: Text;

    begin
        jobTask.Reset;
        jobTask.SetRange("Job No.", jobNo);
        if jobTask.FindSet then begin
            repeat
                jobTaskNo := Format(jobTask."Job Task No.");
                description := Format(jobTask.Description);

                AllData := AllData + jobTaskNo + '*' + description + '::::';
            until examcourses.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getStudentRegistrationQualifications(idNo: Code[30]) AllData: Text
    var
        from: Text;
        enddate: Text;
        qualification: Text;
        Institution: Text;
        MainAreaOfStudy: Text;
        LineNo: Text;

    begin
        StudentReegistrationQualif.Reset();
        StudentReegistrationQualif.SetRange("Id Number", idNo);
        if StudentReegistrationQualif.FindSet then begin
            repeat
                from := Format(StudentReegistrationQualif.From);
                enddate := Format(StudentReegistrationQualif."To");
                qualification := Format(StudentReegistrationQualif."Qualification Earned");
                Institution := Format(StudentReegistrationQualif.Institution);
                MainAreaOfStudy := Format(StudentReegistrationQualif."Main Field of Study");
                LineNo := Format(StudentReegistrationQualif."Line No");

                AllData := AllData + from + '*' + enddate + '*' + Institution + '*' + qualification +
                 '*' + MainAreaOfStudy + '*' + LineNo + '::::';
            until StudentReegistrationQualif.Next = 0;
        end;
        exit(AllData);
    end;

















}
