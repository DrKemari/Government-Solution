report 89043 "Export Absa Payments"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Export Absa Payments.rdlc';

    dataset
    {
        dataitem(Payments;Payments)
        {
            column(TotalAmount;TotalAmount)
            {
            }
            column(TotalCount;TotalCount)
            {
            }
            dataitem("Payment Entries";"Payment Entries")
            {
                DataItemLink = No=FIELD("No.");
                column(MpesaCode;MpesaCode)
                {
                }
                column(CurrentDate;CurrentDate)
                {
                }
                column(AcccountNo;AcccountNo)
                {
                }
                column(NumbOne;NumbOne)
                {
                }
                column(NumbTwo;NumbTwo)
                {
                }
                column(NumberThree;NumberThree)
                {
                }
                column(Amount;"Payment Entries".Amount)
                {
                }
                column(MpesaNumber;"Payment Entries"."Mpesa Mobile No")
                {
                }
                column(NumberFour;NumberFour)
                {
                }
                column(BankAccountNo;BankAccountNo)
                {
                }

                trigger OnPreDataItem()
                begin
                    NumbOne:=1;
                    NumberFour:=2;
                    NumbTwo:=3;
                    NumberThree:=9;
                    MpesaCode:='MPESA';
                    BankAccountNo:='8004502';
                    IntDay:=Date2DMY(Today,1);
                    IntMonth:=Date2DMY(Today,2);
                    IntYear:=Date2DMY(Today,3);
                    CurrentDate:=Format(IntDay)+Format(IntMonth)+Format(IntYear);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Payments.CalcFields("Resources Total Amount","No. of Resources");
                TotalAmount:=Payments."Resources Total Amount";
                TotalCount:=Payments."No. of Resources"+3;
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
        MpesaCode: Code[20];
        CurrentDate: Code[30];
        AcccountNo: Code[30];
        NumbOne: Integer;
        NumbTwo: Integer;
        NumberThree: Integer;
        TotalAmount: Decimal;
        TotalCount: Integer;
        TAmount: Decimal;
        PaymentsRec: Record Payments;
        PaymentEntries: Record "Payment Entries";
        NumberFour: Integer;
        BankAccountNo: Code[10];
        IntDay: Integer;
        IntMonth: Integer;
        IntYear: Integer;
}

