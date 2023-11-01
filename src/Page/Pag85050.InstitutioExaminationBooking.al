#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85050 "Institutio Examination Booking"
{
    PageType = Card;
    SourceTable = "Bulk Processing Header";

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
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution No. field.';
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name field.';
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
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Type field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control17; "Institution Booking Lines")
            {
                SubPageLink = "Bulk Header No." = field("No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
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
                begin
                    CreateInvoice(Rec);
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
                begin
                    CReceipt(Rec);
                end;
            }
            action("Import Student Details")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = XMLport BulkRegistrationImport;
                ToolTip = 'Executes the Import Student Details action.';
            }
            action("Update Booking Lines")
            {
                ApplicationArea = Basic;
                Image = ResetStatus;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Updates Studsent ID.';
                trigger OnAction()
                var
                    myInt: Integer;
                    ExamAcc: Record "Examination Account";
                    ExamRes: Record "Exemption Entries";
                    Papers: Record Papers;
                    BulkProcessingLines: Record "Bulk Processing Lines";
                begin
                    ExamAcc.Reset();
                    ExamAcc.SetFilter("Registration No.", '<>%1', '');
                    if ExamAcc.FindSet() then begin
                        repeat
                            BulkProcessingLines.Reset();
                            BulkProcessingLines.SetRange("Registration No.", ExamAcc."Registration No.");
                            BulkProcessingLines.SetRange("Bulk Header No.", Rec."No.");
                            if BulkProcessingLines.FindSet() then begin
                                repeat
                                    BulkProcessingLines."Student No." := ExamAcc."Student Cust No.";
                                    BulkProcessingLines."ID Number" := ExamAcc."ID No.";
                                    BulkProcessingLines."Email" := ExamAcc.Email;
                                    BulkProcessingLines."First Name" := ExamAcc."First Name";
                                    BulkProcessingLines."Middle Name" := ExamAcc."Middle Name";
                                    BulkProcessingLines.Surname := ExamAcc.Surname;
                                    BulkProcessingLines."Student Name" := ExamAcc.Name;
                                    BulkProcessingLines.Gender := ExamAcc.Gender;
                                    BulkProcessingLines."Examination Project Code" := 'JUNE2023';
                                    BulkProcessingLines."Examination Project Name" := '2023 JUNE';
                                    BulkProcessingLines."Examination Cyce" := 'JUNE2023';
                                    // IF BulkProcessingLines."Course ID" = '' then begin
                                    //     BulkProcessingLines."Course ID" := 'RCHRP';
                                    //     BulkProcessingLines."Course Description" := 'CERTIFIED HUMAN RESOURCE PROFESSIONALS';
                                    // end;

                                    Papers.Reset();
                                    Papers.SetRange(Code, BulkProcessingLines.Paper);
                                    if Papers.FindSet() then
                                        BulkProcessingLines.Part := Papers.Level;
                                    BulkProcessingLines.Description := Papers.Description;
                                    BulkProcessingLines.Validate(Paper);
                                    BulkProcessingLines.Modify(true);
                                until BulkProcessingLines.Next = 0;

                            end;

                        until ExamAcc.Next = 0;

                    end;

                    Message('Done');
                end;
            }

            action("Post Voucher")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post Voucher action.';
                trigger OnAction()
                begin
                    //Examination.PostCenterBookingAllocation(Rec);
                    Examination.PostBulkExaminationVoucher(Rec);
                    Rec.Posted := TRUE;
                    Rec."Posted By" := USERID;
                    Rec."Posted On" := CURRENTDATETIME;
                    Rec.MODIFY(TRUE);
                    /*PostVoucher(Rec);
                    Rec.Posted:=TRUE;
                    */

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
                    PromotedCategory = Category9;
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
                    PromotedCategory = Category9;
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
                //  RunObject = Report "Bulk Booking Report";
                ToolTip = 'Executes the Print action.';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Booking;
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
        TXT001: label 'Are you sure you want to create the Account';
        TXT002: label 'The student %1 has been created to the customer account %2';
        TXT003: label 'The student %1 already has an existing customer account %2';
        TXT004: label 'The invoice %1 has been created and sent succesfully';
        TXT005: label 'The voucher %1, has been posted succesfully';
        EntryNo: Integer;
        Examination: Codeunit Examination;

    local procedure CreateInvoice(BulkProcessingHeader: Record "Bulk Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        SalesInv.Init;
        SalesInv."Document Type" := SalesInv."document type"::Invoice;
        SalesInv."No." := '';
        SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."Institution No.");
        SalesInv."Document Date" := Today;
        SalesInv."Order Date" := Today;
        SalesInv."Posting Date" := Today;
        SalesInv."External Document No." := BulkProcessingHeader."No.";
        SalesInv.Type := SalesInv.Type::Normal;
        SalesInv."Prepayment %" := 100;//enforce prepayment`
        SalesInv.Insert(true);
        //get resource entry
        ResourcePrice.Reset;
        ResourcePrice.SetRange(Code, BulkProcessingHeader."Work Type");
        if ResourcePrice.FindSet then begin
            SalesLine.Init;
            SalesLine."Document Type" := SalesLine."document type"::Invoice;
            SalesLine."Document No." := SalesInv."No.";
            SalesLine."No." := ResourcePrice.Code;
            SalesLine.Type := SalesLine.Type::Resource;
            SalesLine.Validate(SalesLine."No.");
            SalesLine.Validate(SalesLine.Quantity, 1);
            SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Total Amount");
            SalesLine.Insert(true);
        end;
        BulkProcessingHeader."Booking Invoice No." := SalesInv."No.";
        BulkProcessingHeader.Modify;
        Message(TXT004, SalesInv."No.");
        //send email pro-forma
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //SMTP.Create('KASNEB STUDENT REGISTRATION', Email2, BulkProcessingHeader.Email,
        // 'KASNEB STUDENT REGISTRATION',
        //  'Dear ' + BulkProcessingHeader."Institution Name" + ',<BR><BR>' +
        //  'Your registration request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        //  'Find attached the invoice for payment', true);
        Filename := Cust."No." + '.pdf';
        Filelocation := 'D:\Docus\' + Filename;
        SalesInv.Reset;
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."No.");
        if SalesInv.FindFirst then begin
            //Report.SaveAsPdf(1302, Filelocation, SalesInv);
        end;
        //SMTP.AddAttachment(Filelocation, Filename);
        //SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>KASNEB STUDENT REGISTRATION<BR>');
        // //SMTP.Send();
    end;


    procedure CReceipt(BulkProcessingHeader: Record "Bulk Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
        CashMngmntSetup: Record "Cash Management Setup";
    begin
        //code to post the created invoice
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Institution No.");
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
            ReceiptLines."Account No." := BulkProcessingHeader."Institution No.";
            ReceiptLines.Validate("Account No.");
            ReceiptLines.Insert(true);
            Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
        end else begin
            Error('There is no invoice relating to the application %1', BulkProcessingHeader."No.");
        end
    end;

    local procedure PostVoucher(StudentProcessingHeader: Record "Bulk Processing Header")
    var
        ExamBookingEntries: Record "Exam Booking Entries";
        BookingLines: Record "Bulk Processing Lines";
    begin
        BookingLines.Reset;
        BookingLines.SetRange("Bulk Header No.", StudentProcessingHeader."No.");
        if BookingLines.FindSet then begin
            repeat
                ExamBookingEntries.Reset;
                if ExamBookingEntries.FindLast then begin
                    EntryNo := ExamBookingEntries."Entry No.";
                end;
                ExamBookingEntries.Init;
                ExamBookingEntries."Entry No." := EntryNo + 1;
                ExamBookingEntries.Code := StudentProcessingHeader."No.";
                ExamBookingEntries."Student Reg No." := BookingLines."Registration No.";
                ExamBookingEntries.Validate("Student Reg No.");
                ExamBookingEntries."Exam Center" := BookingLines."Preferred Exam Center";
                ExamBookingEntries.Examination := BookingLines."Course ID";
                ExamBookingEntries.Paper := BookingLines."Subject Code";
                ExamBookingEntries."Currency Code" := BookingLines."Currency Code";
                ExamBookingEntries."Fee Amount" := BookingLines."Amount LCY";
                ExamBookingEntries.Validate("Currency Code");
                ExamBookingEntries.Insert;
            until BookingLines.Next = 0;
            Message(TXT005, StudentProcessingHeader."No.");
        end;
    end;
}

#pragma implicitwith restore

