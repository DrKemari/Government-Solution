#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85517 "Moderator Comment Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
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
                field(DocumentType; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
            }
            part(Control15; "Reviewer General Comments")
            {
                Editable = false;
                SubPageLink = "Document No." = field("Document No.");
            }
            part(Control14; "Specific Comments")
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
            action("Suggest Moderated Questions")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest moderated questions for the paper %1';
                begin
                    if Confirm(TXT001, true, Rec."Paper Code") = true then begin
                        SettingandModeration.SuggestModeratedQuestions(Rec);
                    end
                end;
            }
            action(Approve)
            {
                ApplicationArea = Basic;
                Enabled = Rec."Document Status" = Rec."Document Status"::Active;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to approve ?', true) = true then begin
                        Rec.TestField(Rec."Document Status", Rec."document status"::Active);
                        SettingandModeration.NotifyModeratoronAccept(Rec);
                        Rec."Document Status" := Rec."document status"::Accepted;
                        Message('Moderator Notified successfully');
                    end
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Enabled = Rec."Document Status" = Rec."Document Status"::Active;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to reject ?', true) = true then begin
                        Rec.TestField(Rec."Document Status", Rec."document status"::Active);
                        SettingandModeration.NotifyModeratoronReject(Rec);
                        Rec."Document Status" := Rec."document status"::Rejected;
                        Message('Moderator Notified successfully');
                    end;
                end;
            }
            action("Send To Reviewer")
            {
                ApplicationArea = Basic;
                Enabled = Rec.Status = Rec.Status::"Awaiting Moderator";
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to notify ?', true) = true then begin
                        Rec.TestField(Rec.Status, Rec.Status::"Awaiting Moderator");
                        SettingandModeration.NotifyReviewer(Rec);
                        Rec.Status := Rec.Status::"Awaiting Reviewer";
                        Message('Reviewer Notified successfully');
                    end;
                end;
            }
            action(Close)
            {
                ApplicationArea = Basic;
                Enabled = Rec."Document Status" = Rec."Document Status"::"Pending Confirmation";
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Close the voucher ?', true) = true then begin
                        Rec.TestField(Rec."Document Status", Rec."document status"::"Pending Confirmation");
                        Rec."Document Status" := Rec."document status"::Closed;
                        Message('Reviewer Notified successfully');
                    end;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Document Type":="Document Type"::Reviewer
    end;

    var
        SettingandModeration: Codeunit "Setting and Moderation";
}
