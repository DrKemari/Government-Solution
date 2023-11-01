report 85133 "Revenue Reconciliation TB"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Revenue Reconciliation TB.rdlc';

    dataset
    {
        dataitem("G/L Account";"G/L Account")
        {
            DataItemTableView = WHERE("Account Type"=FILTER(Posting));
            RequestFilterFields = "No.";
            column(No_GLAccount;"G/L Account"."No.")
            {
            }
            column(Name_GLAccount;"G/L Account".Name)
            {
            }
            column(NetChange_GLAccount;"G/L Account"."Net Change")
            {
            }

            trigger OnAfterGetRecord()
            begin
                StartDate:="G/L Account".GetRangeMin("G/L Account"."Date Filter");
                EndDate:="G/L Account".GetRangeMax("G/L Account"."Date Filter");
            end;
        }
        dataitem("Bank Account";"Bank Account")
        {
            RequestFilterFields = "No.";
            column(No_BankAccount;"Bank Account"."No.")
            {
            }
            column(Name_BankAccount;"Bank Account".Name)
            {
            }
            column(TotalImportAmount;TotalImportAmount)
            {
            }
            column(TotalReceiptAmount;TotalReceiptAmount)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TotalReceiptAmount:=0.0;
                TotalImportAmount:=0.0;

                ReceiptsHeader1.Reset;
                ReceiptsHeader1.SetRange("Bank Code","Bank Account"."No.");
                ReceiptsHeader1.SetFilter("Posted Date",'..%2',StartDate,EndDate);
                ReceiptsHeader1.SetRange(Posted,true);
                if ReceiptsHeader1.FindSet then begin
                  repeat
                  ReceiptsHeader1.CalcFields("Amount(LCY)");
                  TotalReceiptAmount:=TotalReceiptAmount+ReceiptsHeader1."Amount(LCY)";
                  until ReceiptsHeader1.Next=0;
                end;


                BankImportEntries.Reset;
                BankImportEntries.SetRange("Bank Code","Bank Account"."No.");
                BankImportEntries.SetRange(Posted,true);
                BankImportEntries.SetFilter("Transaction Date",'..%2',StartDate,EndDate);
                if BankImportEntries.FindSet then begin
                  repeat

                    TotalImportAmount:=TotalImportAmount+BankImportEntries.Amount;
                  until BankImportEntries.Next=0;
                end
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
        BankImportEntries: Record "Bank Import Entries";
        ReceiptsHeader1: Record "Receipts Header1";
        TotalImportAmount: Decimal;
        TotalReceiptAmount: Decimal;
        StartDate: Date;
        EndDate: Date;
}

