report 69112 "Departmental Trainings"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Departmental Trainings.rdlc';

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
            column(Description_TrainingRequests;"Training Requests".Description)
            {
            }
            column(EmployeeDepartment_TrainingRequests;"Training Requests"."Employee Department")
            {
            }
            dataitem("Employee Scedule";"Employee Scedule")
            {
                DataItemLink = "Training Application No."=FIELD(Code);
                DataItemTableView = WHERE(Type=FILTER(Attendance));
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

