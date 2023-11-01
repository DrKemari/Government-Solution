report 69070 "Board Online Itax Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Board Online Itax Report.rdlc';

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            DataItemTableView = WHERE("Vendor Type"=FILTER(Director),"Pays tax"=FILTER(true));
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
            column(Basic;Vendor."Taxable Income")
            {
            }
            column(HouseAllowance1;HouseAllowance1)
            {
            }
            column(TransportAllowance;HouseAllowance1)
            {
            }
            column(Leavepay;HouseAllowance1)
            {
            }
            column(OvertimeAllowance;HouseAllowance1)
            {
            }
            column(DirectorsFees;HouseAllowance1)
            {
            }
            column(LumpSum;HouseAllowance1)
            {
            }
            column(OtherAllowance;HouseAllowance1)
            {
            }
            column(CarBenefit;CarBenefit)
            {
            }
            column(NonCashBenefit;HouseAllowance1)
            {
            }
            column(NonCashBenefit_Employee;HouseAllowance1)
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
            column(PAYE;(Vendor."Cumm. PAYE")*-1)
            {
            }
            column(CompanyInfoName;CompanyInfo.Name)
            {
            }
            column(CompanyInfoPicture;CompanyInfo.Picture)
            {
            }
            column(OwnerOccupier;HouseAllowance1)
            {
            }
            column(EmployeeContribution_Employee;HouseAllowance1)
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
                 Names:=Vendor.Name;
                    ActualContribution:='';
                  InsuranceRelief:='';
                  PersonalRelief:='';
                  MortageInterest:='0';
                Vendor.CalcFields("Cumm. PAYE");
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
        HouseAllowance1: Text;
        TransportAllowance: Text;
        Leavepay: Text;
        OvertimeAllowance: Text;
        Basic: Decimal;
}

