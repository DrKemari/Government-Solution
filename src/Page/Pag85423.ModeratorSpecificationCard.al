#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85423 "Moderator Specification Card"
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the % of Syllabus Examined field.';
                }
            }
            part(Control14; "Moderator Final Questions")
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
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Commit;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(85403, true, false, Rec);
                end;
            }
            action("Suggest Questions")
            {
                ApplicationArea = Basic;
                Image = SuggestGrid;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Questions action.';
                trigger OnAction()
                begin
                    if Confirm(TXT001) = true then begin
                        SettingandModeration.SuggestModeratorNoOfQuestions(Rec);
                    end
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("No. of Topics Examined");
        if ((Rec."No. of Topics Examined" > 0) and (Rec."No. of Topics in Syllabus" > 0)) then begin
            Rec."% of Syllabus Examined" := (Rec."No. of Topics Examined" / Rec."No. of Topics in Syllabus") * 100;
            Rec.Modify
        end
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Moderator;
    end;

    var
        SettingandModeration: Codeunit "Setting and Moderation";
        TXT001: label 'Are you sure you want to populate the number of questions required';
}

#pragma implicitwith restore

