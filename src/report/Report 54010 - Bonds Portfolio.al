report 54010 "Bonds Portfolio"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bonds Portfolio.rdlc';

    dataset
    {
        dataitem("Fixed Asset";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") WHERE("Asset Type"=CONST("Money Market"),"Investment Type"=CONST('06'));
            RequestFilterFields = "No.","Issue Date","Investment Date","Date Filter","Deposit Type","Fund Code","Custodian Code";
            RequestFilterHeading = 'Bonds Portfolio';
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
            column(Fixed_Asset__GETFILTERS;"Fixed Asset".GetFilters)
            {
            }
            column(CompInfo_Picture;CompInfo.Picture)
            {
            }
            column(Fixed_Asset__No__;"No.")
            {
            }
            column(Description_FixedAsset;"Fixed Asset".Description)
            {
            }
            column(Fixed_Asset__Maturity_Date_;"Maturity Date")
            {
            }
            column(Fixed_Asset__Investment_Date_;"Investment Date")
            {
            }
            column(Fixed_Asset__Rate___;"Rate %")
            {
            }
            column(Fixed_Asset__Issue_Date_;"Issue Date")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Face_Value_;"Fixed Asset"."Face Value")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Acquisition_Cost_;"Fixed Asset"."Acquisition Cost")
            {
            }
            column(Fixed_Asset__Maturity_Period_;"Maturity Period")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Current_Value_;"Fixed Asset"."Current Value")
            {
            }
            column(Fixed_Asset__Fixed_Asset___FDR_Number_;"Fixed Asset"."FDR Number")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Accrued_Interest_;"Fixed Asset"."Accrued Interest")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Accrued_Interest__Control1000000042;"Fixed Asset"."Accrued Interest")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Face_Value__Control1000000007;"Fixed Asset"."Face Value")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Acquisition_Cost__Control1000000008;"Fixed Asset"."Acquisition Cost")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Current_Value__Control1000000035;"Fixed Asset"."Current Value")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Accrued_Interest__Control1000000039;"Fixed Asset"."Accrued Interest")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Accrued_Interest__Control1000000051;"Fixed Asset"."Accrued Interest")
            {
            }
            column(BONDS_PORTFOLIOCaption;BONDS_PORTFOLIOCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Fixed_Asset__No__Caption;FieldCaption("No."))
            {
            }
            column(Fixed_Asset__Investment_Date_Caption;FieldCaption("Investment Date"))
            {
            }
            column(Issue_No_Caption;Issue_No_CaptionLbl)
            {
            }
            column(Coupon_Rate_Caption;Coupon_Rate_CaptionLbl)
            {
            }
            column(Fixed_Asset__Issue_Date_Caption;FieldCaption("Issue Date"))
            {
            }
            column(Fixed_Asset__Maturity_Date_Caption;FieldCaption("Maturity Date"))
            {
            }
            column(Face_ValueCaption;Face_ValueCaptionLbl)
            {
            }
            column(Aquisition_CostCaption;Aquisition_CostCaptionLbl)
            {
            }
            column(Tenure__Yrs_Caption;Tenure__Yrs_CaptionLbl)
            {
            }
            column(Current_ValueCaption;Current_ValueCaptionLbl)
            {
            }
            column(YTD_InterestCaption;YTD_InterestCaptionLbl)
            {
            }
            column(Accrued_InterestCaption;Accrued_InterestCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                
                "Fixed Asset".SetRange("Fixed Asset"."Date Filter",0D,GetRangeMax("Fixed Asset"."Date Filter"));
                "Fixed Asset".CalcFields("Fixed Asset"."Acquisition Cost","Fixed Asset"."Current Value","Fixed Asset"."Gross Interest",
                "Fixed Asset"."Accrued Interest");
                
                if "Fixed Asset"."Acquisition Cost"=0 then
                CurrReport.Skip;
                CompInfo.Get;
                CompInfo.CalcFields(CompInfo.Picture);
                
                if "Fixed Asset"."Acquisition Cost"=0 then
                CurrReport.Skip;
                
                /*
                
                
                  NoOfYears:=0;
                  InterestPeriods:=0;
                  NextInterestPeriod:="Fixed Asset"."Issue Date";
                  NextYr:="Fixed Asset"."Issue Date";
                
                  REPEAT
                  NextInterestPeriod:=CALCDATE('182D',NextInterestPeriod);
                  InterestPeriods:=InterestPeriods+1;
                
                  UNTIL NextInterestPeriod="Maturity Date";
                
                  REPEAT
                  NextYr:=CALCDATE('364D',NextYr);
                  NoOfYears:=NoOfYears+1;
                
                  UNTIL NextYr="Maturity Date";
                
                  EVALUATE("Fixed Asset"."Interest Frequency Period",'182D');
                  "Fixed Asset"."No. Of Interest Periods":=InterestPeriods;
                  "Fixed Asset"."Maturity Period":=NoOfYears;
                  "Fixed Asset"."Purchase Type":="Fixed Asset"."Purchase Type"::Primary;
                  "Fixed Asset"."Interest Rate Type":="Fixed Asset"."Interest Rate Type"::Fixed;
                  "Fixed Asset".MODIFY;
                
                
                
                CALCFIELDS("Acquisition Cost");
                IF "No. Of Interest Periods"<>0 THEN
                BEGIN
                NextInterestDate:="Issue Date";
                
                FOR i:=1 TO "No. Of Interest Periods" DO BEGIN
                NextInterestDate:=CALCDATE("Interest Frequency Period",NextInterestDate);
                
                
                Schedule.INIT;
                Schedule."Investment No":="No.";
                Schedule."Expected Interest Date":=NextInterestDate;
                Schedule."Expected Interest Amount":=Value*("Rate %"/100)*0.5;
                Schedule.Type:=Schedule.Type::Interest;
                IF ((NOT Schedule.GET(Schedule."Investment No",Schedule."Expected Interest Date")) AND ("Investment Date"<=NextInterestDate)) THEN
                Schedule.INSERT;
                
                
                END;
                END;
                
                
                */
                
                
                
                ExpectedInterest.Reset;
                ExpectedInterest.SetRange(ExpectedInterest."Investment No","Fixed Asset"."No.");
                ExpectedInterest.SetFilter(ExpectedInterest."Expected Interest Date",'<%1',ReferenceDate);
                if ExpectedInterest.Find('+') then
                LastRepricingDate:=ExpectedInterest."Expected Interest Date";
                
                if LastRepricingDate=0D then
                LastRepricingDate:="Fixed Asset"."Issue Date";

            end;

            trigger OnPreDataItem()
            begin
                 CurrReport.CreateTotals("Fixed Asset"."Acquisition Cost","Fixed Asset"."Current Value","Fixed Asset"."Face Value",
                 "Fixed Asset"."Accrued Interest");
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
         ReferenceDate:="Fixed Asset".GetRangeMax("Date Filter");
    end;

    var
        NoOfYears: Integer;
        DaysBetween: Integer;
        InterestPeriods: Integer;
        NextInterestPeriod: Date;
        NextYr: Date;
        NextInterestDate: Date;
        i: Integer;
        Schedule: Record "Expected Interest1";
        LastRepricingDate: Date;
        ExpectedInterest: Record "Expected Interest1";
        ReferenceDate: Date;
        CompInfo: Record "Company Information";
        BONDS_PORTFOLIOCaptionLbl: Label 'BONDS PORTFOLIO';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Issue_No_CaptionLbl: Label 'Issue No.';
        Coupon_Rate_CaptionLbl: Label 'Coupon Rate ';
        Face_ValueCaptionLbl: Label 'Face Value';
        Aquisition_CostCaptionLbl: Label 'Aquisition Cost';
        Tenure__Yrs_CaptionLbl: Label 'Tenure (Yrs)';
        Current_ValueCaptionLbl: Label 'Current Value';
        YTD_InterestCaptionLbl: Label 'YTD Interest';
        Accrued_InterestCaptionLbl: Label 'Accrued Interest';
}

