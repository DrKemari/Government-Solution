report 69043 "Dir-Master Roll Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Dir-Master Roll Report.rdlc';

    dataset
    {
        dataitem(Employee;Vendor)
        {
            DataItemTableView = SORTING("No.") WHERE("Vendor Type"=FILTER(Director));
            RequestFilterFields = "Pay Period Filter";
            column(No_Employee;Employee."No.")
            {
            }
            column(Name_Employee;Employee.Name)
            {
            }
            column(TotalAllowances_Employee;Employee."Total Allowances")
            {
            }
            column(TotalDeductions_Employee;Employee."Total Deductions")
            {
            }
            column(CummPAYE_Employee;Employee."Cumm. PAYE")
            {
            }
            column(TotalNet;TotalNetN)
            {
            }
            column(Totallowances;TotalAllowancesN)
            {
            }
            column(TotalPAYE;TotalPayeN)
            {
            }
            column(NonCashBenefit_Employee;Employee."Non Cash Benefit")
            {
            }
            dataitem("Director Ledger Entry";"Director Ledger Entry")
            {
                DataItemLink = "Director No"=FIELD("No.");
                column(DirectorNo_DirectorLedgerEntry;"Director Ledger Entry"."Director No")
                {
                }
                column(Type_DirectorLedgerEntry;"Director Ledger Entry".Type)
                {
                }
                column(Code_DirectorLedgerEntry;"Director Ledger Entry".Code)
                {
                }
                column(PayrollPeriod_DirectorLedgerEntry;"Director Ledger Entry"."Payroll Period")
                {
                }
                column(Amount_DirectorLedgerEntry;"Director Ledger Entry".Amount)
                {
                }
                column(Paye_DirectorLedgerEntry;"Director Ledger Entry".Paye)
                {
                }
                dataitem("Director Deductions";"Director Deductions")
                {
                    DataItemLink = Code=FIELD(Code);
                    column(Code_DirectorDeductions;"Director Deductions".Code)
                    {
                    }
                    column(Description_DirectorDeductions;"Director Deductions".Description)
                    {
                    }
                    column(PAYECode_DirectorDeductions;"Director Deductions"."PAYE Code")
                    {
                    }
                }
                dataitem("Directors Earnings";"Directors Earnings")
                {
                    DataItemLink = Code=FIELD(Code);
                    column(Code_DirectorsEarnings;"Directors Earnings".Code)
                    {
                    }
                    column(Description_DirectorsEarnings;"Directors Earnings".Description)
                    {
                    }
                }

                trigger OnPreDataItem()
                begin
                    "Director Ledger Entry".SetRange("Director Ledger Entry"."Payroll Period",DateSpecified);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Employee.CalcFields("Total Allowances","Total Deductions","Cumm. PAYE","Non Cash Benefit");
                if Employee."Cumm. PAYE"=0 then
                  CurrReport.Skip;

                TotalAllowances1:=Employee."Total Allowances"+Employee."Total Deductions"+Employee."Non Cash Benefit";
                TotalNet:=TotalNet+TotalAllowances1;

                Totallowances:=Totallowances+Employee."Total Allowances";


                TotalPAYE:=TotalPAYE+Employee."Cumm. PAYE";

                //TotalPayeN:=TotalPayeN+TotalPAYE;
                TotalPayeN:=TotalPAYE;
                TotalNetN:=TotalNet;
                TotalAllowancesN:=Totallowances;
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

    trigger OnInitReport()
    begin
        TotalPAYE:=0;
         Totallowances:=0;
         TotalAllowances1:=0;
         TotalNet:=0;
    end;

    trigger OnPostReport()
    begin
        //MESSAGE('%1--%2--%3',TotalPayeN,TotalDeductionsN,TotalNetN);
    end;

    trigger OnPreReport()
    begin
         DateSpecified:=Employee.GetRangeMin(Employee."Pay Period Filter");
         CoRec.Get;
         CoRec.CalcFields(Picture);

    end;

    var
        Allowances: array [20] of Decimal;
        Deductions: array [20] of Decimal;
        EarnRec: Record "Directors Earnings";
        DedRec: Record "Director Deductions";
        Earncode: array [100] of Code[40];
        deductcode: array [100] of Code[40];
        EarnDesc: array [100] of Text[100];
        DedDesc: array [100] of Text[100];
        i: Integer;
        j: Integer;
        Assignmat: Record "Director Ledger Entry";
        DateSpecified: Date;
        Totallowances: Decimal;
        TotalAllowances: Decimal;
        OtherEarn: Decimal;
        OtherDeduct: Decimal;
        counter: Integer;
        HRSetup: Record "Human Resources Setup";
        NetPay: Decimal;
        Payroll: Codeunit Payroll3;
        CoRec: Record "Company Information";
        MASTER_ROLLCaptionLbl: Label 'MASTER ROLL';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Other_AllowancesCaptionLbl: Label 'Other Allowances';
        TotalPAYE: Decimal;
        TotalNet: Decimal;
        TotalPayeN: Decimal;
        TotalAllowancesN: Decimal;
        TotalNetN: Decimal;
        TotalAllowances1: Decimal;
}

