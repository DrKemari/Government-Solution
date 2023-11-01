#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85036 "Student Booking Header"
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
                }
                field("Additional Exemption"; Rec."Additional Exemption")
                {
                    ApplicationArea = Basic;
                    Caption = 'Additional Papers';
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
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = Basic;
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
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
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
                    Caption = 'Examination Centre Code';
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination Centre';
                }
                field("Examination Project Code"; Rec."Examination Project Code")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Examination Projects";
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
            action("Process Invoice")
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to process an invoice for this booking?';
                    TXT002: label 'Kindly input the papers';
                    TXT003: label 'This is only allowed for self-sponsored students';
                begin
                    Rec.TestField("Examination Sitting");
                    Rec.TestField("Fee Type");
                    if Confirm(TXT001) = true then begin
                        if Rec."Institution Code" <> '' then
                            Error(TXT003);
                        Rec.TestField("Examination Center Code");
                        Rec.CalcFields("Booking Amount");
                        //checker to ensure you do not select more than 2 optional papers
                        Examination.BookingCheckAdvancedPapers(Rec);
                        //confirm papers
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
            action("Send Student Invoice")
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Booking Invoice No.");
                    Commit;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85099, true, false, Rec);
                end;
            }
            action("Test Exemp")
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var

                    amt: Codeunit StudentmanagementTest;
                begin
                    amt.FnInsertExemptionSections('BK00048');
                end;
            }
            action("Check Availability")
            {
                ApplicationArea = Basic;
                Image = CheckDuplicates;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'The center %1,is fully booked';
                    TXT002: label 'The center %1  is available';
                begin
                    Rec.TestField("Examination Center Code");
                    if Examination.CheckSlotAvailability(Rec) = true
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

                trigger OnAction()
                var
                    TXT001: label 'Do you want to post the voucher?';
                    TXT002: label 'The center %1,is fully booked';
                    TXT003: label 'This function is not allowed for institution applications,kindly use  "Apply Institution Payment"';
                    SalesInvoice: Record "Sales Invoice Header";
                    TXT004: label 'A posted  invoice needs to exist before posting this application';
                    TXT005: label 'Kindly clear the negative balance on the student %1,before proceeding';
                begin
                    if Rec."Institution Code" = '' then begin
                        if Confirm(TXT001) = true then begin
                            Rec.TestField(Posted, false);
                            Rec.TestField("Booking Invoice No.");
                            Rec.TestField("Examination Center Code");
                            Rec.CalcFields(Balance);
                            if Rec.Balance < 0 then
                                Error(TXT005, Rec."Student No.");
                            if Examination.CheckSlotAvailabilityV1(Rec) = true then begin
                                //check invoice is posted
                                SalesInvoice.Reset;
                                SalesInvoice.SetRange("External Document No.", Rec."No.");
                                if SalesInvoice.FindFirst then begin
                                    Examination.PostCenterBookingAllocation(Rec);
                                    Examination.PostExaminationVoucher(Rec);
                                    Commit;
                                    Examination.BookingSendReceipt(Rec);
                                end else
                                    Error(TXT004);
                            end else
                                Message(TXT002, Rec."Examination Center");
                        end
                    end else
                        Error(TXT003);
                end;
            }
            action("Suggest Papers")
            {
                ApplicationArea = Basic;
                Image = SuggestSalesPrice;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Suggest Papers for the student %1';
                begin
                    ExaminationSetup.Get;
                    if Confirm(TXT001, true, Rec."Student Name") = true then begin
                        Rec.TestField("Fee Type");
                        if ExaminationSetup."Allow Booking With No Photo" = false then
                            Rec.TestField(Image);
                        Examination.StudentSuggestFunction(Rec);
                        //Examination.StudentSittingPapers(Rec); old function
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
            action("Run Exemption Batch")
            {
                ApplicationArea = Basic;
                Image = PutawayLines;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    TXT001: label 'Do you want to run the exemption batch Job?';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.RunAutoExempt(Rec);
                    end
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
                        TXT002: label 'An invoice for this booking is already processed';
                    begin
                        Rec.TestField("Institution Reference No.");
                        Rec.TestField("Institution Code");
                        if Confirm(TXT001, true, Rec."ID Number/Passport No.", Rec."Institution Name") = true then begin
                            if Rec."Booking Invoice No." = '' then begin
                                Examination.ApplyInstitutionPayment(Rec)
                            end
                            else
                                Error(TXT002);
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
                }
            }
        }
        area(reporting)
        {
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    DMSManagement.FnUploadStudentDocuments(Rec."No.", 'Student Booking', Rec.RecordId);
                end;
            }
        }
        area(navigation)
        {
            action(Remarks)
            {
                ApplicationArea = Basic;
                Image = ResetStatus;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page Remarks;
                RunPageLink = "Student No." = field("Student No.");
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
                            Examination.BookingRemoveInvoice(Rec);
                        end else
                            Error(TXT002);

                    end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                //The property 'PromotedOnly' can only be set if the property 'Promoted' is set to 'true'
                //PromotedOnly = true;

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
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(85026, true, false, Rec);
                end;
            }
            action("Mark as Manual")
            {
                ApplicationArea = Basic;
                Image = ManualExchangeRate;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    UserSetup.Get(UserId);
                    if UserSetup."Revenue Admin" = false then
                        Error('You do not have sufficient rights to Create manual Bookings!Please contact system administrator.');
                    Rec."Manual Input" := true;
                    Rec.Modify(true);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ExaminationSetup.Get;
        ExamSittingCycle.Reset;
        ExamSittingCycle.SetRange("Exam Sitting Cycle", ExaminationSetup."Default Examination Sitting");
        ExamSittingCycle.SetRange("Sitting Status", ExamSittingCycle."sitting status"::Active);
        if ExamSittingCycle.FindFirst then begin
            Rec."Examination Sitting" := ExamSittingCycle."Exam Sitting Cycle";
            Rec.Validate("Examination Sitting");
            Rec."Examination Project Code" := ExamSittingCycle."Examination Project ID";
            Rec.Validate("Examination Project Code");
            Rec.Modify(true)
        end
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Booking;
        Rec.Submitted := true;
    end;

    var
        Examination: Codeunit Examination;
        // Payment: Codeunit UnknownCodeunit50104;
        DMSManagement: Codeunit "DMS Management";
        ExaminationSetup: Record "Examination Setup";
        ExamSittingCycle: Record "Exam Sitting Cycle";
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

