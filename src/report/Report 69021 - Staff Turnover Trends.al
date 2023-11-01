report 69021 "Staff Turnover Trends"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Staff Turnover Trends.rdlc';

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
                 //calculate the exits
                 Exits:=0;
                Employee.Reset;
                Employee.SetFilter("Inactive Date",'%1..%2',"Payroll PeriodX"."Job Book Start Date","Payroll PeriodX"."Job Book End Date");
                Employee.SetFilter(Status,'<>%1',Employee.Status::Active);
                if Employee.FindSet then begin
                  repeat
                    Exits:=Exits+1;
                   until Employee.Next=0;
                 end;

                //calculate the recruitments
                Recruitment:=0;
                Employee.Reset;
                Employee.SetFilter("Employment Date",'%1..%2',"Payroll PeriodX"."Job Book Start Date","Payroll PeriodX"."Job Book End Date");
                Employee.SetRange(Status,Employee.Status::Active);
                if Employee.FindSet then begin
                  repeat
                    Recruitment:=Recruitment+1;
                   until Employee.Next=0;
                 end;

                Turnover:=0;
                if Exits=0 then
                  Turnover:=100
                else
                Turnover:=(Exits/TotalNo)*100;
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

