#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85197 "Remarking Voucher"
{
    Caption = 'Remarking Voucher';
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
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ID';
                    Editable = false;
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                    Editable = false;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Center Code"; Rec."Examination Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Remark Amount"; Rec."Remark Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Remark Receipt No."; Rec."Remark Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field("Remark Invoice No."; Rec."Remark Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Evidence"; Rec."Payment Evidence")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control9; "Remarking Lines")
            {
                SubPageLink = "Booking Header No." = field("No."),
                              "Document Type" = field("Document Type"),
                              "Course Id" = field("Examination ID");
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
                    TXT001: label 'Are you sure you want to process an invoice for this remarking?';
                    TXT002: label 'Kindly input the line details';
                    TXT003: label 'This is only allowed for self-sponsored students';
                begin
                    Rec.TestField("Examination Sitting");
                    if Confirm(TXT001) = true then begin
                        Rec.CalcFields("Remark Amount");

                        if Rec."Remark Amount" > 0 then begin
                            Examination.RemarkCreateInvoice(Rec);
                        end else
                            Error(TXT002);
                    end
                end;
            }
            action("Reject Request")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Reject the Request for Remarking';
                begin
                    Rec.TestField("Reason for Rejection");
                    if Confirm(TXT001) = true then begin
                        Examination.RemarkingSendRegretEmail(Rec);
                    end
                end;
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
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Remarking;
    end;

    var
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

