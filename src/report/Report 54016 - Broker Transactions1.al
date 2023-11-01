report 54016 "Broker Transactions1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Broker Transactions1.rdlc';

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Broker';
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
            column(Vendor__No__;"No.")
            {
            }
            column(Vendor_Name;Name)
            {
            }
            column(BROKER_TRANSACTIONS_REPORTCaption;BROKER_TRANSACTIONS_REPORTCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(BROKER_NO_Caption;BROKER_NO_CaptionLbl)
            {
            }
            column(BROKER_NAME_Caption;BROKER_NAME_CaptionLbl)
            {
            }
            dataitem(Payments1;Payments1)
            {
                DataItemLink = Broker=FIELD("No.");
                DataItemTableView = SORTING(No) ORDER(Ascending) WHERE(Posted=CONST(true));
                column(Payments1_No;No)
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
                column(InstitutionX;InstitutionX)
                {
                }
                column(Payments1_Amount_Control1000000026;Amount)
                {
                }
                column(Payments1__Broker_Fees__Control1000000027;"Broker Fees")
                {
                }
                column(Payments1__Other_Charges__Control1000000028;"Other Charges")
                {
                }
                column(Payments1_NoCaption;FieldCaption(No))
                {
                }
                column(Payments1_DateCaption;FieldCaption(Date))
                {
                }
                column(Payments1_AmountCaption;FieldCaption(Amount))
                {
                }
                column(Payments1__Broker_Fees_Caption;FieldCaption("Broker Fees"))
                {
                }
                column(Payments1__Other_Charges_Caption;FieldCaption("Other Charges"))
                {
                }
                column(PURCHASESCaption;PURCHASESCaptionLbl)
                {
                }
                column(InstitutionCaption;InstitutionCaptionLbl)
                {
                }
                column(Receipts1_NoCaption;Receipts1.FieldCaption(No))
                {
                }
                column(Receipts1_DateCaption;Receipts1.FieldCaption(Date))
                {
                }
                column(Receipts1_AmountCaption;Receipts1.FieldCaption(Amount))
                {
                }
                column(Receipts1__Broker_Fees_Caption;Receipts1.FieldCaption("Broker Fees"))
                {
                }
                column(Receipts1__Other_Charges_Caption;Receipts1.FieldCaption("Other Charges"))
                {
                }
                column(SALESCaption;SALESCaptionLbl)
                {
                }
                column(Total_PurchasesCaption;Total_PurchasesCaptionLbl)
                {
                }
                column(InstitutionCaption_Control1000000041;InstitutionCaption_Control1000000041Lbl)
                {
                }
                column(Payments1_Broker;Broker)
                {
                }

                trigger OnAfterGetRecord()
                begin
                          if Investment.Get(Payments1."Investment No") then
                          InstitutionX:=Investment.Description;
                end;

                trigger OnPreDataItem()
                begin
                      Payments1.SetRange(Payments1.Date,StartDate,EndDate);
                     if FundCode<>''then
                     Payments1.SetRange(Payments1."Fund Code",FundCode);
                     if CustodianCode<>''then
                     Payments1.SetRange(Payments1."Custodian Code",CustodianCode);
                end;
            }
            dataitem(Receipts1;Receipts)
            {
                DataItemLink = Broker=FIELD("No.");
                DataItemTableView = SORTING(No) ORDER(Ascending) WHERE(Posted=CONST(true));
                column(Receipts1_No;No)
                {
                }
                column(Receipts1_Date;Date)
                {
                }
                column(Receipts1_Amount;Amount)
                {
                }
                column(Receipts1__Broker_Fees_;"Broker Fees")
                {
                }
                column(Receipts1__Other_Charges_;"Other Charges")
                {
                }
                column(InstitutionX_Control1000000043;InstitutionX)
                {
                }
                column(Receipts1__Other_Charges__Control1000000010;"Other Charges")
                {
                }
                column(Receipts1_Amount_Control1000000013;Amount)
                {
                }
                column(Receipts1__Broker_Fees__Control1000000020;"Broker Fees")
                {
                }
                column(Total_SalesCaption;Total_SalesCaptionLbl)
                {
                }
                column(Receipts1_Broker;Broker)
                {
                }

                trigger OnAfterGetRecord()
                begin
                          if Investment.Get(Receipts1."Investment No") then
                          InstitutionX:=Investment.Description;
                end;

                trigger OnPreDataItem()
                begin
                         Receipts1.SetRange(Receipts1.Date,StartDate,EndDate);
                     if FundCode<>''then
                     Receipts1.SetRange(Receipts1."Fund Code",FundCode);
                     if CustodianCode<>''then
                     Receipts1.SetRange(Receipts1."Custodian Code",CustodianCode);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(CompInfo.Picture);

                       //FundCode:=Vendor."Global Dimension 2 Code";
                   //MESSAGE('%1',FundCode);
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("No.");
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
                }
                field("End Date";EndDate)
                {
                }
                field("Funds Code";FundCode)
                {
                    TableRelation = "Fund Code";
                }
                field("Custodian Code";CustodianCode)
                {
                    TableRelation = "Custodian Code";
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
        // FundCode:=Vendor."Global Dimension 2 Code";
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        StartDate: Date;
        EndDate: Date;
        InstitutionX: Text[100];
        Investment: Record "Fixed Asset";
        FundCode: Code[10];
        Dimensions: Record "Dimension Value";
        CustodianCode: Code[10];
        CompInfo: Record "Company Information";
        BROKER_TRANSACTIONS_REPORTCaptionLbl: Label 'BROKER TRANSACTIONS REPORT';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        BROKER_NO_CaptionLbl: Label 'BROKER NO:';
        BROKER_NAME_CaptionLbl: Label 'BROKER NAME:';
        PURCHASESCaptionLbl: Label 'PURCHASES';
        InstitutionCaptionLbl: Label 'Institution';
        SALESCaptionLbl: Label 'SALES';
        Total_PurchasesCaptionLbl: Label 'Total Purchases';
        InstitutionCaption_Control1000000041Lbl: Label 'Institution';
        Total_SalesCaptionLbl: Label 'Total Sales';
        FundsC: Code[50];
        CustodianC: Code[50];
}

