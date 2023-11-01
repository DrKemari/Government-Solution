Report 51000 "PR Non Pensionable"
{
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Employee"; "Employee")
        {
            RequestFilterFields = "No.", "Contract Type";

            column(No_; "No.")
            {

            }

            column(Full_Name; "FullName")
            {

            }

            column(Branch_Bank; "Bank Branch")
            {

            }


            column(Main_Bank; "Bank Name")
            {

            }
            column(Bank_Account_Number; "Bank Account Number")
            {

            }
            column(CompInfoName; CompInfo.Name)
            {

            }
            column(CompInfoAddress; CompInfo.Address)
            {
            }
            column(CompInfoCity; CompInfo.City)
            {
            }
            column(CompInfoPicture; CompInfo.Picture)
            {
            }
            column(CompInfoEMail; CompInfo."E-Mail")
            {
            }
            column(CompInfoHomePage; CompInfo."Home Page")
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            trigger OnAfterGetRecord()
            begin
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange("Employee Code", "Employee"."No.");
                PRPeriodTrans.SetRange("Payroll Period", PeriodFilter);
                if not PRPeriodTrans.FindFirst() then begin
                    CurrReport.Skip();
                end;
            end;
        }
    }
    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PeriodFilter; PeriodFilter)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Period Filter';
                        TableRelation = "PR Payroll Periods";
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


    trigger OnPreReport()
    begin
        fnCompanyInfo;
    end;

    var
        PRPeriodTrans: Record "PR Period Transactions";
        PeriodFilter: Date;
        CompInfo: Record "Company Information";
        PeriodName: Text[30];
        PRPayrollPeriods: Record "PR Payroll Periods";

    procedure fnCompanyInfo()
    begin
        CompInfo.Reset;
        if CompInfo.Get then
            CompInfo.CalcFields(CompInfo.Picture);
    end;
}
