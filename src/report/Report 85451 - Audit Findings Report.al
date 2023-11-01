report 85451 "Audit Findings Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Audit Findings Report.rdlc';

    dataset
    {
        dataitem("Audit Assurance Header";"Audit Assurance Header")
        {
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_AuditAssuranceHeader;"Audit Assurance Header"."Document No.")
            {
            }
            column(EngagementCategory_AuditAssuranceHeader;"Audit Assurance Header"."Engagement Category")
            {
            }
            column(LeadAuditorID_AuditAssuranceHeader;"Audit Assurance Header"."Lead Auditor ID")
            {
            }
            column(LeadAuditorEmail_AuditAssuranceHeader;"Audit Assurance Header"."Lead Auditor Email")
            {
            }
            column(PlannedStartDate_AuditAssuranceHeader;"Audit Assurance Header"."Planned Start Date")
            {
            }
            column(PlannedEndDate_AuditAssuranceHeader;"Audit Assurance Header"."Planned End Date")
            {
            }
            column(GlobalDimensionDim1Code_AuditAssuranceHeader;"Audit Assurance Header"."Global Dimension Dim 1 Code")
            {
            }
            column(GlobalDimensionDim2Code_AuditAssuranceHeader;"Audit Assurance Header"."Global Dimension  Dim 2 Code")
            {
            }
            column(DimensionSetID_AuditAssuranceHeader;"Audit Assurance Header"."Dimension Set ID")
            {
            }
            column(ExamSitting_AuditAssuranceHeader;"Audit Assurance Header"."Exam Sitting")
            {
            }
            column(DocumentDate_AuditAssuranceHeader;"Audit Assurance Header"."Document Date")
            {
            }
            column(CreatedBy_AuditAssuranceHeader;"Audit Assurance Header"."Created By")
            {
            }
            column(CreatedOn_AuditAssuranceHeader;"Audit Assurance Header"."Created On")
            {
            }
            column(AuditPlanID_AuditAssuranceHeader;"Audit Assurance Header"."Audit Plan ID")
            {
            }
            column(AuditPlanItem_AuditAssuranceHeader;"Audit Assurance Header"."Audit Plan Item")
            {
            }
            dataitem("Audit Report Lines";"Audit Report Lines")
            {
                DataItemLink = "Header No."=FIELD("Document No.");
                column(HeaderNo_AuditReportLines;"Audit Report Lines"."Header No.")
                {
                }
                column(SituationFound_AuditReportLines;"Audit Report Lines"."Situation Found")
                {
                }
                column(Recommendation_AuditReportLines;"Audit Report Lines".Recommendation)
                {
                }
                column(EntryNo_AuditReportLines;"Audit Report Lines"."Entry No.")
                {
                }
                column(Examination_AuditReportLines;"Audit Report Lines".Examination)
                {
                }
                column(ExaminationName_AuditReportLines;"Audit Report Lines"."Examination Name")
                {
                }
                column(EvidenceandAnalysis_AuditReportLines;"Audit Report Lines"."Evidence and Analysis")
                {
                }
                column(Causes_AuditReportLines;"Audit Report Lines".Causes)
                {
                }
                column(Effect_AuditReportLines;"Audit Report Lines".Effect)
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

