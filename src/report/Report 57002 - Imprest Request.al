report 57002 "Imprest Request"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Imprest Request.rdlc';

    dataset
    {
        dataitem(Payments;Payments)
        {
            column(No_Payments;Payments."No.")
            {
            }
            column(Date_Payments;Payments.Date)
            {
            }
            column(ChequeDate_Payments;Payments."Cheque Date")
            {
            }
            column(ChequeNo_Payments;Payments."Cheque No")
            {
            }
            column(Payee_Payments;Payments.Payee)
            {
            }
            column(TravelDate_Payments;Payments."Travel Date")
            {
            }
            column(DestinationName_Payments;Payments."Destination Name")
            {
            }
            column(AccountNo_Payments;Payments."Account No.")
            {
            }
            column(AccountName_Payments;Payments."Account Name")
            {
            }
            column(ImprestAmount_Payments;Payments."Imprest Amount")
            {
            }
            column(Project_Payments;Payments.Project)
            {
            }
            column(CurrencyCodeText;CurrencyCodeText)
            {
            }
            column(PayingBankAccount_Payments;Payments."Paying Bank Account")
            {
            }
            column(PayMode_Payments;Payments."Pay Mode")
            {
            }
            column(GlobalDimension2Code_Payments;Payments."Shortcut Dimension 2 Code")
            {
            }
            column(NumberText_1;NumberText[1])
            {
            }
            column(Emp_JobTitle;EmpRec."Job Title")
            {
            }
            column(Emp_BankName;EmpRec."Bank Name")
            {
            }
            column(Emp_JobGroup;Resource."Resource Group No.")
            {
            }
            column(Emp_BankCode;BankCode)
            {
            }
            column(Project_Desc;Payments."Project Description")
            {
            }
            dataitem("Imprest Lines";"Imprest Lines")
            {
                DataItemLink = No=FIELD("No.");
                column(AccountNo_ImprestLines;"Imprest Lines"."Account No.")
                {
                }
                column(AccountName_ImprestLines;"Imprest Lines"."Account Name")
                {
                }
                column(Description_ImprestLines;"Imprest Lines".Description)
                {
                }
                column(Amount_ImprestLines;"Imprest Lines".Amount)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields("Imprest Amount");
                if EmpRec.Get("Account No.") then;
                if Resource.Get("Account No.") then;
                BankCode:=EmpRec."Employee's Bank"+EmpRec."Bank Branch";

                GLSetup.Get;

                if Payments."Currency Code"<>'' then
                CurrencyCodeText:=Payments."Currency Code"
                else
                CurrencyCodeText:=GLSetup."LCY Code";
                InitTextVariable;
                FormatNoText(NumberText,"Imprest Amount",CurrencyCodeText);
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
        PurposeLbl = 'Purpose';
        DocNo = 'Document No';
        PayeeLbl = 'Payee';
        DocDate = 'Document Date';
        ProjectsCode = 'Projects Code';
        PayingBank = 'Paying Bank Account';
        Currencylbl = 'Currency';
        ChequeNo = 'Cheque No./EFT';
        PayMode = 'Pay Mode';
        TravelDate = 'Travel Date';
        JobTitle = 'Job Title';
        JobGroup = 'Job Group';
        BankCode = 'Bank Code';
        BankName = 'Bank Name';
        ApplicantNo = 'Applicant Account No';
        Amount = 'Amount';
        Total = 'Total';
        AmountInWords = 'Amount in Words';
        PreparedBy = 'Prepared By';
        Expenditure = 'Expenditure Approved By';
        Budget = 'Budget Checked By';
        AuthorizedBy = 'Authorized By';
        Recipient = 'Recipient';
        PrintedBy = 'Printed By';
        TimePrinted = 'Time Printed';
    }

    var
        Purpose: Text;
        OnesText: array [20] of Text[30];
        TensText: array [10] of Text[30];
        ExponentText: array [5] of Text[30];
        NumberText: array [2] of Text[80];
        CurrencyCodeText: Code[10];
        Text026: Label 'ZERO';
        Text027: Label 'HUNDRED';
        Text028: Label 'AND';
        Text032: Label 'ONE';
        Text033: Label 'TWO';
        Text034: Label 'THREE';
        Text035: Label 'FOUR';
        Text036: Label 'FIVE';
        Text037: Label 'SIX';
        Text038: Label 'SEVEN';
        Text039: Label 'EIGHT';
        Text040: Label 'NINE';
        Text041: Label 'TEN';
        Text042: Label 'ELEVEN';
        Text043: Label 'TWELVE';
        Text044: Label 'THIRTEEN';
        Text045: Label 'FOURTEEN';
        Text046: Label 'FIFTEEN';
        Text047: Label 'SIXTEEN';
        Text048: Label 'SEVENTEEN';
        Text049: Label 'EIGHTEEN';
        Text050: Label 'NINETEEN';
        Text051: Label 'TWENTY';
        Text052: Label 'THIRTY';
        Text053: Label 'FORTY';
        Text054: Label 'FIFTY';
        Text055: Label 'SIXTY';
        Text056: Label 'SEVENTY';
        Text057: Label 'EIGHTY';
        Text058: Label 'NINETY';
        Text059: Label 'THOUSAND';
        Text060: Label 'MILLION';
        Text061: Label 'BILLION';
        Text029: Label '%1 results in a written number that is too long.';
        GLSetup: Record "General Ledger Setup";
        EmpRec: Record Employee;
        Resource: Record Resource;
        BankCode: Text;

    procedure FormatNoText(var NoText: array [2] of Text[80];No: Decimal;CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '****';

        if No < 1 then
          AddToNoText(NoText,NoTextIndex,PrintExponent,Text026)
        else begin
          for Exponent := 4 downto 1 do begin
            PrintExponent := false;
            Ones := No div Power(1000,Exponent - 1);
            Hundreds := Ones div 100;
            Tens := (Ones mod 100) div 10;
            Ones := Ones mod 10;
            if Hundreds > 0 then begin
              AddToNoText(NoText,NoTextIndex,PrintExponent,OnesText[Hundreds]);
              AddToNoText(NoText,NoTextIndex,PrintExponent,Text027);
            end;
            if Tens >= 2 then begin
              AddToNoText(NoText,NoTextIndex,PrintExponent,TensText[Tens]);
              if Ones > 0 then
                AddToNoText(NoText,NoTextIndex,PrintExponent,OnesText[Ones]);
            end else
              if (Tens * 10 + Ones) > 0 then
                AddToNoText(NoText,NoTextIndex,PrintExponent,OnesText[Tens * 10 + Ones]);
            if PrintExponent and (Exponent > 1) then
              AddToNoText(NoText,NoTextIndex,PrintExponent,ExponentText[Exponent]);
            No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000,Exponent - 1);
          end;
        end;

        AddToNoText(NoText,NoTextIndex,PrintExponent,Text028);
        AddToNoText(NoText,NoTextIndex,PrintExponent,Format(No * 100) + '/100');

        if CurrencyCode <> '' then
          AddToNoText(NoText,NoTextIndex,PrintExponent,CurrencyCode+' ONLY');
    end;

    local procedure AddToNoText(var NoText: array [2] of Text[80];var NoTextIndex: Integer;var PrintExponent: Boolean;AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
          NoTextIndex := NoTextIndex + 1;
          if NoTextIndex > ArrayLen(NoText) then
            Error(Text029,AddText);
        end;

        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText,'<');
    end;

    procedure InitTextVariable()
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text060;
        ExponentText[4] := Text061;
    end;
}

