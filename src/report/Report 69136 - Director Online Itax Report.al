report 69136 "Director Online Itax Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Director Online Itax Report.rdlc';

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            DataItemTableView = WHERE("Pays tax"=FILTER(true));
            RequestFilterFields = "Pay Period Filter";
            column(PIN;Vendor."PIN Number")
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
            column(Basic;Vendor."Total Allowances")
            {
            }
            column(HouseAllowance1;HomeOwnership)
            {
            }
            column(TransportAllowance;HomeOwnership)
            {
            }
            column(Leavepay;HomeOwnership)
            {
            }
            column(OvertimeAllowance;HomeOwnership)
            {
            }
            column(DirectorsFees;HomeOwnership)
            {
            }
            column(LumpSum;HomeOwnership)
            {
            }
            column(OtherAllowance;HomeOwnership)
            {
            }
            column(CarBenefit;CarBenefit)
            {
            }
            column(NonCashBenefit;HomeOwnership)
            {
            }
            column(NonCashBenefit_Employee;HomeOwnership)
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
            column(PAYE;(Vendor."Cumm. PAYE"*-1))
            {
            }
            column(CompanyInfoName;CompanyInfo.Name)
            {
            }
            column(CompanyInfoPicture;CompanyInfo.Picture)
            {
            }
            column(OwnerOccupier;HomeOwnership)
            {
            }
            column(EmployeeContribution_Employee;HomeOwnership)
            {
            }

            trigger OnAfterGetRecord()
            begin

                TypeofEmployee:='Secondary Employee';
                TypeofHousing:='Benefit not given';
                CarBenefit:=0;
                MortageInterest:='';
                HomeOwnership:='';
                InsuranceRelief:='';
                PersonalRelief:='';
                Vendor.CalcFields("Total Allowances","Total Deductions","Cumm. PAYE");
                 Names:=Vendor.Name;

                if Vendor.Blocked=Vendor.Blocked::Payment then
                  CurrReport.Skip;

                    Resident:='Resident';

                  ActualContribution:='';
                  PersonalRelief:='';
                  MortageInterest:='';
                  HomeOwnership:='';
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

