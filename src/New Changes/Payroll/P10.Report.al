report 50321 "P10A."
{
    // version DSL 2020

    DefaultLayout = RDLC;
    RDLCLayout = './P10A..rdlc';

    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            //  DataItemTableView = SORTING(No. Overtime Day(s) Worked);
            RequestFilterFields = "Period Filter", "Employee Code";
            column(EmployeeCode_PRSalaryCard; "PR Salary Card"."Employee Code")
            {
            }
            column(Tot_TaxablePay; TotTaxablePay)
            {
            }
            column(Tot_PAYE; Tot_PAYE)
            {
            }
            column(SelectedYear; SelectedYear)
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfoVATRegistratioNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(EmployerPIN; EmployerPIN)
            {
            }
            column(PayeAmount; PayeAmount)
            {
            }
            column(TaxablePay; TaxablePay)
            {
            }
            column(EmployeeName; EmployeeName)
            {
            }
            column(PinNumber; PinNumber)
            {
            }

            trigger OnAfterGetRecord();
            begin

                CLEAR(objEmp);
                objEmp.SETRANGE(objEmp."No.", "Employee Code");
                IF objEmp.FIND('-') THEN BEGIN
                    EmployeeName := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
                    PinNumber := objEmp."P.I.N";
                END;

                PeriodTrans.RESET;
                PeriodTrans.SETRANGE(PeriodTrans."Employee Code", "Employee Code");
                PeriodTrans.SETFILTER(PeriodTrans."Period Year", FORMAT(SelectedYear));

                TaxablePay := 0;
                PayeAmount := 0;
                IF PeriodTrans.FIND('-') THEN
                    REPEAT
                        //***************************TXBP Taxable Pay****************** -  BY DENNIS
                        IF (PeriodTrans."Transaction Code" = 'TXBP') THEN BEGIN
                            TaxablePay := TaxablePay + PeriodTrans.Amount;
                        END;

                        //***************************GrpOrder 7, SubGrpOrder 3 = PAYE ****************
                        IF PeriodTrans."Transaction Code" = 'PAYE' THEN BEGIN
                            PayeAmount := PayeAmount + PeriodTrans.Amount;
                        END;
                    UNTIL PeriodTrans.NEXT = 0;

                IF PayeAmount <= 0 THEN CurrReport.SKIP;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Period)
                {
                    field(Year; SelectedYear)
                    {
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin

        IF SelectedYear = 0 THEN ERROR(Text001);

        CompanyInfo.RESET;
        IF CompanyInfo.GET THEN BEGIN
            CompanyInfo.TESTFIELD(CompanyInfo.Name);
            // CompanyInfo.TESTFIELD(CompanyInfo."PIN No");
            CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
        END;


        /* HRPRAccess.RESET;
        HRPRAccess.SETRANGE("User ID",USERID);
        HRPRAccess.SETRANGE(HRPRAccess.Authorized,true);
        IF HRPRAccess.FIND('-') THEN
        BEGIN
            IF NOT HRPRAccess."View Employee Card" THEN
                ERROR('%1 You have not been setup to access this Report',USERID );
        END ELSE
        BEGIN
            ERROR('%1 You have not been setup to access this Report',USERID );
        END; */
    end;

    var
        SelectedYear: Integer;
        CompanyInfo: Record "Company Information";
        PeriodTrans: Record "PR Period Transactions";
        Text001: Label 'Please enter Period Year';
        TaxablePay: Decimal;
        Tot_PAYE: Decimal;
        PRPeriodTrans_1: Record "PR Period Transactions";
        PRPeriodTrans_2: Record "PR Period Transactions";
        PRPayrollPeriod: Record "PR Payroll Periods";
        objEmp: Record "Employee";
        EmployeeName: Text[30];
        PinNumber: Text[30];
        EmployerPIN: Text[50];
        EmployerName: Text[100];
        PeriodFilter: Text[30];
        PayeAmount: Decimal;
        TotPayeAmount: Decimal;
        TotTaxablePay: Decimal;
        HRCodeunit: Codeunit "HR Codeunit";
        HRPRAccess: Record "PR Payroll Access Rights";
}

