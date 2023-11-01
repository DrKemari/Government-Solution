report 85407 "Banked Questions Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Banked Questions Report.rdlc';

    dataset
    {
        dataitem("Set Papers Bank";"Set Papers Bank")
        {
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_SetPapersBank;"Set Papers Bank"."Document No.")
            {
            }
            column(LineNo_SetPapersBank;"Set Papers Bank"."Line No.")
            {
            }
            column(Examination_SetPapersBank;"Set Papers Bank".Examination)
            {
            }
            column(ExaminationName_SetPapersBank;"Set Papers Bank"."Examination Name")
            {
            }
            column(Level_SetPapersBank;"Set Papers Bank".Level)
            {
            }
            column(PaperCode_SetPapersBank;"Set Papers Bank"."Paper Code")
            {
            }
            column(PaperName_SetPapersBank;"Set Papers Bank"."Paper Name")
            {
            }
            column(QuestionNo_SetPapersBank;"Set Papers Bank"."Question No.")
            {
            }
            column(TopicCode_SetPapersBank;"Set Papers Bank"."Topic Code")
            {
            }
            column(TopicName_SetPapersBank;"Set Papers Bank"."Topic Name")
            {
            }
            column(QuestionPaper_SetPapersBank;"Set Papers Bank"."Question Paper")
            {
            }
            column(SuggestedSolution_SetPapersBank;"Set Papers Bank"."Suggested Solution")
            {
            }
            column(CompletenessStatus_SetPapersBank;"Set Papers Bank"."Completeness Status")
            {
            }
            column(ExaminationSitting_SetPapersBank;"Set Papers Bank"."Examination Sitting")
            {
            }
            column(SetterCode_SetPapersBank;"Set Papers Bank"."Setter Code")
            {
            }
            column(SetterName_SetPapersBank;"Set Papers Bank"."Setter Name")
            {
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

