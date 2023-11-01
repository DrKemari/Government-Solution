report 85070 "Student With No Picture"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Student With No Picture.rdlc';

    dataset
    {
        dataitem(Customer;Customer)
        {
            DataItemTableView = WHERE("Customer Type"=FILTER(Student));
            column(No_Customer;Customer."No.")
            {
            }
            column(Name_Customer;Customer.Name)
            {
            }
            column(EMail_Customer;Customer."E-Mail")
            {
            }
            column(IDNo_Customer;Customer."ID. No.")
            {
            }
            column(HasPicture;HasPicture)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //Customer.CALCFIELDS(Image);

                if Customer.Image.HasValue then
                  HasPicture:=true

                else HasPicture:=false;
            end;

            trigger OnPreDataItem()
            begin
                 HasPicture:=false;
            end;
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
        HasPicture: Boolean;
}

