report 69127 "Positions (Occupied)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Positions (Occupied).rdlc';

    dataset
    {
        dataitem("ManPower Planning Lines";"ManPower Planning Lines")
        {
            DataItemTableView = WHERE("Job Title"=FILTER((>0)));
            RequestFilterFields = "Entry No";
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
            column(NoofPosts_HRJobs;"Manpower Plan Code")
            {
                IncludeCaption = true;
            }
            column(OccupiedPositions_HRJobs;"Job Title")
            {
                IncludeCaption = true;
            }
            column(JobID_HRJobs;"Entry No")
            {
                IncludeCaption = true;
            }
            column(JobDescription_HRJobs;"Task No")
            {
                IncludeCaption = true;
            }
            column(CI_City;CI.City)
            {
                IncludeCaption = true;
            }
            dataitem(Employee;Employee)
            {
                DataItemLink = Position=FIELD("Entry No");
                column(No_HREmployees;Employee."No.")
                {
                    IncludeCaption = true;
                }
                column(FirstName_HREmployees;Employee."First Name")
                {
                    IncludeCaption = true;
                }
                column(MiddleName_HREmployees;Employee."Middle Name")
                {
                    IncludeCaption = true;
                }
                column(LastName_HREmployees;Employee."Last Name")
                {
                    IncludeCaption = true;
                }
                column(JobTitle_HREmployees;Employee."Job Title")
                {
                    IncludeCaption = true;
                }
                column(UserID_HREmployees;Employee."User ID")
                {
                    IncludeCaption = true;
                }
            }

            trigger OnAfterGetRecord()
            begin
                                 Validate("Responsibility Center Code");
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

    trigger OnPreReport()
    begin
                                    CI.Get();
                                    CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HR_JobsCaptionLbl: Label 'HR Jobs';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Jobs_with_OccupantsCaptionLbl: Label 'Jobs with Occupants';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
}

