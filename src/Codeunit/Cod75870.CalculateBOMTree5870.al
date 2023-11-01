#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 75870 "Calculate BOM Tree5870"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Calculate BOM Tree"(Codeunit 5870)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=24-03-19;
        //      Time=120000T;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Calculate BOM Tree"(Codeunit 5870);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          OpenWindow;
        //  
        //                                          InitBOMBuffer(BOMBuffer);
        //                                          #4..7
        //                                            IF GETFILTER("Date Filter") <> '' THEN
        //                                              DemandDate := GETRANGEMAX("Date Filter")
        //                                            ELSE
        //                                              DemandDate := 99981231D;
        //                                            NoOfRecords := COUNT;
        //                                            IF FINDSET THEN
        //                                              REPEAT
        //                                          #15..20
        //                                          ParentItem.COPY(ItemFilter);
        //  
        //                                          Window.CLOSE;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..10
        //                                              DemandDate := 99983112D;
        //                                          #12..23
        //                                        END;
        //  
        //                           Target=GenerateTreeForItems(PROCEDURE 1) }
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

