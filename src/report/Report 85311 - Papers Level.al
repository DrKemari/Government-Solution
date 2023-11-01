report 85311 "Papers Level"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Papers Level.rdlc';

    dataset
    {
        dataitem(Customer;Customer)
        {
            column(No_Customer;Customer."No.")
            {
            }
            column(Name_Customer;Customer.Name)
            {
            }
            column(SearchName_Customer;Customer."Search Name")
            {
            }
            column(Name2_Customer;Customer."Name 2")
            {
            }
            column(Address_Customer;Customer.Address)
            {
            }
            column(Address2_Customer;Customer."Address 2")
            {
            }
            dataitem("Examination Account";"Examination Account")
            {
                DataItemLink = "Student Cust No."=FIELD("No.");
                column(RegistrationNo_ExaminationAccount;"Examination Account"."Registration No.")
                {
                }
                column(StudentCustNo_ExaminationAccount;"Examination Account"."Student Cust No.")
                {
                }
                column(CourseID_ExaminationAccount;"Examination Account"."Course ID")
                {
                }
                column(CourseDescription_ExaminationAccount;"Examination Account"."Course Description")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if (("Examination Account"."Course ID"='CPA') or("Examination Account"."Course ID"='CS') or("Examination Account"."Course ID"='CIFA')  or("Examination Account"."Course ID"='CCP'))then
                    begin
                    "Examination Account"."Renewal Amount":="Examination Account"."Renewal Pending"*35;
                    if "Examination Account"."Re-Activation Amount"<>0 then
                      "Examination Account"."Re-Activation Amount":=65;
                    "Examination Account".Modify(true);
                    end
                end;
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

