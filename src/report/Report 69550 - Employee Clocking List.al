report 69550 "Employee Clocking List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Employee Clocking List.rdlc';

    dataset
    {
        dataitem("Clocking Entry";"Clocking Entry")
        {
            RequestFilterFields = "Employee No",Date,Department;
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
            column(EntryNo_ClockingEntry;"Clocking Entry"."Entry No")
            {
            }
            column(EmployeeNo_ClockingEntry;"Clocking Entry"."Employee No")
            {
            }
            column(EmployeeName_ClockingEntry;"Clocking Entry"."Employee Name")
            {
            }
            column(Date_ClockingEntry;"Clocking Entry".Date)
            {
            }
            column(Time_ClockingEntry;"Clocking Entry".Time)
            {
            }
            column(Type_ClockingEntry;"Clocking Entry".Type)
            {
            }
            column(Directorate_ClockingEntry;"Clocking Entry".Directorate)
            {
            }
            column(Department_ClockingEntry;"Clocking Entry".Department)
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

