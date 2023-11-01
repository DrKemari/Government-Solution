#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85025 "Insitution Student Import"
{
    Direction = Import;
    //Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Receipt Lines1";"Receipt Lines1")
            {
                XmlName = 'ImportEntries';
                fieldelement(Type;"Receipt Lines1"."Account Type")
                {
                }
                fieldelement(CustomerNo;"Receipt Lines1"."Account No.")
                {
                }
                fieldelement(Amount;"Receipt Lines1".Amount)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    //"Receipt Lines1".VALIDATE("Receipt Lines1"."Registration No.");
                    LineNo:="Receipt Lines1"."Line No";
                end;

                trigger OnBeforeInsertRecord()
                var
                    TXT001: label 'Bank Import for %1,is already imported';
                begin
                    //check if registration exists
                    "Receipt Lines1"."Account Type":="Receipt Lines1"."account type"::Customer;
                    "Receipt Lines1"."Receipt No.":=ReceiptNo;
                    "Receipt Lines1"."Line No":=LineNo+1;
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

    var
        BankImportEntries: Record "Bank Import Entries";
        ReceiptNo: Code[30];
        LineNo: Integer;

    procedure GetVariables(ReceiptsHeader1: Record "Receipts Header1") ReceiptHeader: Code[30]
    var
        ExaminationSetup: Record "Examination Setup";
    begin
        ReceiptNo:=ReceiptsHeader1."No.";
    end;
}

