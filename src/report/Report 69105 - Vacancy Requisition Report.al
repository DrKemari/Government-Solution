report 69105 "Vacancy Requisition Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Vacancy Requisition Report.rdlc';

    dataset
    {
        dataitem("Vacancy  Requisitions Table";"Vacancy  Requisitions Table")
        {
            column(No_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."No.")
            {
            }
            column(Description_VacancyRequisitionsTable;"Vacancy  Requisitions Table".Description)
            {
            }
            column(ManpowerPlanID_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."Manpower Plan ID")
            {
            }
            column(ManpowerPlanName_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."Manpower Plan Name")
            {
            }
            column(ResponsibilityCenter_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."Department Code")
            {
            }
            column(CenterName_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."Department Name")
            {
            }
            column(GlobalDimension1_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."Global Dimension 1")
            {
            }
            column(GlobalDimension1Name_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."Global Dimension 1 Name")
            {
            }
            column(GlobalDimension2_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."Global Dimension 2")
            {
            }
            column(GlobalDimension2Name_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."Global Dimension 2 Name")
            {
            }
            column(NoSeries_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."No. Series")
            {
            }
            column(Status_VacancyRequisitionsTable;"Vacancy  Requisitions Table".Status)
            {
            }
            column(CreatedBy_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."Created By")
            {
            }
            column(CreatedOn_VacancyRequisitionsTable;"Vacancy  Requisitions Table"."Created On")
            {
            }
            dataitem("Vacancy Requisition Lines";"Vacancy Requisition Lines")
            {
                DataItemLink = "Requisition No."=FIELD("No.");
                column(RequisitionNo_VacancyRequisitionLines;"Vacancy Requisition Lines"."Requisition No.")
                {
                }
                column(JobId_VacancyRequisitionLines;"Vacancy Requisition Lines"."Job Id")
                {
                }
                column(JobDescription_VacancyRequisitionLines;"Vacancy Requisition Lines"."Job Description")
                {
                }
                column(ResponsibilityCenter_VacancyRequisitionLines;"Vacancy Requisition Lines"."Responsibility Center")
                {
                }
                column(PlannedQty_VacancyRequisitionLines;"Vacancy Requisition Lines"."Planned Qty")
                {
                }
                column(RequestedQty_VacancyRequisitionLines;"Vacancy Requisition Lines"."Requested Qty")
                {
                }
                column(PlannedStartDate_VacancyRequisitionLines;"Vacancy Requisition Lines"."Planned Start Date")
                {
                }
                column(PlannedEndDate_VacancyRequisitionLines;"Vacancy Requisition Lines"."Planned End Date")
                {
                }
                column(ActualStartDate_VacancyRequisitionLines;"Vacancy Requisition Lines"."Actual Start Date")
                {
                }
                column(ActualEndDate_VacancyRequisitionLines;"Vacancy Requisition Lines"."Actual End Date")
                {
                }
                column(ApplicationsEndTime_VacancyRequisitionLines;"Vacancy Requisition Lines"."Applications End Time")
                {
                }
                column(ApplicationsEndDate_VacancyRequisitionLines;"Vacancy Requisition Lines"."Applications End Date")
                {
                }
                column(ApplicationsStartDate_VacancyRequisitionLines;"Vacancy Requisition Lines"."Applications Start Date")
                {
                }
                column(Advertise_VacancyRequisitionLines;"Vacancy Requisition Lines".Advertise)
                {
                }
                column(AdvertisedBy_VacancyRequisitionLines;"Vacancy Requisition Lines"."Advertised By")
                {
                }
                column(AdvertisedDate_VacancyRequisitionLines;"Vacancy Requisition Lines"."Advertised Date")
                {
                }
                column(RequisitionType_VacancyRequisitionLines;"Vacancy Requisition Lines"."Requisition Type")
                {
                }
                column(Status_VacancyRequisitionLines;"Vacancy Requisition Lines".Status)
                {
                }
                column(ClosedDate_VacancyRequisitionLines;"Vacancy Requisition Lines"."Closed Date")
                {
                }
                column(ClosedBy_VacancyRequisitionLines;"Vacancy Requisition Lines"."Closed By")
                {
                }
                column(CI_Picture;CI.Picture)
                {
                }
                column(CI_Address;CI.Address)
                {
                }
                column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
                {
                }
                column(CI_City;CI.City)
                {
                }
                column(CI_PhoneNo;CI."Phone No.")
                {
                }
                column(COMPANYNAME;CompanyName)
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

    trigger OnInitReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

