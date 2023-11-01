report 85091 "Transaction Reconciliation Rep"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Transaction Reconciliation Rep.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            DataItemTableView = WHERE(Posted=FILTER(true));
            RequestFilterFields = "Document Type";
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(Date_StudentProcessingHeader;"Student Processing Header".Date)
            {
            }
            column(StudentNo_StudentProcessingHeader;"Student Processing Header"."Student No.")
            {
            }
            column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
            {
            }
            column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
            {
            }
            column(CorrectGL;CorrectGL)
            {
            }
            column(PostedGL;PostedGL)
            {
            }
            column(ErrorPresent;ErrorPresent)
            {
            }
            column(Amount;Amount)
            {
            }
            column(PostedDate;PostedDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //get the G/l posted
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Document Type",CustLedgerEntry."Document Type"::Invoice);
                CustLedgerEntry.SetRange("External Document No.","Student Processing Header"."No.");
                CustLedgerEntry.SetFilter(Amount,'<%1',0);
                CustLedgerEntry.SetRange(Reversed,false);
                if CustLedgerEntry.FindFirst then begin
                  PostedGL:=CustLedgerEntry."G/L Account No.";
                  Amount:=Abs(CustLedgerEntry.Amount);
                  PostedDate:=CustLedgerEntry."Posting Date";
                end;

                //get the G/l to be posted
                ResourcePrice.Reset;
                ResourcePrice.SetRange("Document Type","Student Processing Header"."Document Type");
                if ResourcePrice.FindFirst then begin
                Resource.Reset;
                Resource.SetRange("No.",ResourcePrice.Code);
                if Resource.FindFirst then begin
                  GeneralPostingSetup.Reset;
                  GeneralPostingSetup.SetRange("Gen. Prod. Posting Group",Resource."Gen. Prod. Posting Group");
                  if GeneralPostingSetup.FindFirst then begin
                       CorrectGL:=GeneralPostingSetup."Sales Account";
                  end;
                end;
                end;

                if CorrectGL<>PostedGL then
                  ErrorPresent:=true
                else ErrorPresent:=false;
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
        CorrectGL: Code[30];
        PostedGL: Code[30];
        GeneralPostingSetup: Record "General Posting Setup";
        Header: Record "Student Processing Header";
        Resource: Record Resource;
        CustLedgerEntry: Record "G/L Entry";
        ResourcePrice: Record "Resource Price";
        ErrorPresent: Boolean;
        Amount: Decimal;
        PostedDate: Date;
}

