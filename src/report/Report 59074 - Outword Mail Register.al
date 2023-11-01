report 59074 "Outword Mail Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Outword Mail Register.rdlc';

    dataset
    {
        dataitem("Inward Mail Register";"Inward Mail Register")
        {
            DataItemTableView = WHERE("Document Type"=CONST("Outward Register"));
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

