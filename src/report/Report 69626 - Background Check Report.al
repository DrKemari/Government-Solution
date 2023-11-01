report 69626 "Background Check Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Background Check Report.rdlc';

    dataset
    {
        dataitem("Background Checks Header";"Background Checks Header")
        {
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_BackgroundChecksHeader;"Background Checks Header"."Document No.")
            {
            }
            column(DocumentDate_BackgroundChecksHeader;"Background Checks Header"."Document Date")
            {
            }
            column(PanelInterviewReportID_BackgroundChecksHeader;"Background Checks Header"."Panel Interview Report ID")
            {
            }
            column(VacancyID_BackgroundChecksHeader;"Background Checks Header"."Vacancy ID")
            {
            }
            column(ApplicationNo_BackgroundChecksHeader;"Background Checks Header"."Application No.")
            {
            }
            column(LeadHROfficer_BackgroundChecksHeader;"Background Checks Header"."Lead HR Officer")
            {
            }
            column(Description_BackgroundChecksHeader;"Background Checks Header".Description)
            {
            }
            column(CandidateNo_BackgroundChecksHeader;"Background Checks Header"."Candidate No.")
            {
            }
            column(FirstName_BackgroundChecksHeader;"Background Checks Header"."First Name")
            {
            }
            column(MiddleName_BackgroundChecksHeader;"Background Checks Header"."Middle Name")
            {
            }
            column(LastName_BackgroundChecksHeader;"Background Checks Header"."Last Name")
            {
            }
            column(PhoneNo_BackgroundChecksHeader;"Background Checks Header"."Phone No.")
            {
            }
            column(MobilePhoneNo_BackgroundChecksHeader;"Background Checks Header"."Mobile Phone No.")
            {
            }
            column(Email_BackgroundChecksHeader;"Background Checks Header".Email)
            {
            }
            column(BirthDate_BackgroundChecksHeader;"Background Checks Header"."Birth Date")
            {
            }
            column(Gender_BackgroundChecksHeader;"Background Checks Header".Gender)
            {
            }
            column(IDNumber_BackgroundChecksHeader;"Background Checks Header"."ID Number")
            {
            }
            column(PassportNo_BackgroundChecksHeader;"Background Checks Header"."Passport No.")
            {
            }
            column(TaxRegistrationPIN_BackgroundChecksHeader;"Background Checks Header"."Tax Registration(PIN)")
            {
            }
            column(DocumentStatus_BackgroundChecksHeader;"Background Checks Header"."Document Status")
            {
            }
            column(CreatedBy_BackgroundChecksHeader;"Background Checks Header"."Created By")
            {
            }
            column(CreatedOn_BackgroundChecksHeader;"Background Checks Header"."Created On")
            {
            }
            column(NoSeries_BackgroundChecksHeader;"Background Checks Header"."No. Series")
            {
            }
            dataitem("Background Checks Document";"Background Checks Document")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
                column(DocumentNo_BackgroundChecksDocument;"Background Checks Document"."Document No.")
                {
                }
                column(ClearanceDocumentType_BackgroundChecksDocument;"Background Checks Document"."Clearance Document Type")
                {
                }
                column(Description_BackgroundChecksDocument;"Background Checks Document".Description)
                {
                }
                column(ExternalDocumentNo_BackgroundChecksDocument;"Background Checks Document"."External Document No.")
                {
                }
                column(ClearingAgency_BackgroundChecksDocument;"Background Checks Document"."Clearing Agency")
                {
                }
                column(ClearingStatus_BackgroundChecksDocument;"Background Checks Document"."Clearing Status")
                {
                }
                column(AdditionalComments_BackgroundChecksDocument;"Background Checks Document"."Additional Comments")
                {
                }
                column(VacancyID_BackgroundChecksDocument;"Background Checks Document"."Vacancy ID")
                {
                }
                column(ApplicationNo_BackgroundChecksDocument;"Background Checks Document"."Application No.")
                {
                }
            }
            dataitem("Background Checks Reference";"Background Checks Reference")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
                column(DocumentNo_BackgroundChecksReference;"Background Checks Reference"."Document No.")
                {
                }
                column(ApplicationNo_BackgroundChecksReference;"Background Checks Reference"."Application No.")
                {
                }
                column(RefereeId_BackgroundChecksReference;"Background Checks Reference"."Referee Id")
                {
                }
                column(RefereeType_BackgroundChecksReference;"Background Checks Reference"."Referee Type")
                {
                }
                column(Name_BackgroundChecksReference;"Background Checks Reference".Name)
                {
                }
                column(TitleDesignation_BackgroundChecksReference;"Background Checks Reference"."Title/Designation")
                {
                }
                column(Institution_BackgroundChecksReference;"Background Checks Reference".Institution)
                {
                }
                column(PhoneNo_BackgroundChecksReference;"Background Checks Reference"."Phone No.")
                {
                }
                column(Email_BackgroundChecksReference;"Background Checks Reference".Email)
                {
                }
                column(LeadHROfficer_BackgroundChecksReference;"Background Checks Reference"."Lead HR Officer")
                {
                }
                column(InvitedforDetailedRecommend_BackgroundChecksReference;"Background Checks Reference"."Invited for Detailed Recommend")
                {
                }
                column(InvitedOn_BackgroundChecksReference;"Background Checks Reference"."Invited On")
                {
                }
                column(RefereeRecommReportID_BackgroundChecksReference;"Background Checks Reference"."Referee Recomm Report ID")
                {
                }
                column(RecommendedforHire_BackgroundChecksReference;"Background Checks Reference"."Recommended for Hire")
                {
                }
                column(VacancyId_BackgroundChecksReference;"Background Checks Reference"."Vacancy Id")
                {
                }
                column(NoSeries_BackgroundChecksReference;"Background Checks Reference"."No. Series")
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

