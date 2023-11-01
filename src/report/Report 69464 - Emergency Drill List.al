report 69464 "Emergency Drill List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Emergency Drill List.rdlc';

    dataset
    {
        dataitem("Emergency Drill Log";"Emergency Drill Log")
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
            column(DrillID_EmergencyDrillLog;"Emergency Drill Log"."Drill ID")
            {
            }
            column(DrillDocumentType_EmergencyDrillLog;"Emergency Drill Log"."Drill Document Type")
            {
            }
            column(OSHManagementPlanID_EmergencyDrillLog;"Emergency Drill Log"."OSH Management Plan ID")
            {
            }
            column(OSHPlanCalendarID_EmergencyDrillLog;"Emergency Drill Log"."OSH Plan Calendar ID")
            {
            }
            column(DocumentDate_EmergencyDrillLog;"Emergency Drill Log"."Document Date")
            {
            }
            column(EvacuationEventID_EmergencyDrillLog;"Emergency Drill Log"."Evacuation Event ID")
            {
            }
            column(Description_EmergencyDrillLog;"Emergency Drill Log".Description)
            {
            }
            column(DateofDrill_EmergencyDrillLog;"Emergency Drill Log"."Date of Drill")
            {
            }
            column(DrillStartTime_EmergencyDrillLog;"Emergency Drill Log"."Drill Start Time")
            {
            }
            column(DrillEndTime_EmergencyDrillLog;"Emergency Drill Log"."Drill End Time")
            {
            }
            column(OverallDrillManagerID_EmergencyDrillLog;"Emergency Drill Log"."Overall Drill Manager ID")
            {
            }
            column(DrillLocationDetails_EmergencyDrillLog;"Emergency Drill Log"."Drill Location Details")
            {
            }
            column(AssemblyPointLocation_EmergencyDrillLog;"Emergency Drill Log"."Assembly Point Location")
            {
            }
            column(PriorNoticetoStaff_EmergencyDrillLog;"Emergency Drill Log"."Prior Notice to Staff")
            {
            }
            column(NoticetoStaffDate_EmergencyDrillLog;"Emergency Drill Log"."Notice to Staff Date")
            {
            }
            column(TotalNoofPeopleInvolved_EmergencyDrillLog;"Emergency Drill Log"."Total No. of People Involved")
            {
            }
            column(TotalNoofPeopleEvacuated_EmergencyDrillLog;"Emergency Drill Log"."Total No. of People Evacuated")
            {
            }
            column(TotalNoofrecordedInjuries_EmergencyDrillLog;"Emergency Drill Log"."Total No. of recorded Injuries")
            {
            }
            column(TimeEvacuationStarted_EmergencyDrillLog;"Emergency Drill Log"."Time Evacuation Started")
            {
            }
            column(TimeEvacuationEnded_EmergencyDrillLog;"Emergency Drill Log"."Time Evacuation Ended")
            {
            }
            column(EvacuationDelayTime_EmergencyDrillLog;"Emergency Drill Log"."Evacuation Delay Time")
            {
            }
            column(OverallDrillStandard_EmergencyDrillLog;"Emergency Drill Log"."Overall Drill Standard")
            {
            }
            column(ProjectID_EmergencyDrillLog;"Emergency Drill Log"."Project ID")
            {
            }
            column(YearCode_EmergencyDrillLog;"Emergency Drill Log"."Year Code")
            {
            }
            column(DirectorateID_EmergencyDrillLog;"Emergency Drill Log"."Directorate ID")
            {
            }
            column(DepartmentID_EmergencyDrillLog;"Emergency Drill Log"."Department ID")
            {
            }
            column(RegionID_EmergencyDrillLog;"Emergency Drill Log"."Region ID")
            {
            }
            column(Status_EmergencyDrillLog;"Emergency Drill Log".Status)
            {
            }
            column(Posted_EmergencyDrillLog;"Emergency Drill Log".Posted)
            {
            }
            column(CreatedBy_EmergencyDrillLog;"Emergency Drill Log"."Created By")
            {
            }
            column(CreatedDateTime_EmergencyDrillLog;"Emergency Drill Log"."Created Date/Time")
            {
            }
            column(PrimaryMission_EmergencyDrillLog;"Emergency Drill Log"."Primary Mission")
            {
            }
            column(Responsibility_EmergencyDrillLog;"Emergency Drill Log".Responsibility)
            {
            }
            column(ActivityPriority_EmergencyDrillLog;"Emergency Drill Log"."Activity Priority")
            {
            }
            column(DimensionSetID_EmergencyDrillLog;"Emergency Drill Log"."Dimension Set ID")
            {
            }
            column(ShortcutDimension1Code_EmergencyDrillLog;"Emergency Drill Log"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_EmergencyDrillLog;"Emergency Drill Log"."Shortcut Dimension 2 Code")
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

