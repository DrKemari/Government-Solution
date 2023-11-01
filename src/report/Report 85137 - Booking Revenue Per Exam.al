report 85137 "Booking Revenue Per Exam"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Booking Revenue Per Exam.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            DataItemTableView = WHERE(Posted=FILTER(true),"Document Type"=FILTER(Booking),Cancelled=FILTER(false));
            RequestFilterFields = "Examination Sitting";
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(ExaminationID_StudentProcessingHeader;"Student Processing Header"."Examination ID")
            {
            }
            column(ExaminationDescription_StudentProcessingHeader;"Student Processing Header"."Examination Description")
            {
            }
            column(ExaminationSitting_StudentProcessingHeader;"Student Processing Header"."Examination Sitting")
            {
            }
            column(CurrencyCode_StudentProcessingHeader;"Student Processing Header"."Currency Code")
            {
            }
            column(Name;CI.Name)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(BookingAmount_StudentProcessingHeader;"Student Processing Header"."Booking Amount")
            {
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
        BankAccountNo: Code[30];
        ReceiptNo: Code[30];
        CI: Record "Company Information";
        StudentProcessingHeader: Record "Student Processing Header";
        TotalAmount: Decimal;
}

