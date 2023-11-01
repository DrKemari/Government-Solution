report 85100 "Duplicate Receipts"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Duplicate Receipts.rdlc';

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
            column(ApplicationAmount_StudentProcessingHeader;"Student Processing Header"."Application Amount")
            {
            }
            column(BookingAmount_StudentProcessingHeader;"Student Processing Header"."Booking Amount")
            {
            }
            column(RegistrationAmount_StudentProcessingHeader;"Student Processing Header"."Registration Amount")
            {
            }
            column(RenewalAmount_StudentProcessingHeader;"Student Processing Header"."Renewal Amount")
            {
            }
            column(ReceiptNo;ReceiptNo)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //get the total from receipt
                ReceiptNo:='';
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Registration then begin
                  ReceiptsHeader1.Reset;
                  ReceiptsHeader1.SetRange("Cheque No","Student Processing Header"."No.");
                  if ReceiptsHeader1.FindSet then begin
                    repeat
                      ReceiptsHeader1.CalcFields(Amount);
                      TotalAmount+=ReceiptsHeader1.Amount;
                    until ReceiptsHeader1.Next=0;
                  end;
                  if TotalAmount>"Student Processing Header"."Application Amount" then
                  ReceiptNo:="Student Processing Header"."No.";
                end;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Booking then begin
                  "Student Processing Header".CalcFields("Student Processing Header"."Booking Amount");
                  ReceiptsHeader1.Reset;
                  ReceiptsHeader1.SetRange("Cheque No","Student Processing Header"."No.");
                  if ReceiptsHeader1.FindSet then begin
                    repeat
                      ReceiptsHeader1.CalcFields(Amount);
                      TotalAmount+=ReceiptsHeader1.Amount;
                    until ReceiptsHeader1.Next=0;
                  end;
                  if TotalAmount>"Student Processing Header"."Booking Amount" then
                  ReceiptNo:="Student Processing Header"."No.";
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
        ReceiptsHeader1: Record "Receipts Header1";
        TotalAmount: Decimal;
        ReceiptNo: Code[30];
}

