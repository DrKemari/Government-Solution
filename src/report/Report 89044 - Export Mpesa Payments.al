report 89044 "Export Mpesa Payments"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Export Mpesa Payments.rdlc';

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
            dataitem("Imprest Voucher Lines";"Imprest Voucher Lines")
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
                column(Amount;"Imprest Voucher Lines"."Amount LCY")
                {
                }
                column(MpesaNumber;"Imprest Voucher Lines"."Mobile Phone No.")
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
                    "Imprest Voucher Lines".CalcFields("Imprest Voucher Lines"."Mobile Phone No.");

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

