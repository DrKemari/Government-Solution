report 80024 "Survey draft"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Survey draft.rdlc';

    dataset
    {
        dataitem("Business Research Survey";"Business Research Survey")
        {
            RequestFilterFields = "Document No.";
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
            column(DocumentNo_BusinessResearchSurvey;"Business Research Survey"."Document No.")
            {
            }
            column(BusinessResearchCategory_BusinessResearchSurvey;"Business Research Survey"."Business Research Category")
            {
            }
            column(DocumentDate_BusinessResearchSurvey;"Business Research Survey"."Document Date")
            {
            }
            column(SurveyType_BusinessResearchSurvey;"Business Research Survey"."Survey Type")
            {
            }
            column(Description_BusinessResearchSurvey;"Business Research Survey".Description)
            {
            }
            column(BusinessResearchTemplateID_BusinessResearchSurvey;"Business Research Survey"."Business Research Template ID")
            {
            }
            column(TargetRespondentType_BusinessResearchSurvey;"Business Research Survey"."Target Respondent Type")
            {
            }
            column(ProjectID_BusinessResearchSurvey;"Business Research Survey"."Project ID")
            {
            }
            column(PrimaryDepartmentID_BusinessResearchSurvey;"Business Research Survey"."Primary Department ID")
            {
            }
            column(PrimaryDirectorateID_BusinessResearchSurvey;"Business Research Survey"."Primary Directorate ID")
            {
            }
            column(Published_BusinessResearchSurvey;"Business Research Survey".Published)
            {
            }
            column(DatePublished_BusinessResearchSurvey;"Business Research Survey"."Date Published")
            {
            }
            column(ResponseDueDate_BusinessResearchSurvey;"Business Research Survey"."Response Due Date")
            {
            }
            column(CreatedBy_BusinessResearchSurvey;"Business Research Survey"."Created By")
            {
            }
            column(CreationDate_BusinessResearchSurvey;"Business Research Survey"."Creation Date")
            {
            }
            column(CreationTime_BusinessResearchSurvey;"Business Research Survey"."Creation Time")
            {
            }
            column(ApprovalStatus_BusinessResearchSurvey;"Business Research Survey"."Approval Status")
            {
            }
            column(NoofResponses_BusinessResearchSurvey;"Business Research Survey"."No. of Responses")
            {
            }
            column(NoSeries_BusinessResearchSurvey;"Business Research Survey"."No. Series")
            {
            }
            dataitem("BR Survey Section";"BR Survey Section")
            {
                DataItemLink = "Survey ID"=FIELD("Document No.");
                column(SurveyID_BRSurveySection;"BR Survey Section"."Survey ID")
                {
                }
                column(SectionCode_BRSurveySection;"BR Survey Section"."Section Code")
                {
                }
                column(Description_BRSurveySection;"BR Survey Section".Description)
                {
                }
                column(SectionCompletionInstruction_BRSurveySection;"BR Survey Section"."Section Completion Instruction")
                {
                }
                column(NoofQuestions_BRSurveySection;"BR Survey Section"."No. of Questions")
                {
                }
                column(TotalWeight_BRSurveySection;"BR Survey Section"."Total Weight %")
                {
                }
                column(QuestionType_BRSurveySection;"BR Survey Section"."Question Type")
                {
                }
                column(ResponseType_BRSurveySection;"BR Survey Section"."Response Type")
                {
                }
                dataitem("BR Survey Question";"BR Survey Question")
                {
                    DataItemLink = "Survey ID"=FIELD("Survey ID"),"Section Code"=FIELD("Section Code");
                    column(QuestionID_BRSurveyQuestion;"BR Survey Question"."Question ID")
                    {
                    }
                    column(Question_BRSurveyQuestion;"BR Survey Question".Question)
                    {
                    }
                    dataitem("BR Survey Score Guide";"BR Survey Score Guide")
                    {
                        DataItemLink = "Survey ID"=FIELD("Survey ID"),"Section Code"=FIELD("Section Code"),"Question ID"=FIELD("Question ID");
                        column(ResponseValue_BRSurveyScoreGuide;"BR Survey Score Guide"."Response Value")
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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

