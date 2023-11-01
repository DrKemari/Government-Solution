report 85408 "Setters Evaluation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Setters Evaluation Report.rdlc';

    dataset
    {
        dataitem("Setters Evaluation Header";"Setters Evaluation Header")
        {
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_SettersEvaluationHeader;"Setters Evaluation Header"."Document No.")
            {
            }
            column(EngagementCategory_SettersEvaluationHeader;"Setters Evaluation Header"."Engagement Category")
            {
            }
            column(ModeratorNo_SettersEvaluationHeader;"Setters Evaluation Header"."Moderator No")
            {
            }
            column(ModeratorEmail_SettersEvaluationHeader;"Setters Evaluation Header"."Moderator Email")
            {
            }
            column(PlannedStartDate_SettersEvaluationHeader;"Setters Evaluation Header"."Planned Start Date")
            {
            }
            column(PlannedEndDate_SettersEvaluationHeader;"Setters Evaluation Header"."Planned End Date")
            {
            }
            column(GlobalDimensionDim1Code_SettersEvaluationHeader;"Setters Evaluation Header"."Global Dimension Dim 1 Code")
            {
            }
            column(GlobalDimensionDim2Code_SettersEvaluationHeader;"Setters Evaluation Header"."Global Dimension  Dim 2 Code")
            {
            }
            column(DimensionSetID_SettersEvaluationHeader;"Setters Evaluation Header"."Dimension Set ID")
            {
            }
            column(ExamSitting_SettersEvaluationHeader;"Setters Evaluation Header"."Exam Sitting")
            {
            }
            column(DocumentDate_SettersEvaluationHeader;"Setters Evaluation Header"."Document Date")
            {
            }
            column(CreatedBy_SettersEvaluationHeader;"Setters Evaluation Header"."Created By")
            {
            }
            column(CreatedOn_SettersEvaluationHeader;"Setters Evaluation Header"."Created On")
            {
            }
            column(Status_SettersEvaluationHeader;"Setters Evaluation Header".Status)
            {
            }
            column(ModeratorName_SettersEvaluationHeader;"Setters Evaluation Header"."Moderator Name")
            {
            }
            dataitem("Setters Evaluation Lines";"Setters Evaluation Lines")
            {
                DataItemLink = "Document No"=FIELD("Document No.");
                column(DocumentNo_SettersEvaluationLines;"Setters Evaluation Lines"."Document No")
                {
                }
                column(LineNo_SettersEvaluationLines;"Setters Evaluation Lines"."Line No")
                {
                }
                column(SetterCode_SettersEvaluationLines;"Setters Evaluation Lines"."Setter Code")
                {
                }
                column(NameofSetter_SettersEvaluationLines;"Setters Evaluation Lines"."Name of Setter")
                {
                }
                column(Examination_SettersEvaluationLines;"Setters Evaluation Lines".Examination)
                {
                }
                column(paper_SettersEvaluationLines;"Setters Evaluation Lines".paper)
                {
                }
                column(SyllabusCoverage_SettersEvaluationLines;"Setters Evaluation Lines"."Syllabus Coverage")
                {
                }
                column(Qualityofquestions_SettersEvaluationLines;"Setters Evaluation Lines"."Quality of questions")
                {
                }
                column(Originality_SettersEvaluationLines;"Setters Evaluation Lines".Originality)
                {
                }
                column(Mixoftheoryandpractical_SettersEvaluationLines;"Setters Evaluation Lines"."Mix of theory and practical")
                {
                }
                column(Qualityofsolutions_SettersEvaluationLines;"Setters Evaluation Lines"."Quality of solutions")
                {
                }
                column(Othercommentsegtimeliness_SettersEvaluationLines;"Setters Evaluation Lines"."Other comments eg timeliness")
                {
                }
                column(Recommendation_SettersEvaluationLines;"Setters Evaluation Lines".Recommendation)
                {
                }
                column(Signture_SettersEvaluationLines;"Setters Evaluation Lines".Signture)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Setters Evaluation Lines".CalcFields(Signture);
                end;
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

    var
        CI: Record "Company Information";
}

