report 54018 "Custodian Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Custodian Report1.rdlc';

    dataset
    {
        dataitem("Fixed Asset";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") WHERE("Asset Type"=CONST(Equity));
            RequestFilterHeading = 'Equities';
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
            column(STRSUBSTNO__SCHEDULE__OF__EQUITY__INVESTMENTS_AS_AT___1___EndDate_;StrSubstNo('SCHEDULE  OF  EQUITY  INVESTMENTS AS AT  %1', EndDate))
            {
            }
            column(STRSUBSTNO__Ledger___1___Fixed_Asset__GETFILTER__Global_Dimension_1_Code___;StrSubstNo('Ledger: %1',"Fixed Asset"."Fund Code"))
            {
            }
            column(STRSUBSTNO__Type___1__TypeofShares_;StrSubstNo('Type: %1',TypeofShares))
            {
            }
            column(Fund_Description_;"Fund Description")
            {
            }
            column(CompInfo_Picture;CompInfo.Picture)
            {
            }
            column(No__of_Shares_;'No. of Shares')
            {
            }
            column(as____;'as @' )
            {
            }
            column(StartDate_1;StartDate-1)
            {
            }
            column(StartDate_1_Control1000000016;StartDate-1)
            {
            }
            column(Total_Cost_;'Total Cost')
            {
            }
            column(of_Shares_as____;'of Shares as @' )
            {
            }
            column(Fixed_Asset_Description;Description)
            {
            }
            column(OpeningUnits;OpeningUnits)
            {
                DecimalPlaces = 0:0;
            }
            column(OpeningCost;OpeningCost)
            {
            }
            column(Fixed_Asset_Additions;Additions)
            {
            }
            column(Fixed_Asset__Acq__No__shares_;"Acq. No. shares")
            {
                DecimalPlaces = 0:0;
            }
            column(Fixed_Asset__Bonus_Units_;"Bonus Units")
            {
                DecimalPlaces = 0:0;
            }
            column(Fixed_Asset__Share_Split_;"Share Split")
            {
                DecimalPlaces = 0:0;
            }
            column(Fixed_Asset__Disposal_Value_;"Disposal Value")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Disposal_No__of_Units_;"Fixed Asset"."Disposal No. of Units")
            {
                DecimalPlaces = 0:0;
            }
            column(ClosingUnits;ClosingUnits)
            {
                DecimalPlaces = 0:0;
            }
            column(ClosingValue;ClosingValue)
            {
            }
            column(ClosingUnits_MarketPrice;ClosingUnits*MarketPrice)
            {
            }
            column(RevaluationSurplusDeficit;RevaluationSurplusDeficit)
            {
            }
            column(MarketPrice;MarketPrice)
            {
            }
            column(Fixed_Asset__Fixed_Asset___Gain__Loss__on_Disposal_;"Fixed Asset"."Gain/(Loss) on Disposal")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Dividend_Received_;"Fixed Asset"."Dividend Received")
            {
            }
            column(WitholdingTax;WitholdingTax)
            {
            }
            column(OpeningUnits_Control1000000077;OpeningUnits)
            {
                DecimalPlaces = 0:0;
            }
            column(OpeningCost_Control1000000078;OpeningCost)
            {
            }
            column(Fixed_Asset_Additions_Control1000000079;Additions)
            {
            }
            column(Fixed_Asset__Acq__No__shares__Control1000000080;"Acq. No. shares")
            {
                DecimalPlaces = 0:0;
            }
            column(Fixed_Asset__Bonus_Units__Control1000000081;"Bonus Units")
            {
                DecimalPlaces = 0:0;
            }
            column(Fixed_Asset__Share_Split__Control1000000082;"Share Split")
            {
                DecimalPlaces = 0:0;
            }
            column(Fixed_Asset__Disposal_Value__Control1000000083;"Disposal Value")
            {
            }
            column(Fixed_Asset__Fixed_Asset___Disposal_No__of_Units__Control1000000084;"Fixed Asset"."Disposal No. of Units")
            {
                DecimalPlaces = 0:0;
            }
            column(ClosingUnits_Control1000000093;ClosingUnits)
            {
                DecimalPlaces = 0:0;
            }
            column(ClosingValue_Control1000000095;ClosingValue)
            {
            }
            column(MarketValue;MarketValue)
            {
            }
            column(RevaluationSurplusDeficit_Control1000000100;RevaluationSurplusDeficit)
            {
            }
            column(Fixed_Asset__Fixed_Asset___Gain__Loss__on_Disposal__Control1000000107;"Fixed Asset"."Gain/(Loss) on Disposal")
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(INSTITUTION_Caption;INSTITUTION_CaptionLbl)
            {
            }
            column(Fixed_Asset_DescriptionCaption;FieldCaption(Description))
            {
            }
            column(CostCaption;CostCaptionLbl)
            {
            }
            column(No_Of_SharesCaption;No_Of_SharesCaptionLbl)
            {
            }
            column(Fixed_Asset__Bonus_Units_Caption;FieldCaption("Bonus Units"))
            {
            }
            column(Fixed_Asset__Share_Split_Caption;FieldCaption("Share Split"))
            {
            }
            column(Fixed_Asset__Disposal_Value_Caption;FieldCaption("Disposal Value"))
            {
            }
            column(No__Of_UnitsCaption;No__Of_UnitsCaptionLbl)
            {
            }
            column(No__Of_SharesCaption;No__Of_SharesCaptionLbl)
            {
            }
            column(CostCaption_Control1000000031;CostCaption_Control1000000031Lbl)
            {
            }
            column(AcquisitionsCaption;AcquisitionsCaptionLbl)
            {
            }
            column(DisposalsCaption;DisposalsCaptionLbl)
            {
            }
            column(Closing_BalancesCaption;Closing_BalancesCaptionLbl)
            {
            }
            column(Market_ValueCaption;Market_ValueCaptionLbl)
            {
            }
            column(Revaluation_Caption;Revaluation_CaptionLbl)
            {
            }
            column(Surplus_deficitCaption;Surplus_deficitCaptionLbl)
            {
            }
            column(Market_ValuationCaption;Market_ValuationCaptionLbl)
            {
            }
            column(Price_Per_ShareCaption;Price_Per_ShareCaptionLbl)
            {
            }
            column(for_the_yearCaption;for_the_yearCaptionLbl)
            {
            }
            column(Gain_Loss_On_DisposalCaption;Gain_Loss_On_DisposalCaptionLbl)
            {
            }
            column(Dividend_ReceivedCaption;Dividend_ReceivedCaptionLbl)
            {
            }
            column(TOTALCaption;TOTALCaptionLbl)
            {
            }
            column(Fixed_Asset_No_;"No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(CompInfo.Picture);
                      if EquityRec.Get("Fixed Asset"."No.") then
                   begin
                    EquityRec.SetRange(EquityRec."Date Filter",0D,StartDate-1);
                    EquityRec.CalcFields(EquityRec."No.Of Units",EquityRec."Current Value",Cost);
                    OpeningUnits:=EquityRec."No.Of Units";
                    OpeningCost:=EquityRec.Cost;
                  end;




                   if EquityRec.Get("Fixed Asset"."No.") then
                   begin
                    EquityRec.SetRange(EquityRec."Date Filter",0D,EndDate);
                    EquityRec.CalcFields(EquityRec."No.Of Units",EquityRec."Current Value",Cost,EquityRec.Revaluations);
                    ClosingUnits:=EquityRec."No.Of Units";
                    ClosingValue:=EquityRec.Cost;
                   // MarketValue:=EquityRec."Current Value";
                    RevaluationSurplusDeficit:=EquityRec.Revaluations;
                  end;
                MarketPrice:=0;
                InvestmentHist.Reset;
                InvestmentHist.SetRange(InvestmentHist.No,"Fixed Asset"."No.");
                InvestmentHist.SetRange(InvestmentHist.Date,SelectedEndDate);
                if InvestmentHist.Find('-') then
                MarketPrice:=InvestmentHist."Current Market Value";
                MarketValue:=MarketValue+(ClosingUnits*MarketPrice);
            end;

            trigger OnPreDataItem()
            begin
                // "Fixed Asset".SETRANGE("Fixed Asset"."Global Dimension 2 Code",SelectedFund);
                "Fixed Asset".SetRange("Fixed Asset".Institution,SelectedFund);

                    CurrReport.CreateTotals(OpeningUnits,ClosingUnits,OpeningCost,ClosingValue,MarketValue,RevaluationSurplusDeficit,
                  "Acq. No. shares","Fixed Asset"."Acquisition Cost","Fixed Asset"."Disposal Value","Fixed Asset".Revaluations
                 );

                  CurrReport.CreateTotals("Fixed Asset"."Bonus Units","Fixed Asset"."Share Split",
                  "Fixed Asset"."Disposal No. of Units","Fixed Asset".Additions);
            end;
        }
        dataitem("Fixed Asset1";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending) WHERE("Investment Type"=CONST('04'));
            RequestFilterHeading = 'Money Markets';
            column(Fund_Description__Control1000000144;"Fund Description")
            {
            }
            column(Fixed_Asset1__No__;"No.")
            {
            }
            column(Fixed_Asset1_Description;Description)
            {
            }
            column(Fixed_Asset1__Investment_Date_;"Investment Date")
            {
            }
            column(Fixed_Asset1__Maturity_Date_;"Maturity Date")
            {
            }
            column(Initial_Amount_;"Initial Amount")
            {
            }
            column(Fixed_Asset1__Rate___;"Rate %")
            {
            }
            column(Fixed_Asset1__Maturity_Period_Days_;"Maturity Period Days")
            {
            }
            column(Fixed_Asset1__Gross_Interest_;"Gross Interest")
            {
            }
            column(Fixed_Asset1___Acquisition_Cost___Fixed_Asset1___Gross_Interest_;"Fixed Asset1"."Acquisition Cost"+"Fixed Asset1"."Gross Interest")
            {
            }
            column(Fixed_Asset1__Fixed_Asset1___Acquisition_Cost_;"Fixed Asset1"."Acquisition Cost")
            {
            }
            column(Fixed_Asset1__Fixed_Asset1___Gross_Interest_;"Fixed Asset1"."Gross Interest")
            {
            }
            column(Fixed_Asset1___Acquisition_Cost___Fixed_Asset1___Gross_Interest__Control1000000142;"Fixed Asset1"."Acquisition Cost"+"Fixed Asset1"."Gross Interest")
            {
            }
            column(NO_Caption;NO_CaptionLbl)
            {
            }
            column(INSTITUIONCaption;INSTITUIONCaptionLbl)
            {
            }
            column(INVESTMENT__DATECaption;INVESTMENT__DATECaptionLbl)
            {
            }
            column(MATURITY_DATECaption;MATURITY_DATECaptionLbl)
            {
            }
            column(AMOUNTCaption;AMOUNTCaptionLbl)
            {
            }
            column(INTEREST_RATE__Caption;INTEREST_RATE__CaptionLbl)
            {
            }
            column(DAYSCaption;DAYSCaptionLbl)
            {
            }
            column(ACCRUED_INTERESTCaption;ACCRUED_INTERESTCaptionLbl)
            {
            }
            column(VALUECaption;VALUECaptionLbl)
            {
            }
            column(MONEY_MARKET_Caption;MONEY_MARKET_CaptionLbl)
            {
            }
            column(Fixed_DepositsCaption;Fixed_DepositsCaptionLbl)
            {
            }
            column(INSTITUTION_Caption_Control1000000143;INSTITUTION_Caption_Control1000000143Lbl)
            {
            }
            column(TOTALCaption_Control1000000141;TOTALCaption_Control1000000141Lbl)
            {
            }
            dataitem("Investment Rollover1";"Investment Rollover")
            {
                DataItemLink = "Investment No"=FIELD("No.");
                DataItemTableView = SORTING("Investment No","Roll Over Date") ORDER(Ascending);
                column(Investment_Rollover1__Roll_Over_Date_;"Roll Over Date")
                {
                }
                column(Investment_Rollover1__Maturity_Date_;"Maturity Date")
                {
                }
                column(Amount;Amount)
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
                    //MESSAGE('%1',"Fixed Asset"."Investment Date");
                    //MESSAGE('%1',"Investment Rollover"."Roll Over Date");
                    Investment.Get("Investment Rollover1"."Investment No");
                    Investment.SetRange(Investment."Date Filter","Fixed Asset1"."Investment Date","Investment Rollover1"."Roll Over Date");
                    Investment.CalcFields(Investment."Acquisition Cost");
                    //MESSAGE('%1',Investment."Acquisition Cost");
                    Amount:=Investment."Acquisition Cost";
                    
                    Investment.Get("Investment Rollover1"."Investment No");
                    Investment.SetRange(Investment."Date Filter","Investment Rollover1"."Maturity Date");
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
                Investment.Get("Fixed Asset1"."No.");
                Investment.SetRange(Investment."Date Filter","Fixed Asset1"."Investment Date");
                Investment.CalcFields(Investment."Acquisition Cost");
                //MESSAGE('%1',Investment."Acquisition Cost");
                "Initial Amount":=Investment."Acquisition Cost";

                //get interest calculation date.
                "Investment Rollover1".Reset;
                "Investment Rollover1".SetRange("Investment Rollover1"."Investment No","Fixed Asset1"."No.");
                if "Investment Rollover1".FindFirst then
                "Interest Date":="Investment Rollover1"."Roll Over Date"
                else
                "Interest Date":=Investment."Maturity Date";

                Investment.Get("Fixed Asset1"."No.");
                Investment.SetRange(Investment."Date Filter","Fixed Asset1"."Investment Date","Interest Date");
                Investment.CalcFields(Investment."Gross Interest");
                //MESSAGE('%1',Investment."Gross Interest");
                "Gross Interest":=Investment."Gross Interest";


                InvestSetup.Get;
                WitholdingTax:=Round("Gross Interest"*(InvestSetup."Witholding Tax%-Fixed Deposits"/100),0.01);
                //MESSAGE('%1',WitholdingTax);

                "Net Interest":="Gross Interest"-WitholdingTax;
                //MESSAGE('%1',Amount);
            end;

            trigger OnPreDataItem()
            begin
                //LastFieldNo := FIELDNO("No.");
                //"Fixed Asset1".SETRANGE("Fixed Asset1"."Global Dimension 2 Code",SelectedFund);
                "Fixed Asset1".SetRange("Fixed Asset1".Institution,SelectedFund);

                CurrReport.CreateTotals("Fixed Asset1"."Acquisition Cost","Fixed Asset1"."Gross Interest");
            end;
        }
        dataitem("Fixed Asset2";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending) WHERE("Investment Type"=CONST('05'));
            column(Fund_Description__Control1000000188;"Fund Description")
            {
            }
            column(Fixed_Asset2__No__;"No.")
            {
            }
            column(Fixed_Asset2_Description;Description)
            {
            }
            column(Fixed_Asset2__Investment_Date_;"Investment Date")
            {
            }
            column(Fixed_Asset2__Maturity_Date_;"Maturity Date")
            {
            }
            column(Initial_Amount__Control1000000219;"Initial Amount")
            {
            }
            column(Fixed_Asset2__Rate___;"Rate %")
            {
            }
            column(Fixed_Asset2__Maturity_Period_Days_;"Maturity Period Days")
            {
            }
            column(Fixed_Asset2__Gross_Interest_;"Gross Interest")
            {
            }
            column(Fixed_Asset2___Acquisition_Cost___Fixed_Asset2___Gross_Interest_;"Fixed Asset2"."Acquisition Cost"+"Fixed Asset2"."Gross Interest")
            {
            }
            column(Fixed_Asset2__Fixed_Asset2___Acquisition_Cost_;"Fixed Asset2"."Acquisition Cost")
            {
            }
            column(Fixed_Asset2__Fixed_Asset2___Gross_Interest_;"Fixed Asset2"."Gross Interest")
            {
            }
            column(Fixed_Asset2___Acquisition_Cost___Fixed_Asset2___Gross_Interest__Control1000000255;"Fixed Asset2"."Acquisition Cost"+"Fixed Asset2"."Gross Interest")
            {
            }
            column(MONEY_MARKET_Caption_Control1000000189;MONEY_MARKET_Caption_Control1000000189Lbl)
            {
            }
            column(Treasury_BillsCaption;Treasury_BillsCaptionLbl)
            {
            }
            column(NO_Caption_Control1000000192;NO_Caption_Control1000000192Lbl)
            {
            }
            column(INSTITUIONCaption_Control1000000193;INSTITUIONCaption_Control1000000193Lbl)
            {
            }
            column(INVESTMENT__DATECaption_Control1000000194;INVESTMENT__DATECaption_Control1000000194Lbl)
            {
            }
            column(MATURITY_DATECaption_Control1000000197;MATURITY_DATECaption_Control1000000197Lbl)
            {
            }
            column(AMOUNTCaption_Control1000000199;AMOUNTCaption_Control1000000199Lbl)
            {
            }
            column(INTEREST_RATE__Caption_Control1000000201;INTEREST_RATE__Caption_Control1000000201Lbl)
            {
            }
            column(DAYSCaption_Control1000000204;DAYSCaption_Control1000000204Lbl)
            {
            }
            column(ACCRUED_INTERESTCaption_Control1000000206;ACCRUED_INTERESTCaption_Control1000000206Lbl)
            {
            }
            column(VALUECaption_Control1000000208;VALUECaption_Control1000000208Lbl)
            {
            }
            column(INSTITUTION_Caption_Control1000000187;INSTITUTION_Caption_Control1000000187Lbl)
            {
            }
            column(TOTALCaption_Control1000000247;TOTALCaption_Control1000000247Lbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Investment.Get("Fixed Asset2"."No.");
                Investment.SetRange(Investment."Date Filter","Fixed Asset2"."Investment Date");
                Investment.CalcFields(Investment."Acquisition Cost");
                //MESSAGE('%1',Investment."Acquisition Cost");
                "Initial Amount":=Investment."Acquisition Cost";

                //get interest calculation date.
                "Investment Rollover1".Reset;
                "Investment Rollover1".SetRange("Investment Rollover1"."Investment No","Fixed Asset2"."No.");
                if "Investment Rollover1".FindFirst then
                "Interest Date":="Investment Rollover1"."Roll Over Date"
                else
                "Interest Date":=Investment."Maturity Date";

                Investment.Get("Fixed Asset2"."No.");
                Investment.SetRange(Investment."Date Filter","Fixed Asset2"."Investment Date","Interest Date");
                Investment.CalcFields(Investment."Gross Interest");
                //MESSAGE('%1',Investment."Gross Interest");
                "Gross Interest":=Investment."Gross Interest";


                InvestSetup.Get;
                WitholdingTax:=Round("Gross Interest"*(InvestSetup."Witholding Tax%-Fixed Deposits"/100),0.01);
                //MESSAGE('%1',WitholdingTax);

                "Net Interest":="Gross Interest"-WitholdingTax;
                //MESSAGE('%1',Amount);
            end;

            trigger OnPreDataItem()
            begin
                //LastFieldNo := FIELDNO("No.");
                //"Fixed Asset2".SETRANGE("Fixed Asset2"."Global Dimension 2 Code",SelectedFund);
                "Fixed Asset2".SetRange("Fixed Asset2".Institution,SelectedFund);
                CurrReport.CreateTotals("Fixed Asset2"."Acquisition Cost","Fixed Asset2"."Gross Interest");
            end;
        }
        dataitem("Fixed Asset3";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending) WHERE("Investment Type"=CONST('06'));
            column(Fund_Description__Control1000000231;"Fund Description")
            {
            }
            column(Fixed_Asset3__No__;"No.")
            {
            }
            column(Fixed_Asset3_Description;Description)
            {
            }
            column(Fixed_Asset3__Investment_Date_;"Investment Date")
            {
            }
            column(Fixed_Asset3__Maturity_Date_;"Maturity Date")
            {
            }
            column(Initial_Amount__Control1000000276;"Initial Amount")
            {
            }
            column(Fixed_Asset3__Rate___;"Rate %")
            {
            }
            column(Fixed_Asset3__Maturity_Period_Days_;"Maturity Period Days")
            {
            }
            column(Fixed_Asset3__Gross_Interest_;"Gross Interest")
            {
            }
            column(Fixed_Asset3___Acquisition_Cost___Fixed_Asset3___Gross_Interest_;"Fixed Asset3"."Acquisition Cost"+"Fixed Asset3"."Gross Interest")
            {
            }
            column(Fixed_Asset3__Fixed_Asset3___Acquisition_Cost_;"Fixed Asset3"."Acquisition Cost")
            {
            }
            column(Fixed_Asset3__Fixed_Asset3___Gross_Interest_;"Fixed Asset3"."Gross Interest")
            {
            }
            column(Fixed_Asset3___Acquisition_Cost___Fixed_Asset3___Gross_Interest__Control1000000295;"Fixed Asset3"."Acquisition Cost"+"Fixed Asset3"."Gross Interest")
            {
            }
            column(MONEY_MARKET_Caption_Control1000000230;MONEY_MARKET_Caption_Control1000000230Lbl)
            {
            }
            column(Treasury_BondsCaption;Treasury_BondsCaptionLbl)
            {
            }
            column(NO_Caption_Control1000000235;NO_Caption_Control1000000235Lbl)
            {
            }
            column(INSTITUIONCaption_Control1000000236;INSTITUIONCaption_Control1000000236Lbl)
            {
            }
            column(INVESTMENT__DATECaption_Control1000000237;INVESTMENT__DATECaption_Control1000000237Lbl)
            {
            }
            column(MATURITY_DATECaption_Control1000000240;MATURITY_DATECaption_Control1000000240Lbl)
            {
            }
            column(AMOUNTCaption_Control1000000242;AMOUNTCaption_Control1000000242Lbl)
            {
            }
            column(INTEREST_RATE__Caption_Control1000000244;INTEREST_RATE__Caption_Control1000000244Lbl)
            {
            }
            column(DAYSCaption_Control1000000258;DAYSCaption_Control1000000258Lbl)
            {
            }
            column(ACCRUED_INTERESTCaption_Control1000000260;ACCRUED_INTERESTCaption_Control1000000260Lbl)
            {
            }
            column(VALUECaption_Control1000000262;VALUECaption_Control1000000262Lbl)
            {
            }
            column(INSTITUTION_Caption_Control1000000229;INSTITUTION_Caption_Control1000000229Lbl)
            {
            }
            column(TOTALCaption_Control1000000287;TOTALCaption_Control1000000287Lbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Investment.Get("Fixed Asset3"."No.");
                Investment.SetRange(Investment."Date Filter","Fixed Asset3"."Investment Date");
                Investment.CalcFields(Investment."Acquisition Cost");
                //MESSAGE('%1',Investment."Acquisition Cost");
                "Initial Amount":=Investment."Acquisition Cost";

                //get interest calculation date.
                "Investment Rollover1".Reset;
                "Investment Rollover1".SetRange("Investment Rollover1"."Investment No","Fixed Asset3"."No.");
                if "Investment Rollover1".FindFirst then
                "Interest Date":="Investment Rollover1"."Roll Over Date"
                else
                "Interest Date":=Investment."Maturity Date";

                Investment.Get("Fixed Asset3"."No.");
                Investment.SetRange(Investment."Date Filter","Fixed Asset3"."Investment Date","Interest Date");
                Investment.CalcFields(Investment."Gross Interest");
                //MESSAGE('%1',Investment."Gross Interest");
                "Gross Interest":=Investment."Gross Interest";


                InvestSetup.Get;
                WitholdingTax:=Round("Gross Interest"*(InvestSetup."Witholding Tax%-Fixed Deposits"/100),0.01);
                //MESSAGE('%1',WitholdingTax);

                "Net Interest":="Gross Interest"-WitholdingTax;
                //MESSAGE('%1',Amount);
            end;

            trigger OnPreDataItem()
            begin
                //"Fixed Asset3".SETRANGE("Fixed Asset3"."Global Dimension 2 Code",SelectedFund);
                "Fixed Asset3".SetRange("Fixed Asset3".Institution,SelectedFund);
                CurrReport.CreateTotals("Fixed Asset3"."Acquisition Cost","Fixed Asset3"."Gross Interest");
            end;
        }
        dataitem("Fixed Asset4";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending) WHERE("Investment Type"=CONST('07'));
            column(Fund_Description__Control1000000312;"Fund Description")
            {
            }
            column(Fixed_Asset4__No__;"No.")
            {
            }
            column(Fixed_Asset4_Description;Description)
            {
            }
            column(Fixed_Asset4__Investment_Date_;"Investment Date")
            {
            }
            column(Fixed_Asset4__Maturity_Date_;"Maturity Date")
            {
            }
            column(Initial_Amount__Control1000000331;"Initial Amount")
            {
            }
            column(Fixed_Asset4__Rate___;"Rate %")
            {
            }
            column(Fixed_Asset4__Maturity_Period_Days_;"Maturity Period Days")
            {
            }
            column(Fixed_Asset4__Gross_Interest_;"Gross Interest")
            {
            }
            column(Fixed_Asset4___Acquisition_Cost___Fixed_Asset3___Gross_Interest_;"Fixed Asset4"."Acquisition Cost"+"Fixed Asset3"."Gross Interest")
            {
            }
            column(Fixed_Asset4__Fixed_Asset4___Acquisition_Cost_;"Fixed Asset4"."Acquisition Cost")
            {
            }
            column(Fixed_Asset4__Fixed_Asset4___Gross_Interest_;"Fixed Asset4"."Gross Interest")
            {
            }
            column(Fixed_Asset4___Acquisition_Cost___Fixed_Asset3___Gross_Interest__Control1000000349;"Fixed Asset4"."Acquisition Cost"+"Fixed Asset3"."Gross Interest")
            {
            }
            column(NO_Caption_Control1000000297;NO_Caption_Control1000000297Lbl)
            {
            }
            column(INSTITUIONCaption_Control1000000300;INSTITUIONCaption_Control1000000300Lbl)
            {
            }
            column(INVESTMENT__DATECaption_Control1000000301;INVESTMENT__DATECaption_Control1000000301Lbl)
            {
            }
            column(MATURITY_DATECaption_Control1000000303;MATURITY_DATECaption_Control1000000303Lbl)
            {
            }
            column(AMOUNTCaption_Control1000000306;AMOUNTCaption_Control1000000306Lbl)
            {
            }
            column(INTEREST_RATE__Caption_Control1000000308;INTEREST_RATE__Caption_Control1000000308Lbl)
            {
            }
            column(MONEY_MARKET_Caption_Control1000000309;MONEY_MARKET_Caption_Control1000000309Lbl)
            {
            }
            column(Commercial_PapersCaption;Commercial_PapersCaptionLbl)
            {
            }
            column(SCHEME_Caption;SCHEME_CaptionLbl)
            {
            }
            column(DAYSCaption_Control1000000314;DAYSCaption_Control1000000314Lbl)
            {
            }
            column(ACCRUED_INTERESTCaption_Control1000000316;ACCRUED_INTERESTCaption_Control1000000316Lbl)
            {
            }
            column(VALUECaption_Control1000000318;VALUECaption_Control1000000318Lbl)
            {
            }
            column(TOTALCaption_Control1000000342;TOTALCaption_Control1000000342Lbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Investment.Get("Fixed Asset4"."No.");
                Investment.SetRange(Investment."Date Filter","Fixed Asset4"."Investment Date");
                Investment.CalcFields(Investment."Acquisition Cost");
                //MESSAGE('%1',Investment."Acquisition Cost");
                "Initial Amount":=Investment."Acquisition Cost";

                //get interest calculation date.
                "Investment Rollover1".Reset;
                "Investment Rollover1".SetRange("Investment Rollover1"."Investment No","Fixed Asset4"."No.");
                if "Investment Rollover1".FindFirst then
                "Interest Date":="Investment Rollover1"."Roll Over Date"
                else
                "Interest Date":=Investment."Maturity Date";

                Investment.Get("Fixed Asset4"."No.");
                Investment.SetRange(Investment."Date Filter","Fixed Asset4"."Investment Date","Interest Date");
                Investment.CalcFields(Investment."Gross Interest");
                //MESSAGE('%1',Investment."Gross Interest");
                "Gross Interest":=Investment."Gross Interest";


                InvestSetup.Get;
                WitholdingTax:=Round("Gross Interest"*(InvestSetup."Witholding Tax%-Fixed Deposits"/100),0.01);
                //MESSAGE('%1',WitholdingTax);

                "Net Interest":="Gross Interest"-WitholdingTax;
                //MESSAGE('%1',Amount);
            end;

            trigger OnPreDataItem()
            begin
                //"Fixed Asset4".SETRANGE("Fixed Asset4"."Global Dimension 2 Code",SelectedFund);
                "Fixed Asset4".SetRange("Fixed Asset4".Institution,SelectedFund);
                CurrReport.CreateTotals("Fixed Asset4"."Acquisition Cost","Fixed Asset4"."Gross Interest");
            end;
        }
        dataitem(Customer;Customer)
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);
            column(EquityCost;EquityCost)
            {
            }
            column(MMarketCost_MMarketInterest;MMarketCost+MMarketInterest)
            {
            }
            column(TbondCost_TbondInterest;TbondCost+TbondInterest)
            {
            }
            column(EquityCost_MMarketCost_MMarketInterest_TbondCost_TbondInterest;EquityCost+MMarketCost+MMarketInterest+TbondCost+TbondInterest)
            {
            }
            column(INVESTMENT_SUMMARYCaption;INVESTMENT_SUMMARYCaptionLbl)
            {
            }
            column(ASSET_CATEGORYCaption;ASSET_CATEGORYCaptionLbl)
            {
            }
            column(VALUECaption_Control1000000357;VALUECaption_Control1000000357Lbl)
            {
            }
            column(EQUITYCaption;EQUITYCaptionLbl)
            {
            }
            column(FIXED_DEPOSITSCaption_Control1000000354;FIXED_DEPOSITSCaption_Control1000000354Lbl)
            {
            }
            column(TREASURY_BONDSCaption_Control1000000358;TREASURY_BONDSCaption_Control1000000358Lbl)
            {
            }
            column(TOTALSCaption;TOTALSCaptionLbl)
            {
            }
            column(Customer_No_;"No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                 if Institution.Get(SelectedFund) then begin

                 EquityCost:=0;

                  Investment.Reset;
                  Investment.SetRange(Investment."Asset Type",Investment."Asset Type"::Equity);
                  Investment.SetRange(Investment.Institution,SelectedFund);
                  Investment.CalcFields(Investment."Acquisition Cost");

                if Investment.Find('-') then begin
                repeat
                Investment.CalcFields(Investment."Acquisition Cost");
                EquityCost:=EquityCost+Investment."Acquisition Cost";
                //MESSAGE('%1',EquityCost);
                until Investment.Next=0;
                   end;

                  Investment.Reset;
                  Investment.SetRange(Investment."Asset Type",Investment."Asset Type"::"Money Market");
                  Investment.SetRange(Investment."Investment Type",'04');
                   Investment.SetRange(Investment.Institution,SelectedFund);
                  // Investment.SETRANGE(Investment."Global Dimension 2 Code",SelectedFund);
                  Investment.CalcFields(Investment."Acquisition Cost");

                if Investment.Find('-') then begin
                repeat
                Investment.CalcFields(Investment."Acquisition Cost");
                MMarketCost:=MMarketCost+Investment."Acquisition Cost";
                //MESSAGE('%1',EquityCost);
                until Investment.Next=0;
                   end;

                  Investment.Reset;
                  Investment.SetRange(Investment."Asset Type",Investment."Asset Type"::"Money Market");
                  Investment.SetRange(Investment."Investment Type",'04');
                  //Investment.SETRANGE(Investment."Global Dimension 2 Code",SelectedFund);
                   Investment.SetRange(Investment.Institution,SelectedFund);
                  Investment.CalcFields(Investment."Gross Interest");

                if Investment.Find('-') then begin
                repeat
                Investment.CalcFields(Investment."Acquisition Cost");
                MMarketCost:=MMarketCost+Investment."Gross Interest";
                //MESSAGE('%1',EquityCost);
                until Investment.Next=0;
                   end;


                  Investment.Reset;
                  Investment.SetRange(Investment."Asset Type",Investment."Asset Type"::"Money Market");
                  Investment.SetRange(Investment."Investment Type",'06');
                   Investment.SetRange(Investment.Institution,SelectedFund);
                  //Investment.SETRANGE(Investment."Global Dimension 2 Code",SelectedFund);
                  Investment.CalcFields(Investment."Acquisition Cost");

                if Investment.Find('-') then begin
                repeat
                Investment.CalcFields(Investment."Acquisition Cost");
                TbondCost:=TbondCost+Investment."Acquisition Cost";
                //MESSAGE('%1',EquityCost);
                until Investment.Next=0;
                   end;


                  Investment.Reset;
                  Investment.SetRange(Investment."Asset Type",Investment."Asset Type"::"Money Market");
                  Investment.SetRange(Investment."Investment Type",'06');
                   Investment.SetRange(Investment.Institution,SelectedFund);
                  //Investment.SETRANGE(Investment."Global Dimension 2 Code",SelectedFund);
                  Investment.CalcFields(Investment."Gross Interest");

                if Investment.Find('-') then begin
                repeat
                Investment.CalcFields(Investment."Acquisition Cost");
                TbondInterest:=TbondInterest+Investment."Gross Interest";
                //MESSAGE('%1',EquityCost);
                until Investment.Next=0;
                   end;


                end;
            end;

            trigger OnPreDataItem()
            begin
                // "Dimension Value".SETRANGE("Dimension Value"."Dimension Code",'FUND');
                // "Dimension Value".SETRANGE("Dimension Value".Code,SelectedFund);
                Customer.SetRange(Customer."No.",SelectedFund);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Fund Code";SelectedFund)
                {
                    TableRelation = "Fund Code";
                }
                field("Start Date";SelectedStartDate)
                {
                    TableRelation = "Custodian Code";
                }
                field("End Date";SelectedEndDate)
                {
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

    trigger OnPreReport()
    begin
         "Fund Code":=SelectedFund;

        if Institution.Get("Fund Code") then
        "Fund Description":=Institution.Name;


          //Get date range
         // "Fixed Asset"."Date Filter":=SelectedDateFilter;
          StartDate:=SelectedStartDate;
          EndDate:=SelectedEndDate;

          //StartDate:="Fixed Asset".GETRANGEMIN("Fixed Asset"."Date Filter");
         // EndDate:="Fixed Asset".GETRANGEMAX("Fixed Asset"."Date Filter");

          InvestTypeCode:="Fixed Asset".GetFilter("Fixed Asset"."Investment Type");

          if InvestTypeRec.Get(InvestTypeCode) then
          TypeofShares:=InvestTypeRec.Description;
    end;

    var
        EndDate: Date;
        StartDate: Date;
        OpeningUnits: Decimal;
        OpeningCost: Decimal;
        EquityRec: Record "Investment Asset";
        ClosingUnits: Decimal;
        ClosingValue: Decimal;
        MarketValue: Decimal;
        RevaluationSurplusDeficit: Decimal;
        TypeofShares: Text[130];
        InvestTypeRec: Record "Investment Type";
        InvestTypeCode: Code[10];
        MarketPrice: Decimal;
        InvestmentHist: Record "Investment History";
        "TotalGain/Loss": Decimal;
        "Fund Code": Code[10];
        "Fund Description": Text[100];
        Dimensions: Record "Custodian Code";
        Amount: Decimal;
        GLEntry: Record "G/L Entry";
        Investment: Record "Investment Asset";
        "Initial Amount": Decimal;
        "Gross Interest": Decimal;
        "Interest Date": Date;
        WitholdingTax: Decimal;
        "Net Interest": Decimal;
        InvestSetup: Record "Investment Setup";
        SelectedFund: Code[10];
        SelectedStartDate: Date;
        SelectedEndDate: Date;
        EquityCost: Decimal;
        Fund: Record "Fund Code";
        MMarketCost: Decimal;
        MMarketInterest: Decimal;
        TbondCost: Decimal;
        TbondInterest: Decimal;
        Institution: Record Customer;
        CompInfo: Record "Company Information";
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        INSTITUTION_CaptionLbl: Label 'INSTITUTION:';
        CostCaptionLbl: Label 'Cost';
        No_Of_SharesCaptionLbl: Label 'No.Of Shares';
        No__Of_UnitsCaptionLbl: Label 'No. Of Units';
        No__Of_SharesCaptionLbl: Label 'No. Of Shares';
        CostCaption_Control1000000031Lbl: Label 'Cost';
        AcquisitionsCaptionLbl: Label 'Acquisitions';
        DisposalsCaptionLbl: Label 'Disposals';
        Closing_BalancesCaptionLbl: Label 'Closing Balances';
        Market_ValueCaptionLbl: Label 'Market Value';
        Revaluation_CaptionLbl: Label 'Revaluation ';
        Surplus_deficitCaptionLbl: Label 'Surplus/deficit';
        Market_ValuationCaptionLbl: Label 'Market Valuation';
        Price_Per_ShareCaptionLbl: Label 'Price Per Share';
        for_the_yearCaptionLbl: Label 'for the year';
        Gain_Loss_On_DisposalCaptionLbl: Label 'Gain/Loss On Disposal';
        Dividend_ReceivedCaptionLbl: Label 'Dividend Received';
        TOTALCaptionLbl: Label 'TOTAL';
        NO_CaptionLbl: Label 'NO.';
        INSTITUIONCaptionLbl: Label 'INSTITUION';
        INVESTMENT__DATECaptionLbl: Label 'INVESTMENT  DATE';
        MATURITY_DATECaptionLbl: Label 'MATURITY DATE';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        INTEREST_RATE__CaptionLbl: Label 'INTEREST RATE %';
        DAYSCaptionLbl: Label ' DAYS';
        ACCRUED_INTERESTCaptionLbl: Label 'ACCRUED INTEREST';
        VALUECaptionLbl: Label 'VALUE';
        MONEY_MARKET_CaptionLbl: Label 'MONEY MARKET:';
        Fixed_DepositsCaptionLbl: Label 'Fixed Deposits';
        INSTITUTION_Caption_Control1000000143Lbl: Label 'INSTITUTION:';
        TOTALCaption_Control1000000141Lbl: Label 'TOTAL';
        MONEY_MARKET_Caption_Control1000000189Lbl: Label 'MONEY MARKET:';
        Treasury_BillsCaptionLbl: Label 'Treasury Bills';
        NO_Caption_Control1000000192Lbl: Label 'NO.';
        INSTITUIONCaption_Control1000000193Lbl: Label 'INSTITUION';
        INVESTMENT__DATECaption_Control1000000194Lbl: Label 'INVESTMENT  DATE';
        MATURITY_DATECaption_Control1000000197Lbl: Label 'MATURITY DATE';
        AMOUNTCaption_Control1000000199Lbl: Label 'AMOUNT';
        INTEREST_RATE__Caption_Control1000000201Lbl: Label 'INTEREST RATE %';
        DAYSCaption_Control1000000204Lbl: Label ' DAYS';
        ACCRUED_INTERESTCaption_Control1000000206Lbl: Label 'ACCRUED INTEREST';
        VALUECaption_Control1000000208Lbl: Label 'VALUE';
        INSTITUTION_Caption_Control1000000187Lbl: Label 'INSTITUTION:';
        TOTALCaption_Control1000000247Lbl: Label 'TOTAL';
        MONEY_MARKET_Caption_Control1000000230Lbl: Label 'MONEY MARKET:';
        Treasury_BondsCaptionLbl: Label 'Treasury Bonds';
        NO_Caption_Control1000000235Lbl: Label 'NO.';
        INSTITUIONCaption_Control1000000236Lbl: Label 'INSTITUION';
        INVESTMENT__DATECaption_Control1000000237Lbl: Label 'INVESTMENT  DATE';
        MATURITY_DATECaption_Control1000000240Lbl: Label 'MATURITY DATE';
        AMOUNTCaption_Control1000000242Lbl: Label 'AMOUNT';
        INTEREST_RATE__Caption_Control1000000244Lbl: Label 'INTEREST RATE %';
        DAYSCaption_Control1000000258Lbl: Label ' DAYS';
        ACCRUED_INTERESTCaption_Control1000000260Lbl: Label 'ACCRUED INTEREST';
        VALUECaption_Control1000000262Lbl: Label 'VALUE';
        INSTITUTION_Caption_Control1000000229Lbl: Label 'INSTITUTION:';
        TOTALCaption_Control1000000287Lbl: Label 'TOTAL';
        NO_Caption_Control1000000297Lbl: Label 'NO.';
        INSTITUIONCaption_Control1000000300Lbl: Label 'INSTITUION';
        INVESTMENT__DATECaption_Control1000000301Lbl: Label 'INVESTMENT  DATE';
        MATURITY_DATECaption_Control1000000303Lbl: Label 'MATURITY DATE';
        AMOUNTCaption_Control1000000306Lbl: Label 'AMOUNT';
        INTEREST_RATE__Caption_Control1000000308Lbl: Label 'INTEREST RATE %';
        MONEY_MARKET_Caption_Control1000000309Lbl: Label 'MONEY MARKET:';
        Commercial_PapersCaptionLbl: Label 'Commercial Papers';
        SCHEME_CaptionLbl: Label 'SCHEME:';
        DAYSCaption_Control1000000314Lbl: Label ' DAYS';
        ACCRUED_INTERESTCaption_Control1000000316Lbl: Label 'ACCRUED INTEREST';
        VALUECaption_Control1000000318Lbl: Label 'VALUE';
        TOTALCaption_Control1000000342Lbl: Label 'TOTAL';
        INVESTMENT_SUMMARYCaptionLbl: Label 'INVESTMENT SUMMARY';
        ASSET_CATEGORYCaptionLbl: Label 'ASSET CATEGORY';
        VALUECaption_Control1000000357Lbl: Label 'VALUE';
        EQUITYCaptionLbl: Label 'EQUITY';
        FIXED_DEPOSITSCaption_Control1000000354Lbl: Label 'FIXED DEPOSITS';
        TREASURY_BONDSCaption_Control1000000358Lbl: Label 'TREASURY BONDS';
        TOTALSCaptionLbl: Label 'TOTALS';
        Fundcode: Code[50];
        CompanyCode: Code[50];
}

