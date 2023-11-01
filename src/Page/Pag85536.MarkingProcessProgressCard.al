#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85536 "Marking Process Progress Card"
{
    PageType = Document;
    SourceTable = "Scripts Dispatch Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(DocumentNo;Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(ProjectNo;Rec."Project No.")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectName;Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(SittingCycle;Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn;Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus;Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control23;"Marking Progress Lines")
            {
                SubPageLink = "Document No"=field("Document No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
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
                    Rec.SetRange(Rec."Document No.",Rec."Document No.");
                    Report.Run(85223,true,true,Rec);
                end;
            }
            action("Suggest Papers")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TXT002: label 'Do you want to Suggest the Details ?';
                begin
                     if Confirm(TXT002)=true then begin

                      Exam.FnSuggestPapersMar(Rec);
                     end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Return;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TXT002: label 'Do you want to Post ?';
                begin
                     if Confirm(TXT002)=true then begin
                        Rec.Posted:=true;
                       Rec."Posted By":=UserId;
                       Rec."Posted On":=CurrentDatetime;
                       Message('Archived Successfully');
                     end
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type":=Rec."document type"::"Marking Progress Form";
        Rec."Marking Start Date":=Today;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Posted=true then begin
          CurrPage.Editable:=false;
          end;
    end;

    var
        ExamBookingEntries: Record "Exam Booking Entries";
        Exam: Codeunit Examination;
}
