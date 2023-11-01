Page 51289 "PR Transaction Code Card"
{
    PageType = Card;
    SourceTable = "PR Transaction Codes";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = All;
                }
                field(TransactionCode; "Transaction Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field(TransactionName; "Transaction Name")
                {
                    ApplicationArea = All;
                }

                field(Frequency; "Frequency")
                {
                    ApplicationArea = All;
                }

                field(BalanceType; "Balance Type")
                {
                    ApplicationArea = All;
                    ValuesAllowed = None, Increasing, Reducing;
                }
                field(Taxable; Taxable)
                {
                    ApplicationArea = All;
                }
                field("Exempt Housing Levy"; "Exempt Housing Levy")
                {
                    ApplicationArea = All;
                }

                field(DisableProration; "Disable Proration")
                {
                    ApplicationArea = All;
                }

                field("Skip Transfer in Next Period"; "Skip Transfer in Next Period")
                {
                    ApplicationArea = all;
                }
                field("Transaction Charge Code"; "Transaction Charge Code")
                {
                    ApplicationArea = all;
                }
                field(IsFormula; "Is Formula")
                {
                    ApplicationArea = All;
                }
                field(Formula; Formula)
                {
                    ApplicationArea = All;
                }
                field("Formula %"; "Formula %")
                {
                    ApplicationArea = All;
                }

                field("Is Formula for employer"; "Is Formula for employer")
                {
                    ApplicationArea = all;
                }

                field(GLAccount; "GL Account")
                {
                    ApplicationArea = All;
                }
                field(GLAccountName; "G/L Account Name")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field(Subledger; Subledger)
                {
                    ApplicationArea = All;
                }
                field(CustomerPostingGroup; CustomerPostingGroup)
                {
                    ApplicationArea = All;
                }
                field("Imprest Surrender"; "Imprest Surrender")
                {
                    ApplicationArea = All;
                }
                field("Is Leave Allowance"; "Is Leave Allowance")
                {
                    ApplicationArea = All;
                }
                field(isHouseAllowance; isHouseAllowance)
                {
                    caption = 'Is House Allowance';
                    ApplicationArea = All;
                }
            }
            group(OtherSetUps)
            {
                Caption = 'Other Set-Ups';
                field(SpecialTransDeductions; "Special Trans Deductions")
                {
                    ApplicationArea = All;
                }
                field(SpecialTransIncomes; "Special Trans Incomes")
                {
                    ApplicationArea = All;
                }
                field(RepaymentMethod; "Repayment Method")
                {
                    ApplicationArea = All;
                }
                field(coopparameters; "coop parameters")
                {
                    ApplicationArea = All;
                }

                field("Deduct Premium"; "Deduct Premium")
                {

                }

                field("Intrest Transaction Code"; "Intrest Transaction Code")
                {

                }

                field("Interest Rate"; "Interest Rate")
                {

                }
            }
            group(Grouping)
            {
                Caption = 'Grouping';
                field(GroupCode; "Group Code")
                {
                    ApplicationArea = All;
                    TableRelation = "PR Transaction Codes";
                }
                field(GroupDescription; "Group Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Assign Formulae Per Directorate")
            {
                ApplicationArea = All;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "PR Transaction Formula List";
                RunPageLink = "Transaction Code" = field("Transaction Code");
            }
        }
    }

    trigger OnOpenPage()
    begin
        UpdateControl_SpecialTrans
    end;

    var
        Text19025872: label 'E.g ([005]+[020]*[24])/2268';
        Text19080001: label 'E.g ([005]+[020]*[24])/2268';
        IsFormulaPerDirecEDITABLE: Boolean;

    local procedure UpdateControl_SpecialTrans()
    begin
        if "Is Formula Per Directorate" then begin
            IsFormulaPerDirecEDITABLE := false;

            "Is Formula" := false;
            "Employer Deduction" := false;
            "Include Employer Deduction" := false;
            "Is Formula for employer" := '';
            Formula := '';
        end else begin
            IsFormulaPerDirecEDITABLE := true;
        end;
    end;
}

