Page 51287 "PR Rates & Ceilings"
{
    PageType = Card;
    SourceTable = "PR Vital Setup Info";

    layout
    {
        area(content)
        {
            group(TaxRelief)
            {
                Caption = 'Tax Relief';
                field(SetupCode; "Setup Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Control20; "Tax Relief")
                {
                    ApplicationArea = Basic;
                }
                field(InsuranceRelief; "Insurance Relief")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumReliefAmount; "Minimum Relief Amount")
                {
                    ApplicationArea = Basic;
                }
                field(MaxRelief; "Max Relief")
                {
                    ApplicationArea = Basic;
                }
                field(DisbledTaxLimit; "Disbled Tax Limit")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumTaxablePay; "Minimum Taxable Pay")
                {
                    ApplicationArea = Basic;
                }
            }
            group(NSSFContribution)
            {
                Caption = 'NSSF Contribution';
                field(NSSFEmployee; "NSSF Employee")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFEmployerFactor; "NSSF Employer Factor")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFBasedon; "NSSF Based on")
                {
                    ApplicationArea = Basic;
                }
                field(ImplementNewNSSF; "Implement New NSSF")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFRate; "NSSF Rate")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFLowerEarningLimit; "NSSF Lower Earning Limit(LEL)")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFUpperEarningLimit; "NSSF Upper Earning Limit(UEL)")
                {
                    ApplicationArea = Basic;
                }

            }
            group(NHIF)
            {
                Caption = 'NHIF';
                field(Selectone; "NHIF Based on")
                {
                    ApplicationArea = Basic;
                    //  Caption = 'Select one:';
                }

                field("Implement NHIF Relief"; "Implement NHIF Relief")
                {
                    ApplicationArea = Basic;
                }

                field("NHIF NHIF Relief Percentage"; "NHIF Relief Percentage")
                {

                    ApplicationArea = basic;

                }
                field("Enable Relief On PAYE Only"; "Enable Relief On PAYE Only")
                {
                    ApplicationArea = basic;

                }
            }
            group(Housing)
            {
                Caption = 'Housing Levy';
                field("Implement Housing Levy"; "Implement Housing Levy")
                {
                    ApplicationArea = basic;
                }
                field("Employee Housing Levy %"; "Employee Housing Levy")
                {

                    ApplicationArea = basic;
                }
                field("Employer Housing Levy %"; "Employer Housing Levy")
                {
                    ApplicationArea = basic;
                }

            }
            group(Pension)
            {
                Caption = 'Pension';
                field(MaxPensionContribution; "Max Pension Contribution")
                {
                    ApplicationArea = Basic;
                }
                field(TaxOnExcessPension; "Tax On Excess Pension")
                {
                    ApplicationArea = Basic;
                }
                field("PrPension Employer Code"; "PrPension Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field("PrPension Employee Code"; "PrPension Employee Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Mortgage)
            {
                Caption = 'Mortgage';
                field(MortgageReliefLessfromTaxablePay; "Mortgage Relief")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mortgage Relief (Less from Taxable Pay)';
                }
                field(MortgageReliefPercentage; "Mortgage Relief Percentage")
                {
                    ApplicationArea = Basic;
                }
            }
            group(OwnerOccupierInterest)
            {
                Caption = 'Owner Occupier Interest';
                field(MaxMonthlyContribution; "OOI Deduction")
                {
                    ApplicationArea = Basic;
                    Caption = 'Max Monthly Contribution';
                }
                field(Decemberdeduction; "OOI December")
                {
                    ApplicationArea = Basic;
                    Caption = 'December deduction';
                }
            }
            group(StaffLoans)
            {
                Caption = 'Staff Loans';
                field(LoanMarketRate; "Loan Market Rate")
                {
                    ApplicationArea = Basic;
                }
                field(LoanCorporateRate; "Loan Corporate Rate")
                {
                    ApplicationArea = Basic;
                }
            }
            group(PayslipMessage)
            {
                Caption = 'Payslip Message';
                field(Control27; "Payslip Message")
                {
                    ApplicationArea = Basic;
                }
                field(PWDStaffRetirementAge; "PWD Staff Retirement Age")
                {
                    ApplicationArea = Basic;
                }
                field(OtherStaffRetirementAge; "Other Staff Retirement Age")
                {
                    ApplicationArea = Basic;
                }
            }

            group(PayrollProration)
            {
                Caption = 'Payroll Proration';
                field("Enable Payroll Proration"; "Enable Payroll Proration")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
