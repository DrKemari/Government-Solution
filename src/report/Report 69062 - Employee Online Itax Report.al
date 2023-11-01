report 69062 "Employee Online Itax Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Employee Online Itax Report.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = WHERE("Pays tax?"=FILTER(true));
            RequestFilterFields = "Pay Period Filter","Posting Group";
            column(PIN;Employee."P.I.N")
            {
            }
            column(Names;Names)
            {
            }
            column(Resident;Resident)
            {
            }
            column(TypeofEmployee;TypeofEmployee)
            {
            }
            column(Basic;Employee.Basic)
            {
            }
            column(HouseAllowance1;"House Allowance1")
            {
            }
            column(TransportAllowance;Employee."Transport Allowance")
            {
            }
            column(Leavepay;Employee."Leave Allowance")
            {
            }
            column(OvertimeAllowance;Employee."Overtime Allowance")
            {
            }
            column(DirectorsFees;Employee."Directors Fees")
            {
            }
            column(LumpSum;Employee."Lump Sum")
            {
            }
            column(OtherAllowance;Employee."Total Allowances")
            {
            }
            column(CarBenefit;CarBenefit)
            {
            }
            column(NonCashBenefit;Employee."SSF Employer to Date"+Employee."Gross Cash")
            {
            }
            column(NonCashBenefit_Employee;Employee."Non Cash Benefit")
            {
            }
            column(TypeofHousing;TypeofHousing)
            {
            }
            column(ActualContribution;ActualContribution)
            {
            }
            column(MortageInterest;MortageInterest)
            {
            }
            column(HomeOwnership;HomeOwnership)
            {
            }
            column(MPR;PersonalRelief)
            {
            }
            column(InsuranceRelief;InsuranceRelief)
            {
            }
            column(PAYE;(Employee."Cumm. PAYE")*-1)
            {
            }
            column(CompanyInfoName;CompanyInfo.Name)
            {
            }
            column(CompanyInfoPicture;CompanyInfo.Picture)
            {
            }
            column(OwnerOccupier;Employee."Owner Occupier")
            {
            }
            column(EmployeeContribution_Employee;Employee."Employee Contribution")
            {
            }

            trigger OnAfterGetRecord()
            begin

                TypeofEmployee:=Format(Employee."Employee Type")+' '+'Employee';
                TypeofHousing:='Benefit not given';
                CarBenefit:=0;
                MortageInterest:='';
                HomeOwnership:='';
                InsuranceRelief:='';
                PersonalRelief:='';
                Employee.CalcFields(Basic,"Other Allowance","Insurance Relief","Cumm. PAYE","Non Cash Benefit","House Allowance1","Transport Allowance");
                Employee.CalcFields("Leave Allowance","Overtime Allowance","Directors Fees","Actual Contribution","Gross Cash","Retirement Contribution",
                "Owner Occupier",Employee."SSF Employer to Date",Employee.MPR,Employee."Morgage Relief");
                 Names:=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";

                if Employee.Status<>Employee.Status::Active then
                  CurrReport.Skip;

                    Resident:=Format(Employee."Residential Status");

                HrSetup.Get;
                if Employee."Actual Contribution">HrSetup."Pension Limit Amount" then begin
                  ActualContribution:=Format(HrSetup."Pension Limit Amount");
                InsuranceRelief:=Format(Employee."Insurance Relief");
                PersonalRelief:=Format(Employee.MPR);
                end
                else begin
                 ActualContribution:='';
                end;
                 if Employee."Residential Status"=Employee."Residential Status"::"Non-Resident" then begin

                    ActualContribution:='';
                  InsuranceRelief:='';
                  PersonalRelief:='';

                end
                  else begin
                   ActualContribution:=Format(Employee."Actual Contribution");
                   InsuranceRelief:=Format(Employee."Insurance Relief");
                   PersonalRelief:=Format(Employee.MPR);
                end;
                if Employee."Employee Type"=Employee."Employee Type"::Secondary then begin
                  ActualContribution:='';
                  PersonalRelief:='';
                  MortageInterest:='';
                  HomeOwnership:='';

                end else begin
                  ActualContribution:=Format(Employee."Actual Contribution");
                   InsuranceRelief:=Format(Employee."Insurance Relief");
                   PersonalRelief:=Format(Employee.MPR);
                  MortageInterest:=Format(Employee."Morgage Relief");
                  HomeOwnership:=Format(Employee."Home Savings");
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        Names: Code[250];
        Resident: Text;
        TypeofEmployee: Text;
        CarBenefit: Decimal;
        TypeofHousing: Text;
        ActualContribution: Text;
        HrSetup: Record "Human Resources Setup";
        MortageInterest: Text;
        HomeOwnership: Text;
        CompanyInfo: Record "Company Information";
        InsuranceRelief: Text;
        PersonalRelief: Text;
}

