report 69146 "Training Evaluation Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Training Evaluation Form.rdlc';

    dataset
    {
        dataitem("Training Evaluation Header";"Training Evaluation Header")
        {
            column(No_TrainingEvaluationHeader;"Training Evaluation Header".No)
            {
            }
            column(ApplicationCode_TrainingEvaluationHeader;"Training Evaluation Header"."Application Code")
            {
            }
            column(CourseTitle_TrainingEvaluationHeader;"Training Evaluation Header"."Course Title")
            {
            }
            column(StartDateTime_TrainingEvaluationHeader;"Training Evaluation Header"."Start DateTime")
            {
            }
            column(EndDateTime_TrainingEvaluationHeader;"Training Evaluation Header"."End DateTime")
            {
            }
            column(Venue_TrainingEvaluationHeader;"Training Evaluation Header".Venue)
            {
            }
            column(Facilitators_TrainingEvaluationHeader;"Training Evaluation Header".Facilitators)
            {
            }
            column(CourseJustification_TrainingEvaluationHeader;"Training Evaluation Header"."Course Justification")
            {
            }
            column(CommentonRelevanceofCourse_TrainingEvaluationHeader;"Training Evaluation Header"."Comment on Relevance of Course")
            {
            }
            column(CourseMethodology_TrainingEvaluationHeader;"Training Evaluation Header"."Course Methodology")
            {
            }
            column(NoSeries_TrainingEvaluationHeader;"Training Evaluation Header"."No. Series")
            {
            }
            column(NoofParticipants_TrainingEvaluationHeader;"Training Evaluation Header"."No. of Participants")
            {
            }
            column(Status_TrainingEvaluationHeader;"Training Evaluation Header".Status)
            {
            }
            column(CreatedBy_TrainingEvaluationHeader;"Training Evaluation Header"."Created By")
            {
            }
            column(CreatedOn_TrainingEvaluationHeader;"Training Evaluation Header"."Created On")
            {
            }
            column(EmployeeNo_TrainingEvaluationHeader;"Training Evaluation Header"."Employee No.")
            {
            }
            column(EmployeeName_TrainingEvaluationHeader;"Training Evaluation Header"."Employee Name")
            {
            }
            column(Type_TrainingEvaluationHeader;"Training Evaluation Header".Type)
            {
            }
            dataitem("Training Evaluations";"Training Evaluations")
            {
                DataItemLink = "Training Evaluation No"=FIELD(No);
                column(TrainingEvaluationNo_TrainingEvaluations;"Training Evaluations"."Training Evaluation No")
                {
                }
                column(Comments_TrainingEvaluations;"Training Evaluations".Comments)
                {
                }
                column(TrainingCategory_TrainingEvaluations;"Training Evaluations"."Training Category")
                {
                }
                column(CategoryDescription_TrainingEvaluations;"Training Evaluations"."Category Description")
                {
                }
                column(RatingCode_TrainingEvaluations;"Training Evaluations"."Rating Code")
                {
                }
                column(RatingDescription_TrainingEvaluations;"Training Evaluations"."Rating Description")
                {
                }
                column(Type_TrainingEvaluations;"Training Evaluations".Type)
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

