report 85049 "Registration Receipt"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Registration Receipt.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            column(RegistrationNo;RegistrationNo)
            {
            }
            column(PaymentInstructions;PaymentInstructions)
            {
            }
            column(Description;Description)
            {
            }
            column(Amount;Amount)
            {
            }
            column(Description1;Description1)
            {
            }
            column(Amount1;Amount1)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(Name;CI.Name)
            {
            }
            column(CompanyLogo;CompanyInfo.Picture)
            {
            }
            column(CompanyName;CompanyInfo.Name)
            {
            }
            column(CompanyAddress;CompanyInfo.Address)
            {
            }
            column(CompanyAddress2;CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode;CompanyInfo."Post Code")
            {
            }
            column(CompanyCity;CompanyInfo.City)
            {
            }
            column(CompanyPhone;CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax;CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail;CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite;CompanyInfo."Home Page")
            {
            }
            column(BankName;BankName)
            {
            }
            column(TodayDate;TodayDate)
            {
            }
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(Date_StudentProcessingHeader;"Student Processing Header".Date)
            {
            }
            column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
            {
            }
            column(StudentNo_StudentProcessingHeader;"Student Processing Header"."Student No.")
            {
            }
            column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
            {
            }
            column(FirstName_StudentProcessingHeader;"Student Processing Header"."First Name")
            {
            }
            column(MiddleName_StudentProcessingHeader;"Student Processing Header"."Middle Name")
            {
            }
            column(Surname_StudentProcessingHeader;"Student Processing Header".Surname)
            {
            }
            column(IDNumberPassportNo_StudentProcessingHeader;"Student Processing Header"."ID Number/Passport No.")
            {
            }
            column(ExaminationID_StudentProcessingHeader;"Student Processing Header"."Examination ID")
            {
            }
            column(ExaminationDescription_StudentProcessingHeader;"Student Processing Header"."Examination Description")
            {
            }
            column(ExaminationCenterCode_StudentProcessingHeader;"Student Processing Header"."Examination Center Code")
            {
            }
            column(ExaminationCenter_StudentProcessingHeader;"Student Processing Header"."Examination Center")
            {
            }
            column(HighestAcademicQCode_StudentProcessingHeader;"Student Processing Header"."Highest Academic QCode")
            {
            }
            column(HighestAcademicQualification_StudentProcessingHeader;"Student Processing Header"."Highest Academic Qualification")
            {
            }
            column(Gender_StudentProcessingHeader;"Student Processing Header".Gender)
            {
            }
            column(DateofBirth_StudentProcessingHeader;"Student Processing Header"."Date of Birth")
            {
            }
            column(Disabled_StudentProcessingHeader;"Student Processing Header".Disabled)
            {
            }
            column(NCPWDNo_StudentProcessingHeader;"Student Processing Header"."NCPWD No.")
            {
            }
            column(RegistrationDate_StudentProcessingHeader;"Student Processing Header"."Registration Date")
            {
            }
            column(CreatedBy_StudentProcessingHeader;"Student Processing Header"."Created By")
            {
            }
            column(CreatedOn_StudentProcessingHeader;"Student Processing Header"."Created On")
            {
            }
            column(ApprovalStatus_StudentProcessingHeader;"Student Processing Header"."Approval Status")
            {
            }
            column(CurrencyCode_StudentProcessingHeader;"Student Processing Header"."Currency Code")
            {
            }
            column(Address_StudentProcessingHeader;"Student Processing Header".Address)
            {
            }
            column(Address2_StudentProcessingHeader;"Student Processing Header"."Address 2")
            {
            }
            column(City_StudentProcessingHeader;"Student Processing Header".City)
            {
            }
            column(CountryRegionCode_StudentProcessingHeader;"Student Processing Header"."Country/Region Code")
            {
            }
            column(PhoneNo_StudentProcessingHeader;"Student Processing Header"."Phone No.")
            {
            }
            column(PostCode_StudentProcessingHeader;"Student Processing Header"."Post Code")
            {
            }
            column(County_StudentProcessingHeader;"Student Processing Header".County)
            {
            }
            column(Email_StudentProcessingHeader;"Student Processing Header".Email)
            {
            }
            column(NoSeries_StudentProcessingHeader;"Student Processing Header"."No. Series")
            {
            }
            column(Created_StudentProcessingHeader;"Student Processing Header".Created)
            {
            }
            column(Portal_StudentProcessingHeader;"Student Processing Header".Portal)
            {
            }
            column(ReasonforRejection_StudentProcessingHeader;"Student Processing Header"."Reason for Rejection")
            {
            }
            column(Amount_StudentProcessingHeader;"Student Processing Header".Amount)
            {
            }
            column(ExaminationCyce_StudentProcessingHeader;"Student Processing Header"."Examination Sitting")
            {
            }
            column(Type_StudentProcessingHeader;"Student Processing Header".Type)
            {
            }
            column(RegistrationAmount_StudentProcessingHeader;"Student Processing Header"."Registration Amount")
            {
            }
            column(RegistrationReceiptNo_StudentProcessingHeader;"Student Processing Header"."Registration Receipt No.")
            {
            }
            column(BookingAmount_StudentProcessingHeader;"Student Processing Header"."Booking Amount")
            {
            }
            column(BookingReceiptNo_StudentProcessingHeader;"Student Processing Header"."Booking Receipt No.")
            {
            }
            column(ExemptionAmount_StudentProcessingHeader;"Student Processing Header"."Exemption Amount")
            {
            }
            column(ExemptionReceiptNo_StudentProcessingHeader;"Student Processing Header"."Exemption Receipt 6No.")
            {
            }
            column(RegistrationInvoiceNo_StudentProcessingHeader;"Student Processing Header"."Registration Invoice No.")
            {
            }
            column(BookingInvoiceNo_StudentProcessingHeader;"Student Processing Header"."Booking Invoice No.")
            {
            }
            column(ExemptionInvoiceNo_StudentProcessingHeader;"Student Processing Header"."Exemption Invoice No.")
            {
            }
            column(StudentRegNo_StudentProcessingHeader;"Student Processing Header"."Student Reg. No.")
            {
            }
            column(Section_StudentProcessingHeader;"Student Processing Header".Section)
            {
            }
            column(Part_StudentProcessingHeader;"Student Processing Header".Part)
            {
            }
            column(Paper_StudentProcessingHeader;"Student Processing Header".Paper)
            {
            }
            column(WorkType_StudentProcessingHeader;"Student Processing Header"."Fee Type")
            {
            }
            column(Posted_StudentProcessingHeader;"Student Processing Header".Posted)
            {
            }
            column(TypeCode_StudentProcessingHeader;"Student Processing Header"."Type Code")
            {
            }
            column(ApplicationInvoice_StudentProcessingHeader;"Student Processing Header"."Application Invoice")
            {
            }
            column(ApplicationAmount_StudentProcessingHeader;"Student Processing Header"."Application Amount")
            {
            }
            column(ApplicationReceipt_StudentProcessingHeader;"Student Processing Header"."Application Receipt")
            {
            }
            column(TotalWithdrawalAmount_StudentProcessingHeader;"Student Processing Header"."Total Withdrawal Amount")
            {
            }
            column(PreferredExamCenter_StudentProcessingHeader;"Student Processing Header"."Preferred Exam Center")
            {
            }
            column(PreferredExamCenterName_StudentProcessingHeader;"Student Processing Header"."Preferred Exam Center Name")
            {
            }
            column(WithdrawalApplicationNo_StudentProcessingHeader;"Student Processing Header"."Withdrawal Application No.")
            {
            }
            column(Age_StudentProcessingHeader;"Student Processing Header".Age)
            {
            }
            column(WithdrawalCode_StudentProcessingHeader;"Student Processing Header"."Withdrawal Code")
            {
            }
            column(WithdrawalReason_StudentProcessingHeader;"Student Processing Header"."Withdrawal Reason")
            {
            }
            column(Image_StudentProcessingHeader;"Student Processing Header".Image)
            {
            }
            column(PostedBy_StudentProcessingHeader;"Student Processing Header"."Posted By")
            {
            }
            column(PostedOn_StudentProcessingHeader;"Student Processing Header"."Posted On")
            {
            }
            column(ExaminationProjectCode_StudentProcessingHeader;"Student Processing Header"."Examination Project Code")
            {
            }
            column(ExaminationProjectName_StudentProcessingHeader;"Student Processing Header"."Examination Project Name")
            {
            }
            column(WithdrawalRefundAmount_StudentProcessingHeader;"Student Processing Header"."Withdrawal Refund Amount")
            {
            }
            column(DeffermentCharge_StudentProcessingHeader;"Student Processing Header"."Defferment Charge")
            {
            }
            column(TrainingInstitutionCode_StudentProcessingHeader;"Student Processing Header"."Training Institution Code")
            {
            }
            column(TrainingInstitution_StudentProcessingHeader;"Student Processing Header"."Training Institution")
            {
            }
            column(QualificationCode_StudentProcessingHeader;"Student Processing Header"."Qualification Code")
            {
            }
            column(QualificationType_StudentProcessingHeader;"Student Processing Header"."Qualification Type")
            {
            }
            column(Qualification_StudentProcessingHeader;"Student Processing Header".Qualification)
            {
            }
            column(Remarks_StudentProcessingHeader;"Student Processing Header".Remarks)
            {
            }
            column(CaseCode_StudentProcessingHeader;"Student Processing Header"."Case Code")
            {
            }
            column(CaseDescription_StudentProcessingHeader;"Student Processing Header"."Case Description")
            {
            }
            column(CaseVerdict_StudentProcessingHeader;"Student Processing Header"."Case Verdict")
            {
            }
            column(VerdictDescription_StudentProcessingHeader;"Student Processing Header"."Verdict Description")
            {
            }
            column(DisciplinaryCommitee_StudentProcessingHeader;"Student Processing Header"."Disciplinary Commitee")
            {
            }
            column(CommiteeName_StudentProcessingHeader;"Student Processing Header"."Commitee Name")
            {
            }
            column(PreviousCaseNo_StudentProcessingHeader;"Student Processing Header"."Previous Case No.")
            {
            }
            column(ReinstatementCommitee_StudentProcessingHeader;"Student Processing Header"."Reinstatement Commitee")
            {
            }
            column(ReinstatementName_StudentProcessingHeader;"Student Processing Header"."Reinstatement  Name")
            {
            }
            column(CaseStatus_StudentProcessingHeader;"Student Processing Header"."Case Status")
            {
            }
            column(CollectionDate_StudentProcessingHeader;"Student Processing Header"."Collection Date")
            {
            }
            column(CollectedByName_StudentProcessingHeader;"Student Processing Header"."Collected By Name")
            {
            }
            column(CollectedByIDNo_StudentProcessingHeader;"Student Processing Header"."Collected By ID No.")
            {
            }
            column(CollectedByEmail_StudentProcessingHeader;"Student Processing Header"."Collected By Email")
            {
            }
            column(IssuedByOfficer_StudentProcessingHeader;"Student Processing Header"."Issued By Officer")
            {
            }
            column(IssuedByOfficerName_StudentProcessingHeader;"Student Processing Header"."Issued By Officer Name")
            {
            }
            column(CertificateNo_StudentProcessingHeader;"Student Processing Header"."Certificate No.")
            {
            }
            column(IssuedByUserID_StudentProcessingHeader;"Student Processing Header"."Issued By User ID")
            {
            }
            column(CertificateType_StudentProcessingHeader;"Student Processing Header"."Certificate Type")
            {
            }
            column(RemarkAmount_StudentProcessingHeader;"Student Processing Header"."Remark Amount")
            {
            }
            column(RemarkReceiptNo_StudentProcessingHeader;"Student Processing Header"."Remark Receipt No.")
            {
            }
            column(RemarkInvoiceNo_StudentProcessingHeader;"Student Processing Header"."Remark Invoice No.")
            {
            }
            column(PaymentReferenceNo_StudentProcessingHeader;"Student Processing Header"."Payment Reference No.")
            {
            }
            column(PaymentEvidence_StudentProcessingHeader;"Student Processing Header"."Payment Evidence")
            {
            }
            column(AdministrativeFees_StudentProcessingHeader;"Student Processing Header"."Administrative Fees")
            {
            }
            column(PaymentCreated_StudentProcessingHeader;"Student Processing Header"."Payment Created")
            {
            }
            column(PayMode_StudentProcessingHeader;"Student Processing Header"."Pay Mode")
            {
            }
            column(ContactFullName_StudentProcessingHeader;"Student Processing Header"."Contact Full Name")
            {
            }
            column(ContactEmail_StudentProcessingHeader;"Student Processing Header"."Contact Email")
            {
            }
            column(ContactPhoneNo_StudentProcessingHeader;"Student Processing Header"."Contact Phone No.")
            {
            }
            column(ContactRelationship_StudentProcessingHeader;"Student Processing Header"."Contact Relationship")
            {
            }
            column(SourceofInformation_StudentProcessingHeader;"Student Processing Header"."Source of Information")
            {
            }
            column(InformationSourceName_StudentProcessingHeader;"Student Processing Header"."Information Source Name")
            {
            }
            column(BirthCertificateNo_StudentProcessingHeader;"Student Processing Header"."Birth Certificate No.")
            {
            }
            column(DisabilityType_StudentProcessingHeader;"Student Processing Header"."Disability Type")
            {
            }
            column(DisabilityName_StudentProcessingHeader;"Student Processing Header"."Disability Name")
            {
            }
            column(RenewalAmount_StudentProcessingHeader;"Student Processing Header"."Renewal Amount")
            {
            }
            column(RenewalReceiptNo_StudentProcessingHeader;"Student Processing Header"."Renewal Receipt No.")
            {
            }
            column(RenewalInvoiceNo_StudentProcessingHeader;"Student Processing Header"."Renewal Invoice No.")
            {
            }
            column(ActivationAmount_StudentProcessingHeader;"Student Processing Header"."Activation Amount")
            {
            }
            column(ActivationReceiptNo_StudentProcessingHeader;"Student Processing Header"."Activation Receipt No.")
            {
            }
            column(ActivationInvoiceNo_StudentProcessingHeader;"Student Processing Header"."Activation Invoice No.")
            {
            }
            column(LastModifiedDateTime_StudentProcessingHeader;"Student Processing Header"."Last Modified Date Time")
            {
            }
            column(LastDateModified_StudentProcessingHeader;"Student Processing Header"."Last Date Modified")
            {
            }
            column(Submitted_StudentProcessingHeader;"Student Processing Header".Submitted)
            {
            }
            column(CommiiteeReferenceNo_StudentProcessingHeader;"Student Processing Header"."Commiitee Reference No.")
            {
            }
            column(CertificateDispatchMethod_StudentProcessingHeader;"Student Processing Header"."Certificate Dispatch Method")
            {
            }
            column(ReinstatementAmount_StudentProcessingHeader;"Student Processing Header"."Reinstatement Amount")
            {
            }
            column(ReinstatementReceiptNo_StudentProcessingHeader;"Student Processing Header"."Reinstatement Receipt No.")
            {
            }
            column(ReinstatementInvoiceNo_StudentProcessingHeader;"Student Processing Header"."Reinstatement Invoice No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                //create entries
                Amount:=0;
                Amount1:=0.0;
                ExaminationSetup.Get;
                TodayDate:=Today;
                Amount:="Student Processing Header"."Application Amount";
                Description:='Registration Fee';
                if "Student Processing Header".Disabled=true then begin
                  ExaminationSetup.TestField("Disability Discount %");
                //  Description1:='Registration Discount';
                //  Amount1:=("Student Processing Header"."Application Amount"*ExaminationSetup."Disability Discount %")/100;
                end;
                PaymentInstructions:=ExaminationSetup."Payment Instructions";

                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Course ID","Student Processing Header"."Examination ID");
                ExaminationAccount.SetRange("ID No.","Student Processing Header"."ID Number/Passport No.");
                if ExaminationAccount.FindFirst then begin
                  RegistrationNo:=ExaminationAccount."Registration No.";
                  end;
                  ReceiptsHeader1.Reset;
                ReceiptsHeader1.SetRange("Cheque No","Student Processing Header"."No.");
                ReceiptsHeader1.SetRange("No.","Student Processing Header"."Application Receipt");
                if ReceiptsHeader1.FindFirst then begin
                    ReceiptNo:="Student Processing Header"."Application Receipt";
                    BankName:=ReceiptsHeader1."Bank Name";
                end;
                if "Student Processing Header"."Application Receipt"='' then
                  ReceiptNo:="Student Processing Header"."Payment Reference No." else
                  ReceiptNo:="Student Processing Header"."Application Receipt";
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        Description: Text;
        Amount: Decimal;
        Description1: Text;
        Amount1: Decimal;
        ExaminationSetup: Record "Examination Setup";
        PaymentInstructions: Text;
        CompanyInfo: Record "Company Information";
        TodayDate: Date;
        RegistrationNo: Code[30];
        ExaminationAccount: Record "Examination Account";
        ReceiptNo: Code[30];
        ReceiptsHeader1: Record "Receipts Header1";
        BankName: Text;
}

