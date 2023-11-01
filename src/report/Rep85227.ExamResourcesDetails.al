#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85227 "Exam Resources Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Exam Resources Details.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Resource;Resource)
        {
            DataItemTableView = where(Type=const(Person));
            RequestFilterFields = "Exam Task Type",Name;
            column(ReportForNavId_1; 1)
            {
            }
            column(No_Resource;Resource."No.")
            {
            }
            column(Type_Resource;Resource.Type)
            {
            }
            column(Name_Resource;Resource.Name)
            {
            }
            column(SearchName_Resource;Resource."Search Name")
            {
            }
            column(Name2_Resource;Resource."Name 2")
            {
            }
            column(Address_Resource;Resource.Address)
            {
            }
            column(Address2_Resource;Resource."Address 2")
            {
            }
            column(City_Resource;Resource.City)
            {
            }
            column(SocialSecurityNo_Resource;Resource."Social Security No.")
            {
            }
            column(JobTitle_Resource;Resource."Job Title")
            {
            }
            column(Education_Resource;Resource.Education)
            {
            }
            column(ContractClass_Resource;Resource."Contract Class")
            {
            }
            column(EmploymentDate_Resource;Resource."Employment Date")
            {
            }
            column(ResourceGroupNo_Resource;Resource."Resource Group No.")
            {
            }
            column(GlobalDimension1Code_Resource;Resource."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Resource;Resource."Global Dimension 2 Code")
            {
            }
            column(BaseUnitofMeasure_Resource;Resource."Base Unit of Measure")
            {
            }
            column(DirectUnitCost_Resource;Resource."Direct Unit Cost")
            {
            }
            column(IndirectCost_Resource;Resource."Indirect Cost %")
            {
            }
            column(UnitCost_Resource;Resource."Unit Cost")
            {
            }
            column(Profit_Resource;Resource."Profit %")
            {
            }
            column(PriceProfitCalculation_Resource;Resource."Price/Profit Calculation")
            {
            }
            column(UnitPrice_Resource;Resource."Unit Price")
            {
            }
            column(VendorNo_Resource;Resource."Vendor No.")
            {
            }
            column(LastDateModified_Resource;Resource."Last Date Modified")
            {
            }
            column(Comment_Resource;Resource.Comment)
            {
            }
            column(Blocked_Resource;Resource.Blocked)
            {
            }
            column(DateFilter_Resource;Resource."Date Filter")
            {
            }
            column(UnitofMeasureFilter_Resource;Resource."Unit of Measure Filter")
            {
            }
            column(Capacity_Resource;Resource.Capacity)
            {
            }
            column(QtyonOrderJob_Resource;Resource."Qty. on Order (Job)")
            {
            }
            column(QtyQuotedJob_Resource;Resource."Qty. Quoted (Job)")
            {
            }
            column(UsageQty_Resource;Resource."Usage (Qty.)")
            {
            }
            column(UsageCost_Resource;Resource."Usage (Cost)")
            {
            }
            column(UsagePrice_Resource;Resource."Usage (Price)")
            {
            }
            column(SalesQty_Resource;Resource."Sales (Qty.)")
            {
            }
            column(SalesCost_Resource;Resource."Sales (Cost)")
            {
            }
            column(SalesPrice_Resource;Resource."Sales (Price)")
            {
            }
            column(ChargeableFilter_Resource;Resource."Chargeable Filter")
            {
            }
            column(GenProdPostingGroup_Resource;Resource."Gen. Prod. Posting Group")
            {
            }
            // column(Picture_Resource;Resource.image)
            // {
            // }
            column(PostCode_Resource;Resource."Post Code")
            {
            }
            column(County_Resource;Resource.County)
            {
            }
            column(AutomaticExtTexts_Resource;Resource."Automatic Ext. Texts")
            {
            }
            column(NoSeries_Resource;Resource."No. Series")
            {
            }
            column(TaxGroupCode_Resource;Resource."Tax Group Code")
            {
            }
            column(VATProdPostingGroup_Resource;Resource."VAT Prod. Posting Group")
            {
            }
            column(CountryRegionCode_Resource;Resource."Country/Region Code")
            {
            }
            column(ICPartnerPurchGLAccNo_Resource;Resource."IC Partner Purch. G/L Acc. No.")
            {
            }
            column(ServiceNo_Resource;Resource."Service No")
            {
            }
            column(Email_Resource;Resource.Email)
            {
            }
            column(IDPassportNo_Resource;Resource."ID/Passport No")
            {
            }
            column(Image_Resource;Resource.Image)
            {
            }
            column(PrivacyBlocked_Resource;Resource."Privacy Blocked")
            {
            }
            column(QtyonAssemblyOrder_Resource;Resource."Qty. on Assembly Order")
            {
            }
            column(UseTimeSheet_Resource;Resource."Use Time Sheet")
            {
            }
            column(TimeSheetOwnerUserID_Resource;Resource."Time Sheet Owner User ID")
            {
            }
            column(TimeSheetApproverUserID_Resource;Resource."Time Sheet Approver User ID")
            {
            }
            column(DefaultDeferralTemplateCode_Resource;Resource."Default Deferral Template Code")
            {
            }
            column(QtyonServiceOrder_Resource;Resource."Qty. on Service Order")
            {
            }
            column(ServiceZoneFilter_Resource;Resource."Service Zone Filter")
            {
            }
            column(InCustomerZone_Resource;Resource."In Customer Zone")
            {
            }
            column(ShortcutDimension3Code_Resource;Resource."Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code_Resource;Resource."Shortcut Dimension 4 Code")
            {
            }
            column(ShortcutDimension5Code_Resource;Resource."Shortcut Dimension 5 Code")
            {
            }
            column(Researcher_Resource;Resource."Researcher?")
            {
            }
            column(BankName_Resource;Resource."Bank Name")
            {
            }
            column(BranchName_Resource;Resource."Branch Name")
            {
            }
            column(BankBranchNo_Resource;Resource."Bank Branch No.")
            {
            }
            column(BankAccountNo_Resource;Resource."Bank Account No.")
            {
            }
            column(BankCode_Resource;Resource."Bank Code")
            {
            }
            column(MPesaNumber_Resource;Resource."M-Pesa Number")
            {
            }
            column(NoofAwardedGFO_Resource;Resource."No. of Awarded GFO")
            {
            }
            column(NoofLostGrantGFO_Resource;Resource."No. of Lost Grant GFO")
            {
            }
            column(NoofOngoingRProjects_Resource;Resource."No. of Ongoing RProjects")
            {
            }
            column(NoofCompletedRProjects_Resource;Resource."No. of Completed RProjects")
            {
            }
            column(NoofResearchOutputs_Resource;Resource."No. of Research Outputs")
            {
            }
            column(TotalAmountAwardedLCY_Resource;Resource."Total Amount Awarded(LCY)")
            {
            }
            column(Admin_Resource;Resource.Admin)
            {
            }
            column(EmployeeNo_Resource;Resource."Employee No")
            {
            }
            column(EmployeeName_Resource;Resource."Employee Name")
            {
            }
            column(ResourceType_Resource;Resource."Resource Type")
            {
            }
            column(ExternalConsultant_Resource;Resource."External Consultant")
            {
            }
            column(ResearchersMajor_Resource;Resource."Researcher's Major")
            {
            }
            column(ResearcherBiography_Resource;Resource."Researcher Biography")
            {
            }
            column(JobGroup_Resource;Resource."Job Group")
            {
            }
            column(Employeestatus_Resource;Resource."Employee status")
            {
            }
            column(EmailAddress_Resource;Resource."E-mail Address")
            {
            }
            column(ProjectEngineer_Resource;Resource."Project Engineer")
            {
            }
            column(NoOfOngoingRoadProjects_Resource;Resource."No. Of Ongoing Road Projects")
            {
            }
            column(NoOfFinishedRoadProjects_Resource;Resource."No. Of Finished Road Projects")
            {
            }
            column(NoOfPlannedRoadProjects_Resource;Resource."No. Of Planned Road Projects")
            {
            }
            column(Interns_Resource;Resource.Interns)
            {
            }
            column(TransactionType_Resource;Resource."Transaction Type")
            {
            }
            column(ExamBookingCategory_Resource;Resource."Exam Booking Category")
            {
            }
            column(SectionID_Resource;Resource."Section ID")
            {
            }
            column(CourseID_Resource;Resource."Course ID")
            {
            }
            column(PaperID_Resource;Resource."Paper ID")
            {
            }
            column(PartID_Resource;Resource."Part ID")
            {
            }
            column(ExamResorceType_Resource;Resource."Exam Resorce Type")
            {
            }
            column(EMail_Resources;Resource."E-Mail")
            {
            }
            column(ExamTaskType_Resource;Resource."Exam Task Type")
            {
            }
            column(ExaminerCode_Resource;Resource."Examiner Code")
            {
            }
            column(Signature_Resource;Resource.Signature)
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
}
