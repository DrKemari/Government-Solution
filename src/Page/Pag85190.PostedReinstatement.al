#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85190 "Posted Reinstatement"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Student Processing Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Case No."; Rec."Previous Case No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student Reg. No."; Rec."Student Reg. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Highest Academic QCode"; Rec."Highest Academic QCode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Examination Details")
            {
                field("Reinstatement Commitee"; Rec."Reinstatement Commitee")
                {
                    ApplicationArea = Basic;
                }
                field("Reinstatement  Name"; Rec."Reinstatement  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Verdict Description"; Rec."Verdict Description")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Commitee"; Rec."Disciplinary Commitee")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Commitee Name"; Rec."Commitee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Case Code"; Rec."Case Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = Basic;
                }
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ID';
                    Editable = false;
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                    Editable = false;
                }
                field("Examination Center Code"; Rec."Examination Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Project Code"; Rec."Examination Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Project Name"; Rec."Examination Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Student Case")
            {
                Caption = 'Student Case';
                Image = "Order";
                action("Commiitee Members")
                {
                    ApplicationArea = Basic;
                    Image = AgreementQuote;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Disciplinary Commitee";
                    RunPageLink = Code = field("Reinstatement Commitee");
                }
                action("Notify the Student")
                {
                    ApplicationArea = Basic;
                    Caption = 'Notify the Student';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    var
                        TXT001: label 'Notify student of the verdict';
                    begin
                        Rec.TestField("Verdict Description");
                        if Confirm(TXT001) = true then begin
                            Examination.CaseSendVerdictEmail(Rec);
                        end
                    end;
                }
                action("Close Case")
                {
                    ApplicationArea = Basic;
                    Image = CancelIndent;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Effect the case verdict on student?';
                    begin
                        Rec.TestField("Verdict Description");
                        if Confirm(TXT001) = true then begin
                            Examination.EffectReinsVerdict(Rec);
                        end
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval sent');
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval cancelled');
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Reinstatement;
    end;

    var
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

