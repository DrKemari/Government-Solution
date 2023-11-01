report 85060 "Registration Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Registration Entries.rdlc';

    dataset
    {
        dataitem("Examination Account";"Examination Account")
        {
            RequestFilterFields = "Registration Date";
            column(RegistrationNo_ExaminationAccount;"Examination Account"."Registration No.")
            {
            }
            column(CourseID_ExaminationAccount;"Examination Account"."Course ID")
            {
            }
            column(CourseDescription_ExaminationAccount;"Examination Account"."Course Description")
            {
            }
            column(RegistrationDate_ExaminationAccount;"Examination Account"."Registration Date")
            {
            }
            column(Startdate;Startdate)
            {
            }
            column(Enddate;Enddate)
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
        //get
        Startdate:="Examination Account".GetRangeMin("Examination Account"."Registration Date");
        Enddate:="Examination Account".GetRangeMax("Examination Account"."Registration Date");
    end;

    var
        Startdate: Date;
        Enddate: Date;
}

