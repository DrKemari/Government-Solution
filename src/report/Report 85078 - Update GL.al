report 85078 "Update GL"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update GL.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
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

            trigger OnAfterGetRecord()
            begin
                Header.Reset;
                Header.SetRange("External Document No.","Student Processing Header"."No.");
                Header.SetRange("Transaction Type",'');
                if Header.FindSet then begin
                  repeat
                  Header."Transaction Type":=Format("Student Processing Header"."Document Type");
                Header.Modify(true);
                until Header.Next=0;
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
        Header: Record "G/L Entry";
}

