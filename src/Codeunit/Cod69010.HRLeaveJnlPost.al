#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 69010 "HR Leave Jnl.-Post"
{
    TableNo = "HR Journal Line";

    trigger OnRun()
    begin
        InsuranceJnlLine.Copy(Rec);
        Code;
        Rec.Copy(InsuranceJnlLine);
    end;

    var
        Text000: label 'Do you want to post the journal lines?';
        Text001: label 'There is nothing to post.';
        Text002: label 'The journal lines were successfully posted.';
        Text003: label 'The journal lines were successfully posted. You are now in the %1 journal.';
        InsuranceJnlTempl: Record "HR Leave Journal Template";
        InsuranceJnlLine: Record "HR Journal Line";
        InsuranceJnlPostBatch: Codeunit "Leave Jnl.-Post Batch";
        TempJnlBatchName: Code[10];

    local procedure "Code"()
    begin
        with InsuranceJnlLine do begin
          InsuranceJnlTempl.Get("Journal Template Name");
          InsuranceJnlTempl.TestField("Force Posting Report",false);

          //IF NOT CONFIRM(Text000,FALSE) THEN
            //EXIT;

          TempJnlBatchName := "Journal Batch Name";


          InsuranceJnlPostBatch.Run(InsuranceJnlLine);

          if "Line No." = 0 then
            Message(Text001)
          else
            if TempJnlBatchName = "Journal Batch Name" then
              Message(Text002)
            else
              Message(
                Text003,
                "Journal Batch Name");

          if not Find('=><') or (TempJnlBatchName <> "Journal Batch Name") then begin
            Reset;
            FilterGroup := 2;
            SetRange("Journal Template Name","Journal Template Name");
            SetRange("Journal Batch Name","Journal Batch Name");
            FilterGroup := 0;
            "Line No." := 1;
          end;
        end;
    end;
}

