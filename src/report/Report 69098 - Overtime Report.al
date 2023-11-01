report 69098 "Overtime Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Overtime Report.rdlc';

    dataset
    {
        dataitem("Overtime Header";"Overtime Header")
        {
            RequestFilterFields = "EMp No.","Application Code","Application Date";
            column(OvertimeNo;"Overtime Header"."Application Code")
            {
            }
            column(EmployeeNo;"Overtime Header"."EMp No.")
            {
            }
            column(EmployeeName;"Overtime Header".Name)
            {
            }
            column(DepartmentName;DeptName)
            {
            }
            column(DateApplied;"Overtime Header"."Application Date")
            {
            }
            column(HoursWorked;"Overtime Header"."Total Hours")
            {
            }
            column(Picture;CI.Picture)
            {
            }
            column(Amount;Amount)
            {
            }
            column(DimCode1_OvertimeHeader;"Overtime Header"."Dim Code 1")
            {
            }
            column(TotalHours_OvertimeHeader;"Overtime Header"."Total Hours")
            {
            }
            column(ApplicationDate_OvertimeHeader;"Overtime Header"."Application Date")
            {
            }
            column(OvertimeAmount_OvertimeHeader;"Overtime Header"."Overtime Amount")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Amount:=0;
                HREmp.Reset;
                if HREmp.Get("EMp No.") then
                DeptName:=HREmp."Department Name";

                HRSetup.Reset;
                if HRSetup.Get(HRSetup."Overtime Payroll Code") then
                PeriodTrans.Reset;
                PeriodTrans.SetRange(PeriodTrans."Employee No","EMp No.");
                PeriodTrans.SetRange(PeriodTrans.Code,HRSetup."Overtime Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Reference No","Application Code");
                if PeriodTrans.Find('-') then begin
                Amount:=PeriodTrans.Amount;
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
        CI.Reset;
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        DeptName: Text[50];
        CI: Record "Company Information";
        HREmp: Record Employee;
        HRSetup: Record "Human Resources Setup";
        PeriodTrans: Record "Assignment Matrix-X";
        Amount: Decimal;
}

