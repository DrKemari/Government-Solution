report 69121 "Training Applications List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Training Applications List.rdlc';

    dataset
    {
        dataitem("HR Training Applications";"Training Requests")
        {
            RequestFilterFields = "Code";
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
            column(HR_Training_Applications__Application_No_;Code)
            {
            }
            column(HR_Training_Applications__Application_Date_;"Requires Flight")
            {
            }
            column(HR_Training_Applications__Employee_No__;"Available Funds")
            {
            }
            column(HR_Training_Applications__Employee_Name_;"Training Duration Hrs")
            {
            }
            column(HR_Training_Applications__Employee_Department_;"Training Type")
            {
            }
            column(Activity;"HR Training Applications"."Other Costs")
            {
            }
            column(Branch;"HR Training Applications"."Service Provider Cost")
            {
            }
            column(ResponsibilityCenter;"HR Training Applications"."Created On")
            {
            }
            column(HR_Training_Applications__Course_Title_;"Course Title")
            {
            }
            column(HR_Training_Applications__Purpose_of_Training_;"GL Account")
            {
            }
            column(Cost;"HR Training Applications".Cost)
            {
            }
            column(HR_Training_ApplicationsCaption;HR_Training_ApplicationsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(P_O__BoxCaption;P_O__BoxCaptionLbl)
            {
            }
            column(Training_Applications_ListCaption;Training_Applications_ListCaptionLbl)
            {
            }
            column(HR_Training_Applications__Application_No_Caption;FieldCaption(Code))
            {
            }
            column(HR_Training_Applications__Application_Date_Caption;FieldCaption("Requires Flight"))
            {
            }
            column(HR_Training_Applications__Employee_No__Caption;FieldCaption("Available Funds"))
            {
            }
            column(HR_Training_Applications__Employee_Name_Caption;FieldCaption("Training Duration Hrs"))
            {
            }
            column(HR_Training_Applications__Employee_Department_Caption;FieldCaption("Training Type"))
            {
            }
            column(HR_Training_Applications__Course_Title_Caption;FieldCaption("Course Title"))
            {
            }
            column(HR_Training_Applications__Purpose_of_Training_Caption;FieldCaption("GL Account"))
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

    trigger OnPreReport()
    begin
                          CI.Get();
                          CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HR_Training_ApplicationsCaptionLbl: Label 'HR Training Applications';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        Training_Applications_ListCaptionLbl: Label 'Training Applications List';
}

