report 80028 "Policy Circulation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Policy Circulation Report.rdlc';

    dataset
    {
        dataitem("Employee Policy Attestation";"Employee Policy Attestation")
        {
            RequestFilterFields = "Policy No.","Employee Signing Status","Employee No.";
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
            column(AttestationNo_EmployeePolicyAttestation;"Employee Policy Attestation"."Attestation No.")
            {
            }
            column(PolicyNo_EmployeePolicyAttestation;"Employee Policy Attestation"."Policy No.")
            {
            }
            column(PolicyName_EmployeePolicyAttestation;"Employee Policy Attestation"."Policy Name")
            {
            }
            column(ExternalDocumentNo_EmployeePolicyAttestation;"Employee Policy Attestation"."External Document No")
            {
            }
            column(PolicyGoal_EmployeePolicyAttestation;"Employee Policy Attestation"."Policy Goal")
            {
            }
            column(EmployeeNo_EmployeePolicyAttestation;"Employee Policy Attestation"."Employee No.")
            {
            }
            column(Name_EmployeePolicyAttestation;"Employee Policy Attestation".Name)
            {
            }
            column(DocumentDate_EmployeePolicyAttestation;"Employee Policy Attestation"."Document Date")
            {
            }
            column(PrimaryDirectorate_EmployeePolicyAttestation;"Employee Policy Attestation"."Primary Directorate")
            {
            }
            column(PrimaryDepartment_EmployeePolicyAttestation;"Employee Policy Attestation"."Primary Department")
            {
            }
            column(DueDate_EmployeePolicyAttestation;"Employee Policy Attestation"."Due Date")
            {
            }
            column(EmployeeSigningStatus_EmployeePolicyAttestation;"Employee Policy Attestation"."Employee Signing Status")
            {
            }
            column(NoSeries_EmployeePolicyAttestation;"Employee Policy Attestation"."No. Series")
            {
            }
            column(DateApproved_EmployeePolicyAttestation;"Employee Policy Attestation"."Date Approved")
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

