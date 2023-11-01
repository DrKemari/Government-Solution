report 69013 "Networkforce Trends"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Networkforce Trends.rdlc';

    dataset
    {
        dataitem("Payroll PeriodX";"Payroll PeriodX")
        {
            DataItemTableView = WHERE("New Fiscal Year"=FILTER(true));
            column(StartingDate_PayrollPeriodX;"Starting Date")
            {
            }
            column(FinancialYear_PayrollPeriodX;"Financial Year")
            {
            }
            column(No_Employee;TotalNo)
            {
            }
            column(COMPANYNAME;CompanyName)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            column(USERID;UserId)
            {
            }
            column(TIME;Time)
            {
            }
            column(CoRec_Picture;CoRec.Picture)
            {
            }
            column(Recruitment;Recruitment)
            {
            }
            column(Exits;Exits)
            {
            }
            column(Turnover;Turnover)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TotalNo:=0;
                Employee.Reset;
                Employee.SetFilter("Employment Date",'..%1',"Payroll PeriodX"."Job Book End Date");
                Employee.SetRange(Status,Employee.Status::Active);
                if Employee.FindSet then begin
                  repeat
                  TotalNo:=TotalNo+1;
                  until Employee.Next=0;
                 end;
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
        CoRec.CalcFields(Picture);
    end;

    var
        CoRec: Record "Company Information";
        TotalNo: Integer;
        Employee: Record Employee;
        Exits: Integer;
        Recruitment: Integer;
        Turnover: Decimal;
}

