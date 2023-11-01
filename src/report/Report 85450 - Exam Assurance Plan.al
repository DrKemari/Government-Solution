report 85450 "Exam Assurance Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Exam Assurance Plan.rdlc';

    dataset
    {
        dataitem("Exam Audit Plan";"Exam Audit Plan")
        {
            column(Logo;CI.Picture)
            {
            }
            column(AuditPlanID_ExamAuditPlan;"Exam Audit Plan"."Audit Plan ID")
            {
            }
            column(DocumentDate_ExamAuditPlan;"Exam Audit Plan"."Document Date")
            {
            }
            column(YearCode_ExamAuditPlan;"Exam Audit Plan"."Year Code")
            {
            }
            column(PlanningStartDate_ExamAuditPlan;"Exam Audit Plan"."Planning Start Date")
            {
            }
            column(PlanningEndDate_ExamAuditPlan;"Exam Audit Plan"."Planning End Date")
            {
            }
            column(CorporateStrategicPlanID_ExamAuditPlan;"Exam Audit Plan"."Corporate Strategic Plan ID")
            {
            }
            column(BudgetCode_ExamAuditPlan;"Exam Audit Plan"."Budget Code")
            {
            }
            column(BudgetName_ExamAuditPlan;"Exam Audit Plan"."Budget Name")
            {
            }
            column(Description_ExamAuditPlan;"Exam Audit Plan".Description)
            {
            }
            column(OverallPurpose_ExamAuditPlan;"Exam Audit Plan"."Overall Purpose")
            {
            }
            column(Blocked_ExamAuditPlan;"Exam Audit Plan".Blocked)
            {
            }
            column(NoofPlannedProcesses_ExamAuditPlan;"Exam Audit Plan"."No. of Planned Processes")
            {
            }
            column(Status_ExamAuditPlan;"Exam Audit Plan".Status)
            {
            }
            column(CreatedBy_ExamAuditPlan;"Exam Audit Plan"."Created By")
            {
            }
            column(CreatedDatetime_ExamAuditPlan;"Exam Audit Plan"."Created Datetime")
            {
            }
            column(DimensionSetID_ExamAuditPlan;"Exam Audit Plan"."Dimension Set ID")
            {
            }
            column(NoSeries_ExamAuditPlan;"Exam Audit Plan"."No. Series")
            {
            }
            dataitem("Exam Audit Lines";"Exam Audit Lines")
            {
                DataItemLink = "Audit Plan ID"=FIELD("Audit Plan ID");
                column(AuditPlanID_ExamAuditLines;"Exam Audit Lines"."Audit Plan ID")
                {
                }
                column(EngagementLineNo_ExamAuditLines;"Exam Audit Lines"."Engagement Line No.")
                {
                }
                column(EngagementCategory_ExamAuditLines;"Exam Audit Lines"."Engagement Category")
                {
                }
                column(LeadAuditorID_ExamAuditLines;"Exam Audit Lines"."Lead Officer ID")
                {
                }
                column(LeadAuditorName_ExamAuditLines;"Exam Audit Lines"."Lead Officer Name")
                {
                }
                column(PlannedStartDate_ExamAuditLines;"Exam Audit Lines"."Planned Start Date")
                {
                }
                column(PlannedEndDate_ExamAuditLines;"Exam Audit Lines"."Planned End Date")
                {
                }
                column(GlobalDimensionDim1Code_ExamAuditLines;"Exam Audit Lines"."Global Dimension Dim 1 Code")
                {
                }
                column(GlobalDimensionDim2Code_ExamAuditLines;"Exam Audit Lines"."Global Dimension  Dim 2 Code")
                {
                }
                column(DimensionSetID_ExamAuditLines;"Exam Audit Lines"."Dimension Set ID")
                {
                }
                column(ExamSitting_ExamAuditLines;"Exam Audit Lines"."Exam Sitting")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

