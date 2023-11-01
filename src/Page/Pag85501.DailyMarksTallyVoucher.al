#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85501 "Daily Marks Tally Voucher"
{
    PageType = Card;
    SourceTable = "Center  Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(DocumentNo; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectNo; Rec."Project No.")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectName; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(CenterCode; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                }
                field(SittingCycle; Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CreatedBy; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control26; "Daily Tally Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
        }
        area(factboxes)
        {
            systempart(Control22; Outlook)
            {
            }
            systempart(Control23; Notes)
            {
            }
            systempart(Control24; MyNotes)
            {
            }
            systempart(Control25; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Analysis Form")
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
                    Rec.SetRange(Rec."Document No.", Rec."Document No.");
                    Report.Run(85207, true, true, Rec);
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
                        Examination.FnSuggestCenterPapersBooked(Rec);
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
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CreateDatetime(Today, Time);
                        Rec.Modify(true);
                        Message('Submitted Successfully');
                    end
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Marking Tally";
    end;

    var
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
}
