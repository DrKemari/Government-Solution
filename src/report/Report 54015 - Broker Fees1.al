report 54015 "Broker Fees1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Broker Fees1.rdlc';

    dataset
    {
        dataitem(Payments1;Payments1)
        {
            DataItemTableView = SORTING(No);
            RequestFilterFields = Broker,Date,"Custodian Code";
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
            column(Payments1_GETFILTERS;Payments1.GetFilters)
            {
            }
            column(CompInfo_Picture;CompInfo.Picture)
            {
            }
            column(Payments1_No;No)
            {
            }
            column(Payments1_Date;Date)
            {
            }
            column(Payments1_Broker;Broker)
            {
            }
            column(Payments1__Gross_Amount_;"Gross Amount")
            {
            }
            column(Payments1__Broker_Fees_;"Broker Fees")
            {
            }
            column(Payments1__Other_Charges_;"Other Charges")
            {
            }
            column(VendorName;VendorName)
            {
            }
            column(Payments1__Gross_Amount__Control1000000013;"Gross Amount")
            {
            }
            column(Payments1__Broker_Fees__Control1000000016;"Broker Fees")
            {
            }
            column(Payments1__Other_Charges__Control1000000019;"Other Charges")
            {
            }
            column(BROKER_FEESCaption;BROKER_FEESCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Payments1_NoCaption;FieldCaption(No))
            {
            }
            column(Payments1_DateCaption;FieldCaption(Date))
            {
            }
            column(Payments1_BrokerCaption;FieldCaption(Broker))
            {
            }
            column(Payments1__Gross_Amount_Caption;FieldCaption("Gross Amount"))
            {
            }
            column(Payments1__Broker_Fees_Caption;FieldCaption("Broker Fees"))
            {
            }
            column(Payments1__Other_Charges_Caption;FieldCaption("Other Charges"))
            {
            }
            column(NameCaption;NameCaptionLbl)
            {
            }
            column(TOTALCaption;TOTALCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                 CompInfo.Get;
                 CompInfo.CalcFields(CompInfo.Picture);
                  if  VendorRec.Get(Payments1.Broker) then
                 VendorName:=VendorRec.Name;
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
        VendorName: Text[120];
        VendorRec: Record Vendor;
        CompInfo: Record "Company Information";
        BROKER_FEESCaptionLbl: Label 'BROKER FEES';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NameCaptionLbl: Label 'Name';
        TOTALCaptionLbl: Label 'TOTAL';
}

