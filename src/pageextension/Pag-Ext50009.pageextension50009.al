#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50009 "pageextension50009" extends "Customer Ledger Entries" 
{
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on "ReverseTransaction(Action 66)".


        //Unsupported feature: Code Modification on "ReverseTransaction(Action 66).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CLEAR(ReversalEntry);
            IF Reversed THEN
              ReversalEntry.AlreadyReversedEntry(TABLECAPTION,"Entry No.");
            IF "Journal Batch Name" = '' THEN
              ReversalEntry.TestFieldError;
            TESTFIELD("Transaction No.");
            ReversalEntry.ReverseTransaction("Transaction No.");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF CONFIRM(TXT001,TRUE,"Document No.")=TRUE THEN BEGIN
            IF CONFIRM(TXT002,TRUE,"Document No.")=TRUE THEN BEGIN
            #1..7
            END
            END
            */
        //end;
    }

    var
        TXT001: label 'Do you want to reverse the transaction %1';
        TXT002: label 'Are you sure you want to reverse %1';
}

