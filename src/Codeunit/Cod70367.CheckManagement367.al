#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70367 "CheckManagement367"
{

    trigger OnRun()
    begin

        //  OBJECT Modification CheckManagement(Codeunit 367)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=29-07-20;
        //      Time=160507T;
        //      Modified=Yes;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target=CheckManagement(Codeunit 367);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          OnBeforeFinancialVoidCheck(CheckLedgEntry);
        //  
        //                                          FinancialVoidCheckPreValidation(CheckLedgEntry);
        //                                          #4..175
        //                                            BankAccLedgEntry2.Open := FALSE;
        //                                            BankAccLedgEntry2."Remaining Amount" := 0;
        //                                            BankAccLedgEntry2."Statement Status" := BankAccLedgEntry2."Statement Status"::Closed;
        //                                            BankAccLedgEntry2.MODIFY;
        //                                          END;
        //  
        //                                          // rounding error from currency conversion
        //                                          #183..187
        //                                          UpdateAnalysisView.UpdateAll(0,TRUE);
        //  
        //                                          OnAfterFinancialVoidCheck(CheckLedgEntry);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..178
        //                                            //added by daudi after voiding
        //                                            BankAccLedgEntry2.Reversed:=TRUE;
        //                                            BankAccLedgEntry2.MODIFY;
        //                                            GLEntry.RESET;
        //                                            GLEntry.SETCURRENTKEY("Transaction No.");
        //                                            GLEntry.SETRANGE("Transaction No.",BankAccLedgEntry2."Transaction No.");
        //                                            GLEntry.SETRANGE("Document No.",BankAccLedgEntry2."Document No.");
        //                                            GLEntry.SETRANGE("Posting Date",BankAccLedgEntry2."Posting Date");
        //                                            IF GLEntry.FINDSET THEN BEGIN
        //                                              REPEAT
        //                                                GLEntry.Reversed:=TRUE;
        //                                                GLEntry.MODIFY;
        //  
        //                                                UNTIL GLEntry.NEXT=0
        //                                              END;
        //                                          #180..190
        //                                        END;
        //  
        //                           Target=FinancialVoidCheck(PROCEDURE 5) }
        //    }
        //    CODE
        //    {
        //  
        //      BEGIN
        //      END.
        //    }
        //  }
        //  
        //  

    end;
}

