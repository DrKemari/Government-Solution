report 85034 "No. of Exam Centers"
{
    DefaultLayout = RDLC;
    RDLCLayout = './No. of Exam Centers.rdlc';

    dataset
    {
        dataitem("Examination Centres";"Examination Centres")
        {
            column(Logo;CI.Picture)
            {
            }
            column(Code_ExamCenter;"Examination Centres".Code)
            {
            }
            column(Name_ExamCenter;"Examination Centres".Name)
            {
            }
            column(Blocked_ExamCenter;"Examination Centres".Blocked)
            {
            }
            column(Name2_ExamCenter;"Examination Centres"."Name 2")
            {
            }
            column(Address_ExamCenter;"Examination Centres".Address)
            {
            }
            column(Address2_ExamCenter;"Examination Centres"."Address 2")
            {
            }
            column(City_ExamCenter;"Examination Centres".City)
            {
            }
            column(PhoneNo_ExamCenter;"Examination Centres"."Phone No.")
            {
            }
            column(PhoneNo2_ExamCenter;"Examination Centres"."Phone No. 2")
            {
            }
            column(TelexNo_ExamCenter;"Examination Centres"."Telex No.")
            {
            }
            column(FaxNo_ExamCenter;"Examination Centres"."Fax No.")
            {
            }
            column(Contact_ExamCenter;"Examination Centres".Contact)
            {
            }
            column(PostCode_ExamCenter;"Examination Centres"."Post Code")
            {
            }
            column(County_ExamCenter;"Examination Centres".County)
            {
            }
            column(EMail_ExamCenter;"Examination Centres"."E-Mail")
            {
            }
            column(HomePage_ExamCenter;"Examination Centres"."Home Page")
            {
            }
            column(CountryRegionCode_ExamCenter;"Examination Centres"."Country/Region Code")
            {
            }
            column(ExamRegion_ExamCenter;"Examination Centres"."Exam Region")
            {
            }
            column(ExamRoute_ExamCenter;"Examination Centres"."Exam Route")
            {
            }
            column(ExamZone_ExamCenter;"Examination Centres"."Exam Zone")
            {
            }
            column(MaximumCapacityPerSession_ExamCenter;"Examination Centres"."Maximum Capacity Per Session")
            {
            }
            column(TrainingInstitution_ExamCenter;"Examination Centres"."Training Institution")
            {
            }
            column(Institution_ExamCenter;"Examination Centres".Institution)
            {
            }
            column(TotalBookedStudents_ExamCenter;"Examination Centres"."Total Booked Students")
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
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

