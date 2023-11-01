#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 57009 "ProcessingResources"
{

    trigger OnRun()
    begin
        Message(FnInsertMarkerDiscosure('RES4777', '1005'));
    end;

    var
        FILESPATH: label 'C:\inetpub\wwwroot\MarkersPortal\downloads\';
        FILESPATH1: label 'C:\inetpub\wwwroot\MarkersPortal\downloads\ClaimReport\';
        FILESPATH2: label 'C:\inetpub\wwwroot\Setters\downloads\SetterClaimForm\';
        Resource: Record Resource;
        SetterHeader: Record "Setter Header";
        DisclosureTrainingInst: Record "Disclosure Training Inst";
        DisclosureRelative: Record "Disclosure Relative";
        DisclosurePaperSubmitted: Record "Disclosure Paper Submitted";
        SettingandModeration: Codeunit "Setting and Moderation";
        MarksheetDetailedLines: Record "Marksheet Detailed Lines";
        ExaminationSetup: Record "Examination Setup";
        DispScriptEnvelopeSerials: Record "Disp Script Envelope Serials";
        FILESPATH09: label 'C:\inetpub\wwwroot\CloneEss\downloads\RiskManagementPlanDocuments\';
        //SMTPMailSetup: Record "SMTP Mail Setup";
        //SMTP: Codeunit "SMTP Mail";
        FILESPATH010: label 'C:\inetpub\wwwroot\CloneEss\downloads\RiskManagementPlanDocuments\';
        FILESPATH011: label 'C:\inetpub\wwwroot\CloneEss\downloads\RiskManagementPlanDocuments\';
        FILESPATH012: label 'C:\inetpub\wwwroot\InstitutionalConfirmation\downloads\ConfirmationInvoices\';
        FILESPATH013: label 'C:\inetpub\wwwroot\InstitutionalConfirmation\downloads\ConfirmationLetters\';
        StudentProcessingHeader: Record "Student Processing Header";
        StudentProcessingLines: Record "Student Processing Lines";

    procedure GenerateClaimReport(refNo: Text) status: Text
    var
        ScriptsDispatchHeader: Record "Scripts Dispatch Header";
    begin
        ScriptsDispatchHeader.Reset;
        ScriptsDispatchHeader.SetRange("Document No.", refNo);
        if ScriptsDispatchHeader.FindSet then begin
            if FILE.Exists(FILESPATH1 + refNo + '.pdf') then begin
                FILE.Erase(FILESPATH1 + refNo + '.pdf');
                Report.SaveAsPdf(85198, FILESPATH1 + refNo + '.pdf', ScriptsDispatchHeader);
                status := 'success*Generated*Downloads\ClaimReport\' + refNo + '.pdf';
            end else begin
                Report.SaveAsPdf(85198, FILESPATH1 + refNo + '.pdf', ScriptsDispatchHeader);
                status := 'success*Generated*Downloads\ClaimReport\' + refNo + '.pdf';
            end
        end else begin
            status := 'danger*Document not found';
        end
    end;

    procedure FnAddSetterQuestionLine(appNo: Code[50]; lineNo: Integer; reference: Text; knc: Integer; ana: Integer; enc: Integer) status: Text
    var
        SetterHeader: Record "Setter Header";
        ExaminationReviewLines: Record "Examination Review Lines";
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", appNo);
        if SetterHeader.FindSet then begin
            ExaminationReviewLines.Reset;
            ExaminationReviewLines.SetRange("Document No.", appNo);
            ExaminationReviewLines.SetRange("Line No.", lineNo);
            if ExaminationReviewLines.FindSet then begin
                //  ExaminationReviewLines.INIT;
                //  ExaminationReviewLines."Document No." := appNo;
                //  ExaminationReviewLines."Topic Code" := topic;
                //  ExaminationReviewLines.VALIDATE("Topic Code");
                //  ExaminationReviewLines."Setter Code" := SetterHeader."Examiner Code";
                //  ExaminationReviewLines.VALIDATE("Setter Code");
                //  ExaminationReviewLines."Line No." := lineNo;
                ExaminationReviewLines.References := reference;
                ExaminationReviewLines."Knowledge and Comprehension" := knc;
                ExaminationReviewLines."Application and Analysis" := ana;
                ExaminationReviewLines."Evaluation and Creativity" := enc;
                if ExaminationReviewLines.Modify(true) then begin
                    status := 'success*Question details have been added successfully';
                end else begin
                    status := 'danger*An error occured while adding question details';
                end
            end else begin
                status := 'danger*Question could not be found';
            end

        end else begin
            status := 'danger*Setter Specification header not found.';
        end
    end;

    procedure FnaddSetterSpecificationHeader(examSitting: Code[50]; examination: Code[50]; level: Code[50]; levelCode: Code[50]; empNo: Code[10]) status: Text
    var
        SetterHeader: Record "Setter Header";
        SetterTaskAllocation: Record "Setter Task Allocation";
    begin
        //SetterTaskAllocation.RESET;
        SetterHeader.Init;
        SetterHeader."Document Type" := SetterHeader."document type"::"Setter Specification";
        SetterHeader."Examiner Code" := empNo;
        SetterHeader.Validate("Examiner Code");
        SetterHeader."Examination Sitting" := examSitting;
        SetterHeader.Examination := examination;
        SetterHeader.Level := level;
        SetterHeader."Paper Code" := levelCode;
        SetterHeader.Validate("Paper Code");
        if SetterHeader.Insert(true) then begin
            SettingandModeration.SuggestNoOfQuestions(SetterHeader);
            status := 'success*Setter specification crested succesfully*' + SetterHeader."Document No.";
        end else begin
            status := 'danger*Error occured while creating your setter specification';
        end
    end;

    procedure GenerateSetterClaimForm(reqNo: Code[30]) status: Text
    var
        SetterHeader: Record "Setter Header";
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", reqNo);
        if SetterHeader.FindSet then begin
            if FILE.Exists(FILESPATH2 + reqNo + '.pdf') then begin
                FILE.Erase(FILESPATH2 + reqNo + '.pdf');
                Report.SaveAsPdf(85400, FILESPATH2 + reqNo + '.pdf', SetterHeader);
                status := 'success*Generated*Downloads\SetterClaimForm\' + reqNo + '.pdf';
            end else begin
                Report.SaveAsPdf(85400, FILESPATH2 + reqNo + '.pdf', SetterHeader);
                status := 'success*Generated*Downloads\SetterClaimForm\' + reqNo + '.pdf';
            end
        end else begin
            status := 'danger*document not found';
        end
    end;

    procedure FnInsertStudentMarks(examSitting: Text; paper: Code[30]; regNo: Code[30]; mark: Decimal) status: Text
    var
        MarksheetDetailedLines: Record "Marksheet Detailed Lines";
    begin
        MarksheetDetailedLines.Init;
        MarksheetDetailedLines.SetRange("Examination Sitting ID", examSitting);
        MarksheetDetailedLines.SetRange(Paper, paper);
        MarksheetDetailedLines.SetRange("Student Reg No.", regNo);
        if MarksheetDetailedLines.FindSet then begin
            MarksheetDetailedLines.Mark := mark;
            if MarksheetDetailedLines.Insert(true) then begin
                status := 'success*Student mark Inserted Successfully';
            end else begin
                status := 'danger*An Error occured while entering student marks';
            end
        end else begin
            status := 'danger*An error occured while inserting student marks';
        end
    end;

    procedure FnRequestMarkerCredentials(IdNumber: Code[50]) status: Text
    var
        Resource: Record Resource;
        MarkerPortalUser: Record "Internal Mail Issuance";
        passwordOk: Boolean;
        password: Integer;
    begin
        /*
        Resource.RESET;
        //Resource.SETRANGE("ID/Passport No",IdNumber);
        //Resource.SETRANGE("Exam Task Type",Resource."Exam Task Type"::Marker);
        Resource.SETRANGE("No.",'RES0700');
        IF Resource.FINDSET THEN BEGIN
          MarkerPortalUser.RESET;
          MarkerPortalUser.SETRANGE(IdNo,IdNumber);
          IF MarkerPortalUser.FINDSET THEN BEGIN
            status:= 'danger*You already have an active markers account. Kindly Proceed to login to access the portal';
            END ELSE BEGIN
              passwordOk:= FALSE;
              REPEAT
              password:= RANDOM(9999);
              IF password >1000 THEN
                passwordOk:=TRUE;
              UNTIL passwordOk=TRUE;
              MarkerPortalUser.INIT;
              MarkerPortalUser.IdNo:= IdNumber;
              MarkerPortalUser.password:= FORMAT(password);
              MarkerPortalUser.MarkerNo := Resource."No.";
              IF MarkerPortalUser.INSERT(TRUE) THEN BEGIN
                objMail.CreateMessage('Kasneb','support@kasneb.org', 'brayohorina@gmail.com', 'One Time Password', 'Your one time password is <strong>'+FORMAT(password)+'</strong>', TRUE);
                objMail.Send();
                //status:='success*We have sent a one time password to your email ('+Resource."E-Mail"+'). Use it to log in to your account';
                status:='success*We have sent a one time password to your email (brayohorina@gmail.com). Use it to log in to your account';
                END ELSE BEGIN
                END
              END
        
          END ELSE BEGIN
            status:= 'danger*The given Identification number does not belong to any marker. Kindly Contact System Administrater for assistance.';
            END
            */

    end;

    procedure FnResetMarkerPassword(idNo: Code[10]) status: Text
    var
        MarkerPortalUser: Record "Internal Mail Issuance";
        passwordOk: Boolean;
        password: Integer;
        Resource: Record Resource;
    begin
        /*
        status:='danger*Account not found';
        MarkerPortalUser.SETRANGE(IdNo,idNo);
        //MarkerPortalUser.SETRANGE(changedPassword,FALSE);
        IF MarkerPortalUser.FINDSET THEN BEGIN
            passwordOk:= FALSE;
              REPEAT
              password:= RANDOM(9999);
                IF password >1000 THEN
                  passwordOk:=TRUE;
                UNTIL passwordOk=TRUE;
                MarkerPortalUser.RESET;
                MarkerPortalUser.password:= FORMAT(password);
                MarkerPortalUser.changedPassword:= FALSE;
                MarkerPortalUser.MODIFY(TRUE);
                  SMTPMailSetup.GET();
                  objMail.CreateMessage(SMTPMailSetup."Email Sender Name",SMTPMailSetup."Email Sender Address", 'brayohorina@gmail.com', 'Password Reset', 'Your one time password is <strong>'+FORMAT(password)+'</strong>', TRUE);
                  objMail.Send();
            status:='success*We have sent a one time password to your email (brayohorina@gmail.com). Use it to log in to your account';
          //status:='danger*You have not added company email to the selected employee. Kindly update and try again';
          END ELSE BEGIN
            status:='danger*Account with the given credentials does not exist';
            END;
            */

    end;

    procedure FnCreateSetterHeader(setterNumber: Code[50]; texamSitting: Code[50]) status: Text
    begin
        Resource.Reset;
        Resource.SetRange("No.", setterNumber);
        if Resource.FindSet then begin
            SetterHeader.Reset;
            SetterHeader.SetRange("Examiner Code", setterNumber);
            SetterHeader.SetRange("Examination Sitting", texamSitting);
            if SetterHeader.FindSet then begin
                status := 'success*You have an existing disclosure form for' + texamSitting + 'sitting *' + SetterHeader."Document No.";
            end else begin
                SetterHeader.Init;
                SetterHeader."Document Type" := SetterHeader."document type"::"Setter Disclosure";
                SetterHeader."Examination Sitting" := texamSitting;
                SetterHeader."Examiner Code" := setterNumber;
                SetterHeader.Validate("Examiner Code");
                SetterHeader."ID No." := Resource."ID/Passport No";
                SetterHeader."Phone No." := Resource."M-Pesa Number";
                //SetterHeader."No. of Papers" := tnoPapers;
                if SetterHeader.Insert(true) then begin
                    status := 'success*Setter introductory details have been added successfully*' + SetterHeader."Document No.";
                end else begin
                    status := 'danger*An error occured while adding setter introductory details';
                end
            end


        end else begin
            status := 'danger*Setter with Id ' + setterNumber + ' could not be found in the system. Kindly contact the sytem adminstrator for help.';
        end
    end;

    procedure CreateDisclosurePapers(docNo: Code[50]; exam: Code[50]; level: Code[50]; paperCode: Code[50]) status: Text
    var
        DisclosurePapers: Record "Disclosure Papers";
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", docNo);
        if SetterHeader.FindSet then begin
            DisclosurePapers.Init;
            DisclosurePapers."Document No." := docNo;
            DisclosurePapers.Examination := exam;
            DisclosurePapers.Validate(Examination);
            DisclosurePapers.Level := level;
            DisclosurePapers."Paper Code" := paperCode;
            DisclosurePapers.Validate("Paper Code");
            if DisclosurePapers.Insert(true) then begin
                status := 'success* Paper has been added successfully';
            end else begin
                status := 'danger*An error occured while adding paper';
            end
        end else begin
            status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
        end
    end;

    procedure CreateDisclosureInstitutions(docNo: Code[50]; institution: Code[50]; dateCommenced: Date) status: Text
    var
        DisclosureTrainingInst: Record "Disclosure Training Inst";
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", docNo);
        if SetterHeader.FindSet then begin
            DisclosureTrainingInst.Init;
            DisclosureTrainingInst."Document No." := docNo;
            DisclosureTrainingInst."Institution Code" := institution;
            DisclosureRelative.Validate("Institution Code");
            DisclosureTrainingInst.Validate("Institution Code");
            DisclosureTrainingInst."Date Commenced Training" := dateCommenced;
            if DisclosureTrainingInst.Insert(true) then begin
                status := 'success*Institution has been added successfully';
            end else begin
                status := 'danger*An error occured while adding disclosure Institution';
            end
        end else begin
            status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
        end
    end;

    procedure CreateDisclosureRelatives(docNo: Code[50]; relativeName: Text; relationship: Option; studRegNo: Text; course: Code[50]) status: Text
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", docNo);
        if SetterHeader.FindSet then begin
            DisclosureRelative.Init;
            DisclosureRelative."Document No." := docNo;
            DisclosureRelative."Name of Relative" := relativeName;
            DisclosureRelative.Relationship := relationship;
            DisclosureRelative."Student Reg No." := studRegNo;
            DisclosureRelative.Course := course;
            if DisclosureRelative.Insert(true) then begin
                status := 'success* Relative has been added successfully';
            end else begin
                status := 'danger*An error occured while adding relative';
            end
        end else begin
            status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
        end
    end;

    procedure CreateDisclosureOther(docNo: Code[10]; institution: Code[50]; interest: Text) status: Text
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", docNo);
        if SetterHeader.FindSet then begin
            DisclosureRelative.Init;
            DisclosureRelative."Document No." := docNo;
            DisclosureRelative."Institution Code" := institution;
            DisclosureRelative.Validate("Institution Code");
            DisclosureRelative."Nature of Interest" := interest;
            if DisclosureRelative.Insert(true) then begin
                status := 'success* Relative has been added successfully';
            end else begin
                status := 'danger*An error occured while adding disclosure';
            end
        end else begin
            status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
        end
    end;

    procedure CreateDisclosureSubmittedPapers(docNo: Code[50]; exam: Code[50]; level: Code[50]; paperCode: Code[50]; questionNumber: Integer; topicCode: Code[50]) status: Text
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", docNo);
        if SetterHeader.FindSet then begin
            DisclosurePaperSubmitted.Init;
            DisclosurePaperSubmitted."Document No." := docNo;
            DisclosurePaperSubmitted.Examination := exam;
            DisclosurePaperSubmitted.Validate(Examination);
            DisclosurePaperSubmitted.Level := level;
            DisclosurePaperSubmitted."Paper Code" := paperCode;
            DisclosurePaperSubmitted.Validate("Paper Code");
            DisclosurePaperSubmitted."Question No." := questionNumber;
            DisclosurePaperSubmitted."Topic Code" := topicCode;
            DisclosurePaperSubmitted.Validate("Topic Code");
            if DisclosurePaperSubmitted.Insert(true) then begin
                status := 'success* Disclosure Submitted paper has been added successfully';
            end else begin
                status := 'danger*An error occured while adding disclosure submitted paper';
            end
        end else begin
            status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
        end
    end;

    procedure CreateDeclaration(docNo: Code[50]) status: Text
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", docNo);
        if SetterHeader.FindSet then begin
            SetterHeader.Declaration := true;
            SetterHeader."Declaration Date" := CurrentDatetime;
            //  SetterHeader.Submitted := TRUE;
            //  SetterHeader."Submitted By" := ;
            //  SetterHeader."Submitted On" := CURRENTDATETIME;
            if SetterHeader.Modify(true) then begin
                status := 'success*Your declaration form has been submitted successfully';
            end else begin
                status := 'danger*An error occured while submitting your declaration form.';
            end
        end else begin
            status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
        end
    end;

    procedure SubmitQuestionDetails(docNo: Code[10]; setterNo: Code[10]) status: Text
    begin
        // SetterHeader.RESET;
        // SetterHeader.SETRANGE("Document No.",docNo);
        if SetterHeader.FindSet then begin
            SetterHeader.Submitted := true;
            SetterHeader."Submitted On" := CurrentDatetime;
            SetterHeader."Submitted By" := setterNo;
            if SetterHeader.Modify(true) then begin
                status := 'success*Specification form has been submitted successfully';
            end else begin
                status := 'danger*An error occured while submitting specification form';
            end

        end else begin
            status := 'danger*Document not found';
        end
    end;

    procedure FnAddSetterQuestionLine2(appNo: Code[50]; lineNo: Integer; reference: Text; knc: Integer; ana: Integer; enc: Integer; reference2: Text; topic1: Code[50]; topic2: Code[50]; questionNo: Integer; topic3: Code[50]; topic4: Code[50]; topic5: Code[50]; reference3: Text; reference4: Text; reference5: Text) status: Text
    var
        SetterHeader: Record "Setter Header";
        ExaminationReviewLines: Record "Examination Review Lines";
    begin
        // SetterHeader.RESET;
        // SetterHeader.SETRANGE("Document No.",appNo);
        // IF SetterHeader.FINDSET THEN BEGIN
        ExaminationReviewLines.Reset;
        ExaminationReviewLines.SetRange("Document No.", appNo);
        ExaminationReviewLines.SetRange("Line No.", lineNo);
        ExaminationReviewLines.SetRange("Question No.", questionNo);
        if ExaminationReviewLines.FindSet then begin
            //  ExaminationReviewLines.INIT;
            //  ExaminationReviewLines."Document No." := appNo; FnAddSetterQuestionLine2
            //  ExaminationReviewLines."Topic Code" := topic;
            //  ExaminationReviewLines.VALIDATE("Topic Code");
            //  ExaminationReviewLines."Setter Code" := SetterHeader."Examiner Code";
            //  ExaminationReviewLines.VALIDATE("Setter Code");
            //  ExaminationReviewLines."Line No." := lineNo;
            ExaminationReviewLines."Topic Code" := topic1;
            ExaminationReviewLines.Validate("Topic Code");
            ExaminationReviewLines."Topic 2 Code" := topic2;
            ExaminationReviewLines.Validate("Topic 2 Code");
            ExaminationReviewLines."Topic 3 Code" := topic3;
            ExaminationReviewLines.Validate("Topic 3 Code");
            ExaminationReviewLines."Topic 4 Code" := topic4;
            ExaminationReviewLines.Validate("Topic 4 Code");
            ExaminationReviewLines."Topic 5 Code" := topic5;
            ExaminationReviewLines.Validate("Topic 5 Code");
            ExaminationReviewLines.References := reference;
            ExaminationReviewLines."Knowledge and Comprehension" := knc;
            ExaminationReviewLines."Application and Analysis" := ana;
            ExaminationReviewLines."Evaluation and Creativity" := enc;
            ExaminationReviewLines."Topic 2 References" := reference2;
            ExaminationReviewLines."Topic 3 References" := reference3;
            ExaminationReviewLines."Topic 4 References" := reference4;
            ExaminationReviewLines."Topic 5 References" := reference5;
            if ExaminationReviewLines.Modify(true) then begin
                status := 'success*Question details have been added successfully';
            end else begin
                status := 'danger*An error occured while adding question details';
            end
        end else begin
            status := 'danger*Question could not be found';
        end

        // END ELSE BEGIN
        //  status := 'danger*Setter Specification header not found.';
        // END
    end;

    procedure GenerateSetterClaimForm2(reqNo: Code[50]) status: Text
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", reqNo);
        if SetterHeader.FindSet then begin
            if FILE.Exists(FILESPATH2 + reqNo + '.pdf') then begin
                FILE.Erase(FILESPATH2 + reqNo + '.pdf');
                Report.SaveAsPdf(85402, FILESPATH2 + reqNo + '.pdf', SetterHeader);
                status := 'success*Generated*Downloads\SetterClaimForm\' + reqNo + '.pdf';
            end else begin
                Report.SaveAsPdf(85402, FILESPATH2 + reqNo + '.pdf', SetterHeader);
                status := 'success*Generated*Downloads\SetterClaimForm\' + reqNo + '.pdf';
            end
        end else begin
            status := 'danger*Document not found';
        end
    end;

    procedure addSpecificationTablerSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record Payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Brian Orina****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            SetterHeader.Reset;
            SetterHeader.SetRange("Document No.", staffclaimnumber);
            if SetterHeader.FindSet then
                RecordIDNumber := SetterHeader.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure FnaddSetterSpecificationHeader2(specForm: Code[50]; courseId: Code[50]) status: Text
    var
        SetterHeader: Record "Setter Header";
        SetterTaskAllocation: Record "Setter Task Allocation";
    begin
        SetterTaskAllocation.Reset;
        SetterTaskAllocation.SetRange("Document No", specForm);
        SetterTaskAllocation.SetRange("Paper ID", courseId);
        if SetterTaskAllocation.FindSet then begin
            SetterHeader.Init;
            SetterHeader."Document Type" := SetterHeader."document type"::"Setter Specification";
            SetterHeader."Examiner Code" := SetterTaskAllocation."Resource No";
            SetterHeader.Validate("Examiner Code");
            SetterHeader."Examination Sitting" := SetterTaskAllocation."Examination Sitting";
            SetterHeader.Examination := SetterTaskAllocation.Course;
            SetterHeader.Level := SetterTaskAllocation.Level;
            SetterHeader."Paper Code" := SetterTaskAllocation."Paper ID";
            SetterHeader.Validate("Paper Code");
            if SetterHeader.Insert(true) then begin
                if SetterHeader."MCQ's" = true then begin
                    SettingandModeration.SuggestMCQNoOfQuestions(SetterHeader);
                end;

                if SetterHeader."MCQ's" = false then begin
                    SettingandModeration.SuggestNoOfQuestions(SetterHeader);
                end;
                //      end else begin
                //        settingandmoderation.suggestnoofquestions(setterheader);
                //        end
                //        SettingandModeration.SuggestNoOfQuestions(SetterHeader);
                status := 'success*Setter specification crested succesfully*' + SetterHeader."Document No." + '*' + Format(SetterHeader."MCQ's");
            end else begin
                status := 'danger*Error occured while creating your setter specification';
            end
        end else begin
            status := 'danger* The selected setting plan could not be found';
        end
    end;

    procedure postSpecificationForm(appNo: Code[50]; paperId: Code[50]; resourceNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        SetterTaskAllocation: Record "Setter Task Allocation";
        //objMail: Codeunit "SMTP Mail";
        Resource: Record Resource;
        body: Text;
        SettersPortalUsers: Record SettersPortalUsers;
    begin
        SetterTaskAllocation.Reset;
        SetterTaskAllocation.SetRange("Document No", appNo);
        SetterTaskAllocation.SetRange("Resource No", resourceNo);
        SetterTaskAllocation.SetRange("Paper ID", paperId);
        if SetterTaskAllocation.FindSet then begin
            SetterTaskAllocation."Submitted Setter ToS" := true;
            SetterTaskAllocation."Setter Table of Specification" := requisitionNo;
            SetterTaskAllocation."Tos Submitted At" := CurrentDatetime;
            if SetterTaskAllocation.Modify(true) then begin
                body := 'You have successfully submitted table of specification for: ' + Format(SetterTaskAllocation."Paper Name");
                SettersPortalUsers.Reset;
                SettersPortalUsers.SetRange("Authentication Email", resourceNo);
                if Resource.FindSet then begin
                    // SMTPMailSetup.Get();
                    // objMail.CreateMessage(SMTPMailSetup."Email Sender Name",SMTPMailSetup."Email Sender Address", SettersPortalUsers."Authentication Email", 'Confirmation of Table Of Specification', body, true);
                    // objMail.Send();
                    SendEmailNotification(SettersPortalUsers."Authentication Email", 'Confirmation of Table Of Specification', body);
                end;
                status := 'success*You have submitted your specification form successfully';
            end else begin
                status := 'danger*An error occured while submitting your table of specification. Kindly try again.';
            end
        end else begin
            status := 'danger*You cannot submit specification form that was not allocated to you.';
        end
    end;

    procedure FnSuggestSubmittedSubmittedPapers(reqNo: Code[50]) status: Text
    begin
        SetterHeader.Reset;
        SetterHeader.SetRange("Document No.", reqNo);
        if SetterHeader.FindSet then begin
            SettingandModeration.SuggestSetterPaperInfo(SetterHeader);
            status := 'success*The operation was success';
        end else begin
            status := 'danger*Disclosure form could not be found';
        end
    end;

    procedure FnexaminationInsertionVoucher(regNo: Code[50]; marker: Code[50]; examCenter: Code[50]; paper: Code[50]; examSitting: Code[50]; envelope: Code[50]; q1: Integer; q2: Integer; q3: Integer; q4: Integer; q5: Integer; q6: Integer; q7: Integer; q8: Integer; q9: Integer; q10: Integer) status: Text
    begin
        MarksheetDetailedLines.Reset;
        MarksheetDetailedLines.SetRange("Student Reg No.", regNo);
        MarksheetDetailedLines.SetRange("Envelope Serial No.", envelope);
        MarksheetDetailedLines.SetRange("Marker No", marker);
        //MarksheetDetailedLines.SETRANGE(Submitted, FALSE);
        if MarksheetDetailedLines.FindSet then begin
            status := 'danger*You have already inserted marks for registration number ' + regNo;
        end else begin
            MarksheetDetailedLines.Init;
            ExaminationSetup.Get;
            MarksheetDetailedLines."Document No." := ExaminationSetup."Active Examination Marksheet";
            MarksheetDetailedLines."Student Reg No." := regNo;
            MarksheetDetailedLines.Validate("Student Reg No.");
            //  MarksheetDetailedLines.Mark := mark;
            //  MarksheetDetailedLines.Grade := grade;
            MarksheetDetailedLines."Question 1" := q1;
            MarksheetDetailedLines."Question 2" := q2;
            MarksheetDetailedLines."Question 3" := q3;
            MarksheetDetailedLines."Question 4" := q4;
            MarksheetDetailedLines."Question 5" := q5;
            MarksheetDetailedLines."Question 6" := q6;
            MarksheetDetailedLines."Question 7" := q7;
            MarksheetDetailedLines."Question 8" := q8;
            MarksheetDetailedLines."Question 9" := q9;
            MarksheetDetailedLines."Question 10" := q10;
            MarksheetDetailedLines."Total Marks" := q1 + q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10;
            MarksheetDetailedLines."Marker No" := marker;
            MarksheetDetailedLines.Validate("Marker No");
            MarksheetDetailedLines."Examination Center" := examCenter;
            MarksheetDetailedLines.Validate("Examination Center");
            MarksheetDetailedLines.Paper := paper;
            MarksheetDetailedLines.Validate(Paper);
            MarksheetDetailedLines."Examination Sitting ID" := examSitting;
            MarksheetDetailedLines.Validate("Examination Sitting ID");
            MarksheetDetailedLines."Envelope Serial No." := envelope;
            //MarksheetDetailedLines.Submitted := TRUE;
            if MarksheetDetailedLines.Insert(true) then begin
                status := 'success*You have successfully inserted marks for ' + regNo;
            end else begin
                status := 'danger* An erroroccured while submitting marks for ' + regNo;
            end
        end
    end;

    procedure FnEditStudentMark(regNo: Code[50]; envelope: Code[50]; markerNo: Code[50]; q1: Integer; q2: Integer; q3: Integer; q4: Integer; q5: Integer; q6: Integer; q7: Integer; q8: Integer; q9: Integer; q10: Integer) status: Text
    begin
        MarksheetDetailedLines.Reset;
        MarksheetDetailedLines.SetRange("Student Reg No.", regNo);
        MarksheetDetailedLines.SetRange("Envelope Serial No.", envelope);
        MarksheetDetailedLines.SetRange("Marker No", markerNo);
        //MarksheetDetailedLines.SETRANGE(Submitted, FALSE);
        if MarksheetDetailedLines.FindSet then begin
            //  MarksheetDetailedLines.Mark := mark;
            //  MarksheetDetailedLines.Grade := grade;
            MarksheetDetailedLines."Question 1" := q1;
            MarksheetDetailedLines."Question 2" := q2;
            MarksheetDetailedLines."Question 3" := q3;
            MarksheetDetailedLines."Question 4" := q4;
            MarksheetDetailedLines."Question 5" := q5;
            MarksheetDetailedLines."Question 6" := q6;
            MarksheetDetailedLines."Question 7" := q7;
            MarksheetDetailedLines."Question 8" := q8;
            MarksheetDetailedLines."Question 9" := q9;
            MarksheetDetailedLines."Question 10" := q10;
            MarksheetDetailedLines."Total Marks" := q1 + q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10;
            if MarksheetDetailedLines.Modify(true) then begin
                status := 'success*Student marks for ' + regNo + 'has been edited successfully';
            end else begin
                status := 'danger* An error occured while editing ';
            end
        end else begin
            status := 'danger * Student record cannot be found';
        end
    end;

    procedure FnDeleteStudentMarks(regNo: Code[50]; envelope: Code[50]; markerNo: Code[50]) status: Text
    begin
        MarksheetDetailedLines.Reset;
        MarksheetDetailedLines.SetRange("Student Reg No.", regNo);
        MarksheetDetailedLines.SetRange("Envelope Serial No.", envelope);
        MarksheetDetailedLines.SetRange("Marker No", markerNo);
        if MarksheetDetailedLines.FindSet then begin
            if MarksheetDetailedLines.Delete then begin
                status := 'success*Student marks for ' + regNo + 'has been deleted successfully';
            end else begin
                status := 'danger* An error occured while deleting ';
            end
        end else begin
            status := 'danger * Student record cannot be found';
        end
    end;

    procedure FnsubmitMarksheet(marker: Code[50]; envelopeNumber: Code[50]) status: Text
    var
        "count": Integer;
    begin
        MarksheetDetailedLines.Reset;
        MarksheetDetailedLines.SetRange("Marker No", marker);
        MarksheetDetailedLines.SetRange("Envelope Serial No.", envelopeNumber);
        if MarksheetDetailedLines.FindSet then begin
            repeat
                MarksheetDetailedLines.Submitted := true;
                MarksheetDetailedLines.Modify(true);
            until MarksheetDetailedLines.Next = 0;
            status := 'success* You have successfully submitted marksheet for envelope ' + envelopeNumber + '(' + Format(MarksheetDetailedLines.Count) + ' students)';
            DispScriptEnvelopeSerials.Reset;
            DispScriptEnvelopeSerials.SetRange("Envelope Serial No.", envelopeNumber);
            if DispScriptEnvelopeSerials.FindSet then begin
                DispScriptEnvelopeSerials.Submitted := true;
                DispScriptEnvelopeSerials.Modify(true);
            end
        end else begin
            status := 'danger * You cannot submit 0 papers';
        end
    end;

    procedure FnexaminationCheckerVoucher(regNo: Code[50]; checker: Code[50]; examCenter: Code[50]; paper: Code[50]; examSitting: Code[50]; envelope: Code[50]; q1: Integer) status: Text
    begin
        MarksheetDetailedLines.Reset;
        MarksheetDetailedLines.SetRange("Student Reg No.", regNo);
        MarksheetDetailedLines.SetRange("Envelope Serial No.", envelope);
        MarksheetDetailedLines.SetRange("Checker No", checker);
        //MarksheetDetailedLines.SETRANGE(Submitted, FALSE);
        if MarksheetDetailedLines.FindSet then begin
            status := 'danger*You have already inserted marks for registration number ' + regNo;
        end else begin
            MarksheetDetailedLines.Init;
            ExaminationSetup.Get;
            MarksheetDetailedLines."Document No." := ExaminationSetup."Active Examination Marksheet";
            MarksheetDetailedLines."Student Reg No." := regNo;
            MarksheetDetailedLines.Validate("Student Reg No.");
            //  MarksheetDetailedLines.Mark := mark;
            //  MarksheetDetailedLines.Grade := grade;
            MarksheetDetailedLines."Actual Marks" := q1;
            MarksheetDetailedLines."Checker No" := checker;
            MarksheetDetailedLines.Validate("Marker No");
            //MarksheetDetailedLines.Submitted := TRUE;
            if MarksheetDetailedLines.Insert(true) then begin
                status := 'success*You have successfully inserted marks for ' + regNo;
            end else begin
                status := 'danger* An erroroccured while submitting marks for ' + regNo;
            end
        end
    end;

    procedure FnEditCheckerMarks(regNo: Code[50]; envelope: Code[50]; markerNo: Code[50]; q1: Integer) status: Text
    begin
        MarksheetDetailedLines.Reset;
        MarksheetDetailedLines.SetRange("Student Reg No.", regNo);
        MarksheetDetailedLines.SetRange("Envelope Serial No.", envelope);
        MarksheetDetailedLines.SetRange("Marker No", markerNo);
        //MarksheetDetailedLines.SETRANGE(Submitted, FALSE);
        if MarksheetDetailedLines.FindSet then begin
            //  MarksheetDetailedLines.Mark := mark;
            //  MarksheetDetailedLines.Grade := grade;
            MarksheetDetailedLines."Actual Marks" := q1;
            if MarksheetDetailedLines.Modify(true) then begin
                status := 'success*Student marks for ' + regNo + 'has been edited successfully';
            end else begin
                status := 'danger* An error occured while editing ';
            end
        end else begin
            status := 'danger * Student record cannot be found';
        end
    end;

    procedure FndeleteCheckerMark(regNo: Code[50]; envelope: Code[50]; markerNo: Code[50]) status: Text
    begin
        MarksheetDetailedLines.Reset;
        MarksheetDetailedLines.SetRange("Student Reg No.", regNo);
        MarksheetDetailedLines.SetRange("Envelope Serial No.", envelope);
        MarksheetDetailedLines.SetRange("Marker No", markerNo);
        if MarksheetDetailedLines.FindSet then begin
            MarksheetDetailedLines."Actual Marks" := 0;
            if MarksheetDetailedLines.Modify(true) then begin
                status := 'success*Student marks for ' + regNo + 'has been deleted successfully';
            end else begin
                status := 'danger* An error occured while deleting ';
            end
        end else begin
            status := 'danger * Student record cannot be found';
        end
    end;

    procedure FnInsertMarkerDiscosure(markerNo: Code[50]; institutionCode: Code[50]) status: Text
    var
        MarkerConflictofInterest: Record "Marker Conflict of Interest";
        Resource: Record Resource;
        ExaminationSetup: Record "Examination Setup";
        currSitting: Text;
    begin
        ExaminationSetup.Get;
        currSitting := ExaminationSetup."Default Examination Sitting";
        MarkerConflictofInterest.Reset;
        MarkerConflictofInterest.SetRange("Marker No", markerNo);
        MarkerConflictofInterest.SetRange("Center Code", institutionCode);
        MarkerConflictofInterest.SetRange("Sitting Cycle", currSitting);
        if MarkerConflictofInterest.FindSet then begin
            status := 'danger* You have already submitted a disclosure form for' + MarkerConflictofInterest."Center Name";
        end else begin
            MarkerConflictofInterest.Init;
            MarkerConflictofInterest."Marker No" := markerNo;
            //MarkerConflictofInterest.VALIDATE("Marker No");
            Resource.Reset;
            Resource.SetRange("No.", markerNo);
            if Resource.FindSet then begin
                MarkerConflictofInterest."Marker Name" := Resource.Name;
            end;
            MarkerConflictofInterest."Center Code" := institutionCode;
            MarkerConflictofInterest.Validate("Center Code");
            MarkerConflictofInterest."Date Declared" := Today;
            MarkerConflictofInterest."Sitting Cycle" := currSitting;
            MarkerConflictofInterest."Document Status" := MarkerConflictofInterest."document status"::Draft;
            if MarkerConflictofInterest.Insert(true) then begin
                status := 'success* Disclosure Form added successfully*' + MarkerConflictofInterest."Document No.";
            end else begin
                status := 'danger* An error occured while submitting diclosure form';
            end
        end;
    end;

    procedure CreateConfirmationInstitution(fullName: Text; emailAddress: Text; institutionName: Text; phoneNumber: Text; idNo: Text) Status: Text
    var
        ConfirmationPortalUsers: Record ConfirmationPortalUsers;
        RandomDigit: Text;
    begin
        ConfirmationPortalUsers.Reset;
        ConfirmationPortalUsers.SetRange("Authentication Email", emailAddress);
        if ConfirmationPortalUsers.FindSet then begin
            Status := 'danger* Email address is alredy registered as a institution in the system';
        end else begin
            RandomDigit := CreateGuid;
            RandomDigit := DelChr(RandomDigit, '=', '{}-01');
            RandomDigit := CopyStr(RandomDigit, 1, 8);
            ConfirmationPortalUsers.Init;
            ConfirmationPortalUsers."Full Name" := fullName;
            ConfirmationPortalUsers."Authentication Email" := emailAddress;
            ConfirmationPortalUsers."University Name" := institutionName;
            ConfirmationPortalUsers."Mobile Phone No." := phoneNumber;
            ConfirmationPortalUsers."Password Value" := RandomDigit;
            ConfirmationPortalUsers."Last Modified Date" := Today;
            //ConfirmationPortalUsers."Phone Number" := idNo;
            if ConfirmationPortalUsers.Insert(true) then begin
                SendInstitutionalConfrimationEmail(ConfirmationPortalUsers);
                Status := 'success* Institution has been created successfully. Kindly check your email to find the login credentials';
            end else begin
                Status := 'danger*An error occured';
            end
        end
    end;

    local procedure SendInstitutionalConfrimationEmail(ConfirmationPortalUsers: Record ConfirmationPortalUsers)
    var
        Email2: Text;
        Body: Text;
    begin

        // SMTPMailSetup.Get;
        // Email2:= SMTPMailSetup."Email Sender Address";
        // Body:='INSTITUTIONAL CONFIRMATION ACCOUNT CREATION';
        // SMTP.CreateMessage('Institution Confirmation Application', Email2 ,  ConfirmationPortalUsers."Authentication Email",
        // 'Institutional Confirmation APPLICATION',
        // 'Dear '+ConfirmationPortalUsers."Full Name"+',<BR><BR>'+
        // 'We are pleased to inform you that your request for account creation has been received successfully.</b><BR> <BR>The credentials are:'
        // +'<BR>'
        // +'Username:'+' <b>'+ConfirmationPortalUsers."Authentication Email"+'</b><BR>Password:'+' <b>'+ConfirmationPortalUsers."Password Value"+'</b>'
        // ,true);

        // SMTP.AppendBody('<BR><BR>Kind Regards,'+'<BR><BR>Examinations <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
        // SMTP.Send();

        Body := 'Dear ' + ConfirmationPortalUsers."Full Name" + ',<BR><BR>' +
        'We are pleased to inform you that your request for account creation has been received successfully.</b><BR> <BR>The credentials are:'
        + '<BR>'
        + 'Username:' + ' <b>' + ConfirmationPortalUsers."Authentication Email" + '</b><BR>Password:' + ' <b>' + ConfirmationPortalUsers."Password Value" + '</b>';
        SendEmailNotification(ConfirmationPortalUsers."Authentication Email", 'Institutional Confirmation APPLICATION', Body);
    end;

    procedure FnChangeStudentPassword(emailaddress: Text; currentPassword: Text; newPassword: Text; confirmNewPassword: Text) status: Text
    var
        DynasoftPortalUser: Record ConfirmationPortalUsers;
    begin

        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
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

    procedure FnCreateInstitutionalConfirmation(modeOfDispatch: Option; requester: Text; requesterEmail: Text) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
    begin
        StudentProcessingHeader.Init;
        StudentProcessingHeader."Document Type" := StudentProcessingHeader."document type"::"Institution Confirmation";
        StudentProcessingHeader."Requested By Name" := requester;
        StudentProcessingHeader."Requested By E-Mail" := requesterEmail;
        StudentProcessingHeader."Mode of Dispatch" := modeOfDispatch;

        if StudentProcessingHeader.Insert(true) then begin
            status := 'success*Institutional Confirmation created successfully*' + StudentProcessingHeader."No.";
        end else begin
            status := 'danger*The operation was unsuccessfull. Kindly Contact System Administrator';
        end
    end;

    procedure FnCreateInstitutionalConfirmationLines(headerNo: Code[50]; registrationNo: Code[10]; course: Code[50]) status: Text
    var
        StudentProcessingLines: Record "Student Processing Lines";
    begin
        StudentProcessingLines.Init;
        StudentProcessingLines."Booking Header No." := headerNo;
        StudentProcessingLines."Registration No." := registrationNo;
        StudentProcessingLines."Course Id" := course;
        StudentProcessingLines."Document Type" := StudentProcessingLines."document type"::"Institution Confirmation";

        if StudentProcessingLines.Insert(true) then begin
            status := 'success*Student Confirmation added successfully';
        end else begin
            status := 'danger*The operation was unsuccessfull. Kindly Contact System Administrator';
        end
    end;

    procedure FnDeleteInstitutionalConfirmationLine(headerNo: Code[50]; lineNo: Integer) status: Text
    var
        StudentProcessingLines: Record "Student Processing Lines";
    begin
        StudentProcessingLines.Reset;
        StudentProcessingLines.SetRange("Booking Header No.", headerNo);
        StudentProcessingLines.SetRange("Line No.", lineNo);
        if StudentProcessingLines.FindSet then begin
            if StudentProcessingLines.Delete(true) then begin
                status := 'success*Student Confirmation was deleted successfully';
            end else begin
                status := 'danger*An error occured while processing the request.';
            end
        end else begin
            status := 'danger*The entry you are trying to deleted could not be found.';
        end
    end;

    procedure FnPrintInstitutionalConfirmationProforma(refNo: Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange("No.", refNo);
        if StudentProcessingHeader.FindSet then begin
            if FILE.Exists(FILESPATH012 + refNo + '.pdf') then begin
                FILE.Erase(FILESPATH012 + refNo + '.pdf');
                Report.SaveAsPdf(85212, FILESPATH012 + refNo + '.pdf', StudentProcessingHeader);
                status := 'success*Generated*Downloads\ConfirmationInvoices\' + refNo + '.pdf';
            end else begin
                Report.SaveAsPdf(85212, FILESPATH012 + refNo + '.pdf', StudentProcessingHeader);
                status := 'success*Generated*Downloads\ConfirmationInvoices\' + refNo + '.pdf';
            end
        end else begin
            status := 'danger*Document not found';
        end
    end;

    procedure FnPrintInstitutionalConfirmationLetter(refNo: Code[50]) status: Text
    var
        StudentProcessingHeader: Record "Student Processing Header";
    begin
        StudentProcessingHeader.Reset;
        StudentProcessingHeader.SetRange("No.", refNo);
        if StudentProcessingHeader.FindSet then begin
            if FILE.Exists(FILESPATH013 + refNo + '.pdf') then begin
                FILE.Erase(FILESPATH013 + refNo + '.pdf');
                Report.SaveAsPdf(85210, FILESPATH013 + refNo + '.pdf', StudentProcessingHeader);
                status := 'success*Generated*Downloads\ConfirmationLetters\' + refNo + '.pdf';
            end else begin
                Report.SaveAsPdf(85210, FILESPATH013 + refNo + '.pdf', StudentProcessingHeader);
                status := 'success*Generated*Downloads\ConfirmationLetters\' + refNo + '.pdf';
            end
        end else begin
            status := 'danger*Document not found';
        end
    end;

    procedure FnCreateCertificateCollectionVoucher(studNo: Code[100]; modeOfDispatch: Option; dateOfDispatch: Date) status: Text
    begin
        StudentProcessingHeader.Init;
        StudentProcessingHeader."Document Type" := StudentProcessingHeader."document type"::Collection;
        StudentProcessingHeader."Mode of Dispatch" := modeOfDispatch;
        StudentProcessingHeader."Date of Postage" := dateOfDispatch;
        StudentProcessingHeader."Student No." := studNo;
        StudentProcessingHeader.Validate("Student No.");
        if StudentProcessingHeader.Insert(true) then begin
            status := 'success*Certificate collection application was successful.*' + StudentProcessingHeader."No.";
        end else begin
            status := 'danger*An error occured while creating certificate collection request. Please Contact Administrator';
        end
    end;

    procedure FnInsertCertificateCollectionEntry(regNo: Code[100]; docNo: Code[100]) status: Text
    var
        CertificateCollectionEntry: Record "Certificate Collection Entry";
    begin
        CertificateCollectionEntry.Init;
        CertificateCollectionEntry."Document No" := docNo;
        CertificateCollectionEntry."Student Reg No." := regNo;
        if CertificateCollectionEntry.Insert(true) then begin
            status := 'success*Registration was added successful.';
        end else begin
            status := 'danger*An error occured while creating the request. Please Contact Administrator';
        end
    end;

    procedure FnInsertConfirmationlines(appNo: Code[100]; regNo: Code[100]; studNo: Code[100]) status: Text
    begin
        StudentProcessingLines.Init;
        StudentProcessingLines."Booking Header No." := appNo;
        StudentProcessingLines."Document Type" := StudentProcessingLines."document type"::Confirmation;
        StudentProcessingLines."Student No." := studNo;
        StudentProcessingLines."Registration No." := regNo;
        StudentProcessingLines.Validate("Registration No.");
        //StudentProcessingLines.INSERT();
        if StudentProcessingLines.Insert(true) then begin
            status := 'success*Regitration Added successfully.';
        end else begin
            status := 'danger*An error occured while creating confirmation creation request. Please Contact Administrator';
        end
    end;

    procedure AddInstitutionalConfirmationSharepointLinks(applicationNo: Code[50]; filename: Text; sharepointlink: Text) status: Text
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
            studentProcessingHeader.SetRange("Document Type", studentProcessingHeader."document type"::Confirmation);
            if studentProcessingHeader.FindSet then
                RecordIDNumber := studentProcessingHeader.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*The document was successfully attached';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure AddMarkerDeclarationSharepointLinks(applicationNo: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        studentProcessingHeader: Record "Student Processing Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
        MarkerConflictofInterest: Record "Marker Conflict of Interest";
        ExaminationSetup: Record "Examination Setup";
        currSitting: Text;
    begin
        // Create Document Link to Sharepoint **************************
        // ExaminationSetup.GET;
        // currSitting := ExaminationSetup."Default Examination Sitting";
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            MarkerConflictofInterest.Reset;
            MarkerConflictofInterest.SetRange("Document No.", applicationNo);
            //MarkerConflictofInterest.SETRANGE("Document Type",studentProcessingHeader."Document Type);
            if MarkerConflictofInterest.FindSet then
                RecordIDNumber := MarkerConflictofInterest.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*The document was successfully attached';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure FnSubmitDisclosureForm(appNo: Code[100]) status: Text
    var
        MarkerConflictofInterest: Record "Marker Conflict of Interest";
        ExaminationSetup: Record "Examination Setup";
        currSitting: Text;
    begin
        ExaminationSetup.Get;
        currSitting := ExaminationSetup."Default Examination Sitting";
        MarkerConflictofInterest.Reset;
        MarkerConflictofInterest.SetRange("Document No.", appNo);
        if MarkerConflictofInterest.FindSet then begin
            MarkerConflictofInterest."Document Status" := MarkerConflictofInterest."document status"::Submitted;
            if MarkerConflictofInterest.Modify(true) then begin
                status := 'success*Your declaration form has been submitted successfully';
            end else begin
                status := 'error*An error occured during while submitting your declaration';
            end;
        end else begin
            status := 'error*Your application could not be found. Kind contact system administrator';
        end
    end;

    procedure FnCreateScriptDispatchHeader(markerNo: Code[100]; courseid: Code[100]; examination: Code[100]) status: Text
    var
        ScriptsDispatchHeader: Record "Scripts Dispatch Header";
        ExaminationSetup: Record "Examination Setup";
        currSitting: Text;
        MarkerTaskAllocation: Record "Marker Task Allocation";
    begin
        ExaminationSetup.Get;
        currSitting := ExaminationSetup."Default Examination Sitting";
        ScriptsDispatchHeader.Init;
        ScriptsDispatchHeader."Document Type" := ScriptsDispatchHeader."document type"::"Team Leader Sampling Voucher";
        ScriptsDispatchHeader."Sitting Cycle" := currSitting;
        ScriptsDispatchHeader."Marker No" := markerNo;
        MarkerTaskAllocation.Reset;
        MarkerTaskAllocation.SetRange("Resource No", markerNo);
        if MarkerTaskAllocation.FindSet then begin
            ScriptsDispatchHeader."Marker Name" := MarkerTaskAllocation.Name;
        end;
        ScriptsDispatchHeader.Examination := examination;
        ScriptsDispatchHeader.Validate(Examination);
        ScriptsDispatchHeader."Paper Code" := courseid;
        ScriptsDispatchHeader.Validate("Paper Code");
        if ScriptsDispatchHeader.Insert(true) then begin
            status := 'success*TheScript sampling header was inserted successfully*' + ScriptsDispatchHeader."Document No.";
        end else begin
            status := 'error*An error occured while creating script sampling header. Kindly contact system administrator.';
        end;
    end;

    procedure FnCreateScriptdispatchLines(appNo: Code[100]; centerCode: Code[100]; markerNo: Code[100]; markerScore: Integer; teamLeaderScore: Integer; scriptNo: Integer; varianceCause: Text) status: Text
    var
        ScriptsSamplingLines: Record "Scripts Sampling Lines";
        MarkerTaskAllocation: Record "Marker Task Allocation";
    begin
        ScriptsSamplingLines.Init;
        ScriptsSamplingLines."Document No." := appNo;
        ScriptsSamplingLines."Center Code" := centerCode;
        ScriptsSamplingLines.Validate("Center Code");
        ScriptsSamplingLines."Marker No" := markerNo;
        //ScriptsSamplingLines.VALIDATE("Marker No");
        MarkerTaskAllocation.Reset;
        MarkerTaskAllocation.SetRange("Resource No", markerNo);
        if MarkerTaskAllocation.FindSet then begin
            ScriptsSamplingLines."Marker Name" := MarkerTaskAllocation.Name;
        end;
        ScriptsSamplingLines."Marker Score" := markerScore;
        ScriptsSamplingLines."Team Leader Score" := teamLeaderScore;
        ScriptsSamplingLines.Validate("Team Leader Score");
        ScriptsSamplingLines."Sample Script No" := scriptNo;
        ScriptsSamplingLines."Cause of Variance" := varianceCause;
        if ScriptsSamplingLines.Insert(true) then begin
            status := 'success*Script Sampling entry added successfully';
            ;
        end else begin
            status := 'error*An error occured while adding script sampling enytry. Kindly contact system administrator.';
        end;
    end;

    procedure FnDeleteScriptDispatchLines(appNo: Code[100]; lineNo: Integer) status: Text
    var
        ScriptsSamplingLines: Record "Scripts Sampling Lines";
    begin
        ScriptsSamplingLines.Reset;
        ScriptsSamplingLines.SetRange("Document No.", appNo);
        ScriptsSamplingLines.SetRange("Line No.", lineNo);
        if ScriptsSamplingLines.FindSet then begin
            if ScriptsSamplingLines.Delete(true) then begin
                status := 'success*Script Sampling entry deleted successfully';
                ;
            end else begin
                status := 'error*An error occured while deleting script sampling enytry. Kindly contact system administrator.';
            end;
        end else begin
        end
    end;

    procedure FnCreateCheckerComparisonWorkTicketHeader(markerNo: Code[100]) status: Text
    var
        ScriptsDispatchHeader: Record "Scripts Dispatch Header";
        ExaminationSetup: Record "Examination Setup";
        currSitting: Text;
        MarkerTaskAllocation: Record "Marker Task Allocation";
    begin
        ExaminationSetup.Get;
        currSitting := ExaminationSetup."Default Examination Sitting";
        ScriptsDispatchHeader.Init;
        ScriptsDispatchHeader."Document Type" := ScriptsDispatchHeader."document type"::"Checker Work Ticket";
        ScriptsDispatchHeader."Checker Action Type" := ScriptsDispatchHeader."checker action type"::Comparison;
        ScriptsDispatchHeader."Project No." := currSitting;
        ScriptsDispatchHeader.Validate("Project No.");
        ScriptsDispatchHeader."Sitting Cycle" := currSitting;
        ScriptsDispatchHeader."Checker No" := markerNo;
        MarkerTaskAllocation.Reset;
        MarkerTaskAllocation.SetRange("Resource No", markerNo);
        if MarkerTaskAllocation.FindSet then begin
            ScriptsDispatchHeader."Checker Name" := MarkerTaskAllocation.Name;
        end;
        if ScriptsDispatchHeader.Insert(true) then begin
            status := 'success*The Checker Work Ticket was inserted successfully*' + ScriptsDispatchHeader."Document No.";
        end else begin
            status := 'error*An error occured while creating Checker Work Ticket. Kindly contact system administrator.';
        end;
    end;

    procedure FnCreateCheckerWorkTicketHeader(markerNo: Code[100]) status: Text
    var
        ScriptsDispatchHeader: Record "Scripts Dispatch Header";
        ExaminationSetup: Record "Examination Setup";
        currSitting: Text;
        MarkerTaskAllocation: Record "Marker Task Allocation";
    begin
        ExaminationSetup.Get;
        currSitting := ExaminationSetup."Default Examination Sitting";
        ScriptsDispatchHeader.Init;
        ScriptsDispatchHeader."Document Type" := ScriptsDispatchHeader."document type"::"Checker Work Ticket";
        ScriptsDispatchHeader."Checker Action Type" := ScriptsDispatchHeader."checker action type"::Checking;
        ScriptsDispatchHeader."Sitting Cycle" := currSitting;
        ScriptsDispatchHeader."Project No." := currSitting;
        ScriptsDispatchHeader.Validate("Project No.");
        ScriptsDispatchHeader."Checker No" := markerNo;
        MarkerTaskAllocation.Reset;
        MarkerTaskAllocation.SetRange("Resource No", markerNo);
        if MarkerTaskAllocation.FindSet then begin
            ScriptsDispatchHeader."Checker Name" := MarkerTaskAllocation.Name;
        end;

        if ScriptsDispatchHeader.Insert(true) then begin
            status := 'success*The Checker Work Ticket was inserted successfully*' + ScriptsDispatchHeader."Document No.";
        end else begin
            status := 'error*An error occured while creating Checker Work Ticket. Kindly contact system administrator.';
        end;
    end;

    procedure FnCreateCheckerComparisonWorkTicketLines(appNo: Code[100]; exam: Code[100]; level: Code[100]; paper: Code[100]; examCenter: Code[100]; noBefore: Integer; noAfter: Integer) status: Text
    var
        ScriptsSamplingLines: Record "Scripts Sampling Lines";
        MarkerTaskAllocation: Record "Marker Task Allocation";
        CheckersTicketLines: Record "Checkers Ticket Lines";
        CheckersTicketLines2: Record "Checkers Ticket Lines";
    begin
        CheckersTicketLines.Init;
        CheckersTicketLines2.Reset;
        if CheckersTicketLines2.FindLast then
            CheckersTicketLines."Line No" := CheckersTicketLines2."Line No" + 1;
        CheckersTicketLines."Document No" := appNo;
        CheckersTicketLines."Document Type" := CheckersTicketLines."document type"::"Checker Work Ticket";
        CheckersTicketLines.Date := Today;
        //SCheckersTicketLines.VALIDATE(Date);
        CheckersTicketLines.Course := exam;
        CheckersTicketLines.Level := level;
        CheckersTicketLines."Paper ID" := paper;
        CheckersTicketLines.Validate("Paper ID");
        CheckersTicketLines."Center Code" := examCenter;
        CheckersTicketLines.Validate("Center Code");
        CheckersTicketLines."No. of Scripts Before" := noBefore;
        CheckersTicketLines."No. of Scripts After" := noAfter;
        if CheckersTicketLines.Insert(true) then begin
            status := 'success*Checker Comparison Work Ticket Entry added successfully';
        end else begin
            status := 'error*An error occured while adding Checker Comparison Work Ticket Entry . Kindly contact system administrator.';
        end;
    end;

    procedure FnCreateCheckerWorkTicketLines(appNo: Code[100]; exam: Code[100]; level: Code[100]; paper: Code[100]; examCenter: Code[100]; noBefore: Integer; noAfter: Integer) status: Text
    var
        ScriptsSamplingLines: Record "Scripts Sampling Lines";
        MarkerTaskAllocation: Record "Marker Task Allocation";
        CheckersTicketLines: Record "Checkers Ticket Lines";
    begin
        ScriptsSamplingLines.Init;
        CheckersTicketLines.Init;
        CheckersTicketLines."Document No" := appNo;
        CheckersTicketLines.Course := exam;
        CheckersTicketLines.Level := level;
        CheckersTicketLines."Paper ID" := paper;
        CheckersTicketLines.Validate("Paper ID");
        CheckersTicketLines."Center Code" := examCenter;
        CheckersTicketLines.Validate("Center Code");
        CheckersTicketLines."No. of Scripts Before" := noBefore;
        CheckersTicketLines."No. of Scripts After" := noAfter;
        if CheckersTicketLines.Insert(true) then begin
            status := 'success*Checker Work Ticket Entry added successfully';
            ;
        end else begin
            status := 'error*An error occured while adding Checker Work Ticket Entry . Kindly contact system administrator.';
        end;
    end;

    procedure FnDeleteCheckerComparisonWorkTicketLines(lineNo: Integer; appNo: Code[100]) status: Text
    var
        CheckersTicketLines: Record "Checkers Ticket Lines";
    begin
        CheckersTicketLines.Reset;
        CheckersTicketLines.SetRange("Line No", lineNo);
        CheckersTicketLines.SetRange("Document No", appNo);
        if CheckersTicketLines.FindSet then begin
            if CheckersTicketLines.Delete(true) then begin
                status := 'success*Checker Comparison Work Ticket Entry deleted successfully';
                ;
            end else begin
                status := 'error*An error occured while deleting Checker Comparison Work Ticket. Kindly contact system administrator.';
            end;
        end else begin
            status := 'error*Document could not be found. Kindly contact system administrator.';
        end
    end;

    procedure FnDeleteCheckerWorkTicketLines(lineNo: Integer; appNo: Code[100]) status: Text
    var
        CheckersTicketLines: Record "Checkers Ticket Lines";
    begin
        CheckersTicketLines.Reset;
        CheckersTicketLines.SetRange("Line No", lineNo);
        CheckersTicketLines.SetRange("Document No", appNo);
        if CheckersTicketLines.FindSet then begin
            if CheckersTicketLines.Delete(true) then begin
                status := 'success*Checker Comparison Work Ticket Entry deleted successfully';
                ;
            end else begin
                status := 'error*An error occured while deleting Checker Comparison Work Ticket. Kindly contact system administrator.';
            end;
        end else begin
            status := 'error*Document could not be found. Kindly contact system administrator.';
        end
    end;

    procedure FnEditCheckerWorkTicketLines(lineNo: Integer; appNo: Code[100]; afterNo: Integer) status: Text
    var
        CheckersTicketLines: Record "Checkers Ticket Lines";
    begin
        CheckersTicketLines.Reset;
        CheckersTicketLines.SetRange("Line No", lineNo);
        CheckersTicketLines.SetRange("Document No", appNo);
        if CheckersTicketLines.FindSet then begin
            CheckersTicketLines."No. of Scripts After" := afterNo;
            if CheckersTicketLines.Modify(true) then begin
                status := 'success*Checker  Work Ticket Entry edited successfully';
                ;
            end else begin
                status := 'error*An error occured while editing Checker Work Ticket. Kindly contact system administrator.';
            end;
        end else begin
            status := 'error*Document could not be found. Kindly contact system administrator.';
        end
    end;

    procedure AddTeamLeaderReportsSharepointLinks(applicationNo: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        studentProcessingHeader: Record "Student Processing Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
        MarkerConflictofInterest: Record "Marker Conflict of Interest";
        ExaminationSetup: Record "Examination Setup";
        currSitting: Text;
        ScriptsDispatchHeader: Record "Scripts Dispatch Header";
    begin
        // Create Document Link to Sharepoint **************************
        // ExaminationSetup.GET;
        // currSitting := ExaminationSetup."Default Examination Sitting";
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            ScriptsDispatchHeader.Reset;
            ScriptsDispatchHeader.SetRange("Document No.", applicationNo);
            //ScriptsDispatchHeader.SETRANGE("Document Type",ScriptsDispatchHeader."Document Type"::"Team Leader Reports");
            if ScriptsDispatchHeader.FindSet then
                RecordIDNumber := ScriptsDispatchHeader.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*The document was successfully attached';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure FnInsertTeamLeaderReportHeader(markerNo: Code[100]) status: Text
    var
        ScriptsDispatchHeader: Record "Scripts Dispatch Header";
        ExaminationSetup: Record "Examination Setup";
        currSitting: Text;
        MarkerTaskAllocation: Record "Marker Task Allocation";
    begin
        ExaminationSetup.Get;
        currSitting := ExaminationSetup."Default Examination Sitting";
        ScriptsDispatchHeader.Init;
        ScriptsDispatchHeader."Document Type" := ScriptsDispatchHeader."document type"::"Team Leader Reports";
        ScriptsDispatchHeader."Sitting Cycle" := currSitting;
        ScriptsDispatchHeader."Project No." := currSitting;
        ScriptsDispatchHeader.Validate("Project No.");
        ScriptsDispatchHeader."Marker No" := markerNo;
        MarkerTaskAllocation.Reset;
        MarkerTaskAllocation.SetRange("Resource No", markerNo);
        if MarkerTaskAllocation.FindSet then begin
            ScriptsDispatchHeader."Marker Name" := MarkerTaskAllocation.Name;
        end;

        if ScriptsDispatchHeader.Insert(true) then begin
            status := 'success*The Team Leader Report was inserted successfully*' + ScriptsDispatchHeader."Document No.";
        end else begin
            status := 'error*An error occured while creating Team Leader Report. Kindly contact system administrator.';
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
}
