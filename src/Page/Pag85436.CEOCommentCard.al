#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85436 "CEO Comment Card"
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
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field("Resource Name"; Rec."Resource Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource Name field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Sitting field.';
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field("Moderator No."; Rec."Moderator No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Moderator No. field.';
                }
                field("Moderator Name"; Rec."Moderator Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Moderator Name field.';
                }
                field("Reviewer No."; Rec."Reviewer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reviewer No. field.';
                }
                field("Reviewer Name"; Rec."Reviewer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reviewer Name field.';
                }
                field("Chief Examiner  No."; Rec."Chief Examiner  No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chief Examiner  No. field.';
                }
                field("Chief Examiner  Name"; Rec."Chief Examiner  Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chief Examiner  Name field.';
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Code field.';
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Name field.';
                }
                field("No. of Topics Examined"; Rec."No. of Topics Examined")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Topics Examined field.';
                }
                field("No. of Topics in Syllabus"; Rec."No. of Topics in Syllabus")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Topics in Syllabus field.';
                }
                field("% of Syllabus Examined"; Rec."% of Syllabus Examined")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the % of Syllabus Examined field.';
                }
            }
            part(Control20; "Disclosure Relatives")
            {
                Caption = 'Disclosure Relatives/Kin';
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = const("CEO Comments");
                ApplicationArea = Basic;
            }
            part(Control15; "CEO Specific Comments")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            part(Control14; "CEO General Comments")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            group("Final Verdict Details")
            {
                field("Final Verdict"; Rec."Final Verdict")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Verdict field.';
                }
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
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(85404, true, false, Rec);
                end;
            }
            action("Suggest Examined Questions")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Examined Questions action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest moderated questions for the paper %1';
                begin
                    if Confirm(TXT001, true, Rec."Paper Code") = true then begin
                        SettingandModeration.SuggestExaminedQuestions(Rec);
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
                ToolTip = 'Executes the Approve action.';
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
                ToolTip = 'Executes the Reject action.';
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
                ToolTip = 'Executes the Notify Reviewer action.';
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
                ToolTip = 'Executes the Close action.';
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
        Rec."Document Type" := Rec."document type"::CEO
    end;

    var
        SettingandModeration: Codeunit "Setting and Moderation";
}

#pragma implicitwith restore

