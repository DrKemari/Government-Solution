report 69552 "Succession Plan Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Succession Plan Report.rdlc';

    dataset
    {
        dataitem("Succession Plan Header";"Succession Plan Header")
        {
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
            column(Code_SuccessionPlanHeader;"Succession Plan Header".Code)
            {
            }
            column(Description_SuccessionPlanHeader;"Succession Plan Header".Description)
            {
            }
            column(Directorate_SuccessionPlanHeader;"Succession Plan Header".Directorate)
            {
            }
            column(Department_SuccessionPlanHeader;"Succession Plan Header".Department)
            {
            }
            column(CreatedBy_SuccessionPlanHeader;"Succession Plan Header"."Created By")
            {
            }
            column(DocumentDate_SuccessionPlanHeader;"Succession Plan Header"."Document Date")
            {
            }
            column(Status_SuccessionPlanHeader;"Succession Plan Header".Status)
            {
            }
            column(NoSeries_SuccessionPlanHeader;"Succession Plan Header"."No. Series")
            {
            }
            dataitem("Succession Plan Lines";"Succession Plan Lines")
            {
                DataItemLink = "Document No"=FIELD(Code);
                column(DocumentNo_SuccessionPlanLines;"Succession Plan Lines"."Document No")
                {
                }
                column(EmployeeNo_SuccessionPlanLines;"Succession Plan Lines"."Employee No")
                {
                }
                column(EmployeeName_SuccessionPlanLines;"Succession Plan Lines"."Employee Name")
                {
                }
                column(CurrentPositionID_SuccessionPlanLines;"Succession Plan Lines"."Current Position ID")
                {
                }
                column(ProjectedPositionID_SuccessionPlanLines;"Succession Plan Lines"."Projected Position ID")
                {
                }
                column(PlannedStartDate_SuccessionPlanLines;"Succession Plan Lines"."Planned Start Date")
                {
                }
                column(PlannedEndDate_SuccessionPlanLines;"Succession Plan Lines"."Planned End Date")
                {
                }
                column(Directorate_SuccessionPlanLines;"Succession Plan Lines".Directorate)
                {
                }
                column(Department_SuccessionPlanLines;"Succession Plan Lines".Department)
                {
                }
                column(Mentor_SuccessionPlanLines;"Succession Plan Lines".Mentor)
                {
                }
                column(DefaultMentorshipTemplate_SuccessionPlanLines;"Succession Plan Lines"."Default Mentorship Template")
                {
                }
                dataitem("Succession Plan Initiatives";"Succession Plan Initiatives")
                {
                    DataItemLink = "Document No"=FIELD("Document No"),"Employee No"=FIELD("Employee No");
                    column(DocumentNo_SuccessionPlanInitiatives;"Succession Plan Initiatives"."Document No")
                    {
                    }
                    column(EmployeeNo_SuccessionPlanInitiatives;"Succession Plan Initiatives"."Employee No")
                    {
                    }
                    column(EntryNo_SuccessionPlanInitiatives;"Succession Plan Initiatives"."Entry No")
                    {
                    }
                    column(InitiativeCategory_SuccessionPlanInitiatives;"Succession Plan Initiatives"."Initiative Category")
                    {
                    }
                    column(Initiative_SuccessionPlanInitiatives;"Succession Plan Initiatives".Initiative)
                    {
                    }
                    column(PlannedStartDate_SuccessionPlanInitiatives;"Succession Plan Initiatives"."Planned Start Date")
                    {
                    }
                    column(PlannedEndDate_SuccessionPlanInitiatives;"Succession Plan Initiatives"."Planned End Date")
                    {
                    }
                    column(ResponsibleOfficer_SuccessionPlanInitiatives;"Succession Plan Initiatives"."Responsible Officer")
                    {
                    }
                    column(Status_SuccessionPlanInitiatives;"Succession Plan Initiatives".Status)
                    {
                    }
                    column(ActualStartDate_SuccessionPlanInitiatives;"Succession Plan Initiatives"."Actual Start Date")
                    {
                    }
                    column(ActualEndDate_SuccessionPlanInitiatives;"Succession Plan Initiatives"."Actual End Date")
                    {
                    }
                    column(Remarks_SuccessionPlanInitiatives;"Succession Plan Initiatives".Remarks)
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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        "Position ID": Code[10];
}

