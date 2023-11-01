report 85092 "Processed Revenue Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Processed Revenue Summary.rdlc';

    dataset
    {
        dataitem("G/L Entry";"G/L Entry")
        {
            DataItemTableView = WHERE("Transaction Type"=FILTER(<>''),"Document Type"=FILTER(Invoice),Amount=FILTER(<0));
            RequestFilterFields = "Posting Date";
            column(EntryNo_GLEntry;"G/L Entry"."Entry No.")
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
            column(TransactionType_GLEntry;"G/L Entry"."Transaction Type")
            {
            }
            column(StartDate;StartDate)
            {
            }
            column(EndDate;EndDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                StartDate:="G/L Entry".GetRangeMin("G/L Entry"."Posting Date");
                EndDate:="G/L Entry".GetRangeMax("G/L Entry"."Posting Date");
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
        StartDate: Date;
        EndDate: Date;
}

