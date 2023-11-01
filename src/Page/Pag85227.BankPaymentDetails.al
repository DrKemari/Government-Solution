#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85227 "Bank Payment Details"
{
    Caption = 'Bank Payment Details';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = "Bank Import Entries";
    SourceTableView = where(Posted = filter(true),
                            Closed = filter(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Student Identifier"; Rec."Student Identifier")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Identifier field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Applied Amount"; Rec."Applied Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applied Amount field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("M-PESA Code"; Rec."M-PESA Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the M-PESA Code field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Allocate)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Allocate action.';
                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                    StudentHeader: Record "Student Processing Header";
                    ReceiptsHeader: Record "Receipts Header1";
                    BankImportEntries: Record "Bank Import Entries";
                    TXT001: label 'Kindly select the payment reference for application';
                begin
                    BankImportEntries.Reset;
                    BankImportEntries.SetRange("Reference No.", Rec."Reference No.");
                    if BankImportEntries.FindFirst then begin
                        StudentHeader.Reset;
                        StudentHeader.SetRange("Payment Reference No.", Rec."Reference No.");
                        StudentHeader.SetRange(Posted, false);
                        if StudentHeader.FindFirst then begin
                            if StudentHeader."Document Type" = StudentHeader."document type"::Registration then
                                if StudentHeader.Portal = true then begin
                                    Examination.ApplicationCreateInvoice(StudentHeader);
                                end else
                                    StudentHeader.TestField("Application Invoice");
                            if StudentHeader."Document Type" = StudentHeader."document type"::Booking then
                                StudentHeader.TestField("Booking Invoice No.");
                            if StudentHeader."Document Type" = StudentHeader."document type"::Exemption then
                                StudentHeader.TestField("Exemption Invoice No.");
                            if StudentHeader."Document Type" = StudentHeader."document type"::Renewal then
                                StudentHeader.TestField("Renewal Invoice No.");
                            if StudentHeader."Document Type" = StudentHeader."document type"::Defferment then
                                StudentHeader.TestField("Application Invoice");

                            Examination.ApplyPaymentEntry(StudentHeader);
                            Commit;
                            CurrPage.Close;

                        end;
                        ReceiptsHeader.Reset;
                        ReceiptsHeader.SetRange("Payment Reference No.", Rec."Reference No.");
                        if ReceiptsHeader.FindFirst then begin
                            Examination.ApplyMiscPaymentEntry(ReceiptsHeader);
                            CurrPage.Close;
                        end
                    end else
                        Error(TXT001);
                end;
            }
        }
    }

    var
        EQUITYIMPORT: XmlPort "EQUITY IMPORT";
        KCBBANKIMPORT: XmlPort "KCB BANK IMPORT";
        COOPBANKIMPORT: XmlPort "CO-OP BANK IMPORT";
        NATIONALBANKIMPORT: XmlPort "NATIONAL BANK IMPORT";
}

#pragma implicitwith restore

