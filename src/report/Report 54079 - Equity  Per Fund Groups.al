report 54079 "Equity  Per Fund Groups"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Equity  Per Fund Groups.rdlc';

    dataset
    {
        dataitem(Institution;Customer)
        {
            RequestFilterFields = "No.";
            column(IssueNo_MoneyMarketslistings;Institution."No.")
            {
            }
            column(Name_Institution;Institution.Name)
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
            column(GenAfricaAcquisitionCost;GenAfricaAquistionCost)
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
            column(GenAfricaCurrentValue;GenAfricaCurrentValue)
            {
            }
            column(OldMutualCurrentValue;OldMutualCurrentValue)
            {
            }
            column(TotalMarketValue;TotalCurrentValue)
            {
            }
            column(GenNoofUnit_Value;GenNoofUnit)
            {
            }
            column(OldNoofUnit_Value;OldNoofUnit)
            {
            }
            column(Start_Date;StartDate)
            {
            }
            column(End_Date;EndDate)
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
                 GenNoofUnit:=0;
                 OldNoofUnit:=0;


                 TreasuryBond.Reset;
                 TreasuryBond.SetRange("Fund Code",'GENAFRICA');
                 TreasuryBond.SetRange(Institution,Institution."No.");
                 TreasuryBond.SetRange("Asset Type",TreasuryBond."Asset Type"::Equity);
                 TreasuryBond.SetFilter("Date Filter",'..%1',EndDate);
                 if TreasuryBond.Find('-') then begin
                   repeat
                   TreasuryBond.CalcFields("Acquisition Cost","Current Value","No.Of Units");
                   GenAfricaAquistionCost:= GenAfricaAquistionCost+TreasuryBond."Acquisition Cost";
                   GenAfricaFaceValue:=GenAfricaFaceValue+TreasuryBond."Face Value";
                   GenAfricaCurrentValue:= GenAfricaCurrentValue+TreasuryBond."Current Value";
                   GenNoofUnit:= GenNoofUnit+TreasuryBond."No.Of Units";
                   until TreasuryBond.Next=0;

                end;

                 TreasuryBond.Reset;
                 TreasuryBond.SetRange("Fund Code",'OLDMUTUAL');
                 TreasuryBond.SetRange(Institution,Institution."No.");
                 TreasuryBond.SetRange("Asset Type",TreasuryBond."Asset Type"::Equity);
                 TreasuryBond.SetFilter("Date Filter",'..%1',EndDate);
                 if TreasuryBond.Find('-') then begin
                 repeat
                    TreasuryBond.CalcFields("Acquisition Cost","Current Value","No.Of Units");
                    OldMutualAquisitionValue:= OldMutualAquisitionValue+TreasuryBond."Acquisition Cost";
                    OldMutualFaceVaule:=OldMutualFaceVaule+TreasuryBond."Face Value";
                    OldMutualCurrentValue:=OldMutualCurrentValue+TreasuryBond."Current Value";
                    OldNoofUnit:= OldNoofUnit+TreasuryBond."No.Of Units";
                   until TreasuryBond.Next=0;

                end;
                TotalCurrentValue:= GenAfricaCurrentValue+ OldMutualCurrentValue;
                if TotalCurrentValue=0 then
                  CurrReport.Skip;
            end;

            trigger OnPreDataItem()
            begin
                /*IF (StartDate=0D) THEN BEGIN
                  ERROR('Please enter Start Date');
                  END;*/
                
                if (EndDate=0D) then begin
                  Error('Please enter End Date');
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
                field(StartDate;StartDate)
                {
                    Caption = 'Start Date';
                    Visible = false;
                }
                field(EndDate;EndDate)
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
        GenNoofUnit: Decimal;
        OldNoofUnit: Decimal;
}

