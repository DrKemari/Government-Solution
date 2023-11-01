report 69107 "Job advert Template"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Job advert Template.rdlc';

    dataset
    {
        dataitem("Job Advert Header";"Job Advert Header")
        {
            column(CompanyLogo;CompanyInfo.Picture)
            {
            }
            column(CompanyName;CompanyInfo.Name)
            {
            }
            column(CompanyAddress;CompanyInfo.Address)
            {
            }
            column(CompanyAddress2;CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode;CompanyInfo."Post Code")
            {
            }
            column(CompanyCity;CompanyInfo.City)
            {
            }
            column(CompanyPhone;CompanyInfo."Phone No. 2")
            {
            }
            column(CompanyFax;CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail;CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite;CompanyInfo."Home Page")
            {
            }
            column(Code_JobAdvertHeader;"Job Advert Header".Code)
            {
            }
            column(RequisitionNo_JobAdvertHeader;"Job Advert Header"."Requisition No.")
            {
            }
            column(Description_JobAdvertHeader;"Job Advert Header".Description)
            {
            }
            column(Status_JobAdvertHeader;"Job Advert Header".Status)
            {
            }
            column(DocumentDate_JobAdvertHeader;"Job Advert Header"."Document Date")
            {
            }
            column(CreatedBy_JobAdvertHeader;"Job Advert Header"."Created By")
            {
            }
            column(Published_JobAdvertHeader;"Job Advert Header".Published)
            {
            }
            column(NoSeries_JobAdvertHeader;"Job Advert Header"."No. Series")
            {
            }
            column(ApplicationsEndTime_JobAdvertHeader;"Job Advert Header"."Applications End Time")
            {
            }
            column(ApplicationsEndDate_JobAdvertHeader;"Job Advert Header"."Applications End Date")
            {
            }
            column(ApplicationsStartDate_JobAdvertHeader;"Job Advert Header"."Applications Start Date")
            {
            }
            column(CompanyProfile_JobAdvertHeader;"Job Advert Header"."Company Profile")
            {
            }
            dataitem("Vacancy Requisition Lines";"Vacancy Requisition Lines")
            {
                column(JobId_VacancyRequisitionLines;"Vacancy Requisition Lines"."Job Id")
                {
                }
                column(JobDescription_VacancyRequisitionLines;"Vacancy Requisition Lines"."Job Description")
                {
                }
                dataitem("Position Requirements";"Position Requirements")
                {
                    DataItemLink = "Job Id"=FIELD("Job Id");
                    column(JobId_PositionRequirements;"Position Requirements"."Job Id")
                    {
                    }
                    column(QualificationType_PositionRequirements;"Position Requirements"."Qualification Type")
                    {
                    }
                    column(JobRequirements_PositionRequirements;"Position Requirements"."Job Requirements")
                    {
                    }
                }
                dataitem("Position Responsibilities";"Position Responsibilities")
                {
                    DataItemLink = "Job ID"=FIELD("Job Id");
                    column(JobID_PositionResponsibilities;"Position Responsibilities"."Job ID")
                    {
                    }
                    column(Responsibility_PositionResponsibilities;"Position Responsibilities".Responsibility)
                    {
                    }
                    column(Remarks_PositionResponsibilities;"Position Responsibilities".Remarks)
                    {
                    }
                    column(EntryNo_PositionResponsibilities;"Position Responsibilities"."Entry No.")
                    {
                    }
                    column(Type_PositionResponsibilities;"Position Responsibilities".Type)
                    {
                    }
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

    var
        CompanyInfo: Record "Company Information";
        CI: Record "Company Information";
}

