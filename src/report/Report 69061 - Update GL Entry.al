report 69061 "Update GL Entry"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update GL Entry.rdlc';

    dataset
    {
        dataitem("G/L Entry";"G/L Entry")
        {
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
            column(Name_GLEntry;"G/L Entry".Name)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Vendor.Reset;
                Vendor.SetRange("No.","G/L Entry"."Source No.");
                if Vendor.FindFirst then begin
                  "G/L Entry".Name:=Vendor.Name;
                  "G/L Entry".Modify(true);
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
        Vendor: Record Vendor;
}

