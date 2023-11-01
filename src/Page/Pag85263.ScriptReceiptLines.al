#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85263 "Script Receipt Lines"
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
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Scripts Expected"; Rec."No. of Scripts Expected")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Envelopes"; Rec."No. of Envelopes")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Variance;Variance)
                {
                    ApplicationArea = Basic;
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Envelope Serial Nos")
            {
                ApplicationArea = Basic;
                RunObject = Page "Serial No Details";
                RunPageLink = "Document No."=field("Document No."),
                              "Line No."=field("Line No.");
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = SuggestNumber;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TXT001: label 'Confirm you want to submit the script details';
                begin
                    if Confirm(TXT001)=true then begin
                        Rec.TestField(Posted,false);
                     ExaminationCodeunit.SubmitScriptsUpdated(Rec);
                      end
                end;
            }
            action("Re-Open")
            {
                ApplicationArea = Basic;
                Image = SuggestNumber;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TXT001: label 'Confirm you want to Reopen the script details';
                begin
                    if Confirm(TXT001)=true then begin
                        Rec.TestField(Posted,true);
                     ExaminationCodeunit.ReOpenSubmittedScripts(Rec);
                      end
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Quantity Received");
        Variance:= Rec."No. of Scripts Expected" - Rec."Quantity Received";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."No. of Envelopes" := 1;
    end;

    trigger OnOpenPage()
    begin
        Rec.CalcFields("Quantity Received");
        Variance:= Rec."No. of Scripts Expected" - Rec."Quantity Received";
    end;

    var
        ExaminationCodeunit: Codeunit Examination;
        Variance: Integer;
}

#pragma implicitwith restore

