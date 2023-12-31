report 70064 "Procurement Proceedings"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Procurement Proceedings.rdlc';

    dataset
    {
        dataitem("Standard Purchase Code";"Standard Purchase Code")
        {
            column(comp_name;CompanyInf.Name)
            {
            }
            column(logo;CompanyInf.Picture)
            {
            }
            column(Code_StandardPurchaseCode;"Standard Purchase Code".Code)
            {
            }
            column(Description_StandardPurchaseCode;"Standard Purchase Code".Description)
            {
            }
            column(CurrencyCode_StandardPurchaseCode;"Standard Purchase Code"."Currency Code")
            {
            }
            column(ProcurementMethod_StandardPurchaseCode;"Standard Purchase Code"."Procurement Method")
            {
            }
            column(SolicitationType_StandardPurchaseCode;"Standard Purchase Code"."Solicitation Type")
            {
            }
            column(ExternalDocumentNo_StandardPurchaseCode;"Standard Purchase Code"."External Document No")
            {
            }
            column(ProcurementType_StandardPurchaseCode;"Standard Purchase Code"."Procurement Type")
            {
            }
            column(ProcurementCategoryID_StandardPurchaseCode;"Standard Purchase Code"."Procurement Category ID")
            {
            }
            column(ProjectID_StandardPurchaseCode;"Standard Purchase Code"."Project ID")
            {
            }
            column(AssignedProcurementOfficer_StandardPurchaseCode;"Standard Purchase Code"."Assigned Procurement Officer")
            {
            }
            column(RoadCode_StandardPurchaseCode;"Standard Purchase Code"."Road Code")
            {
            }
            column(RoadLinkName_StandardPurchaseCode;"Standard Purchase Code"."Road Link Name")
            {
            }
            column(ConstituencyID_StandardPurchaseCode;"Standard Purchase Code"."Constituency ID")
            {
            }
            column(RequestingRegion_StandardPurchaseCode;"Standard Purchase Code"."Requesting Region")
            {
            }
            column(RequestingDirectorate_StandardPurchaseCode;"Standard Purchase Code"."Requesting Directorate")
            {
            }
            column(RequestingDepartment_StandardPurchaseCode;"Standard Purchase Code"."Requesting Department")
            {
            }
            column(EngineerEstimateLCY_StandardPurchaseCode;"Standard Purchase Code"."Engineer Estimate (LCY)")
            {
            }
            column(TenderName_StandardPurchaseCode;"Standard Purchase Code"."Tender Name")
            {
            }
            column(TenderSummary_StandardPurchaseCode;"Standard Purchase Code"."Tender Summary")
            {
            }
            column(DocumentDate_StandardPurchaseCode;"Standard Purchase Code"."Document Date")
            {
            }
            column(Status_StandardPurchaseCode;"Standard Purchase Code".Status)
            {
            }
            column(Name_StandardPurchaseCode;"Standard Purchase Code".Name)
            {
            }
            column(Name2_StandardPurchaseCode;"Standard Purchase Code"."Name 2")
            {
            }
            column(Address_StandardPurchaseCode;"Standard Purchase Code".Address)
            {
            }
            column(Address2_StandardPurchaseCode;"Standard Purchase Code"."Address 2")
            {
            }
            column(PostCode_StandardPurchaseCode;"Standard Purchase Code"."Post Code")
            {
            }
            column(City_StandardPurchaseCode;"Standard Purchase Code".City)
            {
            }
            column(CountryRegionCode_StandardPurchaseCode;"Standard Purchase Code"."Country/Region Code")
            {
            }
            column(PhoneNo_StandardPurchaseCode;"Standard Purchase Code"."Phone No.")
            {
            }
            column(EMail_StandardPurchaseCode;"Standard Purchase Code"."E-Mail")
            {
            }
            column(TenderBoxLocationCode_StandardPurchaseCode;"Standard Purchase Code"."Tender Box Location Code")
            {
            }
            column(BidChargeCode_StandardPurchaseCode;"Standard Purchase Code"."Bid Charge Code")
            {
            }
            column(BidChargeLCY_StandardPurchaseCode;"Standard Purchase Code"."Bid Charge (LCY)")
            {
            }
            column(BidChargeBankCode_StandardPurchaseCode;"Standard Purchase Code"."Bid Charge Bank Code")
            {
            }
            column(BankName_StandardPurchaseCode;"Standard Purchase Code"."Bank Name")
            {
            }
            column(BankAccountName_StandardPurchaseCode;"Standard Purchase Code"."Bank Account Name")
            {
            }
            column(BidChargeBankBranch_StandardPurchaseCode;"Standard Purchase Code"."Bid Charge Bank Branch")
            {
            }
            column(BidChargeBankACNo_StandardPurchaseCode;"Standard Purchase Code"."Bid Charge Bank A/C No")
            {
            }
            column(Published_StandardPurchaseCode;"Standard Purchase Code".Published)
            {
            }
            column(Createdby_StandardPurchaseCode;"Standard Purchase Code"."Created by")
            {
            }
            column(SubmissionStartDate_StandardPurchaseCode;"Standard Purchase Code"."Submission Start Date")
            {
            }
            column(SubmissionStartTime_StandardPurchaseCode;"Standard Purchase Code"."Submission Start Time")
            {
            }
            column(SubmissionEndDate_StandardPurchaseCode;"Standard Purchase Code"."Submission End Date")
            {
            }
            column(SubmissionEndTime_StandardPurchaseCode;"Standard Purchase Code"."Submission End Time")
            {
            }
            column(NoofSubmission_StandardPurchaseCode;"Standard Purchase Code"."No. of Submission")
            {
            }
            column(EnforceMandatoryEReceipt_StandardPurchaseCode;"Standard Purchase Code"."Enforce Mandatory E-Receipt")
            {
            }
            column(BidDocumentTemplate_StandardPurchaseCode;"Standard Purchase Code"."Bid Document Template")
            {
            }
            column(DisplayScoringCriteriaVendo_StandardPurchaseCode;"Standard Purchase Code"."Display Scoring Criteria Vendo")
            {
            }
            column(BidScoringTemplate_StandardPurchaseCode;"Standard Purchase Code"."Bid Scoring Template")
            {
            }
            column(CreatedDateTime_StandardPurchaseCode;"Standard Purchase Code"."Created Date/Time")
            {
            }
            column(County_StandardPurchaseCode;"Standard Purchase Code".County)
            {
            }
            column(InvitationNoticeType_StandardPurchaseCode;"Standard Purchase Code"."Invitation Notice Type")
            {
            }
            column(BidEnvelopType_StandardPurchaseCode;"Standard Purchase Code"."Bid Envelop Type")
            {
            }
            column(SealedBids_StandardPurchaseCode;"Standard Purchase Code"."Sealed Bids")
            {
            }
            column(PRNNo_StandardPurchaseCode;"Standard Purchase Code"."PRN No.")
            {
            }
            column(BidSubmissionMethod_StandardPurchaseCode;"Standard Purchase Code"."Bid Submission Method")
            {
            }
            column(LotNo_StandardPurchaseCode;"Standard Purchase Code"."Lot No.")
            {
            }
            column(LCYCurrencyCode_StandardPurchaseCode;"Standard Purchase Code"."LCY Currency Code")
            {
            }
            column(WorksCategory_StandardPurchaseCode;"Standard Purchase Code"."Works Category")
            {
            }
            column(AnnualProcurementPlanID_StandardPurchaseCode;"Standard Purchase Code"."Annual Procurement Plan ID")
            {
            }
            column(ProcurementPlanLineNo_StandardPurchaseCode;"Standard Purchase Code"."Procurement Plan Line No.")
            {
            }
            column(ProcurementPlanEntryNo1_StandardPurchaseCode;"Standard Purchase Code"."Procurement Plan Entry No1")
            {
            }
            column(FinancialYearCode_StandardPurchaseCode;"Standard Purchase Code"."Financial Year Code")
            {
            }
            column(BudgetNarration_StandardPurchaseCode;"Standard Purchase Code"."Budget Narration")
            {
            }
            column(AvailableProcurementBudget_StandardPurchaseCode;"Standard Purchase Code"."Available Procurement Budget")
            {
            }
            column(PublishEngineersEstimate_StandardPurchaseCode;"Standard Purchase Code"."Publish Engineers Estimate")
            {
            }
            column(ProcuringEntityNameContact_StandardPurchaseCode;"Standard Purchase Code"."Procuring Entity Name/Contact")
            {
            }
            column(BidOpeningDate_StandardPurchaseCode;"Standard Purchase Code"."Bid Opening Date")
            {
            }
            column(BidOpeningTime_StandardPurchaseCode;"Standard Purchase Code"."Bid Opening Time")
            {
            }
            column(BidOpeningVenue_StandardPurchaseCode;"Standard Purchase Code"."Bid Opening Venue")
            {
            }
            column(TenderValidityDuration_StandardPurchaseCode;"Standard Purchase Code"."Tender Validity Duration")
            {
            }
            column(TenderValidityExpiryDate_StandardPurchaseCode;"Standard Purchase Code"."Tender Validity Expiry Date")
            {
            }
            column(EnforceMandatoryPrebidVisi_StandardPurchaseCode;"Standard Purchase Code"."Enforce Mandatory Pre-bid Visi")
            {
            }
            column(MandatoryPrebidVisitDate_StandardPurchaseCode;"Standard Purchase Code"."Mandatory Pre-bid Visit Date")
            {
            }
            column(DomesticBidderPreference_StandardPurchaseCode;"Standard Purchase Code"."Domestic Bidder Preference")
            {
            }
            column(MandatorySpecialGroupReserv_StandardPurchaseCode;"Standard Purchase Code"."Mandatory Special Group Reserv")
            {
            }
            column(BidTenderSecurityRequired_StandardPurchaseCode;"Standard Purchase Code"."Bid/Tender Security Required")
            {
            }
            column(BidSecurity_StandardPurchaseCode;"Standard Purchase Code"."Bid Security %")
            {
            }
            column(BidSecurityAmountLCY_StandardPurchaseCode;"Standard Purchase Code"."Bid Security Amount (LCY)")
            {
            }
            column(SpecialGroupBidSecurity_StandardPurchaseCode;"Standard Purchase Code"."Special Group Bid Security")
            {
            }
            column(BidSecurityValidityDuration_StandardPurchaseCode;"Standard Purchase Code"."Bid Security Validity Duration")
            {
            }
            column(BidSecurityExpiryDate_StandardPurchaseCode;"Standard Purchase Code"."Bid Security Expiry Date")
            {
            }
            column(InsuranceCoverRequired_StandardPurchaseCode;"Standard Purchase Code"."Insurance Cover Required")
            {
            }
            column(PerformanceSecurityRequired_StandardPurchaseCode;"Standard Purchase Code"."Performance Security Required")
            {
            }
            column(PerformanceSecurity_StandardPurchaseCode;"Standard Purchase Code"."Performance Security %")
            {
            }
            column(SpecialGroupPerformanceSecu_StandardPurchaseCode;"Standard Purchase Code"."Special Group Performance Secu")
            {
            }
            column(AdvancePaymentSecurityReq_StandardPurchaseCode;"Standard Purchase Code"."Advance Payment Security Req")
            {
            }
            column(AdvancePaymentSecurity_StandardPurchaseCode;"Standard Purchase Code"."Advance Payment Security %")
            {
            }
            column(AdvanceAmountLimit_StandardPurchaseCode;"Standard Purchase Code"."Advance Amount Limit %")
            {
            }
            column(MaxWorksKickoffDuration_StandardPurchaseCode;"Standard Purchase Code"."Max Works Kickoff Duration")
            {
            }
            column(MaxWorksCharterDuration_StandardPurchaseCode;"Standard Purchase Code"."Max Works Charter Duration")
            {
            }
            column(MaxWorksCompletionDuration_StandardPurchaseCode;"Standard Purchase Code"."Max Works Completion Duration")
            {
            }
            column(PaymentTermsCode_StandardPurchaseCode;"Standard Purchase Code"."Payment Terms Code")
            {
            }
            column(DefectsLiabilityPeriod_StandardPurchaseCode;"Standard Purchase Code"."Defects Liability Period")
            {
            }
            column(DailyLiquidatedDamUnitCost_StandardPurchaseCode;"Standard Purchase Code"."Daily Liquidated Dam Unit Cost")
            {
            }
            column(LiquidatedDamagesLimit_StandardPurchaseCode;"Standard Purchase Code"."Liquidated Damages Limit %")
            {
            }
            column(PaymentRetention_StandardPurchaseCode;"Standard Purchase Code"."Payment Retention %")
            {
            }
            column(RetentionAmountLimit_StandardPurchaseCode;"Standard Purchase Code"."Retention Amount Limit %")
            {
            }
            column(MinInterimCertificateAmount_StandardPurchaseCode;"Standard Purchase Code"."Min Interim Certificate Amount")
            {
            }
            column(AppointerofBidArbitrator_StandardPurchaseCode;"Standard Purchase Code"."Appointer of Bid Arbitrator")
            {
            }
            column(DisplayScoringCriteriaVend_StandardPurchaseCode;"Standard Purchase Code"."Display Scoring Criteria Vend")
            {
            }
            column(DocumentStatus_StandardPurchaseCode;"Standard Purchase Code"."Document Status")
            {
            }
            column(CancelReasonCode_StandardPurchaseCode;"Standard Purchase Code"."Cancel Reason Code")
            {
            }
            column(ParentInvitationNo_StandardPurchaseCode;"Standard Purchase Code"."Parent Invitation No")
            {
            }
            column(TargetBidderGroup_StandardPurchaseCode;"Standard Purchase Code"."Target Bidder Group")
            {
            }
            column(LocationCode_StandardPurchaseCode;"Standard Purchase Code"."Location Code")
            {
            }
            column(ResponsibilityCenter_StandardPurchaseCode;"Standard Purchase Code"."Responsibility Center")
            {
            }
            column(RequisitionProductGroup_StandardPurchaseCode;"Standard Purchase Code"."Requisition Product Group")
            {
            }
            column(LanguageCode_StandardPurchaseCode;"Standard Purchase Code"."Language Code")
            {
            }
            column(PurchaserCode_StandardPurchaseCode;"Standard Purchase Code"."Purchaser Code")
            {
            }
            column(NoSeries_StandardPurchaseCode;"Standard Purchase Code"."No. Series")
            {
            }
            column(GlobalDimension1Code_StandardPurchaseCode;"Standard Purchase Code"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_StandardPurchaseCode;"Standard Purchase Code"."Global Dimension 2 Code")
            {
            }
            column(GlobalDimension3Code_StandardPurchaseCode;"Standard Purchase Code"."Global Dimension 3 Code")
            {
            }
            column(PrimaryTenderSubmission_StandardPurchaseCode;"Standard Purchase Code"."Primary Tender Submission")
            {
            }
            column(PrimaryEngineerContact_StandardPurchaseCode;"Standard Purchase Code"."Primary Engineer Contact")
            {
            }
            column(CancellationDate_StandardPurchaseCode;"Standard Purchase Code"."Cancellation Date")
            {
            }
            column(CancellationSecretCode_StandardPurchaseCode;"Standard Purchase Code"."Cancellation Secret Code")
            {
            }
            column(BidOpeningCommitte_StandardPurchaseCode;"Standard Purchase Code"."Bid Opening Committe")
            {
            }
            column(BidEvaluationCommitte_StandardPurchaseCode;"Standard Purchase Code"."Bid Evaluation Committe")
            {
            }
            column(DimensionSetID_StandardPurchaseCode;"Standard Purchase Code"."Dimension Set ID")
            {
            }
            column(DepartmentCode_StandardPurchaseCode;"Standard Purchase Code"."Department Code")
            {
            }
            column(DirectorateCode_StandardPurchaseCode;"Standard Purchase Code"."Directorate Code")
            {
            }
            column(Division_StandardPurchaseCode;"Standard Purchase Code".Division)
            {
            }
            column(Job_StandardPurchaseCode;"Standard Purchase Code".Job)
            {
            }
            column(RequisitionTemplateID_StandardPurchaseCode;"Standard Purchase Code"."Requisition Template ID")
            {
            }
            column(ProcurementPlanID_StandardPurchaseCode;"Standard Purchase Code"."Procurement Plan ID")
            {
            }
            column(ProcurementPlanEntryNo_StandardPurchaseCode;"Standard Purchase Code"."Procurement Plan Entry No")
            {
            }
            column(PPPlanningCategory_StandardPurchaseCode;"Standard Purchase Code"."PP Planning Category")
            {
            }
            column(PPFundingSourceID_StandardPurchaseCode;"Standard Purchase Code"."PP Funding Source ID")
            {
            }
            column(PPTotalBudget_StandardPurchaseCode;"Standard Purchase Code"."PP Total Budget")
            {
            }
            column(PPTotalActualCosts_StandardPurchaseCode;"Standard Purchase Code"."PP Total Actual Costs")
            {
            }
            column(PPTotalCommitments_StandardPurchaseCode;"Standard Purchase Code"."PP Total Commitments")
            {
            }
            column(PPTotalAvailableBudget_StandardPurchaseCode;"Standard Purchase Code"."PP Total Available Budget")
            {
            }
            column(Stage1EOIInvitation_StandardPurchaseCode;"Standard Purchase Code"."Stage 1 EOI Invitation")
            {
            }
            column(PrebidMeetingAddress_StandardPurchaseCode;"Standard Purchase Code"."Prebid Meeting Address")
            {
            }
            column(PrebidMeetingRegisterID_StandardPurchaseCode;"Standard Purchase Code"."Prebid Meeting Register ID")
            {
            }
            column(DateTimePublished_StandardPurchaseCode;"Standard Purchase Code"."Date/Time Published")
            {
            }
            column(CancelledBy_StandardPurchaseCode;"Standard Purchase Code"."Cancelled By")
            {
            }
            column(PPSolicitationType_StandardPurchaseCode;"Standard Purchase Code"."PP Solicitation Type")
            {
            }
            column(PPProcurementMethod_StandardPurchaseCode;"Standard Purchase Code"."PP Procurement Method")
            {
            }
            column(PPPreferenceReservationCode_StandardPurchaseCode;"Standard Purchase Code"."PP Preference/Reservation Code")
            {
            }
            column(BidSelectionMethod_StandardPurchaseCode;"Standard Purchase Code"."Bid Selection Method")
            {
            }
            column(JobTaskNo_StandardPurchaseCode;"Standard Purchase Code"."Job Task No.")
            {
            }
            column(SentCancellationSecretCode_StandardPurchaseCode;"Standard Purchase Code"."Sent Cancellation Secret Code")
            {
            }
            column(SealedBidsTechnical_StandardPurchaseCode;"Standard Purchase Code"."Sealed Bids (Technical)")
            {
            }
            column(SealedBidsFinancial_StandardPurchaseCode;"Standard Purchase Code"."Sealed Bids (Financial)")
            {
            }
            column(BidOpeningRegister_StandardPurchaseCode;"Standard Purchase Code"."Bid Opening Register")
            {
            }
            column(FinanceOpeningRegister_StandardPurchaseCode;"Standard Purchase Code"."Finance Opening Register")
            {
            }
            column(FinanceBidOpeningDate_StandardPurchaseCode;"Standard Purchase Code"."Finance Bid Opening Date")
            {
            }
            dataitem("Standard Purchase Line";"Standard Purchase Line")
            {
                DataItemLink = "Standard Purchase Code"=FIELD(Code);
                column(StandardPurchaseCode_StandardPurchaseLine;"Standard Purchase Line"."Standard Purchase Code")
                {
                }
                column(LineNo_StandardPurchaseLine;"Standard Purchase Line"."Line No.")
                {
                }
                column(Type_StandardPurchaseLine;"Standard Purchase Line".Type)
                {
                }
                column(No_StandardPurchaseLine;"Standard Purchase Line"."No.")
                {
                }
                column(Description_StandardPurchaseLine;"Standard Purchase Line".Description)
                {
                }
                column(Quantity_StandardPurchaseLine;"Standard Purchase Line".Quantity)
                {
                }
                column(AmountExclVAT_StandardPurchaseLine;"Standard Purchase Line"."Amount Excl. VAT")
                {
                }
                column(UnitofMeasureCode_StandardPurchaseLine;"Standard Purchase Line"."Unit of Measure Code")
                {
                }
                column(ShortcutDimension1Code_StandardPurchaseLine;"Standard Purchase Line"."Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_StandardPurchaseLine;"Standard Purchase Line"."Shortcut Dimension 2 Code")
                {
                }
                column(VariantCode_StandardPurchaseLine;"Standard Purchase Line"."Variant Code")
                {
                }
                column(ItemCategory_StandardPurchaseLine;"Standard Purchase Line"."Item Category")
                {
                }
                column(DimensionSetID_StandardPurchaseLine;"Standard Purchase Line"."Dimension Set ID")
                {
                }
                column(ShortcutDimension3Code_StandardPurchaseLine;"Standard Purchase Line"."Shortcut Dimension 3 Code")
                {
                }
                column(ShortcutDimension4Code_StandardPurchaseLine;"Standard Purchase Line"."Shortcut Dimension 4 Code")
                {
                }
                column(ShortcutDimension5Code_StandardPurchaseLine;"Standard Purchase Line"."Shortcut Dimension 5 Code")
                {
                }
            }
            dataitem("IFS Required Document";"IFS Required Document")
            {
                DataItemLink = "Document No"=FIELD(Code);
                column(DocumentNo_IFSRequiredDocument;"IFS Required Document"."Document No")
                {
                }
                column(ProcurementDocumentTypeID_IFSRequiredDocument;"IFS Required Document"."Procurement Document Type ID")
                {
                }
                column(Description_IFSRequiredDocument;"IFS Required Document".Description)
                {
                }
                column(TrackCertificateExpiry_IFSRequiredDocument;"IFS Required Document"."Track Certificate Expiry")
                {
                }
                column(RequirementType_IFSRequiredDocument;"IFS Required Document"."Requirement Type")
                {
                }
                column(SpecialGroupRequirement_IFSRequiredDocument;"IFS Required Document"."Special Group Requirement")
                {
                }
                column(SpecializedProviderReq_IFSRequiredDocument;"IFS Required Document"."Specialized Provider Req")
                {
                }
            }
            dataitem("IFS Tender Document Source";"IFS Tender Document Source")
            {
                DataItemLink = "Document No."=FIELD(Code);
                column(DocumentNo_IFSTenderDocumentSource;"IFS Tender Document Source"."Document No.")
                {
                }
                column(TenderSourceID_IFSTenderDocumentSource;"IFS Tender Document Source"."Tender Source ID")
                {
                }
                column(Description_IFSTenderDocumentSource;"IFS Tender Document Source".Description)
                {
                }
                column(UrlLink_IFSTenderDocumentSource;"IFS Tender Document Source"."Url Link")
                {
                }
                column(DatePublished_IFSTenderDocumentSource;"IFS Tender Document Source"."Date Published")
                {
                }
                column(BidChargeCode_IFSTenderDocumentSource;"IFS Tender Document Source"."Bid Charge Code")
                {
                }
                column(IFSApplicationFeesLCY_IFSTenderDocumentSource;"IFS Tender Document Source"."IFS Application Fees (LCY)")
                {
                }
            }
            dataitem("IFS Securities";"IFS Securities")
            {
                DataItemLink = "IFS Code"=FIELD(Code);
                column(IFSCode_IFSSecurities;"IFS Securities"."IFS Code")
                {
                }
                column(FormofSecurity_IFSSecurities;"IFS Securities"."Form of Security")
                {
                }
                column(SecurityType_IFSSecurities;"IFS Securities"."Security Type")
                {
                }
                column(RequiredatBidSubmission_IFSSecurities;"IFS Securities"."Required at Bid Submission")
                {
                }
                column(Description_IFSSecurities;"IFS Securities".Description)
                {
                }
                column(SecurityAmountLCY_IFSSecurities;"IFS Securities"."Security Amount (LCY)")
                {
                }
                column(BidSecurityValidityExpiry_IFSSecurities;"IFS Securities"."Bid Security Validity Expiry")
                {
                }
                column(NatureofSecurity_IFSSecurities;"IFS Securities"."Nature of Security")
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
        CompanyInf.Reset;
        CompanyInf.CalcFields(Picture);
    end;

    var
        CompanyInf: Record "Company Information";
}

