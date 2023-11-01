report 51150 "Summary Evaluation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Summary Evaluation Report.rdlc';

    dataset
    {
        dataitem("Evaluation Header";"Evaluation Header")
        {
            CalcFields = "Aggregate Score","Maximum Aggregate Score";
            RequestFilterFields = "Code";
            column(AggregateScore_ProgrammeEvaluationHeader;"Evaluation Header"."Aggregate Score")
            {
            }
            column(ApplicationNo_ProgrammeEvaluationHeader;"Evaluation Header"."Application No.")
            {
            }
            column(ApplicationDescription_ProgrammeEvaluationHeader;"Evaluation Header"."Application Description")
            {
            }
            column(Type_ProgrammeEvaluationHeader;"Evaluation Header"."Institution Email")
            {
            }
            column(ResourceNo_ProgrammeEvaluationHeader;"Evaluation Header"."Insitution Code")
            {
            }
            column(ResourceName_ProgrammeEvaluationHeader;"Evaluation Header".Strength)
            {
            }
            column(InstitutionName_ProgrammeEvaluationHeader;"Evaluation Header".Strength)
            {
            }
            column(Verdict_ProgrammeEvaluationHeader;"Evaluation Header"."Verdict Description")
            {
            }
            column(InstitutionEmail_ProgrammeEvaluationHeader;"Evaluation Header"."Institution Email")
            {
            }
            column(MaximumAggregateScore_ProgrammeEvaluationHeader;"Evaluation Header"."Maximum Aggregate Score")
            {
            }
            column(recCount;recCount)
            {
            }
            column(PercentageScore;"Evaluation Header"."Percentage Score")
            {
            }
            dataitem("Application Lines";"Application Lines")
            {
                DataItemLink = "Evaluation Header No."=FIELD(Code);
                column(ComponentDescription_ProgrammeEvaluationLines;"Application Lines"."Component Description")
                {
                }
                column(Score_ProgrammeEvaluationLines;"Application Lines".Score)
                {
                }
                column(MaximumScore_ProgrammeEvaluationLines;"Application Lines"."Maximum Score")
                {
                }
                column(ComponentCode_ProgrammeEvaluationLines;"Application Lines"."Component Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    recCount:=recCount+1;
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
        recCount: Integer;
        PercentageScore: Decimal;
        ProgramHeader: Record "Accreditation Application";
}

