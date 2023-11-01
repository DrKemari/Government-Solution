#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85014 "EQUITY IMPORT"
{
    Direction = Import;
   // Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Bank Import Entries";"Bank Import Entries")
            {
                XmlName = 'ImportEntries';
                fieldelement(TransactionDate;"Bank Import Entries"."Transaction Date")
                {
                }
                fieldelement(ReferenceNo;"Bank Import Entries"."Form Serial No")
                {
                    FieldValidate = no;
                }
                fieldelement(StudentIdentifier;"Bank Import Entries"."Student Identifier")
                {
                }
                fieldelement(ExaminationCode;"Bank Import Entries"."Examination Code")
                {
                }
                fieldelement(FormSerialNo;"Bank Import Entries"."Reference No.")
                {
                }
                fieldelement(CategoryCode;"Bank Import Entries"."Category Code")
                {
                }
                fieldelement(CategoryName;"Bank Import Entries"."Category Name")
                {
                }
                fieldelement(StudentName;"Bank Import Entries"."Student Name")
                {
                }
                fieldelement(Amount;"Bank Import Entries".Amount)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    LineNo+=1;
                    "Bank Import Entries".Validate("Bank Import Entries".Amount);
                end;

                trigger OnBeforeInsertRecord()
                var
                    TXT001: label 'Bank Import for %1,is already imported';
                begin
                    //check no entries for the date
                    "Bank Import Entries"."Bank Code":=BankCode;
                    BankImportEntries.Reset;
                    //BankImportEntries.SETRANGE("Transaction Date","Bank Import Entries"."Transaction Date");ensure the reference no is unique regardless of date
                    BankImportEntries.SetRange("Reference No.","Bank Import Entries"."Reference No.");
                    BankImportEntries.SetRange("Bank Code",BankCode);
                    if BankImportEntries.FindSet then begin
                     currXMLport.Skip;
                     //ERROR(TXT001,BankImportEntries."Reference No.");
                      //EXIT;
                      end else begin
                        if LineNo<1 then
                          exit;


                        end;
                        // "Bank Import Entries"."Entry No":=LineNo+100;
                      "Bank Import Entries"."Remaining Amount":="Bank Import Entries".Amount;
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
        BankCode:=ExaminationSetup."Equity Bank";
    end;
}

