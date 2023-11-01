report 50004 "Mod Assignment matrix"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Mod Assignment matrix.rdlc';

    dataset
    {
        dataitem("G/L Entry";"G/L Entry")
        {
            RequestFilterFields = "External Document No.","Document Type";
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

            trigger OnAfterGetRecord()
            var
                SalesInvoiceHeader: Record "Sales Invoice Header";
            begin
                // "Cust. Ledger Entry".CALCFIELDS("Cust. Ledger Entry".Amount);
                // CustLedgerEntry.RESET;
                // CustLedgerEntry.SETRANGE("Customer No.", "Cust. Ledger Entry"."Customer No.");
                // CustLedgerEntry.SETRANGE("Document Type",CustLedgerEntry."Document Type"::" ");
                // CustLedgerEntry.SETRANGE(Amount,"Cust. Ledger Entry".Amount*-1);
                // CustLedgerEntry.SETRANGE(Reversed,FALSE);
                // IF CustLedgerEntry.FINDSET THEN BEGIN
                //  CustLedgerEntry.CALCFIELDS(Amount);
                //  IF CustLedgerEntry."Payment Method Code"='' THEN
                //  BEGIN
                //    "Cust. Ledger Entry"."External Document No.":=CustLedgerEntry."Document No.";
                //    "Cust. Ledger Entry".MODIFY(TRUE);
                //  END
                //  ELSE
                //  BEGIN
                //
                //    "Cust. Ledger Entry"."External Document No.":=CustLedgerEntry."External Document No.";
                //    "Cust. Ledger Entry".MODIFY(TRUE);
                //  END
                //
                // END;

                SalesInvoiceHeader.Reset;
                SalesInvoiceHeader.SetRange("No.","G/L Entry"."Document No.");
                if SalesInvoiceHeader.FindFirst then begin
                  if "G/L Entry"."External Document No."='' then begin
                  "G/L Entry"."External Document No.":=SalesInvoiceHeader."External Document No.";
                  "G/L Entry".Modify(true);
                  end

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
        Deduction: Record DeductionsX;
        Courses: Record Courses;
        ExaminationAccount: Record "Examination Account";
        Customer: Record Customer;
        AccountNo: Code[50];
        MyString: Text;
        TempString: Text;
        String1: Text;
        Exam: Codeunit Examination;
        PortalUser: Record "Dynasoft Portal User";
        DirEarn: Record "Directors Earnings";
        CustLedgerEntry: Record "Cust. Ledger Entry";
}

