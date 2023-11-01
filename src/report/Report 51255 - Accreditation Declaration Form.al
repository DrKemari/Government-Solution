report 51255 "Accreditation Declaration Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Accreditation Declaration Form.rdlc';

    dataset
    {
        dataitem("Accreditation Application";"Accreditation Application")
        {
            column(Logo;CI.Picture)
            {
            }
            column(Name;CI.Name)
            {
            }
            column(Address;CI.Address)
            {
            }
            column(PostCode;CI."Post Code")
            {
            }
            column(County;CI.County)
            {
            }
            column(ApplicationNo_AccreditationApplication;"Accreditation Application"."Application No.")
            {
            }
            column(No_AccreditationApplication;"Accreditation Application"."No.")
            {
            }
            column(Name_AccreditationApplication;"Accreditation Application".Name)
            {
            }
            column(Address_AccreditationApplication;"Accreditation Application".Address)
            {
            }
            column(Address2_AccreditationApplication;"Accreditation Application"."Address 2")
            {
            }
            column(City_AccreditationApplication;"Accreditation Application".City)
            {
            }
            column(Contact_AccreditationApplication;"Accreditation Application".Contact)
            {
            }
            column(PhoneNo_AccreditationApplication;"Accreditation Application"."Phone No.")
            {
            }
            column(Country_AccreditationApplication;"Accreditation Application".Country)
            {
            }
            column(Email_AccreditationApplication;"Accreditation Application".Email)
            {
            }
            column(ApplicationType_AccreditationApplication;"Accreditation Application"."Application Type")
            {
            }
            column(NoSeries_AccreditationApplication;"Accreditation Application"."No. Series")
            {
            }
            column(PostCode_AccreditationApplication;"Accreditation Application"."Post Code")
            {
            }
            column(County_AccreditationApplication;"Accreditation Application".County)
            {
            }
            column(CreatedBy_AccreditationApplication;"Accreditation Application"."Created By")
            {
            }
            column(CreatedOn_AccreditationApplication;"Accreditation Application"."Created On")
            {
            }
            column(ApplicationTypeName_AccreditationApplication;"Accreditation Application"."Application Type Name")
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
        SubQuesResponse: Record "Application Sub-Ques Response";
        Subquestion: Text;
        Subresponse: Text;
        ApplicationChapter: Record "Application Chapter";
        ApplicationTopic: Record "Application Topic";
        ApplicationChapterName: Text;
        ApplicationTopicName: Text;
        ApplicationQuestionNos: Record "Application Question Nos.";
        AccreditationQuestions: Record "Accreditation Questions";
}

