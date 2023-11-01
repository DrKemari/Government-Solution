report 50070 "Bank Account Reconciliation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bank Account Reconciliation.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Bank Account Statement";"Bank Account Statement")
        {
            column(BankAccountNo_BankAccountStatement;"Bank Account Statement"."Bank Account No.")
            {
            }
            column(StatementNo_BankAccountStatement;"Bank Account Statement"."Statement No.")
            {
            }
            column(StatementEndingBalance_BankAccountStatement;"Bank Account Statement"."Statement Ending Balance")
            {
            }
            column(StatementDate_BankAccountStatement;"Bank Account Statement"."Statement Date")
            {
            }
            column(BalanceLastStatement_BankAccountStatement;"Bank Account Statement"."Balance Last Statement")
            {
            }
            column(BankName;BankName)
            {
            }
            column(BankAccNo;BankAccNo)
            {
            }
            column(BalanceBF;BalanceBF)
            {
            }
            column(BalanceCF;BalanceCF)
            {
            }
            column(StartDate2;StartDate2)
            {
            }
            column(Receipts;Receipts)
            {
            }
            column(Payments;Payments)
            {
            }
            column(Unpresented;Unpresented)
            {
            }
            column(Uncredited;Uncredited)
            {
            }
            column(CurrencyCode;CurrencyCode)
            {
            }
            column(TodayFormatted;Format(Today,0,4))
            {
            }
            column(CompanyName;UpperCase(CompanyName))
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            column(USERID;UserId)
            {
            }
            dataitem(BankAccountLedgerEntry3;"Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No."=FIELD("Bank Account No.");
                DataItemTableView = SORTING("Bank Account No.","Posting Date") ORDER(Ascending) WHERE(Amount=FILTER(<0),Reversed=CONST(false));
                PrintOnlyIfDetail = false;
                column(PostingDate_BankAccountLedgerEntry;PostingDate1)
                {
                }
                column(DocumentNo_BankAccountLedgerEntry;DocNo1)
                {
                }
                column(Description_BankAccountLedgerEntry;Description1)
                {
                }
                column(Amount_BankAccountLedgerEntry;Amount1)
                {
                }

                trigger OnAfterGetRecord()
                begin
                     // MESSAGE('%1',"Bank Account Ledger Entry"."Entry No.");
                    BankAccountLedgerEntry3.Reset;
                    BankAccountLedgerEntry3.SetRange("Bank Account No.",BankAcc);
                    BankAccountLedgerEntry3.SetRange("Posting Date",0D,EndDate);
                    //BankAccountLedgerEntry3.SETRANGE(Open,TRUE);
                    BankAccountLedgerEntry3.SetRange(Reversed,false);
                    BankAccountLedgerEntry3.SetFilter("Statement Date",'>%1|=%2',StatementDate,0D);
                    BankAccountLedgerEntry3.SetFilter(Amount,'<%1',0);
                            PostingDate1:=BankAccountLedgerEntry3."Posting Date";
                            Description1:=BankAccountLedgerEntry3.Description;
                            DocNo1:=BankAccountLedgerEntry3."Document No.";
                            Amount1:=BankAccountLedgerEntry3.Amount;
                end;

                trigger OnPreDataItem()
                begin
                    //Unpresented
                    BankAccountLedgerEntry3.Reset;
                    BankAccountLedgerEntry3.SetRange("Bank Account No.",BankAcc);
                    BankAccountLedgerEntry3.SetRange("Posting Date",0D,EndDate);
                    //BankAccountLedgerEntry3.SETRANGE(Open,TRUE);
                    BankAccountLedgerEntry3.SetRange(Reversed,false);
                    //BankAccountLedgerEntry2.SETFILTER(BankAccountLedgerEntry2."Statement No.",'>%1|=%2',StatementNo,'');
                    BankAccountLedgerEntry3.SetFilter("Statement Date",'>%1|=%2',StatementDate,0D);
                    BankAccountLedgerEntry3.SetFilter(Amount,'<%1',0);
                end;
            }
            dataitem(BankAccountLedgerEntry2;"Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No."=FIELD("Bank Account No.");
                DataItemTableView = SORTING("Bank Account No.","Posting Date") ORDER(Ascending) WHERE(Amount=FILTER(>0),Reversed=CONST(false));
                PrintOnlyIfDetail = false;
                column(PostingDate_BankAccountLedgerEntry2;PostingDate1)
                {
                }
                column(DocumentNo_BankAccountLedgerEntry2;Description1)
                {
                }
                column(Description_BankAccountLedgerEntry2;DocNo1)
                {
                }
                column(AmountBankAccountLedgerEntry2;Amount1)
                {
                }
                column(PostingDate;PostingDate)
                {
                }
                column(Description;Description)
                {
                }
                column(DocNo;DocNo)
                {
                }
                column(Amount;Amount)
                {
                }
                column(TotalAmount;TotalAmount)
                {
                }

                trigger OnAfterGetRecord()
                begin
                           // MESSAGE('%1',BankAccountLedgerEntry2."Entry No.");
                            /*
                            PostingDate:=0D;
                            Description:='';
                            DocNo:='';
                            Amount:=0;
                            */
                    BankAccountLedgerEntry2.Reset;
                    BankAccountLedgerEntry2.SetRange(BankAccountLedgerEntry2."Bank Account No.",BankAcc);
                    BankAccountLedgerEntry2.SetRange(BankAccountLedgerEntry2."Posting Date",0D,EndDate);
                    //BankAccountLedgerEntry2.SETRANGE(Open,TRUE);
                    BankAccountLedgerEntry2.SetRange(Reversed,false);
                    BankAccountLedgerEntry2.SetFilter(BankAccountLedgerEntry2."Statement Date",'>%1|=%2',StatementDate,0D);
                    BankAccountLedgerEntry2.SetFilter(BankAccountLedgerEntry2.Amount,'>%1',0);
                            PostingDate:=BankAccountLedgerEntry2."Posting Date";
                            Description:=BankAccountLedgerEntry2.Description;
                            DocNo:=BankAccountLedgerEntry2."Document No.";
                            Amount:=BankAccountLedgerEntry2.Amount;
                            TotalAmount:=TotalAmount+Amount;
                            //MESSAGE('%1',TotalAmount);

                end;

                trigger OnPreDataItem()
                begin
                    //Unpresented
                    //BankAccLedger.RESET;
                    //BankAccLedger.SETRANGE(BankAccLedger."Bank Account No.","Bank Account Statement"."Bank Account No.");
                    BankAccountLedgerEntry2.Reset;
                    BankAccountLedgerEntry2.SetRange(BankAccountLedgerEntry2."Bank Account No.",BankAcc);
                    BankAccountLedgerEntry2.SetRange(BankAccountLedgerEntry2."Posting Date",0D,EndDate);
                    //BankAccountLedgerEntry2.SETRANGE(Open,TRUE);
                    BankAccountLedgerEntry2.SetRange(Reversed,false);
                    //BankAccountLedgerEntry2.SETFILTER(BankAccountLedgerEntry2."Statement No.",'>%1|=%2',StatementNo,'');
                    BankAccountLedgerEntry2.SetFilter(BankAccountLedgerEntry2."Statement Date",'>%1|=%2',StatementDate,0D);
                    
                    BankAccountLedgerEntry2.SetFilter(BankAccountLedgerEntry2.Amount,'>%1',0);
                    /*
                    IF BankAccLedger.FIND('-') THEN BEGIN
                    REPEAT
                    Unpresented:=Unpresented+BankAccLedger.Amount;
                    UNTIL BankAccLedger.NEXT=0;
                    END;
                    Unpresented:=-Unpresented;
                    
                    */

                end;
            }

            trigger OnAfterGetRecord()
            begin
                StartDate1:=CalcDate('CD+1D',"Bank Account Statement"."Statement Date");
                StartDate2:=CalcDate('CD-1M',StartDate1);
                StartDate3:=CalcDate('CD-1D',StartDate2);

                EndDate:="Bank Account Statement"."Statement Date";
                StatementNo:="Bank Account Statement"."Statement No.";
                if BankStatement.Get("Bank Account Statement"."Bank Account No.","Bank Account Statement"."Statement No.") then
                 StatementDate:=BankStatement."Statement Date";


                   if Banks.Get("Bank Account Statement"."Bank Account No.") then begin
                    BankName:=Banks.Name;
                    BankAccNo:=Banks."Bank Account No.";
                    BankAcc:=Banks."No.";

                    CurrencyCode:=Banks."Currency Code";

                    if CurrencyCode='' then begin
                    GenLedgerSetup.Get;
                    CurrencyCode:=GenLedgerSetup."LCY Code";
                    end

                    end;

                //Banks.SETRANGE(Banks."Date Filter",0D,StartDate3);
                Banks.SetFilter("Date Filter",'%1..%2',0D,StartDate3);
                Banks.CalcFields("Net Change");
                BalanceBF:=Banks."Net Change";


                Banks.SetFilter("Date Filter",'%1..%2',0D,StatementDate);
                Banks.CalcFields("Net Change");
                BalanceCF:=Banks."Net Change";




                //Receipts
                BankAccLedger.Reset;
                BankAccLedger.SetRange(BankAccLedger."Bank Account No.","Bank Account Statement"."Bank Account No.");
                BankAccLedger.SetRange(Reversed,false);
                BankAccLedger.SetFilter(BankAccLedger."Posting Date",'%1..%2',StartDate2,StatementDate);
                BankAccLedger.SetFilter(BankAccLedger.Amount,'>%1',0);
                if BankAccLedger.Find('-') then begin
                    repeat
                        Receipts:=Receipts+BankAccLedger.Amount;
                    until BankAccLedger.Next=0;
                end;


                //Payments
                BankAccLedger.Reset;
                BankAccLedger.SetRange(Reversed,false);
                BankAccLedger.SetRange(BankAccLedger."Bank Account No.","Bank Account Statement"."Bank Account No.");
                BankAccLedger.SetFilter(BankAccLedger."Posting Date",'%1..%2',StartDate2,StatementDate);
                BankAccLedger.SetFilter(BankAccLedger.Amount,'<%1',0);
                if BankAccLedger.FindSet then begin
                repeat

                Payments:=Payments+BankAccLedger.Amount;
                until BankAccLedger.Next=0;
                end;



                //Uncredited
                BankAccLedger.Reset;
                BankAccLedger.SetRange(BankAccLedger."Bank Account No.","Bank Account Statement"."Bank Account No.");
                BankAccLedger.SetRange(BankAccLedger."Posting Date",0D,"Bank Account Statement"."Statement Date");
                BankAccLedger.SetRange(BankAccLedger.Open,true);
                BankAccLedger.SetRange(Reversed,false);
                //BankAccLedger.SETFILTER(BankAccLedger."Statement No.",'>%1',FORMAT("Bank Account Statement"."Statement No."));
                //BankAccLedger.SETFILTER(BankAccLedger."Statement No.",'>%1|=%2',"Bank Account Statement"."Statement No.",'');
                BankAccLedger.SetFilter(BankAccLedger."Statement Date",'>%1|=%2',"Bank Account Statement"."Statement Date",0D);
                BankAccLedger.SetFilter(BankAccLedger.Amount,'>%1',0);

                if BankAccLedger.Find('-') then begin
                repeat
                Uncredited:=Uncredited+BankAccLedger.Amount;
                until BankAccLedger.Next=0;
                end;
                Uncredited:=-Uncredited;

                //Unpresented
                BankAccLedger.Reset;
                BankAccLedger.SetRange(BankAccLedger."Bank Account No.","Bank Account Statement"."Bank Account No.");
                BankAccLedger.SetRange(BankAccLedger."Posting Date",0D,"Bank Account Statement"."Statement Date");
                BankAccLedger.SetRange(BankAccLedger.Open,true);
                BankAccLedger.SetRange(Reversed,false);
                //BankAccLedger.SETFILTER(BankAccLedger."Statement No.",'<>%1',FORMAT("Bank Account Statement"."Statement No."));
                //BankAccLedger.SETFILTER(BankAccLedger."Statement No.",'>%1|=%2',"Bank Account Statement"."Statement No.",'');
                BankAccLedger.SetFilter(BankAccLedger."Statement Date",'>%1|=%2',"Bank Account Statement"."Statement Date",0D);
                BankAccLedger.SetFilter(BankAccLedger.Amount,'<%1',0);

                if BankAccLedger.Find('-') then begin
                repeat
                Unpresented:=Unpresented+BankAccLedger.Amount;
                until BankAccLedger.Next=0;
                end;
                Unpresented:=-Unpresented;
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
        BankName: Code[50];
        BankAccNo: Code[50];
        Banks: Record "Bank Account";
        BalanceBF: Decimal;
        BalanceCF: Decimal;
        StartDate1: Date;
        StartDate2: Date;
        StartDate3: Date;
        BankAccLedger: Record "Bank Account Ledger Entry";
        Receipts: Decimal;
        Payments: Decimal;
        Unpresented: Decimal;
        Uncredited: Decimal;
        EndDate: Date;
        StatementNo: Code[10];
        CurrencyCode: Code[10];
        GenLedgerSetup: Record "General Ledger Setup";
        BankAcc: Code[50];
        PostingDate: Date;
        Description: Text[100];
        DocNo: Code[20];
        Amount: Decimal;
        TotalAmount: Decimal;
        BankStatement: Record "Bank Account Statement";
        StatementDate: Date;
        BankAccLedger3: Record "Bank Account Ledger Entry";
        PostingDate1: Date;
        Description1: Text[100];
        DocNo1: Code[20];
        Amount1: Decimal;
}

