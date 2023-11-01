report 50027 "PR NSSF Report"
{
    // version FIN-24-AUG-18

    DefaultLayout = RDLC;
    RDLCLayout = './PR NSSF Report.rdlc';

    dataset
    {
        dataitem("Employee"; "Employee")
        {
            RequestFilterFields = "No.", Status;
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
            column(PeriodName; PeriodName)
            {
            }
            column(PAYENumber_HREmployees; "Employee"."P.I.N")
            {
            }
            column(DateOfBirth_HREmployees; "Employee"."Date Of Birth")
            {
            }
            column(NHIFNo_HREmployees; "Employee"."NHIF No.")
            {
            }
            column(IDNumber_HREmployees; "Employee"."ID Number")
            {
            }
            column(NSSFNo_HREmployees; "Employee"."NSSF No.")
            {
            }
            column(StdAmount; StdAmount)
            {
            }
            column(YearBirth; YearBirth)
            {
            }
            column(GPAY; GPAY)
            {
            }
            column(VolAmount; VolAmount)
            {
            }
            column(TotalEmployees; TotalEmployees)
            {
            }

            trigger OnAfterGetRecord();
            begin

                StdAmount := 0;
                VolAmount := 0;
                GPAY := 0;

                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "Employee"."No.");
                PRPeriodTrans.SETRANGE("Transaction Code", 'NSSF');
                IF PRPeriodTrans.FINDFIRST() THEN BEGIN
                    StdAmount := PRPeriodTrans.Amount;
                END;

                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "Employee"."No.");
                PRPeriodTrans.SETRANGE("Transaction Code", 'GPAY');
                IF PRPeriodTrans.FINDFIRST() THEN BEGIN
                    GPAY := PRPeriodTrans.Amount;
                    TotalEmployees += 1;
                END;

                //Voluntary Amount
                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "Employee"."No.");
                PRPeriodTrans.Setfilter(PRPeriodTrans."Coop Parameter Lk", '%1', PRPeriodTrans."Coop Parameter Lk"::"Voluntary NSSF");
                if PRPeriodTrans.FindFirst() then begin
                    VolAmount := PRPeriodTrans.Amount;
                end;



                if GPAY = 0 then CurrReport.Skip();
            end;

            trigger OnPreDataItem();
            begin
                TotalEmployees := 0;
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
                group("Filter Options")
                {
                    field(SelectedPeriod; SelectedPeriod)
                    {
                        Caption = 'Selected Period';
                        TableRelation = "PR Payroll Periods"."Date Opened";
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

        IF SelectedPeriod = 0D THEN ERROR('Please select payroll period');

        PRPayrollPeriods.RESET;
        PRPayrollPeriods.SETRANGE("Date Opened", SelectedPeriod);
        IF PRPayrollPeriods.FINDFIRST() THEN PeriodName := UPPERCASE(PRPayrollPeriods."Period Name");
    end;

    var
        CompInfo: Record "Company Information";
        SelectedPeriod: Date;
        PRPayrollPeriods: Record "PR Payroll Periods";
        PRPeriodTrans: Record "PR Period Transactions";
        PeriodName: Text;
        StdAmount: Decimal;
        YearBirth: Text;
        GPAY: Decimal;
        VolAmount: Decimal;
        TotalEmployees: Decimal;
}

