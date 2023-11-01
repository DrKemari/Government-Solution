report 85007 "Staff Termination Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Staff Termination Voucher.rdlc';

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
            dataitem("Staff Termination Line";"Staff Termination Line")
            {
                DataItemLink = "Header No."=FIELD(Code);
                column(LineNo_StaffTerminationLine;"Staff Termination Line"."Line No.")
                {
                }
                column(HeaderNo_StaffTerminationLine;"Staff Termination Line"."Header No.")
                {
                }
                column(RoleCode_StaffTerminationLine;"Staff Termination Line"."Role Code")
                {
                }
                column(ResourceNo_StaffTerminationLine;"Staff Termination Line"."Resource No.")
                {
                }
                column(Name_StaffTerminationLine;"Staff Termination Line".Name)
                {
                }
                column(Email_StaffTerminationLine;"Staff Termination Line".Email)
                {
                }
                column(ProjectManager_StaffTerminationLine;"Staff Termination Line"."Project Manager")
                {
                }
                column(UserID_StaffTerminationLine;"Staff Termination Line"."User ID")
                {
                }
                column(StaffCategory_StaffTerminationLine;"Staff Termination Line"."Staff Category")
                {
                }
                column(TerminationDetails_StaffTerminationLine;"Staff Termination Line"."Termination Details")
                {
                }
                column(TerminationDate_StaffTerminationLine;"Staff Termination Line"."Termination Date")
                {
                }
                column(ProjectStartDate_StaffTerminationLine;"Staff Termination Line"."Project Start Date")
                {
                }
                column(ProjectEndDate_StaffTerminationLine;"Staff Termination Line"."Project End Date")
                {
                }
                column(AppointmentDocumentNo_StaffTerminationLine;"Staff Termination Line"."Appointment Document No.")
                {
                }
                column(TerminationCategory_StaffTerminationLine;"Staff Termination Line"."Termination Category")
                {
                }
                column(Designation_StaffTerminationLine;"Staff Termination Line".Designation)
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

