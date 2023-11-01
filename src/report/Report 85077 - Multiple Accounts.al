report 85077 "Multiple Accounts"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Multiple Accounts.rdlc';

    dataset
    {
        dataitem("Examination Account";"Examination Account")
        {
            column(RegistrationNo_ExaminationAccount;"Examination Account"."Registration No.")
            {
            }
            column(CourseID_ExaminationAccount;"Examination Account"."Course ID")
            {
            }
            column(IDNo_ExaminationAccount;"Examination Account"."ID No.")
            {
            }
            column(Status_ExaminationAccount;"Examination Account".Status)
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

