#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85369 "Student Renewal Header"
{
    Caption = 'Student Renewal Header';
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
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student Reg. No."; Rec."Student Reg. No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Registration No';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
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
                field("Renewal Amount"; Rec."Renewal Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Receipt No."; Rec."Renewal Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Invoice No."; Rec."Renewal Invoice No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control37; "Renewal Lines")
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

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to process an invoice?';
                    SalesInv: Record "Sales Header";
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.RenewalCreateInvoice(Rec);

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

                trigger OnAction()
                var
                    TXT001: label 'Proceed with processing a receipt?';
                    SalesInv: Record "Sales Header";
                    SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
                begin
                    if Confirm(TXT001) = true then begin
                        //Examination.RenewalCReceipt(Rec);
                        SalesInv.Reset;
                        SalesInv.SetRange("Sell-to Customer No.", Rec."Student No.");
                        SalesInv.SetRange("External Document No.", Rec."No.");
                        if SalesInv.Find('-') then begin
                            SalesPostYesNo.Run(SalesInv);

                        end;
                        Examination.RenewalUpdateDetails(Rec);
                        Examination.RenewalSendReceipt(Rec);
                    end
                end;
            }
            action("Suggest Renewal Amount")
            {
                ApplicationArea = Basic;
                Image = SuggestPayment;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    TXT001: label 'Suggest pending renewal for %1';
                begin
                    if Confirm(TXT001, true, Rec."Student No.") = true then begin
                        Examination.RenewalGetAmount(Rec);
                    end
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
                            Examination.RenewalRemoveInvoice(Rec);
                        end else
                            Error(TXT002);

                    end;
                end;
            }
            action("Post Renewal")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    TXT001: label 'Update the renewal';
                    ProcessingHeader: Record "Student Processing Header";
                    CustLedgerEntry: Record "Cust. Ledger Entry";
                begin
                    if Confirm(TXT001, true, Rec."No.") = true then begin
                        //verify the student amount is  paid
                        CustLedgerEntry.Reset;
                        CustLedgerEntry.SetRange("External Document No.", Rec."No.");
                        CustLedgerEntry.SetFilter(Amount, '>%1', 0);
                        if CustLedgerEntry.FindFirst then begin
                            Examination.RenewalUpdateDetails(Rec);
                            ProcessingHeader.Reset;
                            ProcessingHeader.SetRange("No.", Rec."No.");
                            if ProcessingHeader.FindFirst then begin
                                ProcessingHeader.Posted := true;
                                ProcessingHeader."Posted By" := UserId;
                                ProcessingHeader."Posted Date" := Today;
                                ProcessingHeader."Posted On" := CurrentDatetime;
                                ProcessingHeader.Modify(true);
                            end
                        end
                    end
                end;
            }
            action("Payment Details")
            {
                ApplicationArea = Basic;
                Image = AnalysisView;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Bank Payment Details";
                RunPageLink = "Reference No." = field("Payment Reference No.");
                RunPageMode = View;
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
            action("Pay Now")
            {
                ApplicationArea = Basic;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
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
                        ProcessingHeader1: Record "Student Processing Header";
                        Customer: Record Customer;
                    begin
                        Rec.TestField("Institution Reference No.");
                        Rec.TestField("Institution Code");
                        if Confirm(TXT001, true, Rec."ID Number/Passport No.", Rec."Institution Name") = true then begin
                            Examination.ApplyInstitutionPayment(Rec);

                            Customer.Reset;
                            Customer.SetRange("ID. No.", Rec."ID Number/Passport No.");
                            if Customer.FindFirst then begin
                                ProcessingHeader1.Reset;
                                ProcessingHeader1.SetRange("No.", Rec."No.");
                                if ProcessingHeader1.FindFirst then begin
                                    ProcessingHeader1."Student No." := Customer."No.";
                                    ProcessingHeader1."Student Name" := Customer.Name;
                                    ProcessingHeader1.Modify(true);
                                end;
                            end;
                        end
                    end;
                }
            }
            group("Student Application")
            {
                Caption = 'Student Application';
                Image = "Order";
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
                }
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
                Visible = false;

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
        Rec."Document Type" := Rec."document type"::Renewal;
    end;

    var
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

