#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80132 "Self-Supervisor Appraisal"
{
    PageType = Card;
    SourceTable = "Perfomance Evaluation";
    SourceTableView = where("Document Type" = const("Performance Appraisal"),
                            "Document Status" = const(Draft));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Task ID"; Rec."Performance Task ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Start Date"; Rec."Evaluation Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation End Date"; Rec."Evaluation End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Appraisal Template ID"; Rec."Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Grade"; Rec."Current Grade")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Staff No."; Rec."Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("General Assessment Template ID"; Rec."General Assessment Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Objective & Outcome Weight %"; Rec."Objective & Outcome Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Competency Weight %"; Rec."Competency Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Weight %"; Rec."Total Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Proficiency Rating Scale"; Rec."Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Objectives and Outcomes"; "Objectives and Outcomes-Self")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                ApplicationArea = Basic;
            }
            part(Control39; "Proficiency Evalulation-Self")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
        area(creation)
        {
            action("Suggest Objectives & Outcomes")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                    PCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                    if PCObjective.FindFirst then begin
                        repeat

                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                            ObjectiveOutcome.Insert(true);

                        until PCObjective.Next = 0;

                    end;
                    Message('Objectives and Outcomes Populated Successfully');
                end;
            }
            action("Load Competency Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    CompetencyLines.Reset;
                    CompetencyLines.SetRange("Competency Template ID", Rec."Competency Template ID");
                    if CompetencyLines.Find('-') then begin
                        repeat
                            ProEvaluation.Init;
                            ProEvaluation."Performance Evaluation ID" := Rec.No;
                            ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                            ProEvaluation."Competency Template ID" := Rec."Competency Template ID";
                            ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                            ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                            ProEvaluation.Description := CompetencyLines.Description;
                            ProEvaluation."Profiency Rating Scale" := Rec."Proficiency Rating Scale";
                            ProEvaluation."Weight %" := CompetencyLines."Weight %";
                            ProEvaluation.Insert(true);
                        until CompetencyLines.Next = 0;
                    end;
                    Message('Competency Templates loaded Successfully');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                //ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Performance Mgt Plan ID");
                    Rec.TestField("Performance Task ID");
                    Rec.TestField("Employee No.");
                    Rec.TestField("Personal Scorecard ID");
                    Rec.TestField("Supervisor Staff No.");
                    Rec.TestField("Annual Reporting Code");
                    Rec.TestField(Closed, false);


                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.Find('-') then begin
                        repeat
                            ObjectiveOutcome.TestField("Target Qty");
                            ObjectiveOutcome.TestField("Self-Review Qty");
                        until ObjectiveOutcome.Next = 0;
                    end;

                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID", Rec.No);
                    if ProEvaluation.Find('-') then begin
                        repeat
                            ProEvaluation.TestField("Self-Review Qty");
                            ProEvaluation.TestField("Target Qty");
                        until ProEvaluation.Next = 0;
                    end;


                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* //if //ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      //ApprovalsMgmt.OnSendGFAForApproval(Rec);*/


                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec."Document Status" := Rec."document status"::Evaluation;
                    Rec.Modify;

                    Message('Document has been approved Automatically');

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                //ApprovalsMgmt.""(Rec);*/
                                                                                                // "Approval Status":="Approval Status"::Open;
                    Rec.Modify;
                    Message('Document has been Re-Opened');

                end;
            }
            action("Suggest Objectives & Outcomes2")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Suggest Objectives & Outcomes?', true) then
                        Error('Objectives & Outcomes not Suggested');
                    SPMGeneralSetup.Get;
                    SPMGeneralSetup.TestField("Appraisal Based On");

                    if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Direct Input" then begin
                        SPMGeneralSetup.Get();
                        if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                            PCObjective.Reset;
                            PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            if PCObjective.FindFirst then begin
                                repeat
                                    PCObjective.TestField("Due Date");
                                until PCObjective.Next = 0;
                            end;

                            PCObjective.Reset;
                            PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            PCObjective.TestField("Due Date");
                            PCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if PCObjective.FindFirst then begin
                                repeat
                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                                    ObjectiveOutcome.Insert(true);
                                until PCObjective.Next = 0;
                            end;

                            SecondaryPCObjective.Reset;
                            SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            if SecondaryPCObjective.FindFirst then begin
                                repeat
                                    SecondaryPCObjective.TestField("Due Date");
                                until SecondaryPCObjective.Next = 0;
                            end;

                            SecondaryPCObjective.Reset;
                            SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            SecondaryPCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if SecondaryPCObjective.FindFirst then begin
                                repeat
                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
                                    ObjectiveOutcome.Validate("Performance Rating Scale");
                                    ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                                    ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                                    ObjectiveOutcome.Insert(true);
                                until SecondaryPCObjective.Next = 0;
                            end;
                        end;

                        if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                            PCJobDescription.Reset;
                            PCJobDescription.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            PCJobDescription.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if PCJobDescription.FindFirst then begin
                                repeat
                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                                    ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
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
                            PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            if PCObjective.FindFirst then begin
                                repeat
                                    PCObjective.TestField("Due Date");
                                until PCObjective.Next = 0;
                            end;

                            PCObjective.Reset;
                            PCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            //PCObjective.TESTFIELD("Due Date");
                            PCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if PCObjective.FindFirst then begin
                                repeat
                                    AchievedTarget := 0;
                                    PlogLines.Reset;
                                    PlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
                                    PlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
                                    PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    PlogLines.CalcSums("Achieved Target");
                                    AchievedTarget := PlogLines."Achieved Target";

                                    if AchievedTarget = 0 then
                                        Error('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first', Rec."Evaluation Start Date", Rec."Evaluation End Date");

                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
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
                            SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            if SecondaryPCObjective.FindFirst then begin
                                repeat
                                    SecondaryPCObjective.TestField("Due Date");
                                until SecondaryPCObjective.Next = 0;
                            end;

                            SecondaryPCObjective.Reset;
                            SecondaryPCObjective.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            SecondaryPCObjective.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if SecondaryPCObjective.FindFirst then begin
                                repeat
                                    AchievedTarget := 0;
                                    PlogLines.Reset;
                                    PlogLines.SetRange("Personal Scorecard ID", SecondaryPCObjective."Workplan No.");
                                    PlogLines.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                                    PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    PlogLines.CalcSums("Achieved Target");
                                    AchievedTarget := PlogLines."Achieved Target";

                                    if AchievedTarget = 0 then
                                        Error('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first', Rec."Evaluation Start Date", Rec."Evaluation End Date");


                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                                    ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
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
                            PCJobDescription.SetRange("Workplan No.", Rec."Personal Scorecard ID");
                            PCJobDescription.SetRange("Due Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                            if PCJobDescription.FindFirst then begin
                                repeat
                                    AchievedTarget := 0;
                                    PlogLines.Reset;
                                    PlogLines.SetRange("Personal Scorecard ID", PCJobDescription."Workplan No.");
                                    PlogLines.SetRange("Initiative No.", Format(PCJobDescription."Line Number"));
                                    PlogLines.SetRange("Achieved Date", Rec."Evaluation Start Date", Rec."Evaluation End Date");
                                    PlogLines.CalcSums("Achieved Target");
                                    AchievedTarget := PlogLines."Achieved Target";

                                    if AchievedTarget = 0 then
                                        Error('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first', Rec."Evaluation Start Date", Rec."Evaluation End Date");

                                    ObjectiveOutcome.Init;
                                    ObjectiveOutcome."Performance Evaluation ID" := Rec.No;
                                    ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                                    ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                                    ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                                    ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                                    ObjectiveOutcome."Primary Directorate" := Rec.Directorate;
                                    ObjectiveOutcome."Primary Department" := Rec.Department;
                                    ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
                                    ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                                    ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                                    ObjectiveOutcome."Performance Rating Scale" := Rec."Performance Rating Scale";
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


                    Message('Objectives and Outcomes Populated Successfully');
                end;
            }
            action("Load Competency Templates2")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to load Competency Templates', true) then
                        Error('Competency Templates not loaded');
                    CompetencyLines.Reset;
                    CompetencyLines.SetRange("Competency Template ID", Rec."Competency Template ID");
                    if CompetencyLines.Find('-') then begin
                        repeat
                            ProEvaluation.Init;
                            ProEvaluation."Performance Evaluation ID" := Rec.No;
                            ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                            ProEvaluation."Competency Template ID" := Rec."Competency Template ID";
                            ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                            ProEvaluation.Validate("Competency Code");
                            ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                            //      ProEvaluation."Competency Category":CompetencyLines."Competency Category";
                            ProEvaluation.Description := CompetencyLines.Description;
                            ProEvaluation."Profiency Rating Scale" := Rec."Proficiency Rating Scale";
                            ProEvaluation."Target Qty" := CompetencyLines."Weight %";
                            ProEvaluation."Weight %" := CompetencyLines."Weight %";
                            ProEvaluation.Insert(true);
                        until CompetencyLines.Next = 0;
                    end;
                    Message('Competency Templates loaded Successfully');
                    /*
                    CompetencyLines.RESET;
                    CompetencyLines.SETRANGE("Competency Template ID","Competency Template ID");
                    IF CompetencyLines.FIND('-') THEN BEGIN
                      REPEAT
                          ProEvaluation.INIT;
                          ProEvaluation."Performance Evaluation ID":=No;
                          ProEvaluation."Line No":=FnGetLastLineNoB+1;
                          ProEvaluation."Competency Template ID":="Competency Template ID";
                          ProEvaluation."Competency Code":=CompetencyLines."Competency Code";
                          ProEvaluation.VALIDATE("Competency Code");
                          ProEvaluation."Competency Category":=CompetencyLines."Competency Category";
                          ProEvaluation.Description:=CompetencyLines.Description;
                          ProEvaluation."Profiency Rating Scale":="Proficiency Rating Scale";
                          ProEvaluation."Target Qty":=CompetencyLines."Weight %";
                          ProEvaluation."Weight %":=CompetencyLines."Weight %";
                          ProEvaluation.INSERT(TRUE);
                        UNTIL CompetencyLines.NEXT=0;
                     END;
                       MESSAGE('Competency Templates loaded Successfully');
                    */

                end;
            }
            separator(Action48)
            {
            }
            action("Print Appraisal Report2")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80016, true, true, Rec)
                end;
            }
            separator(Action46)
            {
            }
            action(Approvals2)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Send Approval Request2")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                //ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Performance Mgt Plan ID");
                    Rec.TestField("Performance Task ID");
                    Rec.TestField("Employee No.");
                    Rec.TestField("Personal Scorecard ID");
                    Rec.TestField("Supervisor Staff No.");
                    Rec.TestField("Annual Reporting Code");
                    Rec.TestField(Closed, false);


                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.Find('-') then begin
                        repeat
                            ObjectiveOutcome.TestField("Target Qty");
                        until ObjectiveOutcome.Next = 0;
                    end;

                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID", Rec.No);
                    if ProEvaluation.Find('-') then begin
                        repeat
                            ProEvaluation.TestField("Target Qty");
                        until ProEvaluation.Next = 0;
                    end;


                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* //if //ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      //ApprovalsMgmt.OnSendGFAForApproval(Rec);*/


                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec."Document Status" := Rec."document status"::Evaluation;
                    Rec.Modify;

                    Message('Document has been approved Automatically');

                end;
            }
            action("Cancel Approval Request2")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                //ApprovalsMgmt.""(Rec);*/
                                                                                                // "Approval Status":="Approval Status"::Open;
                    Rec.Modify;
                    Message('Document has been Re-Opened');

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"Self-Appraisal with Supervisor Score";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"Self-Appraisal with Supervisor Score";
    end;

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
}

#pragma implicitwith restore

