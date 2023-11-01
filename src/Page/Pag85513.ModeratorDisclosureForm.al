#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85513 "Moderator Disclosure Form"
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
                field(DocumentNo; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy; Rec."Created By")
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
                field(ExaminerCode; Rec."Examiner Code")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminerName; Rec."Examiner Name")
                {
                    ApplicationArea = Basic;
                }
                field(IDNo; Rec."ID No.")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo; Rec."Phone No.")
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
                field(SubmittedOn; Rec."Submitted On")
                {
                    ApplicationArea = Basic;
                }
                field(SubmittedBy; Rec."Submitted By")
                {
                    ApplicationArea = Basic;
                }
                field(NoofPapers; Rec."No. of Papers")
                {
                    ApplicationArea = Basic;
                }
                field(NoofQuestions; Rec."No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                group("Oath of Secrecy")
                {
                    field(SignedOathofSecrecy; Rec."Signed Oath of Secrecy")
                    {
                        ApplicationArea = Basic;
                    }
                    field(OathofSecrecySignedOn; Rec."Oath of Secrecy Signed On")
                    {
                        ApplicationArea = Basic;
                    }
                    field(OathofSecrecyWitnessName; Rec."Oath of Secrecy Witness Name")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            part(Control26; "Disclosure Papers")
            {
                SubPageLink = "Document No." = field("Document No.");
                Visible = false;
            }
            part(Control29; "Disclosure Institutions")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
            part(Control28; "Disclosure Relatives")
            {
                Caption = 'Disclosure Relatives/Kin';
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = const("Setter Disclosure Form");
            }
            part(Control30; "Disclosure Other")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
            part(Control27; "Setter Submitted Papers")
            {
                SubPageLink = "Document No." = field("Document No.");
                Visible = false;
            }
            group("Declaration of Conduct")
            {
                field(Declaration; Rec.Declaration)
                {
                    ApplicationArea = Basic;
                }
                field(DeclarationDate; Rec."Declaration Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control21; Outlook)
            {
            }
            systempart(Control22; Notes)
            {
            }
            systempart(Control23; MyNotes)
            {
            }
            systempart(Control24; Links)
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
                    Report.Run(85412, true, false, Rec);
                end;
            }
            action("Suggest Submitted Papers")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to populate the table of specifications data';
                begin
                    if Confirm(TXT001) = true then begin
                        SettingandModeration.SuggestSetterPaperInfo(Rec);
                    end
                end;
            }
            action(Submit)
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
                    if Confirm('Are you sure you want to submit') = true then begin
                        Rec.TestField(Rec.Posted, false);
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                    end
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Moderator Disclosure";
    end;

    var
        SettingandModeration: Codeunit "Setting and Moderation";
}
