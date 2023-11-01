report 54202 "Equities Transactions Per Fund"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Equities Transactions Per Fund.rdlc';

    dataset
    {
        dataitem("Fixed Asset";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") WHERE("Asset Type"=CONST(Equity),Offshore=CONST(false));
            RequestFilterFields = "Date Filter",Broker,"Fund Code","Custodian Code","Investment Posting Group";
            RequestFilterHeading = 'Equities';
            column(FORMAT_TODAY_0_4_;Format(Today,0,4))
            {
            }
            column(CompName;CompName)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            column(USERID;UserId)
            {
            }
            column(STRSUBSTNO__EQUITY_TRANSACTIONS__INVESTMENTS_AS_AT___1___EndDate_;StrSubstNo('EQUITY TRANSACTIONS  INVESTMENTS AS AT  %1', EndDate))
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
            column(DisposalCost;DisposalCost)
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
            column(ClosingBal;ClosingBal)
            {
            }
            column(ClosingUnits_MarketPrice;ClosingUnits*MarketPrice)
            {
            }
            column(MarketPrice;MarketPrice)
            {
            }
            column(PricePerShare;PricePerShare)
            {
            }
            column(PricePerShare2;PricePerShare2)
            {
                DecimalPlaces = 1:2;
            }
            column(AVG;AVG)
            {
            }
            column(Fixed_Asset__Bonus_Units_;"Bonus Units")
            {
            }
            column(Fixed_Asset__Share_Split_;"Share Split")
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
            column(DisposalValue;DisposalValue)
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
            column(ClosingBal_Control1000000095;ClosingBal)
            {
            }
            column(MarketValue;MarketValue)
            {
            }
            column(PricePerShare_Control1000000037;PricePerShare)
            {
            }
            column(PricePerShare_Control1000000023;PricePerShare)
            {
                DecimalPlaces = 1:2;
            }
            column(Fixed_Asset__Bonus_Units__Control1000000025;"Bonus Units")
            {
            }
            column(Fixed_Asset__Share_Split__Control1000000117;"Share Split")
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(SCHEME_Caption;SCHEME_CaptionLbl)
            {
            }
            column(Fixed_Asset_DescriptionCaption;FieldCaption(Description))
            {
            }
            column(CostCaption;CostCaptionLbl)
            {
            }
            column(Disposal_ValueCaption;Disposal_ValueCaptionLbl)
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
            column(Market_ValueCaption;Market_ValueCaptionLbl)
            {
            }
            column(Price__Per_ShareCaption;Price__Per_ShareCaptionLbl)
            {
            }
            column(AcquisitionsCaption;AcquisitionsCaptionLbl)
            {
            }
            column(Closing_BalancesCaption;Closing_BalancesCaptionLbl)
            {
            }
            column(Market_ValuationCaption;Market_ValuationCaptionLbl)
            {
            }
            column(No_Of_SharesCaption;No_Of_SharesCaptionLbl)
            {
            }
            column(Acq_CostCaption;Acq_CostCaptionLbl)
            {
            }
            column(Disposal_CostCaption;Disposal_CostCaptionLbl)
            {
            }
            column(Average_CostCaption;Average_CostCaptionLbl)
            {
            }
            column(Fixed_Asset__Bonus_Units_Caption;FieldCaption("Bonus Units"))
            {
            }
            column(DisposalsCaption;DisposalsCaptionLbl)
            {
            }
            column(Fixed_Asset__Share_Split_Caption;FieldCaption("Share Split"))
            {
            }
            column(TOTALCaption;TOTALCaptionLbl)
            {
            }
            column(Fixed_Asset_No_;"No.")
            {
            }
            column(FundCode_FixedAsset;"Fixed Asset"."Fund Code")
            {
            }
            column(CustodianCode_FixedAsset;"Fixed Asset"."Custodian Code")
            {
            }
            column(Funds_CodeCaption;Funds_CodeCaption)
            {
            }
            column(Current_Value;CurrentValue)
            {
            }
            column(MarketPrice_New;MarketPriceNew)
            {
            }
            column(StartDate_filter;StartDate)
            {
            }
            column(Enddate_filter;EndDate)
            {
            }
            column(Period_Filter_CaptionLBL;Period_Filter_CaptionLBL)
            {
            }

            trigger OnAfterGetRecord()
            begin
                DisposalCost:=0;
                ClosingBal:=0;
                ClosingUnits:=0;
                DisposalValue:=0;
                PricePerShare2:=0;
                PricePerShare:=0;
                CurrentValue:=0;
                MarketPriceNew:=0;
                
                        if EquityRec.Get("Fixed Asset"."No.") then
                   begin
                    EquityRec.SetRange(EquityRec."Date Filter",0D,StartDate-1);
                    EquityRec.CalcFields(EquityRec."No.Of Units",EquityRec."Current Value",Cost);
                    OpeningUnits:=EquityRec."No.Of Units";
                    OpeningCost:=EquityRec.Cost;
                    CurrentValue:=EquityRec."Current Value";
                    if not (ClosingUnits=0) then
                    MarketPriceNew:=Round(CurrentValue/ClosingUnits,0.01,'>');
                   // MarketPriceNew:=CurrentValue/
                  end;
                        if EquityRec.Get("Fixed Asset"."No.") then
                   begin
                    EquityRec.SetRange(EquityRec."Date Filter",0D,EndDate+1);
                    EquityRec.CalcFields(EquityRec."No.Of Units",EquityRec."Current Value",Cost);
                    //closingbal:=EquityRec."No.Of Units";
                    ClosingBal:=EquityRec.Cost;
                    CurrentValue:=EquityRec."Current Value";
                    if not (ClosingUnits=0) then
                    MarketPriceNew:=Round(CurrentValue/ClosingUnits,0.01,'>');
                  end;
                
                
                
                
                   if EquityRec.Get("Fixed Asset"."No.") then
                   begin
                    EquityRec.SetRange(EquityRec."Date Filter",0D,EndDate);
                    EquityRec.CalcFields(EquityRec."No.Of Units",EquityRec."Current Value",Cost,EquityRec.Revaluations);
                    ClosingUnits:=EquityRec."No.Of Units";
                    ClosingValue:=EquityRec.Cost;
                     //Calculation of Closing Units & Closing Value
                    ClosingUnits:=OpeningUnits + "Fixed Asset"."Acq. No. shares" + "Fixed Asset"."Bonus Units"
                     - "Fixed Asset"."Disposal No. of Units"+"Share Split";
                
                    ClosingValue:=OpeningCost + "Fixed Asset".Additions
                    - "Fixed Asset"."Disposal Value";
                
                
                   // MarketValue:=EquityRec."Current Value";
                    RevaluationSurplusDeficit:=EquityRec.Revaluations;
                    CurrentValue:=EquityRec."Current Value";
                    if not (ClosingUnits=0) then
                    MarketPriceNew:=Round(CurrentValue/ClosingUnits,0.01,'>');
                
                  end;
                MarketPrice:=0;
                InvestmentHist.Reset;
                InvestmentHist.SetRange(InvestmentHist.No,"Fixed Asset"."No.");
                InvestmentHist.SetRange(InvestmentHist.Date,0D,"Fixed Asset".GetRangeMax("Fixed Asset"."Date Filter"));
                if InvestmentHist.FindLast then
                MarketPrice:=InvestmentHist."Current Market Value";
                MarketValue:=MarketValue+(ClosingUnits*MarketPrice);
                
                //Acquisition Cost Population
                
                if "Fixed Asset"."Acq. No. shares">0 then begin
                if "Fixed Asset".Additions>0 then begin
                PricePerShare:="Fixed Asset".Additions/"Fixed Asset"."Acq. No. shares";
                end;
                end;
                /*GL.SETRANGE(GL."Investment Code","Fixed Asset"."No.");
                IF GL.FIND('-') THEN BEGIN
                NoOfUnits:=GL."No. Of Units";
                MESSAGE('%1',NoOfUnits);
                END;*/
                
                //Disposal Cost Population
                /*IF "Fixed Asset"."Disposal Value">0 THEN BEGIN
                IF "Fixed Asset"."Disposal No. of Units">0 THEN BEGIN
                DispCost:="Fixed Asset"."Disposal Value"/"Fixed Asset"."Disposal No. of Units";
                //MESSAGE('%1',DispCost);
                END;
                END;*/
                //Disposals Calculation
                Receipts1.SetRange(Receipts1."Date Posted",StartDate);
                Receipts1.SetRange(Receipts1."Investment No","Fixed Asset"."No.");
                if Receipts1.Find('-') then begin
                DisposalCost:=Receipts1.Amount;
                Shares:=Receipts1."No. Of Units";
                if DisposalCost>0 then begin
                if Shares>0 then begin
                PricePerShare2:=DisposalCost/Shares;
                //MESSAGE('%1',PricePerShare);
                end;
                end;
                //MESSAGE('%1',PricePerShare);
                /*IF DisposalCost>0 THEN BEGIN
                IF Shares>0 THEN BEGIN
                DisposalCost:=DisposalCost;
                Shares:=Shares;
                //MESSAGE('%1',DisposalCost);
                //MESSAGE('%1',Shares);
                END;
                END;*/
                
                end;
                //ClosingBal:=0;
                //ClosingBal:=PricePerShare*ClosingUnits;
                //message('%1',ClosingBal);
                
                if (ClosingBal=0) or (ClosingUnits=0) then
                AVG:=0
                else
                AVG:=ClosingBal/ClosingUnits;
                //message('%1',AVG);

            end;

            trigger OnPreDataItem()
            begin
                  CurrReport.CreateTotals(OpeningUnits,ClosingUnits,OpeningCost,ClosingValue,MarketValue,RevaluationSurplusDeficit,
                  "Acq. No. shares","Fixed Asset"."Acquisition Cost","Fixed Asset"."Disposal Value","Fixed Asset".Revaluations
                    );

                  CurrReport.CreateTotals("Fixed Asset"."Bonus Units","Fixed Asset"."Share Split",
                  "Fixed Asset"."Disposal No. of Units","Fixed Asset".Additions,ClosingBal);
                  CurrReport.CreateTotals(PricePerShare);
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
         CompInfo.Get;
         CompInfo.CalcFields(CompInfo.Picture);
         CompName:=CompInfo.Name;

        "Fund Code":="Fixed Asset"."Fund Code";

        if Dimensions.Get("Fund Code") then
        "Fund Description":=Dimensions.Description;


          StartDate:="Fixed Asset".GetRangeMin("Fixed Asset"."Date Filter");
          EndDate:="Fixed Asset".GetRangeMax("Fixed Asset"."Date Filter");

          InvestTypeCode:="Fixed Asset".GetFilter("Fixed Asset"."Investment Type");

          if InvestTypeRec.Get(InvestTypeCode) then
          TypeofShares:=InvestTypeRec.Description;
    end;

    var
        DisposalCost: Decimal;
        AVG: Decimal;
        Shares: Decimal;
        ClosingBal: Decimal;
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
        Dimensions: Record "Fund Code";
        CompInfo: Record "Company Information";
        CompName: Text[100];
        Payments1: Record Payments1;
        PricePerShare: Decimal;
        Receipts1: Record Receipts;
        DispCost: Decimal;
        DisposalValue: Decimal;
        Amount: Decimal;
        NoOfUnits: Decimal;
        GL: Record "G/L Entry";
        PricePerShare2: Decimal;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        SCHEME_CaptionLbl: Label 'SCHEME:';
        CostCaptionLbl: Label 'Cost';
        Disposal_ValueCaptionLbl: Label 'Disposal Value';
        No__Of_UnitsCaptionLbl: Label 'No. Of Units';
        No__Of_SharesCaptionLbl: Label 'No. Of Shares';
        CostCaption_Control1000000031Lbl: Label 'Cost';
        Market_ValueCaptionLbl: Label 'Market Value';
        Price__Per_ShareCaptionLbl: Label 'Price  Per Share';
        AcquisitionsCaptionLbl: Label 'Acquisitions';
        Closing_BalancesCaptionLbl: Label 'Closing Balances';
        Market_ValuationCaptionLbl: Label 'Market Valuation';
        No_Of_SharesCaptionLbl: Label 'No.Of Shares';
        Acq_CostCaptionLbl: Label 'Acq Cost';
        Disposal_CostCaptionLbl: Label 'Disposal Cost';
        Average_CostCaptionLbl: Label 'Average Cost';
        DisposalsCaptionLbl: Label 'Disposals';
        TOTALCaptionLbl: Label 'TOTAL';
        Funds_CodeCaption: Label 'Funds Code';
        CurrentValue: Decimal;
        MarketPriceNew: Decimal;
        Period_Filter_CaptionLBL: Label 'Period Filter:';
}

