report 85000 "Bulk Application Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bulk Application Report.rdlc';

    dataset
    {
        dataitem("Bulk Processing Header";"Bulk Processing Header")
        {
            DataItemTableView = WHERE("Document Type"=FILTER(Registration));
            RequestFilterFields = "No.";
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
            column(Image;TenantMedia.Content)
            {
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
            }
            column(COMPANYNAME;CompanyName)
            {
            }
            column(No_BulkProcessingHeader;"Bulk Processing Header"."No.")
            {
            }
            column(Date_BulkProcessingHeader;"Bulk Processing Header".Date)
            {
            }
            column(DocumentType_BulkProcessingHeader;"Bulk Processing Header"."Document Type")
            {
            }
            column(InstitutionNo_BulkProcessingHeader;"Bulk Processing Header"."Institution No.")
            {
            }
            column(InstitutionName_BulkProcessingHeader;"Bulk Processing Header"."Institution Name")
            {
            }
            column(RegistrationDate_BulkProcessingHeader;"Bulk Processing Header"."Registration Date")
            {
            }
            column(CreatedBy_BulkProcessingHeader;"Bulk Processing Header"."Created By")
            {
            }
            column(CreatedOn_BulkProcessingHeader;"Bulk Processing Header"."Created On")
            {
            }
            column(ApprovalStatus_BulkProcessingHeader;"Bulk Processing Header"."Approval Status")
            {
            }
            column(CurrencyCode_BulkProcessingHeader;"Bulk Processing Header"."Currency Code")
            {
            }
            column(Address_BulkProcessingHeader;"Bulk Processing Header".Address)
            {
            }
            column(Address2_BulkProcessingHeader;"Bulk Processing Header"."Address 2")
            {
            }
            column(City_BulkProcessingHeader;"Bulk Processing Header".City)
            {
            }
            column(CountryRegionCode_BulkProcessingHeader;"Bulk Processing Header"."Country/Region Code")
            {
            }
            column(PhoneNo_BulkProcessingHeader;"Bulk Processing Header"."Phone No.")
            {
            }
            column(PostCode_BulkProcessingHeader;"Bulk Processing Header"."Post Code")
            {
            }
            column(County_BulkProcessingHeader;"Bulk Processing Header".County)
            {
            }
            column(Email_BulkProcessingHeader;"Bulk Processing Header".Email)
            {
            }
            column(NoSeries_BulkProcessingHeader;"Bulk Processing Header"."No. Series")
            {
            }
            column(Created_BulkProcessingHeader;"Bulk Processing Header".Created)
            {
            }
            column(Portal_BulkProcessingHeader;"Bulk Processing Header".Portal)
            {
            }
            column(TotalAmount_BulkProcessingHeader;"Bulk Processing Header"."Total Amount")
            {
            }
            column(WorkType_BulkProcessingHeader;"Bulk Processing Header"."Work Type")
            {
            }
            column(Posted_BulkProcessingHeader;"Bulk Processing Header".Posted)
            {
            }
            column(TypeCode_BulkProcessingHeader;"Bulk Processing Header"."Type Code")
            {
            }
            column(RegistrationAmount_BulkProcessingHeader;"Bulk Processing Header"."Registration Amount")
            {
            }
            column(RegistrationReceiptNo_BulkProcessingHeader;"Bulk Processing Header"."Registration Receipt No.")
            {
            }
            column(BookingAmount_BulkProcessingHeader;"Bulk Processing Header"."Booking Amount")
            {
            }
            column(BookingReceiptNo_BulkProcessingHeader;"Bulk Processing Header"."Booking Receipt No.")
            {
            }
            column(ExcemptionAmount_BulkProcessingHeader;"Bulk Processing Header"."Excemption Amount")
            {
            }
            column(ExcemptionReceiptNo_BulkProcessingHeader;"Bulk Processing Header"."Excemption Receipt No.")
            {
            }
            column(RegistrationInvoiceNo_BulkProcessingHeader;"Bulk Processing Header"."Registration Invoice No.")
            {
            }
            column(BookingInvoiceNo_BulkProcessingHeader;"Bulk Processing Header"."Booking Invoice No.")
            {
            }
            column(ApplicationInvoice_BulkProcessingHeader;"Bulk Processing Header"."Application Invoice")
            {
            }
            column(ApplicationAmount_BulkProcessingHeader;"Bulk Processing Header"."Application Amount")
            {
            }
            column(ApplicationReceipt_BulkProcessingHeader;"Bulk Processing Header"."Application Receipt")
            {
            }
            dataitem("Bulk Processing Lines";"Bulk Processing Lines")
            {
                DataItemLink = "Bulk Header No."=FIELD("No.");
                column(LineNo_BulkProcessingLines;"Bulk Processing Lines"."Line No.")
                {
                }
                column(BulkHeaderNo_BulkProcessingLines;"Bulk Processing Lines"."Bulk Header No.")
                {
                }
                column(DocumentType_BulkProcessingLines;"Bulk Processing Lines"."Document Type")
                {
                }
                column(StudentNo_BulkProcessingLines;"Bulk Processing Lines"."Student No.")
                {
                }
                column(StudentName_BulkProcessingLines;"Bulk Processing Lines"."Student Name")
                {
                }
                column(FirstName_BulkProcessingLines;"Bulk Processing Lines"."First Name")
                {
                }
                column(MiddleName_BulkProcessingLines;"Bulk Processing Lines"."Middle Name")
                {
                }
                column(Surname_BulkProcessingLines;"Bulk Processing Lines".Surname)
                {
                }
                column(IDNumber_BulkProcessingLines;"Bulk Processing Lines"."ID Number")
                {
                }
                column(CourseID_BulkProcessingLines;"Bulk Processing Lines"."Course ID")
                {
                }
                column(CourseDescription_BulkProcessingLines;"Bulk Processing Lines"."Course Description")
                {
                }
                column(TrainingInstitutionCode_BulkProcessingLines;"Bulk Processing Lines"."Training Institution Code")
                {
                }
                column(TrainingInstitution_BulkProcessingLines;"Bulk Processing Lines"."Training Institution")
                {
                }
                column(HighestAcademicQCode_BulkProcessingLines;"Bulk Processing Lines"."Highest Academic QCode")
                {
                }
                column(HighestAcademicQualification_BulkProcessingLines;"Bulk Processing Lines"."Highest Academic Qualification")
                {
                }
                column(Gender_BulkProcessingLines;"Bulk Processing Lines".Gender)
                {
                }
                column(DateofBirth_BulkProcessingLines;"Bulk Processing Lines"."Date of Birth")
                {
                }
                column(Disabled_BulkProcessingLines;"Bulk Processing Lines".Disabled)
                {
                }
                column(NCPWDNo_BulkProcessingLines;"Bulk Processing Lines"."NCPWD No.")
                {
                }
                column(CurrencyCode_BulkProcessingLines;"Bulk Processing Lines"."Currency Code")
                {
                }
                column(Address_BulkProcessingLines;"Bulk Processing Lines".Address)
                {
                }
                column(Address2_BulkProcessingLines;"Bulk Processing Lines"."Address 2")
                {
                }
                column(Image_BulkProcessingLines;"Bulk Processing Lines".Image)
                {
                }
                column(City_BulkProcessingLines;"Bulk Processing Lines".City)
                {
                }
                column(CountryRegionCode_BulkProcessingLines;"Bulk Processing Lines"."Country/Region Code")
                {
                }
                column(PhoneNo_BulkProcessingLines;"Bulk Processing Lines"."Phone No.")
                {
                }
                column(PostCode_BulkProcessingLines;"Bulk Processing Lines"."Post Code")
                {
                }
                column(County_BulkProcessingLines;"Bulk Processing Lines".County)
                {
                }
                column(Email_BulkProcessingLines;"Bulk Processing Lines".Email)
                {
                }
                column(NoSeries_BulkProcessingLines;"Bulk Processing Lines"."No. Series")
                {
                }
                column(Created_BulkProcessingLines;"Bulk Processing Lines".Created)
                {
                }
                column(ReasonforRejection_BulkProcessingLines;"Bulk Processing Lines"."Reason for Rejection")
                {
                }
                column(ExaminationCyce_BulkProcessingLines;"Bulk Processing Lines"."Examination Cyce")
                {
                }
                column(Passed_BulkProcessingLines;"Bulk Processing Lines".Passed)
                {
                }
                column(Amount_BulkProcessingLines;"Bulk Processing Lines".Amount)
                {
                }
                column(RegistrationNo_BulkProcessingLines;"Bulk Processing Lines"."Registration No.")
                {
                }
                column(PreferredExamCenter_BulkProcessingLines;"Bulk Processing Lines"."Preferred Exam Center")
                {
                }
                column(AmountLCY_BulkProcessingLines;"Bulk Processing Lines"."Amount LCY")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    /*ItemNo:='ITM3068';
                    Item.GET(ItemNo);*/
                    for  Index := 1 to "Bulk Processing Lines".Image.Count do begin
                          if TenantMedia.Get("Bulk Processing Lines".Image.Item(Index)) then begin
                             TenantMedia.CalcFields(Content);
                          end;
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        TenantMedia: Record "Tenant Media";
        Index: Integer;
        Item: Record Item;
        ItemNo: Code[30];
}

