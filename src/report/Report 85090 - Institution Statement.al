report 85090 "Institution Statement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Institution Statement.rdlc';

    dataset
    {
        dataitem(Customer;Customer)
        {
            DataItemTableView = WHERE("Customer Type"=FILTER(Institution));
            column(Logo;CI.Picture)
            {
            }
            column(No_Customer;Customer."No.")
            {
            }
            column(Name_Customer;Customer.Name)
            {
            }
            column(SearchName_Customer;Customer."Search Name")
            {
            }
            column(Name2_Customer;Customer."Name 2")
            {
            }
            column(Address_Customer;Customer.Address)
            {
            }
            dataitem(Ledger_Entry;"Cust. Ledger Entry")
            {
                DataItemLink = "Customer No."=FIELD("No.");
                DataItemTableView = WHERE(Amount=FILTER(<0));
                column(DocumentNo_LedgerEntry;Ledger_Entry."Document No.")
                {
                }
                column(Description_LedgerEntry;Ledger_Entry.Description)
                {
                }
                column(Amount_LedgerEntry;Ledger_Entry.Amount)
                {
                }
            }
            dataitem("Student Processing Header";"Student Processing Header")
            {
                DataItemLink = "Institution Code"=FIELD("No.");
                DataItemTableView = WHERE(Posted=FILTER(true));
                column(No_StudentProcessingHeader;"Student Processing Header"."No.")
                {
                }
                column(Date_StudentProcessingHeader;"Student Processing Header".Date)
                {
                }
                column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
                {
                }
                column(StudentNo_StudentProcessingHeader;"Student Processing Header"."Student No.")
                {
                }
                column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
                {
                }
                column(FirstName_StudentProcessingHeader;"Student Processing Header"."First Name")
                {
                }
                column(StudentRegNo_StudentProcessingHeader;"Student Processing Header"."Student Reg. No.")
                {
                }
                column(MiddleName_StudentProcessingHeader;"Student Processing Header"."Middle Name")
                {
                }
                column(Surname_StudentProcessingHeader;"Student Processing Header".Surname)
                {
                }
                column(IDNumberPassportNo_StudentProcessingHeader;"Student Processing Header"."ID Number/Passport No.")
                {
                }
                dataitem("Cust. Ledger Entry";"Cust. Ledger Entry")
                {
                    DataItemLink = "External Document No."=FIELD("No."),"Customer No."=FIELD("Institution Code");
                    DataItemTableView = WHERE(Reversed=FILTER(false));
                    column(EntryNo_CustLedgerEntry;"Cust. Ledger Entry"."Entry No.")
                    {
                    }
                    column(CustomerNo_CustLedgerEntry;"Cust. Ledger Entry"."Customer No.")
                    {
                    }
                    column(PostingDate_CustLedgerEntry;"Cust. Ledger Entry"."Posting Date")
                    {
                    }
                    column(DocumentType_CustLedgerEntry;"Cust. Ledger Entry"."Document Type")
                    {
                    }
                    column(DocumentNo_CustLedgerEntry;"Cust. Ledger Entry"."Document No.")
                    {
                    }
                    column(Description_CustLedgerEntry;"Cust. Ledger Entry".Description)
                    {
                    }
                    column(CustomerName_CustLedgerEntry;"Cust. Ledger Entry"."Customer Name")
                    {
                    }
                    column(CurrencyCode_CustLedgerEntry;"Cust. Ledger Entry"."Currency Code")
                    {
                    }
                    column(Amount_CustLedgerEntry;"Cust. Ledger Entry".Amount)
                    {
                    }
                    column(RemainingAmount_CustLedgerEntry;"Cust. Ledger Entry"."Remaining Amount")
                    {
                    }
                    column(UserID_CustLedgerEntry;"Cust. Ledger Entry"."User ID")
                    {
                    }
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

