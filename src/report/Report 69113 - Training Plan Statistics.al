report 69113 "Training Plan Statistics"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Training Plan Statistics.rdlc';

    dataset
    {
        dataitem("Training Requests";"Training Requests")
        {
            column(Code_TrainingRequests;"Training Requests".Code)
            {
            }
            column(TrainingPlanNo_TrainingRequests;"Training Requests"."Training Plan No.")
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
            column(Description_TrainingRequests;"Training Requests".Description)
            {
            }
            column(EmployeeDepartment_TrainingRequests;"Training Requests"."Employee Department")
            {
            }
            dataitem("Training Plan Lines";"Training Plan Lines")
            {
                DataItemLink = "Training Plan Code"=FIELD(Code);
                column(CourseTitle_TrainingPlanLines;"Training Plan Lines"."Course Title")
                {
                }
                column(TrainingPlanCode_TrainingPlanLines;"Training Plan Lines"."Training Plan Code")
                {
                }
                column(PlannedNoofStaff_TrainingPlanLines;"Training Plan Lines"."Planned No. of Staff")
                {
                }
                column(CourseDescription_TrainingPlanLines;"Training Plan Lines"."Course Description")
                {
                }
                column(CI_Picture;CI.Picture)
                {
                }
                column(CI_Address;CI.Address)
                {
                }
                column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
                {
                }
                column(CI_City;CI.City)
                {
                }
                column(CI_PhoneNo;CI."Phone No.")
                {
                }
                column(COMPANYNAME;CompanyName)
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
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

