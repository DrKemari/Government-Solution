#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51357 "Finance University Application"
{
    Caption = 'Accreditation Application';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Accreditation Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application Type field.';
                }
                field("Application Type Name"; Rec."Application Type Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application Type Name field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Email field.';
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
                group("Payment Details")
                {
                    field("Rejection Reason"; Rec."Rejection Reason")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Rejection Reason field.';
                    }
                    field("Payment  Reference No."; Rec."Payment  Reference No.")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Payment  Reference No. field.';
                    }
                    field("Payment Document"; Rec."Payment Document")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Payment Document field.';
                    }
                    field("Application Fee LCY"; Rec."Application Fee LCY")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Application Fee LCY field.';
                    }
                    field("Application Fee"; Rec."Application Fee")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Application Fee field.';
                    }
                    field("Receipt No."; Rec."Receipt No.")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Receipt No. field.';
                    }
                    field("Receipt Amount"; Rec."Receipt Amount")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Receipt Amount field.';
                    }
                    field("Invoice No."; Rec."Invoice No.")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Invoice No. field.';
                    }
                    field("Invoice Amount"; Rec."Invoice Amount")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Invoice Amount field.';
                    }
                }
            }
            part(Control9; "Accreditation Questions")
            {
                Editable = false;
                SubPageLink = "Application No." = field("Application No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control14; "Application Categories")
            {
                Editable = false;
                SubPageLink = "Application No." = field("Application No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control29; "Accreditation Admin Staff")
            {
                Editable = false;
                SubPageLink = "Application No." = field("Application No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control28; "Accreditation Trainers")
            {
                Editable = false;
                SubPageLink = "Application No." = field("Application No.");
                Visible = false;
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control24; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("View Assigned Reviewers")
            {
                ApplicationArea = Basic;
                Caption = 'View Assigned Committee';
                Image = view;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Resourcing Card";
                RunPageMode = Edit;
                Visible = false;
                ToolTip = 'Executes the View Assigned Committee action.';
            }
            action("Confirm Payment")
            {
                ApplicationArea = Basic;
                Caption = 'Confirm Payment';
                Image = PostedPayableVoucher;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Confirm Payment action.';
                trigger OnAction()
                var
                    ProgramAccreditation: Record "Accreditation Application";
                begin
                    Rec.TestField(Status, Rec.Status::"Awaiting Payment Processing");
                    AccreditationSetup.Get(Rec."Application Type");
                    Amount := 0;
                    Amount := AccreditationSetup.Amount;
                    // UserSetup.RESET;
                    // UserSetup.SETRANGE("User ID",USERID);
                    // IF UserSetup.FINDFIRST THEN BEGIN
                    // IF UserSetup."Accounts User" THEN BEGIN
                    if Confirm('Are you sure you want to confirm the payment from the applicant?') = true then begin
                        CreateInvoice(Rec);
                        // CreateJob("No.","Application No.");
                        CReceipt(Rec."Application No.");
                        Commit;
                        Rec.Status := Rec.Status::"Awaiting Completeness Checks";
                    end
                    // END ELSE
                    //   ERROR('You do not have sufficient rights  to perform this action,kindly consult the system administrator');
                    // END
                end;
            }
            action("Reject Payment")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reject Payment action.';
                trigger OnAction()
                begin
                    Rec.TestField("Rejection Reason");
                    UserSetup.Reset;
                    UserSetup.SetRange("User ID", UserId);
                    if UserSetup.FindFirst then begin
                        if UserSetup."Accounts User" then begin
                            RejectPayment(Rec);
                        end else
                            Error('You do not have sufficient rights  to perform this action,kindly consult the system administrator');
                    end
                end;
            }
            action("Confirm Payment1")
            {
                ApplicationArea = Basic;
                Caption = 'Confirm Payment';
                Image = PostedPayableVoucher;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Confirm Payment action.';
                trigger OnAction()
                var
                    ProgramAccreditation: Record "Accreditation Application";
                begin
                    Rec.TestField(Status, Rec.Status::"Awaiting Payment Processing");
                    AccreditationSetup.Get(Rec."Application Type");
                    Amount := 0;
                    Amount := AccreditationSetup.Amount;
                    // UserSetup.RESET;
                    // UserSetup.SETRANGE("User ID",USERID);
                    // IF UserSetup.FINDFIRST THEN BEGIN
                    // IF UserSetup."Accounts User" THEN BEGIN
                    if Confirm('Are you sure you want to confirm the payment from the applicant?') = true then begin
                        //CreateInvoice(Rec);
                        CreateJob(Rec."No.", Rec."Application No.");
                        //CReceipt(Rec."Application No.");
                        Commit;
                        Rec.Status := Rec.Status::"Awaiting Completeness Checks";
                    end
                    // END ELSE
                    //   ERROR('You do not have sufficient rights  to perform this action,kindly consult the system administrator');
                    // END
                end;
            }
        }
    }

    var
        UserSetup: Record "User Setup";
        AccreditationSetup: Record "Acc Fee Schedules";
        Amount: Decimal;
        ProgramAccreditation: Record "Accreditation Application";
        Examination: Codeunit Examination;
        CompInfo: Record "Company Information";
        LineNo: Integer;


    procedure CReceipt("ApplicationNo.": Code[30]) Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
        SalesInv: Record "Sales Header";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        cashmgtsetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Code[30];
        ReceiptLines: Record "Receipt Lines1";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        AccreditationApplication: Record "Accreditation Application";
        UserSetup: Record "User Setup";
        AccreditationSetup: Record "Acc Fee Schedules";
        Amount: Decimal;
        ProgramAccreditation: Record "Accreditation Application";
        Examination: Codeunit Examination;
        CompInfo: Record "Company Information";
        ExaminationSetup: Record "Examination Setup";
        Email2: Text;
        SMTP: Codeunit "Email Message";
        Body: Text;
        Filelocation: Text;
        Filename: Text;
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        ReceiptHeader1: Record "Receipts Header1";
        Filelocation1: Text;
        Filename1: Text;
    begin
        /*GenSetUp.GET();
        SalesInv.RESET;
        SalesInv.SETRANGE("Bill-to Customer No.","Institution No.");
        SalesInv.SETRANGE("External Document No.","Accreditation No.");
        IF SalesInv.FIND('-') THEN BEGIN
           SalesPostYesNo.RUN(SalesInv);
        
        cashmgtsetup.GET();
        NoSeriesMgt.InitSeries(cashmgtsetup."Receipt Nos",cashmgtsetup."Receipt Nos",0D,NoSeries,cashmgtsetup."Receipt Nos");
         ReceiptHeader.INIT;
         ReceiptHeader."No.":=NoSeries;
         ReceiptHeader."Application No.":="Accreditation No.";
         ReceiptHeader."Cheque No":="Accreditation No.";
         ReceiptHeader.INSERT(TRUE);
         ReceiptLines.INIT;
         ReceiptLines."Receipt No.":=ReceiptHeader."No.";
         ReceiptLines."Account Type":=ReceiptLines."Account Type"::Customer;
         ReceiptLines."Account No.":="Institution No.";
         ReceiptLines.VALIDATE("Account No.");
         ReceiptLines.INSERT(TRUE);
         PAGE.RUN(57067,ReceiptHeader);
          "Receipt No.":=ReceiptHeader."No.";
           "Invoice No.":=SalesInv."No.";
            Invoiced:=TRUE;
        END*/

        //CReceipt("ApplicationNo." : Code[30]) Created : Boolean
        //post sales invoice

        SalesInv.Reset;
        SalesInv.SetRange("External Document No.", "ApplicationNo.");
        if SalesInv.Find('-') then begin
            SalesPostYesNo.Run(SalesInv);
            cashmgtsetup.Get();
            NoSeriesMgt.InitSeries(cashmgtsetup."Receipt Nos", cashmgtsetup."Receipt Nos", 0D, NoSeries, cashmgtsetup."Receipt Nos");
            ReceiptHeader.Init;
            ReceiptHeader."No." := NoSeries;
            ReceiptHeader."Application No." := Rec."Application No.";
            ReceiptHeader."Cheque No" := Rec."Application No.";
            ReceiptHeader.Insert(true);
            ReceiptLines.Init;

            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines."Account No." := Rec."No.";
            ReceiptLines.Validate("Account No.");

            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", "ApplicationNo.");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines.Description := CustLedgerEntry.Description;
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;
            ReceiptLines.Insert(true);
            AccreditationApplication.Reset;
            AccreditationApplication.SetRange("Application No.", "ApplicationNo.");
            if AccreditationApplication.FindFirst then begin
                AccreditationApplication."Receipt No." := ReceiptHeader."No.";
                AccreditationApplication."Receipt Amount LCY" := AccreditationApplication."Application Fee LCY";
                AccreditationApplication."Receipt Amount" := AccreditationApplication."Application Fee";
                AccreditationApplication.Modify(true);

            end;

            //open the receipt document
            Page.Run(57067, ReceiptHeader);
            //
            // ExaminationSetup.Get;
            // Email2 := ExaminationSetup."Registration Sender Email";
            // //SMTP.Create('KASNEB ACCREDITATION', Email2, Email,
            // 'KASNEB ACCREDITATION',
            //  'Dear ' + Name + ',<BR><BR>' +
            //  'Your payment in relation to the accreditation done on <b>' + ' ' + Format("Created On") + ' ' + '</b> has been processed.<BR>' +
            //  'Find attached the payment receipt', true);
            // Filename := "No." + "Application No." + '.pdf';
            // Filelocation := ExaminationSetup."Examination Path" + Filename;
            // ReceiptHeader1.Reset;
            // ReceiptHeader1.SetRange("No.", ReceiptHeader."No.");
            // if ReceiptHeader1.FindFirst then begin
            //     //Report.SaveAsPdf(56003, Filelocation, ReceiptHeader1);

            // end;
            //            Filename1:='Confirmation-'+"Application No."+'.pdf';
            //            Filelocation1:=ExaminationSetup."Examination Path"+Filename1;
            //              AccreditationApplication.RESET;
            //              AccreditationApplication.SETRANGE("Application No.","ApplicationNo.");
            //              IF AccreditationApplication.FINDFIRST THEN BEGIN
            //               //Report.SaveAsPdf(51252,Filelocation1,AccreditationApplication);
            //
            //              END;

            // //SMTP.AddAttachment(Filelocation, Filename);
            // //SMTP.AddBCC(Email2);
            // //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>KASNEB ACCREDITATION<BR>');
            // //SMTP.Send();

            //
        end;

    end;

    local procedure RejectPayment(ProgramAccreditationTable: Record "Accreditation Application")
    var
        //  SMTP: Record "SMTP Mail Setup";
        Entries: Record Entries;
    //  Notification1: Codeunit "Email Message";
    begin

        // if Confirm('Are you sure you want to reject payment for this application?') = true then begin
        //     //SMTP.Get;
        //     CompInfo.Get;
        //     ProgramAccreditationTable.TestField(Email);
        //     ProgramAccreditationTable.TestField("Rejection Reason");
        //     Notification1.CreateMessage('KASNEB:ACCREDITATION PAYMENT', //SMTP."Email Sender Address", ProgramAccreditationTable.Email, 'KASNEB:ACCREDITATION PAYMENT',
        //     'Dear ' + ProgramAccreditationTable.Name + ',<BR><BR>' +
        //     ' The payment done for the  accreditation application for  ' + ProgramAccreditationTable.Name + ' ' + 'was not succesful,' +
        //     'due to the following reason(s):' + '<BR> <B>' + ProgramAccreditationTable."Rejection Reason" + '</B><BR><BR>', true);
        //     //change address to email
        //     Notification1.AppendToBody(
        //     '<BR><BR>Kind Regards,<BR>' +
        //     'Accreditation Division' + '<BR>' +
        //     CompInfo.Name + '<BR>' +
        //     CompInfo.Address + '<BR>' +
        //     CompInfo."Address 2" + '<BR>' +
        //     CompInfo."Phone No." + '<BR>' +
        //     CompInfo.City);

        // Notification1.AddBCC(//SMTP."Email Sender Address");
        // Notification1.Send;
        // ProgramAccreditationTable."Payment Document" := false;
        // ProgramAccreditationTable."Payment  Reference No." := '';
        // ProgramAccreditationTable.Status := ProgramAccreditationTable.Status::Open;
        // ProgramAccreditationTable.Modify(true);
        // //CREATE ENTRIEs
        // LineNo := 0;
        // Entries.Reset;
        // if Entries.FindLast then begin
        //     LineNo := Entries."Entry No.";
        // end;
        Entries.Init;
        Entries."Entry No." := LineNo + 1;
        Entries."Institution Name" := ProgramAccreditationTable.Name;
        Entries."Institution No." := ProgramAccreditationTable."No.";
        Entries."Accreditation Description" := ProgramAccreditationTable."Rejection Reason";
        Entries.Type := Entries.Type::Rejection;
        Entries."Created By" := UserId;
        Entries."Created On" := CurrentDatetime;
        Entries.Insert;
        Message('Email notification sent to %1,regarding %2', ProgramAccreditationTable.Name, ProgramAccreditationTable."Application No.");
        // end;
    end;

    procedure CreateInvoice(BulkProcessingHeader: Record "Accreditation Application")
    var
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TXT004: label 'The invoice %1,has been sent succesfuly';
        ExaminationSetup: Record "Examination Setup";
        AppNo: Code[30];
        Cust: Record Customer;
        Contact: Record Contact;
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        // CashMngmntSetup: Record "Cash Management  Setup";
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
        LineNo: Integer;
        ExamBookingEntries: Record "Exam Booking Entries";
        Examination: Codeunit Examination;
        TXT001: label 'The invoice %1,has been created succesfully';
        SalesHeader: Record "Sales Header";
        TXT002: label 'An invoice %1 already exists for the application %2';
    begin
        SalesInv.Reset;
        SalesInv.SetRange("External Document No.", BulkProcessingHeader."Application No.");
        if not SalesInv.FindFirst then begin
            SalesInv.Init;
            SalesInv."Document Type" := SalesInv."document type"::Invoice;
            SalesInv."No." := '';
            SalesInv.Validate(SalesInv."Sell-to Customer No.", BulkProcessingHeader."No.");
            SalesInv."Document Date" := Today;
            SalesInv."Order Date" := Today;
            SalesInv."Posting Date" := Today;
            SalesInv."External Document No." := BulkProcessingHeader."Application No.";
            SalesInv.Type := SalesInv.Type::Normal;
            SalesInv."Prepayment %" := 100;//enforce prepayment`
            SalesInv.Insert(true);
            //get resource entry
            AccreditationSetup.Reset;
            AccreditationSetup.SetRange(Service, BulkProcessingHeader."Application Type");
            if AccreditationSetup.FindFirst then begin
                SalesLine.Init;
                SalesLine."Document Type" := SalesLine."document type"::Invoice;
                SalesLine."Document No." := SalesInv."No.";
                SalesLine.Type := SalesLine.Type::Resource;
                SalesLine."No." := AccreditationSetup."Resource No.";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine."Unit Price" := BulkProcessingHeader."Application Fee LCY";
                SalesLine.Validate("Unit Price");
                SalesLine.Validate(Quantity);
                SalesLine.Insert(true);

            end;
            BulkProcessingHeader."Invoice No." := SalesInv."No.";
            BulkProcessingHeader.Modify;
            Message(TXT001, SalesInv."No.");
            //send email pro-forma

            // ExaminationSetup.Get;
            // Email2 := ExaminationSetup."Registration Sender Email";
            // //SMTP.Create('KASNEB ACCREDITATION', Email2, BulkProcessingHeader.Email,
            // 'KASNEB ACCREDITATION',
            //  'Dear ' + BulkProcessingHeader.Name + ',<BR><BR>' +
            //  'Your payment in relation to the accreditation done on <b>' + ' ' + Format(BulkProcessingHeader."Created On") + ' ' + '</b> has been processed.<BR>' +
            //  'Find attached the invoice for payment', true);
            // Filename := BulkProcessingHeader."No." + '.pdf';
            // Filelocation := ExaminationSetup."Examination Path" + Filename;
            // SalesHeader.Reset;
            // SalesHeader.SetRange("No.", SalesInv."No.");
            // if SalesHeader.FindFirst then begin
            //     //Report.SaveAsPdf(1302, Filelocation, SalesHeader);

            // end;
            // //SMTP.AddAttachment(Filelocation, Filename);
            // //SMTP.AddBCC(Email2);
            // //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>For more details contact the following:<BR>');
            // //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>KASNEB ACCREDITATION<BR>');
            // ////SMTP.Send();
            Message(TXT004, SalesInv."No.");
        end else
            Error(TXT002, SalesInv."No.", BulkProcessingHeader."No.");
    end;

    [ServiceEnabled]
    procedure CreateJob(var Number: Code[30]; var ApplicationNumber: Code[30]) CreatedJob: Boolean
    var
        AccFeeSchedules: Record "Acc Fee Schedules";
        Job: Record Job;
        JobTask: Record "Job Task";
        TaskSetup: Record "Accreditation Task Setup";
    begin
        Job.Reset;
        Job."No." := Rec."Application No.";
        Job.Validate(Description, Rec.Name + ' ' + 'Accreditation');
        Job.Validate("Bill-to Customer No.", Rec."No.");
        Job."Creation Date" := Today;
        Job."Starting Date" := Today;
        //Job."Examination Project Type":=Job."Examination Project Type"::"0";
        //Job."Examination Project Subtype":=Job."Examination Project Subtype"::"1";
        Job.Insert(true);
        //create task lines
        TaskSetup.Reset;
        TaskSetup.SetRange(Blocked, false);
        if TaskSetup.FindSet then begin
            repeat
                JobTask."Job No." := Rec."Application No.";
                JobTask."Job Task No." := TaskSetup.Code;
                JobTask.Description := TaskSetup.Description;
                JobTask."Job Task Type" := JobTask."job task type"::Posting;
                JobTask.Insert(true);
            until TaskSetup.Next = 0;
        end;
        Message('The project %1 has been created,Kindly proceed to assign tasks', Rec."Application No.");



    end;
}

#pragma implicitwith restore

