report 85135 "Double Entry Revenuie"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Double Entry Revenuie.rdlc';

    dataset
    {
        dataitem(Bank;"G/L Entry")
        {
            RequestFilterFields = "G/L Account No.","Posting Date";
            column(DocumentNo_Bank;Bank."Document No.")
            {
            }
            column(Amount_Bank;Bank.Amount)
            {
            }
            dataitem("Bank Account";"Bank Account")
            {
                column(BankAccountNo_Import;"Bank Account"."No.")
                {
                }
                column(Amount_Import;TotalImports)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    TotalImports:=0.0;
                    BankImportEntries.Reset;
                    BankImportEntries.SetRange("Bank Code","Bank Account"."No.");
                    BankImportEntries.SetRange("Transaction Date",Bank."Posting Date");
                    if BankImportEntries.FindSet then begin
                      repeat
                              BankAccountLedgerEntry.Reset;
                              BankAccountLedgerEntry.SetRange("External Document No.",BankImportEntries."Reference No.");
                              if BankAccountLedgerEntry.FindFirst then begin
                                     TotalImports:=TotalImports+BankImportEntries.Amount;
                              end;
                      until BankImportEntries.Next=0;
                    end;
                end;
            }
            dataitem("Receipts Header1";"Receipts Header1")
            {
                DataItemLink = "No."=FIELD("Document No.");
                dataitem(Receipt;"Bank Account Ledger Entry")
                {
                    DataItemLink = "Document No."=FIELD("No.");
                    column(BankAccountNo_Receipt;Receipt."Bank Account No.")
                    {
                    }
                    column(Amount_Receipt;Receipt.Amount)
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            var
                BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
            begin
            end;
        }
        dataitem(Revenue;"G/L Entry")
        {
            RequestFilterFields = "G/L Account No.","Posting Date";
            column(DocumentNo_Revenue;Revenue."Document No.")
            {
            }
            column(Amount_Revenue;Revenue.Amount)
            {
            }
            dataitem("Student Processing Header";"Student Processing Header")
            {
                DataItemLink = "No."=FIELD("External Document No.");
                column(No_StudentProcessingHeader;"Student Processing Header"."No.")
                {
                }
                column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
                {
                }
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

    labels
    {
    }

    var
        BankCode: Code[30];
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        TotalImports: Decimal;
        BankImportBuffer: Record "Bank Import Buffer";
        BankImportEntries: Record "Bank Import Entries";
}

