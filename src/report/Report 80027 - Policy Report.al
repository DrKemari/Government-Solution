report 80027 "Policy Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Policy Report.rdlc';

    dataset
    {
        dataitem(Policy;Policy)
        {
            RequestFilterFields = "Primary Department","Approval Status","Policy Stage";
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
            column(PolicyRefNo_Policy;Policy."Policy Ref No")
            {
            }
            column(TotalImplementationstatus_Policy;Policy."Total Implementation status %")
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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

