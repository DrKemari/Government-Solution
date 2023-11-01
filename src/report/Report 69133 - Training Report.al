report 69133 "Training Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Training Report.rdlc';

    dataset
    {
        dataitem("Training Requests";"Training Requests")
        {
            column(Code_TrainingRequests;"Training Requests".Code)
            {
            }
            column(CourseTitle_TrainingRequests;"Training Requests"."Course Title")
            {
            }
            column(StartDateTime_TrainingRequests;"Training Requests"."Start DateTime")
            {
            }
            column(EndDateTime_TrainingRequests;"Training Requests"."End DateTime")
            {
            }
            column(DurationUnits_TrainingRequests;"Training Requests"."Duration Units")
            {
            }
            column(Duration_TrainingRequests;"Training Requests".Duration)
            {
            }
            column(Cost_TrainingRequests;"Training Requests".Cost)
            {
            }
            column(Location_TrainingRequests;"Training Requests".Location)
            {
            }
            column(CompanyLogo;CompanyInfo.Picture)
            {
            }
            column(CreatedBy_TrainingRequests;"Training Requests"."Created By")
            {
            }
            column(CreatedOn_TrainingRequests;"Training Requests"."Created On")
            {
            }
            column(CompanyName;CompanyInfo.Name)
            {
            }
            column(CompanyAddress;CompanyInfo.Address)
            {
            }
            column(CompanyAddress2;CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode;CompanyInfo."Post Code")
            {
            }
            column(CompanyCity;CompanyInfo.City)
            {
            }
            column(CompanyPhone;CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax;CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail;CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite;CompanyInfo."Home Page")
            {
            }
            column(Description_TrainingRequests;"Training Requests".Description)
            {
            }
            column(TrainingPlanNo_TrainingRequests;"Training Requests"."Training Plan No.")
            {
            }
            column(TrainingPlanDescription_TrainingRequests;"Training Requests"."Training Plan Description")
            {
            }
            column(TrainingType_TrainingRequests;"Training Requests"."Training Type")
            {
            }
            column(TrainingDurationHrs_TrainingRequests;"Training Requests"."Training Duration Hrs")
            {
            }
            column(OtherCosts_TrainingRequests;"Training Requests"."Other Costs")
            {
            }
            column(ServiceProviderCost_TrainingRequests;"Training Requests"."Service Provider Cost")
            {
            }
            column(EvaluationSummary_TrainingRequests;"Training Requests"."Evaluation Summary")
            {
            }
            dataitem("Trainers Involved";"Trainers Involved")
            {
                DataItemLink = "Training Application No"=FIELD(Code);
                column(IDNo_TrainersInvolved;"Trainers Involved"."ID No.")
                {
                }
                column(TrainerFullName_TrainersInvolved;"Trainers Involved"."Trainer Full Name")
                {
                }
                column(Comments_TrainersInvolved;"Trainers Involved".Comments)
                {
                }
                column(Email_TrainersInvolved;"Trainers Involved".Email)
                {
                }
                column(TrainingApplicationNo_TrainersInvolved;"Trainers Involved"."Training Application No")
                {
                }
            }
            dataitem("Employee Scedule";"Employee Scedule")
            {
                DataItemLink = "Training Application No."=FIELD(Code);
                DataItemTableView = WHERE(Type=FILTER(Attendance));
                column(EntryNo_EmployeeScedule;"Employee Scedule"."Entry No.")
                {
                }
                column(EmployeeNo_EmployeeScedule;"Employee Scedule"."Employee No.")
                {
                }
                column(Date_EmployeeScedule;"Employee Scedule".Date)
                {
                }
                column(Type_EmployeeScedule;"Employee Scedule".Type)
                {
                }
                column(TrainingApplicationNo_EmployeeScedule;"Employee Scedule"."Training Application No.")
                {
                }
                column(EmployeeName_EmployeeScedule;"Employee Scedule"."Employee Name")
                {
                }
                column(Day_EmployeeScedule;"Employee Scedule".Day)
                {
                }
            }
            dataitem("Training Feedback Suggestions";"Training Feedback Suggestions")
            {
                DataItemLink = "Training Application No"=FIELD(Code);
                column(EntryNo_TrainingFeedbackSuggestions;"Training Feedback Suggestions"."Entry No.")
                {
                }
                column(TrainingApplicationNo_TrainingFeedbackSuggestions;"Training Feedback Suggestions"."Training Application No")
                {
                }
                column(Comments_TrainingFeedbackSuggestions;"Training Feedback Suggestions".Comments)
                {
                }
                column(TrainingCategory_TrainingFeedbackSuggestions;"Training Feedback Suggestions"."Training Category")
                {
                }
                column(CategoryDescription_TrainingFeedbackSuggestions;"Training Feedback Suggestions"."Category Description")
                {
                }
                column(Rating_TrainingFeedbackSuggestions;"Training Feedback Suggestions".Rating)
                {
                }
                column(FeedbackType;FeedbackType)
                {
                }
                column(FeedbackRate;FeedbackRate)
                {
                }
                column(FeedbackDescription;FeedbackDescription)
                {
                }
                column(FeedbackComment;FeedbackComment)
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

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        FeedbackS: Record "Training Feedback Suggestions";
        EmployeeScedule: Record "Employee Scedule";
        FeedbackDescription: Text;
        FeedbackType: Text;
        EmployeeName: Text;
        EmployeeNo: Text;
        ScheduleNo: Code[30];
        EmployeeDate: Date;
        EmployeeDay: Text;
        FeedbackRate: Code[10];
        FeedbackComment: Text;
}

