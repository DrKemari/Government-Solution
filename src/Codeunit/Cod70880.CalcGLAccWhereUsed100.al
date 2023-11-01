#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70880 "Calc. G/L Acc. Where-Used100"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Calc. G/L Acc. Where-Used"(Codeunit 100)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=24-03-19;
        //      Time=120000T;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Calc. G/L Acc. Where-Used"(Codeunit 100);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH GLAccWhereUsed DO
        //                                            CASE "Table ID" OF
        //                                              DATABASE::Currency:
        //                                          #4..68
        //                                                  FAPostingGr.Code := COPYSTR("Key 1",1,MAXSTRLEN(FAPostingGr.Code));
        //                                                  PAGE.RUN(PAGE::"FA Posting Group Card",FAPostingGr);
        //                                                END;
        //                                              DATABASE::"FA Allocation":
        //                                                BEGIN
        //                                                  FAAlloc.Code := COPYSTR("Key 1",1,MAXSTRLEN(FAAlloc.Code));
        //                                                  EVALUATE(FAAlloc."Allocation Type","Key 2");
        //                                          #76..106
        //                                              ELSE
        //                                                OnShowExtensionPage(GLAccWhereUsed);
        //                                            END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..71
        //                                              DATABASE::"case":
        //                                          #73..109
        //                                        END;
        //  
        //                           Target=ShowSetupForm(PROCEDURE 8) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          AddTable(TableBuffer,DATABASE::Currency);
        //                                          AddTable(TableBuffer,DATABASE::"Gen. Journal Template");
        //                                          AddTable(TableBuffer,DATABASE::"Gen. Journal Batch");
        //                                          #4..8
        //                                          AddTable(TableBuffer,DATABASE::"Bank Account Posting Group");
        //                                          AddTable(TableBuffer,DATABASE::"VAT Posting Setup");
        //                                          AddTable(TableBuffer,DATABASE::"FA Posting Group");
        //                                          AddTable(TableBuffer,DATABASE::"FA Allocation");
        //                                          AddTable(TableBuffer,DATABASE::"Inventory Posting Setup");
        //                                          AddTable(TableBuffer,DATABASE::"Service Contract Account Group");
        //                                          AddTable(TableBuffer,DATABASE::"IC Partner");
        //                                          #16..24
        //                                          OnAfterFillTableBuffer(TableBuffer);
        //  
        //                                          EXIT(TableBuffer.FINDSET);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..11
        //                                          AddTable(TableBuffer,DATABASE::"case");
        //                                          #13..27
        //                                        END;
        //  
        //                           Target=FillTableBuffer(PROCEDURE 1) }
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

