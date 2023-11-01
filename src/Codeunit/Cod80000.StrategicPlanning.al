#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 80000 "Strategic Planning"
{

    trigger OnRun()
    begin
    end;

    var
        WPLines: Record "Strategy Workplan Lines";
        StrategicAct: Record "Strategic Initiative";
        ServerFileName: Text;
        SheetName: Text;
        FIleManagement: Codeunit "File Management";
        ExcelExt: Text;
        AnnualWorkPlan: Record "Strategy Workplan Lines";
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        WPlanLines: Record "Strategy Workplan Lines";
        I: Integer;
        ThemeID: Code[50];
        ObjectiveID: Code[50];
        StrategicInt: Record "Strategic Initiative";
        SourceType: Option "Strategic Plan","Perfomance Contract";
        YearCode: Record "Annual Reporting Codes";
        QYearCode: Record "Quarterly Reporting Periods";
        QCount: Integer;
        Q1: Code[20];
        Q1date: Date;
        Q2: Code[20];
        Q2date: Date;
        Q3: Code[20];
        Q3date: Date;
        Q4: Code[20];
        Q4date: Date;
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        ReviewPeriods: Record "Review Periods";
        SPMGeneralSetup: Record "SPM General Setup";
        PCJobDescription: Record "PC Job Description";
        SubJDObjective: Record "Sub JD Objective";


    procedure fnPostPlanEntry(WPlanLines: Record "Strategy Workplan Lines")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin
        StrategicInt.Reset;
        StrategicInt.SetRange(Code, WPlanLines."Activity ID");
        if StrategicInt.Find('-') then begin
            ThemeID := StrategicInt."Theme ID";
            ObjectiveID := StrategicInt."Objective ID";
        end;

        QYearCode.Reset;
        QYearCode.SetRange("Year Code", WPlanLines."Year Reporting Code");
        if QYearCode.Find('-') then begin
            repeat
                QCount := QCount + 1;
                if (QCount = 1) then begin
                    Q1 := QYearCode.Code;
                    Q1date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 2) then begin
                    Q2 := QYearCode.Code;
                    Q2date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 3) then begin
                    Q3 := QYearCode.Code;
                    Q3date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 4) then begin
                    Q4 := QYearCode.Code;
                    Q4date := QYearCode."Reporting Start Date";
                end;
            until QYearCode.Next = 0;
        end;


        // I:=0;
        for I := 1 to 4 do begin

            if (I = 1) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q1, Q1date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q1 Target", WPlanLines."Q1 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");
            end;
            if (I = 2) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q2, Q2date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q2 Target", WPlanLines."Q2 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");
            end;

            if (I = 3) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q3, Q3date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q3 Target", WPlanLines."Q3 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");

            end;
            if (I = 4) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q4, Q4date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q4 Target", WPlanLines."Q4 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");
            end;
        end;
    end;


    procedure FnInsertEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin

        StrategyEntry.Init;
        StrategyEntry."Strategic Plan ID" := PlanID;
        StrategyEntry."Theme ID" := ThemeID;
        StrategyEntry."Objective ID" := ObjectiveID;
        StrategyEntry."Strategy ID" := StrategyID;
        StrategyEntry."Activity ID" := Actitvityid;
        StrategyEntry."Entry Description" := Description;
        StrategyEntry."Entry Type" := EntryType;
        StrategyEntry."Year Reporting Code" := YearCode;
        StrategyEntry."Quarter Reporting Code" := QYearCode;
        StrategyEntry."Planning Date" := PlanningDate;
        StrategyEntry."Primary Directorate" := PrimaryDirectorate;
        StrategyEntry."Primary Department" := PrimaryDepartment;
        StrategyEntry.Quantity := Quantity;
        StrategyEntry."Cost Amount" := CostAmount;
        StrategyEntry."External Document No" := Extdoc;
        StrategyEntry."Source Type" := SourceType;
        StrategyEntry.Insert(true);
    end;


    procedure fnPostObjectiveEntry(ObjectiveOutcome: Record "Objective Evaluation Result")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        PerformanceEvaluation: Record "Perfomance Evaluation";
        ReviewQuarterlyPeriods: Record "Review Quarterly Periods";
        StrategicPlan: Code[50];
        EntryType: Option Planned,Actual;
    begin
        StrategicInt.Reset;
        StrategicInt.SetRange(Code, ObjectiveOutcome."Intiative No");
        if StrategicInt.Find('-') then begin
            StrategicPlan := StrategicInt."Strategic Plan ID";
            ThemeID := StrategicInt."Theme ID";
            ObjectiveID := StrategicInt."Objective ID";
        end;

        PerformanceEvaluation.Reset;
        PerformanceEvaluation.SetRange(No, ObjectiveOutcome."Performance Evaluation ID");
        if PerformanceEvaluation.FindFirst then begin
            ReviewPeriods.Reset;
            ReviewPeriods.SetRange(Code, PerformanceEvaluation."Review Period");
            if ReviewPeriods.FindFirst then begin
                QCount := 0;
                case ReviewPeriods."Review Type" of
                    ReviewPeriods."review type"::Quartely:
                        begin
                            ReviewQuarterlyPeriods.Reset;
                            ReviewQuarterlyPeriods.SetRange("Review Period Code", ReviewPeriods.Code);
                            if ReviewQuarterlyPeriods.Find('-') then begin
                                FnInsertEntry(StrategicPlan, ThemeID, ObjectiveID, StrategicPlan, ObjectiveOutcome."Intiative No", ObjectiveOutcome."Objective/Initiative", Entrytype::Actual,
                               ReviewQuarterlyPeriods."Year Code", ReviewQuarterlyPeriods.Code, ReviewQuarterlyPeriods."Reporting Start Date", ObjectiveOutcome."Primary Directorate",
                               ObjectiveOutcome."Primary Department", ObjectiveOutcome."AppraiserReview Qty", 0,
                               ObjectiveOutcome."Performance Evaluation ID", Sourcetype::"Perfomance Contract");
                            end;
                        end;
                    ReviewPeriods."review type"::"Semi-Quartely":
                        begin
                            ReviewQuarterlyPeriods.Reset;
                            ReviewQuarterlyPeriods.SetRange("Review Period Code", ReviewPeriods.Code);
                            if ReviewQuarterlyPeriods.Find('-') then begin
                                repeat
                                    FnInsertEntry(StrategicPlan, ThemeID, ObjectiveID, StrategicPlan, ObjectiveOutcome."Intiative No", ObjectiveOutcome."Objective/Initiative", Entrytype::Actual,
                                    ReviewQuarterlyPeriods."Year Code", ReviewQuarterlyPeriods.Code, ReviewQuarterlyPeriods."Reporting Start Date", ObjectiveOutcome."Primary Directorate",
                                    ObjectiveOutcome."Primary Department", ObjectiveOutcome."AppraiserReview Qty" / ReviewPeriods."No of Quarters", 0,
                                    ObjectiveOutcome."Performance Evaluation ID", Sourcetype::"Perfomance Contract");
                                until ReviewQuarterlyPeriods.Next = 0;
                            end;

                        end;
                    ReviewPeriods."review type"::Annually:
                        begin
                            ReviewQuarterlyPeriods.Reset;
                            ReviewQuarterlyPeriods.SetRange("Review Period Code", ReviewPeriods.Code);
                            if ReviewQuarterlyPeriods.Find('-') then begin
                                repeat
                                    FnInsertEntry(StrategicPlan, ThemeID, ObjectiveID, StrategicPlan, ObjectiveOutcome."Intiative No", ObjectiveOutcome."Objective/Initiative", Entrytype::Actual,
                                    ReviewQuarterlyPeriods."Year Code", ReviewQuarterlyPeriods.Code, ReviewQuarterlyPeriods."Reporting Start Date", ObjectiveOutcome."Primary Directorate",
                                    ObjectiveOutcome."Primary Department", ObjectiveOutcome."AppraiserReview Qty" / ReviewPeriods."No of Quarters", 0,
                                    ObjectiveOutcome."Performance Evaluation ID", Sourcetype::"Perfomance Contract");
                                until ReviewQuarterlyPeriods.Next = 0;
                            end;

                        end else
                                Error('Review Type Category must be selected for Review Period %1', ReviewPeriods.Code);
                end;
            end;
        end;

    end;


    procedure FnGenerateBatchAppraisals(PerformancePlanTask: Record "Performance Plan Task"; StrategicID: Code[10])
    var
        Employee: Record Employee;
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        PerformanceManagementPlan: Record "Performance Management Plan";
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AnnualReportingCode: Code[30];
        PerfomanceEvaluationNo: Code[30];
    begin
        Employee.Reset;
        Employee.SetRange(Status, Employee.Status::Active);
        //Employee.SETRANGE("Primary Bank %",TRUE);
        if Employee.Find('-') then begin
            repeat
                SPMSetup.Get;
                PerfomanceEvaluation.Init;
                PerfomanceEvaluation."Document Type" := PerfomanceEvaluation."document type"::"Performance Appraisal";
                PerformanceManagementPlan.Reset;
                PerformanceManagementPlan.SetRange(No, PerformancePlanTask."Performance Mgt Plan ID");
                if PerformanceManagementPlan.Find('-') then begin
                    // PerformanceManagementPlan.TESTFIELD("Evaluation Type");
                    PerformanceManagementPlan.TestField("Strategy Plan ID");
                    PerformanceManagementPlan.TestField("Annual Reporting Code");
                    StrategicID := PerformanceManagementPlan."Strategy Plan ID";
                    AnnualReportingCode := PerformanceManagementPlan."Annual Reporting Code";
                    PerfomanceEvaluation."Evaluation Type" := PerformanceManagementPlan."Evaluation Type";
                end;
                PerfomanceEvaluation.No := '';
                PerfomanceEvaluation."Performance Mgt Plan ID" := PerformancePlanTask."Performance Mgt Plan ID";
                PerfomanceEvaluation."Strategy Plan ID" := StrategicID;
                PerfomanceEvaluation.Validate("Performance Mgt Plan ID");
                PerfomanceEvaluation."Performance Task ID" := PerformancePlanTask."Task Code";
                PerfomanceEvaluation.Validate("Performance Task ID");
                PerfomanceEvaluation."Employee No." := Employee."No.";
                PerfomanceEvaluation.Validate("Employee No.");
                PerfomanceEvaluation."Personal Scorecard ID" := FnGetPersonalScorecard(Employee."No.", AnnualReportingCode);
                PerfomanceEvaluation."Annual Reporting Code" := AnnualReportingCode;
                if PerfomanceEvaluation.Insert(true) then begin
                    FnSuggestObjectives(PerfomanceEvaluation);
                    FnSuggestEvaluations(PerfomanceEvaluation);
                end;
            until Employee.Next = 0;
        end;
        Message('Employees Performance Appraisals Generated Successfully');
    end;


    procedure FnGetPersonalScorecard(EmployeeNo: Code[30]; AnnualReportingCode: Code[10]) PersonalScoreCard: Code[10]
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange("Responsible Employee No.", EmployeeNo);
        PerfomanceContractHeader.SetRange("Annual Reporting Code", AnnualReportingCode);
        PerfomanceContractHeader.SetRange("Document Type", PerfomanceContractHeader."document type"::"Individual Scorecard");
        PerfomanceContractHeader.SetRange(Status, PerfomanceContractHeader.Status::Signed);
        if PerfomanceContractHeader.FindFirst then begin
            PersonalScoreCard := PerfomanceContractHeader.No;
            exit(PersonalScoreCard);
        end else
            Error('Employee No %1 does not have a Signed Performance Contract for Annual Period %2', EmployeeNo, AnnualReportingCode);
    end;


    procedure FnSuggestObjectives(PerfomanceEvaluation: Record "Perfomance Evaluation")
    begin
        PCObjective.Reset;
        PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
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
                ObjectiveOutcome.Insert(true);

            until PCObjective.Next = 0;

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


    procedure FnSuggestEvaluations(PerfomanceEvaluation: Record "Perfomance Evaluation")
    begin
        CompetencyLines.Reset;
        CompetencyLines.SetRange("Competency Template ID", PerfomanceEvaluation."Competency Template ID");
        if CompetencyLines.Find('-') then begin
            repeat

                ProEvaluation.Init;
                ProEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                ProEvaluation."Competency Template ID" := PerfomanceEvaluation."Competency Template ID";
                ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                ProEvaluation.Description := CompetencyLines.Description;
                ProEvaluation."Profiency Rating Scale" := PerfomanceEvaluation."Proficiency Rating Scale";
                ProEvaluation."Target Qty" := CompetencyLines."Weight %";
                ProEvaluation."Weight %" := CompetencyLines."Weight %";
                ProEvaluation.Insert(true);
            until CompetencyLines.Next = 0;
        end;
    end;


    procedure FnSuggestPlogLines(PerformanceDiaryLog: Record "Performance Diary Log")
    var
        PlogLines: Record "Plog Lines";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        SubPlogLines: Record "Sub Plog Lines";
        SubPCObjective: Record "Sub PC Objective";
    begin
        PerformanceDiaryLog.TestField("Employee No.");
        PerformanceDiaryLog.TestField("Personal Scorecard ID");
        PerformanceDiaryLog.TestField("Activity Start Date");
        PerformanceDiaryLog.TestField("Activity End Date");

        SPMGeneralSetup.Get();
        if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
            PCObjective.Reset;
            PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCObjective.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
            if PCObjective.FindFirst then begin
                repeat
                    PCObjective.CalcFields("Individual Achieved Targets");
                    PCObjective.TestField("Due Date");
                    PCObjective.TestField("Imported Annual Target Qty");
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := PCObjective."Initiative No.";
                    PlogLines."Unit of Measure" := PCObjective."Unit of Measure";
                    PlogLines."Weight %" := PCObjective."Assigned Weight (%)";
                    PlogLines.Validate("Initiative No.");
                    PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                    PlogLines.Insert;

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
                            SubPlogLines."Target Qty" := SubPCObjective."Imported Annual Target Qty";
                            //SubPlogLines.VALIDATE("Initiative No.");
                            //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubPCObjective.Next = 0;
                    end;


                until PCObjective.Next = 0;
            end;
            //Secondary Activities
            SecondaryPCObjective.Reset;
            SecondaryPCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            SecondaryPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            SecondaryPCObjective.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
            if SecondaryPCObjective.FindFirst then begin
                repeat
                    SecondaryPCObjective.CalcFields("Individual Achieved Targets");
                    SecondaryPCObjective.TestField("Due Date");
                    SecondaryPCObjective.TestField("Imported Annual Target Qty");
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"Secondary Activity";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := SecondaryPCObjective."Initiative No.";
                    PlogLines."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                    PlogLines.Validate("Initiative No.");
                    PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                    PlogLines.Insert;
                until SecondaryPCObjective.Next = 0;
            end;
        end;
        //JD Loading
        if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
            PCJobDescription.Reset;
            PCJobDescription.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCJobDescription.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
            if PCJobDescription.FindFirst then begin
                repeat
                    PCJobDescription.CalcFields("Individual Achieved Targets");
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
                            SubPlogLines."Target Qty" := SubJDObjective."Imported Annual Target Qty";
                            SubPlogLines."Due Date" := SubJDObjective."Due Date";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubJDObjective.Next = 0;
                    end;
                until PCJobDescription.Next = 0;
            end;
        end;
    end;


    procedure FnInsertPlogEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract"; EmployeeNo: Code[30]; PostingDate: Date; DocumentType: Option Plog,Appraisal; RegionCode: Code[30]; PerformanceContractID: Code[30]; AnnualWorkplan: Code[30]; BoardPCID: Code[30]; CEOPCID: Code[30]; FunctionalPCID: Code[30]; UnitofMeasure: Code[30])
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin

        StrategyEntry.Init;
        StrategyEntry."Strategic Plan ID" := PlanID;
        StrategyEntry."Theme ID" := ThemeID;
        StrategyEntry."Objective ID" := ObjectiveID;
        StrategyEntry."Strategy ID" := StrategyID;
        StrategyEntry."Activity ID" := Actitvityid;
        StrategyEntry."Entry Description" := Description;
        StrategyEntry."Entry Type" := EntryType;
        StrategyEntry."Year Reporting Code" := YearCode;
        StrategyEntry."Quarter Reporting Code" := QYearCode;
        StrategyEntry."Planning Date" := PlanningDate;
        StrategyEntry."Primary Directorate" := PrimaryDirectorate;
        StrategyEntry."Primary Department" := PrimaryDepartment;
        StrategyEntry.Quantity := Quantity;
        StrategyEntry."Cost Amount" := CostAmount;
        StrategyEntry."External Document No" := Extdoc;
        StrategyEntry."Source Type" := SourceType;
        StrategyEntry."Employee No" := EmployeeNo;
        StrategyEntry."Region Code" := RegionCode;
        StrategyEntry."Performance Contract ID" := PerformanceContractID;
        StrategyEntry."Annual Workplan" := AnnualWorkplan;
        StrategyEntry."Board PC ID" := BoardPCID;
        StrategyEntry."CEO PC ID" := CEOPCID;
        StrategyEntry."Functional PC ID" := FunctionalPCID;
        StrategyEntry."Unit of Measure" := UnitofMeasure;
        StrategyEntry.Insert(true);
    end;


    procedure FnInsertJDPlogEntry(PlogLines: Record "Plog Lines")
    var
        PerformanceDiaryEntry: Record "Performance Diary Entry";
    begin
        PerformanceDiaryEntry.Init;
        PerformanceDiaryEntry."Line Number" := PlogLines."Initiative No.";
        PerformanceDiaryEntry."Employee No" := PlogLines."Employee No.";
        PerformanceDiaryEntry."Posting Date" := PlogLines."Achieved Date";
        PerformanceDiaryEntry."Performance Entry Type" := PerformanceDiaryEntry."performance entry type"::"Positive Performance";
        PerformanceDiaryEntry."Diary Source" := PerformanceDiaryEntry."diary source"::"Self-Log";
        PerformanceDiaryEntry.Description := 'PLOG_' + Format(PlogLines."Achieved Date");
        PerformanceDiaryEntry."Personal Scorecard ID" := PlogLines."Personal Scorecard ID";
        PerformanceDiaryEntry.Quantity := PlogLines."Achieved Target";
        PerformanceDiaryEntry."Primary Directorate" := PlogLines."Primary Directorate";
        PerformanceDiaryEntry."Primary Department" := PlogLines."Primary Department";
        PerformanceDiaryEntry.Insert(true);
    end;


    procedure FnSendAppraisalReport(PerfomanceEvaluation: Record "Perfomance Evaluation")
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
        PPayableSetup: Record "Procurement Setup";
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
        IFSCommitteMembers: Record "IFS Tender Committee Member";
        IFS: Record "Standard Purchase Code";
        CommitteType: Record "Procurement Committee Types";
        CommitteMembers: Record "IFS Tender Committee";
        Employee: Record Employee;
    begin
        ///Notifying Employee Appraisal Report
        CompInfo.Get;
        HRSetup.Get;

        Employee.Reset;
        Employee.SetRange(Employee."No.", PerfomanceEvaluation."Employee No.");
        if Employee.FindSet then begin
            RequesterEmail := Employee."Company E-Mail";
            RequesterName := PerfomanceEvaluation."Employee Name";

            Window.Open('Notifying the employee...');

            WindowisOpen := true;


            Counter := Counter + 1;

            //Create message
            if HRSetup."E-Mail" = '' then
                Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
            SenderAddress := HRSetup."E-Mail";
            CompanyDetails := 'Dear,  ' + RequesterName;
            SenderMessage := '<BR>This is to notify you that your appraisal was successfully submitted: ' + PerfomanceEvaluation.No + '</BR>';
            LoginDetails := 'Attached herein, please find an e-copy of your appraisal report';
            //ProcNote:='<BR> If you require any assistance, please contact our Supply Chain Management team by Phone '+ HRSetup."Phone No."+' or vendor support team via Email: '+PPayableSetup."Default Proc Email Contact";
            FileDirectory := 'C:\DOCS\';
            FileName := 'AppraisalReport_' + PerfomanceEvaluation.No + '.pdf';

            PerfomanceEvaluation.Reset;
            PerfomanceEvaluation.SetRange(No, PerfomanceEvaluation.No);
            if PerfomanceEvaluation.FindSet then begin

                //Report.SaveAsPdf(80016, FileDirectory + FileName, PerfomanceEvaluation);

            end;

            //IF CustEmail='' THEN
            //EXIT;

            //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
            emailhdr := 'PERFORMANCE APPRAISAL ' + PerfomanceEvaluation.No;

            // cu400.Create(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
            // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

            // //cu400.AddCC(RequesterEmail);
            // cu400.AddAttachment(FileDirectory + FileName, FileName);

            // cu400.AppendToBody(ProcNote);


            // cu400.Send;
            SendingDate := Today;
            SendingTime := Time;




            Sleep(1000);
            Window.Close;

            //UNTIL IFSCommitteMembers.NEXT=0;
        end;
    end;
}

