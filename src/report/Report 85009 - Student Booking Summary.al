report 85009 "Student Booking Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Student Booking Summary.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
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
            column(COMPANYNAME;CompanyName)
            {
            }
            column(TrainingInstitution_StudentProcessingHeader;"Student Processing Header"."Training Institution")
            {
            }
            dataitem("Student Processing Lines";"Student Processing Lines")
            {
                DataItemLink = "Booking Header No."=FIELD("No.");
                DataItemTableView = WHERE(Type=FILTER(Booking));
                column(BookingHeaderNo_StudentBookingLines;"Student Processing Lines"."Booking Header No.")
                {
                }
                column(LineNo_StudentBookingLines;"Student Processing Lines"."Line No.")
                {
                }
                column(CourseId_StudentBookingLines;"Student Processing Lines"."Course Id")
                {
                }
                column(Section_StudentBookingLines;"Student Processing Lines".Section)
                {
                }
                column(Part_StudentBookingLines;"Student Processing Lines".Part)
                {
                }
                column(Paper_StudentBookingLines;"Student Processing Lines".Paper)
                {
                }
                column(Description_StudentBookingLines;"Student Processing Lines".Description)
                {
                }
                column(CurrencyCode_StudentBookingLines;"Student Processing Lines"."Currency Code")
                {
                }
                column(Amount_StudentBookingLines;"Student Processing Lines".Amount)
                {
                }
                column(AmountLCY_StudentBookingLines;"Student Processing Lines"."Amount LCY")
                {
                }
                column(RegistrationNo_StudentBookingLines;"Student Processing Lines"."Registration No.")
                {
                }
                column(Name_StudentBookingLines;"Student Processing Lines".Name)
                {
                }
                column(PreferredExamCenter_StudentBookingLines;"Student Processing Lines"."Preferred Exam Center")
                {
                }
                column(SittingCycle_StudentBookingLines;"Student Processing Lines"."Sitting Cycle")
                {
                }
                column(Year_StudentBookingLines;"Student Processing Lines".Year)
                {
                }
                column(Blocked_StudentBookingLines;"Student Processing Lines".Blocked)
                {
                }
                column(Type_StudentBookingLines;"Student Processing Lines".Type)
                {
                }
                column(Exempted_StudentBookingLines;"Student Processing Lines".Exempted)
                {
                }
                column(BookingType_StudentBookingLines;"Student Processing Lines"."Booking Type")
                {
                }
                column(DocumentType_StudentBookingLines;"Student Processing Lines"."Document Type")
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

