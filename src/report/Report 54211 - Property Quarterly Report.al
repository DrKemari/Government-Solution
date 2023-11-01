report 54211 "Property Quarterly Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Property Quarterly Report.rdlc';

    dataset
    {
        dataitem(Customer;Customer)
        {
            DataItemTableView = WHERE("Customer Posting Group"=FILTER('RENT'|'RENT AMBANK'));
            RequestFilterFields = "No.","Customer Posting Group";
            column(No_Customer;Customer."No.")
            {
            }
            column(Name_Customer;Customer.Name)
            {
            }
            column(Start_Date;StartDate)
            {
            }
            column(End_Date;EndDate)
            {
            }
            column(Opening_Balance;OpeningBalance)
            {
            }
            column(Expected;Expected)
            {
            }
            column(PaidAmount;PaidAmount)
            {
            }
            column(FirstMonthDate_Customer;FirstMonthDate)
            {
            }
            column(FirstEndDate_Customer;FirstEndDate)
            {
            }
            column(SecondmonthDate_Customer;SecondmonthDate)
            {
            }
            column(SecondEndDate_Customer;SecondEndDate)
            {
            }
            column(thirdmonthdate_Customer;thirdmonthDate)
            {
            }
            column(ThirdEndDate_Customer;ThirdEndDate)
            {
            }
            column(Expected2_Customer;Expected2)
            {
            }
            column(PaidAmount2_Customer;PaidAmount2)
            {
            }
            column(Expected3_Customer;Expected3)
            {
            }
            column(PaidAmount3_Customer;PaidAmount3)
            {
            }
            column(Balance3_Customer;Balance3)
            {
            }
            column(MonthOne_balance;FirstMonthBalance)
            {
            }
            column(Monthtwo_Balance;SecondMonthBalance)
            {
            }
            column(MonthThree_Balance;ThirdMonthBalance)
            {
            }
            column(FORMAT_TODAY_0_4_;Format(Today,0,4))
            {
            }
            column(CompanyLogo;CompanyInfo.Picture)
            {
            }
            column(CompanyName;CompanyInfo.Name)
            {
            }
            column(CompanyAddress;CompanyInfo.Address)
            {
            }
            column(CompanyAddress2;CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode;CompanyInfo."Post Code")
            {
            }
            column(CompanyCity;CompanyInfo.City)
            {
            }
            column(CompanyPhone;CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax;CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail;CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite;CompanyInfo."Home Page")
            {
            }
            column(Rubberstamp;CompanyInfo.RubberStamp)
            {
            }
            column(FirstMonthRange_Customer;FirstMonthRange)
            {
            }
            column(SecondMonthRange_Customer;SecondMonthRange)
            {
            }
            column(ThirdMonthRange_Customer;ThirdMonthRange)
            {
            }

            trigger OnAfterGetRecord()
            begin
                OpeningBalance:=0;
                Expected:=0;
                PaidAmount:=0;
                Balance:=0;

                Expected2:=0;
                PaidAmount2:=0;
                Balance2:=0;

                Expected3:=0;
                PaidAmount3:=0;
                Balance3:=0;

                FirstMonthBalance:=0;
                SecondMonthBalance:=0;
                ThirdMonthBalance:=0;


                OpeningDate:=CalcDate('-1D',StartDate);

                //Opening Balance
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Customer No.",Customer."No.");
                CustLedgerEntry.SetRange("Posting Date",0D,OpeningDate);
                //CustLedgerEntry.CALCSUMS(Amount);
                if CustLedgerEntry.FindSet then begin
                  repeat
                    CustLedgerEntry.CalcFields(CustLedgerEntry.Amount);
                    OpeningBalance:=OpeningBalance+CustLedgerEntry.Amount;
                  until CustLedgerEntry.Next=0;
                end;


                //First Month Computations
                FirstMonthRange:=Format(StartDate)+'..'+Format(CalcDate('CM',StartDate));
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Customer No.",Customer."No.");
                CustLedgerEntry.SetRange("Document Type",CustLedgerEntry."Document Type"::Invoice);
                CustLedgerEntry.SetRange("Posting Date",StartDate,CalcDate('CM',StartDate));
                if CustLedgerEntry.FindSet then begin
                  repeat
                    CustLedgerEntry.CalcFields(CustLedgerEntry."Debit Amount");
                    Expected:= Expected+CustLedgerEntry."Debit Amount";
                  until CustLedgerEntry.Next=0;
                end;

                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Customer No.",Customer."No.");
                CustLedgerEntry.SetRange("Posting Date",StartDate,CalcDate('CM',StartDate));
                if CustLedgerEntry.FindSet then begin
                  repeat
                   CustLedgerEntry.CalcFields(CustLedgerEntry."Credit Amount");
                   PaidAmount:= PaidAmount+CustLedgerEntry."Credit Amount";
                  until CustLedgerEntry.Next=0;
                end;

                FirstMonthBalance:=OpeningBalance+(Expected-PaidAmount);

                //Second Month Computations
                SecondmonthDate:=CalcDate('1M',StartDate);
                SecondEndDate:=CalcDate('CM',SecondmonthDate);
                SecondMonthRange:=Format(SecondmonthDate)+'..'+Format(SecondEndDate);
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Customer No.",Customer."No.");
                CustLedgerEntry.SetRange("Document Type",CustLedgerEntry."Document Type"::Invoice);
                CustLedgerEntry.SetRange("Posting Date",SecondmonthDate,SecondEndDate);
                if CustLedgerEntry.FindSet then begin
                  repeat
                    CustLedgerEntry.CalcFields(CustLedgerEntry."Debit Amount");
                    Expected2:=Expected2+CustLedgerEntry."Debit Amount";
                  until CustLedgerEntry.Next=0;
                end;

                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Customer No.",Customer."No.");
                CustLedgerEntry.SetRange("Posting Date",SecondmonthDate,SecondEndDate);
                if CustLedgerEntry.FindSet then begin
                  repeat
                   CustLedgerEntry.CalcFields(CustLedgerEntry."Credit Amount");
                   PaidAmount2:=PaidAmount2+CustLedgerEntry."Credit Amount";
                  until CustLedgerEntry.Next=0;
                end;

                SecondMonthBalance:=FirstMonthBalance+(Expected2-PaidAmount2);

                //Third Month Computations
                thirdmonthDate:=CalcDate('2M',StartDate);
                ThirdEndDate:=CalcDate('CM',thirdmonthDate);

                ThirdMonthRange:=Format(thirdmonthDate)+'..'+Format(ThirdEndDate);
                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Customer No.",Customer."No.");
                CustLedgerEntry.SetRange("Document Type",CustLedgerEntry."Document Type"::Invoice);
                CustLedgerEntry.SetRange("Posting Date",thirdmonthDate,ThirdEndDate);
                if CustLedgerEntry.FindSet then begin
                  repeat
                    CustLedgerEntry.CalcFields(CustLedgerEntry."Debit Amount");
                    Expected3:=Expected3+CustLedgerEntry."Debit Amount";
                  until CustLedgerEntry.Next=0;
                end;

                CustLedgerEntry.Reset;
                CustLedgerEntry.SetRange("Customer No.",Customer."No.");
                CustLedgerEntry.SetRange("Posting Date",thirdmonthDate,ThirdEndDate);
                if CustLedgerEntry.FindSet then begin
                  repeat
                   CustLedgerEntry.CalcFields(CustLedgerEntry."Credit Amount");
                   PaidAmount3:= PaidAmount3+CustLedgerEntry."Credit Amount";
                  until CustLedgerEntry.Next=0;
                end;

                ThirdMonthBalance:=SecondMonthBalance+(Expected3-PaidAmount3);
            end;

            trigger OnPreDataItem()
            begin
                if (StartDate=0D) and (EndDate=0D) then
                  Error('Both Start Date and End Date must hava value');

                CompanyInfo.Get;
                    CompanyInfo.CalcFields(CompanyInfo.Picture,CompanyInfo.RubberStamp);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date";StartDate)
                {
                }
                field("End Date";EndDate)
                {
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        StartDate: Date;
        EndDate: Date;
        OpeningBalance: Decimal;
        Expected: Decimal;
        PaidAmount: Decimal;
        Balance: Decimal;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        OpeningDate: Date;
        FirstMonthDate: Date;
        SecondmonthDate: Date;
        thirdmonthDate: Date;
        FirstEndDate: Date;
        SecondEndDate: Date;
        ThirdEndDate: Date;
        Expected2: Decimal;
        PaidAmount2: Decimal;
        Balance2: Decimal;
        Expected3: Decimal;
        PaidAmount3: Decimal;
        Balance3: Decimal;
        CompanyInfo: Record "Company Information";
        FirstMonthRange: Code[30];
        SecondMonthRange: Code[30];
        ThirdMonthRange: Code[30];
        FirstMonthBalance: Decimal;
        SecondMonthBalance: Decimal;
        ThirdMonthBalance: Decimal;
}

