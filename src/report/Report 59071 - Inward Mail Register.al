report 59071 "Inward Mail Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Inward Mail Register.rdlc';

    dataset
    {
        dataitem("Inward Mail Register";"Inward Mail Register")
        {
            DataItemTableView = WHERE("Document Type"=CONST("Inward Register"));
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
            column(MailRegisterNo_InwardMailRegister;"Inward Mail Register"."Mail Register No")
            {
            }
            column(Datereceived_InwardMailRegister;"Inward Mail Register"."Date received")
            {
            }
            column(Dateofletter_InwardMailRegister;"Inward Mail Register"."Date of letter")
            {
            }
            column(OrganizationName_InwardMailRegister;"Inward Mail Register"."Organization Name")
            {
            }
            column(AuthorName_InwardMailRegister;"Inward Mail Register"."Author Name")
            {
            }
            column(Subject_InwardMailRegister;"Inward Mail Register".Subject)
            {
            }
            column(FileNo_InwardMailRegister;"Inward Mail Register"."File No")
            {
            }
            column(Filefolio_InwardMailRegister;"Inward Mail Register"."File folio")
            {
            }
            column(NoSeries_InwardMailRegister;"Inward Mail Register"."No. Series")
            {
            }
            column(DocumentType_InwardMailRegister;"Inward Mail Register"."Document Type")
            {
            }
            column(AssignedEmployee_InwardMailRegister;"Inward Mail Register"."Assigned Employee")
            {
            }
            column(AssignedEmployeeNames_InwardMailRegister;"Inward Mail Register"."Assigned Employee Names")
            {
            }
            column(AssignedEmployeeDept_InwardMailRegister;"Inward Mail Register"."Assigned Employee Dept")
            {
            }
            column(Dispatched_InwardMailRegister;"Inward Mail Register".Dispatched)
            {
            }
            column(DispatchedBy_InwardMailRegister;"Inward Mail Register"."Dispatched By")
            {
            }
            column(DispatchedDate_InwardMailRegister;"Inward Mail Register"."Dispatched Date")
            {
            }
            column(DispatchTime_InwardMailRegister;"Inward Mail Register"."Dispatch Time")
            {
            }
            column(ReferenceNumber_InwardMailRegister;"Inward Mail Register"."Reference Number")
            {
            }
            column(BringUpDate_InwardMailRegister;"Inward Mail Register"."Bring Up Date")
            {
            }
            column(CreatedBy_InwardMailRegister;"Inward Mail Register"."Created By")
            {
            }
            column(CreatedOn_InwardMailRegister;"Inward Mail Register"."Created On")
            {
            }
            column(EmployeeNo_InwardMailRegister;"Inward Mail Register"."Employee No")
            {
            }
            column(EmployeeName_InwardMailRegister;"Inward Mail Register"."Employee Name")
            {
            }
            column(AssignedUserID_InwardMailRegister;"Inward Mail Register"."Assigned UserID")
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
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
}

