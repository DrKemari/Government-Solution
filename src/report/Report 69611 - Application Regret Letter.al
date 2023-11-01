report 69611 "Application Regret Letter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Application Regret Letter.rdlc';

    dataset
    {
        dataitem("Job Applications";"Job Applications")
        {
            column(FirstName_JobApplications;"Job Applications"."First Name")
            {
            }
            column(MiddleName_JobApplications;"Job Applications"."Middle Name")
            {
            }
            column(LastName_JobApplications;"Job Applications"."Last Name")
            {
            }
            column(FullNames_JobApplications;"Job Applications"."Full Names")
            {
            }
            column(EMail_JobApplications;"Job Applications"."E-Mail")
            {
            }
            column(JobTitleDesignation_JobApplications;"Job Applications"."Job Title/Designation")
            {
            }
            column(DutyStationID_JobApplications;"Job Applications"."Duty Station ID")
            {
            }
            column(WorkLocationDetails_JobApplications;"Job Applications"."Work Location Details")
            {
            }
            column(TermsofServiceCode_JobApplications;"Job Applications"."Terms of Service Code")
            {
            }
            column(EmploymentType_JobApplications;"Job Applications"."Employment Type")
            {
            }
            column(Logo;CI.Picture)
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
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

