#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85527 "Banked Specification Card"
{
    PageType = Card;
    SourceTable = "Examination Review Voucher";

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
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn;Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationSitting;Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field(Examination;Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field(Level;Rec.Level)
                {
                    ApplicationArea = Basic;
                }
                field(PaperCode;Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field(PaperName;Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(ModeratorNo;Rec."Moderator No.")
                {
                    ApplicationArea = Basic;
                }
                field(ModeratorName;Rec."Moderator Name")
                {
                    ApplicationArea = Basic;
                }
                field(NoofTopicsExamined;Rec."No. of Topics Examined")
                {
                    ApplicationArea = Basic;
                }
                field(NoofTopicsinSyllabus;Rec."No. of Topics in Syllabus")
                {
                    ApplicationArea = Basic;
                }
                field(ofSyllabusExamined;Rec."% of Syllabus Examined")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control14;"Question Bank Analysis")
            {
                SubPageLink = "Document No."=field("Document No.");
            }
        }
        area(factboxes)
        {
            systempart(Control27;Outlook)
            {
            }
            systempart(Control28;Notes)
            {
            }
            systempart(Control29;MyNotes)
            {
            }
            systempart(Control30;Links)
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
                begin
                    Commit;
                    Rec.SetRange(Rec."Document No.",Rec."Document No.");
                    Report.Run(85403,true,false,Rec);
                end;
            }
            action("Suggest Questions")
            {
                ApplicationArea = Basic;
                Image = SuggestGrid;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm(TXT001)=true then begin
                      SettingandModeration.SuggestModeratorNoOfQuestions(Rec);
                    end
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Rec."No. of Topics Examined");
        if ((Rec."No. of Topics Examined">0 )and (Rec."No. of Topics in Syllabus">0 ))then begin
        Rec."% of Syllabus Examined":=(Rec."No. of Topics Examined"/Rec."No. of Topics in Syllabus")*100;
        Rec.Modify
        end
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type":=Rec."document type"::Moderator;
    end;

    var
        SettingandModeration: Codeunit "Setting and Moderation";
        TXT001: label 'Are you sure you want to populate the number of questions required';
}
