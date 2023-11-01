report 51200 "Scoring Sheet"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Scoring Sheet.rdlc';

    dataset
    {
        dataitem("Evaluation Header";"Evaluation Header")
        {
            column(Code_EvaluationHeader;"Evaluation Header".Code)
            {
            }
            column(ApplicationNo_EvaluationHeader;"Evaluation Header"."Application No.")
            {
            }
            column(ApplicationDescription_EvaluationHeader;"Evaluation Header"."Application Description")
            {
            }
            column(CreatedBy_EvaluationHeader;"Evaluation Header"."Created By")
            {
            }
            column(CreatedOn_EvaluationHeader;"Evaluation Header"."Created On")
            {
            }
            column(Status_EvaluationHeader;"Evaluation Header".Status)
            {
            }
            column(AggregateScore_EvaluationHeader;"Evaluation Header"."Aggregate Score")
            {
            }
            column(MaximumAggregateScore_EvaluationHeader;"Evaluation Header"."Maximum Aggregate Score")
            {
            }
            column(NoSeries_EvaluationHeader;"Evaluation Header"."No. Series")
            {
            }
            column(InstitutionEmail_EvaluationHeader;"Evaluation Header"."Institution Email")
            {
            }
            column(Published_EvaluationHeader;"Evaluation Header".Published)
            {
            }
            column(InsitutionCode_EvaluationHeader;"Evaluation Header"."Insitution Code")
            {
            }
            column(Strength_EvaluationHeader;"Evaluation Header".Strength)
            {
            }
            column(MeetingDate_EvaluationHeader;"Evaluation Header"."Meeting Date")
            {
            }
            column(MeetingLink_EvaluationHeader;"Evaluation Header"."Meeting Link")
            {
            }
            column(MeetingTime_EvaluationHeader;"Evaluation Header"."Meeting Time")
            {
            }
            column(PercentageScore_EvaluationHeader;"Evaluation Header"."Percentage Score")
            {
            }
            column(VerdictCode_EvaluationHeader;"Evaluation Header"."Verdict Code")
            {
            }
            column(VerdictDescription_EvaluationHeader;"Evaluation Header"."Verdict Description")
            {
            }
            dataitem("Application Lines";"Application Lines")
            {
                column(Code_ApplicationLines;"Application Lines".Code)
                {
                }
                column(ComponentCode_ApplicationLines;"Application Lines"."Component Code")
                {
                }
                column(ComponentDescription_ApplicationLines;"Application Lines"."Component Description")
                {
                }
                column(SubComponentCode_ApplicationLines;"Application Lines"."Sub-Component Code")
                {
                }
                column(SubComponentDescription_ApplicationLines;"Application Lines"."Sub-Component Description")
                {
                }
                column(ApplicationNo_ApplicationLines;"Application Lines"."Application No.")
                {
                }
                column(MaximumScore_ApplicationLines;"Application Lines"."Maximum Score")
                {
                }
                column(Score_ApplicationLines;"Application Lines".Score)
                {
                }
                column(Strength_ApplicationLines;"Application Lines".Strength)
                {
                }
                column(Weakness_ApplicationLines;"Application Lines".Weakness)
                {
                }
                column(Recommendation_ApplicationLines;"Application Lines".Recommendation)
                {
                }
                column(EvaluationHeaderNo_ApplicationLines;"Application Lines"."Evaluation Header No.")
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

