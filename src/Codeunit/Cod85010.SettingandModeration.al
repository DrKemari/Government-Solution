#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 85010 "Setting and Moderation"
{

    trigger OnRun()
    begin
    end;


    procedure SuggestNoOfQuestions(SetterHeader: Record "Setter Header")
    var
        Papers: Record Papers;
        ReviewLines: Record "Examination Review Lines";
        CountQuestions: Integer;
        LineNo: Integer;
        ReviewLines1: Record "Examination Review Lines";
        CreatedQuestions: Integer;
        TXT001: label 'Kindly input the number of required questions for the paper %1,in the papers list';
    begin
        Papers.Reset;
        Papers.SetRange(Code, SetterHeader."Paper Code");
        if Papers.FindFirst then begin
            if Papers."No. of Required Questions" = 0 then
                Error(TXT001, Papers.Code);
            CountQuestions := Papers."No. of Required Questions";
        end;
        ReviewLines.Reset;
        if ReviewLines.FindLast then begin
            LineNo := ReviewLines."Line No.";
        end;
        CreatedQuestions := 1;
        while CreatedQuestions < CountQuestions + 1 do begin
            ReviewLines1.Init;
            ReviewLines1."Line No." := LineNo + 1;
            ReviewLines1."Document No." := SetterHeader."Document No.";
            ReviewLines1."Question No." := CreatedQuestions;
            ReviewLines1.Insert(true);
            CreatedQuestions := CreatedQuestions + 1;
            LineNo := LineNo + 1;
        end
    end;


    procedure SuggestSetterPaperInfo(SetterHeader: Record "Setter Header")
    var
        DisclosurePapers: Record "Disclosure Papers";
        DisclosurePaperSubmitted: Record "Disclosure Paper Submitted";
        EntryNo: Integer;
        EntryNo1: Integer;
        DisclosurePapers1: Record "Disclosure Papers";
        DisclosurePaperSubmitted1: Record "Disclosure Paper Submitted";
        ExaminationReviewLines: Record "Examination Review Lines";
        SetterHeader1: Record "Setter Header";
    begin
        //populate papers
        SetterHeader1.Reset;
        SetterHeader1.SetRange("Examination Sitting", SetterHeader."Examination Sitting");
        SetterHeader1.SetRange("Document Type", SetterHeader1."document type"::"Setter Specification");
        SetterHeader1.SetRange("Examiner Code", SetterHeader."Examiner Code");
        if SetterHeader1.FindSet then begin
            repeat
                DisclosurePapers1.Reset;
                if DisclosurePapers1.FindLast then begin
                    EntryNo := DisclosurePapers1."Line No.";
                end;
                DisclosurePapers.Init;
                DisclosurePapers."Document No." := SetterHeader."Document No.";
                DisclosurePapers."Line No." := EntryNo + 1;
                DisclosurePapers."Paper Code" := SetterHeader1."Paper Code";
                DisclosurePapers.Validate("Paper Code");
                if DisclosurePapers.Insert(true) then begin
                    EntryNo := EntryNo + 1;
                    //populate the questions
                    DisclosurePaperSubmitted1.Reset;
                    if DisclosurePaperSubmitted1.FindLast then begin
                        EntryNo1 := DisclosurePaperSubmitted1."Line No.";
                    end;
                    ExaminationReviewLines.Reset;
                    ExaminationReviewLines.SetRange("Document No.", SetterHeader1."Document No.");
                    if ExaminationReviewLines.FindSet then begin
                        repeat
                            DisclosurePaperSubmitted.Init;
                            DisclosurePaperSubmitted."Document No." := SetterHeader."Document No.";
                            DisclosurePaperSubmitted."Line No." := EntryNo1 + 1;
                            DisclosurePaperSubmitted."Paper Code" := DisclosurePapers."Paper Code";
                            DisclosurePaperSubmitted."Question No." := ExaminationReviewLines."Question No.";
                            DisclosurePaperSubmitted."Topic Code" := ExaminationReviewLines."Topic Code";
                            DisclosurePaperSubmitted.Validate("Topic Code");
                            DisclosurePaperSubmitted.Validate("Paper Code");
                            DisclosurePaperSubmitted.Insert(true);
                            EntryNo1 := EntryNo1 + 1;

                        until ExaminationReviewLines.Next = 0
                    end
                end

            until SetterHeader1.Next = 0;
        end
    end;


    procedure SuggestClaimPaperInfo(SetterHeader: Record "Setter Header")
    var
        DisclosurePaperSubmitted: Record "Disclosure Paper Submitted";
        EntryNo: Integer;
        DisclosurePaperSubmitted1: Record "Disclosure Paper Submitted";
        ExaminationReviewLines: Record "Examination Review Lines";
        SetterHeader1: Record "Setter Header";
    begin
        SetterHeader1.Reset;
        SetterHeader1.SetRange("Examination Sitting", SetterHeader."Examination Sitting");
        SetterHeader1.SetRange("Document Type", SetterHeader1."document type"::"Setter Disclosure");
        SetterHeader1.SetRange("Examiner Code", SetterHeader."Examiner Code");
        if SetterHeader1.FindSet then begin
            DisclosurePaperSubmitted1.Reset;
            DisclosurePaperSubmitted1.SetRange("Document No.", SetterHeader1."Document No.");
            if DisclosurePaperSubmitted1.FindSet then begin
                repeat
                    DisclosurePaperSubmitted.TransferFields(DisclosurePaperSubmitted1);
                    DisclosurePaperSubmitted."Document No." := SetterHeader."Document No.";
                    DisclosurePaperSubmitted.Insert(true);

                until DisclosurePaperSubmitted1.Next = 0
            end
        end
    end;


    procedure SuggestModeratorNoOfQuestions(SetterHeader: Record "Examination Review Voucher")
    var
        Papers: Record Papers;
        ReviewLines: Record "Examination Review Lines";
        CountQuestions: Integer;
        LineNo: Integer;
        ReviewLines1: Record "Examination Review Lines";
        CreatedQuestions: Integer;
        TXT001: label 'Kindly input the number of required questions for the paper %1,in the papers list';
        SittingCycle: Record "Exam Sitting Cycle";
        NoOfSittings: Integer;
        SetterMarksPerQuestion: Record "Setter Marks Per Question";
        SetterMarksPerQuestion1: Record "Setter Marks Per Question";
        ReviewLines2: Record "Examination Review Lines";
        SetterHeader2: Record "Setter Header";
        SetterNo: Integer;
        ReviewLines3: Record "Examination Review Lines";
    begin
        Papers.Reset;
        Papers.SetRange(Code, SetterHeader."Paper Code");
        if Papers.FindFirst then begin
            if Papers."No. of Required Questions" = 0 then
                Error(TXT001, Papers.Code);
            CountQuestions := Papers."No. of Required Questions";
        end;
        ReviewLines.Reset;
        if ReviewLines.FindLast then begin
            LineNo := ReviewLines."Line No.";
        end;
        CreatedQuestions := 1;
        //current sitting
        while CreatedQuestions < CountQuestions + 1 do begin
            ReviewLines1.Init;
            ReviewLines1."Line No." := LineNo + 1;
            ReviewLines1."Examination Sitting" := SetterHeader."Examination Sitting";
            ReviewLines1."Document No." := SetterHeader."Document No.";
            ReviewLines1."Question No." := CreatedQuestions;
            if ReviewLines1.Insert(true) then begin
                //get the setters who have set this paper
                SetterHeader2.Reset;
                SetterHeader2.SetRange("Paper Code", SetterHeader."Paper Code");
                SetterHeader2.SetRange("Examination Sitting", SetterHeader."Examination Sitting");
                SetterHeader2.SetRange("Document Type", SetterHeader2."document type"::"Setter Specification");
                if SetterHeader2.FindSet then begin
                    repeat
                        SetterMarksPerQuestion1.Reset;
                        if SetterMarksPerQuestion1.FindLast then begin
                            SetterNo := SetterMarksPerQuestion1."Entry No.";
                        end;
                        ReviewLines3.Reset;
                        ReviewLines3.SetRange("Document No.", SetterHeader2."Document No.");
                        ReviewLines3.SetRange("Question No.", ReviewLines1."Question No.");
                        if ReviewLines3.FindFirst then begin
                            SetterMarksPerQuestion.Init;
                            SetterMarksPerQuestion."Document No." := SetterHeader."Document No.";
                            SetterMarksPerQuestion."Entry No." := SetterNo + 1;
                            SetterMarksPerQuestion."Line No." := ReviewLines1."Line No.";
                            SetterMarksPerQuestion."Question No." := ReviewLines1."Question No.";
                            SetterMarksPerQuestion."Setter Code" := SetterHeader2."Examiner Code";
                            SetterMarksPerQuestion.Validate("Setter Code");
                            SetterMarksPerQuestion."Marks Awarded" := ReviewLines3."Application and Analysis" + ReviewLines3."Knowledge and Comprehension" + ReviewLines3."Evaluation and Creativity";
                            SetterMarksPerQuestion.Insert(true);
                            SetterNo := SetterNo + 1
                        end;
                    until SetterHeader2.Next = 0;
                end


            end;
            CreatedQuestions := CreatedQuestions + 1;
            LineNo := LineNo + 1;
        end;




        NoOfSittings := 1;
        SittingCycle.Reset;
        SittingCycle.SetCurrentkey("Exam Start Date");
        SittingCycle.SetAscending("Exam Start Date", false);
        if SittingCycle.FindSet then begin
            repeat
                if ((SittingCycle."Exam Sitting Cycle" <> SetterHeader."Examination Sitting") and (NoOfSittings < 3)) then begin

                    CreatedQuestions := 1;
                    while CreatedQuestions < CountQuestions + 1 do begin
                        ReviewLines1.Init;
                        ReviewLines1."Line No." := LineNo + 1;
                        ReviewLines1."Examination Sitting" := SittingCycle."Exam Sitting Cycle";
                        ReviewLines1."Document No." := SetterHeader."Document No.";
                        ReviewLines1."Question No." := CreatedQuestions;
                        ReviewLines1.Insert(true);
                        CreatedQuestions := CreatedQuestions + 1;
                        LineNo := LineNo + 1;

                    end;
                    NoOfSittings := NoOfSittings + 1;
                end
            until SittingCycle.Next = 0;
        end;
    end;


    procedure SuggestModeratedQuestions(ReviewVoucher: Record "Examination Review Voucher")
    var
        ModeratorReviewVoucher: Record "Examination Review Voucher";
        ModeratorLines: Record "Examination Review Lines";
        ReviewLines: Record "Examination Review Lines";
        LineNo: Integer;
        ReviewLines1: Record "Examination Review Lines";
    begin
        ModeratorReviewVoucher.Reset;
        ModeratorReviewVoucher.SetRange("Examination Sitting", ReviewVoucher."Examination Sitting");
        ModeratorReviewVoucher.SetRange("Document Type", ModeratorReviewVoucher."document type"::Moderator);
        ModeratorReviewVoucher.SetRange("Paper Code", ReviewVoucher."Paper Code");
        if ModeratorReviewVoucher.FindFirst then begin
            ReviewLines.Reset;
            ReviewLines.SetRange("Document No.", ReviewVoucher."Document No.");
            if ReviewLines.FindSet then begin
                ReviewLines.DeleteAll;
            end;
            ReviewLines.Reset;
            if ReviewLines.FindLast then
                LineNo := ReviewLines."Line No.";
            ModeratorLines.Reset;
            ModeratorLines.SetRange("Document No.", ModeratorReviewVoucher."Document No.");
            ModeratorLines.SetRange("Examination Sitting", ModeratorReviewVoucher."Examination Sitting");
            if ModeratorLines.FindSet then begin
                repeat

                    ReviewLines1."Document No." := ReviewVoucher."Document No.";
                    ReviewLines1."Line No." := LineNo + 1;
                    ReviewLines1."Topic Code" := ModeratorLines."Topic Code";
                    ReviewLines1.Validate("Topic Code");
                    ReviewLines1."Question No." := ModeratorLines."Question No.";
                    ReviewLines1."Knowledge and Comprehension" := ModeratorLines."Knowledge and Comprehension";
                    ReviewLines1."Application and Analysis" := ModeratorLines."Application and Analysis";
                    ReviewLines1."Evaluation and Creativity" := ModeratorLines."Evaluation and Creativity";
                    ReviewLines1.Insert(true);
                    LineNo += 1;

                until ModeratorLines.Next = 0;
            end
        end
    end;


    procedure SuggestReviewedQuestions(ReviewVoucher: Record "Examination Review Voucher")
    var
        ModeratorReviewVoucher: Record "Examination Review Voucher";
        ModeratorLines: Record "Examination Review Lines";
        ReviewLines: Record "Examination Review Lines";
        LineNo: Integer;
        ReviewLines1: Record "Examination Review Lines";
    begin
        ModeratorReviewVoucher.Reset;
        ModeratorReviewVoucher.SetRange("Examination Sitting", ReviewVoucher."Examination Sitting");
        ModeratorReviewVoucher.SetRange("Document Type", ModeratorReviewVoucher."document type"::Reviewer);
        ModeratorReviewVoucher.SetRange("Paper Code", ReviewVoucher."Paper Code");
        if ModeratorReviewVoucher.FindFirst then begin
            ReviewLines.Reset;
            ReviewLines.SetRange("Document No.", ReviewVoucher."Document No.");
            if ReviewLines.FindSet then begin
                ReviewLines.DeleteAll;
            end;
            ReviewLines.Reset;
            if ReviewLines.FindLast then
                LineNo := ReviewLines."Line No.";
            ModeratorLines.Reset;
            ModeratorLines.SetRange("Document No.", ModeratorReviewVoucher."Document No.");
            //ModeratorLines.SETRANGE("Examination Sitting",ModeratorReviewVoucher."Examination Sitting");
            if ModeratorLines.FindSet then begin
                repeat

                    ReviewLines1."Document No." := ReviewVoucher."Document No.";
                    ReviewLines1."Line No." := LineNo + 1;
                    ReviewLines1."Topic Code" := ModeratorLines."Topic Code";
                    ReviewLines1.Validate("Topic Code");
                    ReviewLines1."Question No." := ModeratorLines."Question No.";
                    ReviewLines1."Knowledge and Comprehension" := ModeratorLines."Knowledge and Comprehension";
                    ReviewLines1."Application and Analysis" := ModeratorLines."Application and Analysis";
                    ReviewLines1."Evaluation and Creativity" := ModeratorLines."Evaluation and Creativity";
                    ReviewLines1.Insert(true);
                    LineNo += 1;

                until ModeratorLines.Next = 0;
            end
        end
    end;


    procedure SuggestExaminedQuestions(ReviewVoucher: Record "Examination Review Voucher")
    var
        ModeratorReviewVoucher: Record "Examination Review Voucher";
        ModeratorLines: Record "Examination Review Lines";
        ReviewLines: Record "Examination Review Lines";
        LineNo: Integer;
        ReviewLines1: Record "Examination Review Lines";
    begin
        ModeratorReviewVoucher.Reset;
        ModeratorReviewVoucher.SetRange("Examination Sitting", ReviewVoucher."Examination Sitting");
        ModeratorReviewVoucher.SetRange("Document Type", ModeratorReviewVoucher."document type"::"Chief Examiner");
        ModeratorReviewVoucher.SetRange("Paper Code", ReviewVoucher."Paper Code");
        if ModeratorReviewVoucher.FindFirst then begin
            ReviewLines.Reset;
            ReviewLines.SetRange("Document No.", ReviewVoucher."Document No.");
            if ReviewLines.FindSet then begin
                ReviewLines.DeleteAll;
            end;
            ReviewLines.Reset;
            if ReviewLines.FindLast then
                LineNo := ReviewLines."Line No.";
            ModeratorLines.Reset;
            ModeratorLines.SetRange("Document No.", ModeratorReviewVoucher."Document No.");
            //ModeratorLines.SETRANGE("Examination Sitting",ModeratorReviewVoucher."Examination Sitting");
            if ModeratorLines.FindSet then begin
                repeat

                    ReviewLines1."Document No." := ReviewVoucher."Document No.";
                    ReviewLines1."Line No." := LineNo + 1;
                    ReviewLines1."Topic Code" := ModeratorLines."Topic Code";
                    ReviewLines1.Validate("Topic Code");
                    ReviewLines1."Question No." := ModeratorLines."Question No.";
                    ReviewLines1."Knowledge and Comprehension" := ModeratorLines."Knowledge and Comprehension";
                    ReviewLines1."Application and Analysis" := ModeratorLines."Application and Analysis";
                    ReviewLines1."Evaluation and Creativity" := ModeratorLines."Evaluation and Creativity";
                    ReviewLines1.Insert(true);
                    LineNo += 1;

                until ModeratorLines.Next = 0;
            end
        end
    end;

    procedure NotifyModeratoronAccept(ExaminationReviewVoucher: Record "Examination Review Voucher")
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
        Resources: Record Resource;
        RequestorEmail: Text[250];
        ModeratorEmail: Text[250];
        Resources2: Record Resource;
    begin
        Resources.Reset;
        Resources.SetRange("No.", ExaminationReviewVoucher."Resource No.");
        if Resources.FindSet then
            RequestorEmail := Resources.Email;

        Resources2.Reset;
        Resources2.SetRange("No.", ExaminationReviewVoucher."Moderator No.");
        if Resources2.FindSet then
            ModeratorEmail := Resources2.Email;

        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //Email2:='student_notifications@kasneb.or.ke';

        //SMTP.Create(COMPANYNAME + ' ' + 'EXAMINATION DEVELOPMENT', Email2, ModeratorEmail,
        // COMPANYNAME + ' ' + 'EXAMINATION DEVELOPMENT',
        // 'Dear ' + ExaminationReviewVoucher."Moderator Name" + ',<BR><BR>' +
        // 'This is to notify you that ' + ExaminationReviewVoucher."Paper Code" + ' is ready for your reaction.<BR>' +
        // '', true);
        // //FileName:=ReceiptHeader."No."+'.pdf';
        // FileName1:=StudentProcessingHeader."No."+'.pdf';
        // FileLocation:=ExaminationSetup."Examination Path"+FileName;
        // {ReceiptHeader1.RESET;
        // ReceiptHeader1.SETRANGE("No.",StudentProcessingHeader."Renewal Receipt No.");
        // IF ReceiptHeader1.FINDSET THEN BEGIN
        // //Report.SaveAsPdf(56003,FileLocation, ReceiptHeader1);
        // END;}
        ////Report.SaveAsPdf(85025,FileLocation, StudentProcessingHeader);
        ////SMTP.AddAttachment(FileLocation+FileName,FileName);
        ////SMTP.AddAttachment(FileLocation+FileName1,FileName1);
        ////SMTP.AddBCC(Email2);
        ////SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>For more details contact the following:<BR>');
        ////SMTP.AppendToBody('<BR><BR>Kasneb.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();

        //send receipt
    end;

    procedure NotifyModeratoronReject(ExaminationReviewVoucher: Record "Examination Review Voucher")
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
        Resources: Record Resource;
        RequestorEmail: Text[250];
        ModeratorEmail: Text[250];
        Resources2: Record Resource;
    begin
        Resources.Reset;
        Resources.SetRange("No.", ExaminationReviewVoucher."Resource No.");
        if Resources.FindSet then
            RequestorEmail := Resources.Email;

        Resources2.Reset;
        Resources2.SetRange("No.", ExaminationReviewVoucher."Moderator No.");
        if Resources2.FindSet then
            ModeratorEmail := Resources2.Email;

        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //Email2:='student_notifications@kasneb.or.ke';

        //SMTP.Create(COMPANYNAME + ' ' + 'EXAMINATION DEVELOPMENT', Email2, ModeratorEmail,
        // COMPANYNAME + ' ' + 'EXAMINATION DEVELOPMENT',
        // 'Dear ' + ExaminationReviewVoucher."Moderator Name" + ',<BR><BR>' +
        // 'This is to notify you that the ' + ExaminationReviewVoucher."Paper Name" + ' has been Rejected.<BR>' +
        // 'Kindly Log in to the ERP and review', true);
        //FileName:=ReceiptHeader."No."+'.pdf';
        // FileName1:=StudentProcessingHeader."No."+'.pdf';
        // FileLocation:=ExaminationSetup."Examination Path"+FileName;
        // {ReceiptHeader1.RESET;
        // ReceiptHeader1.SETRANGE("No.",StudentProcessingHeader."Renewal Receipt No.");
        // IF ReceiptHeader1.FINDSET THEN BEGIN
        // //Report.SaveAsPdf(56003,FileLocation, ReceiptHeader1);
        // END;}
        ////Report.SaveAsPdf(85025,FileLocation, StudentProcessingHeader);
        ////SMTP.AddAttachment(FileLocation+FileName,FileName);
        ////SMTP.AddAttachment(FileLocation+FileName1,FileName1);
        ////SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>Kasneb.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();

        //send receipt
    end;

    procedure NotifyReviewer(ExaminationReviewVoucher: Record "Examination Review Voucher")
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
        Resources: Record Resource;
        RequestorEmail: Text[250];
        ModeratorEmail: Text[250];
        Resources2: Record Resource;
    begin
        Resources.Reset;
        Resources.SetRange("No.", ExaminationReviewVoucher."Resource No.");
        if Resources.FindSet then
            RequestorEmail := Resources.Email;

        Resources2.Reset;
        Resources2.SetRange("No.", ExaminationReviewVoucher."Moderator No.");
        if Resources2.FindSet then
            ModeratorEmail := Resources2.Email;

        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //Email2:='student_notifications@kasneb.or.ke';

        // //SMTP.Create(COMPANYNAME + ' ' + 'EXAMINATION DEVELOPMENT', Email2, RequestorEmail,
        // COMPANYNAME + ' ' + 'EXAMINATION DEVELOPMENT',
        // 'Dear ' + ExaminationReviewVoucher."Resource Name" + ',<BR><BR>' +
        // 'This is to notify you that ' + ExaminationReviewVoucher."Paper Code" + ' is ready for your review.<BR>' +
        // '', true);
        // //FileName:=ReceiptHeader."No."+'.pdf';
        // FileName1:=StudentProcessingHeader."No."+'.pdf';
        // FileLocation:=ExaminationSetup."Examination Path"+FileName;
        // {ReceiptHeader1.RESET;
        // ReceiptHeader1.SETRANGE("No.",StudentProcessingHeader."Renewal Receipt No.");
        // IF ReceiptHeader1.FINDSET THEN BEGIN
        // //Report.SaveAsPdf(56003,FileLocation, ReceiptHeader1);
        // END;}
        ////Report.SaveAsPdf(85025,FileLocation, StudentProcessingHeader);
        ////SMTP.AddAttachment(FileLocation+FileName,FileName);
        ////SMTP.AddAttachment(FileLocation+FileName1,FileName1);
        ////SMTP.AddBCC(Email2);
        ////SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>For more details contact the following:<BR>');
        ////SMTP.AppendToBody('<BR><BR>Kasneb.<BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR><BR>');
        //SMTP.Send();

        //send receipt
    end;


    procedure SuggestSettersandSubjects(SetterHeader: Record "Setter Header")
    var
        TXT001: label 'Kindly input the number of required questions for the paper %1,in the papers list';
        SetterTaskAllocation: Record "Setter Task Allocation";
        ResourceAllocation: Record "Resource Role Allocation";
        PaperAllocation: Record "Marker Task Allocation";
        SetterTask: Record "Setter Task Allocation";
        SetterTaskAlloc: Record "Setter Task Allocation";
    begin
        SetterTaskAlloc.Reset;
        SetterTaskAlloc.SetRange("Document No", SetterHeader."Document No.");
        if SetterTaskAlloc.FindSet then begin
            SetterTaskAlloc.DeleteAll;
        end;
        ResourceAllocation.Reset;
        ResourceAllocation.SetRange(Role, ResourceAllocation.Role::Setter);
        if ResourceAllocation.FindSet then begin
            repeat
                PaperAllocation.Reset;
                PaperAllocation.SetRange("Resource No", ResourceAllocation."Resource No");
                if PaperAllocation.FindSet then begin
                    repeat
                        SetterTaskAllocation.Init;
                        SetterTaskAllocation."Document No" := SetterHeader."Document No.";
                        SetterTask.Reset;
                        if SetterTask.FindLast then
                            SetterTaskAllocation."Line No" := SetterTask."Line No" + 1;
                        SetterTaskAllocation."Resource No" := PaperAllocation."Resource No";
                        SetterTaskAllocation.Name := PaperAllocation.Name;
                        SetterTaskAllocation."Examination Sitting" := SetterHeader."Examination Sitting";
                        SetterTaskAllocation.Course := PaperAllocation.Course;
                        SetterTaskAllocation.Section := PaperAllocation.Section;
                        SetterTaskAllocation.Level := PaperAllocation.Level;
                        SetterTaskAllocation."Paper ID" := PaperAllocation."Paper ID";
                        SetterTaskAllocation."Paper Name" := PaperAllocation."Paper Name";
                        SetterTaskAllocation.Insert(true);

                    until PaperAllocation.Next = 0;
                end;

            until ResourceAllocation.Next = 0;
        end;
        Message('Suggested Successfully');
    end;

    procedure SuggestMCQNoOfQuestions(SetterHeader: Record "Setter Header")
    var
        Papers: Record Papers;
        ReviewLines: Record "Examination Review Lines";
        CountQuestions: Integer;
        LineNo: Integer;
        ReviewLines1: Record "Examination Review Lines";
        CreatedQuestions: Integer;
        TXT001: label 'Kindly input the number of required questions for the paper %1,in the papers list';
        MCQQuestionTemplate: Record "MCQ Question Template";
        MCQTemplateLines: Record "MCQ Template Lines";
    begin

        SetterHeader.TestField("MCQ Template");
        SetterHeader.TestField("MCQ's", true);
        MCQTemplateLines.Reset;
        MCQTemplateLines.SetRange("Document No", SetterHeader."MCQ Template");
        if MCQTemplateLines.FindSet then begin
            repeat
                ReviewLines1.Init;
                ReviewLines.Reset;
                if ReviewLines.FindLast then begin
                    LineNo := ReviewLines."Line No.";

                    ReviewLines1."Line No." := LineNo + 1;
                end;
                ReviewLines1."Document No." := SetterHeader."Document No.";
                ReviewLines1."Question No." := MCQTemplateLines."Starting No";
                ReviewLines1."Ending Question No." := MCQTemplateLines."Ending No";
                ReviewLines1.Examination := SetterHeader.Examination;
                ReviewLines1."Examination Sitting" := SetterHeader."Examination Sitting";
                ReviewLines1.Level := SetterHeader.Level;
                ReviewLines1."Paper Code" := SetterHeader."Paper Code";
                ReviewLines1."Paper Name" := SetterHeader."Paper Name";
                ReviewLines1.Insert(true);

            until MCQTemplateLines.Next = 0;
        end;
        Message('Suggested Successfully');
    end;
}

