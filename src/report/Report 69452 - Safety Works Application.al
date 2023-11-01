report 69452 "Safety Works Application"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Safety Works Application.rdlc';

    dataset
    {
        dataitem("Safe Work Permit Header";"Safe Work Permit Header")
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
            column(DocumentType_SafeWorkPermitHeader;"Safe Work Permit Header"."Document Type")
            {
            }
            column(DocumentNo_SafeWorkPermitHeader;"Safe Work Permit Header"."Document No.")
            {
            }
            column(DocumentDate_SafeWorkPermitHeader;"Safe Work Permit Header"."Document Date")
            {
            }
            column(SafetyWorkPermitID_SafeWorkPermitHeader;"Safe Work Permit Header"."Safety Work Permit ID")
            {
            }
            column(HSEPlanType_SafeWorkPermitHeader;"Safe Work Permit Header"."HSE Plan Type")
            {
            }
            column(OSHManagementPlanID_SafeWorkPermitHeader;"Safe Work Permit Header"."OSH Management Plan ID")
            {
            }
            column(RiskManagementPlanID_SafeWorkPermitHeader;"Safe Work Permit Header"."Risk Management Plan ID")
            {
            }
            column(PermitType_SafeWorkPermitHeader;"Safe Work Permit Header"."Permit Type")
            {
            }
            column(Description_SafeWorkPermitHeader;"Safe Work Permit Header".Description)
            {
            }
            column(WorksLocationDetails_SafeWorkPermitHeader;"Safe Work Permit Header"."Works Location Details")
            {
            }
            column(PlannedStartDate_SafeWorkPermitHeader;"Safe Work Permit Header"."Planned Start Date")
            {
            }
            column(PlannedEndDate_SafeWorkPermitHeader;"Safe Work Permit Header"."Planned End Date")
            {
            }
            column(SubmittedBy_SafeWorkPermitHeader;"Safe Work Permit Header"."Submitted By")
            {
            }
            column(LeadEmergencyCoordinator_SafeWorkPermitHeader;"Safe Work Permit Header"."Lead Emergency Coordinator")
            {
            }
            column(FinalPermitVerdict_SafeWorkPermitHeader;"Safe Work Permit Header"."Final Permit Verdict")
            {
            }
            column(ProjectID_SafeWorkPermitHeader;"Safe Work Permit Header"."Project ID")
            {
            }
            column(WorkExecutionPlanID_SafeWorkPermitHeader;"Safe Work Permit Header"."Work Execution Plan ID")
            {
            }
            column(CorporateStrategicPlanID_SafeWorkPermitHeader;"Safe Work Permit Header"."Corporate Strategic Plan ID")
            {
            }
            column(YearCode_SafeWorkPermitHeader;"Safe Work Permit Header"."Year Code")
            {
            }
            column(DirectorateID_SafeWorkPermitHeader;"Safe Work Permit Header"."Directorate ID")
            {
            }
            column(DepartmentID_SafeWorkPermitHeader;"Safe Work Permit Header"."Department ID")
            {
            }
            column(RegionID_SafeWorkPermitHeader;"Safe Work Permit Header"."Region ID")
            {
            }
            column(Status_SafeWorkPermitHeader;"Safe Work Permit Header".Status)
            {
            }
            column(Posted_SafeWorkPermitHeader;"Safe Work Permit Header".Posted)
            {
            }
            column(CreatedBy_SafeWorkPermitHeader;"Safe Work Permit Header"."Created By")
            {
            }
            column(CreatedDateTime_SafeWorkPermitHeader;"Safe Work Permit Header"."Created Date/Time")
            {
            }
            column(SafeWPermitCompReportID_SafeWorkPermitHeader;"Safe Work Permit Header"."Safe W. Permit Comp. Report ID")
            {
            }
            column(ApplicantResourceNo_SafeWorkPermitHeader;"Safe Work Permit Header"."Applicant Resource No.")
            {
            }
            dataitem("Safety Permit Team";"Safety Permit Team")
            {
                DataItemLink = "Document Type"=FIELD("Document Type"),"Document No."=FIELD("Document No.");
                column(Name_SafetyPermitTeam;"Safety Permit Team".Name)
                {
                }
                column(DocumentNo_SafetyPermitTeam;"Safety Permit Team"."Document No.")
                {
                }
                column(Role_SafetyPermitTeam;"Safety Permit Team".Role)
                {
                }
                column(TelephoneNo_SafetyPermitTeam;"Safety Permit Team"."Telephone No.")
                {
                }
                column(Email_SafetyPermitTeam;"Safety Permit Team".Email)
                {
                }
            }
            dataitem("Safety Permit Workgroup";"Safety Permit Workgroup")
            {
                DataItemLink = "Document Type"=FIELD("Document Type"),"Document No."=FIELD("Document No.");
                column(DocumentNo_SafetyPermitWorkgroup;"Safety Permit Workgroup"."Document No.")
                {
                }
                column(RecordType_SafetyPermitWorkgroup;"Safety Permit Workgroup"."Record Type")
                {
                }
                column(WorkgroupType_SafetyPermitWorkgroup;"Safety Permit Workgroup"."Workgroup Type")
                {
                }
                column(Description_SafetyPermitWorkgroup;"Safety Permit Workgroup".Description)
                {
                }
                column(ContactPerson_SafetyPermitWorkgroup;"Safety Permit Workgroup"."Contact Person")
                {
                }
                column(TelephoneNo_SafetyPermitWorkgroup;"Safety Permit Workgroup"."Telephone No.")
                {
                }
                column(Email_SafetyPermitWorkgroup;"Safety Permit Workgroup".Email)
                {
                }
                column(DateInformed_SafetyPermitWorkgroup;"Safety Permit Workgroup"."Date Informed")
                {
                }
                column(CommentsAdditionalNotes_SafetyPermitWorkgroup;"Safety Permit Workgroup"."Comments/Additional Notes")
                {
                }
            }
            dataitem("Safety Permit Application Line";"Safety Permit Application Line")
            {
                DataItemLink = "Document Type"=FIELD("Document Type"),"Document No."=FIELD("Document No.");
                column(DocumentType_SafetyPermitApplicationLine;"Safety Permit Application Line"."Document Type")
                {
                }
                column(DocumentNo_SafetyPermitApplicationLine;"Safety Permit Application Line"."Document No.")
                {
                }
                column(PermitType_SafetyPermitApplicationLine;"Safety Permit Application Line"."Permit Type")
                {
                }
                column(LineNo_SafetyPermitApplicationLine;"Safety Permit Application Line"."Line No.")
                {
                }
                column(ComplianceRequirement_SafetyPermitApplicationLine;"Safety Permit Application Line"."Compliance Requirement")
                {
                }
                column(RequirementType_SafetyPermitApplicationLine;"Safety Permit Application Line"."Requirement Type")
                {
                }
                column(SeverityLevelforViolation_SafetyPermitApplicationLine;"Safety Permit Application Line"."Severity Level for Violation")
                {
                }
                column(ComplianceStatus_SafetyPermitApplicationLine;"Safety Permit Application Line"."Compliance Status")
                {
                }
                column(AdditionalComplianceNotes_SafetyPermitApplicationLine;"Safety Permit Application Line"."Additional Compliance Notes")
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

