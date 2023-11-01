report 69554 "Visitor Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Visitor Register.rdlc';

    dataset
    {
        dataitem("Attendance Register";"Attendance Register")
        {
            RequestFilterFields = Name,Date,Department;
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
            column(EntryNo_AttendanceRegister;"Attendance Register"."Entry No")
            {
            }
            column(EmployeeNo_AttendanceRegister;"Attendance Register"."Employee No")
            {
            }
            column(EmployeeName_AttendanceRegister;"Attendance Register".Name)
            {
            }
            column(Date_AttendanceRegister;"Attendance Register".Date)
            {
            }
            column(Time_AttendanceRegister;"Attendance Register"."Check In Time")
            {
            }
            column(MovementType_AttendanceRegister;"Attendance Register"."Movement Type")
            {
            }
            column(Directorate_AttendanceRegister;"Attendance Register".Directorate)
            {
            }
            column(Department_AttendanceRegister;"Attendance Register".Department)
            {
            }
            column(TypeofVisitor_AttendanceRegister;"Attendance Register"."Type of Visitor")
            {
            }
            column(IDNumber_AttendanceRegister;"Attendance Register"."ID Number")
            {
            }
            column(PassportNo_AttendanceRegister;"Attendance Register"."Passport No.")
            {
            }
            column(TelephoneNo_AttendanceRegister;"Attendance Register"."Telephone No.")
            {
            }
            column(EMail_AttendanceRegister;"Attendance Register"."E-Mail")
            {
            }
            column(ReasonforVisit_AttendanceRegister;"Attendance Register"."Reason for Visit")
            {
            }
            column(Temperature_AttendanceRegister;"Attendance Register".Temperature)
            {
            }
            column(AreaofResidence_AttendanceRegister;"Attendance Register"."Area of Residence")
            {
            }
            column(CheckOutTime_AttendanceRegister;"Attendance Register"."Check Out Time")
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

