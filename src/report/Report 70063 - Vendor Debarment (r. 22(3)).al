report 70063 "Vendor Debarment (r. 22(3))"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Vendor Debarment (r. 22(3)).rdlc';

    dataset
    {
        dataitem("Vendor Debarment Voucher";"Vendor Debarment Voucher")
        {
            column(DocumentNo_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Document No")
            {
            }
            column(DocumentType_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Document Type")
            {
            }
            column(SourceType_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Source Type")
            {
            }
            column(Description_VendorDebarmentVoucher;"Vendor Debarment Voucher".Description)
            {
            }
            column(DocumentDate_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Document Date")
            {
            }
            column(ExternalDocumentNo_VendorDebarmentVoucher;"Vendor Debarment Voucher"."External Document No")
            {
            }
            column(ApprovalStatus_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Approval Status")
            {
            }
            column(Posted_VendorDebarmentVoucher;"Vendor Debarment Voucher".Posted)
            {
            }
            column(CreatedBy_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Created By")
            {
            }
            column(CreatedDate_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Created Date")
            {
            }
            column(CreatedTime_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Created Time")
            {
            }
            column(NoSeries_VendorDebarmentVoucher;"Vendor Debarment Voucher"."No. Series")
            {
            }
            column(GlobalDimension1Code_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Global Dimension 2 Code")
            {
            }
            column(GlobalDimension3Code_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Global Dimension 3 Code")
            {
            }
            column(DimensionSetID_VendorDebarmentVoucher;"Vendor Debarment Voucher"."Dimension Set ID")
            {
            }
            dataitem("Vendor Debarment Voucher Line";"Vendor Debarment Voucher Line")
            {
                column(DocumentNo_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Document No")
                {
                }
                column(DocumentType_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Document Type")
                {
                }
                column(LineNo_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Line No.")
                {
                }
                column(FirmName_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Firm Name")
                {
                }
                column(DebarmentReasonCode_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Debarment Reason Code")
                {
                }
                column(Description_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line".Description)
                {
                }
                column(IneligibilityStartDate_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Ineligibility Start Date")
                {
                }
                column(IneligibilityEndDate_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Ineligibility End Date")
                {
                }
                column(ReinstatementDate_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Reinstatement Date")
                {
                }
                column(VendorNo_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Vendor No.")
                {
                }
                column(TaxRegistrationPINNo_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Tax Registration (PIN) No.")
                {
                }
                column(IncorporationRegNo_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Incorporation/Reg No.")
                {
                }
                column(Address_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line".Address)
                {
                }
                column(Address2_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Address 2")
                {
                }
                column(CountryRegionCode_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Country/Region Code")
                {
                }
                column(Posted_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line".Posted)
                {
                }
                column(ApplyToEntryNo_VendorDebarmentVoucherLine;"Vendor Debarment Voucher Line"."Apply To Entry No.")
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
}

