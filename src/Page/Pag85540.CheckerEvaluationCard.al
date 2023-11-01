#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85540 "Checker Evaluation Card"
{
    PageType = Document;
    SourceTable = "Checker Evaluation Header";

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
                field(No;Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(ExamSitting;Rec."Exam Sitting")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(OverallScore;Rec."Overall Score")
                {
                    ApplicationArea = Basic;
                }
                field(OverallComment;Rec."Overall Comment")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn;Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control15;"Checker Evaluation Lines")
            {
                SubPageLink = "Document No"=field("Document No.");
            }
        }
        area(factboxes)
        {
            systempart(Control11;Outlook)
            {
            }
            systempart(Control12;Notes)
            {
            }
            systempart(Control13;MyNotes)
            {
            }
            systempart(Control14;Links)
            {
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
                    Report.Run(85232,true,true,Rec);
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
            action("Suggest Criteria")
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

                      Exam.FnSuggestCriteria(Rec);
                     end
                end;
            }
        }
    }

    var
        Exam: Codeunit Examination;
}
