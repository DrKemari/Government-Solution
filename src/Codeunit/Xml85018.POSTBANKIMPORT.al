#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85018 "POSTBANK IMPORT"
{
    Direction = Import;
    //  Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Bank Import Entries"; "Bank Import Entries")
            {
                XmlName = 'ImportEntries';
                fieldelement(TransactionNo; "Bank Import Entries"."Reference No.")
                {
                }
                fieldelement(AccountNo; "Bank Import Entries"."Registration No")
                {
                    FieldValidate = no;
                }
                fieldelement(TransactionDate; "Bank Import Entries"."Transaction Date")
                {
                }
                fieldelement(Branch; "Bank Import Entries".Branch)
                {
                }
                fieldelement(TransactionType; "Bank Import Entries".Details)
                {
                }
                fieldelement(Reference; "Bank Import Entries"."Student Identifier")
                {
                }
                fieldelement(Amount; "Bank Import Entries".Amount)
                {
                }
                fieldelement(PayerName; "Bank Import Entries"."Student Name")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    LineNo += 1;
                end;

                trigger OnBeforeInsertRecord()
                begin
                    //check no entries for the date
                    "Bank Import Entries"."Bank Code" := BankCode;
                    BankImportEntries.Reset;
                    BankImportEntries.SetRange("Transaction Date", "Bank Import Entries"."Transaction Date");
                    BankImportEntries.SetRange("Reference No.", "Bank Import Entries"."Reference No.");
                    BankImportEntries.SetRange("Bank Code", BankCode);
                    if BankImportEntries.FindSet then begin
                        // currXMLport.SKIP;
                        Error('BANK ENTRIES EXIST', BankImportEntries."Bank Code");
                        exit;
                    end else begin
                        if LineNo < 1 then
                            exit;


                    end;

                    "Bank Import Entries"."Remaining Amount" := "Bank Import Entries".Amount;
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
        BankCode: Code[30];
        LineNo: Integer;

    procedure GetVariables(BankAccount: Record "Bank Import Entries") UniversityCodes: Code[30]
    var
        ExaminationSetup: Record "Examination Setup";
    begin
        ExaminationSetup.Get;
        ExaminationSetup.TestField("Postbank Code");
        BankCode := ExaminationSetup."Postbank Code";
    end;
}

