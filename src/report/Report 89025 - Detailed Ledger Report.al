report 89025 "Detailed Ledger Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Detailed Ledger Report.rdlc';

    dataset
    {
        dataitem("G/L Entry";"G/L Entry")
        {
            DataItemTableView = WHERE(Reversed=FILTER(false));
            RequestFilterFields = "G/L Account No.","Posting Date";
            column(Logo;CI.Picture)
            {
            }
            column(GLAccountNo_GLEntry;"G/L Entry"."G/L Account No.")
            {
            }
            column(PostingDate_GLEntry;"G/L Entry"."Posting Date")
            {
            }
            column(DocumentType_GLEntry;"G/L Entry"."Document Type")
            {
            }
            column(DocumentNo_GLEntry;"G/L Entry"."Document No.")
            {
            }
            column(Description_GLEntry;"G/L Entry".Description)
            {
            }
            column(BalAccountNo_GLEntry;"G/L Entry"."Bal. Account No.")
            {
            }
            column(Amount_GLEntry;"G/L Entry".Amount)
            {
            }
            column(SourceCode_GLEntry;"G/L Entry"."Source Code")
            {
            }
            column(TransactionNo_GLEntry;"G/L Entry"."Transaction No.")
            {
            }
            column(DebitAmount_GLEntry;"G/L Entry"."Debit Amount")
            {
            }
            column(CreditAmount_GLEntry;"G/L Entry"."Credit Amount")
            {
            }
            column(DocumentDate_GLEntry;"G/L Entry"."Document Date")
            {
            }
            column(ExternalDocumentNo_GLEntry;"G/L Entry"."External Document No.")
            {
            }
            column(SourceNo_GLEntry;"G/L Entry"."Source No.")
            {
            }
            column(Reversed_GLEntry;"G/L Entry".Reversed)
            {
            }
            column(ReversedbyEntryNo_GLEntry;"G/L Entry"."Reversed by Entry No.")
            {
            }
            column(Type;Type)
            {
            }
            column(Amount;Amount)
            {
            }
            column(AccountNo;AccountNo)
            {
            }
            column(AccountName;AccountName)
            {
            }
            column(UpperDate;UpperDate)
            {
            }
            column(LowerDate;LowerDate)
            {
            }
            column(AccountName2;AccountName2)
            {
            }
            column(SourceNo;SourceNo)
            {
            }
            column(SourceName;SourceName)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //check from the same table via a document no.
                if GLAccount.Get("G/L Entry"."G/L Account No.") then
                AccountName:=GLAccount.Name;

                GLEntry.Reset;
                GLEntry.SetRange("Document No.","G/L Entry"."Document No.");
                GLEntry.SetFilter("G/L Account No.",'<>%1',"G/L Entry"."G/L Account No.");
                if GLEntry.FindFirst then begin
                  SourceNo:=GLEntry."Source No.";
                  AccountNo:=GLEntry."G/L Account No.";
                  if GLEntry.Amount<0 then
                    Type:=TXT01
                  else
                    Type:=TXT02;

                   Amount:=Abs(GLEntry.Amount);
                if GLAccount.Get(GLEntry."G/L Account No.") then
                AccountName2:=GLAccount.Name;

                if BankAccount.Get(SourceNo) then
                  SourceName:=BankAccount.Name;
                if Vendor.Get(SourceNo) then
                  SourceName:=Vendor.Name;
                if Customer.Get(SourceNo) then
                  SourceName:=Customer.Name;
                if Resource.Get(SourceNo) then
                  SourceName:=Resource.Name;

                end
            end;

            trigger OnPreDataItem()
            var
                TXT001: Label 'Kindly input the start date and end date fields';
            begin
                LowerDate:=PostingDate1;
                UpperDate:=PostingDate2;
                if ((LowerDate=0D) or (UpperDate=0D)) then
                Error(TXT001);
                "G/L Entry".SetFilter("G/L Entry"."Posting Date",'%1..%2',PostingDate1,PostingDate2);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date";PostingDate1)
                {
                }
                field("End Date";PostingDate2)
                {
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        GLEntry: Record "G/L Entry";
        AccountNo: Code[30];
        Amount: Decimal;
        Type: Text;
        Customer: Record Customer;
        BankAccount: Record "Bank Account";
        Vendor: Record Vendor;
        CI: Record "Company Information";
        AccountName: Text;
        GLAccount: Record "G/L Account";
        UpperDate: Date;
        LowerDate: Date;
        PostingDate1: Date;
        PostingDate2: Date;
        AccountName2: Text;
        TXT01: Label 'Credit';
        TXT02: Label 'Debit';
        SourceNo: Code[50];
        SourceName: Text;
        Resource: Record Resource;
}

