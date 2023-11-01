report 80035 "Innovation Respnse  Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Innovation Respnse  Report.rdlc';

    dataset
    {
        dataitem("Innovation Solicitation";"Innovation Solicitation")
        {
            DataItemTableView = WHERE("Document Type"=CONST("Idea Response"));
            RequestFilterFields = "Document No";
            column(COMPANY;CompanyInfo.Name)
            {
            }
            column(logo;CompanyInfo.Picture)
            {
            }
            column(PostCode;CompanyInfo."Post Code")
            {
            }
            column(City;CompanyInfo.City)
            {
            }
            column(Address;CompanyInfo.Address)
            {
            }
            column(Address2;CompanyInfo."Address 2")
            {
            }
            column(DocumentNo_InnovationSolicitation;"Innovation Solicitation"."Document No")
            {
            }
            column(DocumentDate_InnovationSolicitation;"Innovation Solicitation"."Document Date")
            {
            }
            column(IdeaId;"Innovation Solicitation"."Invitation ID")
            {
            }
            column(IdeaOriginator_InnovationSolicitation;"Innovation Solicitation"."Idea Originator")
            {
            }
            column(Name_InnovationSolicitation;"Innovation Solicitation".Name)
            {
            }
            column(Description_InnovationSolicitation;"Innovation Solicitation".Description)
            {
            }
            column(InnovationCategory_InnovationSolicitation;"Innovation Solicitation"."Innovation Category")
            {
            }
            column(InnovationRatingTemplateID_InnovationSolicitation;"Innovation Solicitation"."Innovation Rating Template ID")
            {
            }
            column(InnovationLead_InnovationSolicitation;"Innovation Solicitation"."Innovation Lead")
            {
            }
            column(ExecutiveSummary_InnovationSolicitation;"Innovation Solicitation"."Executive Summary")
            {
            }
            column(IdeaSubmissionStartDate_InnovationSolicitation;"Innovation Solicitation"."Idea Submission Start Date")
            {
            }
            column(IdeaSubmissionEndDate_InnovationSolicitation;"Innovation Solicitation"."Idea Submission End Date")
            {
            }
            column(DirectorateID_InnovationSolicitation;"Innovation Solicitation"."Directorate ID")
            {
            }
            column(DepartmentID_InnovationSolicitation;"Innovation Solicitation"."Department ID")
            {
            }
            column(RegionID_InnovationSolicitation;"Innovation Solicitation"."Region ID")
            {
            }
            column(NoofInnovationIdeas_InnovationSolicitation;"Innovation Solicitation"."No. of Innovation Ideas")
            {
            }
            column(NoofInnovCommAppointments_InnovationSolicitation;"Innovation Solicitation"."No. of Innov Comm Appointments")
            {
            }
            column(NoofInnovEvaluations_InnovationSolicitation;"Innovation Solicitation"."No. of Innov Evaluations")
            {
            }
            column(NoofInnovationRewards_InnovationSolicitation;"Innovation Solicitation"."No. of Innovation Rewards")
            {
            }
            column(NoofInnovationProjects_InnovationSolicitation;"Innovation Solicitation"."No. of Innovation Projects")
            {
            }
            column(Status_InnovationSolicitation;"Innovation Solicitation".Status)
            {
            }
            column(Published_InnovationSolicitation;"Innovation Solicitation".Published)
            {
            }
            column(CreatedBy_InnovationSolicitation;"Innovation Solicitation"."Created By")
            {
            }
            column(CreatedDate_InnovationSolicitation;"Innovation Solicitation"."Created Date")
            {
            }
            column(CreatedTime_InnovationSolicitation;"Innovation Solicitation"."Created Time")
            {
            }
            column(DimensionSetID_InnovationSolicitation;"Innovation Solicitation"."Dimension Set ID")
            {
            }
            column(PortalStatus_InnovationSolicitation;"Innovation Solicitation"."Portal Status")
            {
            }
            column(NoSeries_InnovationSolicitation;"Innovation Solicitation"."No. Series")
            {
            }
            column(LeadName_InnovationSolicitation;"Innovation Solicitation"."Lead Name")
            {
            }
            dataitem("Innovation Solicitation Line";"Innovation Solicitation Line")
            {
                DataItemLink = "Document No"=FIELD("Document No");
                column(DocumentNo_InnovationSolicitationLine;"Innovation Solicitation Line"."Document No")
                {
                }
                column(DocumentType_InnovationSolicitationLine;"Innovation Solicitation Line"."Document Type")
                {
                }
                column(RecordType_InnovationSolicitationLine;"Innovation Solicitation Line"."Record Type")
                {
                }
                column(LineNo_InnovationSolicitationLine;"Innovation Solicitation Line"."Line No.")
                {
                }
                column(Description_InnovationSolicitationLine;"Innovation Solicitation Line".Description)
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

