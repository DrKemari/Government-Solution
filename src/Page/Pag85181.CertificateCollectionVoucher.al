#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85181 "Certificate Collection Voucher"
{
    Caption = 'Certificate Collection Voucher';
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student No. field.';
                }
                field("Student Reg. No."; Rec."Student Reg. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Reg. No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ID Number/Passport No./Birth Certificate field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fee Type field.';
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Reference No. field.';
                }
                field("Cert Collect Invoice No."; Rec."Cert Collect Invoice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate Collection Invoice No. field.';
                }
                field("Cert Collect  Receipt No."; Rec."Cert Collect  Receipt No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate Collection  Receipt No. field.';
                }
                field("Total Storage Fee"; Rec."Total Storage Fee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Storage Fee field.';
                }
            }
            group("Examination Details")
            {
                field("Certificate Dispatch Method"; Rec."Certificate Dispatch Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate Dispatch Method field.';
                }
                field("Certificate No."; Rec."Certificate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate No. field.';
                }
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ID';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination ID field.';
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Collection Date"; Rec."Collection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collection Date field.';
                }
                field("Collected By Name"; Rec."Collected By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By Name field.';
                }
                group("Postage Details")
                {
                    field("Post Tracking No."; Rec."Post Tracking No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Post Tracking No. field.';
                    }
                    field("Date of Postage"; Rec."Date of Postage")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Date of Postage field.';
                    }
                }
                field("Collected By ID No."; Rec."Collected By ID No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By ID No. field.';
                }
                field("Collected By Email"; Rec."Collected By Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collected By Email field.';
                }
                field("Issued By Officer"; Rec."Issued By Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By Officer field.';
                }
                field("Issued By Officer Name"; Rec."Issued By Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By Officer Name field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
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
                    ToolTip = 'Executes the Notify the Student action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Notify student of the certificate dispatch';
                    begin
                        Rec.TestField("Collected By ID No.");
                        Rec.TestField("Collected By Email");
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
                    ToolTip = 'Executes the Close Study action.';
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
                action("Preview Certificate")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Preview Certificate action.';
                    trigger OnAction()
                    begin
                        ExaminationAccount.Reset;
                        ExaminationAccount.SetRange("Registration No.", Rec."Student Reg. No.");
                        if ExaminationAccount.FindFirst then begin
                            Report.Run(85040, true, false, ExaminationAccount);
                        end
                    end;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                action("Process Invoice")
                {
                    ApplicationArea = Basic;
                    Image = OpenJournal;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Process Invoice action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Are you sure you want to process an invoice ?';
                        TXT002: label 'Kindly input the line details';
                        TXT003: label 'This is only allowed for self-sponsored students';
                    begin
                        Rec.TestField("Student No.");
                        if Confirm(TXT001) = true then begin

                            if Rec."Total Storage Fee" > 0 then begin
                                Examination.FnCertCollectCreateInvoice(Rec);
                            end else
                                Error(TXT002);
                        end
                    end;
                }
                action("Allocate Student Amount")
                {
                    ApplicationArea = Basic;
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Allocate Student Amount action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Payment Reference No.");
                        Rec.TestField("Student No.");
                        Examination.AllocateTotalStudentBalance(Rec);
                    end;
                }
                action("MPESA Payment Details")
                {
                    ApplicationArea = Basic;
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Mpesa Application";
                    RunPageLink = MPESA_TXN_ID = field("Payment Reference No.");
                    RunPageMode = View;
                    ToolTip = 'Executes the MPESA Payment Details action.';
                }
                action("Bank Payment Details")
                {
                    ApplicationArea = Basic;
                    Image = AnalysisView;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Bank Payment Details";
                    RunPageLink = "Reference No." = field("Payment Reference No.");
                    RunPageMode = View;
                    Visible = false;
                    ToolTip = 'Executes the Bank Payment Details action.';
                }
                action("Apply Student Balance")
                {
                    ApplicationArea = Basic;
                    Image = CalendarWorkcenter;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    RunObject = Page "Student Balances";
                    RunPageLink = "Customer No." = field("Student No.");
                    Visible = false;
                    ToolTip = 'Executes the Apply Student Balance action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Apply the value %1 to %2';
                    begin
                        Rec.TestField("Student No.");
                    end;
                }
                action("Send Confirmation Letter")
                {
                    ApplicationArea = Basic;
                    Image = SendEmailPDF;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Send Confirmation Letter action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Send student %1,confirmation letter';
                    begin
                        if Confirm(TXT001, true, Rec."Student No.") = true then begin
                            Rec.TestField("Activation Invoice No.");
                            Rec.TestField("Activation Receipt No.");
                            Examination.ConfirmationSendReceipt(Rec);
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
                    ToolTip = 'Executes the Approvals action.';
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
                    ToolTip = 'Executes the Send A&pproval Request action.';
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
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
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
        ExaminationAccount: Record "Examination Account";
}

#pragma implicitwith restore

