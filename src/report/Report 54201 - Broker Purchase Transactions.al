report 54201 "Broker Purchase Transactions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Broker Purchase Transactions.rdlc';

    dataset
    {
        dataitem(Payments1;Payments1)
        {
            column(Payments1_No;No)
            {
            }
            column(Payments1_Institution;Institution)
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
            column(Payments1_Amount_Control1000000013;Amount)
            {
            }
            column(Payments1__Broker_Fees__Control1000000014;"Broker Fees")
            {
            }
            column(Payments1__Other_Charges__Control1000000015;"Other Charges")
            {
            }
            column(Payments1_NoCaption;FieldCaption(No))
            {
            }
            column(Payments1_InstitutionCaption;FieldCaption(Institution))
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
            column(TotalCaption;TotalCaptionLbl)
            {
            }

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(Payments1.Amount,Payments1."Broker Fees",Payments1."Other Charges");
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
        TotalCaptionLbl: Label 'Total';
}

