page 85509 "Setter Planning Form"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Setter Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                }
                field("Tos Submission Start Date"; Rec."Tos Submission Start Date")
                {
                }
                field("Tos Submission End Date"; Rec."Tos Submission End Date")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Created On"; Rec."Created On")
                {
                }
            }
            part(Control28; "Setter Task Allocation")
            {
                Caption = 'Setter Task Allocation';
                SubPageLink = "Document No" = FIELD("Document No."), "Examination Sitting" = FIELD("Examination Sitting");
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
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SETRANGE(Rec."Document No.", Rec."Document No.");
                    REPORT.RUN(85457, TRUE, FALSE, Rec);
                end;
            }
            action("Suggest Setters")
            {
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SettingandModeration: Codeunit "Setting and Moderation";
                    TXT001: Label 'Are you sure you want to populate the required number of questions';
                begin
                    IF CONFIRM(TXT001) = TRUE THEN BEGIN
                        //SettingandModeration.SuggestSettersandSubjects(Rec);
                    END
                end;
            }
            action(Post)
            {
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SettingandModeration: Codeunit "Setting and Moderation";
                    TXT001: Label 'Are you sure you want to populate the required number of questions';
                begin
                    IF CONFIRM('Are you sure you want to post ?') = TRUE THEN BEGIN
                        //SettingandModeration.SuggestNoOfQuestions(Rec);
                        Rec.Posted := TRUE;
                        Rec."Posted By" := USERID;
                        Rec."Posted On" := CURRENTDATETIME;
                    END
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::"Setter Planning Form";
    end;

    var
        Totals: Decimal;
}

