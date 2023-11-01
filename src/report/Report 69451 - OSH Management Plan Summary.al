report 69451 "OSH Management Plan Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './OSH Management Plan Summary.rdlc';

    dataset
    {
        dataitem("HSE Plan";"HSE Plan")
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
            column(PlanID_HSEPlan;"HSE Plan"."Plan ID")
            {
            }
            column(PlanType_HSEPlan;"HSE Plan"."Plan Type")
            {
            }
            column(DocumentDate_HSEPlan;"HSE Plan"."Document Date")
            {
            }
            column(RiskManagementPlanID_HSEPlan;"HSE Plan"."Risk Management Plan ID")
            {
            }
            column(Description_HSEPlan;"HSE Plan".Description)
            {
            }
            column(SafetyRulesRegulationsTemp_HSEPlan;"HSE Plan"."Safety Rules&Regulations Temp")
            {
            }
            column(DirectorateID_HSEPlan;"HSE Plan"."Directorate ID")
            {
            }
            column(DepartmentID_HSEPlan;"HSE Plan"."Department ID")
            {
            }
            column(RegionID_HSEPlan;"HSE Plan"."Region ID")
            {
            }
            column(PrimaryMission_HSEPlan;"HSE Plan"."Primary Mission")
            {
            }
            column(OverallSafetyManager_HSEPlan;"HSE Plan"."Overall Safety Manager")
            {
            }
            column(PlanningStartDate_HSEPlan;"HSE Plan"."Planning Start Date")
            {
            }
            column(PlanningEndDate_HSEPlan;"HSE Plan"."Planning End Date")
            {
            }
            column(DimensionSetID_HSEPlan;"HSE Plan"."Dimension Set ID")
            {
            }
            column(Blocked_HSEPlan;"HSE Plan".Blocked)
            {
            }
            column(Status_HSEPlan;"HSE Plan".Status)
            {
            }
            column(CreatedBy_HSEPlan;"HSE Plan"."Created By")
            {
            }
            column(CreatedDateTime_HSEPlan;"HSE Plan"."Created Date/Time")
            {
            }
            column(NoofOSHManagementPlans_HSEPlan;"HSE Plan"."No. of OSH Management Plans")
            {
            }
            column(NoofSafeWorkPermitApp_HSEPlan;"HSE Plan"."No. of Safe Work Permit App")
            {
            }
            column(NoofSafeWorkCompletionrep_HSEPlan;"HSE Plan"."No.of Safe Work Completion rep")
            {
            }
            column(NoofEmergencyDrillReports_HSEPlan;"HSE Plan"."No. of Emergency Drill Reports")
            {
            }
            column(NoofRiskIncidentLogs_HSEPlan;"HSE Plan"."No. of Risk Incident Logs")
            {
            }
            column(NoofOSHTrainings_HSEPlan;"HSE Plan"."No. of OSH Trainings")
            {
            }
            column(NoofOSHMeetings_HSEPlan;"HSE Plan"."No. of OSH Meetings")
            {
            }
            column(NoofOSHInspectionReports_HSEPlan;"HSE Plan"."No. of OSH Inspection Reports")
            {
            }
            column(NoofOSHImpStatusReports_HSEPlan;"HSE Plan"."No. of OSH Imp Status Reports")
            {
            }
            column(NoofRiskIncidents_HSEPlan;"HSE Plan"."No. of Risk Incidents")
            {
            }
            column(ActualFinancialImpactLCY_HSEPlan;"HSE Plan"."Actual Financial Impact (LCY)")
            {
            }
            column(ActualDelayDisruptionDays_HSEPlan;"HSE Plan"."Actual Delay/Disruption (Days)")
            {
            }
            column(ActualNoInjuredPersons_HSEPlan;"HSE Plan"."Actual No. Injured Persons")
            {
            }
            column(ActualNoofFatalities_HSEPlan;"HSE Plan"."Actual No. of Fatalities")
            {
            }
            column(ShortcutDimension1Code_HSEPlan;"HSE Plan"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_HSEPlan;"HSE Plan"."Shortcut Dimension 2 Code")
            {
            }
            dataitem("HSE Plan Line";"HSE Plan Line")
            {
                DataItemLink = "Plan ID"=FIELD("Plan ID");
                column(PlanID_HSEPlanLine;"HSE Plan Line"."Plan ID")
                {
                }
                column(HazardID_HSEPlanLine;"HSE Plan Line"."Hazard ID")
                {
                }
                column(HazardType_HSEPlanLine;"HSE Plan Line"."Hazard Type")
                {
                }
                column(Description_HSEPlanLine;"HSE Plan Line".Description)
                {
                }
                column(HazardCategory_HSEPlanLine;"HSE Plan Line"."Hazard Category")
                {
                }
                column(DimensionSetID_HSEPlanLine;"HSE Plan Line"."Dimension Set ID")
                {
                }
                column(NoofPlannedHazardControls_HSEPlanLine;"HSE Plan Line"."No. of Planned Hazard Controls")
                {
                }
                column(NoofRiskIncidences_HSEPlanLine;"HSE Plan Line"."No. of Risk Incidences")
                {
                }
                column(RiskManagementPlanID_HSEPlanLine;"HSE Plan Line"."Risk Management Plan ID")
                {
                }
                column(RiskID_HSEPlanLine;"HSE Plan Line"."Risk ID")
                {
                }
            }
            dataitem("HSE Plan Section";"HSE Plan Section")
            {
                DataItemLink = "Plan ID"=FIELD("Plan ID");
                column(PlanID_HSEPlanSection;"HSE Plan Section"."Plan ID")
                {
                }
                column(SectionType_HSEPlanSection;"HSE Plan Section"."Section Type")
                {
                }
                column(LineNo_HSEPlanSection;"HSE Plan Section"."Line No.")
                {
                }
                column(Description_HSEPlanSection;"HSE Plan Section".Description)
                {
                }
                column(RevisionDate_HSEPlanSection;"HSE Plan Section"."Revision Date")
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

