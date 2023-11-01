report 80014 Policy
{
    DefaultLayout = RDLC;
    RDLCLayout = './Policy.rdlc';

    dataset
    {
        dataitem(Policy;Policy)
        {
            RequestFilterFields = "No. Series";
            column(Code_Policy;Policy.Code)
            {
            }
            column(Type_Policy;Policy.Type)
            {
            }
            column(PolicyName_Policy;Policy."Policy Name")
            {
            }
            column(Summary_Policy;Policy.Summary)
            {
            }
            column(AppliesTo_Policy;Policy."Applies-To")
            {
            }
            column(ResponsibilityCenter_Policy;Policy."Responsibility Center")
            {
            }
            column(ResponsiblePerson_Policy;Policy."Responsible Person")
            {
            }
            column(Name_Policy;Policy.Name)
            {
            }
            column(Title_Policy;Policy.Title)
            {
            }
            column(DateApproved_Policy;Policy."Date Approved")
            {
            }
            column(CurrentVersionNo_Policy;Policy."Current Version No")
            {
            }
            column(LastReviewDate_Policy;Policy."Last Review Date")
            {
            }
            column(NoSeries_Policy;Policy."No. Series")
            {
            }
            column(ApprovalStatus_Policy;Policy."Approval Status")
            {
            }
            column(PolicyDevInstitutionID_Policy;Policy."Policy Dev Institution ID")
            {
            }
            column(PolicyGoal_Policy;Policy."Policy Goal")
            {
            }
            column(ExternalRefNo_Policy;Policy."External Ref No")
            {
            }
            column(PolicyOverview_Policy;Policy."Policy Overview")
            {
            }
            column(PolicyPurpose_Policy;Policy."Policy Purpose")
            {
            }
            column(PolicyRationale_Policy;Policy."Policy Rationale")
            {
            }
            column(PolicyScope_Policy;Policy."Policy Scope")
            {
            }
            column(PrimaryDirectorate_Policy;Policy."Primary Directorate")
            {
            }
            column(PrimaryDepartment_Policy;Policy."Primary Department")
            {
            }
            column(ProcessOwnerID_Policy;Policy."Process Owner ID")
            {
            }
            column(ProcessOwnerName_Policy;Policy."Process Owner Name")
            {
            }
            column(ProcessOwnerTitle_Policy;Policy."Process Owner Title")
            {
            }
            column(ApprovedBy_Policy;Policy."Approved By")
            {
            }
            column(ApproverName_Policy;Policy."Approver Name")
            {
            }
            column(PolicyStage_Policy;Policy."Policy Stage")
            {
            }
            column(NoofPolicyRevisions_Policy;Policy."No. of Policy Revisions")
            {
            }
            column(EmployeePolicyAttestations_Policy;Policy."Employee Policy Attestations")
            {
            }
            column(CreatedBy_Policy;Policy."Created By")
            {
            }
            column(CreatedDate_Policy;Policy."Created Date")
            {
            }
            column(CreatedTime_Policy;Policy."Created Time")
            {
            }
            column(DraftingDate_Policy;Policy."Drafting Date")
            {
            }
            column(ApprovalDate_Policy;Policy."Approval Date")
            {
            }
            column(LastRevisionDate_Policy;Policy."Last Revision Date")
            {
            }
            column(VisionStatement_Policy;Policy."Vision Statement")
            {
            }
            column(MissionStatement_Policy;Policy."Mission Statement")
            {
            }
            column(EmployeeAttestationDueDate_Policy;Policy."Employee Attestation Due Date")
            {
            }
            dataitem("Company Information";"Company Information")
            {
                column(Name_CompanyInformation;"Company Information".Name)
                {
                }
                column(Name2_CompanyInformation;"Company Information"."Name 2")
                {
                }
                column(Address_CompanyInformation;"Company Information".Address)
                {
                }
                column(Address2_CompanyInformation;"Company Information"."Address 2")
                {
                }
                column(City_CompanyInformation;"Company Information".City)
                {
                }
                column(Picture_CompanyInformation;"Company Information".Picture)
                {
                }
                column(PostCode_CompanyInformation;"Company Information"."Post Code")
                {
                }
                column(County_CompanyInformation;"Company Information".County)
                {
                }
                column(CountryName;CountryName)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    /*Country.RESET;
                    Country.SETRANGE(Code, "Company Information"."Country/Region Code");
                    IF Country.FINDSET THEN
                      CountryName:=Country.Name;*/
                    
                    
                    if Country.Get("Company Information"."Country/Region Code") then
                       CountryName:=Country.Name;

                end;
            }
            dataitem("Policy Information Sources";"Policy Information Sources")
            {
                DataItemLink = "Policy ID"=FIELD(Code);
                column(PolicyID_PolicyInformationSources;"Policy Information Sources"."Policy ID")
                {
                }
                column(LineNo_PolicyInformationSources;"Policy Information Sources"."Line No.")
                {
                }
                column(SourceType_PolicyInformationSources;"Policy Information Sources"."Source Type")
                {
                }
                column(Description_PolicyInformationSources;"Policy Information Sources".Description)
                {
                }
                column(URLLink_PolicyInformationSources;"Policy Information Sources"."URL Link")
                {
                }
            }
            dataitem("Related Policy";"Related Policy")
            {
                DataItemLink = Code=FIELD(Code);
                column(Code_RelatedPolicy;"Related Policy".Code)
                {
                }
                column(PolicyName_RelatedPolicy;"Related Policy"."Policy Name")
                {
                }
                column(ResponsiblePerson_RelatedPolicy;"Related Policy"."Responsible Person")
                {
                }
                column(Name_RelatedPolicy;"Related Policy".Name)
                {
                }
                column(Title_RelatedPolicy;"Related Policy".Title)
                {
                }
                column(MainPolicy_RelatedPolicy;"Related Policy"."Main Policy")
                {
                }
            }
            dataitem("Policy Thematic Area";"Policy Thematic Area")
            {
                DataItemLink = "Policy ID"=FIELD(Code);
                column(PolicyID_PolicyThematicArea;"Policy Thematic Area"."Policy ID")
                {
                }
                column(Code_PolicyThematicArea;"Policy Thematic Area".Code)
                {
                }
                column(Description_PolicyThematicArea;"Policy Thematic Area".Description)
                {
                }
                column(ImplementationPercentage_PolicyThematicArea;"Policy Thematic Area"."Implementation Percentage")
                {
                }
                column(Comments_PolicyThematicArea;"Policy Thematic Area".Comments)
                {
                }
            }

            trigger OnPreDataItem()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(Picture);
            end;
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
        Country: Record "Country/Region";
        CountryName: Code[100];
        CompInfo: Record "Company Information";
}

