report 80030 "Responses Reports2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Responses Reports2.rdlc';

    dataset
    {
        dataitem("Business Research Response";"Business Research Response")
        {
            RequestFilterFields = "Document No.","Survey ID","Participant ID";
            column(DocumentNo_BusinessResearchResponse;"Business Research Response"."Document No.")
            {
            }
            column(BusinessResearchCategory_BusinessResearchResponse;"Business Research Response"."Business Research Category")
            {
            }
            column(DocumentDate_BusinessResearchResponse;"Business Research Response"."Document Date")
            {
            }
            column(SurveyID_BusinessResearchResponse;"Business Research Response"."Survey ID")
            {
            }
            column(SurveyType_BusinessResearchResponse;"Business Research Response"."Survey Type")
            {
            }
            column(TargetRespondentType_BusinessResearchResponse;"Business Research Response"."Target Respondent Type")
            {
            }
            column(ParticipantID_BusinessResearchResponse;"Business Research Response"."Participant ID")
            {
            }
            column(Name_BusinessResearchResponse;"Business Research Response".Name)
            {
            }
            column(Description_BusinessResearchResponse;"Business Research Response".Description)
            {
            }
            column(ProjectID_BusinessResearchResponse;"Business Research Response"."Project ID")
            {
            }
            column(PrimaryDepartmentID_BusinessResearchResponse;"Business Research Response"."Primary Department ID")
            {
            }
            column(PrimaryDirectorateID_BusinessResearchResponse;"Business Research Response"."Primary Directorate ID")
            {
            }
            column(NoSeries_BusinessResearchResponse;"Business Research Response"."No. Series")
            {
            }
            column(DueDate_BusinessResearchResponse;"Business Research Response"."Due Date")
            {
            }
            column(Status_BusinessResearchResponse;"Business Research Response".Status)
            {
            }
            column(SubmittedDate_BusinessResearchResponse;"Business Research Response"."Submitted Date")
            {
            }
            column(IDNumber_BusinessResearchResponse;"Business Research Response"."ID Number")
            {
            }
            dataitem("BR Response Section";"BR Response Section")
            {
                DataItemLink = "Survey Response ID"=FIELD("Document No.");
                column(SectionCode_BRResponseSection;"BR Response Section"."Section Code")
                {
                }
                column(Description_BRResponseSection;"BR Response Section".Description)
                {
                }
                dataitem("BR Response Question";"BR Response Question")
                {
                    DataItemLink = "Section Code"=FIELD("Section Code"),"Survey Response ID"=FIELD("Survey Response ID");
                    column(SurveyResponseID_BRResponseQuestion;"BR Response Question"."Survey Response ID")
                    {
                    }
                    column(SectionCode_BRResponseQuestion;"BR Response Question"."Section Code")
                    {
                    }
                    column(QuestionID_BRResponseQuestion;"BR Response Question"."Question ID")
                    {
                    }
                    column(Question_BRResponseQuestion;"BR Response Question".Question)
                    {
                    }
                    column(RatingType_BRResponseQuestion;"BR Response Question"."Rating Type")
                    {
                    }
                    column(ResponseValue_BRResponseQuestion;"BR Response Question"."Response Value")
                    {
                    }
                    column(GeneralResponseStatement_BRResponseQuestion;"BR Response Question"."General Response Statement")
                    {
                    }
                    column(AssignedWeight_BRResponseQuestion;"BR Response Question"."Assigned Weight %")
                    {
                    }
                    column(DesiredPerfomanceDirection_BRResponseQuestion;"BR Response Question"."Desired Perfomance Direction")
                    {
                    }
                    column(OptionTextResponseType_BRResponseQuestion;"BR Response Question"."Option Text Response Type")
                    {
                    }
                    column(ParentQuestionID_BRResponseQuestion;"BR Response Question"."Parent Question ID")
                    {
                    }
                    column(QuestionType_BRResponseQuestion;"BR Response Question"."Question Type")
                    {
                    }
                    column(ResponseType_BRResponseQuestion;"BR Response Question"."Response Type")
                    {
                    }
                    column(NoofBranchLogicConditions_BRResponseQuestion;"BR Response Question"."No. of Branch Logic Conditions")
                    {
                    }
                    column(BranchLogicQuestion_BRResponseQuestion;"BR Response Question"."Branch Logic Question")
                    {
                    }
                    column(Mandatory_BRResponseQuestion;"BR Response Question".Mandatory)
                    {
                    }
                    dataitem("BR Multiple Response";"BR Multiple Response")
                    {
                        DataItemLink = "Survey Response ID"=FIELD("Survey Response ID"),"Section Code"=FIELD("Section Code"),"Question ID"=FIELD("Question ID");
                        DataItemTableView = WHERE("Select Choice"=CONST(true));
                        column(ResponseValue_BRMultipleResponse;"BR Multiple Response"."Response Value")
                        {
                        }
                    }
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

