report 85025 "Confirmation Letter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Confirmation Letter.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            column(Logo;CI.Picture)
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
            dataitem("Exemption Entries";"Exemption Entries")
            {
                DataItemLink = "Exemption Voucher No."=FIELD("No.");
                column(EntryNo_ExemptionEntries;"Exemption Entries"."Entry No.")
                {
                }
                column(ExcemptionVoucherNo_ExemptionEntries;"Exemption Entries"."Exemption Voucher No.")
                {
                }
                column(CourseId_ExemptionEntries;"Exemption Entries"."Course Id")
                {
                }
                column(Type_ExemptionEntries;"Exemption Entries".Type)
                {
                }
                column(No_ExemptionEntries;"Exemption Entries"."No.")
                {
                }
                column(Name_ExemptionEntries;"Exemption Entries".Name)
                {
                }
                column(CurrencyCode_ExemptionEntries;"Exemption Entries"."Currency Code")
                {
                }
                column(Amount_ExemptionEntries;"Exemption Entries".Amount)
                {
                }
                column(AmountLCY_ExemptionEntries;"Exemption Entries"."Amount LCY")
                {
                }
                column(StudCustNo_ExemptionEntries;"Exemption Entries"."Stud. Cust No.")
                {
                }
                column(StudRegNo_ExemptionEntries;"Exemption Entries"."Stud. Reg. No")
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
}

