report 69145 "Annual Training Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Annual Training Plan.rdlc';

    dataset
    {
        dataitem("Training Plan Header";"Training Plan Header")
        {
            column(No_TrainingPlanHeader;"Training Plan Header".No)
            {
            }
            column(Description_TrainingPlanHeader;"Training Plan Header".Description)
            {
            }
            column(StartDate_TrainingPlanHeader;"Training Plan Header"."Start Date")
            {
            }
            column(EndDate_TrainingPlanHeader;"Training Plan Header"."End Date")
            {
            }
            column(Global_TrainingPlanHeader;"Training Plan Header".Global)
            {
            }
            column(DepartmentCode_TrainingPlanHeader;"Training Plan Header"."Department Code")
            {
            }
            column(DepartmentName_TrainingPlanHeader;"Training Plan Header"."Department  Name")
            {
            }
            column(YearCode_TrainingPlanHeader;"Training Plan Header"."Year Code")
            {
            }
            column(ApprovedStatus_TrainingPlanHeader;"Training Plan Header"."Approved Status")
            {
            }
            column(CreatedBy_TrainingPlanHeader;"Training Plan Header"."Created By")
            {
            }
            column(CreatedOn_TrainingPlanHeader;"Training Plan Header"."Created On")
            {
            }
            column(CorporateStrategicPlanCode_TrainingPlanHeader;"Training Plan Header"."Corporate Strategic Plan Code")
            {
            }
            column(NoSeries_TrainingPlanHeader;"Training Plan Header"."No. Series")
            {
            }
            column(Blocked_TrainingPlanHeader;"Training Plan Header".Blocked)
            {
            }
            column(TotalEstimatedCost_TrainingPlanHeader;"Training Plan Header"."Total Estimated Cost")
            {
            }
            column(BugdetAvailable_TrainingPlanHeader;"Training Plan Header"."Bugdet Available")
            {
            }
            column(BudgetAllocation_TrainingPlanHeader;"Training Plan Header"."Budget Allocation")
            {
            }
            column(BudgetUtilized_TrainingPlanHeader;"Training Plan Header"."Budget Utilized")
            {
            }
            column(InternalTraining_TrainingPlanHeader;"Training Plan Header"."Internal Training")
            {
            }
            column(CI_Name;CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address;CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2;CI."Address 2" )
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture;CI.Picture)
            {
                IncludeCaption = true;
            }
            column(CI_City;CI.City)
            {
                IncludeCaption = true;
            }
            column(ExternalTraining_TrainingPlanHeader;"Training Plan Header"."External Training")
            {
            }
            dataitem("Training Plan Lines";"Training Plan Lines")
            {
                CalcFields = "Estimated Cost","Course Description","Planned No. of Staff";
                DataItemLink = "Training Plan Code"=FIELD(No);
                column(TaskNo_TrainingPlanLines;"Training Plan Lines"."Task No")
                {
                }
                column(TrainingPlanCode_TrainingPlanLines;"Training Plan Lines"."Training Plan Code")
                {
                }
                column(CourseTitle_TrainingPlanLines;"Training Plan Lines"."Course Title")
                {
                }
                column(PlannedNoofStaff_TrainingPlanLines;"Training Plan Lines"."Planned No. of Staff")
                {
                }
                column(CourseDescription_TrainingPlanLines;"Training Plan Lines"."Course Description")
                {
                }
                column(TargetGroup_TrainingPlanLines;"Training Plan Lines"."Target Group")
                {
                }
                column(Field_TrainingPlanLines;"Training Plan Lines".Field)
                {
                }
                column(ProfessionalAssociation_TrainingPlanLines;"Training Plan Lines"."Professional Association")
                {
                }
                column(Global_TrainingPlanLines;"Training Plan Lines".Global)
                {
                }
                column(TargetGroupCode_TrainingPlanLines;"Training Plan Lines"."Target Group Code")
                {
                }
                column(TotalBudget_TrainingPlanLines;"Training Plan Lines"."Estimated Cost")
                {
                }
                column(ActualNoofStaff_TrainingPlanLines;"Training Plan Lines"."Actual No. of Staff")
                {
                }
                column(ActualSpent_TrainingPlanLines;"Training Plan Lines"."Actual Spent")
                {
                }
                column(ProposedCourseProvider_TrainingPlanLines;"Training Plan Lines"."Proposed Course Provider")
                {
                }
                column(ProposedCourseProviderName_TrainingPlanLines;"Training Plan Lines"."Proposed Course Provider Name")
                {
                }
                column(CourseDuration_TrainingPlanLines;"Training Plan Lines"."Course Duration")
                {
                }
                dataitem(MB;"Training Needs Register")
                {
                    DataItemLink = "Training Plan No"=FIELD("Training Plan Code"),"Course ID"=FIELD("Course Title");
                    column(EmployeeNo_MB;MB."Employee No")
                    {
                    }
                    column(EmployeeName_MB;MB."Employee Name")
                    {
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
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

