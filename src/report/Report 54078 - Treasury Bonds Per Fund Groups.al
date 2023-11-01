report 54078 "Treasury Bonds Per Fund Groups"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Treasury Bonds Per Fund Groups.rdlc';

    dataset
    {
        dataitem("Money Markets listings";"Money Markets listings")
        {
            column(IssueNo_MoneyMarketslistings;"Money Markets listings"."Issue No")
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
            column(CompInfo_Picture;CompInfo.Picture)
            {
            }
            column(GenAfricaAcquisitionCost;OldMutualAquisitionValue)
            {
            }
            column(GenAfricaFaceValue;GenAfricaFaceValue)
            {
            }
            column(OldMutualAquisitionCost;OldMutualAquisitionValue)
            {
            }
            column(OldMutuaFaceValue;OldMutualFaceVaule)
            {
            }
            column(Scheme_GenAfrica;Scheme_GenAfrica)
            {
            }
            column(Schene_Oldmutual;Scheme_oldmutual)
            {
            }
            column(IssueDate_MoneyMarketslistings;"Money Markets listings"."Issue Date")
            {
            }
            column(MaturityDate_MoneyMarketslistings;"Money Markets listings"."Maturity Date")
            {
            }
            column(CouponRate_MoneyMarketslistings;"Money Markets listings"."Coupon Rate")
            {
            }
            column(GenAfricaCurrentValue;GenAfricaCurrentValue)
            {
            }
            column(OldMutualCurrentValue;OldMutualCurrentValue)
            {
            }
            column(TotalMarketValue;TotalCurrentValue)
            {
            }

            trigger OnAfterGetRecord()
            begin
                 GenAfricaAquistionCost:=0;
                 GenAfricaFaceValue:=0;
                 GenAfricaCurrentValue:=0;
                 OldMutualAquisitionValue:=0;
                 OldMutualFaceVaule:=0;
                 OldMutualCurrentValue:=0;
                 TotalCurrentValue:=0;


                 TreasuryBond.Reset;
                 TreasuryBond.SetRange("Fund Code",'GENAFRICA');
                 TreasuryBond.SetRange("FDR Number","Money Markets listings"."Issue No");
                 TreasuryBond.SetFilter("Date Filter",'..%1',EndDate);
                 if TreasuryBond.Find('-') then begin
                   repeat
                   TreasuryBond.CalcFields("Acquisition Cost","Current Value");
                   GenAfricaAquistionCost:= GenAfricaAquistionCost+TreasuryBond."Acquisition Cost";
                   GenAfricaFaceValue:=GenAfricaFaceValue+TreasuryBond."Face Value";
                   GenAfricaCurrentValue:= GenAfricaCurrentValue+TreasuryBond."Current Value";
                   until TreasuryBond.Next=0;
                end;

                 TreasuryBond.Reset;
                 TreasuryBond.SetRange("Fund Code",'OLDMUTUAL');
                 TreasuryBond.SetRange("FDR Number","Money Markets listings"."Issue No");
                 if TreasuryBond.Find('-') then begin
                 repeat
                    TreasuryBond.CalcFields("Acquisition Cost","Current Value");
                    OldMutualAquisitionValue:= OldMutualAquisitionValue+TreasuryBond."Acquisition Cost";
                    OldMutualFaceVaule:=OldMutualFaceVaule+TreasuryBond."Face Value";
                    OldMutualCurrentValue:=OldMutualCurrentValue+TreasuryBond."Current Value";
                   until TreasuryBond.Next=0;
                end;

                TotalCurrentValue:= GenAfricaCurrentValue+ OldMutualCurrentValue;
            end;

            trigger OnPreDataItem()
            begin
                /*  StartDate:=010100D;
                  END;*/
                  if EndDate=0D then begin
                 EndDate:=Today;
                  end;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date";StartDate)
                {
                    Visible = false;
                }
                field("End Date";EndDate)
                {
                    Caption = 'As At';
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
         CompInfo.Get;
         CompInfo.CalcFields(CompInfo.Picture);
         CompName:=CompInfo.Name;
    end;

    var
        CompInfo: Record "Company Information";
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        SCHEME_CaptionLbl: Label 'SCHEME:';
        Total_CostCaptionLbl: Label 'Total Cost';
        Closing_BalancesCaptionLbl: Label 'Closing Balances';
        No_Of_SharesCaptionLbl: Label 'No.Of Shares';
        Surplus_Deficit_____CaptionLbl: Label 'Surplus/Deficit     ';
        Market_ValueCaptionLbl: Label 'Market Value';
        TOTALCaptionLbl: Label 'TOTAL';
        CompName: Code[50];
        TreasuryBond: Record "Investment Asset";
        GenAfricaAquistionCost: Decimal;
        GenAfricaFaceValue: Decimal;
        OldMutualAquisitionValue: Decimal;
        OldMutualFaceVaule: Decimal;
        Scheme_oldmutual: Label 'Old Mutual';
        Scheme_GenAfrica: Label 'GenAfrica';
        GenAfricaCurrentValue: Decimal;
        OldMutualCurrentValue: Decimal;
        TotalCurrentValue: Decimal;
        StartDate: Date;
        EndDate: Date;
}

