report 89037 "Internal Job Application"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Internal Job Application.rdlc';

    dataset
    {
        dataitem("HR Job Applications";"HR Job Applications")
        {
            column(ApplicationNo_HRJobApplications;"HR Job Applications"."Application No")
            {
            }
            column(FirstName_HRJobApplications;"HR Job Applications"."First Name")
            {
            }
            column(MiddleName_HRJobApplications;"HR Job Applications"."Middle Name")
            {
            }
            column(LastName_HRJobApplications;"HR Job Applications"."Last Name")
            {
            }
            column(CoRec_Picture;CoRec.Picture)
            {
            }
            column(CoName;CoRec.Name)
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
        CoRec.Get;
        CoRec.CalcFields(Picture);
    end;

    var
        CoRec: Record "Company Information";
}

