#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85099 "Processed Student Booking"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
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
                field("Highest Academic QCode"; Rec."Highest Academic QCode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ID';
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                }
                field("Examination Center Code"; Rec."Examination Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Project Code"; Rec."Examination Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Project Name"; Rec."Examination Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field("Training Institution Code"; Rec."Training Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = Basic;
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
                field("Booking Amount"; Rec."Booking Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Booking Receipt No."; Rec."Booking Receipt No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Booking Invoice No."; Rec."Booking Invoice No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control37; "Exam Booking Lines")
            {
                SubPageLink = "Booking Header No." = field("No."),
                              "Course Id" = field("Examination ID");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control45; "Applicant Picture")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                SubPageLink = "No." = field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Remarks)
            {
                ApplicationArea = Basic;
                Image = ResetStatus;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page Remarks;
                RunPageLink = "Student No." = field("Student No.");
            }
            action("Cancel Booking")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Cancel booking for the student?';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.CancelBookingEntries(Rec);
                    end
                end;
            }
            action("Update Booking")
            {
                ApplicationArea = Basic;
                Image = UpdateShipment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Update Student Sitting";
                RunPageLink = "No." = field("No.");

                trigger OnAction()
                var
                    TXT001: label 'Cancel booking for the student?';
                begin
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

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85009, true, false, Rec);
                end;
            }
            action("Preview Student Timetable")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85026, true, false, Rec);
                end;
            }
            action("Send Timetable")
            {
                ApplicationArea = Basic;
                Image = SendAsPDF;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Examination.BookingSendReceipt(Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Booking;
    end;

    var
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

