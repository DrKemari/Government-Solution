report 69106 "Hires/Fires Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './HiresFires Report.rdlc';

    dataset
    {
        dataitem("Manpower Plan Header";"Manpower Plan Header")
        {
            dataitem("Service Contract Header";"Service Contract Header")
            {
                column(Name_ServiceContractHeader;"Service Contract Header".Name)
                {
                }
                column(CustomerNo_ServiceContractHeader;"Service Contract Header"."Customer No.")
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

    trigger OnInitReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

