report 85106 "Booking Update Batch"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Booking Update Batch.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            RequestFilterFields = "Examination Sitting";
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
                Examination.PostExaminationVoucher("Student Processing Header");
            end;

            trigger OnPreDataItem()
            begin
                "Student Processing Header".SetRange("Student Processing Header".Posted,false);
                "Student Processing Header".SetFilter("Student Processing Header"."Booking Receipt No.",'<>%1','');
                "Student Processing Header".SetFilter("Student Processing Header"."Booking Invoice No.",'<>%1','')
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
        Examination: Codeunit Examination;
}

