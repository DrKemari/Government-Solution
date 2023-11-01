report 69122 "Training Applications"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Training Applications.rdlc';

    dataset
    {
        dataitem("Training Requests";"Training Requests")
        {
            DataItemTableView = SORTING(Code);
            RequestFilterFields = "Code";
            column(CI_Name;CI.Name)
            {
                IncludeCaption = true;
            }
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
            column(Description_TrainingRequests;"Training Requests".Description)
            {
            }
            column(Year_TrainingRequests;"Training Requests".Year)
            {
            }
            column(Provider_TrainingRequests;"Training Requests".Provider)
            {
            }
            column(Status_TrainingRequests;"Training Requests".Status)
            {
            }
            column(EmployeeNo_TrainingRequests;"Training Requests"."Employee No.")
            {
            }
            column(ApplicationDate_TrainingRequests;"Training Requests"."Application Date")
            {
            }
            column(NoSeries_TrainingRequests;"Training Requests"."No. Series")
            {
            }
            column(EmployeeDepartment_TrainingRequests;"Training Requests"."Employee Department")
            {
            }
            column(EmployeeName_TrainingRequests;"Training Requests"."Employee Name")
            {
            }
            column(ProviderName_TrainingRequests;"Training Requests"."Provider Name")
            {
            }
            column(NoofParticipants_TrainingRequests;"Training Requests"."No. of Participants")
            {
            }
            column(ApprovedCost_TrainingRequests;"Training Requests"."Approved Cost")
            {
            }
            column(GlobalDimension1Code_TrainingRequests;"Training Requests"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_TrainingRequests;"Training Requests"."Global Dimension 2 Code")
            {
            }
            column(ActualStartDate_TrainingRequests;"Training Requests"."Actual Start Date")
            {
            }
            column(ActualEndDate_TrainingRequests;"Training Requests"."Actual End Date")
            {
            }
            column(EstimatedCost_TrainingRequests;"Training Requests"."Estimated Cost")
            {
            }
            column(ImprestCreated_TrainingRequests;"Training Requests"."Imprest Created")
            {
            }
            column(TrainingPlanCost_TrainingRequests;"Training Requests"."Training Plan Cost")
            {
            }
            column(Budget_TrainingRequests;"Training Requests".Budget)
            {
            }
            column(Actual_TrainingRequests;"Training Requests".Actual)
            {
            }
            column(Commitment_TrainingRequests;"Training Requests".Commitment)
            {
            }
            column(GLAccount_TrainingRequests;"Training Requests"."GL Account")
            {
            }
            column(BudgetName_TrainingRequests;"Training Requests"."Budget Name")
            {
            }
            column(AvailableFunds_TrainingRequests;"Training Requests"."Available Funds")
            {
            }
            column(Local_TrainingRequests;"Training Requests"."Local")
            {
            }
            column(RequiresFlight_TrainingRequests;"Training Requests"."Requires Flight")
            {
            }
            column(SupervisorNo_TrainingRequests;"Training Requests"."Supervisor No.")
            {
            }
            column(SupervisorName_TrainingRequests;"Training Requests"."Supervisor Name")
            {
            }
            column(TrainingPlanNo_TrainingRequests;"Training Requests"."Training Plan No.")
            {
            }
            column(TrainingPlanDescription_TrainingRequests;"Training Requests"."Training Plan Description")
            {
            }
            column(CreatedBy_TrainingRequests;"Training Requests"."Created By")
            {
            }
            column(CreatedOn_TrainingRequests;"Training Requests"."Created On")
            {
            }
            column(TrainingType_TrainingRequests;"Training Requests"."Training Type")
            {
            }
            column(TrainingDurationHrs_TrainingRequests;"Training Requests"."Training Duration Hrs")
            {
            }
            column(PlannedBudget_TrainingRequests;"Training Requests"."Planned Budget")
            {
            }
            column(PlannedNotobeTrained_TrainingRequests;"Training Requests"."Planned No. to be Trained")
            {
            }
            column(TotalPerdiemCosts_TrainingRequests;"Training Requests"."Total Per diem Costs")
            {
            }
            column(TotalProcurementCost_TrainingRequests;"Training Requests"."Total Procurement Cost")
            {
            }
            column(OtherCosts_TrainingRequests;"Training Requests"."Other Costs")
            {
            }
            column(ServiceProviderCost_TrainingRequests;"Training Requests"."Service Provider Cost")
            {
            }
            column(MemoNo_TrainingRequests;"Training Requests"."Memo No.")
            {
            }
            column(EvaluationSummary_TrainingRequests;"Training Requests"."Evaluation Summary")
            {
            }
            column(EntryNo_TrainingRequests;"Training Requests"."Entry No.")
            {
            }
            column(TrainingVenueRegionCode_TrainingRequests;"Training Requests"."Training Venue Region Code")
            {
            }
            column(TrainingVenueRegion_TrainingRequests;"Training Requests"."Training Venue Region")
            {
            }
            column(TrainingResponsibilityCode_TrainingRequests;"Training Requests"."Training Responsibility Code")
            {
            }
            column(TrainingResponsibility_TrainingRequests;"Training Requests"."Training Responsibility")
            {
            }
            column(Requestor_TrainingRequests;"Training Requests".Requestor)
            {
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
            dataitem("Training Participants";"Training Participants")
            {
                DataItemLink = "Training Code"=FIELD(Code);
                column(EmployeeCode;"Training Participants"."Employee Code")
                {
                }
                column(EmployeeName;"Training Participants"."Employee Name")
                {
                }
                column(TrainingCode_TrainingParticipants;"Training Participants"."Training Code")
                {
                }
                column(JobTitle;"Training Participants"."Job Title")
                {
                }
                column(JobTitle_TrainingParticipants;"Training Participants"."Job Title")
                {
                }
                column(Destination_TrainingParticipants;"Training Participants".Destination)
                {
                }
                column(NoofDays_TrainingParticipants;"Training Participants"."No. of Days")
                {
                }
                column(TotalAmount_TrainingParticipants;"Training Participants"."Total Amount")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //MESSAGE(FORMAT("Training Participants"."Employee Code"));
                end;
            }
            dataitem("Training Cost";"Training Cost")
            {
                DataItemLink = "Training ID"=FIELD(Code);
                column(CostItem_TrainingCost;"Training Cost"."Cost Item")
                {
                }
                column(Cost_TrainingCost;"Training Cost".Cost)
                {
                }
                column(CostItemDescription_TrainingCost;"Training Cost"."Cost Item Description")
                {
                }
                column(No_TrainingCost;"Training Cost"."No.")
                {
                }
                column(TrainingID_TrainingCost;"Training Cost"."Training ID")
                {
                }
                column(ItemDescription_TrainingCost;"Training Cost"."Item Description")
                {
                }
                column(Quantity_TrainingCost;"Training Cost".Quantity)
                {
                }
                column(Description_TrainingCost;"Training Cost".Description)
                {
                }
                column(UnitofMeasure_TrainingCost;"Training Cost"."Unit of Measure")
                {
                }
                column(UnitCostLCY_TrainingCost;"Training Cost"."Unit Cost (LCY)")
                {
                }
                column(LineAmount_TrainingCost;"Training Cost"."Line Amount")
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

    trigger OnPreReport()
    begin
                           CI.Get();
                           CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HREmp: Record Employee;
        ApproverName: Text[30];
        HR_Training_ApplicationsCaptionLbl: Label 'HR Training Applications';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        Training_Application_FormCaptionLbl: Label 'Training Application Form';
        Name_of_Training_CourseCaptionLbl: Label 'Name of Training Course';
        From__Date_CaptionLbl: Label 'From (Date)';
        Duration_CaptionLbl: Label 'Duration ';
        To__Date_CaptionLbl: Label 'To (Date)';
        Cost_of_TrainingCaptionLbl: Label 'Cost of Training';
        How_the_Training_Course_Will_Complement_Enhance_my_Skills_in_Relation_to_the_Job_RequirementsCaptionLbl: Label 'How the Training Course Will Complement/Enhance my Skills in Relation to the Job Requirements';
        Brief_Description_of_Training_CourseCaptionLbl: Label 'Brief Description of Training Course';
        CommentsCaptionLbl: Label 'Comments';
        Comments_By_CaptionLbl: Label 'Comments By:';
        End_of_CommentsCaptionLbl: Label 'End of Comments';
        Approved_ByCaptionLbl: Label 'Approved By';
        ApprovalsCaptionLbl: Label 'Approvals';
        SignatureCaptionLbl: Label 'Signature';
}

