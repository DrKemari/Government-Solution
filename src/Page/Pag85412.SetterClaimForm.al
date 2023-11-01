#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85412 "Setter Claim Form"
{
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
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
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
                field("Examiner Code"; Rec."Examiner Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examiner Name"; Rec."Examiner Name")
                {
                    ApplicationArea = Basic;
                }
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                group("Bank Account Details")
                {
                    field("Bank Code"; Rec."Bank Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch"; Rec."Bank Branch")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Name"; Rec."Bank Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Account No."; Rec."Bank Account No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Account Name"; Rec."Account Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("KRA Pin"; Rec."KRA Pin")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            part(Control10; "Checker Submitted Papers")
            {
                Caption = 'Setter Submitted Papers';
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control21; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; Links)
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
                    Report.Run(85402, true, false, Rec);
                end;
            }
            action("Suggest Submitted Papers")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to populate the question details?';
                begin
                    if Confirm(TXT001) = true then begin
                        SettingandModeration.SuggestClaimPaperInfo(Rec);
                    end
                end;
            }
            action(Post)
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TXT0022: Label 'Do you want to Submit the Details ?';
                begin
                    IF CONFIRM(TXT0022) = TRUE THEN BEGIN
                        Rec.TESTFIELD(Posted, FALSE);
                        Rec.Posted := TRUE;
                        Rec."Posted By" := USERID;
                        Rec."Posted On" := CREATEDATETIME(TODAY, TIME);
                        MESSAGE('Submitted Successfully');
                    END
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Setter Claim";
    end;

    var
        SettingandModeration: Codeunit "Setting and Moderation";
}

#pragma implicitwith restore

