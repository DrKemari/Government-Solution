#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85023 "MPESA TRANSACTION IMPORT"
{
    Caption = 'MPESA TRANSACTION IMPORT';
    Direction = Both;
   /// Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("MPESA Integration Table";"MPESA Integration Table")
            {
                XmlName = 'ImportEntries';
                fieldelement(TransactionID;"MPESA Integration Table".MPESA_TXN_ID)
                {
                }
                fieldelement(Amount;"MPESA Integration Table".MPESA_AMOUNT)
                {
                    FieldValidate = no;
                }
                fieldelement(Date;"MPESA Integration Table".MPESA_TXN_DATE)
                {
                }
                fieldelement(AccountNo;"MPESA Integration Table".ACCOUNT_NUMBER)
                {
                }
                fieldelement("IDNo.";"MPESA Integration Table"."ID Number")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    LineNo+=1;
                end;

                trigger OnBeforeInsertRecord()
                begin
                    IntegrationTable.Reset;
                    IntegrationTable.SetRange(MPESA_TXN_ID,"MPESA Integration Table".MPESA_TXN_ID);
                    if IntegrationTable.FindFirst then begin
                      currXMLport.Skip;
                    end
                end;
            }
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

    trigger OnPostXmlPort()
    var
        TXT001: label 'Import done successfully';
    begin
        Message(TXT001);
    end;

    var
        IntegrationTable: Record "MPESA Integration Table";
        BankCode: Code[30];
        LineNo: Integer;
}

