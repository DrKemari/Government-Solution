report 69620 "Interview Template"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Interview Template.rdlc';

    dataset
    {
        dataitem("HR Screening Template";"HR Screening Template")
        {
            column(Logo;CI.Picture)
            {
            }
            column(Description;Description)
            {
            }
            column(TemplateType_HRScreeningTemplate;"HR Screening Template"."Template Type")
            {
            }
            column(Code_HRScreeningTemplate;"HR Screening Template".Code)
            {
            }
            column(Description_HRScreeningTemplate;"HR Screening Template".Description)
            {
            }
            column(EffectiveDate_HRScreeningTemplate;"HR Screening Template"."Effective Date")
            {
            }
            column(NoofQuestions_HRScreeningTemplate;"HR Screening Template"."No. of Questions")
            {
            }
            column(TotalWeight_HRScreeningTemplate;"HR Screening Template"."Total Weight")
            {
            }
            column(CreatedBy_HRScreeningTemplate;"HR Screening Template"."Created By")
            {
            }
            column(CreatedOn_HRScreeningTemplate;"HR Screening Template"."Created On")
            {
            }
            column(CreatedTime_HRScreeningTemplate;"HR Screening Template"."Created Time")
            {
            }
            column(Blocked_HRScreeningTemplate;"HR Screening Template".Blocked)
            {
            }
            dataitem("Hr Screening Template Line";"Hr Screening Template Line")
            {
                DataItemLink = "Template ID"=FIELD(Code);
                column(TemplateType_HrScreeningTemplateLine;"Hr Screening Template Line"."Template Type")
                {
                }
                column(TemplateID_HrScreeningTemplateLine;"Hr Screening Template Line"."Template ID")
                {
                }
                column(QuestionCategory_HrScreeningTemplateLine;"Hr Screening Template Line"."Question Category")
                {
                }
                column(QuestionId_HrScreeningTemplateLine;"Hr Screening Template Line"."Question Id")
                {
                }
                column(Description_HrScreeningTemplateLine;"Hr Screening Template Line".Description)
                {
                }
                column(QuestionType_HrScreeningTemplateLine;"Hr Screening Template Line"."Question Type")
                {
                }
                column(ClosedendedQuestionSubType_HrScreeningTemplateLine;"Hr Screening Template Line"."Closed-ended Question Sub-Type")
                {
                }
                column(Weight_HrScreeningTemplateLine;"Hr Screening Template Line".Weight)
                {
                }
                column(LineNo_HrScreeningTemplateLine;"Hr Screening Template Line"."Line No.")
                {
                }
                column(MinimumPointsAccepted_HrScreeningTemplateLine;"Hr Screening Template Line"."Minimum Points Accepted")
                {
                }
                column(MaximumPointsAccepted_HrScreeningTemplateLine;"Hr Screening Template Line"."Maximum Points Accepted")
                {
                }
                column(DefaultRatingScale_HrScreeningTemplateLine;"Hr Screening Template Line"."Default Rating Scale")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                Description:=Format("HR Screening Template"."Template Type");
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        Description: Text;
}

