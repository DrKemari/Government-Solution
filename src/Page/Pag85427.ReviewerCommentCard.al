#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85427 "Reviewer Comment Card"
{
    PageType = Card;
    SourceTable = "Examination Review Voucher";

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
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field("Resource Name"; Rec."Resource Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
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
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field("Moderator No."; Rec."Moderator No.")
                {
                    ApplicationArea = Basic;
                }
                field("Moderator Name"; Rec."Moderator Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Topics Examined"; Rec."No. of Topics Examined")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Topics in Syllabus"; Rec."No. of Topics in Syllabus")
                {
                    ApplicationArea = Basic;
                }
                field("% of Syllabus Examined"; Rec."% of Syllabus Examined")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control23; "Disclosure Relatives")
            {
                Caption = 'Disclosure Relatives/Kin';
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = const("Reviewers Comments");
                ApplicationArea = Basic;
            }
            part(Control15; "Reviewer General Comments")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            part(Control14; "Reviewer Specific Comments")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; Links)
            {
                ApplicationArea = Basic;
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
                    Rec.SetRange("Document No.", Rec."Document No.");
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

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to approve ?', true) = true then begin
                        Rec.TestField("Document Status", Rec."document status"::Active);
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

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to reject ?', true) = true then begin
                        Rec.TestField("Document Status", Rec."document status"::Active);
                        SettingandModeration.NotifyModeratoronReject(Rec);
                        Rec."Document Status" := Rec."document status"::Rejected;
                        Message('Moderator Notified successfully');
                    end;
                end;
            }
            action("Notify Reviewer")
            {
                ApplicationArea = Basic;
                Enabled = Rec."Document Status" = Rec."Document Status"::Accepted;
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to notify ?', true) = true then begin
                        Rec.TestField("Document Status", Rec."document status"::Accepted);
                        SettingandModeration.NotifyReviewer(Rec);
                        Rec."Document Status" := Rec."document status"::"Pending Confirmation";
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

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Close the voucher ?', true) = true then begin
                        Rec.TestField("Document Status", Rec."document status"::"Pending Confirmation");
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

#pragma implicitwith restore

