report 54207 "Commercial Papers Per Fund"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Commercial Papers Per Fund.rdlc';

    dataset
    {
        dataitem("Fixed Asset";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") WHERE("Asset Type"=CONST("Money Market"),"Investment Type"=CONST('07'));
            RequestFilterFields = "No.","Issue Date","Investment Date","Date Filter";
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
            column(Fixed_Asset__Fixed_Asset___Issue_Date_;"Fixed Asset"."Issue Date")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Face_Value_;"Fixed Asset"."Face Value")
            {
            }
            column(ActualCost;ActualCost)
            {
            }
            column(Fixed_Asset___Acquisition_Cost___Fixed_Asset___Accrued_Interest_;"Fixed Asset"."Acquisition Cost"+"Fixed Asset"."Accrued Interest")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Accrued_Interest_;"Fixed Asset"."Accrued Interest")
            {
            }
            column(Fixed_Asset__Fixed_Asset__Description;"Fixed Asset".Description)
            {
            }
            column(Fixed_Asset__Fixed_Asset___Accrued_Interest__Control1000000045;"Fixed Asset"."Accrued Interest")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Face_Value__Control1000000007;"Fixed Asset"."Face Value")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Accrued_Interest__Control1000000008;"Fixed Asset"."Accrued Interest")
            {
            }
            column(Fixed_Asset___Acquisition_Cost___Fixed_Asset___Accrued_Interest__Control1000000035;"Fixed Asset"."Acquisition Cost"+"Fixed Asset"."Accrued Interest")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Acquisition_Cost_;"Fixed Asset"."Acquisition Cost")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Accrued_Interest__Control1000000047;"Fixed Asset"."Accrued Interest")
            {
            }
            column(COMMERCIAL_PAPERSCaption;COMMERCIAL_PAPERSCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Fixed_Asset__No__Caption;FieldCaption("No."))
            {
            }
            column(Issue_DateCaption;Issue_DateCaptionLbl)
            {
            }
            column(Fixed_Asset__Maturity_Date_Caption;FieldCaption("Maturity Date"))
            {
            }
            column(Face_ValueCaption;Face_ValueCaptionLbl)
            {
            }
            column(Actual_CostCaption;Actual_CostCaptionLbl)
            {
            }
            column(Net_Value_Caption;Net_Value_CaptionLbl)
            {
            }
            column(Accrued_DiscountCaption;Accrued_DiscountCaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(YTD_DiscountCaption;YTD_DiscountCaptionLbl)
            {
            }
            column(FundCode_FixedAsset;"Fixed Asset"."Fund Code")
            {
            }
            column(CustodianCode_FixedAsset;"Fixed Asset"."Custodian Code")
            {
            }

            trigger OnAfterGetRecord()
            begin
                 CompInfo.Get;
                 CompInfo.CalcFields(CompInfo.Picture);
                
                   CalcFields("Fixed Asset"."Acquisition Cost","Fixed Asset"."Interest Received");
                    /*NoOfYears:=0;
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
                END;*/
                
                
                ExpectedInterest.Reset;
                ExpectedInterest.SetRange(ExpectedInterest."Investment No","Fixed Asset"."No.");
                ExpectedInterest.SetFilter(ExpectedInterest."Expected Interest Date",'<%1',ReferenceDate);
                if ExpectedInterest.Find('+') then
                LastRepricingDate:=ExpectedInterest."Expected Interest Date";
                
                if LastRepricingDate=0D then
                LastRepricingDate:="Fixed Asset"."Issue Date";
                
                CalcFields("Acquisition Cost","Interest Received");
                ActualCost:="Fixed Asset"."Acquisition Cost"+"Fixed Asset"."Interest Received";
                
                //MESSAGE('%1',"Fixed Asset"."Interest Received");

            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Fixed Asset"."Face Value");
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
        ActualCost: Decimal;
        TotalActual: Integer;
        TotalInterest: Integer;
        CompInfo: Record "Company Information";
        COMMERCIAL_PAPERSCaptionLbl: Label 'COMMERCIAL PAPERS';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Issue_DateCaptionLbl: Label 'Issue Date';
        Face_ValueCaptionLbl: Label 'Face Value';
        Actual_CostCaptionLbl: Label 'Actual Cost';
        Net_Value_CaptionLbl: Label 'Net Value ';
        Accrued_DiscountCaptionLbl: Label 'Accrued Discount';
        DescriptionCaptionLbl: Label 'Description';
        YTD_DiscountCaptionLbl: Label 'YTD Discount';
}

