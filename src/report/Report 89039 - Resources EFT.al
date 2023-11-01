report 89039 "Resources EFT"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Resources EFT.rdlc';

    dataset
    {
        dataitem("Payment Entries";"Payment Entries")
        {
            column(No_PaymentEntries;"Payment Entries".No)
            {
            }
            column(LineNo_PaymentEntries;"Payment Entries"."Line No")
            {
            }
            column(Date_PaymentEntries;"Payment Entries".Date)
            {
            }
            column(AccountType_PaymentEntries;"Payment Entries"."Account Type")
            {
            }
            column(AccountNo_PaymentEntries;"Payment Entries"."Account No")
            {
            }
            column(AccountName_PaymentEntries;"Payment Entries"."Account Name")
            {
            }
            column(Amount_PaymentEntries;"Payment Entries".Amount)
            {
            }
            column(WTaxAmount_PaymentEntries;"Payment Entries"."W/Tax Amount")
            {
            }
            column(NetAmount_PaymentEntries;"Payment Entries"."Net Amount")
            {
            }
            column(BankName_PaymentEntries;"Payment Entries"."Bank Name")
            {
            }
            column(BranchName_PasymentEntries;"Payment Entries"."Branch Name")
            {
            }
            column(BankBranchNo_PaymentEntries;"Payment Entries"."Bank Branch No.")
            {
            }
            column(BankAccountNo_PaymentEntries;"Payment Entries"."Bank Account No.")
            {
            }
            column(BankCode_PaymentEntries;"Payment Entries"."Bank Code")
            {
            }
            column(PIN_PaymentEntries;"Payment Entries".PIN)
            {
            }
            column(Sn;Sn)
            {
            }
            column(CompanyInfoName;Compinfo.Name)
            {
            }
            column(CompanyInfoPicture;Compinfo.Picture)
            {
            }
            column(kCode;kCode)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Sn+=1;
                kCode:=Text0001+Format(Sn);
                Space:='';

                Amtlen:=StrLen("Payment Entries"."Bank Account No.");

                i:=0;
                j:=0;
                i:=14-(Amtlen);
                if j<i then
                 repeat
                   if i=1 then
                    Space:=' '
                   else
                   Space:=Space+' ';

                  j:=j+1;
                 until j=i;

                BankAcc:=Space+DelChr("Payment Entries"."Bank Account No.",'=',' ');
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

    trigger OnPreReport()
    begin
        Compinfo.Get;
        Compinfo.CalcFields(Picture);
    end;

    var
        Sn: Integer;
        Compinfo: Record "Company Information";
        kCode: Text;
        Text0001: Label 'kasneb';
        Accountno: Code[40];
        Amtlen: Integer;
        Space: Text[15];
        i: Integer;
        j: Integer;
        BankAcc: Text[20];
        Amtlen2: Integer;
        Space2: Text[15];
}

