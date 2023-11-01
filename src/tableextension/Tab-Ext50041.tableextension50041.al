#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50041 "tableextension50041" extends "Reversal Entry" 
{

    //Unsupported feature: Code Modification on "ReverseEntries(PROCEDURE 32)".

    //procedure ReverseEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IsHandled := FALSE;
        OnBeforeReverseEntries(Number,RevType,IsHandled);
        IF IsHandled THEN
          EXIT;

        InsertReversalEntry(Number,RevType);
        TempReversalEntry.SETCURRENTKEY("Document No.","Posting Date","Entry Type","Entry No.");
        IF NOT HideDialog THEN
          PAGE.RUNMODAL(PAGE::"Reverse Entries",TempReversalEntry)
        ELSE BEGIN
          ReversalPost.SetPrint(FALSE);
          ReversalPost.SetHideDialog(HideWarningDialogs);
          ReversalPost.RUN(TempReversalEntry);
        END;
        TempReversalEntry.DELETEALL;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..7
        {

        IF NOT HideDialog THEN
          PAGE.RUNMODAL(PAGE::"Reverse Entries",TempReversalEntry)
        ELSE }BEGIN
        #11..15
        */
    //end;


    //Unsupported feature: Code Modification on "CheckGLAcc(PROCEDURE 13)".

    //procedure CheckGLAcc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GLAcc.GET(GLEntry."G/L Account No.");
        CheckPostingDate(GLEntry."Posting Date",GLEntry.TABLECAPTION,GLEntry."Entry No.");
        GLAcc.TESTFIELD(Blocked,FALSE);
        GLEntry.TESTFIELD("Job No.",'');
        IF GLEntry.Reversed THEN
          AlreadyReversedEntry(GLEntry.TABLECAPTION,GLEntry."Entry No.");
        BalanceCheckAmount := BalanceCheckAmount + GLEntry.Amount;
        IF GLSetup."Additional Reporting Currency" <> '' THEN
          BalanceCheckAddCurrAmount := BalanceCheckAddCurrAmount + GLEntry."Additional-Currency Amount";

        OnAfterCheckGLAcc(GLAcc,GLEntry);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        //GLEntry.TESTFIELD("Job No.",'');
        #5..11
        */
    //end;


    //Unsupported feature: Code Modification on "CheckFAPostingDate(PROCEDURE 24)".

    //procedure CheckFAPostingDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF (AllowPostingFrom = 0D) AND (AllowPostingto = 0D) THEN BEGIN
          IF USERID <> '' THEN
            IF UserSetup.GET(USERID) THEN BEGIN
        #4..9
            AllowPostingto := FASetup."Allow FA Posting To";
          END;
          IF AllowPostingto = 0D THEN
            AllowPostingto := 99981231D;
        END;
        IF (FAPostingDate < AllowPostingFrom) OR (FAPostingDate > AllowPostingto) THEN
          ERROR(Text005,Caption,EntryNo,FALedgEntry.FIELDCAPTION("FA Posting Date"));
        IF FAPostingDate > MaxPostingDate THEN
          MaxPostingDate := FAPostingDate;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..12
            AllowPostingto := 99983112D;
        #14..18
        */
    //end;
}

