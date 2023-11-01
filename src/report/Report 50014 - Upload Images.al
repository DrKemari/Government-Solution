report 50014 "Upload Images"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Upload Images.rdlc';

    dataset
    {
        dataitem(Customer;Customer)
        {

            trigger OnAfterGetRecord()
            begin
                if Customer.Image.HasValue=false then begin

                if Customer."ID. No."<>'' then
                UploadImage.FNUploadImages(Customer."ID. No.");
                end;
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
        UploadImage: Codeunit "Upload Images";
}

