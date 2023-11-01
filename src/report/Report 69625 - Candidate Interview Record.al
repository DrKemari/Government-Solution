report 69625 "Candidate Interview Record"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Candidate Interview Record.rdlc';

    dataset
    {
        dataitem("Candidate Interview Record";"Candidate Interview Record")
        {
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_CandidateInterviewRecord;"Candidate Interview Record"."Document No.")
            {
            }
            column(InterviewInvitationNo_CandidateInterviewRecord;"Candidate Interview Record"."Interview Invitation No.")
            {
            }
            column(InterviewScoresheetTemplate_CandidateInterviewRecord;"Candidate Interview Record"."Interview Scoresheet Template")
            {
            }
            column(VacancyID_CandidateInterviewRecord;"Candidate Interview Record"."Vacancy ID")
            {
            }
            column(CandidateShortlistVouchNo_CandidateInterviewRecord;"Candidate Interview Record"."Candidate Shortlist Vouch No.")
            {
            }
            column(ApplicationNo_CandidateInterviewRecord;"Candidate Interview Record"."Application No.")
            {
            }
            column(CandidateNo_CandidateInterviewRecord;"Candidate Interview Record"."Candidate No.")
            {
            }
            column(FirstName_CandidateInterviewRecord;"Candidate Interview Record"."First Name")
            {
            }
            column(MiddleName_CandidateInterviewRecord;"Candidate Interview Record"."Middle Name")
            {
            }
            column(LastName_CandidateInterviewRecord;"Candidate Interview Record"."Last Name")
            {
            }
            column(InterviewDate_CandidateInterviewRecord;"Candidate Interview Record"."Interview Date")
            {
            }
            column(InterviewStartTime_CandidateInterviewRecord;"Candidate Interview Record"."Interview Start Time")
            {
            }
            column(InterviewEndTime_CandidateInterviewRecord;"Candidate Interview Record"."Interview End Time")
            {
            }
            column(InterviewVenue_CandidateInterviewRecord;"Candidate Interview Record"."Interview Venue")
            {
            }
            column(RoomNo_CandidateInterviewRecord;"Candidate Interview Record"."Room No.")
            {
            }
            column(AssignedPanelID_CandidateInterviewRecord;"Candidate Interview Record"."Assigned Panel ID")
            {
            }
            column(PanelMemberNo_CandidateInterviewRecord;"Candidate Interview Record"."Panel Member No.")
            {
            }
            column(Member_CandidateInterviewRecord;"Candidate Interview Record".Member)
            {
            }
            column(PanelInterviewOutcome_CandidateInterviewRecord;"Candidate Interview Record"."Panel Interview Outcome")
            {
            }
            column(PanelInterviewScore_CandidateInterviewRecord;"Candidate Interview Record"."Panel Interview Score %")
            {
            }
            column(PanelistInterviewRemarks_CandidateInterviewRecord;"Candidate Interview Record"."Panelist Interview Remarks")
            {
            }
            column(UnsuccesfulAppReasonCode_CandidateInterviewRecord;"Candidate Interview Record"."Unsuccesful App Reason Code")
            {
            }
            column(DocumentStatus_CandidateInterviewRecord;"Candidate Interview Record"."Document Status")
            {
            }
            column(DocumentDate_CandidateInterviewRecord;"Candidate Interview Record"."Document Date")
            {
            }
            column(Posted_CandidateInterviewRecord;"Candidate Interview Record".Posted)
            {
            }
            column(PostedBy_CandidateInterviewRecord;"Candidate Interview Record"."Posted By")
            {
            }
            column(PostedOn_CandidateInterviewRecord;"Candidate Interview Record"."Posted On")
            {
            }
            dataitem("Candidate Interview Question";"Candidate Interview Question")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
                column(DocumentNo_CandidateInterviewQuestion;"Candidate Interview Question"."Document No.")
                {
                }
                column(InterviewScoresheetTemplate_CandidateInterviewQuestion;"Candidate Interview Question"."Interview Scoresheet Template")
                {
                }
                column(QuestionCategory_CandidateInterviewQuestion;"Candidate Interview Question"."Question Category")
                {
                }
                column(QuestionID_CandidateInterviewQuestion;"Candidate Interview Question"."Question ID")
                {
                }
                column(Description_CandidateInterviewQuestion;"Candidate Interview Question".Description)
                {
                }
                column(QuestionType_CandidateInterviewQuestion;"Candidate Interview Question"."Question Type")
                {
                }
                column(CloseEndedQnSubtype_CandidateInterviewQuestion;"Candidate Interview Question"."Close Ended Qn Subtype")
                {
                }
                column(Weight_CandidateInterviewQuestion;"Candidate Interview Question".Weight)
                {
                }
                column(Rating_CandidateInterviewQuestion;"Candidate Interview Question".Rating)
                {
                }
                column(EvaluationComments_CandidateInterviewQuestion;"Candidate Interview Question"."Evaluation Comments")
                {
                }
                column(MaximumRawScore_CandidateInterviewQuestion;"Candidate Interview Question"."Maximum Raw Score")
                {
                }
                column(WeightedScore_CandidateInterviewQuestion;"Candidate Interview Question"."Weighted Score %")
                {
                }
                column(ScoreCode_CandidateInterviewQuestion;"Candidate Interview Question"."Score Code")
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

