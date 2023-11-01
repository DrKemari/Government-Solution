report 65017 FOA
{
    DefaultLayout = RDLC;
    RDLCLayout = './FOA.rdlc';

    dataset
    {
        dataitem("Funding Opportunity";"Funding Opportunity")
        {
            RequestFilterFields = "Call No.";
            column(CallNo_FundingOpportunity;"Funding Opportunity"."Call No.")
            {
            }
            column(OrganizationID_FundingOpportunity;"Funding Opportunity"."Organization ID")
            {
            }
            column(IssuingOrganization_FundingOpportunity;"Funding Opportunity"."Issuing Organization")
            {
            }
            column(CallType_FundingOpportunity;"Funding Opportunity"."Call Type")
            {
            }
            column(ExternalAnnouncementNo_FundingOpportunity;"Funding Opportunity"."External Announcement No")
            {
            }
            column(ReleaseDate_FundingOpportunity;"Funding Opportunity"."Release Date")
            {
            }
            column(OpeningDate_FundingOpportunity;"Funding Opportunity"."Opening Date")
            {
            }
            column(ApplicationDueDate_FundingOpportunity;"Funding Opportunity"."Application Due Date")
            {
            }
            column(Applicationdate_FundingOpportunity;"Funding Opportunity"."Application date")
            {
            }
            column(ExpirationDate_FundingOpportunity;"Funding Opportunity"."Expiration Date")
            {
            }
            column(HomePage_FundingOpportunity;"Funding Opportunity"."Home Page")
            {
            }
            column(Status_FundingOpportunity;"Funding Opportunity".Status)
            {
            }
            column(NoSeries_FundingOpportunity;"Funding Opportunity"."No. Series")
            {
            }
            column(DocumentDate_FundingOpportunity;"Funding Opportunity"."Document Date")
            {
            }
            column(CreatedBy_FundingOpportunity;"Funding Opportunity"."Created By")
            {
            }
            column(OpportunityAmount_FundingOpportunity;"Funding Opportunity"."Opportunity Amount")
            {
            }
            column(OpportunityAmountLCY_FundingOpportunity;"Funding Opportunity"."Opportunity Amount(LCY)")
            {
            }
            column(CurrencyCode_FundingOpportunity;"Funding Opportunity"."Currency Code")
            {
            }
            column(TitleDetails_FundingOpportunity;"Funding Opportunity"."Title Details")
            {
            }
            column(Title_FundingOpportunity;"Funding Opportunity".Title)
            {
            }
            column(GrantorNo_FundingOpportunity;"Funding Opportunity"."Grantor No")
            {
            }
            column(PostingDate_FundingOpportunity;"Funding Opportunity"."Posting Date")
            {
            }
            column(CurrencyFactor_FundingOpportunity;"Funding Opportunity"."Currency Factor")
            {
            }
            column(OpportunityStatus_FundingOpportunity;"Funding Opportunity"."Opportunity Status")
            {
            }
            column(DonorType_FundingOpportunity;"Funding Opportunity"."Donor Type")
            {
            }
            column(GrantType_FundingOpportunity;"Funding Opportunity"."Grant Type")
            {
            }
            column(GrantClass_FundingOpportunity;"Funding Opportunity"."Grant Class")
            {
            }
            column(ProjectDuration_FundingOpportunity;"Funding Opportunity"."Project Duration")
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

