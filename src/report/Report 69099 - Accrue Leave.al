report 69099 "Accrue Leave"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Accrue Leave.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending) WHERE(Status=CONST(Active));
            RequestFilterFields = "No.";
            column(No_Employee;Employee."No.")
            {
            }
            column(FirstName_Employee;Employee."First Name")
            {
            }
            column(MiddleName_Employee;Employee."Middle Name")
            {
            }
            column(LastName_Employee;Employee."Last Name")
            {
            }

            trigger OnAfterGetRecord()
            begin
                
                
                PayrollPeriod.Get(StartDate);
                StartDate2:=CalcDate('CD+1M',PayrollPeriod."Starting Date");
                //MESSAGE('%1',StartDate2);
                EndDate:=CalcDate('CD-1D',StartDate2);
                //MESSAGE('%1',EndDate);
                
                //IF Employee."Employment Date"<>0D THEN BEGIN
                
                //YearsOfService:=(EndDate-Employee."Employment Date")/365;
                //MESSAGE('%1',YearsOfService);
                YR:=Date2DMY(PayrollPeriod."Starting Date",3);
                //if
                HRSETUP.Get;
                //Emp.RESET;
                //Emp.SETRANGE(Emp.Status,Emp.Status::Active);
                //Emp.SETRANGE(Emp.Rank,Emp.Rank::ADMIN);
                //IF Emp.FIND('-') THEN BEGIN
                //REPEAT
                EmpLeave.Init;
                EmpLeave."Employee No":=Employee."No.";
                EmpLeave.Validate("Employee No");
                EmpLeave."Leave Code":='ANNUAL';
                EmpLeave."Posting  Date":=EndDate;
                /*
                IF YearsOfService<10 THEN
                EmpLeave."No. Of Days":=HRSETUP."HR E-mail Address"/12;
                IF ((YearsOfService>=10) AND (YearsOfService<15)) THEN
                EmpLeave."No. Of Days":=HRSETUP."Annual Leave Days 10Y To 14Y"/12;
                IF YearsOfService>=15 THEN
                */
                
                EmpLeave."No. Of Days":=HRSETUP."Annual Leave Days"/12;
                
                
                
                EmpLeave.Description:='Accrued leave '+PayrollPeriod.Name+' '+Format(YR);
                EmpLeave."Adjustment Type":=EmpLeave."Adjustment Type"::"Positive Adjustment";
                EmpLeave.Insert;
                //UNTIL Emp.NEXT=0;
                //END;
                
                
                //END;

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
                    field("Month Start Date";StartDate)
                    {
                        Caption = 'Month Start Date';
                        TableRelation = "Payroll PeriodX"."Starting Date";
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

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        EndDate: Date;
        StartDate2: Date;
        Emp: Record Employee;
        EmpLeave: Record "Employee Leaves";
        HRSETUP: Record "Human Resources Setup";
        StartDate: Date;
        PayrollPeriod: Record "Payroll PeriodX";
        YearsOfService: Decimal;
        YR: Integer;
}

