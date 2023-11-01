#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85192 "Posted Certificate Collect Car"
{
    Caption = 'Certificate Collection Voucher';
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
                field("Certificate No."; Rec."Certificate No.")
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
                field("Collection Date"; Rec."Collection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Collected By Name"; Rec."Collected By Name")
                {
                    ApplicationArea = Basic;
                }
                field("Collected By ID No."; Rec."Collected By ID No.")
                {
                    ApplicationArea = Basic;
                }
                field("Collected By Email"; Rec."Collected By Email")
                {
                    ApplicationArea = Basic;
                }
                field("Issued By Officer"; Rec."Issued By Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Issued By Officer Name"; Rec."Issued By Officer Name")
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
                action("Notify the Student")
                {
                    ApplicationArea = Basic;
                    Caption = 'Notify the Student';
                    Image = OnlineHelp;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    var
                        TXT001: label 'Notify student of the certificate dispatch';
                    begin
                        Rec.TestField("Collected By ID No.");
                        Rec.TestField("Certificate No.");
                        if Confirm(TXT001) = true then begin
                            Examination.CertificateSendEmail(Rec);
                        end
                    end;
                }
                action("Close Study")
                {
                    ApplicationArea = Basic;
                    Image = CancelIndent;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Complete the Student Processes?';
                    begin
                        Rec.TestField("Collected By ID No.");
                        Rec.TestField("Certificate No.");
                        Rec.TestField("Issued By Officer");
                        if Confirm(TXT001) = true then begin
                            Examination.CloseExaminationAccount(Rec);
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
        Rec."Document Type" := Rec."document type"::Collection;
    end;

    var
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

