report 85006 "Staff Appointment Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Staff Appointment Voucher.rdlc';

    dataset
    {
        dataitem("Appointment Header";"Appointment Header")
        {
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
            column(Code_AppointmentHeader;"Appointment Header".Code)
            {
            }
            column(DocumentType_AppointmentHeader;"Appointment Header"."Document Type")
            {
            }
            column(DocumentDate_AppointmentHeader;"Appointment Header"."Document Date")
            {
            }
            column(ProjectStaffTemplateID_AppointmentHeader;"Appointment Header"."Project Staff Template ID")
            {
            }
            column(ProjectID_AppointmentHeader;"Appointment Header"."Project ID")
            {
            }
            column(Examination_AppointmentHeader;"Appointment Header".Examination)
            {
            }
            column(Description_AppointmentHeader;"Appointment Header".Description)
            {
            }
            column(AppointingAuthority_AppointmentHeader;"Appointment Header"."Appointing Authority")
            {
            }
            column(ProjectName_AppointmentHeader;"Appointment Header"."Project Name")
            {
            }
            column(ExaminationStartDate_AppointmentHeader;"Appointment Header"."Examination Start Date")
            {
            }
            column(ExaminationEndDate_AppointmentHeader;"Appointment Header"."Examination End Date")
            {
            }
            column(RegionCode_AppointmentHeader;"Appointment Header"."Region Code")
            {
            }
            column(DirectorateCode_AppointmentHeader;"Appointment Header"."Directorate Code")
            {
            }
            column(DepartmentCode_AppointmentHeader;"Appointment Header"."Department Code")
            {
            }
            column(Region_AppointmentHeader;"Appointment Header".Region)
            {
            }
            column(Directorate_AppointmentHeader;"Appointment Header".Directorate)
            {
            }
            column(Department_AppointmentHeader;"Appointment Header".Department)
            {
            }
            column(CreatedBy_AppointmentHeader;"Appointment Header"."Created By")
            {
            }
            column(CreatedOn_AppointmentHeader;"Appointment Header"."Created On")
            {
            }
            column(Status_AppointmentHeader;"Appointment Header".Status)
            {
            }
            column(Posted_AppointmentHeader;"Appointment Header".Posted)
            {
            }
            column(PostedBy_AppointmentHeader;"Appointment Header"."Posted By")
            {
            }
            column(PostedOn_AppointmentHeader;"Appointment Header"."Posted On")
            {
            }
            column(NoSeries_AppointmentHeader;"Appointment Header"."No. Series")
            {
            }
            dataitem("Staff Appointment Line";"Staff Appointment Line")
            {
                DataItemLink = "Header No."=FIELD(Code);
                column(LineNo_StaffAppointmentLine;"Staff Appointment Line"."Line No.")
                {
                }
                column(HeaderNo_StaffAppointmentLine;"Staff Appointment Line"."Header No.")
                {
                }
                column(RoleCode_StaffAppointmentLine;"Staff Appointment Line"."Role Code")
                {
                }
                column(ResourceNo_StaffAppointmentLine;"Staff Appointment Line"."Resource No.")
                {
                }
                column(Name_StaffAppointmentLine;"Staff Appointment Line".Name)
                {
                }
                column(Email_StaffAppointmentLine;"Staff Appointment Line".Email)
                {
                }
                column(ProjectManager_StaffAppointmentLine;"Staff Appointment Line"."Team Leader")
                {
                }
                column(UserID_StaffAppointmentLine;"Staff Appointment Line"."User ID")
                {
                }
                column(StaffCategory_StaffAppointmentLine;"Staff Appointment Line"."Staff Category")
                {
                }
                column(Designation_StaffAppointmentLine;"Staff Appointment Line".Designation)
                {
                }
                column(EffectiveDate_StaffAppointmentLine;"Staff Appointment Line"."Effective Date")
                {
                }
                column(ExpiryDate_StaffAppointmentLine;"Staff Appointment Line"."Expiry Date")
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

