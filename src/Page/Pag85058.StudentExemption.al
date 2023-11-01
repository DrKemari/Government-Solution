#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85058 "Student Exemption"
{
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
                field("Additional Exemption"; Rec."Additional Exemption")
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
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                }
                field("Exemption Receipt 6No."; Rec."Exemption Receipt 6No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Exemption Invoice No."; Rec."Exemption Invoice No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
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
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                }
                group("Institution Sponsored Only")
                {
                    Caption = 'Institution Sponsored Only';
                    field("Institution Code"; Rec."Institution Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Institution Name"; Rec."Institution Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Institution Reference No."; Rec."Institution Reference No.")
                    {
                        ApplicationArea = Basic;
                    }
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
                SubPageLink = "Header No." = field("No."),
                              "Course Id" = field("Examination ID");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control56; "Applicant Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(18),
                              "No." = field("No.");
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
            }
            systempart(Control53; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control48; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Run Exemption Batch")
            {
                ApplicationArea = Basic;
                Image = PutawayLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var

                begin
                    if Confirm('Are you sure you want to run the exemption batch for this application') = true then begin
                        Examination.RunAutoExemptSingle(Rec);
                        Examination.FnClearAttemptedPapers(Rec."No.");
                        Examination.FNClearExemptedPpaers2(Rec."No.");

                        Message('Completed');
                    end
                end;
            }
            action("Post Voucher")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ExemptionEntries1: Record "Exemption Entries";
                begin
                    Rec.TestField("Exemption Invoice No.");
                    ExemptionEntries1.Reset;
                    ExemptionEntries1.SetRange("Exemption Voucher No.", Rec."No.");
                    if ExemptionEntries1.FindSet then begin
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted Date" := Today;
                        Rec."Posted On" := CurrentDatetime;
                        Rec.Modify(true);


                    end else begin
                        Examination.PostExemptionVoucher(Rec);
                    end
                end;
            }
            action("Process Invoice")
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT002: label 'This function is not allowed for institution applications,kindly use  "Apply Institution Payment"';
                    TXT003: label 'This is only allowed for self-sponsored students';
                    TXT004: label 'Are you sure you want to process invoice for this application';
                begin
                    if Rec."Institution Code" = '' then begin
                        Rec.TestField("Fee Type");
                        if Confirm(TXT004) = true then begin

                            Examination.ExemptionCreateInvoice(Rec);
                        end
                    end else
                        Error(TXT002);
                end;
            }
            action("Process Receipt")
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to process the receipt for this application';
                begin
                    if Confirm(TXT001) = true then begin
                        Rec.TestField("Exemption Invoice No.");
                        Examination.ExemptionCreatReceipt(Rec);
                    end
                end;
            }
            action("Send Student Invoice")
            {
                ApplicationArea = Basic;
                Image = OrderReminder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Exemption Invoice No.");
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85099, true, false, Rec);
                end;
            }
            action("Pay Now")
            {
                ApplicationArea = Basic;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                RunObject = Page "MPESA Payment";
                RunPageLink = "No." = field("No.");

                trigger OnAction()
                var
                    TXT001: label 'Initiate an MPESA payment request?';
                begin
                    // CALCFIELDS("Booking Amount");
                    // IF "Booking Amount">0 THEN BEGIN
                    //  IF CONFIRM(TXT001)=TRUE THEN BEGIN
                    //
                    //       Payment.FnSendstkpush("No.","Phone No.","Booking Amount");
                    //    END
                    // END
                end;
            }
            action("Student Qualifications")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page "ExemptionStudent Qualification";
                RunPageLink = "Document No." = field("No.");
            }
            action("Allocate Student Amount")
            {
                ApplicationArea = Basic;
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Payment Reference No.");
                    Rec.TestField("Student No.");
                    Examination.AllocateTotalStudentBalance(Rec);
                end;
            }
            action("Reject Application")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //send email notification for rejection with reasons
                    Rec.TestField("Reason for Rejection");
                    Examination.ApplicationSendRegretEmail(Rec);
                end;
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

                trigger OnAction()
                var
                    TXT001: label 'Apply the value %1 to %2';
                begin
                    Rec.TestField("Student No.");
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            action("Mark as Manual Exemption")
            {
                ApplicationArea = Basic;
                Image = ManualExchangeRate;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                    TXT001: label 'You do not have sufficient rights to perform this function!Please contact system administrator.';
                begin
                    UserSetup.Get(UserId);
                    if ((UserSetup."Revenue Admin" = false) or (UserSetup."Student Mgmt Admin" = false)) then
                        Error(TXT001) else begin
                        Rec.Portal := false;
                        Rec."Manual Input" := true;
                        Rec.Modify(true);
                    end
                end;
            }
            group("Institution Payment")
            {
                action("Apply Institution Payment ")
                {
                    ApplicationArea = Basic;
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Post payment for %1 to the institution %2';
                    begin
                        Rec.TestField("Institution Reference No.");
                        Rec.TestField("Institution Code");
                        if Confirm(TXT001, true, Rec."ID Number/Passport No.", Rec."Institution Name") = true then begin
                            Examination.ApplyInstitutionPayment(Rec)
                        end
                    end;
                }
                action("Bank Import Entries")
                {
                    ApplicationArea = Basic;
                    Image = CheckRulesSyntax;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    RunObject = Page "Bank Import Entries";
                    RunPageMode = View;
                    RunPageView = where(Closed = filter(false));
                    Visible = false;
                }
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
                    Visible = false;

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
                    Visible = false;

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
                    PromotedCategory = Category9;
                    Visible = false;

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
                    PromotedCategory = Category9;
                    Visible = false;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval cancelled');
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
                    Visible = false;
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
                action("Remove Invoice")
                {
                    ApplicationArea = Basic;
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Do you want to delete the invoice for %1';
                        UserSetup: Record "User Setup";
                        TXT002: label 'You do not have sufficient rights to perform this transaction,consult the system administrator';
                    begin
                        if Confirm(TXT001, true, Rec."No.") = true then begin
                            UserSetup.Reset;
                            UserSetup.SetRange("Revenue Admin", true);
                            UserSetup.SetRange("User ID", UserId);
                            if UserSetup.FindFirst then begin
                                Examination.ExemptionRemoveInvoice(Rec);
                            end else
                                Error(TXT002);

                        end;
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
        //Payment: Codeunit UnknownCodeunit50104;
        DMSManagement: Codeunit "DMS Management";

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

