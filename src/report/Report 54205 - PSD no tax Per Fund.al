report 54205 "PSD no tax Per Fund"
{
    DefaultLayout = RDLC;
    RDLCLayout = './PSD no tax Per Fund.rdlc';

    dataset
    {
        dataitem("Investment Asset";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") WHERE("Investment Type"=CONST('04'));
            RequestFilterFields = "No.","Date Filter","Deposit Type","Fund Code","Custodian Code";
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
            column(Fixed_Asset__GETFILTERS;"Investment Asset".GetFilters)
            {
            }
            column(Fund_Description_;"Fund Description")
            {
            }
            column(CompInfo_Picture;CompInfo.Picture)
            {
            }
            column(Fixed_Asset__No__;"No.")
            {
            }
            column(Fixed_Asset_Description;Description)
            {
            }
            column(Fixed_Asset__Investment_Date_;"Investment Date")
            {
            }
            column(Fixed_Asset__Maturity_Date_;"Maturity Date")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Acquisition_Cost_;"Investment Asset"."Acquisition Cost")
            {
            }
            column(Fixed_Asset__Rate___;"Rate %")
            {
            }
            column(Fixed_Asset__Maturity_Period_Days_;"Maturity Period Days")
            {
            }
            column(Fixed_Asset__Accrued_Interest_;"Accrued Interest")
            {
            }
            column(Fixed_Asset___Acquisition_Cost___Fixed_Asset___Accrued_Interest_;Investment."Acquisition Cost"+Investment."Accrued Interest")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Acquisition_Cost__Control1000000035;Investment."Acquisition Cost")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Accrued_Interest_;Investment."Accrued Interest")
            {
            }
            column(Fixed_Asset___Acquisition_Cost___Fixed_Asset___Accrued_Interest__Control1000000028;Investment."Acquisition Cost"+Investment."Accrued Interest")
            {
            }
            column(DEPOSITSCaption;DEPOSITSCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(SCHEME_Caption;SCHEME_CaptionLbl)
            {
            }
            column(Investment_No_Caption;Investment_No_CaptionLbl)
            {
            }
            column(Fixed_Asset_DescriptionCaption;FieldCaption(Description))
            {
            }
            column(Fixed_Asset__Investment_Date_Caption;FieldCaption("Investment Date"))
            {
            }
            column(Fixed_Asset__Maturity_Date_Caption;FieldCaption("Maturity Date"))
            {
            }
            column(AmountCaption;AmountCaptionLbl)
            {
            }
            column(Interest_Rate__Caption;Interest_Rate__CaptionLbl)
            {
            }
            column(DaysCaption;DaysCaptionLbl)
            {
            }
            column(Accrued_InterestCaption;Accrued_InterestCaptionLbl)
            {
            }
            column(Market_ValueCaption;Market_ValueCaptionLbl)
            {
            }
            column(TOTALCaption;TOTALCaptionLbl)
            {
            }
            column(FundCode_InvestmentAsset;"Investment Asset"."Fund Code")
            {
            }
            column(CustodianCode_InvestmentAsset;"Investment Asset"."Custodian Code")
            {
            }
            column(Fund_CodeCaption;Fund_CodeCaption)
            {
            }
            column(Market_Value;MarketValue)
            {
            }
            dataitem("Investment Rollover";"Investment Rollover")
            {
                DataItemLink = "Investment No"=FIELD("No.");
                column(Investment_Rollover1__Roll_Over_Date_;"Roll Over Date")
                {
                }
                column(Amount;Amount)
                {
                }
                column(Investment_Rollover1__Maturity_Date_;"Maturity Date")
                {
                }
                column(Investment_Rollover1__Rollover_Rate__;"Rollover Rate%")
                {
                }
                column(Investment_Rollover1__Maturity_Period_Days_;"Maturity Period Days")
                {
                }
                column(Gross_Interest_;"Gross Interest")
                {
                }
                column(Amount__Gross_Interest_;Amount+"Gross Interest")
                {
                }
                column(Investment_Rollover1_Investment_No;"Investment No")
                {
                }

                trigger OnAfterGetRecord()
                begin
                     /*
                    
                    Amount:=0;
                    
                    GLEntry.RESET;
                    GLEntry.SETRANGE(GLEntry."Investment Code","Investment Rollover"."Investment No");
                    GLEntry.SETRANGE(GLEntry."GL Type",GLEntry."GL Type"::Acquisition);
                    GLEntry.SETRANGE(GLEntry."Posting Date","Investment Rollover"."Roll Over Date");
                    
                    //IF FIND('-') THEN BEGIN
                    //REPEAT
                    //Amount:= Amount+GLEntry.Amount;
                    //MESSAGE('%1',Amount);
                    //UNTIL GLEntry.NEXT=0;
                    
                    //END;
                    */
                    Amount:=0;
                    //MESSAGE('%1',"Investment Asset"."Investment Date");
                    //MESSAGE('%1',"Investment Rollover"."Roll Over Date");
                    Investment.Get("Investment Rollover"."Investment No");
                    Investment.SetRange(Investment."Date Filter","Investment Asset"."Investment Date","Investment Rollover"."Roll Over Date");
                    Investment.CalcFields(Investment."Acquisition Cost");
                    //MESSAGE('%1',Investment."Acquisition Cost");
                    Amount:=Investment."Acquisition Cost";
                    
                    Investment.Get("Investment Rollover"."Investment No");
                    Investment.SetRange(Investment."Date Filter","Investment Rollover"."Maturity Date");
                    Investment.CalcFields(Investment."Gross Interest");
                    
                    "Gross Interest":=Investment."Gross Interest";
                    
                    InvestSetup.Get;
                    WitholdingTax:=Round("Gross Interest"*(InvestSetup."Witholding Tax%-Fixed Deposits"/100),0.01);
                    //MESSAGE('%1',WitholdingTax);
                    
                    "Net Interest":="Gross Interest"-WitholdingTax;
                    //MESSAGE('%1',"Net Interest");

                end;
            }

            trigger OnAfterGetRecord()
            begin
                "Investment Asset".SetRange("Investment Asset"."Date Filter","Investment Asset"."Investment Date",GetRangeMax("Investment Asset"."Date Filter"));
                "Investment Asset".CalcFields("Investment Asset"."Acquisition Cost","Investment Asset"."Gross Interest","Investment Asset"."Accrued Interest");

                if "Investment Asset"."Acquisition Cost"=0 then
                CurrReport.Skip;
                CompInfo.Get;
                CompInfo.CalcFields(CompInfo.Picture);
                Investment.Get("Investment Asset"."No.");
                Investment.SetRange(Investment."Date Filter","Investment Asset"."Investment Date",GetRangeMax("Investment Asset"."Date Filter"));
                Investment.CalcFields(Investment."Acquisition Cost");
                //MESSAGE('%1',Investment."Acquisition Cost");
                "Initial Amount":=Investment."Acquisition Cost";

                //get interest calculation date.
                "Investment Rollover".Reset;
                "Investment Rollover".SetRange("Investment Rollover"."Investment No","Investment Asset"."No.");
                if "Investment Rollover".FindFirst then
                "Interest Date":="Investment Rollover"."Roll Over Date"
                else
                "Interest Date":=Investment."Maturity Date";

                Investment.Get("Investment Asset"."No.");
                //Investment.SETRANGE(Investment."Date Filter","Investment Asset"."Investment Date","Interest Date");
                Investment.SetRange(Investment."Date Filter","Investment Asset"."Investment Date",GetRangeMax("Investment Asset"."Date Filter"));
                Investment.CalcFields(Investment."Gross Interest",Investment."Acquisition Cost");
                //MESSAGE('%1',Investment."Gross Interest");
                "Gross Interest":=Investment."Gross Interest";


                InvestSetup.Get;
                WitholdingTax:=Round("Gross Interest"*(InvestSetup."Witholding Tax%-Fixed Deposits"/100),0.01);
                //MESSAGE('%1',WitholdingTax);

                "Net Interest":="Gross Interest"-WitholdingTax;
                //MESSAGE('%1',Amount);
                MarketValue:="Investment Asset"."Acquisition Cost"+"Investment Asset"."Accrued Interest";
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("No.");
                CurrReport.CreateTotals("Investment Asset"."Acquisition Cost","Investment Asset"."Gross Interest","Investment Asset"."Accrued Interest");
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
         /*"Fund Code":="Fund Code";
        
        IF Dimensions.GET("Fund Code") THEN
        "Fund Description":=Dimensions.Description;
        //MESSAGE('&1',"Fund Description");
         //*/

    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Amount: Decimal;
        GLEntry: Record "G/L Entry";
        Investment: Record "Investment Asset";
        "Initial Amount": Decimal;
        "Gross Interest": Decimal;
        "Interest Date": Date;
        WitholdingTax: Decimal;
        "Net Interest": Decimal;
        InvestSetup: Record "Investment Setup";
        "Fund Code": Code[10];
        "Fund Description": Text[100];
        Dimensions: Record "Fund Code";
        CompInfo: Record "Company Information";
        DEPOSITSCaptionLbl: Label 'DEPOSITS';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        SCHEME_CaptionLbl: Label 'SCHEME:';
        Investment_No_CaptionLbl: Label 'Investment No.';
        AmountCaptionLbl: Label 'Amount';
        Interest_Rate__CaptionLbl: Label 'Interest Rate %';
        DaysCaptionLbl: Label ' Days';
        Accrued_InterestCaptionLbl: Label 'Accrued Interest';
        Market_ValueCaptionLbl: Label 'Market Value';
        TOTALCaptionLbl: Label 'TOTAL';
        Fund_CodeCaption: Label 'Fund Code';
        MarketValue: Decimal;
}

