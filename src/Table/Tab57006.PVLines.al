#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57006 "PV Lines"
{

    fields
    {
        field(1;No;Code[20])
        {
            TableRelation = Payments;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(3;Date;Date)
        {
        }
        field(4;"Account Type";Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee,Resource';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee,Resource;
        }
        field(5;"Account No";Code[20])
        {
            Editable = true;
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const("Bank Account")) "Bank Account"
                            else if ("Account Type"=const(Vendor)) Vendor
                            else if ("Account Type"=const(Employee)) Employee
                            else if ("Account Type"=filter(Resource)) Resource;

            trigger OnValidate()
            begin

                case "Account Type" of
                 "account type"::"G/L Account":
                    begin
                     GLAccount.Get("Account No");
                     GLAccount.TestField("Direct Posting",true);
                     "Account Name":=GLAccount.Name;
                    end;
                 "account type"::Vendor:
                   begin
                   if Vendor.Get("Account No") then;
                    "Account Name":=Vendor.Name;
                   end;
                  "account type"::Customer:
                    begin
                    if Customer.Get("Account No") then;
                     "Account Name":=Customer.Name;
                    end;
                  "account type"::"Bank Account":
                     begin
                       Bank.Get("Account No");
                       "Account Name":=Bank.Name;
                     end;
                  "account type"::"Fixed Asset":
                    begin
                      FixedAsset.Get("Account No");
                      "Account Name":=FixedAsset.Description;
                    end;
                  "account type"::Employee:
                    begin
                      Employee.Get("Account No");
                      "Account Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                    end;
                   "account type"::Resource:
                    begin
                      Resource.Get("Account No");
                      "Account Name":=Resource.Name;
                    end;
                end;
                Validate(Amount);

                //added on 23/05/17
                //add the payee and on behalf of to be the account name
                PVHeader.Reset;
                PVHeader.SetRange(PVHeader."No.",No);
                if PVHeader.Find('-') then
                begin
                  PVHeader.Payee := "Account Name";
                  PVHeader."On behalf of" := "Account Name";
                  PVHeader.Modify;
                end;
            end;
        }
        field(6;"Account Name";Text[100])
        {
        }
        field(7;Description;Text[150])
        {
        }
        field(8;Amount;Decimal)
        {
            Editable = true;

            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
                GenLedSetup: Record "General Ledger Setup";
                BudgetAmount: Decimal;
                Expenses: Decimal;
                BudgetAvailable: Decimal;
                Committments: Record "Committment Entries";
                CommittedAmount: Decimal;
                CommitmentEntries: Record "Committment Entries";
                PVHeader: Record Payments;
                TotalCommittedAmount: Decimal;
            begin

                "Amount (LCY)":=Amount;
                GetPaymentHeader;

                PVHeader.Reset;
                PVHeader.SetRange(PVHeader."No.",No);
                if PVHeader.FindSet then begin

                if PVHeader."Currency Code" <> '' then begin
                  PVHeader.TestField("Currency Factor");
                  GenLedSetup.Get;
                  //CashMgt.GET;
                  "Amount (LCY)" :=
                    ROUND(
                      CurrExchRate.ExchangeAmtFCYToLCY(
                        GetDate,PVHeader."Currency Code",
                        Amount,PVHeader."Currency Factor"),
                      GenLedSetup."Inv. Rounding Precision (LCY)");
                end else
                "Amount (LCY)" :=PaymentRounding(Amount);
                end;
                //MESSAGE('%1',GetDate)
                Amount:=PaymentRounding(Amount);
                CalculateTax();
                //Budget commitments and Actual entries
                //1.0 Get the vote item used on Invoice
                pInvoice.SetRange("Document No.","Applies to Doc. No");
                pInvoice.SetRange("Buy-from Vendor No.","Account No");
                if pInvoice.FindSet then
                  begin
                  if pInvoice.Type=pInvoice.Type::"G/L Account" then
                    begin
                    "Vote Item":=pInvoice."No.";
                    bcommitments.SetRange("Document No",pInvoice."No.");
                    if bcommitments.FindSet then
                      begin
                      //bcommitments.CALCFIELDS("Posted Dividend Schedule","Creation Date","No. Series");
                      Commitments:=bcommitments."Committed Amount";
                      //MESSAGE('%1',Commitments)
                      end;
                      //2.0 Get Actual Amounts from g/l entries
                          gEntry.Reset;
                          actualAmount:=0;
                          cSetup.Get;
                          gEntry.SetRange("G/L Account No.",pInvoice."No.");
                          gEntry.SetFilter(gEntry."Posting Date",'%1..%2',cSetup."Leave Posting Period[FROM]",cSetup."Leave Posting Period[TO]");
                           if gEntry.FindSet then
                             begin
                               repeat
                               actualAmount:=actualAmount+Abs(gEntry.Amount);
                               until gEntry.Next=0;
                             end;
                             "Actual to Date":=actualAmount-"Amount (LCY)";
                             "Available Funds":="Vote Amount"-actualAmount+Amount-Commitments;
                    end
                    else
                    if pInvoice.Type=pInvoice.Type::Item then
                      begin
                        Item.Get(pInvoice."No.");
                        "Vote Item":=Item."Vote Item";
                        bcommitments.SetRange("Account No.",Item."Vote Item");
                        if bcommitments.FindSet then
                          begin
                          ///bcommitments.CALCFIELDS("Posted Dividend Schedule","Creation Date","No. Series");
                          Commitments:=bcommitments."Committed Amount";
                          Message('%1',Commitments)
                          end;
                          //2.0 Get Actual Amounts from g/l entries
                              gEntry.Reset;
                              actualAmount:=0;
                              cSetup.Get;
                              gEntry.SetRange("G/L Account No.",Item."Vote Item");
                              gEntry.SetFilter(gEntry."Posting Date",'%1..%2',cSetup."Leave Posting Period[FROM]",cSetup."Leave Posting Period[TO]");
                               if gEntry.FindSet then
                                 begin
                                   repeat
                                   actualAmount:=actualAmount+Abs(gEntry.Amount);
                                   until gEntry.Next=0;
                                 end;
                                 "Actual to Date":=actualAmount-"Amount (LCY)";
                                 "Available Funds":="Vote Amount"-actualAmount+Amount-Commitments;

                  end
                  else if pInvoice.Type=pInvoice.Type::"Fixed Asset" then
                    begin
                      FixedAsset.Get(pInvoice."No.");
                      "Vote Item":=FixedAsset."Vote Item";
                      bcommitments.SetRange("Account No.",FixedAsset."Vote Item");
                      if bcommitments.FindSet then
                      begin
                //      bcommitments.CALCFIELDS("Posted Dividend Schedule","Creation Date","No. Series");
                      Commitments:=bcommitments."Committed Amount";
                      //MESSAGE('%1',Commitments)
                      end;
                      //2.0 Get Actual Amounts from g/l entries
                          gEntry.Reset;
                          actualAmount:=0;
                          cSetup.Get;
                          gEntry.SetRange("G/L Account No.",FixedAsset."Vote Item");
                          gEntry.SetFilter(gEntry."Posting Date",'%1..%2',cSetup."Leave Posting Period[FROM]",cSetup."Leave Posting Period[TO]");
                           if gEntry.FindSet then
                             begin
                               repeat
                               actualAmount:=actualAmount+Abs(gEntry.Amount);
                               until gEntry.Next=0;
                             end;
                             "Actual to Date":=actualAmount-"Amount (LCY)";
                             "Available Funds":="Vote Amount"-actualAmount+Amount-Commitments;
                      end;

                end;
            end;
        }
        field(9;Posted;Boolean)
        {
            Editable = false;
        }
        field(10;"Posted Date";Date)
        {
        }
        field(11;"Posted Time";Time)
        {
        }
        field(12;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin

                ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(13;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(14;"Applies to Doc. No";Code[20])
        {

            trigger OnLookup()
            var
                PaymentSchedule: Record Payments;
            begin
                PVHeader.Reset;
                PVHeader.SetRange("No.",No);
                if PVHeader.FindFirst then begin
                  if PVHeader.Status=PVHeader.Status::Open then begin
                "Applies to Doc. No":='';
                  Amt:=0;
                case "Account Type" of
                "account type"::Customer:
                begin
                 CustLedger.Reset;
                 CustLedger.SetCurrentkey(CustLedger."Customer No.",Open,"Document No.");
                 CustLedger.SetRange(CustLedger."Customer No.","Account No");
                 CustLedger.SetRange(Open,true);
                 CustLedger.CalcFields(CustLedger.Amount);
                if Page.RunModal(25,CustLedger) = Action::LookupOK then begin

                if CustLedger."Applies-to ID"<>'' then begin
                 CustLedger1.Reset;
                 CustLedger1.SetCurrentkey(CustLedger1."Customer No.",Open,"Applies-to ID");
                 CustLedger1.SetRange(CustLedger1."Customer No.","Account No");
                 CustLedger1.SetRange(Open,true);
                 CustLedger1.SetRange("Applies-to ID",CustLedger."Applies-to ID");
                 if CustLedger1.Find('-') then begin
                   repeat
                     CustLedger1.CalcFields(CustLedger1.Amount);
                     Amt:=Amt+Abs(CustLedger1.Amount);
                     //MESSAGE('%1 IN 1',Amt);
                   until CustLedger1.Next=0;
                  end;

                if Amt<>Amt then
                 Error('Amount is not equal to the amount applied on the application PAGE');
                 if Amount = 0 then
                 Amount:=Amt;
                 Validate(Amount);
                 "Applies to Doc. No":=CustLedger."Document No.";
                 "Applies-to Doc. Type":=CustLedger."Applies-to Doc. Type";
                end else begin
                if Amount<>Abs(CustLedger.Amount) then
                CustLedger.CalcFields(CustLedger."Remaining Amount");
                 if Amount=0 then
                Amount:=Abs(CustLedger."Remaining Amount");
                 //MESSAGE('%1 IN 3',CustLedger."Remaining Amount");
                Validate(Amount);
                "Applies to Doc. No":=CustLedger."Document No.";
                "Applies-to Doc. Type":=CustLedger."Applies-to Doc. Type";
                //"External Document No.":=CustLedger."External Document No.";
                 //Insert VAT where applicable

                end;
                end;
                Validate(Amount);
                end;

                "account type"::Vendor:
                begin
                 VendLedger.Reset;
                 VendLedger.SetCurrentkey(VendLedger."Vendor No.",Open,"Document No.");
                 VendLedger.SetRange(VendLedger."Vendor No.","Account No");
                 VendLedger.SetRange(Open,true);
                 VendLedger.CalcFields("Remaining Amount");
                 VendLedger.CalcFields("Remaining Amt. (LCY)");
                if Page.RunModal(29,VendLedger) = Action::LookupOK then begin

                if VendLedger."Applies-to ID"<>'' then begin
                 VendLedger1.Reset;
                 VendLedger1.SetCurrentkey(VendLedger1."Vendor No.",Open,"Applies-to ID");
                 VendLedger1.SetRange(VendLedger1."Vendor No.","Account No");
                 VendLedger1.SetRange(Open,true);
                 VendLedger1.SetRange(VendLedger1."Applies-to ID",VendLedger."Applies-to ID");
                 if VendLedger1.Find('-') then begin
                   repeat
                     VendLedger1.CalcFields(VendLedger1."Remaining Amount");
                     VendLedger1.CalcFields("Remaining Amt. (LCY)");
                     //NetAmount:=NetAmount+ABS(VendLedger1."Remaining Amount");

                   until VendLedger1.Next=0;
                  end;

                if Amount<>Amount then
                 //ERROR('Amount is not equal to the amount applied on the application form');
                  if Amount=0 then
                 Amount:=Amount;

                 Validate(Amount);
                 "Applies to Doc. No":=VendLedger."Document No.";
                 "Applies-to Doc. Type":=VendLedger."Document Type";
                 //"External Document No.":=VendLedger."External Document No.";

                end else begin
                if Amount<>Abs(VendLedger."Remaining Amount") then
                VendLedger.CalcFields(VendLedger."Remaining Amount");
                VendLedger.CalcFields(VendLedger."Remaining Amt. (LCY)");
                if Amount=0 then
                begin
                  Amount:=Abs(VendLedger."Remaining Amount");
                end;

                Validate(Amount);
                "Applies to Doc. No" :=VendLedger."Document No.";
                "Applies-to Doc. Type":=VendLedger."Document Type";
                 //"External Document No.":=VendLedger."External Document No.";
                 "Dimension Set ID" := VendLedger."Dimension Set ID";//added 13/02/2017
                 Validate("Dimension Set ID");

                end;
                end;
                Amount:=Abs(VendLedger."Remaining Amount");

                Validate(Amount);
                end;
                "account type"::Employee:
                  begin

                 EmployeeLedgerEntry.Reset;
                 EmployeeLedgerEntry.SetCurrentkey(EmployeeLedgerEntry."Employee No.",Open,"Document No.");
                 EmployeeLedgerEntry.SetRange(EmployeeLedgerEntry."Employee No.","Account No");
                 EmployeeLedgerEntry.SetRange(Open,true);
                 EmployeeLedgerEntry.CalcFields("Remaining Amount");
                 EmployeeLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                if Page.RunModal(5237,EmployeeLedgerEntry) = Action::LookupOK then begin
                   Amount:=Abs(EmployeeLedgerEntry."Remaining Amount");
                end;
                Validate(Amount);
                "Applies to Doc. No" :=EmployeeLedgerEntry."Document No.";
                "Applies-to Doc. Type":=EmployeeLedgerEntry."Document Type";
                "Dimension Set ID" := EmployeeLedgerEntry."Dimension Set ID";//added 13/02/2017
                 Validate("Dimension Set ID");
                end;
                end;


                PurchInvHeader.Reset;
                PurchInvHeader.SetRange("No.","Applies to Doc. No");
                if PurchInvHeader.FindFirst then begin
                 IDEntry:=PurchInvHeader.RecordId;
                RecordLink.Reset;
                RecordLink.SetRange("Record ID",IDEntry);
                if RecordLink.FindSet then begin
                  repeat
                    PVHeader.Reset;
                    PVHeader.SetRange("No.",No);
                    if PVHeader.FindFirst then begin
                   //copy to the record link table with record id of the PV Machira
                      RecordLink1.Reset;
                      if RecordLink1.FindLast then begin
                        "EntryNo.":=RecordLink1."Link ID";
                      end;
                    RecordLink1.Init;
                    RecordLink1."Link ID":="EntryNo."+1;
                    RecordLink1."Record ID":=PVHeader.RecordId;
                    RecordLink1.URL1:=RecordLink.URL1;
                    RecordLink1.Description:=RecordLink.URL1;
                    RecordLink1.Company:=RecordLink.Company;
                    RecordLink1.Type:=RecordLink.Type;
                    RecordLink1.Created:=RecordLink.Created;
                    RecordLink1."User ID":=RecordLink."User ID";
                    RecordLink1.Insert;
                    end;
                  until RecordLink.Next=0;

                end;
                end;
                end else begin
                  //when document is approved or pending approval
                   case "Account Type" of
                          "account type"::Vendor:
                          begin
                            //open the invoice no
                            if "Applies-to Doc. Type"="applies-to doc. type"::Invoice then begin
                            PurchInvHeader.Reset;
                            PurchInvHeader.SetRange("No.","Applies to Doc. No");
                            if PurchInvHeader.Find('-') then begin
                              Page.RunModal(138,PurchInvHeader);
                            end;
                            end
                             else begin
                              // PaymentSchedule.RESET;
                             //  PaymentSchedule.SETRANGE("No.","Applies to Doc. No");
                               //PaymentSchedule.SETRANGE("Payment Type",PaymentSchedule."Payment Type"::"Payment Schedule");
                               //IF PaymentSchedule.FINDFIRST THEN BEGIN
                                 //PAGE.RUNMODAL(57195,PaymentSchedule);
                              PaymentSchedule.Reset;
                              PaymentSchedule.SetRange("No.","Applies to Doc. No");
                              if PaymentSchedule.FindSet then begin
                              if PaymentSchedule."Payment Type"=PaymentSchedule."payment type"::"Payment Schedule" then begin
                               Page.RunModal(57195,PaymentSchedule);
                               end;
                              if PaymentSchedule."Payment Type"=PaymentSchedule."payment type"::"Staff Claim" then begin
                               Page.RunModal(57111,PaymentSchedule);
                              end else begin
                              //run the ledger entry page
                              VendLedger.Reset;
                              VendLedger.SetRange("Vendor No.","Account No");
                              VendLedger.SetRange("Document No.","Applies to Doc. No");
                              Page.RunModal(29,VendLedger);
                              end;
                              end;
                            end;
                          end;
                end;
                end;
                end;
            end;

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(15;"VAT Code";Code[20])
        {
            TableRelation = "Tariff Codes1".Code where (Type=const(VAT));

            trigger OnValidate()
            begin
                //VALIDATE(Amount);
                 CalculateTax();
            end;
        }
        field(16;"W/Tax Code";Code[20])
        {
            TableRelation = if ("Account Type"=const(Vendor)) "Tariff Codes1".Code where (Type=const("W/Tax"));

            trigger OnValidate()
            begin
                //VALIDATE(Amount);


                      CalculateTax();
            end;
        }
        field(17;"Retention Code1";Code[20])
        {
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin

                      CalculateTax();
            end;
        }
        field(18;"VAT Amount";Decimal)
        {
        }
        field(19;"W/Tax Amount";Decimal)
        {
        }
        field(20;"Retention Amount1";Decimal)
        {

            trigger OnValidate()
            begin
                //VALIDATE(Amount)

                  // VALIDATE("Net Amount");
            end;
        }
        field(21;"Net Amount";Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount":=Amount-"W/Tax Amount"-"VAT Withheld Amount"-"Retention  Amount"-"Advance Recovery";
                "Remaining Amount":="Net Amount";
                "Amount Paid":=0.0;
                "Net Amount":=PaymentRounding("Net Amount");
            end;
        }
        field(22;"W/T VAT Code";Code[20])
        {
            TableRelation = if ("Account Type"=const(Vendor)) "Tariff Codes1".Code where (Type=const("W/Tax"));

            trigger OnValidate()
            begin
                //VALIDATE(Amount);
            end;
        }
        field(23;"W/T VAT Amount";Decimal)
        {
        }
        field(24;Type;Code[20])
        {
            NotBlank = true;
            TableRelation = "Receipts and Payment Types1".Code where (Type=filter(Payment));

            trigger OnValidate()
            var
                TarrifCode: Record "Tariff Codes1";
            begin
                "Account No":='';
                "Account Name":='';
                //Remarks:='';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code,Type);
                RecPayTypes.SetRange(RecPayTypes.Type,RecPayTypes.Type::Payment);
                
                if RecPayTypes.Find('-') then
                  begin
                    Grouping:=RecPayTypes."Default Grouping";
                //    "Require Surrender":=RecPayTypes."Pending Voucher";
                //    "Payment Reference":=RecPayTypes."Payment Reference";
                     "Budgetary Control A/C":=RecPayTypes."Direct Expense";
                
                    if RecPayTypes."VAT Chargeable"=RecPayTypes."vat chargeable"::Yes then
                      begin
                        "VAT Code":=RecPayTypes."VAT Code";
                        if TarrifCode.Get("VAT Code") then
                          "VAT Rate":=TarrifCode.Percentage;
                      end;
                    if RecPayTypes."Withholding Tax Chargeable"=RecPayTypes."withholding tax chargeable"::Yes then
                      begin
                       "W/Tax Code":=RecPayTypes."Withholding Tax Code";
                        if TarrifCode.Get("W/Tax Code") then
                          "W/Tax Rate":=TarrifCode.Percentage;
                
                      end;
                
                     ////
                    if RecPayTypes."VAT Chargeable"=RecPayTypes."vat chargeable"::Yes then
                      begin
                       "VAT Withheld Code":=RecPayTypes."VAT Withheld Code";
                        if TarrifCode.Get("VAT Withheld Code") then
                          "VAT Six % Rate":=TarrifCode.Percentage;
                      end;
                
                     ////
                
                
                    if  RecPayTypes."Calculate Retention"=RecPayTypes."calculate retention"::Yes then
                      begin
                        "Retention Code":=RecPayTypes."Retention Code";
                        if TarrifCode.Get("Retention Code") then
                           "Retention Rate":=TarrifCode.Percentage;
                
                      end;
                
                  end;
                
                if RecPayTypes.Find('-') then
                  begin
                    "Account Type":=RecPayTypes."Account Type";
                    Validate("Account Type");
                    "Transaction Name":=RecPayTypes.Description;
                     "Budgetary Control A/C":=RecPayTypes."Direct Expense";
                      if RecPayTypes."Account Type"=RecPayTypes."account type"::"G/L Account" then
                        begin
                          RecPayTypes.TestField(RecPayTypes."G/L Account");
                          "Account No":=RecPayTypes."G/L Account";
                          Validate("Account No");
                        end;
                
                //Banks
                if RecPayTypes."Account Type"=RecPayTypes."account type"::"Bank Account" then
                  begin
                    //"Account No":=RecPayTypes."Bank Account";
                     Validate("Account No");
                  end;
                
                if RecPayTypes."Account Type"=RecPayTypes."account type"::Customer then
                  begin
                    "Account No":=RecPayTypes."Account no";
                    Validate("Account No");
                    end;
                    end;
                PHead.Reset;
                PHead.SetRange(PHead."No.",No);
                if PHead.FindFirst then
                  begin
                    Date:=PHead.Date;
                  //  PHead.TESTFIELD("Responsibility Center");
                    /*
                    "Shortcut Dimension 1 Code":=PHead."Shortcut Dimension 1 Code";
                     VALIDATE("Shortcut Dimension 1 Code");
                    "Shortcut Dimension 2 Code":=PHead."Shortcut Dimension 2 Code";
                    VALIDATE("Shortcut Dimension 2 Code");
                    */
                    "Dimension Set ID":=PHead."Dimension Set ID";
                    //currency "Currency Code":=PHead."Currency Code";
                    //"Currency Factor":=PHead."Currency Factor";
                    "Payment Type":=PHead."Payment Type";
                  end;
                
                
                if TransType.Get(Type) then begin
                   "Account Type":=TransType."Account Type";
                   "Account No":=TransType."G/L Account";
                   Validate("Account No");
                   "Account Name":=TransType."Transation Remarks";
                   end;
                Validate(Amount);

            end;
        }
        field(25;"Transaction Name";Text[100])
        {
        }
        field(37;Grouping;Code[20])
        {
            TableRelation = "Vendor Posting Group".Code;
        }
        field(38;"Payment Type";Option)
        {
            CalcFormula = lookup(Payments."Payment Type" where ("No."=field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender,Surrender';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender",Surrender;
        }
        field(39;"Bank Type";Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(40;"PV Type";Option)
        {
            OptionMembers = Normal,Other;
        }
        field(73;"VAT Rate";Decimal)
        {

            trigger OnValidate()
            begin
                /*"VAT Amount":=(Amount * 100);
                "VAT Amount":=Amount-("VAT Amount"/(100 + "VAT Rate"));*/

            end;
        }
        field(74;"Amount With VAT";Decimal)
        {
        }
        field(79;"Budgetary Control A/C";Boolean)
        {
        }
        field(83;Committed;Boolean)
        {
        }
        field(85;"NetAmount LCY";Decimal)
        {
        }
        field(86;"Applies-to Doc. Type";Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(87;"Applies-to Doc. No.";Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                VendLedgEntry: Record "Vendor Ledger Entry";
                ApplyVendEntries: Page "Apply Vendor Entries";
                PayToVendorNo: Code[20];
                OK: Boolean;
                Text000: label 'You must specify %1 or %2.';
            begin
                //CODEUNIT.RUN(CODEUNIT::"Payment Voucher Apply",Rec);
                /*
                IF (Rec."Account Type"<>Rec."Account Type"::Customer) AND (Rec."Account Type"<>Rec."Account Type"::Vendor) THEN
                    ERROR('You cannot apply to %1',"Account Type");
                
                WITH Rec DO BEGIN
                  Amount:=0;
                  VALIDATE(Amount);
                  PayToVendorNo := "Account No." ;
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open);
                  VendLedgEntry.SETRANGE("Vendor No.",PayToVendorNo);
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  IF "Applies-to ID" = '' THEN
                    "Applies-to ID" := No;
                  IF "Applies-to ID" = '' THEN
                    ERROR(
                      Text000,
                      FIELDCAPTION(No),FIELDCAPTION("Applies-to ID"));
                  //ApplyVendEntries."SetPVLine-Delete"(PVLine,PVLine.FIELDNO("Applies-to ID"));
                  ApplyVendEntries.SetPVLine(Rec,VendLedgEntry,Rec.FIELDNO("Applies-to ID"));
                  ApplyVendEntries.SETRECORD(VendLedgEntry);
                  ApplyVendEntries.SETTABLEVIEW(VendLedgEntry);
                  ApplyVendEntries.LOOKUPMODE(TRUE);
                  OK := ApplyVendEntries.RUNMODAL = ACTION::LookupOK;
                  CLEAR(ApplyVendEntries);
                  IF NOT OK THEN
                    EXIT;
                  VendLedgEntry.RESET;
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open);
                  VendLedgEntry.SETRANGE("Vendor No.",PayToVendorNo);
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  VendLedgEntry.SETRANGE("Applies-to ID","Applies-to ID");
                  IF VendLedgEntry.FIND('-') THEN BEGIN
                    "Applies-to Doc. Type" := 0;
                    "Applies-to Doc. No." := '';
                  END ELSE
                    "Applies-to ID" := '';
                END;
                
                //Calculate  Total To Apply
                  VendLedgEntry.RESET;
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open,"Applies-to ID");
                  VendLedgEntry.SETRANGE("Vendor No.",PayToVendorNo);
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  VendLedgEntry.SETRANGE("Applies-to ID","Applies-to ID");
                  IF VendLedgEntry.FIND('-') THEN BEGIN
                        VendLedgEntry.CALCSUMS("Amount to Apply");
                        Amount:=ABS(VendLedgEntry."Amount to Apply");
                        VALIDATE(Amount);
                  END;
                
                */

            end;

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(88;"Applies-to ID";Code[20])
        {
            Caption = 'Applies-to ID';

            trigger OnValidate()
            var
                TempVendLedgEntry: Record "Vendor Ledger Entry";
            begin
                /*
                //IF "Applies-to ID" <> '' THEN
                //  TESTFIELD("Bal. Account No.",'');
                IF ("Applies-to ID" <> xRec."Applies-to ID") AND (xRec."Applies-to ID" <> '') THEN BEGIN
                  VendLedgEntry.SETCURRENTKEY("Vendor No.",Open);
                  VendLedgEntry.SETRANGE("Vendor No.","Account No.");
                  VendLedgEntry.SETRANGE(Open,TRUE);
                  VendLedgEntry.SETRANGE("Applies-to ID",xRec."Applies-to ID");
                  IF VendLedgEntry.FINDFIRST THEN
                    VendEntrySetApplID.SetApplId(VendLedgEntry,TempVendLedgEntry,0,0,'');
                  VendLedgEntry.RESET;
                END;
                */

            end;
        }
        field(90;"Retention Code";Code[20])
        {
            TableRelation = "Tariff Codes1".Code where (Type=const(Retention));

            trigger OnValidate()
            begin
                  //CalculateTax();
            end;
        }
        field(91;"Retention  Amount";Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount":=Amount-"W/Tax Amount"-"VAT Withheld Amount"-"Retention  Amount"-"Advance Recovery";
            end;
        }
        field(92;"Retention Rate";Decimal)
        {
        }
        field(93;"W/Tax Rate";Decimal)
        {
        }
        field(94;"Currency Code";Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(480;"Dimension Set ID";Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(50000;"Gl Balance";Decimal)
        {
            FieldClass = Normal;
        }
        field(50001;Project;Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job where (Status=filter(<>Completed));

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
        field(50003;"VAT Withheld Amount";Decimal)
        {

            trigger OnValidate()
            begin
                //"VAT Withheld Amount":="VAT Amount"*0.06;
            end;
        }
        field(50004;"VAT Withheld Code";Code[20])
        {
            TableRelation = "Tariff Codes1".Code where (Type=const(VAT));
        }
        field(50005;"VAT Six % Rate";Decimal)
        {
        }
        field(50006;"Advance Recovery";Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount":=Amount-"W/Tax Amount"-"VAT Withheld Amount"-"Retention  Amount"-"Advance Recovery";
            end;
        }
        field(50007;"Total Net Pay";Decimal)
        {
        }
        field(50008;"Job Task No.";Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field(Project));
        }
        field(50009;"Project Description";Text[250])
        {
            CalcFormula = lookup(Job.Description where ("No."=field("Shortcut Dimension 2 Code")));
            FieldClass = FlowField;
        }
        field(50010;"Claim Doc No.";Code[20])
        {
            TableRelation = Payments."No." where ("Payment Type"=filter("Staff Claim"),
                                                  "Account No."=field("Account No"),
                                                  Status=const(Released),
                                                  Posted=const(true));

            trigger OnValidate()
            begin
                sclaims.Reset;
                sclaims.SetRange(sclaims."No.","Claim Doc No.");
                 if sclaims.FindFirst then
                 sclaims.CalcFields(sclaims."Total Amount LCY");
                 Amount:=sclaims."Total Amount LCY";
                 Validate(Amount);
                 sclaims."Used Claim":=true;
                 sclaims.Modify;
            end;
        }
        field(50011;"Amount Paid";Decimal)
        {
            Description = 'Fields Added By David To cater for part payment of the Payment Vouchers';

            trigger OnValidate()
            begin
                TestField(Status,Status::Released);
                if "Amount Paid">"Net Amount" then
                  Error(Text001,No);
                if "Remaining Amount"=0 then
                begin
                "Remaining Amount":="Net Amount"-"Amount Paid";
                end
                else
                begin
                "Remaining Amount":="Remaining Amount"-"Amount Paid";
                 if "Remaining Amount"<0 then
                   Error(Text002,No);
                 end;
            end;
        }
        field(50012;"Remaining Amount";Decimal)
        {
        }
        field(50013;"Part Payment";Boolean)
        {
        }
        field(50014;Status;Option)
        {
            CalcFormula = lookup(Payments.Status where ("No."=field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;
        }
        field(50015;"Date Paid";Date)
        {
            Description = 'End of Field Added';
        }
        field(50016;"No. Posted";Integer)
        {
        }
        field(50017;"Paying Bank Account";Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(50018;"Bank Name";Code[20])
        {
            CalcFormula = lookup("Bank Account".Name where ("No."=field("Paying Bank Account")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50019;"Document Type";Option)
        {
            CalcFormula = lookup(Payments."Document Type" where ("No."=field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Payment Voucher,Petty Cash,Imprest,Imprest Surrender,Bank Transfer,Surrender';
            OptionMembers = "Payment Voucher","Petty Cash",Imprest,"Imprest Surrender","Bank Transfer",Surrender;
        }
        field(50020;"Vote Item";Code[20])
        {
            Editable = true;
            TableRelation = "G/L Account"."No.";
        }
        field(50021;"Vote Amount";Decimal)
        {
            CalcFormula = lookup("G/L Budget Entry".Amount where ("G/L Account No."=field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50022;"Actual to Date";Decimal)
        {
            Editable = false;
        }
        field(50023;Commitments;Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50024;"Vote Item Desc.";Text[200])
        {
            CalcFormula = lookup("G/L Account".Name where ("No."=field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025;"Available Funds";Decimal)
        {
            Editable = false;
        }
        field(50026;"Type of Expense";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts and Payment Types1" where ("Appear on Imprest?"=filter(true));

            trigger OnValidate()
            begin
                tExpense.Reset;
                tExpense.SetRange(Code,"Type of Expense");
                if tExpense.FindSet then
                  begin
                    "Account Type":="account type"::"G/L Account";
                    "Vote Item":=tExpense."G/L Account";
                    "Account No":=tExpense."G/L Account";
                    Validate("Account No");

                    gEntry.Reset;
                          actualAmount:=0;
                          cSetup.Get;
                          bcommitments.Reset;
                          gEntry.SetRange("G/L Account No.",tExpense."G/L Account");
                          gEntry.SetFilter(gEntry."Posting Date",'%1..%2',cSetup."Leave Posting Period[FROM]",cSetup."Leave Posting Period[TO]");
                           if gEntry.FindSet then
                             begin
                               repeat
                               actualAmount:=actualAmount+Abs(gEntry.Amount);
                               until gEntry.Next=0;
                             end;

                             "Actual to Date":=actualAmount;

                             bcommitments.SetRange("Account No.","Vote Item");
                             if bcommitments.FindSet then
                               begin
                              "Vote Amount":=bcommitments."Committed Amount";
                              //bcommitments.CALCFIELDS("No. Series","Posted Dividend Schedule","Creation Date");
                              Commitments:=bcommitments."Committed Amount";
                              //"Available Funds":="Vote Amount"-actualAmount-(bcommitments."No. Series"+bcommitments."Posted Dividend Schedule"+bcommitments."Creation Date");
                              end;
                            end ;
            end;
        }
        field(50027;"Reference No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50028;Budget;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50029;"Shortcut Dimesnion 4 Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));
        }
        field(50030;"Check Printed";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50031;"Check No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50032;"Car Loan Doc. No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50033;"S/Advance No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50034;"Amount (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;No,"Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        VATAmount: Decimal;
        "W/TAmount": Decimal;
        RetAmount: Decimal;
        NetAmount: Decimal;
        VATSetup: Record "VAT Posting Setup";
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        CSetups: Record "Cash Management Setup";
        Direction: Text[30];
        WTVATAmount: Decimal;
        VATSetup2: Record "VAT Posting Setup";
        VATEntry: Record "VAT Entry";
        DimMgt: Codeunit DimensionManagement;
        DimValue: Record "Dimension Value";
        RecPayTypes: Record "Receipts and Payment Types1";
        PHead: Record Payments;
        TransType: Record "Receipts and Payment Types1";
        sclaims: Record Payments;
        CashMgt: Record "Cash Management Setup";
        Text001: label 'Amount Paid For document No. %1 Cannot be more than The Net Amount. Kindly Check.';
        Text002: label 'Remaining Amount in document No. %1 Cannot be less than 0. Please verify that you have correctly specified the Amount paid.';
        PVHeader: Record Payments;
        pInvoice: Record "Purch. Inv. Line";
        bcommitments: Record "Commitment Entries";
        Item: Record Item;
        cSetup: Record "Human Resources Setup";
        gEntry: Record "G/L Entry";
        actualAmount: Decimal;
        tExpense: Record "Receipts and Payment Types1";
        fAsset: Record "Fixed Asset";
        Employee: Record Employee;
        Resource: Record Resource;
        RecordLink: Record "Record Link";
        IDEntry: RecordID;
        PurchInvHeader: Record "Purch. Inv. Header";
        RecordLink1: Record "Record Link";
        "EntryNo.": Integer;
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        EmployeeLedgerEntry: Record "Employee Ledger Entry";


    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin


        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
        if No<> '' then
          Modify;

        if OldDimSetID <> "Dimension Set ID" then begin
          Modify;
          //IF SalesLinesExist THEN
            //UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        end;
    end;


    procedure GetCurrency()
    begin
    end;


    procedure ShowDimensions()
    begin
        /*
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2 %3',"Payment Type","No.","Line No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */

    end;


    procedure CalculateTax()
    var
        CalculationType: Option VAT,"W/Tax",Retention;
        TotalTax: Decimal;
        TaxCalc: Codeunit "Tax Calculation";
        GeneralLedgerSetup: Record "General Ledger Setup";
        Direction: Code[10];
    begin
          "VAT Amount":=0;"W/Tax Amount":=0; "Retention  Amount":=0;TotalTax:=0; "Net Amount":=0;
          if "Amount (LCY)" <>0 then begin
            if "VAT Rate"<>0 then begin
             "VAT Amount":=TaxCalc.CalculateTax(Rec,Calculationtype::VAT);
             TotalTax:=TotalTax+"VAT Amount"
            end;
        
            if "W/Tax Rate"<>0 then begin
            "W/Tax Amount":=TaxCalc.CalculateTax(Rec,Calculationtype::"W/Tax");
             TotalTax:=TotalTax+ "W/Tax Amount"
            end;
        
            if "Retention Rate"<>0 then begin
             "Retention  Amount":=TaxCalc.CalculateTax(Rec,Calculationtype::Retention);
             TotalTax:=TotalTax+"Retention  Amount"
            end;
          end;
        
        
              "VAT Withheld Amount":=0;
           if "VAT Six % Rate"<>0 then begin
            "VAT Withheld Amount":=("Amount (LCY)"-"VAT Amount")*("VAT Six % Rate")/100;
        
             /// "VAT Withheld Amount":=0;
        
            /*IF Amount <>0 THEN BEGIN
            IF "VAT Rate"<>0 THEN BEGIN
             "VAT Withheld Amount":=(Amount-"VAT Amount")*0.06;
            END;
            END;*/
            end;
        
            //Philip Rounding
            /*GeneralLedgerSetup.GET;
            IF GeneralLedgerSetup."Tax Rounding Precision (LCY)"<>0 THEN BEGIN
              CASE  GeneralLedgerSetup."Tax Rounding Type (LCY)" OF
                GeneralLedgerSetup."Tax Rounding Type (LCY)"::Down:
                  Direction:='<';
                GeneralLedgerSetup."Tax Rounding Type (LCY)"::Nearest:
                  Direction:='=';
                GeneralLedgerSetup."Tax Rounding Type (LCY)"::Up:
                  Direction:='>';
              END;
              "W/Tax Amount":=ROUND("W/Tax Amount",GeneralLedgerSetup."Tax Rounding Precision (LCY)",Direction);
              "VAT Withheld Amount":=ROUND("VAT Withheld Amount",GeneralLedgerSetup."Tax Rounding Precision (LCY)",Direction);
              "Retention  Amount":=ROUND("Retention  Amount",GeneralLedgerSetup."Tax Rounding Precision (LCY)",Direction);
              "Advance Recovery":=ROUND("Advance Recovery",GeneralLedgerSetup."Tax Rounding Precision (LCY)",Direction);
            END;*/
        
            "W/Tax Amount":=PaymentRounding("W/Tax Amount");
            "VAT Withheld Amount":=PaymentRounding("VAT Withheld Amount");
            "Retention  Amount":=PaymentRounding("Retention  Amount");
            "Advance Recovery":=PaymentRounding("Advance Recovery");
        
            "Net Amount":="Amount (LCY)"-"W/Tax Amount"-"VAT Withheld Amount"-"Retention  Amount"-"Advance Recovery";
           Validate("Net Amount");

    end;

    local procedure GetPaymentHeader()
    begin
        TestField(No);
          PVHeader.Get(No);
          if PVHeader."Currency Code" = '' then
            Currency.InitRoundingPrecision
          else begin
            PVHeader.TestField("Currency Factor");
            Currency.Get(PVHeader."Currency Code");
            Currency.TestField("Amount Rounding Precision");
          end;


        OnAfterGetPaymentsHeader(Rec,PVHeader);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetPaymentsHeader(var PVLine: Record "PV Lines";var PaymentHeader: Record Payments)
    begin
    end;

    procedure GetDate(): Date
    begin
        GetPaymentHeader;

        if PVHeader.Date <> 0D then
          exit(PVHeader.Date);
        exit(WorkDate);
    end;


    procedure PaymentRounding(var Amount: Decimal) AmountRounding: Decimal
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        
            GeneralLedgerSetup.Get;
            if GeneralLedgerSetup."Amount Rounding Precision"=0 then
               Error('You must specify the rounding precision under HR setup');
        
          if GeneralLedgerSetup."Inv. Rounding Type (LCY)"=GeneralLedgerSetup."inv. rounding type (lcy)"::Nearest then
            AmountRounding:=ROUND(Amount,GeneralLedgerSetup."Amount Rounding Precision",'=');
        
          if GeneralLedgerSetup."Inv. Rounding Type (LCY)"=GeneralLedgerSetup."inv. rounding type (lcy)"::Up then
            AmountRounding:=ROUND(Amount,GeneralLedgerSetup."Amount Rounding Precision",'>');
        
          if GeneralLedgerSetup."Inv. Rounding Type (LCY)"=GeneralLedgerSetup."inv. rounding type (lcy)"::Down then
            AmountRounding:=ROUND(Amount,GeneralLedgerSetup."Amount Rounding Precision",'<');
            /*AmountRounding:=ROUND(Amount,1,'=');*/

    end;


    procedure CalculateTax1()
    var
        CalculationType: Option VAT,"W/Tax",Retention;
        TotalTax: Decimal;
        TaxCalc: Codeunit "Tax Calculation";
        GeneralLedgerSetup: Record "General Ledger Setup";
        Direction: Code[10];
    begin
          "VAT Amount":=0;"W/Tax Amount":=0; "Retention  Amount":=0;TotalTax:=0; "Net Amount":=0;
          if Amount <>0 then begin
            if "VAT Rate"<>0 then begin
             "VAT Amount":=TaxCalc.CalculateTax(Rec,Calculationtype::VAT);
             TotalTax:=TotalTax+"VAT Amount"
            end;
        
            if "W/Tax Rate"<>0 then begin
            "W/Tax Amount":=TaxCalc.CalculateTax(Rec,Calculationtype::"W/Tax");
             TotalTax:=TotalTax+ "W/Tax Amount"
            end;
        
            if "Retention Rate"<>0 then begin
             "Retention  Amount":=TaxCalc.CalculateTax(Rec,Calculationtype::Retention);
             TotalTax:=TotalTax+"Retention  Amount"
            end;
          end;
        
        
              "VAT Withheld Amount":=0;
           if "VAT Six % Rate"<>0 then begin
            "VAT Withheld Amount":=(Amount-"VAT Amount")*("VAT Six % Rate")/100;
        
             /// "VAT Withheld Amount":=0;
        
            /*IF Amount <>0 THEN BEGIN
            IF "VAT Rate"<>0 THEN BEGIN
             "VAT Withheld Amount":=(Amount-"VAT Amount")*0.06;
            END;
            END;*/
            end;
        
            //Philip Rounding
            /*GeneralLedgerSetup.GET;
            IF GeneralLedgerSetup."Tax Rounding Precision (LCY)"<>0 THEN BEGIN
              CASE  GeneralLedgerSetup."Tax Rounding Type (LCY)" OF
                GeneralLedgerSetup."Tax Rounding Type (LCY)"::Down:
                  Direction:='<';
                GeneralLedgerSetup."Tax Rounding Type (LCY)"::Nearest:
                  Direction:='=';
                GeneralLedgerSetup."Tax Rounding Type (LCY)"::Up:
                  Direction:='>';
              END;
              "W/Tax Amount":=ROUND("W/Tax Amount",GeneralLedgerSetup."Tax Rounding Precision (LCY)",Direction);
              "VAT Withheld Amount":=ROUND("VAT Withheld Amount",GeneralLedgerSetup."Tax Rounding Precision (LCY)",Direction);
              "Retention  Amount":=ROUND("Retention  Amount",GeneralLedgerSetup."Tax Rounding Precision (LCY)",Direction);
              "Advance Recovery":=ROUND("Advance Recovery",GeneralLedgerSetup."Tax Rounding Precision (LCY)",Direction);
            END;*/
        
            "W/Tax Amount":=PaymentRounding("W/Tax Amount");
            "VAT Withheld Amount":=PaymentRounding("VAT Withheld Amount");
            "Retention  Amount":=PaymentRounding("Retention  Amount");
            "Advance Recovery":=PaymentRounding("Advance Recovery");
        
            "Net Amount":=Amount-"W/Tax Amount"-"VAT Withheld Amount"-"Retention  Amount"-"Advance Recovery";
           Validate("Net Amount");

    end;
}

