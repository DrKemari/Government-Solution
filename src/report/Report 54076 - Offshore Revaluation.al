report 54076 "Offshore Revaluation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Offshore Revaluation.rdlc';

    dataset
    {
        dataitem("Fixed Asset";"Investment Asset")
        {
            DataItemTableView = SORTING("No.") WHERE("Asset Type"=CONST(Equity),Offshore=CONST(true));
            RequestFilterFields = "Date Filter","Fund Code","Custodian Code",Broker;
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
            column(STRSUBSTNO__REVALUATION_OF__OFFSHORE__INVESTMENTS_AS_AT___1___EndDate_;StrSubstNo('REVALUATION OF  OFFSHORE  INVESTMENTS AS AT  %1', EndDate))
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
            column(Fixed_Asset_Description;Description)
            {
            }
            column(RevaluationSurplusDeficit;RevaluationSurplusDeficit)
            {
            }
            column(ClosingBal;ClosingBal)
            {
            }
            column(ClosingUnits;ClosingUnits)
            {
                DecimalPlaces = 0:0;
            }
            column(MarketValue;MarketValue)
            {
            }
            column(ClosingBal_Control1000000015;ClosingBal)
            {
            }
            column(RevaluationSurplusDeficit_Control1000000042;RevaluationSurplusDeficit)
            {
            }
            column(MarketValue_Control1000000044;MarketValue)
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
            column(Total_CostCaption;Total_CostCaptionLbl)
            {
            }
            column(Closing_BalancesCaption;Closing_BalancesCaptionLbl)
            {
            }
            column(No_Of_SharesCaption;No_Of_SharesCaptionLbl)
            {
            }
            column(Surplus_Deficit_____Caption;Surplus_Deficit_____CaptionLbl)
            {
            }
            column(Market_ValueCaption;Market_ValueCaptionLbl)
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
                    if EquityRec.Get("Fixed Asset"."No.") then
                   begin
                    EquityRec.SetRange(EquityRec."Date Filter",0D,StartDate-1);
                    EquityRec.CalcFields(EquityRec."No.Of Units",EquityRec."Current Value",Cost);
                    OpeningUnits:=EquityRec."No.Of Units";
                    OpeningCost:=EquityRec.Cost;
                  end;
                
                
                
                
                   if EquityRec.Get("Fixed Asset"."No.") then
                   begin
                    EquityRec.SetRange(EquityRec."Date Filter",0D,20101231D);
                    EquityRec.CalcFields(EquityRec."No.Of Units",EquityRec."Current Value",Cost,EquityRec.Revaluations);
                    ClosingUnits:=EquityRec."No.Of Units";
                    ClosingValue:=EquityRec.Cost;
                
                     //Calculation of Closing Units & Closing Value
                    ClosingUnits:=OpeningUnits + "Fixed Asset"."Acq. No. shares" + "Fixed Asset"."Bonus Units"
                     - "Fixed Asset"."Disposal No. of Units";
                
                    ClosingValue:=OpeningCost + "Fixed Asset".Additions
                    - "Fixed Asset"."Disposal Value";
                
                
                   // MarketValue:=EquityRec."Current Value";
                    RevaluationSurplusDeficit:=EquityRec.Revaluations;
                  end;
                MarketPrice:=0;
                InvestmentHist.Reset;
                InvestmentHist.SetRange(InvestmentHist.No,"Fixed Asset"."No.");
                InvestmentHist.SetRange(InvestmentHist.Date,0D,"Fixed Asset".GetRangeMax("Fixed Asset"."Date Filter"));
                if InvestmentHist.Find('-') then
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
                Receipts1.SetRange(Receipts1."Investment No","Fixed Asset"."No.");
                if Receipts1.Find('-') then begin
                DisposalCost:=Receipts1.Amount;
                Shares:=Receipts1."No. Of Units";
                if DisposalCost>0 then begin
                if Shares>0 then begin
                PricePerShare:=DisposalCost/Shares;
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
                ClosingBal:=OpeningCost+Additions;
                //message('%1',ClosingBal);
                
                if(ClosingBal<=0) or (ClosingUnits<=0) then
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
                  "Fixed Asset"."Disposal No. of Units","Fixed Asset".Additions);
                  CurrReport.CreateTotals(PricePerShare,MarketValue,ClosingBal);
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
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        SCHEME_CaptionLbl: Label 'SCHEME:';
        Total_CostCaptionLbl: Label 'Total Cost';
        Closing_BalancesCaptionLbl: Label 'Closing Balances';
        No_Of_SharesCaptionLbl: Label 'No.Of Shares';
        Surplus_Deficit_____CaptionLbl: Label 'Surplus/Deficit     ';
        Market_ValueCaptionLbl: Label 'Market Value';
        TOTALCaptionLbl: Label 'TOTAL';
}

