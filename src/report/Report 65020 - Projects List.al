report 65020 "Projects List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Projects List.rdlc';

    dataset
    {
        dataitem("Project Contract Header";"Project Contract Header")
        {
            RequestFilterFields = "Project Contract No";
            column(ProjectContractNo_ProjectContractHeader;"Project Contract Header"."Project Contract No")
            {
            }
            column(GrantApplicationID_ProjectContractHeader;"Project Contract Header"."Grant Application ID")
            {
            }
            column(ExternalContractNo_ProjectContractHeader;"Project Contract Header"."External Contract No")
            {
            }
            column(Description_ProjectContractHeader;"Project Contract Header".Description)
            {
            }
            column(PrimaryContractCustomerNo_ProjectContractHeader;"Project Contract Header"."Primary Contract Customer No")
            {
            }
            column(ContactNo_ProjectContractHeader;"Project Contract Header"."Contact No.")
            {
            }
            column(Name_ProjectContractHeader;"Project Contract Header".Name)
            {
            }
            column(Address_ProjectContractHeader;"Project Contract Header".Address)
            {
            }
            column(Address2_ProjectContractHeader;"Project Contract Header"."Address 2")
            {
            }
            column(PostCode_ProjectContractHeader;"Project Contract Header"."Post Code")
            {
            }
            column(City_ProjectContractHeader;"Project Contract Header".City)
            {
            }
            column(CountryRegionCode_ProjectContractHeader;"Project Contract Header"."Country/Region Code")
            {
            }
            column(Contact_ProjectContractHeader;"Project Contract Header".Contact)
            {
            }
            column(PhoneNo_ProjectContractHeader;"Project Contract Header"."Phone No.")
            {
            }
            column(Email_ProjectContractHeader;"Project Contract Header".Email)
            {
            }
            column(ResponsibilityCenter_ProjectContractHeader;"Project Contract Header"."Responsibility Center")
            {
            }
            column(PrincipalInvestigator_ProjectContractHeader;"Project Contract Header"."Principal Investigator")
            {
            }
            column(GrantAdministrator_ProjectContractHeader;"Project Contract Header"."Grant Administrator")
            {
            }
            column(AwardType_ProjectContractHeader;"Project Contract Header"."Award Type")
            {
            }
            column(PrimaryFundingSponsorID_ProjectContractHeader;"Project Contract Header"."Primary Funding Sponsor ID")
            {
            }
            column(PrimarySponsorName_ProjectContractHeader;"Project Contract Header"."Primary Sponsor Name")
            {
            }
            column(ContractStartDate_ProjectContractHeader;"Project Contract Header"."Contract Start Date")
            {
            }
            column(ContractEndDate_ProjectContractHeader;"Project Contract Header"."Contract End Date")
            {
            }
            column(ContractStatus_ProjectContractHeader;"Project Contract Header"."Contract Status")
            {
            }
            column(ApprovalStatus_ProjectContractHeader;"Project Contract Header"."Approval Status")
            {
            }
            column(CreatedBy_ProjectContractHeader;"Project Contract Header"."Created By")
            {
            }
            column(CreatedOn_ProjectContractHeader;"Project Contract Header"."Created On")
            {
            }
            column(NoSeries_ProjectContractHeader;"Project Contract Header"."No. Series")
            {
            }
            column(CurrencyCode_ProjectContractHeader;"Project Contract Header"."Currency Code")
            {
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
}

