report 54020 "Private Sector Deposit"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Private Sector Deposit.rdlc';

    dataset
    {
        dataitem("Fixed Asset";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") WHERE("Asset Type"=CONST("Money Market"),"Investment Type"=FILTER('04'|'07'));
            RequestFilterFields = "No.","Issue Date","Investment Date","Date Filter","Investment Type","Fund Code";
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
            column(Fixed_Asset__Maturity_Date_;"Maturity Date")
            {
            }
            column(Fixed_Asset__Investment_Date_;"Investment Date")
            {
            }
            column(Fixed_Asset__Rate___;"Rate %")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Acquisition_Cost_;"Fixed Asset"."Acquisition Cost")
            {
            }
            column(Fixed_Asset__Accrued_Interest_;"Accrued Interest")
            {
            }
            column(Accrued_Interest___Fixed_Asset___Acquisition_Cost_;"Accrued Interest"+"Fixed Asset"."Acquisition Cost")
            {
            }
            column(Fixed_Asset_Description;Description)
            {
            }
            column(NoOfYears;NoOfYears)
            {
            }
            column(Fixed_Asset__Fixed_Asset___Acquisition_Cost__Control1000000007;"Fixed Asset"."Acquisition Cost")
            {
            }
            column(Fixed_Asset__Accrued_Interest__Control1000000008;"Accrued Interest")
            {
            }
            column(Accrued_Interest___Fixed_Asset___Acquisition_Cost__Control1000000035;"Accrued Interest"+"Fixed Asset"."Acquisition Cost")
            {
            }
            column(PRIVATE_SECTOR_DEPOSITSCaption;PRIVATE_SECTOR_DEPOSITSCaptionLbl)
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
            column(Interest_RateCaption;Interest_RateCaptionLbl)
            {
            }
            column(Fixed_Asset__Maturity_Date_Caption;FieldCaption("Maturity Date"))
            {
            }
            column(Accrued_InterestCaption;Accrued_InterestCaptionLbl)
            {
            }
            column(Tenure__Days_Caption;Tenure__Days_CaptionLbl)
            {
            }
            column(Armotized_CostCaption;Armotized_CostCaptionLbl)
            {
            }
            column(Institution_NameCaption;Institution_NameCaptionLbl)
            {
            }
            column(Deposit_CostCaption;Deposit_CostCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(CompInfo.Picture);
                
                      if (("Fixed Asset"."Maturity Date"<>0D) and ("Fixed Asset"."Investment Date"<>0D)) then
                  NoOfYears:="Fixed Asset"."Maturity Date"-"Fixed Asset"."Investment Date";
                
                  "Fixed Asset".CalcFields("Fixed Asset"."Acquisition Cost");
                  //MESSAGE('%1',"Fixed Asset"."Acquisition Cost");
                  //IF "Fixed Asset"."Acquisition Cost"=0 THEN
                  //BEGIN
                  //MESSAGE('%1 %2',"Fixed Asset"."No.","Fixed Asset".Description);
                  //CurrReport.SKIP;
                 // END;
                
                 /* NoOfYears:=0;
                  InterestPeriods:=0;
                  NextInterestPeriod:="Fixed Asset"."Investment Date";
                  NextYr:="Fixed Asset"."Investment Date";
                
                  REPEAT
                  NextInterestPeriod:=CALCDATE('1D',NextInterestPeriod);
                  InterestPeriods:=InterestPeriods+1;
                
                  UNTIL NextInterestPeriod="Maturity Date";
                
                  REPEAT
                  NextYr:=CALCDATE('1D',NextYr);
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
                END;*/
                
                
                ExpectedInterest.Reset;
                ExpectedInterest.SetRange(ExpectedInterest."Investment No","Fixed Asset"."No.");
                ExpectedInterest.SetFilter(ExpectedInterest."Expected Interest Date",'<%1',ReferenceDate);
                if ExpectedInterest.Find('+') then
                LastRepricingDate:=ExpectedInterest."Expected Interest Date";
                
                if LastRepricingDate=0D then
                LastRepricingDate:="Fixed Asset"."Issue Date";

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
        NoOfDays: Integer;
        CompInfo: Record "Company Information";
        PRIVATE_SECTOR_DEPOSITSCaptionLbl: Label 'PRIVATE SECTOR DEPOSITS';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Interest_RateCaptionLbl: Label 'Interest Rate';
        Accrued_InterestCaptionLbl: Label 'Accrued Interest';
        Tenure__Days_CaptionLbl: Label 'Tenure (Days)';
        Armotized_CostCaptionLbl: Label 'Armotized Cost';
        Institution_NameCaptionLbl: Label 'Institution Name';
        Deposit_CostCaptionLbl: Label 'Deposit Cost';
}

