report 51253 "Application Acknowledgment"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Application Acknowledgment.rdlc';

    dataset
    {
        dataitem("Accreditation Application";"Accreditation Application")
        {
            column(ApplicationNo_AccreditationApplication;"Accreditation Application"."Application No.")
            {
            }
            column(No_AccreditationApplication;"Accreditation Application"."No.")
            {
            }
            column(Name_AccreditationApplication;"Accreditation Application".Name)
            {
            }
            column(Address_AccreditationApplication;"Accreditation Application".Address)
            {
            }
            column(Address2_AccreditationApplication;"Accreditation Application"."Address 2")
            {
            }
            column(City_AccreditationApplication;"Accreditation Application".City)
            {
            }
            column(Contact_AccreditationApplication;"Accreditation Application".Contact)
            {
            }
            column(PhoneNo_AccreditationApplication;"Accreditation Application"."Phone No.")
            {
            }
            column(Country_AccreditationApplication;"Accreditation Application".Country)
            {
            }
            column(Email_AccreditationApplication;"Accreditation Application".Email)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(PostCode_AccreditationApplication;"Accreditation Application"."Post Code")
            {
            }
            column(CreatedBy_AccreditationApplication;"Accreditation Application"."Created By")
            {
            }
            column(CreatedOn_AccreditationApplication;"Accreditation Application"."Created On")
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

    var
        CI: Record "Company Information";
}

