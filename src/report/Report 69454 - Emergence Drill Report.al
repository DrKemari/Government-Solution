report 69454 "Emergence Drill Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Emergence Drill Report.rdlc';

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
            dataitem(DrillTeam;"Emergency Drill Team")
            {
                DataItemLink = "Drill ID"=FIELD("Drill ID");
                column(DrillID_DrillTeam;DrillTeam."Drill ID")
                {
                }
                column(ResourceNo_DrillTeam;DrillTeam."Resource No.")
                {
                }
                column(Name_DrillTeam;DrillTeam.Name)
                {
                }
                column(Role_DrillTeam;DrillTeam.Role)
                {
                }
                column(TelephoneNo_DrillTeam;DrillTeam."Telephone No.")
                {
                }
                column(Email_DrillTeam;DrillTeam.Email)
                {
                }
            }
            dataitem(EMERGE;"Emergency Drill Workgroup")
            {
                DataItemLink = "Drill ID"=FIELD("Drill ID");
                column(DrillID_EMERGE;EMERGE."Drill ID")
                {
                }
                column(RecordType_EMERGE;EMERGE."Record Type")
                {
                }
                column(LineNo_EMERGE;EMERGE."Line No.")
                {
                }
                column(WorkgroupType_EMERGE;EMERGE."Workgroup Type")
                {
                }
                column(Description_EMERGE;EMERGE.Description)
                {
                }
                column(ContactPerson_EMERGE;EMERGE."Contact Person")
                {
                }
                column(TelephoneNo_EMERGE;EMERGE."Telephone No.")
                {
                }
                column(Email_EMERGE;EMERGE.Email)
                {
                }
                column(DateInformed_EMERGE;EMERGE."Date Informed")
                {
                }
                column(CommentsAdditionalNotes_EMERGE;EMERGE."Comments/Additional Notes")
                {
                }
            }
            dataitem(Observa;"Emergency Drill Evacuation")
            {
                DataItemLink = "Drill ID"=FIELD("Drill ID");
                column(DrillID_Observa;Observa."Drill ID")
                {
                }
                column(EvacuationEventID_Observa;Observa."Evacuation Event ID")
                {
                }
                column(EvacuationProcedureID_Observa;Observa."Evacuation Procedure ID")
                {
                }
                column(Description_Observa;Observa.Description)
                {
                }
                column(ComplianceStatus_Observa;Observa."Compliance Status")
                {
                }
                column(DrillObeservations_Observa;Observa."Drill Obeservations")
                {
                }
                column(NoofRecommendedActions_Observa;Observa."No. of Recommended Actions")
                {
                }
            }
            dataitem(Reccomm;"Emergency Drill Action Plan")
            {
                DataItemLink = "Document No."=FIELD("Drill ID");
                column(DocumentNo_Reccomm;Reccomm."Document No.")
                {
                }
                column(EvacuationEventID_Reccomm;Reccomm."Evacuation Event ID")
                {
                }
                column(CriteriaCode_Reccomm;Reccomm."Criteria Code")
                {
                }
                column(LineNo_Reccomm;Reccomm."Line No.")
                {
                }
                column(Action_Reccomm;Reccomm.Action)
                {
                }
                column(ActionType_Reccomm;Reccomm."Action Type")
                {
                }
                column(Responsibility_Reccomm;Reccomm.Responsibility)
                {
                }
                column(OwnerID_Reccomm;Reccomm."Owner ID")
                {
                }
                column(PlannedDate_Reccomm;Reccomm."Planned Date")
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

