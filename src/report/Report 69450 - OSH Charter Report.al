report 69450 "OSH Charter Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './OSH Charter Report.rdlc';

    dataset
    {
        dataitem("Health & Safety Setup";"Health & Safety Setup")
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
            column(Description_HealthSafetySetup;"Health & Safety Setup".Description)
            {
            }
            column(OrganizationName_HealthSafetySetup;"Health & Safety Setup"."Organization Name")
            {
            }
            column(PrimaryPurpose_HealthSafetySetup;"Health & Safety Setup"."Primary Purpose")
            {
            }
            column(OSHPolicyNo_HealthSafetySetup;"Health & Safety Setup"."OSH Policy No.")
            {
            }
            dataitem("Hazard Type";"Hazard Type")
            {
                column(Code_HazardType;"Hazard Type".Code)
                {
                }
                column(Description_HazardType;"Hazard Type".Description)
                {
                }
                column(HazardCategory_HazardType;"Hazard Type"."Hazard Category")
                {
                }
            }
            dataitem("Hazard Identification Method";"Hazard Identification Method")
            {
                column(Code_HazardIdentificationMethod;"Hazard Identification Method".Code)
                {
                }
                column(Description_HazardIdentificationMethod;"Hazard Identification Method".Description)
                {
                }
            }
            dataitem("Evacuation Event";"Evacuation Event")
            {
                column(Code_EvacuationEvent;"Evacuation Event".Code)
                {
                }
                column(Description_EvacuationEvent;"Evacuation Event".Description)
                {
                }
                column(HazardType_EvacuationEvent;"Evacuation Event"."Hazard Type")
                {
                }
            }
            dataitem("Workplace Prohibited Item";"Workplace Prohibited Item")
            {
                column(Code_WorkplaceProhibitedItem;"Workplace Prohibited Item".Code)
                {
                }
                column(Description_WorkplaceProhibitedItem;"Workplace Prohibited Item".Description)
                {
                }
            }
            dataitem("HSE Equipment Categoryx";"HSE Equipment Categoryx")
            {
                column(Code_HSEEquipmentCategoryx;"HSE Equipment Categoryx".Code)
                {
                }
                column(Description_HSEEquipmentCategoryx;"HSE Equipment Categoryx".Description)
                {
                }
                column(AdditionalNotesComments_HSEEquipmentCategoryx;"HSE Equipment Categoryx"."Additional Notes/Comments")
                {
                }
            }
            dataitem("Safe Work Permit Type";"Safe Work Permit Type")
            {
                column(Code_SafeWorkPermitType;"Safe Work Permit Type".Code)
                {
                }
                column(Description_SafeWorkPermitType;"Safe Work Permit Type".Description)
                {
                }
            }
            dataitem("Incident Party Type";"Incident Party Type")
            {
                column(Code_IncidentPartyType;"Incident Party Type".Code)
                {
                }
                column(Description_IncidentPartyType;"Incident Party Type".Description)
                {
                }
            }
            dataitem("Safety Workgroup";"Safety Workgroup")
            {
                column(WorkgroupID_SafetyWorkgroup;"Safety Workgroup"."Workgroup ID")
                {
                }
                column(Description_SafetyWorkgroup;"Safety Workgroup".Description)
                {
                }
                column(StakeholderCategory_SafetyWorkgroup;"Safety Workgroup"."Stakeholder Category")
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

