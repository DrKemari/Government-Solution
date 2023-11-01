report 51256 "Accreditation Pro-Forma Invoic"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Accreditation Pro-Forma Invoic.rdlc';

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
            column(ApplicationFeeLCY_AccreditationApplication;"Accreditation Application"."Application Fee LCY")
            {
            }
            column(CurrencyCode_AccreditationApplication;"Accreditation Application"."Currency Code")
            {
            }
            column(ApplicationFee_AccreditationApplication;"Accreditation Application"."Application Fee")
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
            column(Number_In_Words;NumberText[1])
            {
            }
            column(SignatoryName;UserSetup."Employee Name")
            {
            }
            column(Signature;UserSetup.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin
                PaymentMgt.InitTextVariable;
                PaymentMgt.FormatNoText(NumberText,"Accreditation Application"."Application Fee LCY","Accreditation Application"."Currency Code");
                //get signatory details
                UserSetup.Reset;
                UserSetup.SetRange("HOD Finance",true);
                if UserSetup.FindFirst then begin
                  UserSetup.CalcFields(Picture);
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
        SubQuesResponse: Record "Application Sub-Ques Response";
        Subquestion: Text;
        Subresponse: Text;
        ApplicationChapter: Record "Application Chapter";
        ApplicationTopic: Record "Application Topic";
        ApplicationChapterName: Text;
        ApplicationTopicName: Text;
        ApplicationQuestionNos: Record "Application Question Nos.";
        AccreditationQuestions: Record "Accreditation Questions";
        PaymentMgt: Codeunit "Payments-Post";
        NumberText: array [2] of Text[80];
        UserSetup: Record "User Setup";
}

