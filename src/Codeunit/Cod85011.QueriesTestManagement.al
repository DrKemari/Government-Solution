codeunit 85011 QueriesTestManagement
{
    var
        setterHeader: Record "Setter Header";
        disclosurePapers: Record "Disclosure Papers";
        disclosureInstitution: Record "Disclosure Training Inst";
        disclosureRelatives: Record "Disclosure Relative";
        disclosureSubmitted: Record "Disclosure Paper Submitted";
        examSittingcycle: record "Exam Sitting Cycle";
        courses: Record Courses;
        parts: Record Level;
        papers: Record Papers;
        SettingModerationSetup: Record "Setting Moderation Setup";
        setterTaskAllocation: Record "Setter Task Allocation";
        ExaminationSetup: Record "Examination Setup";
        //SettersPortalUsers: Record setter po
        examinationReviewLines: Record "Examination Review Lines";
        countries: Record "Country/Region";
        paperTopicSetup: Record "Paper Topic Setup";

        setterPortalUsers: Record SettersPortalUsers;
        intCustomers: Record Customer;



    procedure getSetterHeader(docType: Option; examinerCode: Code[100]) AllData: Text
    var
        docNo: Text;
        examSitting: Text;
        createdOn: Text;


    begin
        setterHeader.Reset;
        setterHeader.SetRange("Document Type", docType);
        setterHeader.SetRange("Examiner Code", examinerCode);
        if setterHeader.FindSet() then begin
            repeat
                docNo := Format(setterHeader."Document No.");
                examSitting := Format(setterHeader."Examination Sitting");
                createdOn := Format(setterHeader."Created On");

                AllData := AllData + docNo + '*' + examSitting + '*' + createdOn + '::::';

            until setterHeader.Next = 0;
        end;
        exit(AllData);
    end;


    procedure getSetterHeader2(docNo: Code[50]) AllData: Text
    var
        kncperc: Text;
        anaperc: Text;
        enaperc: Text;

    begin
        setterHeader.Reset;
        setterHeader.SetRange("Document No.", docNo);
        if setterHeader.FindSet() then begin
            repeat
                kncperc := Format(setterHeader."Knowledge and Comprehension");
                anaperc := Format(setterHeader."Application and Analysis");
                enaperc := Format(setterHeader."Evaluation and Creativity");

                AllData := AllData + kncperc + '*' + anaperc + '*' + enaperc + '::::';

            until setterHeader.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getDisclosurePapers(docNumber: Code[100]) AllData: Text
    var
        examination: Text;
        examinationName: Text;
        level: Text;
        paperCode: Text;
        paperName: Text;


    begin
        disclosurePapers.Reset;
        disclosurePapers.SetRange("Document No.", docNumber);
        if disclosurePapers.FindSet() then begin
            repeat
                examination := Format(disclosurePapers.Examination);
                examinationName := Format(disclosurePapers."Examination Name");
                level := Format(disclosurePapers.Level);
                paperCode := Format(disclosurePapers."Paper Code");
                paperName := Format(disclosurePapers."Paper Name");

                AllData := AllData + examinationName + '*' + level + '*' + paperCode + '*' + paperName + '*' + examination + '::::';

            until disclosurePapers.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getDisclosureInstitutions(docNumber: Code[100]) AllData: Text

    var
        institutionName: Text;
        dateCommencedTraining: Text;


    begin
        disclosureInstitution.Reset;
        disclosureInstitution.SetRange("Document No.", docNumber);
        if disclosureInstitution.FindSet() then begin
            repeat
                institutionName := Format(disclosureInstitution."Institution Name");
                dateCommencedTraining := Format(disclosureInstitution."Date Commenced Training");

                AllData := AllData + institutionName + '*' + dateCommencedTraining + '::::';

            until disclosureInstitution.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getDisclosureRelatives(docNumber: Code[100]) AllData: Text

    var
        nameOfRelative: Text;
        relative: Text;
        studRegNo: Text;
        course: Text;

    begin
        disclosureRelatives.Reset;
        disclosureRelatives.SetRange("Document No.", docNumber);
        if disclosureRelatives.FindSet() then begin
            repeat
                nameOfRelative := Format(disclosureRelatives."Name of Relative");
                relative := Format(disclosureRelatives.Relationship);
                studRegNo := Format(disclosureRelatives."Student Reg No.");
                course := Format(disclosureRelatives.Course);


                AllData := AllData + nameOfRelative + '*' + relative + '*' + studRegNo + '*' + course + '::::';

            until disclosureRelatives.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getDisclosureRelativesNature(docNumber: Code[100]) AllData: Text
    var
        institutionName: Text;
        natureOfInterest: Text;

    begin
        disclosureRelatives.Reset;
        disclosureRelatives.SetRange("Document No.", docNumber);
        disclosureRelatives.SetRange("Nature of Interest", '<>%1', '');
        if disclosureRelatives.FindSet() then begin
            repeat
                institutionName := Format(disclosureRelatives."Name of Relative");
                natureOfInterest := Format(disclosureRelatives.Relationship);

                AllData := AllData + institutionName + '*' + natureOfInterest + '::::';

            until disclosureRelatives.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getDisclosureSubmittedPapers(docNumber: Code[100]) AllData: Text
    var
        examinationName: Text;
        level: Text;
        paperName: Text;
        questionNo: Text;
        topicName: Text;

    begin
        disclosureSubmitted.Reset;
        disclosureSubmitted.SetRange("Document No.", docNumber);
        if disclosureSubmitted.FindSet() then begin
            repeat
                examinationName := Format(disclosureSubmitted."Examination Name");
                level := Format(disclosureSubmitted.Level);
                paperName := Format(disclosureSubmitted."Paper Name");
                questionNo := Format(disclosureSubmitted.Level);
                topicName := Format(disclosureSubmitted."Topic Name");

                AllData := AllData + examinationName + '*' + level + '*' + paperName + '*' + questionNo + '*' + topicName + '::::';

            until disclosureSubmitted.Next = 0;
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

    procedure getPapers(course: code[30]; levell: code[30]) AllData: Text
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


    procedure getSetterTaskAllocation(docNo: code[30]; resourceNo: code[30]) AllData: Text
    var
        paperId: Text;
        paperName: Text;
        submittedTOR: Text;
        documentNo: Text;

    begin
        setterTaskAllocation.Reset;
        setterTaskAllocation.SetRange("Document No", docNo);
        setterTaskAllocation.SetRange("Resource No", resourceNo);
        if setterTaskAllocation.FindSet() then begin
            repeat
                paperId := Format(setterTaskAllocation."Paper ID");
                paperName := Format(setterTaskAllocation."Paper Name");
                submittedTOR := Format(setterTaskAllocation."Submitted Setter ToS");
                docNo := Format(setterTaskAllocation."Document No");

                AllData := AllData + paperId + '*' + paperName + '*' + submittedTOR + '*' + documentNo + '::::';
            until setterTaskAllocation.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getExamininationsetup() AllData: Text
    var
        examSitting: Text;

    begin
        ExaminationSetup.Reset;
        if ExaminationSetup.FindSet() then begin
            repeat
                examSitting := Format(ExaminationSetup."Default Examination Sitting");

                AllData := AllData + examSitting + '::::';
            until ExaminationSetup.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getexaminationReviewLines(docNo: code[100]) AllData: Text
    var
        examSitting: Text;
        lineNo: Text;
        questionNo: Text;
        references: Text;
        KnowledgeAndComprehension: Text;
        ApplicationAndAnalysis: Text;
        EvaluationAndCreativity: Text;
        questionEndingNo: Text;
        topicCode: Text;
        topicName: Text;
        ppKnowledge_and_Comprehension: Text;
        ppApplication_and_Analysis: Text;
        ppEvaluation_and_Creativity: Text;

    begin
        examinationReviewLines.Reset;
        examinationReviewLines.SetRange("Document No.", docNo);
        if examinationReviewLines.FindSet() then begin
            repeat
                examSitting := Format(examinationReviewLines."Question No.");
                lineNo := Format(examinationReviewLines."Line No.");
                questionNo := Format(examinationReviewLines."Question No.");
                references := Format(examinationReviewLines.References);
                KnowledgeAndComprehension := Format(examinationReviewLines."Knowledge and Comprehension");
                ApplicationAndAnalysis := Format(examinationReviewLines."Application and Analysis");
                EvaluationAndCreativity := Format(examinationReviewLines."Evaluation and Creativity");
                questionEndingNo := Format(examinationReviewLines."Ending Question No.");
                topicCode := Format(examinationReviewLines."Topic Code");
                topicName := Format(examinationReviewLines."Topic Name");
                // ppKnowledge_and_Comprehension := Format(examinationReviewLines.);
                // ppApplication_and_Analysis := Format(examinationReviewLines."Topic Name");
                // ppEvaluation_and_Creativity := Format(examinationReviewLines."Topic Name");

                AllData := AllData + examSitting + '*' + lineNo + '*' + questionNo + '*' + references + '*' + KnowledgeAndComprehension + '*'
                + ApplicationAndAnalysis + '*' + EvaluationAndCreativity + '*' + questionEndingNo + '*' + topicCode +
                 '*' + topicName + '*' + ppKnowledge_and_Comprehension + '*' + ppApplication_and_Analysis + '*' + ppEvaluation_and_Creativity + '::::';
            until examinationReviewLines.Next = 0;
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

    procedure getPart(courseId: code[30]) AllData: Text
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

    procedure getPaperTopicSetUp(paperCode: code[30]) AllData: Text
    var
        topicCode: Text;
        topicName: Text;
        description: Text;
        coddee: Text;

    begin
        paperTopicSetup.Reset;
        paperTopicSetup.SetRange("Paper Code", paperCode);
        if paperTopicSetup.FindSet() then begin
            repeat
                topicCode := Format(paperTopicSetup."Topic Code");
                topicName := Format(paperTopicSetup."Topic Name");


                AllData := AllData + topicCode + '*' + topicName + '::::';
            until paperTopicSetup.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getSettingModerationSetUp() AllData: Text
    var
        Current_Setter_Planner_Form: Text;

    begin
        SettingModerationSetup.Reset;
        if SettingModerationSetup.FindSet() then begin
            repeat
                Current_Setter_Planner_Form := Format(SettingModerationSetup."Current Setter Planner Form");

                AllData := AllData + Current_Setter_Planner_Form + '::::';

            until SettingModerationSetup.Next = 0;
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

    procedure getSettersPortalUsers(authEmail: Text; pass: Text; currSitting: Code[50]) AllData: Text
    var
        name: Text;
        setterNo: Text;

    begin
        setterPortalUsers.Reset;
        setterPortalUsers.SetRange("Authentication Email", authEmail);
        setterPortalUsers.SetRange(Password, pass);
        setterPortalUsers.SetRange("Examination Sitting", currSitting);
        if setterPortalUsers.FindSet() then begin
            repeat
                name := Format(setterPortalUsers."Resource Name");
                setterNo := Format(setterPortalUsers."Resource No");

                AllData := AllData + name + '*' + setterNo + '::::';

            until setterPortalUsers.Next = 0;
        end;
        exit(AllData);
    end;

    procedure getSettersPortalUsers1(authEmail: Text; pass: Text) AllData: Text
    var
        name: Text;
        setterNo: Text;

    begin
        setterPortalUsers.Reset;
        setterPortalUsers.SetRange("Authentication Email", authEmail);
        setterPortalUsers.SetRange(Password, pass);
        if setterPortalUsers.FindSet() then begin
            repeat
                name := Format(setterPortalUsers."Resource Name");
                setterNo := Format(setterPortalUsers."Resource No");

                AllData := AllData + name + '*' + setterNo + '::::';

            until setterPortalUsers.Next = 0;
        end;
        exit(AllData);
    end;






}
