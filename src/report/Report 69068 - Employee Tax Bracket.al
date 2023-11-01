report 69068 "Employee Tax Bracket"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Employee Tax Bracket.rdlc';

    dataset
    {
        dataitem(BracketsX;BracketsX)
        {
            column(TaxBand_BracketsX;BracketsX."Tax Band")
            {
            }
            column(Description_BracketsX;BracketsX.Description)
            {
            }
            column(TableCode_BracketsX;BracketsX."Table Code")
            {
            }
            column(LowerLimit_BracketsX;BracketsX."Lower Limit")
            {
            }
            column(UpperLimit_BracketsX;BracketsX."Upper Limit")
            {
            }
            column(Amount_BracketsX;BracketsX.Amount)
            {
            }
            column(Percentage_BracketsX;BracketsX.Percentage)
            {
            }
            column(FromDate_BracketsX;BracketsX."From Date")
            {
            }
            column(EndDate_BracketsX;BracketsX."End Date")
            {
            }
            column(Payperiod_BracketsX;BracketsX."Pay period")
            {
            }
            column(TaxableAmount_BracketsX;BracketsX."Taxable Amount")
            {
            }
            column(Totaltaxable_BracketsX;BracketsX."Total taxable")
            {
            }
            column(FactorWithoutHousing_BracketsX;BracketsX."Factor Without Housing")
            {
            }
            column(FactorWithHousing_BracketsX;BracketsX."Factor With Housing")
            {
            }
            dataitem(Employee;Employee)
            {
                DataItemTableView = SORTING("No.");
                RequestFilterFields = "Pay Period Filter","No.","Posting Group";
                column(FORMAT_TODAY_0_4_;Format(Today,0,4))
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
                column(First_Name_________Middle_Name_______Last_Name_;"First Name" + ' '+"Middle Name"+' '+"Last Name")
                {
                }
                column(Gender_Employee;Employee.Gender)
                {
                }
                column(TotalAllowances_Employee;Employee."Total Allowances")
                {
                }
                column(TaxableIncome_Employee;Employee."Taxable Income")
                {
                }
                column(PIN;CoRec."Pin No")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    Employee.SetFilter("Taxable Income",'%1..%2',BracketsX."Lower Limit",BracketsX."Upper Limit");
                    Employee.CalcFields("Taxable Income");
                end;
            }
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
        CoRec.Get;
        CoRec.CalcFields(Picture);
    end;

    var
        Text002: Label 'MASTER ROLL';
        Text001: Label 'KS';
        MASTER_ROLLCaptionLbl: Label 'MASTER ROLL';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Other_AllowancesCaptionLbl: Label 'Other Allowances';
        CoRec: Record "Company Information";
}

