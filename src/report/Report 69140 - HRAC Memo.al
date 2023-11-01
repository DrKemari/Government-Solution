report 69140 "HRAC Memo"
{
    DefaultLayout = RDLC;
    RDLCLayout = './HRAC Memo.rdlc';

    dataset
    {
        dataitem("HR Disciplinary Cases";"HR Disciplinary Cases")
        {
            column(CaseNumber_HRDisciplinaryCases;"HR Disciplinary Cases"."Case Number")
            {
            }
            column(DateofComplaint_HRDisciplinaryCases;"HR Disciplinary Cases"."Date of Complaint")
            {
            }
            column(DisciplinaryCommitee_HRDisciplinaryCases;"HR Disciplinary Cases"."Disciplinary Commitee")
            {
            }
            column(FORMAT_TODAY_0_4_;Format(Today,0,4))
            {
            }
            column(COMPANYNAME;CompanyName)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            column(USERID;UserId)
            {
            }
            column(CI_Name;CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address;CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2;CI."Address 2" )
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture;CI.Picture)
            {
                IncludeCaption = true;
            }
            column(CI_City;CI.City)
            {
                IncludeCaption = true;
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
        HR_Training_ApplicationsCaptionLbl: Label 'HR Training Applications';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        Training_Applications_ListCaptionLbl: Label 'Training Applications List';
        CI: Record "Company Information";
}

