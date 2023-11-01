#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80079 "Perfomance Evaluation"
{

    fields
    {
        field(1; No; Code[100])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::"Performance Appraisal" then begin
                    if "Evaluation Type" = "evaluation type"::"Standard Appraisal/Supervisor Score Only" then begin
                        if No <> xRec.No then begin
                            SPMSetup.Get;
                            NoSeriesMgt.TestManual(SPMSetup."Performance Evaluation Nos");
                            "No. Series" := '';
                        end;
                    end;
                    if "Evaluation Type" = "evaluation type"::"Self-Appraisal with Supervisor Score" then begin
                        if No <> xRec.No then begin
                            SPMSetup.Get;
                            NoSeriesMgt.TestManual(SPMSetup."Performance Evaluation Nos");
                            "No. Series" := '';
                        end;
                    end;
                    if "Evaluation Type" = "evaluation type"::"360-Degree/Group Appraisal" then begin
                        if No <> xRec.No then begin
                            SPMSetup.Get;
                            NoSeriesMgt.TestManual(SPMSetup."Performance Evaluation Nos");
                            "No. Series" := '';
                        end;
                    end;
                end;

                if "Document Type" = "document type"::"Performance Appeal" then begin
                    if No <> xRec.No then begin
                        SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."Performance Appeals No. Series");
                        "No. Series" := '';
                    end;
                end;
            end;
        }
        field(2; "Performance Mgt Plan ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = const("Performance Appraisal")) "Performance Management Plan".No;

            trigger OnValidate()
            begin
                PerformanceManagementPlan.Reset;
                PerformanceManagementPlan.SetRange(No, "Performance Mgt Plan ID");
                if PerformanceManagementPlan.Find('-') then begin
                    PerfomanceEvaluationTemplate.Reset;
                    PerfomanceEvaluationTemplate.SetRange(Code, PerformanceManagementPlan."HR Performance Template");
                    if PerfomanceEvaluationTemplate.Find('-') then begin
                        PerfomanceEvaluationTemplate.CalcFields("Total Allocated Weight (%)");
                        if ("Evaluation Type" = "evaluation type"::"Standard Appraisal/Supervisor Score Only") or ("Evaluation Type" = "evaluation type"::"Self-Appraisal with Supervisor Score") then
                            "Appraisal Template ID" := PerfomanceEvaluationTemplate."General A_Questionnaire"
                        else
                            "Appraisal Template ID" := PerfomanceEvaluationTemplate."Peer Reviewer FB_Questionnaire";
                        "Competency Template ID" := PerfomanceEvaluationTemplate."Default Competency A_Template";
                        "Performance Rating Scale" := PerfomanceEvaluationTemplate."Performance Rating Scale";
                        "Proficiency Rating Scale" := PerfomanceEvaluationTemplate."Proficiency Rating Scale";

                        PerformanceEvaluationWeight.Reset;
                        PerformanceEvaluationWeight.SetRange("Per_Evaluation Template ID", PerfomanceEvaluationTemplate.Code);
                        if PerformanceEvaluationWeight.Find('-') then begin
                            repeat
                                if PerformanceEvaluationWeight."Key Evaluation Section" = PerformanceEvaluationWeight."key evaluation section"::"Objectives & Outcomes" then begin
                                    "Objective & Outcome Weight %" := PerformanceEvaluationWeight."Total Weight (%)";
                                end;
                                if PerformanceEvaluationWeight."Key Evaluation Section" = PerformanceEvaluationWeight."key evaluation section"::"Competency & Company Values" then begin
                                    "Competency Weight %" := PerformanceEvaluationWeight."Total Weight (%)";
                                end;
                            until PerformanceEvaluationWeight.Next = 0;
                        end;
                        "Total Weight %" := PerfomanceEvaluationTemplate."Total Allocated Weight (%)";
                    end;
                end;
            end;
        }
        field(3; "Performance Task ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Plan Task"."Task Code" where("Performance Mgt Plan ID" = field("Performance Mgt Plan ID"),
                                                                       "Task Category" = const("Performance Review"),
                                                                       "Review Periods" = filter(<> ' '));

            trigger OnValidate()
            begin
                PerformancePlanTask.Reset;
                PerformancePlanTask.SetRange("Performance Mgt Plan ID", "Performance Mgt Plan ID");
                PerformancePlanTask.SetRange("Task Code", "Performance Task ID");
                if PerformancePlanTask.Find('-') then begin
                    PerformancePlanTask.TestField("Processing Start Date");
                    PerformancePlanTask.TestField("Processing Due Date");
                    PerformancePlanTask.TestField("Review Periods");

                    "Evaluation Start Date" := PerformancePlanTask."Processing Start Date";
                    "Evaluation End Date" := PerformancePlanTask."Processing Due Date";
                    "Review Period" := PerformancePlanTask."Review Periods";
                end;
            end;
        }
        field(4; "Employee No."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Employee No.") then begin
                    "Employee Name" := Emp.FullName;
                    "Current Designation" := Emp.Position;
                    "Current Grade" := Emp.Position1;
                    Directorate := Emp."Directorate Code";
                    Department := Emp."Department Code";
                    "Supervisor Staff No." := Emp.Supervisor;
                    Validate("Supervisor Staff No.");
                end;
            end;
        }
        field(5; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Current Designation"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Current Grade"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Supervisor Staff No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Supervisor Staff No.") then begin
                    "Supervisor Name" := Emp.FullName;
                end;
            end;
        }
        field(9; "Supervisor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Strategy Plan ID"; Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(11; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Evaluation Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Evaluation End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Appraisal Template ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Appraisal Questionnaire Temp";
        }
        field(16; "Evaluation Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Standard Appraisal/Supervisor Score Only,Self-Appraisal with Supervisor Score,360-Degree/Group Appraisal';
            OptionMembers = "Standard Appraisal/Supervisor Score Only","Self-Appraisal with Supervisor Score","360-Degree/Group Appraisal";
        }
        field(17; "Personal Scorecard ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Individual Scorecard"),
                                                                   "Responsible Employee No." = field("Employee No."),
                                                                   Status = const(Signed));

            trigger OnValidate()
            begin
                if PerfomanceContractHeader.Get("Personal Scorecard ID") then begin
                    "Annual Reporting Code" := PerfomanceContractHeader."Annual Reporting Code";
                end;
            end;
        }
        field(18; "Competency Template ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Competency Per Template".Code where("Global?" = const(true));
        }
        field(19; "General Assessment Template ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "360-Degree Assessment Temp ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Objective & Outcome Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Competency Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Total Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Performance Rating Scale"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Rating Scale".Code;
        }
        field(25; "Proficiency Rating Scale"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Competency Proficiency Scale".Code;
        }
        field(26; Directorate; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(27; Department; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(28; "Annual Reporting Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));
        }
        field(29; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(30; "Blocked?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Last Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Performance Appraisal,Performance Appeal';
            OptionMembers = "Performance Appraisal","Performance Appeal";
        }
        field(35; "Appealed Performance Eval id"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Evaluation" where("Document Type" = const("Performance Appraisal"));
        }
        field(36; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Evaluation,Submitted';
            OptionMembers = Draft,Evaluation,Submitted;
        }
        field(38; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Closed By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Closed On"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Review Period"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Total Final Weighted Score"; Decimal)
        {
            CalcFormula = sum("Objective Evaluation Result"."Final Weighted Line Score" where("Performance Evaluation ID" = field(No)));
            FieldClass = FlowField;
        }
        field(43; "Total Proficiency Score"; Decimal)
        {
            CalcFormula = sum("Proficiency Evaluation Result"."Raw Profiency Score" where("Performance Evaluation ID" = field(No)));
            FieldClass = FlowField;
        }
        field(44; "Total Raw Score"; Decimal)
        {
            CalcFormula = sum("Objective Evaluation Result"."Raw Performance Score" where("Performance Evaluation ID" = field(No)));
            FieldClass = FlowField;
        }
        field(45; "Employee Confirm"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Supervisor Confirm"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; "Performance Mgt Plan ID", "Performance Task ID")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document Type" = "document type"::"Performance Appraisal" then begin
            if "Evaluation Type" = "evaluation type"::"Standard Appraisal/Supervisor Score Only" then begin
                if No = '' then begin
                    SPMSetup.Get;
                    SPMSetup.TestField("Performance Evaluation Nos");
                    NoSeriesMgt.InitSeries(SPMSetup."Performance Evaluation Nos", xRec."No. Series", 0D, No, "No. Series");
                end;
            end;
            if "Evaluation Type" = "evaluation type"::"Self-Appraisal with Supervisor Score" then begin
                if No = '' then begin
                    SPMSetup.Get;
                    SPMSetup.TestField("Performance Evaluation Nos");
                    NoSeriesMgt.InitSeries(SPMSetup."Performance Evaluation Nos", xRec."No. Series", 0D, No, "No. Series");
                end;
            end;
            if "Evaluation Type" = "evaluation type"::"360-Degree/Group Appraisal" then begin
                if No = '' then begin
                    SPMSetup.Get;
                    SPMSetup.TestField("Performance Evaluation Nos");
                    NoSeriesMgt.InitSeries(SPMSetup."Performance Evaluation Nos", xRec."No. Series", 0D, No, "No. Series");
                end;
            end;
        end;

        if "Document Type" = "document type"::"Performance Appeal" then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("Performance Appeals No. Series");
                NoSeriesMgt.InitSeries(SPMSetup."Performance Appeals No. Series", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        "Created By" := UserId;
        "Created On" := Today;
        "Document Date" := Today;
    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
        ResponsibityC: Record "Responsibility Center";
        PerformancePlanTask: Record "Performance Plan Task";
        PerfomanceEvaluationTemplate: Record "Perfomance Evaluation Template";
        PerformanceManagementPlan: Record "Performance Management Plan";
        PerformanceEvaluationWeight: Record "Performance Evaluation Weight";
        PerfomanceContractHeader: Record "Perfomance Contract Header";
}

