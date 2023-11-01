#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Codeunit "AccSchedManagement8" (ID 70998).
/// </summary>
Codeunit 70998 AccSchedManagement8
{

    trigger OnRun()
    begin

        //  OBJECT Modification AccSchedManagement(Codeunit 8)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=14-06-22;
        //      Time=181644T;
        //      Modified=Yes;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target=AccSchedManagement(Codeunit 8);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH GLBudgetEntry DO BEGIN
        //                                            IF UseBusUnitFilter OR UseDimFilter THEN
        //                                              SETCURRENTKEY(
        //                                          #4..22
        //                                            SETFILTER("Global Dimension 1 Code",GetDimTotalingFilter(1,ColumnLayout."Dimension 1 Totaling"));
        //                                            SETFILTER("Global Dimension 2 Code",GetDimTotalingFilter(2,ColumnLayout."Dimension 2 Totaling"));
        //                                            SETFILTER("Business Unit Code",ColumnLayout."Business Unit Totaling");
        //                                            FILTERGROUP(0);
        //                                          END;
        //  
        //                                          OnAfterSetGLAccGLBudgetEntryFilters(GLAcc,GLBudgetEntry,AccSchedLine,ColumnLayout,UseBusUnitFilter,UseDimFilter);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..25
        //                                             //daudi to accomodate multiple Budgets
        //                                            SETFILTER("Budget Name",ColumnLayout."G/L Budget Filter");
        //                                          #26..29
        //                                        END;
        //  
        //                           Target=SetGLAccGLBudgetEntryFilters(PROCEDURE 69) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH ColumnLayout DO BEGIN
        //                                            CalcColumnDates(ColumnLayout,FromDate,ToDate,FiscalStartDate2);
        //                                            CASE "Column Type" OF
        //                                              "Column Type"::"Net Change":
        //                                                CASE AccSchedLine2."Row Type" OF
        //                                                  AccSchedLine2."Row Type"::"Net Change":
        //                                                    GLAcc.SETRANGE("Date Filter",FromDate,ToDate);
        //                                                  AccSchedLine2."Row Type"::"Beginning Balance":
        //                                                    GLAcc.SETFILTER("Date Filter",'..%1',CLOSINGDATE(FromDate - 1)); // always includes closing date
        //                                                  AccSchedLine2."Row Type"::"Balance at Date":
        //                                          #11..23
        //                                              "Column Type"::"Year to Date":
        //                                                CASE AccSchedLine2."Row Type" OF
        //                                                  AccSchedLine2."Row Type"::"Net Change":
        //                                                    GLAcc.SETRANGE("Date Filter",FiscalStartDate2,ToDate);
        //                                                  AccSchedLine2."Row Type"::"Beginning Balance":
        //                                                    GLAcc.SETFILTER("Date Filter",'..%1',CLOSINGDATE(FiscalStartDate2 - 1)); // always includes closing date
        //                                                  AccSchedLine2."Row Type"::"Balance at Date":
        //                                                    GLAcc.SETRANGE("Date Filter",0D,ToDate);
        //                                                END;
        //                                              "Column Type"::"Rest of Fiscal Year":
        //                                                CASE AccSchedLine2."Row Type" OF
        //                                                  AccSchedLine2."Row Type"::"Net Change":
        //                                                    GLAcc.SETRANGE(
        //                                                      "Date Filter",CALCDATE('<+1D>',ToDate),AccountingPeriodMgt.FindEndOfFiscalYear(FiscalStartDate2));
        //                                                  AccSchedLine2."Row Type"::"Beginning Balance":
        //                                                    GLAcc.SETRANGE("Date Filter",0D,ToDate);
        //                                                  AccSchedLine2."Row Type"::"Balance at Date":
        //                                                    GLAcc.SETRANGE("Date Filter",0D,AccountingPeriodMgt.FindEndOfFiscalYear(ToDate));
        //                                                END;
        //                                              "Column Type"::"Entire Fiscal Year":
        //                                                CASE AccSchedLine2."Row Type" OF
        //                                                  AccSchedLine2."Row Type"::"Net Change":
        //                                                    GLAcc.SETRANGE(
        //                                                      "Date Filter",
        //                                                      FiscalStartDate2,
        //                                                      AccountingPeriodMgt.FindEndOfFiscalYear(FiscalStartDate2));
        //                                                  AccSchedLine2."Row Type"::"Beginning Balance":
        //                                                    GLAcc.SETFILTER("Date Filter",'..%1',CLOSINGDATE(FiscalStartDate2 - 1)); // always includes closing date
        //                                                  AccSchedLine2."Row Type"::"Balance at Date":
        //                                          #53..55
        //                                          END;
        //  
        //                                          OnAfterSetGLAccColumnFilters(GLAcc,AccSchedLine2,ColumnLayout)
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..6
        //  
        //                                                    BEGIN
        //                                                    GLAcc.SETRANGE("Date Filter",FromDate,ToDate);
        //                                                      //daudi added for multiple budge
        //                                                      GLAcc.SETRANGE("Budget Filter",ColumnLayout."G/L Budget Filter");
        //                                                    END;
        //                                          #8..26
        //                                                  BEGIN
        //                                                    GLAcc.SETRANGE("Date Filter",FiscalStartDate2,ToDate);
        //                                                  //daudi added for multiple budge
        //                                                      GLAcc.SETRANGE("Budget Filter",ColumnLayout."G/L Budget Filter");
        //                                                  END;
        //                                          #28..35
        //                                                  BEGIN
        //                                                    GLAcc.SETRANGE(
        //                                                      "Date Filter",CALCDATE('<+1D>',ToDate),AccountingPeriodMgt.FindEndOfFiscalYear(FiscalStartDate2));
        //                                                  //daudi added for multiple budge
        //                                                      GLAcc.SETRANGE("Budget Filter",ColumnLayout."G/L Budget Filter");
        //                                                  END;
        //                                          #38..45
        //                                                  BEGIN
        //                                          #46..49
        //                                                  //daudi added for multiple budge
        //                                                      GLAcc.SETRANGE("Budget Filter",ColumnLayout."G/L Budget Filter");
        //                                                  END;
        //                                          #50..58
        //                                        END;
        //  
        //                           Target=SetGLAccColumnFilters(PROCEDURE 20) }
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

