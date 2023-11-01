#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Processed Student Exemption (ID 85236).
/// </summary>
#pragma implicitwith disable
Page 85236 "Processed Student Exemption"
{
    Caption = 'Processed Student Exemption';
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
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
                field(Date; Rec.Date)
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
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Exemption Amount"; Rec."Exemption Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Exemption Receipt 6No."; Rec."Exemption Receipt 6No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exemption Receipt No.';
                    Editable = false;
                }
                field("Exemption Invoice No."; Rec."Exemption Invoice No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination  ID';
                    Editable = false;
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ';
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
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control18; "Exemption Lines")
            {
                Editable = false;
                SubPageLink = "Header No." = field("No."),
                              "Course Id" = field("Examination ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Cancel Exemption")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Cancel exemption for the student?';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.CancelExemptionEntries(Rec);
                    end
                end;
            }
            action("Print Exemption Letter")
            {
                ApplicationArea = Basic;
                Image = Report2;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm(TXT001) = true then begin
                        // UserSetup.RESET;
                        // UserSetup.SETRANGE("User ID",USERID);
                        // UserSetup.SETRANGE("Exam Support Admin",TRUE);
                        // IF UserSetup.FINDFIRST THEN BEGIN
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(85022, true, false, Rec);
                        //END
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

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Mandatory Documents")
                {
                    ApplicationArea = Basic;
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Document Lines";
                    RunPageLink = "Examiantion ID" = field("Examination ID");
                    RunPageView = where("Requirement Type" = filter(Mandatory),
                                        "Examination Process" = filter(Exemption));
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        DMSManagement.FnUploadStudentDocuments(Rec."No.", 'Student Exemption', Rec.RecordId);
                    end;
                }
                action("Send Exemption Letter")
                {
                    ApplicationArea = Basic;
                    Image = SendEmailPDF;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        //Examination.ExemptionSendReceipt(Rec);
                        Examination.PostExemptionVoucher(Rec);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Exemption;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        Cust: Record Customer;
        Contact: Record Contact;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ExamFee: Record Resource;
        ExamFeeCost: Record "Resource Cost";
        Amount: Decimal;
        WorkType: Record "Work Type";
        Existing: Boolean;
        ExamAccountNo: Code[30];
        ResourcePrice: Record "Resource Price";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        TXT004: label 'T';
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
        // Payment: Codeunit Payments-Post;
        DMSManagement: Codeunit "DMS Management";
        UserSetup: Record "User Setup";
        TXT001: label 'Are you sure you want to print the student exemption letter';

    local procedure CreateInvoice(BulkProcessingHeader: Record "Student Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        SalesInv.Init;
        SalesInv."Document Type" := SalesInv."document type"::Invoice;
        SalesInv."No." := '';
        SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv."Document Date" := Today;
        SalesInv."Order Date" := Today;
        SalesInv."Posting Date" := Today;
        SalesInv."External Document No." := BulkProcessingHeader."No.";
        SalesInv.Type := SalesInv.Type::Normal;
        SalesInv."Prepayment %" := 100;//enforce prepayment`
        SalesInv.Insert(true);
        //get resource entry
        ResourcePrice.Reset;
        ResourcePrice.SetRange(Code, BulkProcessingHeader."Fee Type");
        if ResourcePrice.FindSet then begin
            SalesLine.Init;
            SalesLine."Document Type" := SalesLine."document type"::Invoice;
            SalesLine."Document No." := SalesInv."No.";
            SalesLine."No." := ResourcePrice.Code;
            SalesLine.Type := SalesLine.Type::Resource;
            SalesLine.Validate(SalesLine."No.");
            SalesLine.Validate(SalesLine.Quantity, 1);
            SalesLine.Validate(SalesLine."Unit Price", ResourcePrice."Unit Price");
            SalesLine.Insert(true);
        end;
        Message(TXT004, SalesInv."No.");
        //send email pro-forma
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //SMTP.Create('KASNEB STUDENT EXEMPTION', Email2, BulkProcessingHeader.Email,
        // 'KASNEB STUDENT EXEMPTION',
        //  'Dear ' + BulkProcessingHeader."Student Name" + ',<BR><BR>' +
        //  'Your exemption request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        //  'Find attached the invoice for payment', true);
        Filename := Cust."No." + '.pdf';
        Filelocation := 'C:\Users\Ruth\Documents\KASNEB DOC\' + Filename;
        //Report.SaveAsPdf(1302, Filelocation, SalesInv);
        //SMTP.AddAttachment(Filelocation, Filename);
        //SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>KASNEB STUDENT REGISTRATION<BR>');
        //SMTP.Send();
    end;


    procedure CReceipt(BulkProcessingHeader: Record "Student Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
    begin
        //code to post the created invoice
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Student No.");
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.Find('-') then begin
            SalesPostYesNo.Run(SalesInv);
            Message('Invoice %1 has been posted Successfully', SalesInv."No.");
            CashMngmntSetup.Get();
            NoSeriesMgt.InitSeries(CashMngmntSetup."Receipt Nos", CashMngmntSetup."Receipt Nos", 0D, NoSeries, CashMngmntSetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Payment Reference" := BulkProcessingHeader."No.";
            ReceiptHeader."Cheque No" := BulkProcessingHeader."No.";
            ReceiptHeader.Insert(true);
            ReceiptLines.Init;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines."Applies to Doc. No" := SalesInv."No.";
            ReceiptLines."Account No." := BulkProcessingHeader."Student No.";
            ReceiptLines.Validate("Account No.");
            ReceiptLines.Insert(true);
        end;
    end;
}

#pragma implicitwith restore

