report 50118 "PR Employee Variance Report"
{
    // version FIN-24-AUG-18

    DefaultLayout = RDLC;
    RDLCLayout = './PR Employee Variance Report.rdlc';

    dataset
    {
        dataitem("Employee"; "Employee")
        {
            DataItemTableView = SORTING("No.")
                                ORDER(Ascending)
                                WHERE(Status = CONST(active));
            RequestFilterFields = "No.";
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CompInfo_Address; CompInfo.Address)
            {
            }
            column(CompInfo_Address2; CompInfo."Address 2")
            {
            }
            column(CompInfo_City; CompInfo.City)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_PhoneNo; CompInfo."Phone No.")
            {
            }
            column(No_HREmployees; "Employee"."No.")
            {
            }
            column(FirstName_HREmployees; "Employee"."First Name")
            {
            }
            column(MiddleName_HREmployees; "Employee"."Middle Name")
            {
            }
            column(LastName_HREmployees; "Employee"."Last Name")
            {
            }
            column(SelectedPeriod; CurrentPeriod)
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(VariantPeriod; VariantPeriod)
            {
            }
            column(CurrentAmount; CurrentAmount)
            {
            }
            column(VariantAmount; VariantAmount)
            {
            }
            column(DiffrenceAmount; DiffrenceAmount)
            {
            }
            column(TransactionName; TransactionName)
            {
            }
            column(TransactionCode; TransactionCode)
            {
            }

            trigger OnAfterGetRecord();
            begin


                PRTransCodes.RESET;
                IF CodeFilter <> '' THEN PRTransCodes.SETRANGE("Transaction Code", CodeFilter);
                IF PRTransCodes.FINDSET(FALSE, FALSE) THEN BEGIN
                    REPEAT
                        CLEAR(TransactionName);
                        CLEAR(TransactionCode);
                        CLEAR(DiffrenceAmount);
                        CLEAR(VariantAmount);
                        CLEAR(CurrentAmount);

                        //Get the transaction for the current period e.g. BPAY
                        fnSetrangePRPeriodTrans(CurrentPeriod);
                        PRPeriodTrans.SETRANGE("Transaction Code", PRTransCodes."Transaction Code");
                        IF PRPeriodTrans.FINDFIRST THEN CurrentAmount := PRPeriodTrans.Amount;

                        //Get the transaction for the variant period e.g. BPAY
                        fnSetrangePRPeriodTrans(VariantPeriod);
                        PRPeriodTrans.SETRANGE("Transaction Code", PRTransCodes."Transaction Code");
                        IF PRPeriodTrans.FINDFIRST THEN VariantAmount := PRPeriodTrans.Amount;

                        DiffrenceAmount := VariantAmount - CurrentAmount;

                        IF DiffrenceAmount = 0 THEN CurrReport.SKIP();

                        TransactionCode := PRTransCodes."Transaction Code";
                        TransactionName := PRTransCodes."Transaction Name";

                    //ERROR('I am %1',DiffrenceAmount);
                    UNTIL PRTransCodes.NEXT() = 0;
                END;
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
                group(Options)
                {
                    field(CurrentPeriod; CurrentPeriod)
                    {
                        Caption = 'Current Period';
                        TableRelation = "PR Payroll Periods"."Date Opened";
                    }
                    field(VariantPeriod; VariantPeriod)
                    {
                        Caption = 'Variant Period';
                        TableRelation = "PR Payroll Periods"."Date Opened";
                    }
                    field("**"; '')
                    {
                        Editable = false;
                    }
                    field(CodeFilter; CodeFilter)
                    {
                        Caption = 'Transaction Code Filter';
                        TableRelation = "PR Transaction Codes"."Transaction Code";
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
        CompInfo.RESET;
        CompInfo.GET;

        CompInfo.CALCFIELDS(Picture);

        IF CurrentPeriod = 0D THEN ERROR('Please select payroll period');
        IF VariantPeriod = 0D THEN ERROR('Please select variant payroll period');
        PRPayrollPeriods.RESET;
        PRPayrollPeriods.SETRANGE("Date Opened", CurrentPeriod);
        IF PRPayrollPeriods.FINDFIRST THEN PeriodName := PRPayrollPeriods."Period Name";
    end;

    var
        CompInfo: Record "Company Information";
        TXT_DEFAULT_REPORT_TITLE: Label 'Default Report Title';
        TXT_DEFAULT_APPLIED_FILTERS: Label 'Default Applied Filters';
        TXT_APPLIED_FILTERS: Label '"Applied Filters - "';
        TXT_SP_OP: Label '"( "';
        TXT_SP_CL: Label '" )"';
        PRPayrollPeriods: Record "PR Payroll Periods";
        CurrentPeriod: Date;
        PRPeriodTrans: Record "PR Period Transactions";
        PeriodName: Text;
        VariantPeriod: Date;
        PRTransCodes: Record "PR Transaction Codes";
        TransCode: Text;
        TransName: Text;
        CurrentAmount: Decimal;
        VariantAmount: Decimal;
        TransactionName: Text;
        DiffrenceAmount: Decimal;
        TransactionCode: Code[10];
        CodeFilter: Code[10];

    local procedure fnSetrangePRPeriodTrans(PARAM_PeriodFilter: Date);
    begin
        PRPeriodTrans.RESET;
        PRPeriodTrans.SETRANGE("Payroll Period", PARAM_PeriodFilter);
        PRPeriodTrans.SETRANGE("Employee Code", "Employee"."No.");
    end;
}

