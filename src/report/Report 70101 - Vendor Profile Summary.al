report 70101 "Vendor Profile Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Vendor Profile Summary.rdlc';

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            column(logo;corec.Picture)
            {
            }
            column(Name;corec.Name)
            {
            }
            column(Name_Vendor;Vendor.Name)
            {
            }
            column(Address_Vendor;Vendor.Address)
            {
            }
            column(Address2_Vendor;Vendor."Address 2")
            {
            }
            column(City_Vendor;Vendor.City)
            {
            }
            column(Contact_Vendor;Vendor.Contact)
            {
            }
            column(PhoneNo_Vendor;Vendor."Phone No.")
            {
            }
            column(GlobalDimension1Filter_Vendor;Vendor."Global Dimension 1 Filter")
            {
            }
            column(EMail_Vendor;Vendor."E-Mail")
            {
            }
            column(HomePage_Vendor;Vendor."Home Page")
            {
            }
            column(YagpoCertNo_Vendor;Vendor."Yagpo Cert. No.")
            {
            }
            column(IncorporationCertificateNo_Vendor;Vendor."Incorporation Certificate No.")
            {
            }
            column(Disability_Vendor;Vendor.Disability)
            {
            }
            column(OwnershipType_Vendor;Vendor."Ownership Type")
            {
            }
            column(RegistrationIncorporationNo_Vendor;Vendor."Registration/Incorporation No.")
            {
            }
            column(RegIncorporationDate_Vendor;Vendor."Reg/Incorporation Date")
            {
            }
            column(OperationsStartDate_Vendor;Vendor."Operations Start Date")
            {
            }
            column(TaxPINNo_Vendor;Vendor."Tax PIN No.")
            {
            }
            column(NSSFNo_Vendor;Vendor."NSSF No.")
            {
            }
            column(NHIFNo_Vendor;Vendor."NHIF No.")
            {
            }
            column(SupplierType_Vendor;Vendor."Supplier Type")
            {
            }
            column(NominalCapitalLCY_Vendor;Vendor."Nominal Capital LCY")
            {
            }
            column(IssuedCapitalLCY_Vendor;Vendor."Issued Capital LCY")
            {
            }
            column(DealerType_Vendor;Vendor."Dealer Type")
            {
            }
            column(MaxValueofBusiness_Vendor;Vendor."Max Value of Business")
            {
            }
            column(NatureofBusiness_Vendor;Vendor."Nature of Business")
            {
            }
            column(FixedLineTelNo_Vendor;Vendor."Fixed Line Tel No")
            {
            }
            column(BuildingHouseNo_Vendor;Vendor."Building/House No")
            {
            }
            column(Floor_Vendor;Vendor.Floor)
            {
            }
            column(PlotNo_Vendor;Vendor."Plot No")
            {
            }
            column(Street_Vendor;Vendor.Street)
            {
            }
            column(VisionStatement_Vendor;Vendor."Vision Statement")
            {
            }
            column(MissionStatement_Vendor;Vendor."Mission Statement")
            {
            }
            column(TotalNumberofEmployees_Vendor;Vendor."Total Number of Employees")
            {
            }
            column(IndustryGroup_Vendor;Vendor."Industry Group")
            {
            }
            column(CompanySize_Vendor;Vendor."Company Size")
            {
            }
            column(Trainer_Vendor;Vendor.Trainer)
            {
            }
            column(KNTCAgent_Vendor;Vendor."KNTC Agent")
            {
            }
            dataitem("Vendor Special Group Entry";"Vendor Special Group Entry")
            {
                DataItemLink = "Vendor No"=FIELD("No.");
                column(CertifcateNo_VendorSpecialGroupEntry;"Vendor Special Group Entry"."Certifcate No")
                {
                }
                column(VendorNo_VendorSpecialGroupEntry;"Vendor Special Group Entry"."Vendor No")
                {
                }
                column(VendorCategory_VendorSpecialGroupEntry;"Vendor Special Group Entry"."Vendor Category")
                {
                }
                column(CertifyingAgency_VendorSpecialGroupEntry;"Vendor Special Group Entry"."Certifying Agency")
                {
                }
                column(ProductsServiceCategory_VendorSpecialGroupEntry;"Vendor Special Group Entry"."Products/Service Category")
                {
                }
                column(CertificateExpiryDate_VendorSpecialGroupEntry;"Vendor Special Group Entry"."Certificate Expiry Date")
                {
                }
                column(EffectiveDate_VendorSpecialGroupEntry;"Vendor Special Group Entry"."Effective Date")
                {
                }
                column(EndDate_VendorSpecialGroupEntry;"Vendor Special Group Entry"."End Date")
                {
                }
            }
            dataitem("Vendor Business Owner";"Vendor Business Owner")
            {
                DataItemLink = "Vendor No."=FIELD("No.");
                column(VendorNo_VendorBusinessOwner;"Vendor Business Owner"."Vendor No.")
                {
                }
                column(Name_VendorBusinessOwner;"Vendor Business Owner".Name)
                {
                }
                column(Address_VendorBusinessOwner;"Vendor Business Owner".Address)
                {
                }
                column(City_VendorBusinessOwner;"Vendor Business Owner".City)
                {
                }
                column(PhoneNo_VendorBusinessOwner;"Vendor Business Owner"."Phone No.")
                {
                }
                column(CitizenshipType_VendorBusinessOwner;"Vendor Business Owner"."Citizenship Type")
                {
                }
                column(DateofBirth_VendorBusinessOwner;"Vendor Business Owner"."Date of Birth")
                {
                }
                column(EntityOwnership_VendorBusinessOwner;"Vendor Business Owner"."Entity Ownership %")
                {
                }
                column(IDPassportNo_VendorBusinessOwner;"Vendor Business Owner"."ID/Passport No.")
                {
                }
            }
            dataitem("Vendor Litigation History";"Vendor Litigation History")
            {
                DataItemLink = "Vendor No."=FIELD("No.");
                column(VendorNo_VendorLitigationHistory;"Vendor Litigation History"."Vendor No.")
                {
                }
                column(DisputeMatter_VendorLitigationHistory;"Vendor Litigation History"."Dispute Matter")
                {
                }
                column(CategoryofMatter_VendorLitigationHistory;"Vendor Litigation History"."Category of Matter")
                {
                }
                column(Year_VendorLitigationHistory;"Vendor Litigation History".Year)
                {
                }
                column(OtherDisputeParty_VendorLitigationHistory;"Vendor Litigation History"."Other Dispute Party")
                {
                }
                column(V3rdPartyEntity_VendorLitigationHistory;"Vendor Litigation History"."3rd Party Entity")
                {
                }
                column(DisputeAmountLCY_VendorLitigationHistory;"Vendor Litigation History"."Dispute Amount LCY")
                {
                }
                column(AwardType_VendorLitigationHistory;"Vendor Litigation History"."Award Type")
                {
                }
            }
            dataitem("Vendor Past Experience";"Vendor Past Experience")
            {
                DataItemLink = "Vendor No."=FIELD("No.");
                column(VendorNo_VendorPastExperience;"Vendor Past Experience"."Vendor No.")
                {
                }
                column(ClientName_VendorPastExperience;"Vendor Past Experience"."Client Name")
                {
                }
                column(AssignmentName_VendorPastExperience;"Vendor Past Experience"."Assignment Name")
                {
                }
                column(ProjectScopeSummary_VendorPastExperience;"Vendor Past Experience"."Project Scope Summary")
                {
                }
                column(DeliveryLocation_VendorPastExperience;"Vendor Past Experience"."Delivery Location")
                {
                }
                column(ContractRefNo_VendorPastExperience;"Vendor Past Experience"."Contract Ref No")
                {
                }
                column(AssignmentStartDate_VendorPastExperience;"Vendor Past Experience"."Assignment Start Date")
                {
                }
                column(AssignmentEndDate_VendorPastExperience;"Vendor Past Experience"."Assignment End Date")
                {
                }
                column(AssignmentValueLCY_VendorPastExperience;"Vendor Past Experience"."Assignment Value LCY")
                {
                }
                column(AssignmentStatus_VendorPastExperience;"Vendor Past Experience"."Assignment Status")
                {
                }
            }
            dataitem("Vendor Professional Staff";"Vendor Professional Staff")
            {
                DataItemLink = "Vendor No."=FIELD("No.");
                column(VendorNo_VendorProfessionalStaff;"Vendor Professional Staff"."Vendor No.")
                {
                }
                column(StaffName_VendorProfessionalStaff;"Vendor Professional Staff"."Staff Name")
                {
                }
                column(Proffesion_VendorProfessionalStaff;"Vendor Professional Staff".Proffesion)
                {
                }
                column(CurrentDesignation_VendorProfessionalStaff;"Vendor Professional Staff"."Current Designation")
                {
                }
                column(PhoneNo_VendorProfessionalStaff;"Vendor Professional Staff"."Phone No.")
                {
                }
                column(Nationality_VendorProfessionalStaff;"Vendor Professional Staff".Nationality)
                {
                }
                column(CitizenshipType_VendorProfessionalStaff;"Vendor Professional Staff"."Citizenship Type")
                {
                }
                column(DateofBirth_VendorProfessionalStaff;"Vendor Professional Staff"."Date of Birth")
                {
                }
                column(EMail_VendorProfessionalStaff;"Vendor Professional Staff"."E-Mail")
                {
                }
                column(YearsWiththeFirm_VendorProfessionalStaff;"Vendor Professional Staff"."Years With the Firm")
                {
                }
                column(StaffNumber_VendorProfessionalStaff;"Vendor Professional Staff"."Staff Number")
                {
                }
            }
            dataitem("Vendor Audited Balance Sheet";"Vendor Audited Balance Sheet")
            {
                DataItemLink = "Vendor No."=FIELD("No.");
                column(VendorNo_VendorAuditedBalanceSheet;"Vendor Audited Balance Sheet"."Vendor No.")
                {
                }
                column(AuditYearCodeReference_VendorAuditedBalanceSheet;"Vendor Audited Balance Sheet"."Audit Year Code Reference")
                {
                }
                column(CurrentAssetsLCY_VendorAuditedBalanceSheet;"Vendor Audited Balance Sheet"."Current Assets (LCY)")
                {
                }
                column(FixedAssetsLCY_VendorAuditedBalanceSheet;"Vendor Audited Balance Sheet"."Fixed Assets (LCY)")
                {
                }
                column(TotalAssetsLCY_VendorAuditedBalanceSheet;"Vendor Audited Balance Sheet"."Total Assets (LCY)")
                {
                }
                column(CurrentLiabilitiesLCY_VendorAuditedBalanceSheet;"Vendor Audited Balance Sheet"."Current Liabilities (LCY)")
                {
                }
                column(LongtermLiabilitiesLCY_VendorAuditedBalanceSheet;"Vendor Audited Balance Sheet"."Long-term Liabilities (LCY)")
                {
                }
                column(TotalLiabilitiesLCY_VendorAuditedBalanceSheet;"Vendor Audited Balance Sheet"."Total Liabilities (LCY)")
                {
                }
                column(OwnersEquityLCY_VendorAuditedBalanceSheet;"Vendor Audited Balance Sheet"."Owners Equity (LCY)")
                {
                }
                column(TotalLiabilitiesEquityLCY_VendorAuditedBalanceSheet;"Vendor Audited Balance Sheet"."Total Liabilities & Equity(LCY")
                {
                }
            }
            dataitem("Vendor Audited Income Statemen";"Vendor Audited Income Statemen")
            {
                column(VendorNo_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Vendor No.")
                {
                }
                column(AuditYearCodeReference_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Audit Year Code Reference")
                {
                }
                column(TotalRevenueLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Total Revenue (LCY)")
                {
                }
                column(TotalCOGSLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Total COGS (LCY)")
                {
                }
                column(GrossMarginLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Gross Margin (LCY)")
                {
                }
                column(TotalOperatingExpensesLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Total Operating Expenses (LCY)")
                {
                }
                column(OperatingIncomeEBITLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Operating Income/EBIT (LCY)")
                {
                }
                column(OtherNonoperatingReExpLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Other Non-operating Re/Exp LCY")
                {
                }
                column(InterestExpenseLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Interest Expense (LCY)")
                {
                }
                column(IncomeBeforeTaxesLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Income Before Taxes (LCY)")
                {
                }
                column(IncomeTaxExpenseLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Income Tax Expense (LCY)")
                {
                }
                column(NetIncomefromOpsLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Net Income from Ops  (LCY)")
                {
                }
                column(BelowthelineItemsLCY_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Below-the-line Items (LCY)")
                {
                }
                column(NetIncome_VendorAuditedIncomeStatemen;"Vendor Audited Income Statemen"."Net Income")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                corec.CalcFields(corec.Picture);
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
        corec.CalcFields(corec.Picture);
    end;

    var
        corec: Record "Company Information";
        SerialNo: Integer;
}

