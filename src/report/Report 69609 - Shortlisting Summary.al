report 69609 "Shortlisting Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Shortlisting Summary.rdlc';

    dataset
    {
        dataitem("Job Applications";"Job Applications")
        {
            RequestFilterFields = "Vacancy Id";
            column(VacancyId_JobApplications;"Job Applications"."Vacancy Id")
            {
            }
            column(Vacancy;Vacancy)
            {
            }
            column(ApplicationNo_JobApplications;"Job Applications"."Application No.")
            {
            }
            column(ApplicationStatus_JobApplications;"Job Applications"."Application Status")
            {
            }
            column(CandidateNo_JobApplications;"Job Applications"."Candidate No.")
            {
            }
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
            column(EmployeeNo_JobApplications;"Job Applications"."Employee No.")
            {
            }
            column(PhoneNo_JobApplications;"Job Applications"."Phone No.")
            {
            }
            column(MobilePhoneNo_JobApplications;"Job Applications"."Mobile Phone No.")
            {
            }
            column(EMail_JobApplications;"Job Applications"."E-Mail")
            {
            }
            column(BirthDate_JobApplications;"Job Applications"."Birth Date")
            {
            }
            column(Gender_JobApplications;"Job Applications".Gender)
            {
            }
            column(IDNumber_JobApplications;"Job Applications"."ID Number")
            {
            }
            column(PassportNo_JobApplications;"Job Applications"."Passport No.")
            {
            }
            column(Religion_JobApplications;"Job Applications".Religion)
            {
            }
            column(EthnicGroup_JobApplications;"Job Applications"."Ethnic Group")
            {
            }
            column(Nationality_JobApplications;"Job Applications".Nationality)
            {
            }
            column(SpecializationArea_JobApplications;"Job Applications"."Specialization Area")
            {
            }
            column(HighestAcademicQualification_JobApplications;"Job Applications"."Highest Academic Qualification")
            {
            }
            column(QualificationName_JobApplications;"Job Applications"."Qualification Name")
            {
            }

            trigger OnAfterGetRecord()
            begin
                RecruitmentRequisitionHeader.Reset;
                RecruitmentRequisitionHeader.SetRange("Document No.","Job Applications"."Vacancy Id");
                if RecruitmentRequisitionHeader.Find('-') then
                 Vacancy:=RecruitmentRequisitionHeader."Job Title/Designation"
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

    var
        Vacancy: Text;
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
}

