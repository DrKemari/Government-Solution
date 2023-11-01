#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51213 "Awaiting Processing"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Ins. Accreditation Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Accreditation No."; Rec."Accreditation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accreditation No. field.';
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution No. field.';
                }
                field("Institution Name."; Rec."Institution Name.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name. field.';
                }
                field("Institution Campus"; Rec."Institution Campus")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Campus field.';
                }
                field("Institution Phone No."; Rec."Institution Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Phone No. field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Accreditation Code"; Rec."Accreditation Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accreditation Code field.';
                }
                field("KRA Pin"; Rec."KRA Pin")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the KRA Pin field.';
                }
                field(Sponsor; Rec.Sponsor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sponsor field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Communication Details")
            {
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
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
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Caption = 'Email';
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
            }
            group("Payment & Verification")
            {
                group("University Transactions")
                {
                    field("Payment Reference No."; Rec."Payment Reference No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Payment Reference No. field.';
                    }
                    field("Receipt No."; Rec."Receipt No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Receipt No. field.';
                    }
                    field("Received Amount"; Rec."Received Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Received Amount field.';
                    }
                    field("Invoice No."; Rec."Invoice No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Invoice No. field.';
                    }
                    field("Payment Document"; Rec."Payment Document")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Payment Document field.';
                    }
                    field("Invoiced Amount"; Rec."Invoiced Amount")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        RowSpan = 2;
                        ToolTip = 'Specifies the value of the Invoiced Amount field.';
                    }
                }
                group("Required Documents")
                {
                    field("Proposal Document"; Rec."Proposal Document")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Proposal Document field.';
                    }
                }
            }
        }
        area(factboxes)
        {
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
            }
            part(Control56; "Dimensions FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "Table ID" = const(18),
                              "No." = field("No. Series");
            }
            systempart(Control51; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            separator(Action42)
            {
                Caption = '       -';
            }
            action("Confirm Payment")
            {
                ApplicationArea = Basic;
                Caption = 'Confirm Payment';
                Enabled = true;
                Image = PostedPayableVoucher;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = RejectApp;
                ToolTip = 'Executes the Confirm Payment action.';
                trigger OnAction()
                begin
                    Rec.TestField("Payment Document", true);
                    Rec.TestField(Status, Rec.Status::"Awaiting Payment Processing");
                    AccreditationSetup.Get();
                    Amount := 0;
                    Amount := AccreditationSetup."Programme Accreditation Amount";
                    //confirmPayment(Amount);
                    CReceipt(Rec."Accreditation No.");
                end;
            }
            action("Reject Payment")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = RejectApp;
                ToolTip = 'Executes the Reject Payment action.';
                trigger OnAction()
                begin
                    Rec.TestField("Rejection Reason");
                    RejectPayment(Rec);
                end;
            }
            action("Initial Programmes")
            {
                ApplicationArea = Basic;
                Image = NewBank;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "New Programmes";
                //  RunPageLink = Field106 = field("Accreditation No.");
                RunPageMode = View;
                ToolTip = 'Executes the Initial Programmes action.';
            }
            action("Create Work Order")
            {
                ApplicationArea = Basic;
                Caption = 'Create Work Order';
                Image = CreateMovement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = RejectApp;
                ToolTip = 'Executes the Create Work Order action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::"Awaiting Payment Processing");
                    Rec.CalcFields("Receipt No.");
                    if Rec."Receipt No." <> '' then begin
                        CreateJob(Rec."Institution No.", Rec."Accreditation No.");

                        Rec.Status := Rec.Status::"Awaiting Peer Review";
                        Rec.Modify(true);
                    end else
                        Error('Receipt has to be proceseed first');
                end;
            }
            action(Versions)
            {
                ApplicationArea = Basic;
                Image = Versions;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Institution Versions";
                RunPageLink = "Accreditation No." = field("Accreditation No.");
                RunPageMode = View;
                ToolTip = 'Executes the Versions action.';
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                RunObject = Page "Default Dimensions";
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';
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
                    //  //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status, Rec.Status::"HOD Pending");
                        /*//if //ApprovalsMgmt.CheckProgAccWorkflowEnabled(Rec)THEN
                          //ApprovalsMgmt.OnSendProgAccForApproval(Rec);*/

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                    //  //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        /*
                        //ApprovalsMgmt.OnCancelProgAccApprovalRequest(Rec);*/

                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        RejectApp := false;
        if Rec.Status = Rec.Status::"Awaiting Payment Processing" then
            RejectApp := true;
    end;

    var
        Accreditation: Record "Ins. Accreditation Table";
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        //  salesheader: Page "Sales Invoice";
        GenSetUp: Record "Accreditation Type Series";
        Text001: label 'Amount should not be %1';
        ApplicationAreaSetup: Record "Application Area Setup";
        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLines: Record "Receipt Lines1";
        PaymentPost: Codeunit "Payments-Post";
        Banks: Record "Bank Account";
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
        Text002: label 'Campus Accreditation Amount';
        Text003: label 'Proceed to create Customer?';
        Cust: Record Customer;
        Text004: label 'Customer created succesfully';
        BOSAACC: Code[20];
        Job: Record Job;
        JobTaskLines: Record "Job Task";
        Amount: Decimal;
        JobTasks: Record "Acc Project Tasks setup";
        institution: Record "Accreditation Verdict Setup";
        CustLedger: Record "Cust. Ledger Entry";
        Number: Code[30];
        NoSeries: Code[30];
        AccreditationSetup: Record "Accreditation Setups";
        AccreditationType: Text;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text005: label 'Create An Accreditation Document?';
        ReturnValue: Boolean;
        ReturnMessage: Boolean;
        Customer: Code[10];
        CompInfo: Record "Company Information";
        //   Notification1: Codeunit "Email Message";
        //  SMTPMailSet: Record "Email Account";
        FileDirectory: Text;
        FileName: Text;
        receipt: Boolean;
        Feeschedules: Record "Acc Fee Schedules";
        cashmgtsetup: Record "Cash Management Setup";
        ProgAccreditation: Record "Ins. Accreditation Table";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        RejectApp: Boolean;
        LineNo: Integer;

    [ServiceEnabled]
    procedure CreateJob(var Number: Code[30]; var ApplicationNumber: Code[30]) CreatedJob: Boolean
    begin
        GenSetUp.Get();
        CreatedJob := false;
        Job.Reset;
        Job."No." := ApplicationNumber;
        Job.Validate(Description, Rec."Institution Name." + ' ' + 'Accreditation');
        Job.Validate("Bill-to Customer No.", Number);
        Job."Creation Date" := Today;
        Job."Starting Date" := Today;
        //insert the accreditation number
        Accreditation.Reset;
        Feeschedules.Reset;
        Feeschedules.SetRange(Description, Rec."Accreditation Code");
        if Feeschedules.FindSet then begin
            if Feeschedules."Applies To New" = false then begin
                Accreditation.SetRange("Insitution Campus No.", ApplicationNumber);
                Job."Fund Opportunity Name" := Accreditation."Accreditation No.";
            end else begin
                Accreditation.SetRange("Institution No.", ApplicationNumber);
                Job."Fund Opportunity Name" := Accreditation."Accreditation No.";
            end;
        end;
        //  Job."Examination Project Type" := Job."examination project type"::"0";
        //  Job."Examination Project Subtype" := Job."examination project subtype"::"1";
        Job.Insert(true);
        JobTasks.Reset;
        JobTasks.SetRange("Accreditation Type", JobTasks."accreditation type"::Institution);
        if JobTasks.FindSet then begin
            repeat
                JobTaskLines."Job Task No." := JobTasks.Code;
                JobTaskLines."Job No." := ApplicationNumber;
                JobTaskLines.Description := JobTasks.Description;
                JobTaskLines.Insert(true);
            until JobTasks.Next = 0;

            Message('The project %1 has been created,Kindly proceed to assign tasks', ApplicationNumber);

            CreatedJob := true;

        end;


    end;


    procedure CReceipt("ApplicationNo.": Code[30]) Created: Boolean
    var
        ReceiptHeader: Record "Receipts Header1";
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
            ReceiptHeader."Depot Name" := Rec."Accreditation No.";
            ReceiptHeader."Cheque No" := Rec."Reference No.";
            ReceiptHeader.Insert(true);
            ReceiptLines.Init;
            CustLedgerEntry.Reset;
            CustLedgerEntry.SetRange("External Document No.", "ApplicationNo.");
            if CustLedgerEntry.FindFirst then begin
                ReceiptLines."Applies to Doc. No" := CustLedgerEntry."Document No.";
                ReceiptLines.Validate("Applies to Doc. No");
            end;
            ReceiptLines."Receipt No." := ReceiptHeader."No.";
            ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
            ReceiptLines."Account No." := Rec."Institution No.";
            ReceiptLines.Validate("Account No.");
            ReceiptLines.Insert(true);
            //open the receipt document
            Page.Run(57067, ReceiptHeader);
        end;

    end;

    procedure CreateInvoice(var No: Code[30])
    begin
    end;

    local procedure RejectPayment(ProgramAccreditationTable: Record "Ins. Accreditation Table")
    var
        //   SMTP: Record "SMTP Mail Setup";
        Entries: Record Entries;
    begin
        if Confirm('Are you sure you want to reject payment for this application?') = true then begin
            // //SMTP.Get;
            // ProgramAccreditationTable.TestField(Email);
            // ProgramAccreditationTable.TestField("Rejection Reason");
            // Notification1.CreateMessage('PAYMENT REJECTION:Programme Accreditation', //SMTP."Email Sender Address", ProgramAccreditationTable.Email, 'PAYMENT REJECTION',
            // 'Dear ' + ProgramAccreditationTable."Institution Name." + ',<BR><BR>' +
            // ' The payment request done for the  programme accreditation application  ' + ProgramAccreditationTable."Institution Name." + ' ' + 'has been rejected.<BR>' +
            // 'This is due to the following reason(s):' + '<BR> <B>' + ProgramAccreditationTable."Rejection Reason" + '</B><BR><BR>', true);
            // //change address to email
            // Notification1.AppendToBody(
            // '<BR><BR>Kind Regards,' +
            // '<BR><BR>For any Information or questions regarding the rejection reason<BR>, Please Contact' + '<BR>Information and Communication Department<BR>' +
            // CompInfo.Name + '<BR>' +
            // CompInfo.Address + '<BR>' +
            // CompInfo."Address 2" + '<BR>' +
            // CompInfo."Phone No." + '<BR>' +
            // CompInfo.City);
            // Notification1.AddBCC(//SMTP."Email Sender Address");
            // Notification1.Send;
            ProgramAccreditationTable."Payment Document" := false;
            ProgramAccreditationTable."Reference No." := '';
            ProgramAccreditationTable.Modify(true);
            //CREATE ENTRIEs
            LineNo := 0;
            Entries.Reset;
            if Entries.FindLast then begin
                LineNo := Entries."Entry No.";
            end;
            Entries.Init;
            Entries."Entry No." := LineNo + 1;
            Entries."Institution Name" := ProgramAccreditationTable."Institution Name.";
            Entries."Institution No." := ProgramAccreditationTable."Institution No.";
            Entries."Accreditation Description" := ProgramAccreditationTable."Rejection Reason";
            Entries.Type := Entries.Type::Rejection;
            Entries."Created By" := UserId;
            Entries."Created On" := CurrentDatetime;
            Entries.Insert;
            Message('Email notification sent to %1,regarding %2', ProgramAccreditationTable."Institution Name.", ProgramAccreditationTable."Accreditation No.");
        end;
    end;
}

#pragma implicitwith restore

