#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50046 "pageextension50046" extends Navigate 
{

    //Unsupported feature: Code Modification on "FindRecords(PROCEDURE 2)".

    //procedure FindRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        Window.OPEN(Text002);
        RESET;
        DELETEALL;
        #4..137
          DtldCustLedgEntry.SETCURRENTKEY("Document No.");
          DtldCustLedgEntry.SETFILTER("Document No.",DocNoFilter);
          DtldCustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
          InsertIntoDocEntry(Rec,DATABASE::"Detailed Cust. Ledg. Entry",0,DtldCustLedgEntry.TABLECAPTION,DtldCustLedgEntry.COUNT);
        END;
        IF ReminderEntry.READPERMISSION THEN BEGIN
          ReminderEntry.RESET;
        #145..296
                CustLedgEntry."Posting Date",FORMAT(CustLedgEntry."Document Type"),CustLedgEntry."Document No.",
                1,CustLedgEntry."Customer No.");
            END;
            IF NoOfRecords(DATABASE::"Detailed Cust. Ledg. Entry") = 1 THEN BEGIN
              DtldCustLedgEntry.FINDFIRST;
              SetSource(
                DtldCustLedgEntry."Posting Date",FORMAT(DtldCustLedgEntry."Document Type"),DtldCustLedgEntry."Document No.",
        #304..429
        IF UpdateForm THEN
          UpdateFormAfterFindRecords;
        Window.CLOSE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..140
          InsertIntoDocEntry(Rec,DATABASE::"Detailed Customer Ledg. Entry",0,DtldCustLedgEntry.TABLECAPTION,DtldCustLedgEntry.COUNT);
        #142..299
            IF NoOfRecords(DATABASE::"Detailed Customer Ledg. Entry") = 1 THEN BEGIN
        #301..432
        */
    //end;


    //Unsupported feature: Code Modification on "ShowRecords(PROCEDURE 6)".

    //procedure ShowRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IsHandled := FALSE;
        OnBeforeNavigateShowRecords("Table ID",DocNoFilter,PostingDateFilter,ItemTrackingSearch,Rec,IsHandled);
        IF IsHandled THEN
        #4..85
              PAGE.RUN(0,GLEntry);
            DATABASE::"VAT Entry":
              PAGE.RUN(0,VATEntry);
            DATABASE::"Detailed Cust. Ledg. Entry":
              PAGE.RUN(0,DtldCustLedgEntry);
            DATABASE::"Cust. Ledger Entry":
              PAGE.RUN(0,CustLedgEntry);
        #93..155
          END;

        OnAfterNavigateShowRecords("Table ID",DocNoFilter,PostingDateFilter,ItemTrackingSearch,Rec);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..88
            DATABASE::"Detailed Customer Ledg. Entry":
        #90..158
        */
    //end;
}

