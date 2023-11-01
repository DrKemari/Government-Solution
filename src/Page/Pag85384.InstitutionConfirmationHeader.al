#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85384 "InstitutionConfirmation Header"
{
    Caption = 'Institution Confirmation Header';
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
                field("Requestor No."; Rec."Requestor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requestor No. field.';
                }
                field("Requested By Name"; Rec."Requested By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By Name field.';
                }
                field("Requested By E-Mail"; Rec."Requested By E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By E-Mail field.';
                }
                field("Mode of Dispatch"; Rec."Mode of Dispatch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mode of Dispatch field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fee Type field.';
                }
                field("Activation Amount"; Rec."Activation Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activation Amount field.';
                }
                field("Activation Receipt No."; Rec."Activation Receipt No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activation Receipt No. field.';
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Reference No. field.';
                }
                field("Activation Invoice No."; Rec."Activation Invoice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activation Invoice No. field.';
                }
            }
            part(Control37; "Confirmation Lines")
            {
                SubPageLink = "Booking Header No." = field("No."),
                              "Student No." = field("Student No."),
                              "Document Type" = field("Document Type");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
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
                    TXT001: label 'Are you sure you want to process an invoice?';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.ConfirmationCreateInvoice(Rec);
                    end
                end;
            }
            action("Process Receipt")
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Process Receipt action.';
                trigger OnAction()
                var
                    TXT001: label 'Proceed with processing a receipt?';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.ConfirmationCReceipt(Rec);
                    end
                end;
            }
            group("Student Application")
            {
                Caption = 'Student Application';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
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
                    PromotedIsBig = true;
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
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85009, true, false, Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Institution Confirmation";
    end;

    var
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

