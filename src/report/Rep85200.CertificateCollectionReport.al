#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85200 "Certificate Collection Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Certificate Collection Report.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(HD;"Student Processing Header")
        {
            DataItemTableView = where("Document Type"=const(Collection));
            RequestFilterFields = "Collection Date";
            column(ReportForNavId_35; 35)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(name;CI.Name)
            {
            }
            column(city;CI.City)
            {
            }
            column(Add2;CI."Address 2")
            {
            }
            column(No_HD;HD."No.")
            {
            }
            column(Date_HD;HD.Date)
            {
            }
            column(DocumentType_HD;HD."Document Type")
            {
            }
            column(StudentNo_HD;HD."Student No.")
            {
            }
            column(StudentName_HD;HD."Student Name")
            {
            }
            column(FirstName_HD;HD."First Name")
            {
            }
            column(MiddleName_HD;HD."Middle Name")
            {
            }
            column(Surname_HD;HD.Surname)
            {
            }
            column(IDNumberPassportNo_HD;HD."ID Number/Passport No.")
            {
            }
            column(ExaminationID_HD;HD."Examination ID")
            {
            }
            column(ExaminationDescription_HD;HD."Examination Description")
            {
            }
            column(ExaminationCenterCode_HD;HD."Examination Center Code")
            {
            }
            column(ExaminationCenter_HD;HD."Examination Center")
            {
            }
            column(HighestAcademicQCode_HD;HD."Highest Academic QCode")
            {
            }
            column(HighestAcademicQualification_HD;HD."Highest Academic Qualification")
            {
            }
            column(Gender_HD;HD.Gender)
            {
            }
            column(DateofBirth_HD;HD."Date of Birth")
            {
            }
            column(Disabled_HD;HD.Disabled)
            {
            }
            column(NCPWDNo_HD;HD."NCPWD No.")
            {
            }
            column(RegistrationDate_HD;HD."Registration Date")
            {
            }
            column(CreatedBy_HD;HD."Created By")
            {
            }
            column(CreatedOn_HD;HD."Created On")
            {
            }
            column(ApprovalStatus_HD;HD."Approval Status")
            {
            }
            column(CurrencyCode_HD;HD."Currency Code")
            {
            }
            column(Address_HD;HD.Address)
            {
            }
            column(Address2_HD;HD."Address 2")
            {
            }
            column(City_HD;HD.City)
            {
            }
            column(CountryRegionCode_HD;HD."Country/Region Code")
            {
            }
            column(PhoneNo_HD;HD."Phone No.")
            {
            }
            column(PostCode_HD;HD."Post Code")
            {
            }
            column(County_HD;HD.County)
            {
            }
            column(Email_HD;HD.Email)
            {
            }
            column(NoSeries_HD;HD."No. Series")
            {
            }
            column(Created_HD;HD.Created)
            {
            }
            column(Portal_HD;HD.Portal)
            {
            }
            column(ReasonforRejection_HD;HD."Reason for Rejection")
            {
            }
            column(Amount_HD;HD.Amount)
            {
            }
            column(ExaminationSitting_HD;HD."Examination Sitting")
            {
            }
            column(Type_HD;HD.Type)
            {
            }
            column(RegistrationAmount_HD;HD."Registration Amount")
            {
            }
            column(RegistrationReceiptNo_HD;HD."Registration Receipt No.")
            {
            }
            column(BookingAmount_HD;HD."Booking Amount")
            {
            }
            column(BookingReceiptNo_HD;HD."Booking Receipt No.")
            {
            }
            column(ExemptionAmount_HD;HD."Exemption Amount")
            {
            }
            column(ExemptionReceipt6No_HD;HD."Exemption Receipt 6No.")
            {
            }
            column(RegistrationInvoiceNo_HD;HD."Registration Invoice No.")
            {
            }
            column(BookingInvoiceNo_HD;HD."Booking Invoice No.")
            {
            }
            column(ExemptionInvoiceNo_HD;HD."Exemption Invoice No.")
            {
            }
            column(StudentRegNo_HD;HD."Student Reg. No.")
            {
            }
            column(Section_HD;HD.Section)
            {
            }
            column(Part_HD;HD.Part)
            {
            }
            column(Paper_HD;HD.Paper)
            {
            }
            column(FeeType_HD;HD."Fee Type")
            {
            }
            column(Posted_HD;HD.Posted)
            {
            }
            column(TypeCode_HD;HD."Type Code")
            {
            }
            column(ApplicationInvoice_HD;HD."Application Invoice")
            {
            }
            column(ApplicationAmount_HD;HD."Application Amount")
            {
            }
            column(ApplicationReceipt_HD;HD."Application Receipt")
            {
            }
            column(TotalWithdrawalAmount_HD;HD."Total Withdrawal Amount")
            {
            }
            column(PreferredExamCenter_HD;HD."Preferred Exam Center")
            {
            }
            column(PreferredExamCenterName_HD;HD."Preferred Exam Center Name")
            {
            }
            column(WithdrawalApplicationNo_HD;HD."Withdrawal Application No.")
            {
            }
            column(Age_HD;HD.Age)
            {
            }
            column(WithdrawalCode_HD;HD."Withdrawal Code")
            {
            }
            column(WithdrawalReason_HD;HD."Withdrawal Reason")
            {
            }
            column(Image_HD;HD.Image)
            {
            }
            column(PostedBy_HD;HD."Posted By")
            {
            }
            column(PostedOn_HD;HD."Posted On")
            {
            }
            column(ExaminationProjectCode_HD;HD."Examination Project Code")
            {
            }
            column(ExaminationProjectName_HD;HD."Examination Project Name")
            {
            }
            column(WithdrawalRefundAmount_HD;HD."Withdrawal Refund Amount")
            {
            }
            column(DeffermentCharge_HD;HD."Defferment Charge")
            {
            }
            column(TrainingInstitutionCode_HD;HD."Training Institution Code")
            {
            }
            column(TrainingInstitution_HD;HD."Training Institution")
            {
            }
            column(QualificationCode_HD;HD."Qualification Code")
            {
            }
            column(QualificationType_HD;HD."Qualification Type")
            {
            }
            column(Qualification_HD;HD.Qualification)
            {
            }
            column(Remarks_HD;HD.Remarks)
            {
            }
            column(CaseCode_HD;HD."Case Code")
            {
            }
            column(CaseDescription_HD;HD."Case Description")
            {
            }
            column(CaseVerdict_HD;HD."Case Verdict")
            {
            }
            column(VerdictDescription_HD;HD."Verdict Description")
            {
            }
            column(DisciplinaryCommitee_HD;HD."Disciplinary Commitee")
            {
            }
            column(CommiteeName_HD;HD."Commitee Name")
            {
            }
            column(PreviousCaseNo_HD;HD."Previous Case No.")
            {
            }
            column(ReinstatementCommitee_HD;HD."Reinstatement Commitee")
            {
            }
            column(ReinstatementName_HD;HD."Reinstatement  Name")
            {
            }
            column(CaseStatus_HD;HD."Case Status")
            {
            }
            column(CollectionDate_HD;HD."Collection Date")
            {
            }
            column(CollectedByName_HD;HD."Collected By Name")
            {
            }
            column(CollectedByIDNo_HD;HD."Collected By ID No.")
            {
            }
            column(CollectedByEmail_HD;HD."Collected By Email")
            {
            }
            column(IssuedByOfficer_HD;HD."Issued By Officer")
            {
            }
            column(IssuedByOfficerName_HD;HD."Issued By Officer Name")
            {
            }
            column(CertificateNo_HD;HD."Certificate No.")
            {
            }
            column(IssuedByUserID_HD;HD."Issued By User ID")
            {
            }
            column(CertificateType_HD;HD."Certificate Type")
            {
            }
            column(RemarkAmount_HD;HD."Remark Amount")
            {
            }
            column(RemarkReceiptNo_HD;HD."Remark Receipt No.")
            {
            }
            column(RemarkInvoiceNo_HD;HD."Remark Invoice No.")
            {
            }
            column(PaymentReferenceNo_HD;HD."Payment Reference No.")
            {
            }
            column(PaymentEvidence_HD;HD."Payment Evidence")
            {
            }
            column(AdministrativeFees_HD;HD."Administrative Fees")
            {
            }
            column(PaymentCreated_HD;HD."Payment Created")
            {
            }
            column(PayMode_HD;HD."Pay Mode")
            {
            }
            column(ContactFullName_HD;HD."Contact Full Name")
            {
            }
            column(ContactEmail_HD;HD."Contact Email")
            {
            }
            column(ContactPhoneNo_HD;HD."Contact Phone No.")
            {
            }
            column(ContactRelationship_HD;HD."Contact Relationship")
            {
            }
            column(SourceofInformation_HD;HD."Source of Information")
            {
            }
            column(InformationSourceName_HD;HD."Information Source Name")
            {
            }
            column(BirthCertificateNo_HD;HD."Birth Certificate No.")
            {
            }
            column(DisabilityType_HD;HD."Disability Type")
            {
            }
            column(DisabilityName_HD;HD."Disability Name")
            {
            }
            column(RenewalAmount_HD;HD."Renewal Amount")
            {
            }
            column(RenewalReceiptNo_HD;HD."Renewal Receipt No.")
            {
            }
            column(RenewalInvoiceNo_HD;HD."Renewal Invoice No.")
            {
            }
            column(ActivationAmount_HD;HD."Activation Amount")
            {
            }
            column(ActivationReceiptNo_HD;HD."Activation Receipt No.")
            {
            }
            column(ActivationInvoiceNo_HD;HD."Activation Invoice No.")
            {
            }
            column(LastModifiedDateTime_HD;HD."Last Modified Date Time")
            {
            }
            column(LastDateModified_HD;HD."Last Date Modified")
            {
            }
            column(Submitted_HD;HD.Submitted)
            {
            }
            column(CommiiteeReferenceNo_HD;HD."Commiitee Reference No.")
            {
            }
            column(CertificateDispatchMethod_HD;HD."Certificate Dispatch Method")
            {
            }
            column(ReinstatementAmount_HD;HD."Reinstatement Amount")
            {
            }
            column(ReinstatementReceiptNo_HD;HD."Reinstatement Receipt No.")
            {
            }
            column(ReinstatementInvoiceNo_HD;HD."Reinstatement Invoice No.")
            {
            }
            column(DiscountAmount_HD;HD."Discount Amount")
            {
            }
            column(Cancelled_HD;HD.Cancelled)
            {
            }
            column(PaymentRemainingAmount_HD;HD."Payment Remaining Amount")
            {
            }
            column(BankCode_HD;HD."Bank Code")
            {
            }
            column(CountyCode_HD;HD."County Code")
            {
            }
            column(PostedDate_HD;HD."Posted Date")
            {
            }
            column(InstitutionCode_HD;HD."Institution Code")
            {
            }
            column(InstitutionName_HD;HD."Institution Name")
            {
            }
            column(InstitutionReferenceNo_HD;HD."Institution Reference No.")
            {
            }
            column(AdditionalExemption_HD;HD."Additional Exemption")
            {
            }
            column(Balance_HD;HD.Balance)
            {
            }
            column(BalanceLCY_HD;HD."Balance (LCY)")
            {
            }
            column(EmailSent_HD;HD."Email Sent")
            {
            }
            column(ManualInput_HD;HD."Manual Input")
            {
            }
            column(CancelledBy_HD;HD."Cancelled By")
            {
            }
            column(CancelledOn_HD;HD."Cancelled On")
            {
            }
            column(ComputerBased_HD;HD."Computer Based")
            {
            }
            column(PreferedExaminationSitting_HD;HD."Prefered Examination Sitting")
            {
            }
            column(Archived_HD;HD.Archived)
            {
            }
            column(ArchivedOn_HD;HD."Archived On")
            {
            }
            column(ArchivedBy_HD;HD."Archived By")
            {
            }
            column(ExemptionLetterCode_HD;HD."Exemption Letter Code")
            {
            }
            column(PostTrackingNo_HD;HD."Post Tracking No.")
            {
            }
            column(DateofPostage_HD;HD."Date of Postage")
            {
            }
            column(CertificateLevel_HD;HD."Certificate Level")
            {
            }
            column(TotalStorageFee_HD;HD."Total Storage Fee")
            {
            }
            column(ModeofDispatch_HD;HD."Mode of Dispatch")
            {
            }
            column(DocumentStatus_HD;HD."Document Status")
            {
            }
            column(RequestedByName_HD;HD."Requested By Name")
            {
            }
            column(RequestedByEMail_HD;HD."Requested By E-Mail")
            {
            }
            column(RequestorNo_HD;HD."Requestor No.")
            {
            }
            dataitem(CT;"Certificate Collection Entry")
            {
                DataItemLink = "Document No"=field("No.");
                column(ReportForNavId_165; 165)
                {
                }
                column(EntryNo_CT;CT."Entry No.")
                {
                }
                column(StudentRegNo_CT;CT."Student Reg No.")
                {
                }
                column(StudentName_CT;CT."Student Name")
                {
                }
                column(Examination_CT;CT.Examination)
                {
                }
                column(Part_CT;CT.Part)
                {
                }
                column(ExamSittingID_CT;CT."Exam Sitting ID")
                {
                }
                column(ExamCenter_CT;CT."Exam Center")
                {
                }
                column(DatePrinted_CT;CT."Date Printed")
                {
                }
                column(PrintedBy_CT;CT."Printed By")
                {
                }
                column(CollectionDate_CT;CT."Collection Date")
                {
                }
                column(CollectedByIDNumber_CT;CT."Collected By ID Number")
                {
                }
                column(CollectedByName_CT;CT."Collected By Name")
                {
                }
                column(CollectedByEmail_CT;CT."Collected By Email")
                {
                }
                column(IssuedBy_CT;CT."Issued  By")
                {
                }
                column(IssuedDate_CT;CT."Issued Date")
                {
                }
                column(IssuedTime_CT;CT."Issued Time")
                {
                }
                column(Type_CT;CT.Type)
                {
                }
                column(LastModifiedDateTime_CT;CT."Last Modified Date Time")
                {
                }
                column(LastDateModified_CT;CT."Last Date Modified")
                {
                }
                column(CertificateNo_CT;CT."Certificate No.")
                {
                }
                column(Collected_CT;CT.Collected)
                {
                }
                column(StorageAmount_CT;CT."Storage Amount")
                {
                }
                column(Status_CT;CT.Status)
                {
                }
                column(SecurityCode_CT;CT."Security Code")
                {
                }
                column(StudentNo_CT;CT."Student No.")
                {
                }
                column(DocumentNo_CT;CT."Document No")
                {
                }
                column(CertificateEntryNo_CT;CT."Certificate Entry No")
                {
                }
                column(CertificateIssuanceStatus_CT;CT."Certificate Issuance Status")
                {
                }
                column(ReasonForSuspension_CT;CT."Reason For Suspension")
                {
                }
                column(YearCompleted_CT;CT."Year Completed")
                {
                }
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
        CenterCourseCapacity: Record "Center Course Capacity";
        LevelName: Text;
        Level: Record Level;
        LevelId: Integer;
        Courses: Record Courses;
        CourseName: Text;
        ScriptEnvelopeSerials: Record "Script Envelope Serials";
        EnvelopeValues: array [10,1] of Code[30];
        i: Integer;
        Papers: Record Papers;
        eXAM: Text[250];
}
