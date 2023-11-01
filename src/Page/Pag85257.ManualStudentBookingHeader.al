#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85257 "Manual Student Booking Header"
{
    DeleteAllowed = false;
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student No. field.';
                }
                field("Student Reg. No."; Rec."Student Reg. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Reg. No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("Additional Exemption"; Rec."Additional Exemption")
                {
                    ApplicationArea = Basic;
                    Caption = 'Additional Papers';
                    ToolTip = 'Specifies the value of the Additional Papers field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance (LCY) field.';
                }
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ID Number/Passport No./Birth Certificate field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("Highest Academic QCode"; Rec."Highest Academic QCode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Highest Academic QCode field.';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Qualification field.';
                }
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ID';
                    ToolTip = 'Specifies the value of the Examination ID field.';
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Examination Center Code"; Rec."Examination Center Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination Centre Code';
                    ToolTip = 'Specifies the value of the Examination Centre Code field.';
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination Centre';
                    ToolTip = 'Specifies the value of the Examination Centre field.';
                }
                field("Examination Project Code"; Rec."Examination Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Project Code field.';
                }
                field("Examination Project Name"; Rec."Examination Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Project Name field.';
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Sitting field.';
                }
                field("Training Institution Code"; Rec."Training Institution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Institution Code field.';
                }
                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Institution field.';
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Reference No. field.';
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fee Type field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                group("Institution Sponsored Only")
                {
                    Caption = 'Institution Sponsored Only';
                    field("Institution Code"; Rec."Institution Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Institution Code field.';
                    }
                    field("Institution Name"; Rec."Institution Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Institution Name field.';
                    }
                    field("Institution Reference No."; Rec."Institution Reference No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Institution Reference No. field.';
                    }
                }
                field("Booking Amount"; Rec."Booking Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Booking Amount field.';
                }
                field("Booking Receipt No."; Rec."Booking Receipt No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Booking Receipt No. field.';
                }
                field("Booking Invoice No."; Rec."Booking Invoice No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Booking Invoice No. field.';
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
            action("Process Invoice")
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Process Invoice action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to process an invoice for this booking?';
                    TXT002: label 'Kindly input the papers';
                begin
                    if Confirm(TXT001) = true then begin
                        Rec.TestField("Examination Center Code");
                        Rec.CalcFields("Booking Amount");
                        if Rec."Booking Amount" > 0 then begin
                            Examination.BookingCreateInvoice(Rec);
                        end else
                            Error(TXT002);
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
                Visible = false;
                ToolTip = 'Executes the Process Receipt action.';
                trigger OnAction()
                var
                    TXT001: label 'Proceed with processing a receipt for the booking?';
                    TXT002: label 'This function is not allowed for institution applications,kindly use  "Apply Institution Payment"';
                begin
                    if Rec."Institution Code" = '' then begin
                        if Confirm(TXT001) = true then begin
                            Examination.BookingCReceipt(Rec);
                        end
                    end else
                        Error(TXT002);
                end;
            }
            action("Check Availability")
            {
                ApplicationArea = Basic;
                Image = CheckDuplicates;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Check Availability action.';
                trigger OnAction()
                var
                    TXT001: label 'The center %1,is fully booked';
                    TXT002: label 'The center%1  is available';
                begin
                    if Examination.CheckSlotAvailabilityV1(Rec) = true
                      then begin
                        Message(TXT002, Rec."Examination Center");
                    end else
                        Error(TXT001, Rec."Examination Center");
                end;
            }
            action("Post Voucher")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post Voucher action.';
                trigger OnAction()
                var
                    TXT001: label 'Do you want to post the voucher?';
                    TXT002: label 'The center %1,is fully booked';
                    TXT003: label 'This function is not allowed for institution applications,kindly use  "Apply Institution Payment"';
                    SalesInvoice: Record "Sales Invoice Header";
                    TXT004: label 'A posted  invoice needs to exist before posting this application';
                begin

                    if Confirm(TXT001) = true then begin
                        Rec.TestField(Posted, false);
                        Rec.TestField("Examination Center Code");

                        if Examination.CheckSlotAvailabilityV1(Rec) = true then begin

                            Examination.PostCenterBookingAllocation(Rec);
                            Examination.PostExaminationVoucher(Rec);


                        end else
                            Message(TXT002, Rec."Examination Center");
                    end;
                end;
            }
            action("Suggest Papers")
            {
                ApplicationArea = Basic;
                Image = SuggestSalesPrice;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Papers action.';
                trigger OnAction()
                var
                    TXT001: label 'Suggest Papers for the student %1';
                begin
                    if Confirm(TXT001, true, Rec."Student Name") = true then begin
                        Rec.TestField("Fee Type");
                        // Rec.TestField(Image);
                        //Examination.StudentSittingPapers(Rec);
                        Examination.StudentSuggestFunction(Rec);
                    end
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
                Visible = false;
                ToolTip = 'Executes the Pay Now action.';
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
                Visible = false;
                ToolTip = 'Executes the MPESA Payment Details action.';
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
                ToolTip = 'Executes the Bank Payment Details action.';
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
                Visible = false;
                ToolTip = 'Executes the Apply Student Balance action.';
                trigger OnAction()
                var
                    TXT001: label 'Apply the value %1 to %2';
                begin
                    Rec.TestField("Student No.");
                end;
            }
            action("Run Exemption Batch")
            {
                ApplicationArea = Basic;
                Image = PutawayLines;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Run Exemption Batch action.';
                trigger OnAction()
                var
                    TXT001: label 'Do you want to run the exemption batch Job?';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.RunAutoExempt(Rec);
                    end
                end;
            }
            action(Remarks)
            {
                ApplicationArea = Basic;
                Image = ResetStatus;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page Remarks;
                RunPageLink = "Student No." = field("Student No.");
                ToolTip = 'Executes the Remarks action.';
            }
            group("Institution Payment")
            {
                Visible = false;
                action("Apply Institution Payment ")
                {
                    ApplicationArea = Basic;
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Apply Institution Payment  action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Post payment for %1 to the institution %2';
                    begin
                        Rec.TestField("Institution Reference No.");
                        Rec.TestField("Institution Code");
                        if Confirm(TXT001, true, Rec."ID Number/Passport No.", Rec."Institution Name") = true then begin
                            Examination.ApplyInstitutionPayment(Rec)
                        end
                    end;
                }
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
                    ToolTip = 'Executes the Bank Import Entries action.';
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
                ToolTip = 'Executes the Print action.';
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
                ToolTip = 'Executes the Preview Student Timetable action.';
                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85026, true, false, Rec);
                end;
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Executes the Attach Documents action.';
                trigger OnAction()
                begin
                    DMSManagement.FnUploadStudentDocuments(Rec."No.", 'Student Booking', Rec.RecordId);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Booking;
        Rec.Submitted := true;
        Rec."Manual Input" := true;
    end;

    var
        Examination: Codeunit Examination;
        // Payment: Codeunit UnknownCodeunit50104;
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

