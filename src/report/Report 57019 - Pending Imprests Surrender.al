report 57019 "Pending Imprests Surrender"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Pending Imprests Surrender.rdlc';

    dataset
    {
        dataitem(Payments;Payments)
        {
            DataItemTableView = WHERE("Payment Type"=FILTER(Surrender),Posted=FILTER(false));
            RequestFilterFields = Date;
            column(No_Payments;Payments."No.")
            {
            }
            column(Date_Payments;Payments.Date)
            {
            }
            column(Type_Payments;Payments.Type)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(PaymentNarration;PaymentNarration)
            {
            }
            column(PayMode_Payments;Payments."Pay Mode")
            {
            }
            column(ChequeNo_Payments;Payments."Cheque No")
            {
            }
            column(ChequeDate_Payments;Payments."Cheque Date")
            {
            }
            column(BankCode_Payments;Payments."Bank Code")
            {
            }
            column(Payee_Payments;Payments.Payee)
            {
            }
            column(Onbehalfof_Payments;Payments."On behalf of")
            {
            }
            column(CreatedBy_Payments;Payments."Created By")
            {
            }
            column(Posted_Payments;Payments.Posted)
            {
            }
            column(PostedBy_Payments;Payments."Posted By")
            {
            }
            column(PostedDate_Payments;PostingDate)
            {
            }
            column(ShortcutDimension1Code_Payments;Payments."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_Payments;Payments."Shortcut Dimension 2 Code")
            {
            }
            column(TimePosted_Payments;Payments."Time Posted")
            {
            }
            column(TotalAmountLCY_Payments;Payments."Total Amount LCY")
            {
            }
            column(PayingBankAccount_Payments;Payments."Paying Bank Account")
            {
            }
            column(Status_Payments;Payments.Status)
            {
            }
            column(PaymentType_Payments;Payments."Payment Type")
            {
            }
            column(CurrencyCode_Payments;Payments."Currency Code")
            {
            }
            column(NoSeries_Payments;Payments."No. Series")
            {
            }
            column(AccountType_Payments;Payments."Account Type")
            {
            }
            column(AccountNo_Payments;Payments."Account No.")
            {
            }
            column(AccountName_Payments;Payments."Account Name")
            {
            }
            column(ImprestAmount_Payments;Payments."Imprest Amount")
            {
            }
            column(Surrendered_Payments;Payments.Surrendered)
            {
            }
            column(AppliesToDocNo_Payments;Payments."Applies- To Doc No.")
            {
            }
            column(PettyCashAmount_Payments;Payments."Petty Cash Amount")
            {
            }
            column(OriginalDocument_Payments;Payments."Original Document")
            {
            }
            column(PVCreationDateTime_Payments;Payments."PV Creation DateTime")
            {
            }
            column(PVCreatorID_Payments;Payments."PV Creator ID")
            {
            }
            column(RemainingAmount_Payments;Payments."Remaining Amount")
            {
            }
            column(ReceiptCreated_Payments;Payments."Receipt Created")
            {
            }
            column(ImprestDeadline_Payments;Payments."Imprest Deadline")
            {
            }
            column(SurrenderDate_Payments;Payments."Surrender Date")
            {
            }
            column(DateFilter_Payments;Payments."Date Filter")
            {
            }
            column(ImprestType_Payments;Payments."Imprest Type")
            {
            }
            column(Project_Payments;Payments.Project)
            {
            }
            column(ProjectDescription_Payments;Payments."Project Description")
            {
            }
            column(TravelDate_Payments;Payments."Travel Date")
            {
            }
            column(Cashier_Payments;Payments.Cashier)
            {
            }
            column(TotalAmount_Payments;Payments."Total Amount")
            {
            }
            column(FunctionName_Payments;Payments."Function Name")
            {
            }
            column(BudgetCenterName_Payments;Payments."Budget Center Name")
            {
            }
            column(PaymentReleaseDate_Payments;Payments."Payment Release Date")
            {
            }
            column(NoPrinted_Payments;Payments."No. Printed")
            {
            }
            column(DocumentType_Payments;Payments."Document Type")
            {
            }
            column(SurrenderStatus_Payments;Payments."Surrender Status")
            {
            }
            column(DepartureDate_Payments;Payments."Departure Date")
            {
            }
            column(ResponsibilityCenter_Payments;Payments."Responsibility Center")
            {
            }
            column(ChequeType_Payments;Payments."Cheque Type")
            {
            }
            column(PaymentNarration_Payments;Payments."Payment Narration")
            {
            }
            column(TotalVATAmount_Payments;Payments."Total VAT Amount")
            {
            }
            column(TotalWitholdingTaxAmount_Payments;Payments."Total Witholding Tax Amount")
            {
            }
            column(TotalNetAmount_Payments;Payments."Total Net Amount")
            {
            }
            column(TotalPaymentAmountLCY_Payments;Payments."Total Payment Amount LCY")
            {
            }
            column(TotalRetentionAmount_Payments;Payments."Total Retention Amount")
            {
            }
            column(ShortcutDimension3Code_Payments;Payments."Shortcut Dimension 3 Code")
            {
            }
            column(PostingDate_Payments;Payments."Posting Date")
            {
            }
            column(JobTaskNo_Payments;Payments."Job Task No.")
            {
            }
            column(JobTaskName_Payments;Payments."Job Task Name")
            {
            }
            column(ActualAmountSpent_Payments;Payments."Actual Amount Spent")
            {
            }
            column(CashReceiptAmount_Payments;Payments."Cash Receipt Amount")
            {
            }
            column(ShortcutDimension4Code_Payments;Payments."Shortcut Dimension 4 Code")
            {
            }
            column(PhoneNumber_Payments;Payments."Phone Number")
            {
            }
            column(DateofReporting_Payments;Payments."Date of Reporting")
            {
            }
            column(ImprestIssueDate_Payments;Payments."Imprest Issue Date")
            {
            }
            column(ImprestIssueDocNo_Payments;Payments."Imprest Issue Doc. No")
            {
            }
            column(DateSurrendered_Payments;Payments."Date Surrendered")
            {
            }
            column(SurrenderedBy_Payments;Payments."Surrendered By")
            {
            }
            column(ActualPettyCashAmountSpent_Payments;Payments."Actual Petty Cash Amount Spent")
            {
            }
            column(ShortcutDimension5Code_Payments;Payments."Shortcut Dimension 5 Code")
            {
            }
            column(RemainingPettyCashAmount_Payments;Payments."Remaining Petty Cash Amount")
            {
            }
            column(ReceiptedPettyCashAmount_Payments;Payments."Receipted Petty Cash Amount")
            {
            }
            column(ImprestMemoSurrenderNo_Payments;Payments."Imprest Memo Surrender No")
            {
            }
            column(DimensionSetID_Payments;Payments."Dimension Set ID")
            {
            }
            column(VATWthheldsix_Payments;Payments."VAT Wthheld six %")
            {
            }
            column(BankName_Payments;Payments."Bank Name")
            {
            }
            column(ProjectBudget_Payments;Payments."Project Budget")
            {
            }
            column(ActualProjectCosts_Payments;Payments."Actual Project Costs")
            {
            }
            column(POCommitments_Payments;Payments."PO Commitments")
            {
            }
            column(PRNCommitments_Payments;Payments."PRN Commitments")
            {
            }
            column(StoreRequisitionCommitments_Payments;Payments."Store Requisition Commitments")
            {
            }
            column(ImprestApplicationCommitment_Payments;Payments."Imprest Application Commitment")
            {
            }
            column(TotalBudgetCommitments_Payments;Payments."Total Budget Commitments")
            {
            }
            column(AvailableFunds_Payments;Payments."Available Funds")
            {
            }
            column(DepartmentName_Payments;Payments."Department Name")
            {
            }
            column(ProjectName_Payments;Payments."Project Name")
            {
            }
            column(UnitName_Payments;Payments."Unit  Name")
            {
            }
            column(DivisionName_Payments;Payments."Division Name")
            {
            }
            column(NotificationSent_Payments;Payments."Notification Sent")
            {
            }
            column(DateTimeSent_Payments;Payments."DateTime Sent")
            {
            }
            column(DestinationName_Payments;Payments."Destination Name")
            {
            }
            column(Reversed_Payments;Payments.Reversed)
            {
            }
            column(ImprestMemoNo_Payments;Payments."Imprest Memo No")
            {
            }
            column(CurrencyFactor_Payments;Payments."Currency Factor")
            {
            }
            column(JobGroup_Payments;Payments."Job Group")
            {
            }
            column(ResourcesTotalAmount_Payments;Payments."Resources Total Amount")
            {
            }
            column(ResourcesTotalWTax_Payments;Payments."Resources Total WTax")
            {
            }
            column(ResourcesTotalNet_Payments;Payments."Resources Total Net")
            {
            }
            column(NoofResources_Payments;Payments."No. of Resources")
            {
            }
            column(Carloan_Payments;Payments."Car loan")
            {
            }
            column(InterestAmount_Payments;Payments."Interest Amount")
            {
            }
            column(TotalLoanAmount_Payments;Payments."Total Loan Amount")
            {
            }
            column(PayingBankNo_Payments;Payments."Paying Bank No.")
            {
            }
            column(ImprestAmountLCY_Payments;Payments."Imprest Amount LCY")
            {
            }
            column(ActualAmountSpentLCY_Payments;Payments."Actual Amount Spent LCY")
            {
            }
            column(ResourcesTotalOtherCosts_Payments;Payments."Resources Total Other Costs")
            {
            }
            column(ImprestBankAccountNumber_Payments;Payments."Imprest Bank Account Number")
            {
            }
            column(ImprestBankName_Payments;Payments."Imprest Bank Name")
            {
            }
            column(ImprestBankBranchName_Payments;Payments."Imprest Bank Branch Name")
            {
            }
            column(VendorBank_Payments;Payments."Vendor Bank")
            {
            }
            column(VendorBankBranch_Payments;Payments."Vendor Bank Branch")
            {
            }
            column(VendorBankAccount_Payments;Payments."Vendor Bank Account")
            {
            }
            column(AdvanceRecovery_Payments;Payments."Advance Recovery")
            {
            }
            column(TotalNetPay_Payments;Payments."Total Net Pay")
            {
            }
            column(Test_Payments;Payments.Test)
            {
            }
            column(UsedClaim_Payments;Payments."Used Claim")
            {
            }
            column(AmountPaid_Payments;Payments."Amount Paid")
            {
            }
            column(PVRemainingAmount_Payments;Payments."PV Remaining Amount")
            {
            }
            column(PartPayment_Payments;Payments."Part Payment")
            {
            }
            column(UserIDFilter_Payments;Payments."User ID Filter")
            {
            }
            column(ReasonstoReopen_Payments;Payments."Reasons to Reopen")
            {
            }
            column(Paymentprocessed_Payments;Payments."Payment processed")
            {
            }
            column(ImprestCreated_Payments;Payments."Imprest Created")
            {
            }
            column(Imprest_Payments;Payments.Imprest)
            {
            }
            column(ConvertedBy_Payments;Payments."Converted By")
            {
            }
            column(Dateconverted_Payments;Payments."Date converted")
            {
            }
            column(Timeconverted_Payments;Payments."Time converted")
            {
            }
            column(VoteItem_Payments;Payments."Vote Item")
            {
            }
            column(VoteAmount_Payments;Payments."Vote Amount")
            {
            }
            column(Commitments_Payments;Payments.Commitments)
            {
            }
            column(ActualAmount_Payments;Payments."Actual Amount")
            {
            }
            column(AvailableAmount_Payments;Payments."Available Amount")
            {
            }
            column(ReferenceNo_Payments;Payments."Reference No.")
            {
            }
            column(Selected_Payments;Payments.Selected)
            {
            }
            column(Job_Payments;Payments.Job)
            {
            }
            column(JobName_Payments;Payments."Job Name")
            {
            }
            column(SendforPosting_Payments;Payments."Send for Posting")
            {
            }
            column(StandingImprestType_Payments;Payments."Standing Imprest Type")
            {
            }
            column(SalaryAdvance_Payments;Payments."Salary Advance")
            {
            }
            column(SalaryLastDrawn_Payments;Payments."Salary Last Drawn")
            {
            }
            column(DateofJoining_Payments;Payments."Date of Joining")
            {
            }
            column(Noofmonthsdeducted_Payments;Payments."No of months deducted")
            {
            }
            column(AmountPending_Payments;Payments."Amount Pending")
            {
            }
            column(RecoveryStartMonth_Payments;Payments."Recovery Start Month")
            {
            }
            column(MonthlyInstallment_Payments;Payments."Monthly Installment")
            {
            }
            column(Purpose_Payments;Payments.Purpose)
            {
            }
            column(Remarks_Payments;Payments.Remarks)
            {
            }
            column(Comments_Payments;Payments.Comments)
            {
            }
            column(AmountApproved_Payments;Payments."Amount Approved")
            {
            }
            column(EffectivefromMonth_Payments;Payments."Effective from Month")
            {
            }
            column(FloatReimbursement_Payments;Payments."Float Reimbursement")
            {
            }
            column(Destination_Payments;Payments.Destination)
            {
            }
            column(Finance_Payments;Payments.Finance)
            {
            }
            column(ImprestVoucherAmount_Payments;Payments."Imprest Voucher Amount")
            {
            }
            column(ReversedBy_Payments;Payments."Reversed By")
            {
            }
            column(ReversalDate_Payments;Payments."Reversal Date")
            {
            }
            column(PostingGroupCode_Payments;Payments."Posting Group Code")
            {
            }
            column(PostingGroup_Payments;Payments."Posting Group")
            {
            }
            column(ImprestVoucherAmountLCY_Payments;Payments."Imprest Voucher Amount(LCY)")
            {
            }
            column(DepartmentCode_Payments;Payments."Department Code")
            {
            }
            column(DirectorateCode_Payments;Payments."Directorate Code")
            {
            }
            column(Division_Payments;Payments.Division)
            {
            }
            column(HOD_Payments;Payments.HOD)
            {
            }
            column(Select_Payments;Payments.Select)
            {
            }
            column(ApplicationDate;ApplicationDate)
            {
            }
            column(banked_Payments;Payments.banked)
            {
            }

            trigger OnAfterGetRecord()
            begin

                Warrant.Reset;
                Warrant.SetRange("Payment Type",Warrant."Payment Type"::"Warrant Voucher");
                Warrant.SetRange("No.",Payments."Reference No.");
                if Warrant.FindFirst then begin
                  ImprestMemo.Reset;
                  ImprestMemo.SetRange("No.",Warrant."Imprest Memo No");
                  if ImprestMemo.FindFirst then begin
                      ApplicationDate:=ImprestMemo.Date;
                    PaymentNarration:=Warrant."Payment Narration";
                    PostingDate:=Warrant."Posted Date";
                  end

                end
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
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        ApplicationDate: Date;
        ImprestMemo: Record "Imprest Memo";
        Warrant: Record Payments;
        CI: Record "Company Information";
        PaymentNarration: Text;
        PostingDate: Date;
}

