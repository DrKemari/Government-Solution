report 51201 "Accreditation Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Accreditation Summary.rdlc';

    dataset
    {
        dataitem("Accreditation Application";"Accreditation Application")
        {
            column(Status_AccreditationApplication;"Accreditation Application".Status)
            {
            }
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
            column(PaymentReferenceNo_AccreditationApplication;"Accreditation Application"."Payment  Reference No.")
            {
            }
            column(InvoiceAmountLCY_AccreditationApplication;"Accreditation Application"."Invoice Amount LCY")
            {
            }
            column(ReceiptAmountLCY_AccreditationApplication;"Accreditation Application"."Receipt Amount LCY")
            {
            }
            column(ApplicationTypeName_AccreditationApplication;"Accreditation Application"."Application Type Name")
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
}

