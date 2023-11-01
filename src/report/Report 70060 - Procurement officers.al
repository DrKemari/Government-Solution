report 70060 "Procurement officers"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Procurement officers.rdlc';

    dataset
    {
        dataitem("Salesperson/Purchaser";"Salesperson/Purchaser")
        {
            column(EmployeeNo_SalespersonPurchaser;"Salesperson/Purchaser"."Employee No")
            {
            }
            column(Name_SalespersonPurchaser;"Salesperson/Purchaser".Name)
            {
            }
            column(EMail_SalespersonPurchaser;"Salesperson/Purchaser"."E-Mail")
            {
            }
            column(PhoneNo_SalespersonPurchaser;"Salesperson/Purchaser"."Phone No.")
            {
            }
            column(COMPANY;CompanyInf.Name)
            {
            }
            column(LOGO;CompanyInf.Picture)
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
        CompanyInf.Get;
        CompanyInf.CalcFields(Picture);
    end;

    var
        CompanyInf: Record "Company Information";
}

