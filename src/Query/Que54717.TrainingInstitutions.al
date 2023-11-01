#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 54717 "TrainingInstitutions"
{

    elements
    {
        dataitem(Customer;Customer)
        {
            DataItemTableFilter = "Customer Type"=filter(Funder);
            column(No;"No.")
            {
            }
            column(Name;Name)
            {
            }
            column(Address;Address)
            {
            }
            column(City;City)
            {
            }
            column(Phone_No;"Phone No.")
            {
            }
            column(Contact;Contact)
            {
            }
        }
    }
}

