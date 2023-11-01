report 69551 "Career Path Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Career Path Report.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "No.";
            column(COMPANY;CompanyInfo.Name)
            {
            }
            column(logo;CompanyInfo.Picture)
            {
            }
            column(PostCode;CompanyInfo."Post Code")
            {
            }
            column(City;CompanyInfo.City)
            {
            }
            column(Address;CompanyInfo.Address)
            {
            }
            column(Address2;CompanyInfo."Address 2")
            {
            }
            column(No_Employee;Employee."No.")
            {
            }
            column(FirstName_Employee;UpperCase(Employee."First Name"))
            {
            }
            column(MiddleName_Employee;Employee."Middle Name")
            {
            }
            column(LastName_Employee;UpperCase(Employee."Last Name"))
            {
            }
            column(JobID_Employee;Employee."Job ID")
            {
            }
            column(Position_Employee;Employee.Position)
            {
            }
            dataitem(Emp;"Employee Qualification")
            {
                DataItemLink = "Employee No."=FIELD("No.");
                column(EmployeeNo_Emp;Emp."Employee No.")
                {
                }
                column(LineNo_Emp;Emp."Line No.")
                {
                }
                column(QualificationCode_Emp;Emp."Qualification Code")
                {
                }
                column(FromDate_Emp;Emp."From Date")
                {
                }
                column(ToDate_Emp;Emp."To Date")
                {
                }
                column(Type_Emp;Emp.Type)
                {
                }
                column(Description_Emp;Emp.Description)
                {
                }
                column(InstitutionCompany_Emp;Emp."Institution/Company")
                {
                }
                column(Cost_Emp;Emp.Cost)
                {
                }
                column(CourseGrade_Emp;Emp."Course Grade")
                {
                }
                column(EmployeeStatus_Emp;Emp."Employee Status")
                {
                }
                column(Comment_Emp;Emp.Comment)
                {
                }
                column(ExpirationDate_Emp;Emp."Expiration Date")
                {
                }
                column(Year_Emp;Emp.Year)
                {
                }
                column(Specialization_Emp;Emp.Specialization)
                {
                }
                column(SpecializedDomainArea_Emp;Emp."Specialized Domain Area")
                {
                }
                column(QualificationCategory_Emp;Emp."Qualification Category")
                {
                }
            }
            dataitem(Position;"Position Requirement")
            {
                RequestFilterFields = "Position ID";
                column(PositionID_Position;UpperCase(Position."Position ID"))
                {
                }
                column(RequirementID_Position;Position."Requirement ID")
                {
                }
                column(QualificationCategory_Position;Position."Qualification Category")
                {
                }
                column(Description_Position;Position.Description)
                {
                }
                column(RequirementType_Position;Position."Requirement Type")
                {
                }
                column(SubstituteQualification_Position;Position."Substitute Qualification")
                {
                }
                column(QualificationCode_Position;Position."Qualification Code")
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        "Position ID": Code[10];
}

