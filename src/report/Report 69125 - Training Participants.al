report 69125 "Training Participants"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Training Participants.rdlc';

    dataset
    {
        dataitem("HR Training Participants";"Training Participants")
        {
            column(TrainingCourseCode;"HR Training Participants"."Training Code")
            {
            }
            column(EmployeeCode;"HR Training Participants"."Employee Code")
            {
            }
            column(EmployeeName;"HR Training Participants"."Employee Name")
            {
            }
            column(Objectives;"HR Training Participants".Objectives)
            {
            }
            column(Dim1;"HR Training Participants"."Global Dimension 1 Code")
            {
            }
            column(Dim2;"HR Training Participants"."Global Dimension 2 Code")
            {
            }
            column(Description;Desc)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TrainingNeeds.Get("HR Training Participants"."Training Code");
                  Desc := TrainingNeeds."Requisition No.";
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

    var
        Desc: Text;
        TrainingNeeds: Record "Job Advert Header";
}

