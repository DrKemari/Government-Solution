report 51250 "Accreditation Certificate"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Accreditation Certificate.rdlc';

    dataset
    {
        dataitem("Accreditation Application";"Accreditation Application")
        {
            column(SerialNo;SerialNo)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(RubberStamp;CI.RubberStamp)
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
            column(ReceiptNo_AccreditationApplication;"Accreditation Application"."Receipt No.")
            {
            }
            column(InvoiceNo_AccreditationApplication;"Accreditation Application"."Invoice No.")
            {
            }
            column(InvoiceAmount_AccreditationApplication;"Accreditation Application"."Invoice Amount")
            {
            }
            column(ReceiptAmount_AccreditationApplication;"Accreditation Application"."Receipt Amount")
            {
            }
            column(Status_AccreditationApplication;"Accreditation Application".Status)
            {
            }
            column(ApplicationTypeName_AccreditationApplication;"Accreditation Application"."Application Type Name")
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
            column(Published_AccreditationApplication;"Accreditation Application".Published)
            {
            }
            column(RejectionReason_AccreditationApplication;"Accreditation Application"."Rejection Reason")
            {
            }
            column(PaymentReferenceNo_AccreditationApplication;"Accreditation Application"."Payment  Reference No.")
            {
            }
            column(PaymentDocument_AccreditationApplication;"Accreditation Application"."Payment Document")
            {
            }
            column(InstitutionTypeCode_AccreditationApplication;"Accreditation Application"."Institution Type Code")
            {
            }
            column(InstitutionType_AccreditationApplication;"Accreditation Application"."Institution Type")
            {
            }
            column(InvoiceAmountLCY_AccreditationApplication;"Accreditation Application"."Invoice Amount LCY")
            {
            }
            column(ReceiptAmountLCY_AccreditationApplication;"Accreditation Application"."Receipt Amount LCY")
            {
            }
            column(VerdictCode_AccreditationApplication;"Accreditation Application"."Verdict Code")
            {
            }
            column(VerdictDescription_AccreditationApplication;"Accreditation Application"."Verdict Description")
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
        CI.CalcFields(RubberStamp);
    end;

    var
        SerialNo: Code[30];
        CI: Record "Company Information";
}

