#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57000 "Payments"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            NotBlank = false;

            trigger OnValidate()
            begin

                if "Payment Type" = "payment type"::"Payment Voucher" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."PV Nos");
                end;

                if "Payment Type" = "payment type"::Imprest then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Imprest Nos");

                end;
                if "Payment Type" = "payment type"::"Warrant Voucher" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Imprest Voucher Nos");

                end;
                if "Payment Type" = "payment type"::AIE then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."AIE Nos.");

                end;

                if "Payment Type" = "payment type"::"Petty Cash" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Petty Cash Nos");
                end;
                if "Payment Type" = "payment type"::"Petty Cash Surrender" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Petty Cash Surrender Nos");
                end;

                if "Payment Type" = "payment type"::"Imprest Surrender" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Imprest Surrender Nos");
                end;
                if "Payment Type" = "payment type"::"Staff Claim" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Staff Claim Nos.");
                end;

                if "Payment Type" = "payment type"::"Standing Imprest" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Standing Imprest Nos");
                end;

                if "Payment Type" = "payment type"::"Standing Imprest Surrender" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Standing Imprest Surrender Nos");
                end;
                if "Payment Type" = "payment type"::"Car Loan" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Car loan Nos");
                end;
            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; Type; Code[20])
        {
        }
        field(4; "Pay Mode"; Code[20])
        {
            TableRelation = "Pay Mode";
        }
        field(5; "Cheque No"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                IF "Cheque No"<>'' THEN BEGIN
                PV.RESET;
                PV.SETRANGE(PV."Cheque No","Cheque No");
                IF PV.FIND('-') THEN BEGIN
                IF PV."No." <> "No." THEN
                   ERROR(Text002);
                END;
                END;
                */

            end;
        }
        field(6; "Cheque Date"; Date)
        {
        }
        field(7; "Bank Code"; Code[20])
        {
        }
        field(8; Payee; Text[150])
        {

            trigger OnValidate()
            begin
                Payee := UpperCase(Payee);
            end;
        }
        field(9; "On behalf of"; Text[150])
        {

            trigger OnValidate()
            begin
                "On behalf of" := UpperCase("On behalf of");
            end;
        }
        field(10; "Created By"; Code[50])
        {
            Editable = true;
        }
        field(11; Posted; Boolean)
        {
        }
        field(12; "Posted By"; Code[50])
        {
        }
        field(13; "Posted Date"; Date)
        {
            Editable = true;
        }
        field(14; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(15; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(16; "Time Posted"; Time)
        {
        }
        field(17; "Total Amount LCY"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Amount (LCY)" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Paying Bank Account"; Code[20])
        {
            TableRelation = if ("Payment Type" = const("Payment Voucher")) "Bank Account" where(Type = const(Bank))
            else
            if ("Payment Type" = const(Imprest)) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = const("Petty Cash")) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = const("Bank Transfer")) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = const("Standing Imprest")) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = const("Salary Advance")) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = const("Standing Imprest Surrender")) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = const("Warrant Voucher")) "Bank Account" where(Type = const(Bank));

            trigger OnValidate()
            begin
                if Bank.Get("Paying Bank Account") then
                    "Bank Name" := Bank.Name;
            end;
        }
        field(19; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;

            trigger OnValidate()
            begin
                if Status = Status::Released then begin
                    if ("Document Type" = "document type"::Imprest) or ("Document Type" = "document type"::"Staff Claims") then begin
                        Commitment.ImprestCommittment(Rec);
                    end;
                end;
            end;
        }
        field(20; "Payment Type"; Option)
        {
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender,Surrender,Standing Imprest,Salary Advance,Payment Voucher Reversal,Imprest Reversal,Staff Claim Reversal,Imprest Surrender Reversal,Petty Cash Reversal,Bank Transfer Reversal,Petty Cash Surrender Reversal,Surrender Reversal,Standing Imprest Reversal,Salary Advance Reversal,Standing Imprest Surrender,AIE,Warrant Voucher,Payment Schedule,Car Loan';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender",Surrender,"Standing Imprest","Salary Advance","Payment Voucher Reversal","Imprest Reversal","Staff Claim Reversal","Imprest Surrender Reversal","Petty Cash Reversal","Bank Transfer Reversal","Petty Cash Surrender Reversal","Surrender Reversal","Standing Imprest Reversal","Salary Advance Reversal","Standing Imprest Surrender",AIE,"Warrant Voucher","Payment Schedule","Car Loan";
        }
        field(21; "Currency Code"; Code[20])
        {
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date")]) or ("Currency Code" <> xRec."Currency Code") then
                    TestStatusOpen;
                if (CurrFieldNo <> FieldNo("Currency Code")) and ("Currency Code" = xRec."Currency Code") then
                    UpdateCurrencyFactor
                else
                    if "Currency Code" <> xRec."Currency Code" then
                        UpdateCurrencyFactor
                    else
                        if "Currency Code" <> '' then begin
                            UpdateCurrencyFactor;
                            if "Currency Factor" <> xRec."Currency Factor" then
                                ConfirmUpdateCurrencyFactor;
                        end;
            end;
        }
        field(22; "No. Series"; Code[20])
        {
        }
        field(23; "Account Type"; Option)
        {
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(24; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const(Customer)) Customer."No." where("Customer Type" = filter(" "))
            else
            if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const(Employee)) Employee;

            trigger OnValidate()
            begin

                case "Account Type" of
                    "account type"::Customer:
                        begin
                            if Customer.Get("Account No.") then begin
                                "Account Name" := Customer.Name;
                                Payee := Customer.Name;
                            end;
                        end;

                    "account type"::Employee:
                        begin
                            if Emp.Get("Account No.") then begin
                                "Account Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                                Payee := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                                "Date of Joining" := Emp."Employment Date";
                                Emp.CalcFields("Bank Branch Name", "Bank Name");
                                "Imprest Bank Account Number" := Emp."Bank Account No.";
                                "Imprest Bank Branch Name" := Emp."Bank Branch Name";
                                "Imprest Bank Name" := Emp."Bank Name";
                                "Directorate Code" := Emp."Directorate Code";
                                "Department Code" := Emp."Department Code";
                                Division := Emp.Division;
                                "Shortcut Dimension 1 Code" := Emp."Global Dimension 1 Code";
                                "Shortcut Dimension 2 Code" := Emp."Global Dimension 2 Code";
                                "Salary Scale" := Emp."Salary Scale";
                            end;
                        end;

                end;
            end;
        }
        field(25; "Account Name"; Text[70])
        {
        }
        field(26; "Imprest Amount"; Decimal)
        {
            CalcFormula = sum("Imprest Lines".Amount where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; Surrendered; Boolean)
        {
        }
        field(28; "Applies- To Doc No."; Code[20])
        {
            TableRelation = "Vendor Ledger Entry"."Document No." where("Vendor No." = field("Account No."),
                                                                        Open = filter(true));

            trigger OnLookup()
            begin

                "Applies- To Doc No." := '';
                Amnt := 0;
                // VATAmount:=0;
                //"W/TAmount":=0;

                case "Account Type" of
                    "account type"::Customer:
                        begin
                            CustLedger.Reset;
                            CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                            CustLedger.SetRange(CustLedger."Customer No.", "Account No.");
                            CustLedger.SetRange(Open, true);
                            CustLedger.CalcFields(CustLedger.Amount);
                            if Page.RunModal(25, CustLedger) = Action::LookupOK then begin

                                if CustLedger."Applies-to ID" <> '' then begin
                                    CustLedger1.Reset;
                                    CustLedger1.SetCurrentkey(CustLedger1."Customer No.", Open, "Applies-to ID");
                                    CustLedger1.SetRange(CustLedger1."Customer No.", "Account No.");
                                    CustLedger1.SetRange(Open, true);
                                    CustLedger1.SetRange("Applies-to ID", CustLedger."Applies-to ID");
                                    if CustLedger1.Find('-') then begin
                                        repeat
                                            CustLedger1.CalcFields(CustLedger1.Amount);
                                            Amnt := Amnt + Abs(CustLedger1.Amount);
                                        until CustLedger1.Next = 0;
                                    end;

                                    if Amnt <> Amnt then
                                        //ERROR('Amount is not equal to the amount applied on the application PAGE');
                                        if "Total Amount LCY" = 0 then
                                            "Total Amount LCY" := Amnt;
                                    Validate("Total Amount LCY");
                                    "Applies- To Doc No." := CustLedger."Document No.";
                                    //Insert VAT where applicable
                                    //VATEntry.RESET;
                                    //VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                    //IF VATEntry.FIND('-') THEN
                                    //"VAT Code":=VATEntry."VAT Prod. Posting Group";
                                    //

                                end else begin
                                    if "Total Amount LCY" <> Abs(CustLedger.Amount) then
                                        CustLedger.CalcFields(CustLedger."Remaining Amount");
                                    if "Total Amount LCY" = 0 then
                                        "Total Amount LCY" := Abs(CustLedger."Remaining Amount");
                                    Validate("Total Amount LCY");
                                    "Applies- To Doc No." := CustLedger."Document No.";
                                    //"External Document No.":=CustLedger."External Document No.";
                                    //Insert VAT where applicable
                                    /*
                                    VATEntry.RESET;
                                    VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                     IF VATEntry.FIND('-') THEN
                                       "VAT Code":=VATEntry."VAT Prod. Posting Group";
                                    */

                                end;
                            end;
                            Validate("Total Amount LCY");
                        end;

                    "account type"::Vendor:
                        begin
                            VendLedger.Reset;
                            VendLedger.SetCurrentkey(VendLedger."Vendor No.", Open, "Document No.");
                            VendLedger.SetRange(VendLedger."Vendor No.", "Account No.");
                            VendLedger.SetRange(Open, true);
                            VendLedger.CalcFields("Remaining Amount");
                            VendLedger.CalcFields("Remaining Amt. (LCY)");
                            if Page.RunModal(29, VendLedger) = Action::LookupOK then begin

                                if VendLedger."Applies-to ID" <> '' then begin
                                    VendLedger1.Reset;
                                    VendLedger1.SetCurrentkey(VendLedger1."Vendor No.", Open, "Applies-to ID");
                                    VendLedger1.SetRange(VendLedger1."Vendor No.", "Account No.");
                                    VendLedger1.SetRange(Open, true);
                                    VendLedger1.SetRange(VendLedger1."Applies-to ID", VendLedger."Applies-to ID");
                                    if VendLedger1.Find('-') then begin
                                        repeat
                                            VendLedger1.CalcFields(VendLedger1."Remaining Amount");
                                            VendLedger1.CalcFields("Remaining Amt. (LCY)");
                                        //NetAmount:=NetAmount+ABS(VendLedger1."Remaining Amount");

                                        until VendLedger1.Next = 0;
                                    end;

                                    if "Total Amount LCY" <> "Total Amount LCY" then
                                        //ERROR('Amount is not equal to the amount applied on the application form');
                                        if "Total Amount LCY" = 0 then
                                            "Total Amount LCY" := "Total Amount LCY";

                                    Validate("Total Amount LCY");
                                    "Applies- To Doc No." := VendLedger."Document No.";
                                    //"External Document No.":=VendLedger."External Document No.";

                                    //Insert VAT where applicable
                                    /*
                                   VATEntry.RESET;
                                   VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                    IF VATEntry.FIND('-') THEN
                                      "VAT Code":=VATEntry."VAT Prod. Posting Group";
                                   //
                                   */
                                end else begin
                                    if "Total Amount LCY" <> Abs(VendLedger."Remaining Amount") then
                                        VendLedger.CalcFields(VendLedger."Remaining Amount");
                                    VendLedger.CalcFields(VendLedger."Remaining Amt. (LCY)");
                                    if "Total Amount LCY" = 0 then begin
                                        if "Currency Code" = '' then begin
                                            "Total Amount LCY" := Abs(VendLedger."Remaining Amt. (LCY)");
                                        end else begin
                                            "Total Amount LCY" := Abs(VendLedger."Remaining Amount");
                                        end;
                                    end;

                                    Validate("Total Amount LCY");
                                    "Applies- To Doc No." := VendLedger."Document No.";
                                    //"External Document No.":=VendLedger."External Document No.";
                                    "Dimension Set ID" := VendLedger."Dimension Set ID";//added 13/02/2017
                                    Validate("Dimension Set ID");
                                    //MESSAGE('%1',"Dimension Set ID");

                                    //Insert VAT where applicable
                                    /*
                                   VATEntry.RESET;
                                   VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                    IF VATEntry.FIND('-') THEN
                                      "VAT Code":=VATEntry."VAT Prod. Posting Group";
                                   //
                                   */
                                end;
                            end;
                            //"Total Amount":=ABS(VendLedger."Remaining Amount");
                            if "Currency Code" = '' then begin
                                "Total Amount LCY" := Abs(VendLedger."Remaining Amt. (LCY)");
                            end else begin
                                "Total Amount LCY" := Abs(VendLedger."Remaining Amount");
                            end;
                            //Insert VAT where applicable
                            /*
                           VATEntry.RESET;
                           VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                            IF VATEntry.FIND('-') THEN
                              "VAT Code":=VATEntry."VAT Prod. Posting Group";
                           //
                           */
                            Validate("Total Amount LCY");
                        end;
                end;

            end;
        }
        field(29; "Petty Cash Amount"; Decimal)
        {
            CalcFormula = sum("Petty Cash Lines".Amount where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Original Document"; Option)
        {
            OptionCaption = ',Imprest,Staff Claim';
            OptionMembers = ,Imprest,"Staff Claim";
        }
        field(31; "PV Creation DateTime"; DateTime)
        {
        }
        field(32; "PV Creator ID"; Code[50])
        {
        }
        field(33; "Remaining Amount"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Remaining Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(34; "Receipt Created"; Boolean)
        {
        }
        field(35; "Imprest Deadline"; Date)
        {
            Editable = true;
        }
        field(36; "Surrender Date"; Date)
        {
            Editable = true;
        }
        field(37; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(38; "Imprest Type"; Option)
        {
            OptionCaption = 'Normal,Project Imprest';
            OptionMembers = Normal,"Project Imprest";
        }
        field(39; Project; Code[20])
        {
            TableRelation = Job where(Status = filter(<> Completed),
                                       "Record Type" = filter(Job));

            trigger OnValidate()
            begin
                /*"Shortcut Dimension 2 Code":=Project;
                VALIDATE("Shortcut Dimension 2 Code");
                IF JobRec.GET(Project) THEN BEGIN
                 JobRec.CALCFIELDS("Project Budget","Actual Project Costs",
                 "PO Commitments","PRN Commitments","Store Requisition Commitments","Imprest Application Commitment");
                 "Project Description":=JobRec.Description;
                 "Project Budget":=JobRec."Project Budget";
                 "Actual Project Costs":=JobRec."Actual Project Costs";
                 "PO Commitments":=JobRec."PO Commitments";
                 "PRN Commitments":=JobRec."PRN Commitments";
                 "Store Requisition Commitments":=JobRec."Store Requisition Commitments";
                 "Imprest Application Commitment":=JobRec."Imprest Application Commitment";
                  "Total Budget Commitments":="PO Commitments"+"PRN Commitments"+"Store Requisition Commitments"+"Imprest Application Commitment";
                 "Available Funds":="Project Budget"-"Actual Project Costs"-"Total Budget Commitments";
                
                END;*/

            end;
        }
        field(40; "Project Description"; Text[250])
        {
            CalcFormula = lookup(Job.Description where("No." = field(Project)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "Travel Date"; Date)
        {

            trigger OnValidate()
            begin
                case "Payment Type" of
                    "payment type"::Imprest:
                        begin
                            //Get the Imprest Deadline Date
                            if not CashMgt.Get then
                                Error(Text000);
                            CashMgt.TestField("Imprest Due Date");
                            if "Travel Date" <> 0D then
                                "Imprest Deadline" := CalcDate(CashMgt."Imprest Due Date", "Travel Date");
                        end;
                end;
            end;
        }
        field(42; Cashier; Text[50])
        {
        }
        field(43; "Total Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines".Amount where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57; "Function Name"; Text[100])
        {
            Description = 'Stores the name of the function in the database';
        }
        field(58; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
        }
        field(68; "Payment Release Date"; Date)
        {
        }
        field(69; "No. Printed"; Integer)
        {
        }
        field(80; "Document Type"; Option)
        {
            OptionMembers = "Payment Voucher","Petty Cash",Imprest,"Imprest Surrender","Bank Transfer",Surrender,"Staff Claims","Salary Advance","Standing Imprest","Standing Imprest Surrender","Payment Schedule","Warrant Voucher";
        }
        field(81; "Surrender Status"; Option)
        {
            OptionMembers = " ",Full,Partial;
        }
        field(82; "Departure Date"; Date)
        {
        }
        field(85; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                /*
                TESTFIELD(Status,Status::Pending);
                IF NOT UserMgt.CheckRespCenter(1,"Shortcut Dimension 3 Code") THEN
                  ERROR(
                    Text001,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter);
                
                */
                /*
               "Location Code" := UserMgt.GetLocation(1,'',"Responsibility Center");
               IF "Location Code" = '' THEN BEGIN
                 IF InvtSetup.GET THEN
                   "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
               END ELSE BEGIN
                 IF Location.GET("Location Code") THEN;
                 "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
               END;

               UpdateShipToAddress;
                  */
                /*
             CreateDim(
               DATABASE::"Responsibility Center","Responsibility Center",
               DATABASE::Vendor,"Pay-to Vendor No.",
               DATABASE::"Salesperson/Purchaser","Purchaser Code",
               DATABASE::Campaign,"Campaign No.");

             IF xRec."Responsibility Center" <> "Responsibility Center" THEN BEGIN
               RecreatePurchLines(FIELDCAPTION("Responsibility Center"));
               "Assigned User ID" := '';
             END;
               */

            end;
        }
        field(86; "Cheque Type"; Option)
        {
            OptionMembers = " ","Computer Check","Manual Check";
        }
        field(88; "Payment Narration"; Text[250])
        {
        }
        field(89; "Total VAT Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines"."VAT Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(90; "Total Witholding Tax Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines"."W/Tax Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(91; "Total Net Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Net Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Total Net Pay" := "Total Net Amount" - "Advance Recovery";
            end;
        }
        field(92; "Total Payment Amount LCY"; Decimal)
        {
            CalcFormula = sum("PV Lines"."NetAmount LCY" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(93; "Total Retention Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Retention  Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(94; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(95; "Posting Date"; Date)
        {
        }
        field(96; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job));

            trigger OnValidate()
            begin
                /*
                TESTFIELD("Receipt No.",'');
                
                IF "Job Task No." <> xRec."Job Task No." THEN BEGIN
                  VALIDATE("Job Planning Line No.",0);
                  IF "Document Type" = "Document Type"::Order THEN
                    TESTFIELD("Quantity Received",0);
                END;
                
                IF "Job Task No." = '' THEN BEGIN
                  CLEAR(JobJnlLine);
                  "Job Line Type" := "Job Line Type"::" ";
                  UpdateJobPrices;
                  EXIT;
                END;
                
                JobSetCurrencyFactor;
                IF JobTaskIsSet THEN BEGIN
                  CreateTempJobJnlLine(TRUE);
                  UpdateJobPrices;
                END;
                UpdateDimensionsFromJobTask;
                
                */

            end;
        }
        field(97; "Job Task Name"; Text[200])
        {
            CalcFormula = lookup("Job Task".Description where("Job No." = field(Project),
                                                               "Job Task No." = field("Job Task No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(98; "Actual Amount Spent"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Actual Spent" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(99; "Cash Receipt Amount"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Cash Receipt Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(100; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(103; "Phone Number"; Code[15])
        {
        }
        field(104; "Date of Reporting"; Date)
        {
        }
        field(105; "Imprest Issue Date"; Date)
        {
        }
        field(106; "Imprest Issue Doc. No"; Code[20])
        {
            FieldClass = Normal;
            TableRelation = Payments."No." where("Payment Type" = const(Imprest),
                                                  Posted = const(true),
                                                  Surrendered = const(false),
                                                  "Account No." = field("Account No."));

            trigger OnValidate()
            begin
                ImpSurrLines.Reset;
                ImpSurrLines.SetRange(No, "No.");
                ImpSurrLines.DeleteAll;

                ImpHeader.Reset;
                ImpHeader.SetRange(ImpHeader."No.", "Imprest Issue Doc. No");
                if ImpHeader.FindFirst then
                    if ImpHeader."Payment Type" = ImpHeader."payment type"::"Imprest Surrender" then
                        Error('Imprest has already been Surrendered');


                if ImpHeader.Get("Imprest Issue Doc. No") then begin
                    "Account Type" := ImpHeader."Account Type";
                    "Account No." := ImpHeader."Account No.";
                    Validate("Account No.");
                    "Pay Mode" := "Pay Mode";
                    "Paying Bank Account" := ImpHeader."Paying Bank Account";
                    Validate("Paying Bank Account");
                    Project := ImpHeader.Project;
                    "Currency Code" := ImpHeader."Currency Code";
                    "Currency Factor" := ImpHeader."Currency Factor";
                    "Reference No." := ImpHeader."Reference No.";
                    Validate(Project);
                    Job := ImpHeader.Job;
                    Validate(Job);
                    "Job Task No." := ImpHeader."Job Task No.";
                    Validate("Job Task No.");
                    "Shortcut Dimension 1 Code" := ImpHeader."Shortcut Dimension 1 Code";
                    Validate("Shortcut Dimension 1 Code");
                    "Shortcut Dimension 2 Code" := ImpHeader."Shortcut Dimension 2 Code";
                    Validate("Shortcut Dimension 2 Code");
                    "Shortcut Dimension 3 Code" := ImpHeader."Shortcut Dimension 3 Code";
                    Validate("Shortcut Dimension 3 Code");
                    "Shortcut Dimension 4 Code" := ImpHeader."Shortcut Dimension 4 Code";
                    Validate("Shortcut Dimension 4 Code");
                    "Shortcut Dimension 5 Code" := ImpHeader."Shortcut Dimension 5 Code";
                    Validate("Shortcut Dimension 4 Code");

                    "Dimension Set ID" := ImpHeader."Dimension Set ID";

                    ImpLines.Reset;
                    ImpLines.SetRange(ImpLines.No, ImpHeader."No.");
                    if ImpLines.FindFirst then begin
                        //ImpSurrLines.COPY(ImpLines);

                        repeat
                            ImpSurrLines.Init;
                            ImpSurrLines.No := "No.";
                            ImpSurrLines."Applies- to Doc. No." := ImpLines.No;
                            ImpSurrLines."Line No" := ImpLines."Line No";
                            ImpSurrLines."Account Type" := ImpLines."Account Type";
                            ImpSurrLines."Account No." := ImpLines."Account No.";
                            ImpSurrLines."Account Name" := ImpLines."Account Name";
                            ImpSurrLines.Purpose := ImpLines.Purpose;
                            ImpSurrLines.Amount := ImpLines.Amount;
                            if not ImpSurrLines.Get(ImpSurrLines.No, ImpSurrLines."Line No") then
                                ImpSurrLines.Insert;

                        until ImpLines.Next = 0;
                    end;
                end;
            end;
        }
        field(107; "Date Surrendered"; Date)
        {
        }
        field(108; "Surrendered By"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(109; "Actual Petty Cash Amount Spent"; Decimal)
        {
            CalcFormula = sum("Petty Cash Lines"."Actual Spent" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(110; "Shortcut Dimension 5 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(111; "Remaining Petty Cash Amount"; Decimal)
        {
            CalcFormula = sum("Petty Cash Lines"."Remaining Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(112; "Receipted Petty Cash Amount"; Decimal)
        {
            CalcFormula = sum("Petty Cash Lines"."Cash Receipt Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(113; "Imprest Memo Surrender No"; Code[20])
        {
            TableRelation = "Imprest Memo" where(Status = filter(Released),
                                                  Posted = filter(true),
                                                  Surrendered = const(true));

            trigger OnValidate()
            begin
                //Ushindi...Insert default Imprest Memo details
                ImpMemo.Reset;
                ImpMemo.SetRange(ImpMemo."No.", "Imprest Memo Surrender No");
                if ImpMemo.Find('-') then begin
                    Project := ImpMemo.Project;
                    Validate(Project);
                    "Project Description" := ImpMemo."Project Description";
                    "Shortcut Dimension 1 Code" := ImpMemo."Global Dimension 1 Code";
                    Validate("Shortcut Dimension 1 Code");
                    "Shortcut Dimension 2 Code" := ImpMemo."Global Dimension 2 Code";
                    Validate("Shortcut Dimension 2 Code");
                    "Shortcut Dimension 3 Code" := ImpMemo."Shortcut Dimension 3 Code";
                    Validate("Shortcut Dimension 3 Code");
                    "Shortcut Dimension 4 Code" := ImpMemo."Shortcut Dimension 4 Code";
                    Validate("Shortcut Dimension 4 Code");
                    "Shortcut Dimension 5 Code" := ImpMemo."Shortcut Dimension 5 Code";
                    Validate("Shortcut Dimension 5 Code");

                end;
                //End...Ushindi
            end;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
        }
        field(50000; "VAT Wthheld six %"; Decimal)
        {
            CalcFormula = sum("PV Lines"."VAT Withheld Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Bank Name"; Text[50])
        {
            CalcFormula = lookup("Bank Account".Name where("No." = field("Paying Bank Account")));
            Caption = 'Bank Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Project Budget"; Decimal)
        {
            Caption = 'Total Project Budget';
            Editable = false;
        }
        field(50003; "Actual Project Costs"; Decimal)
        {
            Editable = false;
        }
        field(50004; "PO Commitments"; Decimal)
        {
            Caption = 'Purchase Order Commitments';
            Editable = false;
        }
        field(50005; "PRN Commitments"; Decimal)
        {
            Caption = 'Purchase Requisition(PRN) Commitments';
            Editable = false;
        }
        field(50006; "Store Requisition Commitments"; Decimal)
        {
            Caption = 'Store Requisition(S11) Commitments';
            Editable = false;
        }
        field(50007; "Imprest Application Commitment"; Decimal)
        {
            Caption = 'Imprest Applications Commitments';
            Editable = false;
        }
        field(50008; "Total Budget Commitments"; Decimal)
        {
        }
        field(50009; "Available Funds"; Decimal)
        {
        }
        field(50014; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50015; "Project Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; "Division Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 4 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50018; "Notification Sent"; Boolean)
        {
        }
        field(50019; "DateTime Sent"; DateTime)
        {
        }
        field(50020; "Destination Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 5 Code")));
            FieldClass = FlowField;
        }
        field(56002; Reversed; Boolean)
        {
            CalcFormula = lookup("G/L Entry".Reversed where("Document No." = field("No.")));
            FieldClass = FlowField;
        }
        field(57000; "Imprest Memo No"; Code[20])
        {
            TableRelation = "Imprest Memo" where(Status = filter(Released),
                                                  Posted = filter(true),
                                                  "Document Type" = const("Imprest Memo"));

            trigger OnValidate()
            begin
                //Ushindi...Insert default Imprest Memo details
                ImpMemo.Reset;
                ImpMemo.SetRange(ImpMemo."No.", "Imprest Memo No");
                if ImpMemo.Find('-') then begin
                    Project := ImpMemo.Project;
                    Validate(Project);
                    "Project Description" := ImpMemo."Project Description";
                    "Shortcut Dimension 1 Code" := ImpMemo."Global Dimension 1 Code";
                    Validate("Shortcut Dimension 1 Code");
                    "Shortcut Dimension 2 Code" := ImpMemo."Global Dimension 2 Code";
                    Validate("Shortcut Dimension 2 Code");
                    "Shortcut Dimension 3 Code" := ImpMemo."Shortcut Dimension 3 Code";
                    Validate("Shortcut Dimension 3 Code");
                    "Shortcut Dimension 4 Code" := ImpMemo."Shortcut Dimension 4 Code";
                    Validate("Shortcut Dimension 4 Code");
                    "Shortcut Dimension 5 Code" := ImpMemo."Shortcut Dimension 5 Code";
                    Validate("Shortcut Dimension 5 Code");

                end;
                //End...Ushindi
            end;
        }
        field(57001; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Currency Factor" <> xRec."Currency Factor" then
                    UpdatePurchLinesByFieldNo(FieldNo("Currency Factor"), CurrFieldNo <> 0);
            end;
        }
        field(57009; "Job Group"; Code[20])
        {
        }
        field(57010; "Resources Total Amount"; Decimal)
        {
            CalcFormula = sum("Payment Entries".Amount where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(57011; "Resources Total WTax"; Decimal)
        {
            CalcFormula = sum("Payment Entries"."W/Tax Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(57012; "Resources Total Net"; Decimal)
        {
            CalcFormula = sum("Payment Entries"."Net Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(57013; "No. of Resources"; Integer)
        {
            CalcFormula = count("Payment Entries" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(57014; "Car loan"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Car Loan';
        }
        field(57015; "Interest Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Car Loan';

            trigger OnValidate()
            begin
                if "Car loan" = true then begin
                    "Total Loan Amount" := "Salary Advance" + "Interest Amount";
                end;
            end;
        }
        field(57016; "Total Loan Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Car Loan';
        }
        field(57017; "Paying Bank No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57018; "Imprest Amount LCY"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Amount LCY" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57019; "Actual Amount Spent LCY"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Actual Spent LCY" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(57020; "Resources Total Other Costs"; Decimal)
        {
            CalcFormula = sum("Payment Entries"."Other Costs" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57021; "Loan Vendor"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange("No.", "Loan Vendor");
                if Vendor.FindFirst then begin
                    "Loan Vendor Name" := Vendor.Name;
                end
            end;
        }
        field(57022; "Loan Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(57023; "Recovery Month"; Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payroll PeriodX";

            trigger OnValidate()
            begin
                PayrollPeriodX.Reset;
                PayrollPeriodX.SetRange("Starting Date", "Recovery Month");
                if PayrollPeriodX.FindFirst then begin
                    "Recovery Start Month" := PayrollPeriodX.Name;
                end
            end;
        }
        field(69000; "Imprest Bank Account Number"; Code[100])
        {
            Description = '//Ushindi....Pick Imprest Account Bank Details';
            Editable = true;
        }
        field(69001; "Imprest Bank Name"; Text[100])
        {
            Description = '//Ushindi....Pick Imprest Account Bank Details';
            Editable = true;
        }
        field(69002; "Imprest Bank Branch Name"; Text[100])
        {
            Description = '//Ushindi....Pick Imprest Account Bank Details';
            Editable = true;
        }
        field(69004; "Vendor Bank"; Text[30])
        {
        }
        field(69005; "Vendor Bank Branch"; Text[30])
        {
            FieldClass = Normal;
        }
        field(69006; "Vendor Bank Account"; Code[10])
        {
            CalcFormula = lookup(Vendor.Tel where("No." = field("Account No.")));
            FieldClass = FlowField;
        }
        field(69007; "Advance Recovery"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Advance Recovery" where(No = field("No.")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Total Net Pay" := "Total Net Amount" - "Advance Recovery";
            end;
        }
        field(69008; "Total Net Pay"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Total Net Pay" where(No = field("No.")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Total Net Pay" := "Total Net Amount" - "Advance Recovery";
            end;
        }
        field(69009; Test; Decimal)
        {
        }
        field(69010; "Used Claim"; Boolean)
        {
        }
        field(69011; "Amount Paid"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Amount Paid" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(69012; "PV Remaining Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Remaining Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69013; "Part Payment"; Boolean)
        {
        }
        field(69014; "User ID Filter"; Code[50])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }
        field(69015; "Reasons to Reopen"; Text[100])
        {
        }
        field(69016; "Payment processed"; Boolean)
        {
        }
        field(69017; "Imprest Created"; Boolean)
        {
        }
        field(69018; Imprest; Integer)
        {
        }
        field(69019; "Converted By"; Code[100])
        {
        }
        field(69020; "Date converted"; Date)
        {
        }
        field(69021; "Time converted"; Time)
        {
        }
        field(69022; "Vote Item"; Code[20])
        {
            TableRelation = "Budget Commitment";
        }
        field(69023; "Vote Amount"; Decimal)
        {
        }
        field(69024; Commitments; Decimal)
        {
        }
        field(69025; "Actual Amount"; Decimal)
        {
        }
        field(69026; "Available Amount"; Decimal)
        {
        }
        field(69027; "Reference No."; Code[20])
        {
        }
        field(69028; Selected; Boolean)
        {
        }
        field(69029; Job; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(69030; "Job Task No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job));

            trigger OnValidate()
            begin
                TaskRec.Reset;
                TaskRec.SetRange("Job No.", Job);
                TaskRec.SetRange("Job Task No.", "Job Task No");
                if TaskRec.Find('-') then begin
                    TaskRec.CalcFields("Schedule (Total Cost)", "Remaining (Total Cost)", "Usage (Total Cost)", TaskRec.Commitments);
                    "Job Task Name" := TaskRec.Description;
                    "Job Task Budget" := TaskRec."Schedule (Total Cost)";
                    "Job Task Remaining Amount" := TaskRec."Schedule (Total Cost)" - (TaskRec."Usage (Total Cost)" + TaskRec.Commitments);
                end;
            end;
        }
        field(69031; "Job Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69032; "Send for Posting"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(69033; "Standing Imprest Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Annual Requisition,Reimbursement Requisition,Project Standing Imprest';
            OptionMembers = "Annual Requisition","Reimbursement Requisition","Project Standing Imprest";
        }
        field(69038; "Salary Advance"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Car loan" = false then begin
                    if ("Salary Advance" <> 0) and ("No of months deducted" <> 0) then begin
                        "Monthly Installment" := ROUND("Salary Advance" / "No of months deducted", 1, '>');
                    end;
                end;

                if "Car loan" = true then begin
                    SalaryScales.Reset;
                    SalaryScales.SetRange(Scale, "Salary Scale");
                    if SalaryScales.FindFirst then begin
                        if "Salary Advance" > SalaryScales."Maximum Car Loan" then begin
                            Error('Car Loan Amount applied is more that the allowed for your Job Grade: Maximum Grade Amount is %1', SalaryScales."Maximum Car Loan");


                        end;
                    end;
                end;
            end;
        }
        field(69039; "Salary Last Drawn"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69040; "Date of Joining"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(69041; "No of months deducted"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if ("Salary Advance" <> 0) and ("No of months deducted" <> 0) then begin
                    if "Salary Advance" <> 0 then begin
                        if "Car loan" = false then begin
                            if "No of months deducted" > 12 then
                                Error('Maximum Salary Advance Period is 12 Months');
                        end;
                    end;
                    if "Car loan" = true then
                        "Monthly Installment" := ROUND("Total Loan Amount" / "No of months deducted", 1, '>')
                    else
                        "Monthly Installment" := ROUND("Salary Advance" / "No of months deducted", 1, '>');
                end;
            end;
        }
        field(69042; "Amount Pending"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69043; "Recovery Start Month"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(69044; "Monthly Installment"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69045; Purpose; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69046; Remarks; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(69047; Comments; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(69048; "Amount Approved"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69049; "Effective from Month"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(69050; "Float Reimbursement"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(69051; Destination; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(69052; Finance; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(69053; "Imprest Voucher Amount"; Decimal)
        {
            CalcFormula = sum("Imprest Voucher Lines".Amount where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(69055; "Reversed By"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(69056; "Reversal Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(69057; "Posting Group Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Posting GroupX" where(Resources = const(true));

            trigger OnValidate()
            begin
                if EmployeePostingGroup.Get("Posting Group Code") then
                    "Posting Group" := EmployeePostingGroup.Description;
            end;
        }
        field(69058; "Posting Group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(69059; "Imprest Voucher Amount(LCY)"; Decimal)
        {
            CalcFormula = sum("Imprest Voucher Lines"."Amount LCY" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69060; Recouped; Boolean)
        {
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; HOD; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70021; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70022; banked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70023; "Commitments."; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where(Job = field(Job),
                                                                  "Job Task No" = field("Job Task No"),
                                                                  Type = const(Committed)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70024; "Job Task Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70025; "Job Task Remaining Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70026; "Funding Source"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Funding Source");
            end;
        }
        field(70027; "Archive Document"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70028; "Original Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70029; "Regional Manager"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where("Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"),
                                                  "Regional Manager" = filter(true));

            trigger OnValidate()
            begin
                if Employee.Get("Regional Manager") then
                    "Regional Manager Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            end;
        }
        field(70030; "Regional Manager Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70031; "Surrender Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70032; "Surrender  Doc. No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Payments."No." where("Payment Type" = const(Surrender),
                                                  "Account No." = field("Account No."));
        }
        field(70033; "File No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70034; "File No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70035; "Salary Payment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70036; Budgeted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70037; "Payroll Deduction Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = DeductionsX;
        }
        field(70038; "Recovery From"; Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(70039; "Board PAYE"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70040; "PV Voucher Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Create New PV,Append To Exist';
            OptionMembers = " ","Create New PV","Append To Exist";
        }
        field(70041; "PV No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("PV Voucher Type" = const("Append To Exist")) Payments."No." where("Payment Type" = const("Payment Voucher"),
                                                                                                  Posted = const(false));
        }
        field(70042; "Salary Scale"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales".Scale;

            trigger OnValidate()
            begin
                /*IF Scale.GET("Salary Scale") THEN
                 Halt:=Scale."Maximum Pointer";*/

            end;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //ERROR(Text008);
    end;

    trigger OnInsert()
    begin

        CashMgt.Get();
        if "Payment Type" = "payment type"::"Payment Voucher" then begin
            CashMgt.TestField("PV Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."PV Nos", xRec."No. Series", 0D, "No.", "No. Series");
            /* IF "File No."='' THEN
                NoSeriesMgt.InitSeries(CashMgt."PV File Numbering",xRec."File No. Series",0D,"File No.","File No. Series");*/
        end;
        if "Payment Type" = "payment type"::Imprest then begin
            if (CashMgt."Lock Imprest Application" = true) and (UserSetup."Accounts User" = false) then
                Error(Text011);
            CashMgt.TestField("Imprest Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Imprest Nos", xRec."No. Series", 0D, "No.", "No. Series");


        end;
        if "Payment Type" = "payment type"::AIE then begin
            CashMgt.TestField("AIE Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."AIE Nos.", xRec."No. Series", 0D, "No.", "No. Series");


        end;
        if "Payment Type" = "payment type"::"Payment Schedule" then begin
            CashMgt.TestField("Payment Schedule Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Payment Schedule Nos", xRec."No. Series", 0D, "No.", "No. Series");


        end;
        if "Payment Type" = "payment type"::"Petty Cash" then begin
            CashMgt.TestField("Petty Cash Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Petty Cash Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Payment Type" = "payment type"::"Warrant Voucher" then begin
            CashMgt.TestField("Imprest Voucher Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Imprest Voucher Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Payment Type" = "payment type"::"Staff Claim" then begin
            CashMgt.TestField(CashMgt."Staff Claim Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Staff Claim Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;



        if "Payment Type" = "payment type"::Surrender then begin
            CashMgt.TestField(CashMgt."Imprest Surrender Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Imprest Surrender Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Payment Type" = "payment type"::"Bank Transfer" then begin
            CashMgt.TestField(CashMgt."Bank Transfer Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Bank Transfer Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;


        if "Payment Type" = "payment type"::"Standing Imprest" then begin
            CashMgt.TestField(CashMgt."Standing Imprest Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Standing Imprest Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Payment Type" = "payment type"::"Standing Imprest Surrender" then begin
            CashMgt.TestField(CashMgt."Standing Imprest Surrender Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Standing Imprest Surrender Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Payment Type" = "payment type"::"Salary Advance" then begin
            CashMgt.TestField(CashMgt."Salary Advance Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Salary Advance Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Payment Type" = "payment type"::"Car Loan" then begin
            CashMgt.TestField(CashMgt."Car loan Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Car loan Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;


        //Daudi for reversal Document
        CheckDocumentType;
        //End of reversal Documents


        //Ushindi
        "Created By" := UserId;
        Date := Today;
        //Force Reuse of ANY Open Payment Document of same Doc Type as the one being created
        /*IF NOT ("Created By"='KEMRI\ERPPORTAL') THEN BEGIN
        ImpHeader.RESET;
        ImpHeader.SETRANGE(ImpHeader.Status,ImpHeader.Status::Open);
        ImpHeader.SETRANGE(ImpHeader."Payment Type","Payment Type");
        ImpHeader.SETRANGE(ImpHeader."Created By",USERID);
        ImpHeader.SETFILTER("No.",'<>%1',"No.");
        IF ImpHeader.FIND('-') THEN
                //Additions By David to identify unique document types
                IF "Document Type" = "Document Type"::Imprest THEN
                BEGIN
                ERROR(Text005,ImpHeader."No.");
                END
                ELSE IF "Document Type" = "Document Type"::Surrender THEN
                BEGIN
                ERROR(Text0005,ImpHeader."No.");
                END
                ELSE IF "Document Type" = "Document Type"::"Petty Cash" THEN
                BEGIN
                ERROR(Text0003,ImpHeader."No.");
                END
                ELSE IF "Document Type" = "Document Type"::"Payment Voucher" THEN
                BEGIN
                ERROR(Text0004,ImpHeader."No.");
                END;
                //end of David Add ons.
          END;*/

        if "Payment Type" = "payment type"::Imprest then begin
            //Insert User ID and Imprest Account No/Mapping
            UserSetup.Reset;
            if not UserSetup.Get(UserId) then
                Error('%1 is not defined under the User Setup, Please check!', UserId);
            if UserSetup.Get(UserId) then begin
                UserSetup.TestField(UserSetup."Resource No");
                UserSetup.TestField(UserSetup."Employee No.");
                UserSetup.TestField(UserSetup."Imprest Account");
                UserSetup.TestField(UserSetup."Employee Name");
                "Account Type" := "account type"::Customer;
                "Account No." := UserSetup."Imprest Account";
                "Account Name" := UserSetup."Employee Name";
                Payee := UserSetup."Employee Name";
            end;
        end;
        /*
         //Track Customer Imprest Account Bank details and Outstanding Balance
        Customer.RESET;
        Customer.SETRANGE(Customer."No.","Account No.");
        IF Customer.FIND('-') THEN
          BEGIN
            //Track Customer Imprest Bank Details
            Customer.TESTFIELD(Customer."Employee's Bank");
            Customer.TESTFIELD(Customer."Bank Branch");
            Customer.TESTFIELD(Customer."Bank Account Number");
            Customer.CALCFIELDS(Customer."Bank Name");
            Customer.CALCFIELDS(Customer."Bank Branch Name");
            "Imprest Bank Account Number":=Customer."Bank Account Number";
            "Imprest Bank Branch Name":=Customer."Bank Branch Name";
            "Imprest Bank Name":=Customer."Bank Name";
            "Bank Code":=Customer."Employee's Bank";
        
        
            //Track Customer Balance
             Customer.CALCFIELDS(Customer."Balance (LCY)");
             IF Customer."Balance (LCY)" >0 THEN ERROR(Text006,"Account No.",Customer."Balance (LCY)");
            // IF Customer."Balance (LCY)"<>0 THEN ERROR(Text006,"Account No.",Customer."Balance (LCY)");
          END;
        
        END;//End for Payment Type: Imprest Code
        */
        /*
        Vendor.RESET;
        Vendor.SETRANGE(Vendor."No.","Account No.");
        IF Vendor.FIND('-') THEN
        
            BEGIN
        
              Vendor.TESTFIELD(Vendor."Vendor's Bank");
              Vendor.TESTFIELD(Vendor."Bank Name");
              Vendor.TESTFIELD(Vendor.Email);
              Vendor.TESTFIELD(Vendor."Bank Branch Name");
              Vendor.TESTFIELD(Vendor.Tel);
              "Vendor Bank":=Vendor."Bank Name";
              "Vendor Bank Account":=Vendor.Tel;
              "Vendor Bank Branch":=Vendor."Bank Branch Name";
              MODIFY;
        
              END;
        */

        if UsersRec.Get(UserId) then begin
            if UsersRec."Portal User" = false then begin //exempt the portal user name
                if "Account Type" = "account type"::Employee then begin
                    "Account No." := UsersRec."Employee No.";
                    Validate("Account No.");
                end;
            end;
        end;

    end;

    trigger OnRename()
    begin
        if (Status <> Status::Open) then
            Error(Text010);
    end;

    var
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        Amt: Integer;
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        UserSetup: Record "User Setup";
        PV: Record Payments;
        CashMgt: Record "Cash Management Setup";
        Text000: label 'Cash management setup does''nt exist';
        Text001: label 'Create an Imprest A/C for Employee No. %1 under the Employee Card \Please contact system Administrator';
        Text002: label 'Cheque No. already exists';
        Text003: label 'There''s no open entry for attaching from an imprest memo for Employee %1';
        Text004: label 'There''s no Approved Imprest Memo under project %1';
        JobRec: Record Job;
        DimMgt: Codeunit DimensionManagement;
        PurchLines: Record "PV Lines";
        PurchLine: Record "PV Lines";
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        ImpHeader: Record Payments;
        ImpLines: Record "Imprest Lines";
        // ImpLines: Record "Imprest Voucher Lines";
        ImpSurrLines: Record "Imprest Lines";
        Text005: label 'Another Project Imprest Requistion No %1 you created is still Open, Please check or reuse it!';
        Text006: label 'Your Imprest account %1 has an Outstanding Balance of %2, Please check or followup on the related surrender!';
        ImpMemo: Record "Imprest Memo";
        Text007: label 'There''s no Surrendered Imprest Memo under project %1';
        cshma: Record "Cash Management Setup";
        Text008: label 'You cannot delete a record once created. Kindly modify the record and reuse it.';
        Text009: label 'You can not edit a posted document. This will create conflicting entries.';
        Text010: label 'You cannot Rename  a document that is pending approval or fully approved.';
        Text011: label 'You are not allowed to raise an Imprest. Contact accounts and finance team';
        Text0005: label 'Project Imprest Surrender No. %1 You Created Is still Open. Reuse it to avoid much open documents';
        Text0004: label 'Payment Voucher No. %1 You Created Is still Open. Reuse it to avoid much open documents';
        Text0003: label 'Petty Cash  Voucher No. %1 You Created Is still Open. Reuse it to avoid much open documents';
        Amnt: Decimal;
        VATEntry: Record "VAT Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Emp: Record Employee;
        Commitment: Codeunit "Procurement Processing";
        TaskRec: Record "Job Task";
        Employee: Record Employee;
        EmployeeBank: Record "Employee Bank AccountX";
        UsersRec: Record "User Setup";
        EmployeePostingGroup: Record "Employee Posting GroupX";
        StatusCheckSuspended: Boolean;
        CurrencyDate: Date;
        CurrExchRate: Record "Currency Exchange Rate";
        MissingExchangeRatesQst: label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment = '%1 - currency code, %2 - posting date';
        Confirmed: Boolean;
        Text022: label 'Do you want to update the exchange rate?';
        HideValidationDialog: Boolean;
        PayrollPeriodX: Record "Payroll PeriodX";
        SalaryScales: Record "Salary Scales";


    procedure AttachLines(var CurrRec: Record Payments)
    var
        ImpLines: Record "Imprest Lines";
        ProjectMembers: Record "Project Members";
        LineNo: Integer;
        ProjectMembers2: Record "Project Members";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
        ImpMemo: Record "Imprest Memo";
    begin

        ImpLines.Reset;
        ImpLines.SetRange(No, CurrRec."No.");
        if ImpLines.FindLast then
            LineNo := ImpLines."Line No" + 1
        else
            LineNo := 1000;
        //Ushindi
        CurrRec.TestField("Imprest Memo No");
        //Ushindi
        CurrRec.TestField(Project);

        ImpMemo.Reset;
        //Ushindi
        ImpMemo.SetRange("No.", CurrRec."Imprest Memo No");
        //Ushindi
        ImpMemo.SetRange(Project, CurrRec.Project);
        ImpMemo.SetRange(Posted, true);
        if ImpMemo.Find('-') then begin
            repeat
                //Fetch Imprest Line based on Employee
                ProjectMembers.Reset;
                ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.", CurrRec."Imprest Memo No");
                ProjectMembers.SetRange("No.", CurrRec."Account No.");
                ProjectMembers.SetRange(Posted, true);
                ProjectMembers.SetRange(Linked, false);
                if ProjectMembers.Find('-') then begin
                    //Update the header
                    CurrRec."Imprest Type" := CurrRec."imprest type"::"Project Imprest";
                    CurrRec."Project Description" := ImpMemo."Project Description";
                    CurrRec.Modify;
                    //
                    repeat
                        if not ProjectMembers."Project Lead" then//Check whether Project lead or not
                          begin
                            LineNo := LineNo + 1000;
                            ImpLines.Init;
                            ImpLines.No := CurrRec."No.";
                            ImpLines."Line No" := LineNo;
                            ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                            ImpLines.Description := ProjectMembers."Tasks to Carry Out";
                            ImpLines.Amount := ProjectMembers.Entitlement;
                            ImpLines."Work Type" := ProjectMembers."Work Type";
                            ImpLines."Resource No." := ProjectMembers."No.";
                            //Ushindi...Track Job Task No
                            ImpLines."Task No." := ProjectMembers."Task No.";
                            ImpLines."Job Task Description" := ProjectMembers."Job Task Description";
                            //Ushindi
                            if not (ImpLines.Get(ImpLines.No, ImpLines."Line No")) and (not ProjectMembers.Linked) then
                                ImpLines.Insert;

                        end else begin
                            LineNo := LineNo + 1000;
                            //Insert Personell Costs
                            ImpLines.Init;
                            ImpLines.No := CurrRec."No.";
                            ImpLines."Line No" := LineNo;
                            ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                            ImpLines.Description := ProjectMembers."Tasks to Carry Out";
                            ImpLines.Amount := ProjectMembers.Entitlement;
                            ImpLines."Amount LCY" := ProjectMembers.Entitlement;
                            ImpLines."Work Type" := ProjectMembers."Work Type";
                            ImpLines."Resource No." := ProjectMembers."No.";
                            //Ushindi...Track Job Task No
                            ImpLines."Task No." := ProjectMembers."Task No.";
                            ImpLines."Job Task Description" := ProjectMembers."Job Task Description";
                            //Ushindi
                            if not (ImpLines.Get(ImpLines.No, ImpLines."Line No")) and (not ProjectMembers.Linked) then
                                ImpLines.Insert;
                            //Insert Machinery Costs
                            ProjectMembers2.Reset;
                            ProjectMembers2.SetRange(ProjectMembers2."Imprest Memo No.", CurrRec."Imprest Memo No");
                            ProjectMembers2.SetRange(Type, ProjectMembers2.Type::Machine);
                            ProjectMembers2.SetRange(Posted, true);
                            ProjectMembers2.SetRange(Linked, false);
                            if ProjectMembers2.Find('-') then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines.Description := ProjectMembers2."Tasks to Carry Out";
                                    ImpLines.Amount := ProjectMembers2."Expected Maintenance Cost";
                                    ImpLines."Amount LCY" := ProjectMembers2."Expected Maintenance Cost";
                                    ImpLines."Work Type" := ProjectMembers2."Work Type";
                                    ImpLines."Resource No." := ProjectMembers2."No.";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Task No." := ProjectMembers2."Task No.";
                                    ImpLines."Job Task Description" := ProjectMembers2."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    ProjectMembers2.Linked := true;
                                    ProjectMembers2.Modify;
                                until ProjectMembers2.Next = 0;
                            //Insert Casuals
                            Casuals.Reset;
                            Casuals.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                            Casuals.SetRange(Posted, true);
                            Casuals.SetRange(Linked, false);
                            if Casuals.Find('-') then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines.Description := Casuals.Activity;
                                    ImpLines.Amount := Casuals.Amount;
                                    ImpLines."Amount LCY" := Casuals.Amount;
                                    ImpLines."Work Type" := Casuals."Work Type";
                                    ImpLines."Resource No." := Casuals."Resource No.";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Task No." := Casuals."Task No.";
                                    ImpLines."Job Task Description" := Casuals."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    Casuals.Linked := true;
                                    Casuals.Modify;
                                until Casuals.Next = 0;
                            //
                            //Insert Other Costs
                            OtherCosts.Reset;
                            OtherCosts.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                            OtherCosts.SetRange(Posted, true);
                            OtherCosts.SetRange(Linked, false);
                            if OtherCosts.Find('-') then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines."Account No." := OtherCosts."No.";
                                    ImpLines.Description := OtherCosts.Description;
                                    ImpLines.Amount := OtherCosts."Line Amount";
                                    ImpLines."Amount LCY" := OtherCosts."Line Amount";
                                    ImpLines."Work Type" := OtherCosts."Work Type";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Task No." := OtherCosts."Task No.";
                                    ImpLines."Job Task Description" := OtherCosts."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    OtherCosts.Linked := true;
                                    OtherCosts.Modify;
                                until OtherCosts.Next = 0;
                            //
                        end;
                        ProjectMembers.Linked := true;
                        ProjectMembers.Modify;
                    until ProjectMembers.Next = 0;
                end else
                    Error(Text003, CurrRec."No.");
            until ImpMemo.Next = 0;
        end else
            Error(Text004);
    end;


    procedure OpenEntries(CurrRec: Record Payments): Boolean
    var
        ProjectMembers: Record "Project Members";
        OtherCosts: Record "Other Costs";
        Casuals: Record Casuals;
    begin
        ProjectMembers.Reset;
        ProjectMembers.SetRange("No.", CurrRec."Account No.");
        //Ushindi
        ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.", CurrRec."Imprest Memo No");
        //Ushindi
        ProjectMembers.SetRange(Posted, true);
        ProjectMembers.SetRange(Linked, false);
        if ProjectMembers.Find('-') then
            exit(true)
        else begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", CurrRec."Account No.");
            //Ushindi
            ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.", CurrRec."Imprest Memo No");
            //Ushindi
            ProjectMembers.SetRange(Posted, true);
            ProjectMembers.SetRange(Linked, true);
            if ProjectMembers.Find('-') then begin
                repeat
                    Casuals.Reset;
                    Casuals.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                    Casuals.SetRange(Posted, true);
                    Casuals.SetRange(Linked, false);
                    if Casuals.Find('-') then
                        exit(true);
                    //Other Costs
                    OtherCosts.Reset;
                    OtherCosts.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                    OtherCosts.SetRange(Posted, true);
                    OtherCosts.SetRange(Linked, false);
                    if OtherCosts.Find('-') then
                        exit(true);

                until ProjectMembers.Next = 0;
            end;

            exit(false);
        end;
    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        //IF "No." <> '' THEN
        //  MODIFY;

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "No."),
        //     "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
        
        
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    local procedure GetCurrency()
    begin
        /*
          CurrencyCode := "Currency Code";
        
        IF CurrencyCode = '' THEN BEGIN
          CLEAR(Currency);
          Currency.InitRoundingPrecision
        END ELSE
          IF CurrencyCode <> Currency.Code THEN BEGIN
            Currency.GET(CurrencyCode);
            Currency.TESTFIELD("Amount Rounding Precision");
          END;
        */

    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
    begin

        // Update all lines with changed dimensions.

        if NewParentDimSetID = OldParentDimSetID then
            exit;
        if not Confirm(Text051) then
            exit;

        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange(PurchLine.No, "No.");
        PurchLine.LockTable;
        if PurchLine.Find('-') then
            repeat
                NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                if PurchLine."Dimension Set ID" <> NewDimSetID then begin
                    PurchLine."Dimension Set ID" := NewDimSetID;
                    DimMgt.UpdateGlobalDimFromDimSetID(
                      PurchLine."Dimension Set ID", PurchLine."Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 2 Code");
                    PurchLine.Modify;
                end;
            until PurchLine.Next = 0;
    end;


    procedure PurchLinesExist(): Boolean
    begin
        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange(PurchLine.No, "No.");
        exit(PurchLine.FindFirst);
    end;


    procedure AttachSurrLines(var CurrRec: Record Payments)
    var
        ImpLines: Record "Imprest Lines";
        ProjectMembers: Record "Project Members";
        LineNo: Integer;
        ProjectMembers2: Record "Project Members";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
        ImpMemo: Record "Imprest Memo";
    begin

        ImpLines.Reset;
        ImpLines.SetRange(No, CurrRec."No.");
        if ImpLines.FindLast then
            LineNo := ImpLines."Line No" + 1
        else
            LineNo := 1000;
        //Ushindi
        CurrRec.TestField("Imprest Memo Surrender No");
        //Ushindi
        CurrRec.TestField(Project);

        ImpMemo.Reset;
        //Ushindi
        ImpMemo.SetRange("No.", CurrRec."Imprest Memo Surrender No");
        //Ushindi
        ImpMemo.SetRange(Project, CurrRec.Project);
        ImpMemo.SetRange(Surrendered, true);
        ImpMemo.SetRange(Posted, true);
        if ImpMemo.Find('-') then begin
            repeat
                //Fetch Imprest Line based on Employee
                ProjectMembers.Reset;
                ProjectMembers.SetRange("Imprest Memo No.", ImpMemo."No.");
                ProjectMembers.SetRange("No.", CurrRec."Account No.");
                ProjectMembers.SetRange(Posted, true);
                if ProjectMembers.Find('-') then begin
                    //Update the header
                    CurrRec."Imprest Type" := CurrRec."imprest type"::"Project Imprest";
                    CurrRec."Project Description" := ImpMemo."Project Description";
                    CurrRec.Modify;
                    //
                    repeat
                        if not ProjectMembers."Project Lead" then//Check whether Project lead or not
                          begin
                            LineNo := LineNo + 1000;
                            ImpLines.Init;
                            ImpLines.No := CurrRec."No.";
                            ImpLines."Line No" := LineNo;
                            ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                            ImpLines.Description := ProjectMembers."Tasks to Carry Out";
                            ImpLines.Amount := ProjectMembers.Entitlement;
                            ImpLines."Actual Spent" := ProjectMembers."Actual Spent";
                            ImpLines.Validate("Actual Spent");
                            ImpLines."Work Type" := ProjectMembers."Work Type";
                            ImpLines."Resource No." := ProjectMembers."No.";
                            //Ushindi...Track Job Task No
                            ImpLines."Job Task No." := ProjectMembers."Task No.";
                            ImpLines."Job Task Description" := ProjectMembers."Job Task Description";
                            //Ushindi
                            if not (ImpLines.Get(ImpLines.No, ImpLines."Line No")) and (not ProjectMembers.Surrendered) then
                                ImpLines.Insert;

                        end else begin
                            LineNo := LineNo + 1000;
                            //Insert Personell Costs
                            ImpLines.Init;
                            ImpLines.No := CurrRec."No.";
                            ImpLines."Line No" := LineNo;
                            ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                            ImpLines.Description := ProjectMembers."Tasks to Carry Out";
                            ImpLines.Amount := ProjectMembers.Entitlement;
                            ImpLines."Actual Spent" := ProjectMembers."Actual Spent";
                            ImpLines.Validate("Actual Spent");
                            ImpLines."Amount LCY" := ProjectMembers.Entitlement;
                            ImpLines."Work Type" := ProjectMembers."Work Type";
                            ImpLines."Resource No." := ProjectMembers."No.";
                            //Ushindi...Track Job Task No
                            ImpLines."Job Task No." := ProjectMembers."Task No.";
                            ImpLines."Job Task Description" := ProjectMembers."Job Task Description";
                            //Ushindi
                            if not (ImpLines.Get(ImpLines.No, ImpLines."Line No")) and (not ProjectMembers.Surrendered) then
                                ImpLines.Insert;
                            //Insert Machinery Costs
                            ProjectMembers2.Reset;
                            ProjectMembers2.SetRange(Type, ProjectMembers2.Type::Machine);
                            ProjectMembers2.SetRange("Imprest Memo No.", ImpMemo."No.");
                            ProjectMembers2.SetRange(Posted, true);
                            ProjectMembers2.SetRange(Surrendered, false);
                            if ProjectMembers2.Find('-') then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines.Description := ProjectMembers2."Tasks to Carry Out";
                                    ImpLines.Amount := ProjectMembers2."Expected Maintenance Cost";
                                    ImpLines."Amount LCY" := ProjectMembers2."Expected Maintenance Cost";
                                    ImpLines."Actual Spent" := ProjectMembers2."Actual Maintanance Costs";
                                    ImpLines.Validate("Actual Spent");
                                    ImpLines."Work Type" := ProjectMembers2."Work Type";
                                    ImpLines."Resource No." := ProjectMembers2."No.";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Job Task No." := ProjectMembers2."Task No.";
                                    ImpLines."Job Task Description" := ProjectMembers2."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    ProjectMembers2.Surrendered := true;
                                    ProjectMembers2.Modify;
                                until ProjectMembers2.Next = 0;
                            //Insert Casuals
                            Casuals.Reset;
                            Casuals.SetRange("Imprest Memo No.", ImpMemo."No.");
                            Casuals.SetRange(Posted, true);
                            Casuals.SetRange(Surrendered, false);
                            if Casuals.Find('-') then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines.Description := Casuals.Activity;
                                    ImpLines.Amount := Casuals.Amount;
                                    ImpLines."Amount LCY" := Casuals.Amount;
                                    ImpLines."Actual Spent" := Casuals."Actual Amount";
                                    ImpLines.Validate("Actual Spent");
                                    ImpLines."Work Type" := Casuals."Work Type";
                                    ImpLines."Resource No." := Casuals."Resource No.";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Job Task No." := Casuals."Task No.";
                                    ImpLines."Job Task Description" := Casuals."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    Casuals.Surrendered := true;
                                    Casuals.Modify;
                                until Casuals.Next = 0;
                            //
                            //Insert Other Costs
                            OtherCosts.Reset;
                            OtherCosts.SetRange("Imprest Memo No.", ImpMemo."No.");
                            OtherCosts.SetRange(Posted, true);
                            OtherCosts.SetRange(Surrendered, false);
                            if OtherCosts.Find('-') then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines."Account No." := OtherCosts."No.";
                                    ImpLines.Description := OtherCosts.Description;
                                    ImpLines.Amount := OtherCosts."Line Amount";
                                    ImpLines."Amount LCY" := OtherCosts."Line Amount";
                                    ImpLines."Actual Spent" := OtherCosts."Actual Line Amount";
                                    ImpLines.Validate("Actual Spent");
                                    ImpLines."Work Type" := OtherCosts."Work Type";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Job Task No." := OtherCosts."Task No.";
                                    ImpLines."Job Task Description" := OtherCosts."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    OtherCosts.Surrendered := true;
                                    OtherCosts.Modify;
                                until OtherCosts.Next = 0;
                            //
                        end;
                        ProjectMembers.Surrendered := true;
                        ProjectMembers.Modify;
                    until ProjectMembers.Next = 0;
                end else
                    Error(Text003, CurrRec."No.");
            until ImpMemo.Next = 0;
        end else
            Error(Text007);
    end;


    procedure OpenSurrEntries(CurrRec: Record Payments): Boolean
    var
        ProjectMembers: Record "Project Members";
        OtherCosts: Record "Other Costs";
        Casuals: Record Casuals;
    begin
        ProjectMembers.Reset;
        ProjectMembers.SetRange("No.", CurrRec."Account No.");
        //Ushindi
        ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.", CurrRec."Imprest Memo Surrender No");
        //Ushindi
        ProjectMembers.SetRange(Posted, true);
        ProjectMembers.SetRange(Surrendered, false);
        if ProjectMembers.Find('-') then
            exit(true)
        else begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", CurrRec."Account No.");
            //Ushindi
            ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.", CurrRec."Imprest Memo Surrender No");
            //Ushindi
            ProjectMembers.SetRange(Posted, true);
            ProjectMembers.SetRange(Surrendered, true);
            if ProjectMembers.Find('-') then begin
                repeat
                    Casuals.Reset;
                    Casuals.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                    Casuals.SetRange(Posted, true);
                    Casuals.SetRange(Surrendered, false);
                    if Casuals.Find('-') then
                        exit(true);
                    //Other Costs
                    OtherCosts.Reset;
                    OtherCosts.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                    OtherCosts.SetRange(Posted, true);
                    OtherCosts.SetRange(Surrendered, false);
                    if OtherCosts.Find('-') then
                        exit(true);

                until ProjectMembers.Next = 0;
            end;

            exit(false);
        end;
    end;

    local procedure CheckDocumentType()
    begin
        CashMgt.Get();
        if "Payment Type" = "payment type"::"Payment Voucher Reversal" then begin
            CashMgt.TestField("PV Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."PV Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Payment Type" = "payment type"::"Imprest Reversal" then begin
            if (CashMgt."Lock Imprest Application" = true) and (UserSetup."Accounts User" = false) then
                Error(Text011);
            CashMgt.TestField("Imprest Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Imprest Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");


        end;
        if "Payment Type" = "payment type"::"Petty Cash Reversal" then begin
            CashMgt.TestField("Petty Cash Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Petty Cash Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Payment Type" = "payment type"::"Staff Claim Reversal" then begin
            CashMgt.TestField(CashMgt."Staff Claim Reversal Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Staff Claim Reversal Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;



        if "Payment Type" = "payment type"::"Surrender Reversal" then begin
            CashMgt.TestField(CashMgt."Imprest Surrender Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Imprest Surrender Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Payment Type" = "payment type"::"Bank Transfer Reversal" then begin
            CashMgt.TestField(CashMgt."Bank Transfer Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Bank Transfer Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;


        if "Payment Type" = "payment type"::"Standing Imprest Reversal" then begin
            CashMgt.TestField(CashMgt."Standing Imprest Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Standing Imprest Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Payment Type" = "payment type"::"Salary Advance Reversal" then begin
            CashMgt.TestField(CashMgt."Salary Advance Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Salary Advance Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    procedure TestStatusOpen()
    begin
        OnBeforeTestStatusOpen;

        if StatusCheckSuspended then
            exit;

        TestField(Status, Status::Open);

        OnAfterTestStatusOpen;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatusOpen()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterTestStatusOpen()
    begin
    end;

    procedure SuspendStatusCheck(Suspend: Boolean)
    begin
        StatusCheckSuspended := Suspend;
    end;

    procedure UpdateCurrencyFactor()
    var
        UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
        ConfirmManagement: Codeunit "Confirm Management";
        Updated: Boolean;
    begin
        OnBeforeUpdateCurrencyFactor(Rec, Updated);
        if Updated then
            exit;

        if "Currency Code" <> '' then begin
            if "Posting Date" <> 0D then
                CurrencyDate := "Posting Date"
            else
                CurrencyDate := WorkDate;

            if UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrencyDate, "Currency Code") then begin
                "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");

            end else begin
                // if ConfirmManagement.ConfirmProcess(
                //      StrSubstNo(MissingExchangeRatesQst, "Currency Code", CurrencyDate), true)
                // then begin
                //     UpdateCurrencyExchangeRates.OpenExchangeRatesPage("Currency Code");
                //     UpdateCurrencyFactor;
                // end else
                //     RevertCurrencyCodeAndPostingDate;
            end;
        end else
            "Currency Factor" := 0;

        OnAfterUpdateCurrencyFactor(Rec, GetHideValidationDialog);
    end;

    local procedure ConfirmUpdateCurrencyFactor(): Boolean
    begin
        if GetHideValidationDialog or not GuiAllowed then
            Confirmed := true
        else
            Confirmed := Confirm(Text022, false);
        if Confirmed then
            Validate("Currency Factor")
        else
            "Currency Factor" := xRec."Currency Factor";
        exit(Confirmed);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCurrencyFactor(var Payments: Record Payments; var Updated: Boolean)
    begin
    end;

    local procedure RevertCurrencyCodeAndPostingDate()
    begin
        "Currency Code" := xRec."Currency Code";
        "Posting Date" := xRec."Posting Date";
        Modify;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateCurrencyFactor(var Payment: Record Payments; HideValidationDialog: Boolean)
    begin
    end;

    procedure GetHideValidationDialog(): Boolean
    begin
        exit(HideValidationDialog);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRecreatePaymentsOnAfterValidateType(var PurchaseLine: Record "Purchase Line"; TempPurchaseLine: Record "Purchase Line" temporary)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRecreatePaymentsOnBeforeInsertPayments(var PurchaseLine: Record "Purchase Line"; var TempPurchaseLine: Record "Purchase Line" temporary)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRecreatePaymentsOnBeforeTempPaymentsInsert(var TempPurchaseLine: Record "Purchase Line" temporary; PurchaseLine: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateBuyFromVendorNoBeforeRecreateLines(var PurchaseHeader: Record "Purchase Header"; CallingFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRecreatePaymentsOnBeforeConfirm(var Payments: Record Payments; xPayments: Record Payments; ChangedFieldName: Text[100]; HideValidationDialog: Boolean; var Confirmed: Boolean; var IsHandled: Boolean)
    begin
    end;

    procedure UpdatePurchLinesByFieldNo(ChangedFieldNo: Integer; AskQuestion: Boolean)
    var
        "Field": Record "Field";
        PurchLineReserve: Codeunit "Purch. Line-Reserve";
        Question: Text[250];
    begin
    end;
}

