report 69622 "Candidate Shortlisting Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Candidate Shortlisting Voucher.rdlc';

    dataset
    {
        dataitem("Candidate Selection Header";"Candidate Selection Header")
        {
            column(Logo;CI.Picture)
            {
            }
            column(DocumentType_CandidateSelectionHeader;"Candidate Selection Header"."Document Type")
            {
            }
            column(DocumentNo_CandidateSelectionHeader;"Candidate Selection Header"."Document No.")
            {
            }
            column(SourceType_CandidateSelectionHeader;"Candidate Selection Header"."Source Type")
            {
            }
            column(SourceDocumentNo_CandidateSelectionHeader;"Candidate Selection Header"."Source Document No.")
            {
            }
            column(InterviewInvitationNo_CandidateSelectionHeader;"Candidate Selection Header"."Interview Invitation No.")
            {
            }
            column(DocumentDate_CandidateSelectionHeader;"Candidate Selection Header"."Document Date")
            {
            }
            column(CandidateShortlistNo_CandidateSelectionHeader;"Candidate Selection Header"."Candidate Shortlist No.")
            {
            }
            column(AbilityTestReportID_CandidateSelectionHeader;"Candidate Selection Header"."Ability Test Report ID")
            {
            }
            column(PhoneInterviewID_CandidateSelectionHeader;"Candidate Selection Header"."Phone Interview ID")
            {
            }
            column(VacancyID_CandidateSelectionHeader;"Candidate Selection Header"."Vacancy ID")
            {
            }
            column(AppointedSelectionCommID_CandidateSelectionHeader;"Candidate Selection Header"."Appointed Selection Comm ID")
            {
            }
            column(SelectionCommitteeChair_CandidateSelectionHeader;"Candidate Selection Header"."Selection Committee Chair")
            {
            }
            column(LeadHROfficer_CandidateSelectionHeader;"Candidate Selection Header"."Lead HR Officer")
            {
            }
            column(Description_CandidateSelectionHeader;"Candidate Selection Header".Description)
            {
            }
            column(PrimaryContactPerson_CandidateSelectionHeader;"Candidate Selection Header"."Primary Contact Person")
            {
            }
            column(PrimaryContactPhone_CandidateSelectionHeader;"Candidate Selection Header"."Primary Contact Phone")
            {
            }
            column(PrimaryContactEmail_CandidateSelectionHeader;"Candidate Selection Header"."Primary Contact Email")
            {
            }
            column(AdditionalComments_CandidateSelectionHeader;"Candidate Selection Header"."Additional Comments")
            {
            }
            column(InterviewMode_CandidateSelectionHeader;"Candidate Selection Header"."Interview Mode")
            {
            }
            column(PositionID_CandidateSelectionHeader;"Candidate Selection Header"."Position ID")
            {
            }
            column(JobTitle_CandidateSelectionHeader;"Candidate Selection Header"."Job Title")
            {
            }
            column(Noofopenings_CandidateSelectionHeader;"Candidate Selection Header"."No. of openings")
            {
            }
            column(Directorate_CandidateSelectionHeader;"Candidate Selection Header".Directorate)
            {
            }
            column(Department_CandidateSelectionHeader;"Candidate Selection Header".Department)
            {
            }
            column(Region_CandidateSelectionHeader;"Candidate Selection Header".Region)
            {
            }
            column(SeniorityLevel_CandidateSelectionHeader;"Candidate Selection Header"."Seniority Level")
            {
            }
            column(DefaultTermsofServiceCode_CandidateSelectionHeader;"Candidate Selection Header"."Default Terms of Service Code")
            {
            }
            column(EmploymentType_CandidateSelectionHeader;"Candidate Selection Header"."Employment Type")
            {
            }
            column(ApplicationClosingDate_CandidateSelectionHeader;"Candidate Selection Header"."Application Closing Date")
            {
            }
            column(ApplicationClosingTime_CandidateSelectionHeader;"Candidate Selection Header"."Application Closing Time")
            {
            }
            column(MinimumAcademicQualification_CandidateSelectionHeader;"Candidate Selection Header"."Minimum Academic Qualification")
            {
            }
            column(MinAcademicHierarchyPointer_CandidateSelectionHeader;"Candidate Selection Header"."Min Academic Hierarchy Pointer")
            {
            }
            column(MinimumWorkExperience_CandidateSelectionHeader;"Candidate Selection Header"."Minimum Work Experience")
            {
            }
            column(MinimumMngmntExperience_CandidateSelectionHeader;"Candidate Selection Header"."Minimum Mngmnt Experience")
            {
            }
            column(ShortlistingVenue_CandidateSelectionHeader;"Candidate Selection Header"."Shortlisting Venue")
            {
            }
            column(PlannedStartDate_CandidateSelectionHeader;"Candidate Selection Header"."Planned Start Date")
            {
            }
            column(PlannedendDate_CandidateSelectionHeader;"Candidate Selection Header"."Planned end Date")
            {
            }
            column(NoofSubmittedApplications_CandidateSelectionHeader;"Candidate Selection Header"."No. of Submitted Applications")
            {
            }
            column(NoofApptitudeInvitees_CandidateSelectionHeader;"Candidate Selection Header"."No. of Apptitude Invitees")
            {
            }
            column(NoofFinalShortlistedCandi_CandidateSelectionHeader;"Candidate Selection Header"."No. of Final Shortlisted Candi")
            {
            }
            column(MissedAcademicTotal_CandidateSelectionHeader;"Candidate Selection Header"."Missed Academic Total")
            {
            }
            column(MissedManagementTotal_CandidateSelectionHeader;"Candidate Selection Header"."Missed Management Total")
            {
            }
            column(MissedGeneralTotal_CandidateSelectionHeader;"Candidate Selection Header"."Missed General Total")
            {
            }
            column(DocumentStatus_CandidateSelectionHeader;"Candidate Selection Header"."Document Status")
            {
            }
            column(CreatedBy_CandidateSelectionHeader;"Candidate Selection Header"."Created By")
            {
            }
            column(CreatedOn_CandidateSelectionHeader;"Candidate Selection Header"."Created On")
            {
            }
            column(Posted_CandidateSelectionHeader;"Candidate Selection Header".Posted)
            {
            }
            column(NoSeries_CandidateSelectionHeader;"Candidate Selection Header"."No. Series")
            {
            }
            dataitem("Candidate Shortlist Matrix";"Candidate Shortlist Matrix")
            {
                DataItemLink = "Document No"=FIELD("Document No.");
                column(DocumentType_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Document Type")
                {
                }
                column(DocumentNo_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Document No")
                {
                }
                column(VacancyID_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Vacancy ID")
                {
                }
                column(ApplicationNo_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Application No.")
                {
                }
                column(CandidateNo_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Candidate No")
                {
                }
                column(FirstName_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."First Name")
                {
                }
                column(MiddleName_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Middle Name")
                {
                }
                column(LastName_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Last Name")
                {
                }
                column(CompleteDocSubmitted_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Complete Doc Submitted")
                {
                }
                column(ShortlistingOutcome_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Shortlisting Outcome")
                {
                }
                column(CommitteeRemarks_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Committee Remarks")
                {
                }
                column(UnsuccesfullAppReasonCode_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Unsuccesfull App Reason Code")
                {
                }
                column(AbilityTestReportID_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Ability Test Report ID")
                {
                }
                column(PhoneInterviewReportID_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Phone Interview Report ID")
                {
                }
                column(AbilityTestPassScore_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Ability Test Pass Score %")
                {
                }
                column(PhoneInterviewOutcome_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Phone Interview Outcome")
                {
                }
                column(EmployeeNo_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Employee No.")
                {
                }
                column(PhoneNo_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Phone No.")
                {
                }
                column(MobilePhoneNo_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Mobile Phone No.")
                {
                }
                column(Email_CandidateShortlistMatrix;"Candidate Shortlist Matrix".Email)
                {
                }
                column(BirthDate_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Birth Date")
                {
                }
                column(Gender_CandidateShortlistMatrix;"Candidate Shortlist Matrix".Gender)
                {
                }
                column(IDNumber_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."ID Number")
                {
                }
                column(PassportNo_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Passport No.")
                {
                }
                column(TaxRegistrationNo_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Tax Registration No.")
                {
                }
                column(MaritalStatus_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Marital Status")
                {
                }
                column(EthnicGroup_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Ethnic Group")
                {
                }
                column(Nationality_CandidateShortlistMatrix;"Candidate Shortlist Matrix".Nationality)
                {
                }
                column(SpecializationArea_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Specialization Area")
                {
                }
                column(HighestAcademicQualification_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Highest Academic Qualification")
                {
                }
                column(QualificationName_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Qualification Name")
                {
                }
                column(WorkExperienceYears_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Work Experience (Years)")
                {
                }
                column(ManagementExperienceYears_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Management Experience (Years)")
                {
                }
                column(DisabilityCode_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Disability Code")
                {
                }
                column(Disabled_CandidateShortlistMatrix;"Candidate Shortlist Matrix".Disabled)
                {
                }
                column(DisabilityDescription_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Disability Description")
                {
                }
                column(DisabilityCertificateNo_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Disability Certificate No")
                {
                }
                column(Notified_CandidateShortlistMatrix;"Candidate Shortlist Matrix".Notified)
                {
                }
                column(NotifiedOn_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Notified On")
                {
                }
                column(Religion_CandidateShortlistMatrix;"Candidate Shortlist Matrix".Religion)
                {
                }
                column(HighestAcademicHierarchyPoi_CandidateShortlistMatrix;"Candidate Shortlist Matrix"."Highest Academic Hierarchy Poi")
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
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

