report 95020 "Exit conference Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Exit conference Report.rdlc';

    dataset
    {
        dataitem("Audit Execution Header";"Audit Execution Header")
        {
            column(COMPANY;UpperCase(CompanyInfo.Name))
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
            column(TITTLE;tittle)
            {
            }
            column(DocumentType_AuditExecutionHeader;UpperCase(Format("Audit Execution Header"."Document Type")))
            {
            }
            column(DocumentNo_AuditExecutionHeader;"Audit Execution Header"."Document No.")
            {
            }
            column(DocumentDate_AuditExecutionHeader;"Audit Execution Header"."Document Date")
            {
            }
            column(AuditCommencementNoticeNo_AuditExecutionHeader;"Audit Execution Header"."Audit Commencement Notice No.")
            {
            }
            column(EngagementID_AuditExecutionHeader;"Audit Execution Header"."Engagement ID")
            {
            }
            column(Description_AuditExecutionHeader;"Audit Execution Header".Description)
            {
            }
            column(AuditPlanID_AuditExecutionHeader;"Audit Execution Header"."Audit Plan ID")
            {
            }
            column(AuditWorkType_AuditExecutionHeader;"Audit Execution Header"."Audit  Work Type")
            {
            }
            column(EngagementName_AuditExecutionHeader;"Audit Execution Header"."Engagement Name")
            {
            }
            column(EngagementCategory_AuditExecutionHeader;"Audit Execution Header"."Engagement Category")
            {
            }
            column(AuditorType_AuditExecutionHeader;"Audit Execution Header"."Auditor Type")
            {
            }
            column(AuditLeadID_AuditExecutionHeader;"Audit Execution Header"."Audit Lead ID")
            {
            }
            column(AuditeeType_AuditExecutionHeader;"Audit Execution Header"."Auditee Type")
            {
            }
            column(ProjectID_AuditExecutionHeader;"Audit Execution Header"."Project ID")
            {
            }
            column(PrimaryAuditeeID_AuditExecutionHeader;"Audit Execution Header"."Primary Auditee ID")
            {
            }
            column(AuditeeName_AuditExecutionHeader;"Audit Execution Header"."Auditee Name")
            {
            }
            column(AuditeeLeadID_AuditExecutionHeader;"Audit Execution Header"."Auditee Lead ID")
            {
            }
            column(GlobalDimension1Code_AuditExecutionHeader;"Audit Execution Header"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_AuditExecutionHeader;"Audit Execution Header"."Global Dimension 2 Code")
            {
            }
            column(DimensionSetID_AuditExecutionHeader;"Audit Execution Header"."Dimension Set ID")
            {
            }
            column(Status_AuditExecutionHeader;"Audit Execution Header".Status)
            {
            }
            column(Posted_AuditExecutionHeader;"Audit Execution Header".Posted)
            {
            }
            column(CreatedBy_AuditExecutionHeader;"Audit Execution Header"."Created By")
            {
            }
            column(CreatedDateTime_AuditExecutionHeader;"Audit Execution Header"."Created DateTime")
            {
            }
            column(EntranceMeetingVenue_AuditExecutionHeader;"Audit Execution Header"."Meeting Venue")
            {
            }
            column(EntranceMeetingStartDate_AuditExecutionHeader;"Audit Execution Header"."Meeting Start Date")
            {
            }
            column(EntranceMeetingStartTime_AuditExecutionHeader;"Audit Execution Header"."Meeting Start Time")
            {
            }
            column(EntranceMeetingEndDate_AuditExecutionHeader;"Audit Execution Header"."Meeting End Date")
            {
            }
            column(EntranceMeetingEndTime_AuditExecutionHeader;"Audit Execution Header"."Meeting End Time")
            {
            }
            column(Duration_AuditExecutionHeader;"Audit Execution Header".Duration)
            {
            }
            column(MeetingMedium_AuditExecutionHeader;"Audit Execution Header"."Meeting Medium")
            {
            }
            column(NoSeries_AuditExecutionHeader;"Audit Execution Header"."No. Series")
            {
            }
            dataitem("Entrance Meeting Agenda";"Entrance Meeting Agenda")
            {
                DataItemLink = "Engagement ID"=FIELD("Engagement ID");
                column(DocumentType_EntranceMeetingAgenda;"Entrance Meeting Agenda"."Document Type")
                {
                }
                column(DocumentNo_EntranceMeetingAgenda;"Entrance Meeting Agenda"."Document No.")
                {
                }
                column(EngagementID_EntranceMeetingAgenda;"Entrance Meeting Agenda"."Engagement ID")
                {
                }
                column(AgendaCode_EntranceMeetingAgenda;"Entrance Meeting Agenda"."Agenda Code")
                {
                }
                column(AgendaDescription_EntranceMeetingAgenda;"Entrance Meeting Agenda"."Agenda Description")
                {
                }
                column(EstimateTimeMinutes_EntranceMeetingAgenda;"Entrance Meeting Agenda"."Estimate Time (Minutes)")
                {
                }
                column(NoofDiscussedItems_EntranceMeetingAgenda;"Entrance Meeting Agenda"."No. of Discussed Items")
                {
                }
                dataitem("Entrance Meeting Summary";"Entrance Meeting Summary")
                {
                    DataItemLink = "Document No."=FIELD("Document No."),"Agenda Code"=FIELD("Agenda Code");
                    column(DocumentType_EntranceMeetingSummary;"Entrance Meeting Summary"."Document Type")
                    {
                    }
                    column(DocumentNo_EntranceMeetingSummary;"Entrance Meeting Summary"."Document No.")
                    {
                    }
                    column(EngagementID_EntranceMeetingSummary;"Entrance Meeting Summary"."Engagement ID")
                    {
                    }
                    column(AgendaCode_EntranceMeetingSummary;"Entrance Meeting Summary"."Agenda Code")
                    {
                    }
                    column(LineNo_EntranceMeetingSummary;"Entrance Meeting Summary"."Line No")
                    {
                    }
                    column(ItemDiscussed_EntranceMeetingSummary;"Entrance Meeting Summary"."Item Discussed")
                    {
                    }
                    column(SummaryNotes_EntranceMeetingSummary;"Entrance Meeting Summary"."Summary Notes")
                    {
                    }
                }
            }
            dataitem("Entrace Meeting Attendance";"Entrace Meeting Attendance")
            {
                DataItemLink = "Engagement ID"=FIELD("Engagement ID");
                column(DocumentType_EntraceMeetingAttendance;"Entrace Meeting Attendance"."Document Type")
                {
                }
                column(DocumentNo_EntraceMeetingAttendance;"Entrace Meeting Attendance"."Document No.")
                {
                }
                column(EngagementID_EntraceMeetingAttendance;"Entrace Meeting Attendance"."Engagement ID")
                {
                }
                column(ResourceNo_EntraceMeetingAttendance;"Entrace Meeting Attendance"."Resource No.")
                {
                }
                column(Name_EntraceMeetingAttendance;"Entrace Meeting Attendance".Name)
                {
                }
                column(JobTitle_EntraceMeetingAttendance;"Entrace Meeting Attendance"."Job Title")
                {
                }
                column(PhoneNo_EntraceMeetingAttendance;"Entrace Meeting Attendance"."Phone No.")
                {
                }
                column(Email_EntraceMeetingAttendance;"Entrace Meeting Attendance".Email)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                tittle:=UpperCase(Format("Audit Execution Header"."Document Type"));
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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        tittle: Text[250];
}

