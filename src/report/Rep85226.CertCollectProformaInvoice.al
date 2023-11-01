#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85226 "Cert Collect Proforma Invoice"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Cert Collect Proforma Invoice.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(AMOUNT;"Student Processing Header"."Activation Amount")
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
            column(IDNumber_StudentProcessingHeader;"Student Processing Header"."ID Number/Passport No.")
            {
            }
            column(CourseID_StudentProcessingHeader;"Student Processing Header"."Examination ID")
            {
            }
            column(CourseDescription_StudentProcessingHeader;"Student Processing Header"."Examination Description")
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
            column(CI_Picture;CI.Picture)
            {
            }
            column(CI_Address;CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
            {
            }
            column(CI_City;CI.City)
            {
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(TrainingInstitution_StudentProcessingHeader;"Student Processing Header"."Training Institution")
            {
            }
            dataitem("Certificate Collection Entry";"Certificate Collection Entry")
            {
                DataItemLink = "Document No"=field("No."),"Student No."=field("Student No.");
                column(ReportForNavId_76; 76)
                {
                }
                column(PaperName;PaperName)
                {
                }
                column(EntryNo_CertificateCollectionEntry;"Certificate Collection Entry"."Entry No.")
                {
                }
                column(StudentRegNo_CertificateCollectionEntry;"Certificate Collection Entry"."Student Reg No.")
                {
                }
                column(StudentName_CertificateCollectionEntry;"Certificate Collection Entry"."Student Name")
                {
                }
                column(Examination_CertificateCollectionEntry;"Certificate Collection Entry".Examination)
                {
                }
                column(Part_CertificateCollectionEntry;"Certificate Collection Entry".Part)
                {
                }
                column(ExamSittingID_CertificateCollectionEntry;"Certificate Collection Entry"."Exam Sitting ID")
                {
                }
                column(ExamCenter_CertificateCollectionEntry;"Certificate Collection Entry"."Exam Center")
                {
                }
                column(DatePrinted_CertificateCollectionEntry;"Certificate Collection Entry"."Date Printed")
                {
                }
                column(PrintedBy_CertificateCollectionEntry;"Certificate Collection Entry"."Printed By")
                {
                }
                column(CollectionDate_CertificateCollectionEntry;"Certificate Collection Entry"."Collection Date")
                {
                }
                column(CollectedByIDNumber_CertificateCollectionEntry;"Certificate Collection Entry"."Collected By ID Number")
                {
                }
                column(CollectedByName_CertificateCollectionEntry;"Certificate Collection Entry"."Collected By Name")
                {
                }
                column(CollectedByEmail_CertificateCollectionEntry;"Certificate Collection Entry"."Collected By Email")
                {
                }
                column(IssuedBy_CertificateCollectionEntry;"Certificate Collection Entry"."Issued  By")
                {
                }
                column(IssuedDate_CertificateCollectionEntry;"Certificate Collection Entry"."Issued Date")
                {
                }
                column(IssuedTime_CertificateCollectionEntry;"Certificate Collection Entry"."Issued Time")
                {
                }
                column(Type_CertificateCollectionEntry;"Certificate Collection Entry".Type)
                {
                }
                column(LastModifiedDateTime_CertificateCollectionEntry;"Certificate Collection Entry"."Last Modified Date Time")
                {
                }
                column(LastDateModified_CertificateCollectionEntry;"Certificate Collection Entry"."Last Date Modified")
                {
                }
                column(CertificateNo_CertificateCollectionEntry;"Certificate Collection Entry"."Certificate No.")
                {
                }
                column(Collected_CertificateCollectionEntry;"Certificate Collection Entry".Collected)
                {
                }
                column(StorageAmount_CertificateCollectionEntry;"Certificate Collection Entry"."Storage Amount")
                {
                }
                column(Status_CertificateCollectionEntry;"Certificate Collection Entry".Status)
                {
                }
                column(SecurityCode_CertificateCollectionEntry;"Certificate Collection Entry"."Security Code")
                {
                }
                column(StudentNo_CertificateCollectionEntry;"Certificate Collection Entry"."Student No.")
                {
                }
                column(DocumentNo_CertificateCollectionEntry;"Certificate Collection Entry"."Document No")
                {
                }
                column(CertificateEntryNo_CertificateCollectionEntry;"Certificate Collection Entry"."Certificate Entry No")
                {
                }
                column(CertificateIssuanceStatus_CertificateCollectionEntry;"Certificate Collection Entry"."Certificate Issuance Status")
                {
                }
                column(ReasonForSuspension_CertificateCollectionEntry;"Certificate Collection Entry"."Reason For Suspension")
                {
                }
                column(YearCompleted_CertificateCollectionEntry;"Certificate Collection Entry"."Year Completed")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    // Papers.RESET;
                    // Papers.SETRANGE(Code,"Student Processing Lines".Paper);
                    // IF Papers.FINDSET THEN
                    // PaperName:=Papers.Description;
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        Papers: Record Papers;
        PaperName: Text[250];
}
