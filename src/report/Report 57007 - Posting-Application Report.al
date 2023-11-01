report 57007 "Posting-Application Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Posting-Application Report.rdlc';

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            column(No_Vendor;Vendor."No.")
            {
            }
            column(Name_Vendor;Vendor.Name)
            {
            }

            trigger OnAfterGetRecord()
            begin
                 CMSetup.Get;
                 SourceCodeSetup.Get;
                 VendLedgerEntry.Reset;
                 VendLedgerEntry.SetRange("Vendor No.",Vendor."No.");
                 VendLedgerEntry.SetRange(Open,true);
                 if VendLedgerEntry.FindSet then begin
                   repeat
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",CMSetup."PV Journal Template");
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",CMSetup."PV Journal Batch Name");
                    GenJnlLine.DeleteAll;

                          GenJnlLine.Init;
                          GenJnlLine."Journal Template Name":=CMSetup."PV Journal Template";
                          GenJnlLine."Journal Batch Name":=CMSetup."PV Journal Batch Name";
                          GenJnlLine."Document No." := VendLedgerEntry."Document No.";
                          GenJnlLine."Posting Date" := VendLedgerEntry."Posting Date";
                          GenJnlLine."Document Date" := GenJnlLine."Posting Date";
                          GenJnlLine."Account Type" := GenJnlLine."Account Type"::Vendor;
                          GenJnlLine."Account No." := VendLedgerEntry."Vendor No.";
                          VendLedgerEntry.CalcFields("Debit Amount","Credit Amount","Debit Amount (LCY)","Credit Amount (LCY)");
                          GenJnlLine.Correction :=
                          ("Debit Amount" < 0) or ("Credit Amount" < 0) or
                          ("Debit Amount (LCY)" < 0) or ("Credit Amount (LCY)" < 0);
                          GenJnlLine."Document Type" :=VendLedgerEntry."Document Type";
                          GenJnlLine.Description :=VendLedgerEntry.Description;
                          GenJnlLine."Shortcut Dimension 1 Code" := VendLedgerEntry."Global Dimension 1 Code";
                          GenJnlLine."Shortcut Dimension 2 Code" := VendLedgerEntry."Global Dimension 2 Code";
                          GenJnlLine."Dimension Set ID" := VendLedgerEntry."Dimension Set ID";
                          GenJnlLine."Posting Group" := Vendor."Vendor Posting Group";
                          GenJnlLine."Source Type" := GenJnlLine."Source Type"::Vendor;
                          GenJnlLine."Source No." := VendLedgerEntry."Vendor No.";
                          GenJnlLine."Source Code" := SourceCodeSetup."Purchase Entry Application";
                          GenJnlLine."System-Created Entry" := true;
                          GenJnlLine.Insert;
                         // GenJnlPostLine.VendPostApplyVendLedgEntry(GenJnlLine,VendLedgerEntry);
                   until VendLedgerEntry.Next=0;
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
        VendLedgerEntry: Record "Vendor Ledger Entry";
        VendEntryApplyPostedEntries: Codeunit "VendEntry-Apply Posted Entries";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        PaymentsPost: Codeunit "Payments-Post";
        CMSetup: Record "Cash Management Setup";
        GenJnlLine: Record "Gen. Journal Line";
        SourceCodeSetup: Record "Source Code Setup";
}

