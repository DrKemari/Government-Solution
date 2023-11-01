report 85454 "Audit Actions Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Audit Actions Report.rdlc';

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
            dataitem("Audit Action Lines";"Audit Action Lines")
            {
                DataItemLink = "Header No."=FIELD("Document No.");
                column(HeaderNo_AuditActionLines;"Audit Action Lines"."Header No.")
                {
                }
                column(EntryNo_AuditActionLines;"Audit Action Lines"."Entry No.")
                {
                }
                column(Recommendation_AuditActionLines;"Audit Action Lines".Recommendation)
                {
                }
                column(Action_AuditActionLines;"Audit Action Lines".Action)
                {
                }
                column(StartDate_AuditActionLines;"Audit Action Lines"."Start Date")
                {
                }
                column(AuditReportNo_AuditActionLines;"Audit Action Lines"."Audit Report No.")
                {
                }
                column(AuditReportItem_AuditActionLines;"Audit Action Lines"."Audit Report Item")
                {
                }
                column(ActualCompletionDate_AuditActionLines;"Audit Action Lines"."Actual Completion Date")
                {
                }
                column(CompletedBy_AuditActionLines;"Audit Action Lines"."Completed By")
                {
                }
                column(EndDate_AuditActionLines;"Audit Action Lines"."End Date")
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

