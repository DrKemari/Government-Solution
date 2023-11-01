report 56009 ReverseReceipts
{
    DefaultLayout = RDLC;
    RDLCLayout = './ReverseReceipts.rdlc';

    dataset
    {
        dataitem("Receipts to be reversed";"Receipts to be reversed")
        {

            trigger OnAfterGetRecord()
            begin
                ChequeDate:="Receipts to be reversed".PostingDate;
                ReceiptsHeader1.Reset;
                ReceiptsHeader1.SetRange(ReceiptsHeader1."No.", "Receipts to be reversed".No);
                //ReceiptsHeader1.SETRANGE(ReceiptsHeader1.Posted, TRUE);
                if ReceiptsHeader1.FindSet then begin
                    // MESSAGE('receipt found');
                  GLEntry.Reset;
                  GLEntry.SetRange(GLEntry."Document No.", ReceiptsHeader1."No.");
                  GLEntry.SetRange("Transaction No.","Receipts to be reversed"."Entry no");
                  //GLEntry.SETRANGE(GLEntry."Posting Date", ChequeDate);
                  GLEntry.SetRange(GLEntry."G/L Account No.", '50050-303');
                  GLEntry.SetRange(GLEntry.Reversed, false);
                  if GLEntry.FindSet then begin
                    repeat
                   /* Cont.RESET;
                Cont.SETRANGE(Cont."Receipt No",GLEntry."Document No.");
                Cont.SETRANGE(Cont.Reversed,FALSE);
                IF Cont.FINDSET THEN
                 CurrReport.SKIP;*/
                
                Clear(ReversalEntry);
                if GLEntry.Reversed then
                 CurrReport.Skip;
                
                if GLEntry."Journal Batch Name" = '' then
                  ReversalEntry.TestFieldError;
                GLEntry.TestField("Transaction No.");
                //check if unreversed transactions are two or less
                 /*GLEntry1.RESET;
                  GLEntry1.SETRANGE(GLEntry1."Document No.", ReceiptsHeader1."No.");
                    GLEntry.SETRANGE(GLEntry."Posting Date", ChequeDate);
                  //GLEntry1.SETRANGE(GLEntry1."Posting Date", ReceiptsHeader1."Cheque Date");***Commented By Morris
                  GLEntry1.SETRANGE(GLEntry1."G/L Account No.", '1120');
                  GLEntry1.SETRANGE(GLEntry1.Reversed, FALSE);
                  recCount:= 0;
                  IF GLEntry1.FINDSET THEN BEGIN
                    REPEAT
                      recCount:=recCount+1;
                      UNTIL GLEntry1.NEXT=0;
                    END;*/
                    //IF recCount>1 THEN BEGIN
                
                ReversalEntry.ReverseTransaction(GLEntry."Transaction No.");
                      //END;
                until GLEntry.Next= 0;
                    end;
                  end;

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
        ReceiptsHeader1: Record "Receipts Header1";
        GLEntry: Record "G/L Entry";
        ReversalEntry: Record "Reversal Entry";
        ReverseEntries: Page "Reverse Entries";
        ReversalPost: Codeunit "Reversal-Post";
        recCount: Integer;
        GLEntry1: Record "G/L Entry";
        ChequeDate: Date;
}

