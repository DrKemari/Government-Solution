#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85024 "STUDENT UPDATE  IMPORT"
{
    Caption = 'MPESA TRANSACTION IMPORT';
    Direction = Both;
  //  Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Update Student Details";"Update Student Details")
            {
                XmlName = 'ImportEntries';
                fieldelement(RegistrationNo;"Update Student Details"."Registration No.")
                {
                }
                fieldelement(IDNo;"Update Student Details"."ID No.")
                {
                    FieldValidate = no;
                }
                fieldelement(Email;"Update Student Details".Email)
                {
                }
                fieldelement(PhoneNo;"Update Student Details"."Phone No.")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    LineNo+=1;
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

