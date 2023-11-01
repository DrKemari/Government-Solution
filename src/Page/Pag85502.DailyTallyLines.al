#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85502 "Daily Tally Lines"
{
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "Center Dispatch Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Examination;Rec.Examination)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PaperCode;Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PaperName;Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(NoofScriptsExpected;Rec."No. of Scripts Expected")
                {
                    ApplicationArea = Basic;
                }
                field(NoMarked;Rec."No Marked")
                {
                    ApplicationArea = Basic;
                }
                field(NoSampled;Rec."No. Sampled")
                {
                    ApplicationArea = Basic;
                }
                field(NoPassing;Rec."No. Passing")
                {
                    ApplicationArea = Basic;
                }
                field(Pass;Rec."% Pass")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Rec."Quantity Received");
        Variance:=Rec."No. of Scripts Expected"-Rec."Quantity Received";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."No. of Envelopes":=1;
    end;

    trigger OnOpenPage()
    begin
        Rec.CalcFields(Rec."Quantity Received");
        Variance:=Rec."No. of Scripts Expected"-Rec."Quantity Received";
    end;

    var
        ExaminationCodeunit: Codeunit Examination;
        Variance: Integer;
}
