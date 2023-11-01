report 69621 "Ability Perfomance Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Ability Perfomance Report.rdlc';

    dataset
    {
        dataitem("Ability Test Response";"Ability Test Response")
        {
            column(Logo;CI.Picture)
            {
            }
            column(ResponseID_AbilityTestResponse;"Ability Test Response"."Response ID")
            {
            }
            column(AbilityTestInvitationNo_AbilityTestResponse;"Ability Test Response"."Ability Test Invitation No.")
            {
            }
            column(VacancyID_AbilityTestResponse;"Ability Test Response"."Vacancy ID")
            {
            }
            column(TestID_AbilityTestResponse;"Ability Test Response"."Test ID")
            {
            }
            column(LeadHROfficer_AbilityTestResponse;"Ability Test Response"."Lead HR Officer")
            {
            }
            column(CandidateNo_AbilityTestResponse;"Ability Test Response"."Candidate No.")
            {
            }
            column(FirstName_AbilityTestResponse;"Ability Test Response"."First Name")
            {
            }
            column(MiddleName_AbilityTestResponse;"Ability Test Response"."Middle Name")
            {
            }
            column(LastName_AbilityTestResponse;"Ability Test Response"."Last Name")
            {
            }
            column(Email_AbilityTestResponse;"Ability Test Response".Email)
            {
            }
            column(TestStartTime_AbilityTestResponse;"Ability Test Response"."Test Start Time")
            {
            }
            column(TestEndTime_AbilityTestResponse;"Ability Test Response"."Test End Time")
            {
            }
            column(TotalNoofQuestions_AbilityTestResponse;"Ability Test Response"."Total No. of Questions")
            {
            }
            column(TotalNoofPassQuestions_AbilityTestResponse;"Ability Test Response"."Total No. of Pass Questions")
            {
            }
            column(AbilityTestPassScore_AbilityTestResponse;"Ability Test Response"."Ability Test Pass Score %")
            {
            }
            column(ResponseStatus_AbilityTestResponse;"Ability Test Response"."Response Status")
            {
            }
            column(ApplicationNo_AbilityTestResponse;"Ability Test Response"."Application No.")
            {
            }
            column(TestDate_AbilityTestResponse;"Ability Test Response"."Test Date")
            {
            }
            dataitem("Test Response Question";"Test Response Question")
            {
                DataItemLink = "Response ID"=FIELD("Response ID");
                column(ResponseID_TestResponseQuestion;"Test Response Question"."Response ID")
                {
                }
                column(TestID_TestResponseQuestion;"Test Response Question"."Test ID")
                {
                }
                column(QuestionID_TestResponseQuestion;"Test Response Question"."Question ID")
                {
                }
                column(Question_TestResponseQuestion;"Test Response Question".Question)
                {
                }
                column(SelectedAnswer_TestResponseQuestion;"Test Response Question"."Selected Answer")
                {
                }
                column(PassFail_TestResponseQuestion;"Test Response Question"."Pass/Fail")
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

