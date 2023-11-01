#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85208 "Confirmation Letter Individual"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Confirmation Letter Individual.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(Name;CompanyInformation.Name)
            {
            }
            column(Address;CompanyInformation.Address)
            {
            }
            column(Address2;CompanyInformation."Address 2")
            {
            }
            column(tel;CompanyInformation."Phone No.")
            {
            }
            column(Logo;CompanyInformation.Picture)
            {
            }
            column(website;CompanyInformation."Home Page")
            {
            }
            column(Email;CompanyInformation."E-Mail")
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
            column(ExaminationSitting_StudentProcessingHeader;"Student Processing Header"."Examination Sitting")
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
            column(ExemptionReceipt6No_StudentProcessingHeader;"Student Processing Header"."Exemption Receipt 6No.")
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
            column(FeeType_StudentProcessingHeader;"Student Processing Header"."Fee Type")
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
            column(DiscountAmount_StudentProcessingHeader;"Student Processing Header"."Discount Amount")
            {
            }
            column(Cancelled_StudentProcessingHeader;"Student Processing Header".Cancelled)
            {
            }
            column(PaymentRemainingAmount_StudentProcessingHeader;"Student Processing Header"."Payment Remaining Amount")
            {
            }
            column(BankCode_StudentProcessingHeader;"Student Processing Header"."Bank Code")
            {
            }
            column(CountyCode_StudentProcessingHeader;"Student Processing Header"."County Code")
            {
            }
            column(PostedDate_StudentProcessingHeader;"Student Processing Header"."Posted Date")
            {
            }
            column(InstitutionCode_StudentProcessingHeader;"Student Processing Header"."Institution Code")
            {
            }
            column(InstitutionName_StudentProcessingHeader;"Student Processing Header"."Institution Name")
            {
            }
            column(InstitutionReferenceNo_StudentProcessingHeader;"Student Processing Header"."Institution Reference No.")
            {
            }
            column(AdditionalExemption_StudentProcessingHeader;"Student Processing Header"."Additional Exemption")
            {
            }
            column(Balance_StudentProcessingHeader;"Student Processing Header".Balance)
            {
            }
            column(BalanceLCY_StudentProcessingHeader;"Student Processing Header"."Balance (LCY)")
            {
            }
            column(EmailSent_StudentProcessingHeader;"Student Processing Header"."Email Sent")
            {
            }
            column(ManualInput_StudentProcessingHeader;"Student Processing Header"."Manual Input")
            {
            }
            column(CancelledBy_StudentProcessingHeader;"Student Processing Header"."Cancelled By")
            {
            }
            column(CancelledOn_StudentProcessingHeader;"Student Processing Header"."Cancelled On")
            {
            }
            column(ComputerBased_StudentProcessingHeader;"Student Processing Header"."Computer Based")
            {
            }
            column(PreferedExaminationSitting_StudentProcessingHeader;"Student Processing Header"."Prefered Examination Sitting")
            {
            }
            column(Archived_StudentProcessingHeader;"Student Processing Header".Archived)
            {
            }
            column(ArchivedOn_StudentProcessingHeader;"Student Processing Header"."Archived On")
            {
            }
            column(ArchivedBy_StudentProcessingHeader;"Student Processing Header"."Archived By")
            {
            }
            column(ExemptionLetterCode_StudentProcessingHeader;"Student Processing Header"."Exemption Letter Code")
            {
            }
            column(PostTrackingNo_StudentProcessingHeader;"Student Processing Header"."Post Tracking No.")
            {
            }
            column(DateofPostage_StudentProcessingHeader;"Student Processing Header"."Date of Postage")
            {
            }
            column(CertificateLevel_StudentProcessingHeader;"Student Processing Header"."Certificate Level")
            {
            }
            column(TotalStorageFee_StudentProcessingHeader;"Student Processing Header"."Total Storage Fee")
            {
            }
            column(ModeofDispatch_StudentProcessingHeader;"Student Processing Header"."Mode of Dispatch")
            {
            }
            column(DocumentStatus_StudentProcessingHeader;"Student Processing Header"."Document Status")
            {
            }
            column(RequestedByName_StudentProcessingHeader;"Student Processing Header"."Requested By Name")
            {
            }
            column(RequestedByEMail_StudentProcessingHeader;"Student Processing Header"."Requested By E-Mail")
            {
            }
            column(RequestorNo_StudentProcessingHeader;"Student Processing Header"."Requestor No.")
            {
            }
            column(OldStreamer_StudentProcessingHeader;"Student Processing Header"."Old Streamer")
            {
            }
            column(CertCollectInvoiceNo_StudentProcessingHeader;"Student Processing Header"."Cert Collect Invoice No.")
            {
            }
            column(CertCollectReceiptNo_StudentProcessingHeader;"Student Processing Header"."Cert Collect  Receipt No.")
            {
            }
            column(Status_StudentProcessingHeader;"Student Processing Header".Status)
            {
            }
            column(CaseDetails_StudentProcessingHeader;"Student Processing Header"."Case Details")
            {
            }
            column(IsaRegisteredStudent_StudentProcessingHeader;"Student Processing Header"."Is a Registered Student")
            {
            }
            column(StudentNoifnotregistered_StudentProcessingHeader;"Student Processing Header"."Student No(if not registered)")
            {
            }
            column(CertificateIssuanceStatus_StudentProcessingHeader;"Student Processing Header"."Certificate Issuance Status")
            {
            }
            column(ReasonForSuspension_StudentProcessingHeader;"Student Processing Header"."Reason For Suspension")
            {
            }
            column(CollectionIdentifcationNo_StudentProcessingHeader;"Student Processing Header"."Collection Identifcation No")
            {
            }
            dataitem(CST;Customer)
            {
                DataItemLink = "No."=field("Student No.");
                column(ReportForNavId_219; 219)
                {
                }
                column(No_CST;CST."No.")
                {
                }
                column(Name_CST;CST.Name)
                {
                }
                column(Address_CST;CST.Address)
                {
                }
                column(Address2_CST;CST."Address 2")
                {
                }
                column(City_CST;CST.City)
                {
                }
                column(PhoneNo_CST;CST."Phone No.")
                {
                }
                column(EMail_CST;CST."E-Mail")
                {
                }
                column(HomePage_CST;CST."Home Page")
                {
                }
            }
            dataitem(L;"Confirm Examination Results")
            {
                DataItemLink = No=field("No.");
                DataItemTableView = where("Issue Confirmation"=const(true));
                column(ReportForNavId_171; 171)
                {
                }
                column(CONFRemark;Remark)
                {
                }
                column(RecordType_L;L."Record Type")
                {
                }
                column(LineNo_L;L."Line No.")
                {
                }
                column(StudentRegNo_L;L."Student Reg No.")
                {
                }
                column(Examination_L;L.Examination)
                {
                }
                column(Part_L;L.Part)
                {
                }
                column(Section_L;L.Section)
                {
                }
                column(Paper_L;L.Paper)
                {
                }
                column(PaperName_L;L."Paper Name")
                {
                }
                column(Type_L;L.Type)
                {
                }
                column(StudentName_L;L."Student Name")
                {
                }
                column(Address_L;L.Address)
                {
                }
                column(Email_L;L.Email)
                {
                }
                column(NationalIDNo_L;L."National ID No.")
                {
                }
                column(PassportNo_L;L."Passport No.")
                {
                }
                column(Grade_L;L.Grade)
                {
                }
                column(SectionGrade_L;L."Section Grade")
                {
                }
                column(SectionDescription_L;L."Section Description")
                {
                }
                column(ExaminationSittingID_L;L."Examination Sitting ID")
                {
                }
                column(FinancialYear_L;L."Financial Year")
                {
                }
                column(ExaminationCenter_L;L."Examination Center")
                {
                }
                column(Mark_L;L.Mark)
                {
                }
                column(DocumentNo_L;L."Document No.")
                {
                }
                column(Passed_L;L.Passed)
                {
                }
                column(SerialNo_L;L."Serial No")
                {
                }
                column(SubC_L;L."Sub C")
                {
                }
                column(Fc_L;L.Fc)
                {
                }
                column(IssueDate_L;L."Issue Date")
                {
                }
                column(No_L;L.No)
                {
                }
                column(IssueConfirmation_L;L."Issue Confirmation")
                {
                }
                column(Comments_L;L.Comments)
                {
                }
                column(EntryNo_L;L."Entry No")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ExaminationAccounts.Reset;
                    ExaminationAccounts.SetRange("Registration No.",L."Student Reg No.");
                    if ExaminationAccounts.FindFirst then begin
                      Remark:='Graduate'
                      end else begin
                         Remark:='Not a Graduate'

                    end;
                end;
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

    trigger OnInitReport()
    begin
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        ExaminationAccounts: Record "Examination Account";
        Remark: Text[250];
}
