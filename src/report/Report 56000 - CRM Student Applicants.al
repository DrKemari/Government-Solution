report 56000 "CRM Student Applicants"
{
    DefaultLayout = RDLC;
    RDLCLayout = './CRM Student Applicants.rdlc';

    dataset
    {
        dataitem("CRM Student Applications";"CRM Student Applications")
        {
            column(Logo;CI.Picture)
            {
            }
            column(ApplicationNo_CRMStudentApplications;"CRM Student Applications"."Application No.")
            {
            }
            column(FirstName_CRMStudentApplications;"CRM Student Applications"."First Name")
            {
            }
            column(MiddleName_CRMStudentApplications;"CRM Student Applications"."Middle Name")
            {
            }
            column(LastName_CRMStudentApplications;"CRM Student Applications"."Last Name")
            {
            }
            column(Initials_CRMStudentApplications;"CRM Student Applications".Initials)
            {
            }
            column(Address_CRMStudentApplications;"CRM Student Applications".Address)
            {
            }
            column(Address2_CRMStudentApplications;"CRM Student Applications".Address2)
            {
            }
            column(City_CRMStudentApplications;"CRM Student Applications".City)
            {
            }
            column(PostCode_CRMStudentApplications;"CRM Student Applications"."Post Code")
            {
            }
            column(County_CRMStudentApplications;"CRM Student Applications".County)
            {
            }
            column(PhoneNo_CRMStudentApplications;"CRM Student Applications"."Phone No.")
            {
            }
            column(MobilePhoneNo_CRMStudentApplications;"CRM Student Applications"."Mobile Phone No.")
            {
            }
            column(Email_CRMStudentApplications;"CRM Student Applications".Email)
            {
            }
            column(Picture_CRMStudentApplications;"CRM Student Applications".Picture)
            {
            }
            column(BirthDate_CRMStudentApplications;"CRM Student Applications"."Birth Date")
            {
            }
            column(Gender_CRMStudentApplications;"CRM Student Applications".Gender)
            {
            }
            column(CountryRegionCode_CRMStudentApplications;"CRM Student Applications"."Country/Region Code")
            {
            }
            column(IDNumber_CRMStudentApplications;"CRM Student Applications"."ID Number")
            {
            }
            column(PassportNumber_CRMStudentApplications;"CRM Student Applications"."Passport Number")
            {
            }
            column(TaxRegistrationPINNo_CRMStudentApplications;"CRM Student Applications"."Tax Registration (PIN) No.")
            {
            }
            column(MaritalStatus_CRMStudentApplications;"CRM Student Applications"."Marital Status")
            {
            }
            column(Religion_CRMStudentApplications;"CRM Student Applications".Religion)
            {
            }
            column(VacancyID_CRMStudentApplications;"CRM Student Applications"."Document ID")
            {
            }
            column(StudentNo_CRMStudentApplications;"CRM Student Applications"."Student No.")
            {
            }
            column(NoSeries_CRMStudentApplications;"CRM Student Applications"."No. Series")
            {
            }
            column(JobDescription;JobDescription)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CRMVacancies.Reset;
                CRMVacancies.SetRange("Vacancy No","CRM Student Applications"."Document ID");
                if CRMVacancies.FindFirst then  begin
                  JobDescription:=CRMVacancies.Position;
                end
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
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        JobDescription: Text;
        CRMVacancies: Record "CRM Vacancies";
}

