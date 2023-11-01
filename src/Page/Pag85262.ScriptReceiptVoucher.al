#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85262 "Script Receipt Voucher"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Center  Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Sitting Cycle"; Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control26; "Script Receipt Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control22; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Script Analysis Form")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ExamBookingEntries: Record "Exam Booking Entries";
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(85154, true, true, Rec);
                end;
            }
            action("Detailed Script Analysis Form")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ExamBookingEntries: Record "Exam Booking Entries";
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(85141, true, false, Rec);
                end;
            }
        }
        area(processing)
        {
            action("Suggest Papers")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TXT001: label 'Do you want to suggest the examination booked in this center?This will overwrite the data that exists';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.SuggestCenterPapersBooked(Rec);
                    end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TXT002: label 'Do you want to Submit the Details ?';
                begin
                    if Confirm(TXT002) = true then begin
                        Examination.FnPostScriptReceiptVoucher(Rec);
                    end
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Script Receipt";
    end;

    var
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

