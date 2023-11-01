#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85407 "Setter Disclosure Form"
{
    Caption = 'Setter Disclosure Form';
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
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                }
                field("Submitted On"; Rec."Submitted On")
                {
                    ApplicationArea = Basic;
                }
                field("Submitted By"; Rec."Submitted By")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Papers"; Rec."No. of Papers")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Questions"; Rec."No. of Questions")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control26; "Disclosure Papers")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            part(Control29; "Disclosure Institutions")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            part(Control28; "Disclosure Relatives")
            {
                Caption = 'Disclosure Relatives/Kin';
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = const("Setter Disclosure Form");
                ApplicationArea = Basic;
            }
            part(Control30; "Disclosure Other")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            part(Control27; "Setter Submitted Papers")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            group("Declaration of Conduct")
            {
                field(Declaration; Rec.Declaration)
                {
                    ApplicationArea = Basic;
                }
                field("Declaration Date"; Rec."Declaration Date")
                {
                    ApplicationArea = Basic;
                }
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
                    Report.Run(85401, true, false, Rec);
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
                    TXT001: label 'Are you sure you want to populate the table of specifications data';
                begin
                    if Confirm(TXT001) = true then begin
                        SettingandModeration.SuggestSetterPaperInfo(Rec);
                    end
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Setter Disclosure";
    end;

    var
        SettingandModeration: Codeunit "Setting and Moderation";
}

#pragma implicitwith restore

