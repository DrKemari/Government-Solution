report 69040 "Payroll Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Payroll Summary.rdlc';

    dataset
    {
        dataitem("Dimension Value";"Dimension Value")
        {
            DataItemTableView = SORTING("Dimension Code",Code) ORDER(Ascending) WHERE("Dimension Code"=CONST('DEPARTMENT'));
            RequestFilterFields = "Pay Period Filter";
            column(Code_DimensionValue;"Dimension Value".Code)
            {
            }
            column(Name_DimensionValue;"Dimension Value".Name)
            {
            }
            column(DepName;DepName)
            {
            }
            column(DepTotals;DepTotals)
            {
            }
            column(GrossPay;GrossPay)
            {
            }
            column(Totalded;Totalded)
            {
            }
            column(NetPay;NetPay)
            {
            }
            column(PayPeriodtext1;PayPeriodtext1)
            {
            }
            dataitem("Integer";"Integer")
            {
                DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number=CONST(1));
                column(CompanyInfoName;CompanyInfo.Name)
                {
                }
                column(CompanyInfoPicture;CompanyInfo.Picture)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                DepTotals:=0;
                DepName:="Dimension Value".Code+' GROSS PAY';
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);
                
                /*
                AssMatrix.RESET
                AssMatrix.SETRANGE(AssMatrix."Payroll Period",PayPeriod);
                AssMatrix.SETRANGE(AssMatrix."Department Code","Dimension Value".Code);
                AssMatrix.
                
                */
                
                
                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit",false);
                EarnRec.SetRange(EarnRec."Pay Period Filter",PayPeriod);
                EarnRec.SetRange(EarnRec."Department Filter","Dimension Value".Code);
                
                if EarnRec.Find('-') then begin
                repeat
                EarnRec.CalcFields(EarnRec."Total Amount");
                DepTotals:=DepTotals+EarnRec."Total Amount";
                TotalGross:=TotalGross+EarnRec."Total Amount";
                until EarnRec.Next=0;
                end;
                
                if DepTotals=0 then
                CurrReport.Skip;

            end;

            trigger OnPreDataItem()
            begin
                PayPeriod:="Dimension Value".GetRangeMin("Pay Period Filter");
                "Dimension Value".SetRange("Dimension Value"."Dimension Code",'DEPARTMENT');
                //MESSAGE('%1',PayPeriod);

                if PayPeriodX.Get(PayPeriod) then
                  PayPeriodtext1:=PayPeriodX.Name;
                 Year:=Date2DMY(PayPeriod,3);
                 PayPeriodtext1:='PAYROLL SUMMARY '+UpperCase(PayPeriodtext1)+'-'+ Format(Year);

                //Net Pay
                ///Calculate Gross pay
                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit",false);
                EarnRec.SetRange(EarnRec."Pay Period Filter",PayPeriod);
                //EarnRec.SETRANGE(EarnRec."Payroll Grouping Filter",EarnRec."Payroll Grouping Filter"::Management);

                if EarnRec.Find('-') then begin
                repeat
                EarnRec.CalcFields(EarnRec."Total Amount");
                GrossPay:=GrossPay+EarnRec."Total Amount";
                until EarnRec.Next=0;
                end;

                Ded.Reset;
                Ded.SetRange(Ded."Pay Period Filter",PayPeriod);
                //Ded.SETRANGE(Ded."Payroll Grouping Filter",Ded."Payroll Grouping Filter"::Management);
                if Ded.Find('-') then begin
                repeat
                Ded.CalcFields(Ded."Total Amount");
                Totalded:=Totalded+Ded."Total Amount";
                until Ded.Next=0;
                end;

                NetPay:=Abs(GrossPay+Totalded);

                //MESSAGE('%1',GrossPay);
                ///MESSAGE('%1',Totalded);


                //MESSAGE('%1',NetPay);
            end;
        }
        dataitem(DeductionsX;DeductionsX)
        {
            column(Code_DeductionsX;DeductionsX.Code)
            {
            }
            column(Description_DeductionsX;DeductionsX.Description)
            {
            }
            column(DeductionTotals;DeductionTotals)
            {
            }

            trigger OnAfterGetRecord()
            begin

                DeductionsX.CalcFields(DeductionsX."Total Amount");
                DeductionTotals:=Abs(DeductionsX."Total Amount");
                //Totalded:=Totalded+DeductionsX."Total Amount";
            end;

            trigger OnPreDataItem()
            begin
                DeductionsX.SetRange(DeductionsX."Pay Period Filter",PayPeriod);
            end;
        }
        dataitem(EarningsX;EarningsX)
        {
            column(Code_EarningsX;EarningsX.Code)
            {
            }
            column(Description_EarningsX;EarningsX.Description)
            {
            }
            column(EarningTotals;EarningTotals)
            {
            }

            trigger OnAfterGetRecord()
            begin
                EarningsX.CalcFields("Total Amount");
                EarningTotals:=Abs(EarningsX."Total Amount");
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

    var
        DepName: Text[100];
        PayPeriod: Date;
        AssMatrix: Record "Assignment Matrix-X";
        EarnRec: Record EarningsX;
        DepTotals: Decimal;
        TotalGross: Decimal;
        DeductionTotals: Decimal;
        NetPay: Decimal;
        Totalded: Decimal;
        Ded: Record DeductionsX;
        GrossPay: Decimal;
        PayPeriodX: Record "Payroll PeriodX";
        Year: Integer;
        PayPeriodtext1: Text[100];
        HoldDate: Date;
        reportmonth: Integer;
        reportmonth2: Text[100];
        reportdate: Date;
        reportdate2: Integer;
        monthh: Text[100];
        filterr: Text[100];
        CompanyInfo: Record "Company Information";
        EarningTotals: Decimal;
}

