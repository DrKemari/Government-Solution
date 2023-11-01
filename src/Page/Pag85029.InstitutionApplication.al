#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85029 "Institution Application"
{
    DeleteAllowed = false;
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution No. field.';
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Institution Name field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Type field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                group("Customer Details")
                {
                    Editable = false;
                    field("Total Amount"; Rec."Total Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Total Amount field.';
                    }
                    field("Application Invoice"; Rec."Application Invoice")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Application Invoice field.';
                    }
                    field("Application Amount"; Rec."Application Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Application Amount field.';
                    }
                    field("Application Receipt"; Rec."Application Receipt")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Application Receipt field.';
                    }
                }
            }
            group("Contact Details")
            {
                Editable = false;
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
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
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
            }
            part(Control10; "Institution Processing Lines")
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
            action("Onboard Students")
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Onboard Students action.';
                trigger OnAction()
                begin
                    OnboardCustomer(Rec);
                end;
            }
            action("Reject Application")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reject Application action.';
            }
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
            group("Student Application")
            {
                Caption = 'Student Application';
                Image = "Order";
                action("Import Student Details")
                {
                    ApplicationArea = Basic;
                    Image = ImportExcel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Import Student Details action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        BulkRegistrationImport.GetVariables(Rec);
                        BulkRegistrationImport.Run;
                    end;
                }
                action("Process Payments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Process Payments action.';
                }
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
                PromotedIsBig = true;
                PromotedOnly = true;
               // RunObject = Report "Bulk Application Report";
                ToolTip = 'Executes the Print action.';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Registration;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        TXT001: label 'Are you sure you want to onboard the selected students';
        Cust: Record Customer;
        ExamFee: Record Resource;
        ExamFeeCost: Record "Resource Cost";
        Amount: Decimal;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        CashMngmntSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BulkProcessingLines: Record "Bulk Processing Lines";
        ExamAccountNo: Code[30];
        StudentNames: Text;
        WorkType: Record "Work Type";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        FileName: Text;
        FileLocation: Text;
        SalesHeader: Record "Sales Header";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        BulkLines: Record "Bulk Processing Lines";
        BulkRegistrationImport: XmlPort BulkRegistrationImport;

    local procedure OnboardCustomer(BulkProcessingHeader: Record "Bulk Processing Header")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        salesheader: Page "Sales Invoice";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLines: Record "Receipt Lines1";
        PaymentPost: Codeunit "Payments-Post";
        BOSAACC: Code[20];
        Amount: Decimal;
        FileDirectory: Text;
        FileName: Text;
        SMTPMailSet: Record "Email Account";
        Notification1: Codeunit "Email Message";
        objCustomer: Record Customer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BulkProcessingLines: Record "Bulk Processing Lines";
    begin
        ExaminationSetup.Get();
        AppNo := '';
        if Confirm(TXT001, false) = true then begin
            BulkProcessingLines.Reset;
            BulkProcessingLines.SetRange("Bulk Header No.", BulkProcessingHeader."No.");
            BulkProcessingLines.SetRange(Passed, true);
            if BulkProcessingLines.FindSet then begin
                repeat
                    AppNo := '';
                    Cust.Reset;
                    Cust.SetRange("ID. No.", BulkProcessingLines."ID Number");
                    if not Cust.FindSet then begin
                        NoSeriesMgt.InitSeries(ExaminationSetup."Student Nos.", ExaminationSetup."Student Nos.", 0D, AppNo, ExaminationSetup."Student Nos.");
                        Cust."No." := AppNo;
                        Cust."Funding Class" := Cust."funding class"::Student;
                        Cust.Name := BulkProcessingLines."First Name" + ' ' + BulkProcessingLines."Middle Name" + ' ' + BulkProcessingLines.Surname;
                        Cust."First Name" := BulkProcessingLines."First Name";
                        Cust."Middle Name" := BulkProcessingLines."Middle Name";
                        Cust."Last Name" := BulkProcessingLines.Surname;
                        Cust.Address := BulkProcessingLines.Address;
                        Cust."Address 2" := BulkProcessingLines."Address 2";
                        Cust."Post Code" := BulkProcessingLines."Post Code";
                        Cust.Validate("Post Code");
                        Cust."Currency Code" := BulkProcessingLines."Currency Code";
                        //get work type
                        WorkType.Reset;
                        WorkType.SetRange(Code, BulkProcessingHeader."Type Code");
                        if WorkType.FindSet then begin
                            Cust."Gen. Bus. Posting Group" := WorkType."Gen. Bus. Posting Group";
                            Cust."Customer Posting Group" := WorkType."Customer Posting Group";
                        end;
                        Cust."NCPWD No." := BulkProcessingLines."NCPWD No.";
                        Cust."ID. No." := BulkProcessingLines."ID Number";
                        Cust.County := BulkProcessingLines.County;
                        Cust."Phone No." := BulkProcessingLines."Phone No.";
                        Cust."E-Mail" := BulkProcessingLines.Email;
                        Cust."Customer Type" := Cust."customer type"::Student;
                        Cust.Insert(true);
                    end;
                    BulkLines.Reset;
                    BulkLines.SetRange("Line No.", BulkProcessingLines."Line No.");
                    if BulkLines.FindSet then begin
                        BulkLines."Student No." := Cust."No.";
                        BulkLines."Student Name" := Cust.Name;
                        BulkLines.Modify;
                    end;

                until BulkProcessingLines.Next = 0;
                Message('Students have been onboarded succesfully ');
            end;
        end;

    end;


    procedure SendRegretEmail(StudentUser: Record "Bulk Processing Header")
    var
        ContactUsers: Record Contact;
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
    begin
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //SMTP.Create('KASNEB STUDENT REGISTRATION', Email2, StudentUser.Email,
        // 'KASNEB STUDENT REGISTRATION',
        //  'Dear ' + StudentUser."Institution Name" + ',<BR><BR>' +
        //  'Your registration request done on <b>' + ' ' + Format(StudentUser."Created On") + ' ' + '</b> has been rejected.<BR>' +
        //  'The following are the rejected students.', true);
        //SMTP.AppendToBody('Student ID:Student Name');
        BulkProcessingLines.Reset;
        BulkProcessingLines.SetRange("Bulk Header No.", StudentUser."No.");
        BulkProcessingLines.SetRange(Passed, false);
        if BulkProcessingLines.FindSet then begin
            repeat
            //SMTP.AppendToBody('<BR><BR>' + BulkProcessingLines."ID Number" + ':' + BulkProcessingLines."Student Name" + '<BR><BR>');
            until BulkProcessingLines.Next = 0;
        end;


        //SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>KASNEB Registration Department<BR>');
        //SMTP.Send();

    end;

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
        SalesLine.Init;
        SalesLine."Document Type" := SalesLine."document type"::Invoice;
        SalesLine."Document No." := SalesInv."No.";
        SalesLine.Type := SalesLine.Type::Resource;
        SalesLine.Validate(SalesLine."No.", BulkProcessingHeader."Work Type");
        SalesLine.Validate(SalesLine.Quantity, 1);
        BulkProcessingHeader.CalcFields("Total Amount");
        SalesLine.Validate(SalesLine."Unit Price", BulkProcessingHeader."Total Amount");
        SalesLine.Insert(true);
        BulkProcessingHeader."Application Invoice" := SalesInv."No.";
        BulkProcessingHeader.Modify;
        ExaminationSetup.Get;
        Email2 := ExaminationSetup."Registration Sender Email";
        //SMTP.Create('KASNEB STUDENT REGISTRATION', Email2, BulkProcessingHeader.Email,
        // 'KASNEB STUDENT REGISTRATION',
        // 'Dear ' + BulkProcessingHeader."Institution Name" + ',<BR><BR>' +
        // 'Your registration request done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
        // 'Find attached the invoice.' + BulkProcessingHeader."Application Invoice" + '', true);
        FileName := SalesInv."No." + '.pdf';
        FileLocation := 'D:\RUTH\KASNEB\KASNEB DOCUMENTS\' + FileName;
        SalesHeader.Reset;
        SalesHeader.SetRange("No.", SalesInv."No.");
        if SalesHeader.FindFirst then begin
            //Report.SaveAsPdf(1303, FileLocation, SalesHeader);

        end;
        //SMTP.AddAttachment(FileLocation, FileName);
        //SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>KASNEB Registration Department<BR>');
        //SMTP.Send();
    end;


    procedure CReceipt(BulkProcessingHeader: Record "Bulk Processing Header") Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        ReceiptLines: Record "Receipt Lines1";
        NoSeries: Code[30];
    begin
        //code to post the created invoice
        SalesInv.Reset;
        SalesInv.SetRange("Sell-to Customer No.", BulkProcessingHeader."Institution No.");
        SalesInv.SetRange("No.", BulkProcessingHeader."Application Invoice");
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
            ReceiptLines.Description := BulkProcessingHeader."Institution Name" + '-Application amount';
            //get posted invoice number
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("Customer No.", BulkProcessingHeader."Institution No.");
            CustLedgerEntry.SetRange("External Document No.", BulkProcessingHeader."No.");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;


            ReceiptLines."Account No." := BulkProcessingHeader."Institution No.";
            ReceiptLines.Validate("Account No.");
            ReceiptLines.Insert(true);
        end;
        BulkProcessingHeader."Application Receipt" := ReceiptHeader."No.";
        ReceiptHeader.CalcFields(Amount);
        BulkProcessingHeader."Application Amount" := ReceiptHeader.Amount;
        BulkProcessingHeader.Modify;
        //open the receipt card
        Page.Run(57067, ReceiptHeader, ReceiptHeader."No.");
        //send email receipt
    end;

    local procedure AssignRegistrationNo(BulkProcessingHeader: Record "Bulk Processing Header")
    var
        ExaminationAccount: Record "Examination Account";
        Courses: Record Courses;
    begin
        ExamAccountNo := '';
        BulkProcessingLines.Reset;
        BulkProcessingLines.SetRange("Bulk Header No.", BulkProcessingHeader."No.");
        BulkProcessingLines.SetRange(Passed, true);
        if BulkProcessingLines.FindSet then begin
            repeat
                Courses.Reset;
                Courses.SetRange(Code, BulkProcessingLines."Course ID");
                if Courses.FindFirst then begin
                    NoSeriesMgt.InitSeries(Courses."No. Series", Courses."No. Series", 0D, ExamAccountNo, Courses."No. Series");
                    ExaminationAccount.Init;
                    ExaminationAccount."Registration No." := ExamAccountNo;
                    ExaminationAccount."Student Cust No." := BulkProcessingLines."Student No.";
                    ExaminationAccount.Validate("Student Cust No.");
                    ExaminationAccount."Course ID" := BulkProcessingLines."Course ID";
                    ExaminationAccount.Email := BulkProcessingLines.Email;
                    ExaminationAccount."Current Examination Sitting" := BulkProcessingLines."Examination Cyce";
                    ExaminationAccount.Insert;
                end;
            until BulkProcessingLines.Next = 0;
        end
    end;
}

#pragma implicitwith restore

