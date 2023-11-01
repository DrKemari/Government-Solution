#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85519 "Reviewer Comment Cards"
{
    PageType = Card;
    SourceTable = "Examination Review Voucher";

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
                field(CreatedBy; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(ResourceNo; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field(ResourceName; Rec."Resource Name")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationSitting; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                }
                field(PaperCode; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field(PaperName; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(ModeratorNo; Rec."Moderator No.")
                {
                    ApplicationArea = Basic;
                }
                field(ModeratorName; Rec."Moderator Name")
                {
                    ApplicationArea = Basic;
                }
                field(NoofTopicsExamined; Rec."No. of Topics Examined")
                {
                    ApplicationArea = Basic;
                }
                field(NoofTopicsinSyllabus; Rec."No. of Topics in Syllabus")
                {
                    ApplicationArea = Basic;
                }
                field(ofSyllabusExamined; Rec."% of Syllabus Examined")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control23; "Disclosure Relatives")
            {
                Caption = 'Disclosure Relatives/Kin';
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = const("Reviewers Comments");
            }
            part(Control15; "Reviewer General Comments")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
            part(Control14; "Reviewer Specific Comments")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
            }
            systempart(Control28; Notes)
            {
            }
            systempart(Control29; MyNotes)
            {
            }
            systempart(Control30; Links)
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
                    Rec.SetRange(Rec."Document No.", Rec."Document No.");
                    Report.Run(85404, true, false, Rec);
                end;
            }
            action(Close)
            {
                ApplicationArea = Basic;
                Enabled = Rec.Status = Rec.Status::"Awaiting Reviewer";
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Close the voucher ?', true) = true then begin
                        Rec.TestField(Rec.Status, Rec.Status::"Awaiting Reviewer");
                        Rec.Status := Rec.Status::Closed;
                        Rec."Document Status" := Rec."document status"::Closed;
                        Message('Reviewer Notified successfully');
                    end;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Reviewer
    end;

    var
        SettingandModeration: Codeunit "Setting and Moderation";
}
