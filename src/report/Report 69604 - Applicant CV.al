report 69604 "Applicant CV"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Applicant CV.rdlc';

    dataset
    {
        dataitem(Applicant;Applicant)
        {
            column(CandidateNo_Applicant;Applicant."Candidate No.")
            {
            }
            column(FirstName_Applicant;Applicant."First Name")
            {
            }
            column(MiddleName_Applicant;Applicant."Middle Name")
            {
            }
            column(LastName_Applicant;Applicant."Last Name")
            {
            }
            column(FullNames_Applicant;Applicant."Full Names")
            {
            }
            column(Address_Applicant;Applicant.Address)
            {
            }
            column(Address2_Applicant;Applicant."Address 2")
            {
            }
            column(City_Applicant;Applicant.City)
            {
            }
            column(PostCode_Applicant;Applicant."Post Code")
            {
            }
            column(CountyofBirth_Applicant;Applicant."County of Birth")
            {
            }
            column(PhoneNo_Applicant;Applicant."Phone No.")
            {
            }
            column(MobilePhoneNo_Applicant;Applicant."Mobile Phone No.")
            {
            }
            column(EMail_Applicant;Applicant."E-Mail")
            {
            }
            column(Picture_Applicant;Applicant.Picture)
            {
            }
            column(BirthDate_Applicant;Applicant."Birth Date")
            {
            }
            column(Gender_Applicant;Applicant.Gender)
            {
            }
            column(CountryRegionCode_Applicant;Applicant."Country/Region Code")
            {
            }
            column(IDNumber_Applicant;Applicant."ID Number")
            {
            }
            column(PassportNo_Applicant;Applicant."Passport No.")
            {
            }
            column(MaritalStatus_Applicant;Applicant."Marital Status")
            {
            }
            column(Religion_Applicant;Applicant.Religion)
            {
            }
            column(EthnicGroup_Applicant;Applicant."Ethnic Group")
            {
            }
            column(Nationality_Applicant;Applicant.Nationality)
            {
            }
            column(SpecializationArea_Applicant;Applicant."Specialization Area")
            {
            }
            column(HighestAcademicQualification_Applicant;Applicant."Highest Academic Qualification")
            {
            }
            column(QualificationName_Applicant;Applicant."Qualification Name")
            {
            }
            column(WorkExperienceYears_Applicant;Applicant."Work Experience (Years)")
            {
            }
            column(ManagementExperienceYears_Applicant;Applicant."Management Experience (Years)")
            {
            }
            column(DisabilityCode_Applicant;Applicant."Disability Code")
            {
            }
            column(Disabled_Applicant;Applicant.Disabled)
            {
            }
            column(DisabilityDescription_Applicant;Applicant."Disability Description")
            {
            }
            column(DisabilityCertificateNo_Applicant;Applicant."Disability Certificate No")
            {
            }
            column(Status_Applicant;Applicant.Status)
            {
            }
            column(InactiveDate_Applicant;Applicant."Inactive Date")
            {
            }
            column(CauseofInactivityCode_Applicant;Applicant."Cause of Inactivity Code")
            {
            }
            column(TerminationDate_Applicant;Applicant."Termination Date")
            {
            }
            column(GroundsforTermCode_Applicant;Applicant."Grounds for Term. Code")
            {
            }
            column(LastDateModified_Applicant;Applicant."Last Date Modified")
            {
            }
            column(LastModifiedDateTime_Applicant;Applicant."Last Modified Date Time")
            {
            }
            column(NoofJobApplications_Applicant;Applicant."No. of Job Applications")
            {
            }
            column(ProfessionalSummary_Applicant;Applicant."Skills & Competences")
            {
            }
            dataitem("Job Applicants Qualification";"Job Applicants Qualification")
            {
                DataItemLink = "Candidate No."=FIELD("Candidate No.");
                column(CandidateNo_JobApplicantsQualification;"Job Applicants Qualification"."Candidate No.")
                {
                }
                column(LineNo_JobApplicantsQualification;"Job Applicants Qualification"."Line No.")
                {
                }
                column(QualificationCategory_JobApplicantsQualification;"Job Applicants Qualification"."Qualification Category")
                {
                }
                column(QualificationCode_JobApplicantsQualification;"Job Applicants Qualification"."Qualification Code")
                {
                }
                column(SpecializedDomainArea_JobApplicantsQualification;"Job Applicants Qualification"."Specialized Domain Area")
                {
                }
                column(FromDate_JobApplicantsQualification;"Job Applicants Qualification"."From Date")
                {
                }
                column(ToDate_JobApplicantsQualification;"Job Applicants Qualification"."To Date")
                {
                }
                column(Type_JobApplicantsQualification;"Job Applicants Qualification".Type)
                {
                }
                column(Description_JobApplicantsQualification;"Job Applicants Qualification".Description)
                {
                }
                column(InstitutionCompany_JobApplicantsQualification;"Job Applicants Qualification"."Institution/Company")
                {
                }
                column(Cost_JobApplicantsQualification;"Job Applicants Qualification".Cost)
                {
                }
                column(CourseGrade_JobApplicantsQualification;"Job Applicants Qualification"."Course Grade")
                {
                }
                column(JobApplicantStatus_JobApplicantsQualification;"Job Applicants Qualification"."Job Applicant Status")
                {
                }
                column(Comment_JobApplicantsQualification;"Job Applicants Qualification".Comment)
                {
                }
                column(ExpirationDate_JobApplicantsQualification;"Job Applicants Qualification"."Expiration Date")
                {
                }
            }
            dataitem("Applicant Qualification Histor";"Applicant Qualification Histor")
            {
                DataItemLink = "Candidate No."=FIELD("Candidate No.");
                column(CandidateNo_ApplicantQualificationHistor;"Applicant Qualification Histor"."Candidate No.")
                {
                }
                column(QualificationLineNo_ApplicantQualificationHistor;"Applicant Qualification Histor"."Qualification Line No.")
                {
                }
                column(QualificationCode_ApplicantQualificationHistor;"Applicant Qualification Histor"."Qualification Code")
                {
                }
                column(LineNo_ApplicantQualificationHistor;"Applicant Qualification Histor"."Line No.")
                {
                }
                column(ExperienceCategory_ApplicantQualificationHistor;"Applicant Qualification Histor"."Experience Category")
                {
                }
                column(Description_ApplicantQualificationHistor;"Applicant Qualification Histor".Description)
                {
                }
                column(FromDate_ApplicantQualificationHistor;"Applicant Qualification Histor"."From Date")
                {
                }
                column(ToDate_ApplicantQualificationHistor;"Applicant Qualification Histor"."To Date")
                {
                }
            }
            dataitem("Applicant_Employee Hobby";"Applicant_Employee Hobby")
            {
                DataItemLink = "No."=FIELD("Candidate No.");
                column(DocumentType_ApplicantEmployeeHobby;"Applicant_Employee Hobby"."Document Type")
                {
                }
                column(No_ApplicantEmployeeHobby;"Applicant_Employee Hobby"."No.")
                {
                }
                column(HobbyType_ApplicantEmployeeHobby;"Applicant_Employee Hobby"."Hobby Type")
                {
                }
                column(HobbyCategory_ApplicantEmployeeHobby;"Applicant_Employee Hobby"."Hobby Category")
                {
                }
                column(Description_ApplicantEmployeeHobby;"Applicant_Employee Hobby".Description)
                {
                }
                column(LineNo_ApplicantEmployeeHobby;"Applicant_Employee Hobby"."Line No.")
                {
                }
            }
            dataitem("Employee_Applicant Referees";"Employee_Applicant Referees")
            {
                DataItemLink = "No."=FIELD("Candidate No.");
                column(DocumentType_EmployeeApplicantReferees;"Employee_Applicant Referees"."Document Type")
                {
                }
                column(No_EmployeeApplicantReferees;"Employee_Applicant Referees"."No.")
                {
                }
                column(LineNo_EmployeeApplicantReferees;"Employee_Applicant Referees"."Line No.")
                {
                }
                column(RererenceType_EmployeeApplicantReferees;"Employee_Applicant Referees"."Rererence Type")
                {
                }
                column(Name_EmployeeApplicantReferees;"Employee_Applicant Referees".Name)
                {
                }
                column(DesignationTitle_EmployeeApplicantReferees;"Employee_Applicant Referees"."Designation/Title")
                {
                }
                column(Institution_EmployeeApplicantReferees;"Employee_Applicant Referees".Institution)
                {
                }
                column(Address_EmployeeApplicantReferees;"Employee_Applicant Referees".Address)
                {
                }
                column(Address2_EmployeeApplicantReferees;"Employee_Applicant Referees"."Address 2")
                {
                }
                column(City_EmployeeApplicantReferees;"Employee_Applicant Referees".City)
                {
                }
                column(PostCode_EmployeeApplicantReferees;"Employee_Applicant Referees"."Post Code")
                {
                }
                column(CountryRegionCode_EmployeeApplicantReferees;"Employee_Applicant Referees"."Country/Region Code")
                {
                }
                column(PhoneNo_EmployeeApplicantReferees;"Employee_Applicant Referees"."Phone No.")
                {
                }
                column(EMail_EmployeeApplicantReferees;"Employee_Applicant Referees"."E-Mail")
                {
                }
                column(YearsKnown_EmployeeApplicantReferees;"Employee_Applicant Referees"."Years Known")
                {
                }
            }
            dataitem("Employee_Applicant Language";"Employee_Applicant Language")
            {
                DataItemLink = "No."=FIELD("Candidate No.");
                column(DocumentType_EmployeeApplicantLanguage;"Employee_Applicant Language"."Document Type")
                {
                }
                column(No_EmployeeApplicantLanguage;"Employee_Applicant Language"."No.")
                {
                }
                column(LanguageCode_EmployeeApplicantLanguage;"Employee_Applicant Language"."Language Code")
                {
                }
                column(Description_EmployeeApplicantLanguage;"Employee_Applicant Language".Description)
                {
                }
                column(ProficiencyLevel_EmployeeApplicantLanguage;"Employee_Applicant Language"."Proficiency Level")
                {
                }
                column(LineNo_EmployeeApplicantLanguage;"Employee_Applicant Language"."Line No.")
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
}

