report 50179 "PR Employee Payslip"
{
    DefaultLayout = RDLC;

    dataset
    {

        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            RequestFilterFields = "Employee Code", "Payroll Period";
            column(TCode; "Transaction Code")
            {
            }

            column(CompanyInfoName; CompanyInfo.Name)
            {

            }

            column(CompanyInfoAddress; CompanyInfo.Address)
            {

            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {

            }

            column(PayrollPeriod; "Payroll Period")
            {

            }

            column(PeriodName; PeriodName)
            {

            }
            column(TName; "Transaction Name")
            {
            }
            column(Grouping; "Group Order")
            {
            }
            column(Group_Text; "Group Text")
            {
            }
            column(TBalances; Balance)
            {
            }
            column(Amount; Amount)
            {
            }

            column(PayrollNo; PayrollNo)
            {

            }

            column(IDNumber; IDNumber)
            {

            }

            column(JobDesignation; JobDesignation)
            {

            }

            column(BankName; BankName)
            {

            }

            column(BranchName; BranchName)
            {

            }

            column(AccountNumber; AccountNumber)
            {

            }

            column(KRAANumber; KRAANumber)
            {

            }
            column(NSSFNumber; NSSFNumber)
            {

            }

            column(NHIFNumber; NHIFNumber) { }


            column(StaffName; StaffName)
            {

            }

            column(VarTotalDeductions; VarTotalDeductions)
            {

            }
            column(ContractType; ContractType)
            {

            }
            column(RitirementDate; RitirementDate)
            {

            }
            // dataitem("PR Employee Transactions"; "PR Employee Transactions")
            // {
            //     DataItemLink = "Employee Code" = field("Employee Code");
            //     DataItemTableView = where(Balance = filter(> 0));
            //     column(Transaction_Name; "Transaction Name")
            //     {

            //     }
            //     column(Balance; Balance)
            //     {

            //     }
            // }
            trigger OnPreDataItem()
            begin
                ComputationDone := false;
            end;

            trigger OnAfterGetRecord();
            var
                PRPeriodTrans2: Record "PR Period Transactions";
            begin
                if ComputationDone = false then begin
                    PRPeriodTrans2.Reset();
                    PRPeriodTrans2.SetRange("Employee Code", "PR Period Transactions"."Employee Code");
                    PRPeriodTrans2.SetRange("Payroll Period", "PR Period Transactions"."Payroll Period");
                    PRPeriodTrans2.SetRange("Group Order", 7);
                    if PRPeriodTrans2.FindSet(false, false) then begin
                        repeat
                            VarTotalDeductions += PRPeriodTrans2.Amount;
                        until PRPeriodTrans2.Next() = 0;
                        //Message('Finally we are %1', VarTotalDeductions);
                    end;
                    PRPeriodTrans2.Reset();
                    PRPeriodTrans2.SetRange("Employee Code", "PR Period Transactions"."Employee Code");
                    PRPeriodTrans2.SetRange("Payroll Period", "PR Period Transactions"."Payroll Period");
                    PRPeriodTrans2.SetRange("Group Text", 'DEDUCTIONS');
                    PRPeriodTrans2.SetFilter("Transaction Code", '<>%1', 'TOT-DED');
                    if PRPeriodTrans2.FindSet(false, false) then begin
                        repeat
                            VarTotalDeductions += PRPeriodTrans2.Amount;
                        until PRPeriodTrans2.Next() = 0;
                        //Message('Finally we are %1', VarTotalDeductions);
                    end;
                    ComputationDone := true;
                end;
                PRPayrollPeriod.Reset();
                PRPayrollPeriod.get("PR Period Transactions"."Payroll Period");
                PeriodName := PRPayrollPeriod."Period Name";

                HREmp.get("PR Period Transactions"."Employee Code");
                begin
                    PayrollNo := HREmp."No.";
                    IDNumber := HREmp."ID Number";
                    StaffName := HREmp."Full Name";
                    JobDesignation := HREmp."Job Title";
                    BankName := HREmp."Bank Name";
                    BranchName := HREmp."Bank Branch Name";
                    AccountNumber := HREmp."Bank Account Number";
                    KRAANumber := HREmp."P.I.N";
                    NSSFNumber := HREmp."NSSF No.";
                    NHIFNumber := HREmp."NHIF No.";
                    ContractType := HREmp."Contract Type";

                    RitirementDate := HREmp."Retirement date";
                end;

            end;
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
    end;

    var

        ComputationDone: Boolean;
        NSSFNumber: Text;

        NHIFNumber: Text;
        CompanyInfo: Record "Company Information";
        PeriodName: Text;

        PRPayrollPeriod: Record "PR Payroll Periods";

        HREmp: Record "Employee";

        PayrollNo: Text;

        IDNumber: Text;

        JobDesignation: text;

        BankName: Text;

        BranchName: Text;
        ContractType: Text;
        Designation: Text;
        RitirementDate: date;

        VarTotalDeductions: Decimal;

        AccountNumber: text;

        KRAANumber: Text;

        StaffName: text;

}






