report 54021 "Investment Transactions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Investment Transactions.rdlc';

    dataset
    {
        dataitem("Custodian Code";"Custodian Code")
        {
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
            column(CompInfo_Picture;CompInfo.Picture)
            {
            }
            column(Dimension_Value_Name;"Custodian Code".Description)
            {
            }
            column(Dimension_Value_Code;Code)
            {
            }
            column(Fund_Value_ReportCaption;Fund_Value_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(FUND_NAME_Caption;FUND_NAME_CaptionLbl)
            {
            }
            column(CODE_Caption;CODE_CaptionLbl)
            {
            }
            column(Dimension_Value_Dimension_Code;"Custodian Code".Code)
            {
            }
            dataitem(Payments1;Payments1)
            {
                DataItemLink = "Fund Code"=FIELD(Code);
                DataItemTableView = SORTING(No) ORDER(Ascending) WHERE(Posted=CONST(true));
                column(Payments1_No;No)
                {
                }
                column(InstitutionX;InstitutionX)
                {
                }
                column(Payments1_Date;Date)
                {
                }
                column(Payments1_Amount;Amount)
                {
                }
                column(Payments1__Broker_Fees_;"Broker Fees")
                {
                }
                column(Payments1__Other_Charges_;"Other Charges")
                {
                }
                column(Payments1_Amount_Control1000000033;Amount)
                {
                }
                column(Payments1__Broker_Fees__Control1000000035;"Broker Fees")
                {
                }
                column(Payments1__Other_Charges__Control1000000036;"Other Charges")
                {
                }
                column(PURCHASESCaption;PURCHASESCaptionLbl)
                {
                }
                column(No_Caption;No_CaptionLbl)
                {
                }
                column(InstitutionCaption;InstitutionCaptionLbl)
                {
                }
                column(DateCaption;DateCaptionLbl)
                {
                }
                column(AmountCaption;AmountCaptionLbl)
                {
                }
                column(Broker_FeesCaption;Broker_FeesCaptionLbl)
                {
                }
                column(Other_ChargesCaption;Other_ChargesCaptionLbl)
                {
                }
                column(Total_PurchasesCaption;Total_PurchasesCaptionLbl)
                {
                }
                column(Payments1_Fund_Code;"Fund Code")
                {
                }

                trigger OnAfterGetRecord()
                begin

                          if Investment.Get(Payments1.Institution) then
                          InstitutionX:=Investment.Name;
                end;

                trigger OnPreDataItem()
                begin
                         if CustodianCode<>''then
                          Payments1.SetRange(Payments1."Custodian Code",CustodianCode);
                end;
            }
            dataitem(Receipts1;Receipts)
            {
                DataItemLink = "Fund Code"=FIELD(Code);
                DataItemTableView = SORTING(No) ORDER(Ascending) WHERE(Posted=CONST(true));
                column(Receipts1__Other_Charges_;"Other Charges")
                {
                }
                column(Receipts1__Broker_Fees_;"Broker Fees")
                {
                }
                column(Receipts1_Amount;Amount)
                {
                }
                column(Receipts1_Date;Date)
                {
                }
                column(InstitutionX_Control1000000048;InstitutionX)
                {
                }
                column(Receipts1_No;No)
                {
                }
                column(Receipts1_Amount_Control1000000050;Amount)
                {
                }
                column(Receipts1__Broker_Fees__Control1000000051;"Broker Fees")
                {
                }
                column(Receipts1__Other_Charges__Control1000000052;"Other Charges")
                {
                }
                column(Other_ChargesCaption_Control1000000037;Other_ChargesCaption_Control1000000037Lbl)
                {
                }
                column(Broker_FeesCaption_Control1000000038;Broker_FeesCaption_Control1000000038Lbl)
                {
                }
                column(AmountCaption_Control1000000039;AmountCaption_Control1000000039Lbl)
                {
                }
                column(DateCaption_Control1000000040;DateCaption_Control1000000040Lbl)
                {
                }
                column(InstitutionCaption_Control1000000041;InstitutionCaption_Control1000000041Lbl)
                {
                }
                column(No_Caption_Control1000000042;No_Caption_Control1000000042Lbl)
                {
                }
                column(SALESCaption;SALESCaptionLbl)
                {
                }
                column(Total_SalesCaption;Total_SalesCaptionLbl)
                {
                }
                column(Receipts1_Branch_Code;"Custodian Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                          if Investment.Get(Payments1.Institution) then
                          InstitutionX:=Investment.Name;
                end;

                trigger OnPreDataItem()
                begin
                         if CustodianCode<>''then
                          Receipts1.SetRange(Receipts1."Custodian Code",CustodianCode);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(CompInfo.Picture);
            end;

            trigger OnPostDataItem()
            begin
                            //TotalOpening:=TotalOpening+
            end;

            trigger OnPreDataItem()
            begin
                 /*IF FundCode<>'' THEN BEGIN
                 "Dimension Value".SETRANGE("Dimension Value"."Dimension Code",'FUND');
                 "Dimension Value".SETRANGE("Dimension Value".Code,FundCode);
                END;
                LastFieldNo := FIELDNO("Dimension Code");
                */

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
         // StartDate:="Dimension Value".GETRANGEMIN("Dimension Value"."Date Filter");
          // EndDate:="Dimension Value".GETRANGEMAX("Dimension Value"."Date Filter");
          //EndDate:="Dimension Value".GETRANGEMAX("Dimension Code"."Date Filter");
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        StartDate: Date;
        EndDate: Date;
        "Opening Balance": Decimal;
        FundCode: Code[10];
        Dimensions: Record "Dimension Value";
        Investment: Record Customer;
        InstitutionX: Text[100];
        CustodianCode: Code[10];
        CompInfo: Record "Company Information";
        Fund_Value_ReportCaptionLbl: Label 'Fund Value Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        FUND_NAME_CaptionLbl: Label 'FUND NAME:';
        CODE_CaptionLbl: Label 'CODE:';
        PURCHASESCaptionLbl: Label 'PURCHASES';
        No_CaptionLbl: Label 'No.';
        InstitutionCaptionLbl: Label 'Institution';
        DateCaptionLbl: Label 'Date';
        AmountCaptionLbl: Label 'Amount';
        Broker_FeesCaptionLbl: Label 'Broker Fees';
        Other_ChargesCaptionLbl: Label 'Other Charges';
        Total_PurchasesCaptionLbl: Label 'Total Purchases';
        Other_ChargesCaption_Control1000000037Lbl: Label 'Other Charges';
        Broker_FeesCaption_Control1000000038Lbl: Label 'Broker Fees';
        AmountCaption_Control1000000039Lbl: Label 'Amount';
        DateCaption_Control1000000040Lbl: Label 'Date';
        InstitutionCaption_Control1000000041Lbl: Label 'Institution';
        No_Caption_Control1000000042Lbl: Label 'No.';
        SALESCaptionLbl: Label 'SALES';
        Total_SalesCaptionLbl: Label 'Total Sales';
}

