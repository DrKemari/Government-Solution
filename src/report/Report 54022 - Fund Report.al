report 54022 "Fund Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Fund Report.rdlc';

    dataset
    {
        dataitem(Dimension_Value;"Fund Code")
        {
            RequestFilterFields = "Date Filter";
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
            column(Code_New;Dimension_Value.Code)
            {
            }
            column(Name_New;Dimension_Value.Description)
            {
            }
            column(Inflows_New;Inflows)
            {
            }
            column(Outflow_New;Outflows)
            {
            }
            column(Income_DimensionValue;Dimension_Value.Income)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(CompInfo.Picture);
            end;

            trigger OnPreDataItem()
            begin
                //LastFieldNo := FIELDNO("Dimension Code");
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

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        CompInfo: Record "Company Information";
        Fund_Value_ReportCaptionLbl: Label 'Fund Value Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

