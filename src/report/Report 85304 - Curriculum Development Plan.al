report 85304 "Curriculum Development Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Curriculum Development Plan.rdlc';

    dataset
    {
        dataitem("Curriculum Development Header";"Curriculum Development Header")
        {
            column(Logo;CI.Picture)
            {
            }
            column(Code_CurriculumDevelopmentHeader;"Curriculum Development Header".Code)
            {
            }
            column(Description_CurriculumDevelopmentHeader;"Curriculum Development Header".Description)
            {
            }
            column(ExternalDocumentNo_CurriculumDevelopmentHeader;"Curriculum Development Header"."External Document No.")
            {
            }
            column(DocumentDate_CurriculumDevelopmentHeader;"Curriculum Development Header"."Document Date")
            {
            }
            column(CreatedBy_CurriculumDevelopmentHeader;"Curriculum Development Header"."Created By")
            {
            }
            column(CreatedOn_CurriculumDevelopmentHeader;"Curriculum Development Header"."Created On")
            {
            }
            column(PlanningStartDate_CurriculumDevelopmentHeader;"Curriculum Development Header"."Planning Start Date")
            {
            }
            column(PlanningEndDate_CurriculumDevelopmentHeader;"Curriculum Development Header"."Planning End Date")
            {
            }
            column(ResponsibleOfficer_CurriculumDevelopmentHeader;"Curriculum Development Header"."Responsible Officer")
            {
            }
            column(OfficerName_CurriculumDevelopmentHeader;"Curriculum Development Header"."Officer Name")
            {
            }
            column(ApprovalStatus_CurriculumDevelopmentHeader;"Curriculum Development Header"."Approval Status")
            {
            }
            column(DocumentStatus_CurriculumDevelopmentHeader;"Curriculum Development Header"."Document Status")
            {
            }
            column(NoofMinorReviewProjects_CurriculumDevelopmentHeader;"Curriculum Development Header"."No. of Minor Review Projects")
            {
            }
            column(NoofMajorReviewProjects_CurriculumDevelopmentHeader;"Curriculum Development Header"."No. of Major Review Projects")
            {
            }
            column(NoofNewSyllabusProjects_CurriculumDevelopmentHeader;"Curriculum Development Header"."No. of New Syllabus Projects")
            {
            }
            dataitem("Development Plan Lines";"Development Plan Lines")
            {
                column(DevelopmentHeader_DevelopmentPlanLines;"Development Plan Lines"."Development Header")
                {
                }
                column(LineNo_DevelopmentPlanLines;"Development Plan Lines"."Line No.")
                {
                }
                column(TaskType_DevelopmentPlanLines;"Development Plan Lines"."Task Type")
                {
                }
                column(Description_DevelopmentPlanLines;"Development Plan Lines".Description)
                {
                }
                column(SyllabusID_DevelopmentPlanLines;"Development Plan Lines"."Syllabus ID")
                {
                }
                column(PlanningStartDate_DevelopmentPlanLines;"Development Plan Lines"."Planning Start Date")
                {
                }
                column(PlanningEndDate_DevelopmentPlanLines;"Development Plan Lines"."Planning End Date")
                {
                }
                column(ResponsibleOfficer_DevelopmentPlanLines;"Development Plan Lines"."Responsible Officer")
                {
                }
                column(OfficerName_DevelopmentPlanLines;"Development Plan Lines"."Officer Name")
                {
                }
                column(ReviewRequisitionNo_DevelopmentPlanLines;"Development Plan Lines"."Review Requisition No.")
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

