report 69462 "Hazard Insurance List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Hazard Insurance List.rdlc';

    dataset
    {
        dataitem("HSE Plan Calendar";"HSE Plan Calendar")
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
            column(PlanID_HSEPlanCalendar;"HSE Plan Calendar"."Plan ID")
            {
            }
            column(OSHActivityType_HSEPlanCalendar;UpperCase(Format("HSE Plan Calendar"."OSH Activity Type")))
            {
            }
            column(LineNo_HSEPlanCalendar;"HSE Plan Calendar"."Line No.")
            {
            }
            column(Description_HSEPlanCalendar;"HSE Plan Calendar".Description)
            {
            }
            column(PrimaryMission_HSEPlanCalendar;"HSE Plan Calendar"."Primary Mission")
            {
            }
            column(Responsibility_HSEPlanCalendar;"HSE Plan Calendar".Responsibility)
            {
            }
            column(OverallOwnerID_HSEPlanCalendar;"HSE Plan Calendar"."Overall Owner ID")
            {
            }
            column(PlannedStartDate_HSEPlanCalendar;"HSE Plan Calendar"."Planned Start Date")
            {
            }
            column(PlannedDueDate_HSEPlanCalendar;"HSE Plan Calendar"."Planned Due Date")
            {
            }
            column(ActionStatus_HSEPlanCalendar;"HSE Plan Calendar"."Action Status")
            {
            }
            column(Complete_HSEPlanCalendar;"HSE Plan Calendar"."% Complete")
            {
            }
            column(ActivityPriority_HSEPlanCalendar;"HSE Plan Calendar"."Activity Priority")
            {
            }
            column(ActualDateDone_HSEPlanCalendar;"HSE Plan Calendar"."Actual Date Done")
            {
            }
            column(VenueLocation_HSEPlanCalendar;"HSE Plan Calendar"."Venue/Location")
            {
            }
            column(MeetingMedium_HSEPlanCalendar;"HSE Plan Calendar"."Meeting Medium")
            {
            }
            column(EvacuationEventID_HSEPlanCalendar;"HSE Plan Calendar"."Evacuation Event ID")
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

